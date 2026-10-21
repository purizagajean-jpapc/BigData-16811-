USE MaquipesaEIRL;
GO

-- PROCEDIMIENTOS ALMACENADOS (SP)
-- Control de Flujo, Transacciones y Bloques TRY CATCH

-- 1. SP para registrar un pago y actualizar compras (Transaccional)
CREATE OR ALTER PROCEDURE sp_RegistrarPagoCliente
    @IdCliente INT,
    @MontoPEN DECIMAL(10,2),
    @MetodoPago VARCHAR(20),
    @NumeroOperacion VARCHAR(40)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- a) Validar que el monto sea positivo (Lógica de Negocio)
        IF @MontoPEN <= 0
        BEGIN
            THROW 50001, 'El monto del pago debe ser mayor a cero.', 1;
        END

        -- b) Validar que el cliente exista
        IF NOT EXISTS (SELECT 1 FROM Cliente WHERE IdCliente = @IdCliente)
        BEGIN
            THROW 50002, 'El cliente especificado no existe.', 1;
        END

        -- c) Insertar el pago
        INSERT INTO PagoCliente (FechaPago, MontoPEN, MetodoPago, NumeroOperacion, IdCliente)
        VALUES (GETDATE(), @MontoPEN, @MetodoPago, @NumeroOperacion, @IdCliente);

        -- d) Actualizar el contador de compras totales del cliente
        UPDATE Cliente
        SET ComprasTotales = ISNULL(ComprasTotales, 0) + 1
        WHERE IdCliente = @IdCliente;

        COMMIT TRANSACTION;
        PRINT 'Pago de cliente registrado correctamente (COMMIT).';
    END TRY
    BEGIN CATCH
        -- Si ocurre un error, deshacemos todo para mantener consistencia
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Reportar el error usando variables del sistema
        PRINT '*** Error detectado en sp_RegistrarPagoCliente ***';
        PRINT 'Nro Error: ' + CAST(ERROR_NUMBER() AS VARCHAR);
        PRINT 'Línea: ' + CAST(ERROR_LINE() AS VARCHAR);
        PRINT 'Mensaje: ' + ERROR_MESSAGE();
        
        -- Relanzar error para que la aplicación (o cliente) lo sepa
        THROW;
    END CATCH
END;
GO

-- 2. SP para cambiar estado de equipo y crear registro de Mantenimiento
CREATE OR ALTER PROCEDURE sp_IniciarMantenimiento
    @IdEquipo INT,
    @TipoMantenimiento VARCHAR(20),
    @Descripcion VARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;
        
        IF NOT EXISTS(SELECT 1 FROM Equipos WHERE IdEquipo = @IdEquipo)
            THROW 50003, 'Equipo no encontrado.', 1;

        -- Actualizamos el estado del equipo
        UPDATE Equipos SET Estado = 'Mantenimiento' WHERE IdEquipo = @IdEquipo;

        -- Registramos el inicio
        INSERT INTO Mantenimientos (IdEquipo, FechaInicio, Tipo, Descripcion)
        VALUES (@IdEquipo, GETDATE(), @TipoMantenimiento, @Descripcion);
        
        COMMIT TRANSACTION;
        PRINT 'Mantenimiento iniciado correctamente (COMMIT).';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
            
        PRINT 'Error: ' + ERROR_MESSAGE();
        THROW;
    END CATCH
END;
GO
