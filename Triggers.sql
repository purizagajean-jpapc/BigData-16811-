USE MaquipesaEIRL;
GO

-- TRIGGERS
-- Automatización en respuestas DML (Auditorías y Validaciones)

-- 1. Crear tabla de auditoría para mantenimiento (si no existe)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'AuditoriaMantenimientos')
BEGIN
    CREATE TABLE AuditoriaMantenimientos (
        IdAuditoria INT IDENTITY PRIMARY KEY,
        IdMantenimiento INT,
        CostoAnterior DECIMAL(10,2),
        CostoNuevo DECIMAL(10,2),
        FechaModificacion DATETIME,
        Usuario VARCHAR(50)
    );
END
GO

-- 2. Trigger AFTER UPDATE para auditar cambios en el costo de mantenimientos
CREATE OR ALTER TRIGGER trg_AuditarCostoMantenimiento
ON Mantenimientos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si la columna Costo fue modificada específicamente usando IF UPDATE()
    IF UPDATE(Costo)
    BEGIN
        INSERT INTO AuditoriaMantenimientos (IdMantenimiento, CostoAnterior, CostoNuevo, FechaModificacion, Usuario)
        SELECT 
            i.IdMantenimiento,
            d.Costo AS CostoAnterior,
            i.Costo AS CostoNuevo,
            GETDATE(),
            SYSTEM_USER
        FROM inserted i
        INNER JOIN deleted d ON i.IdMantenimiento = d.IdMantenimiento
        -- Auditar solo si el costo cambió realmente y no es nulo en ambas tablas
        WHERE ISNULL(i.Costo, 0) <> ISNULL(d.Costo, 0); 
    END
END;
GO

-- 3. Trigger preventivo (AFTER INSERT/UPDATE) para limitar Horas Extras diarias
CREATE OR ALTER TRIGGER trg_LimiteHorasExtras
ON HorasExtras
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IdEmpleado INT, @Fecha DATE, @SumaHoras DECIMAL(5,2);

    -- Tomar datos del insertado
    SELECT @IdEmpleado = IdEmpleado, @Fecha = FechaExtra FROM inserted;

    -- Evaluar la suma total de ese día para ese empleado
    SELECT @SumaHoras = SUM(CantidadDeHoras)
    FROM HorasExtras
    WHERE IdEmpleado = @IdEmpleado AND FechaExtra = @Fecha;

    -- Regla de Negocio: Máximo 4 horas extras por día
    IF @SumaHoras > 4.0
    BEGIN
        PRINT 'Violación de regla: No se puede registrar más de 4 horas extras diarias.';
        ROLLBACK TRANSACTION;
    END
END;
GO
