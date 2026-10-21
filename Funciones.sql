USE MaquipesaEIRL;
GO
-- FUNCIONES 
-- Escalares y de tabla para encapsular lógica de negocio

-- 1. Función Escalar: Calcular el total de horas extras de un empleado en un mes específico
CREATE OR ALTER FUNCTION fn_TotalHorasExtrasMes
(
    @IdEmpleado INT,
    @Mes INT,
    @Anio INT
)
RETURNS DECIMAL(5,2)
AS
BEGIN
    DECLARE @Total DECIMAL(5,2);

    SELECT @Total = SUM(CantidadDeHoras)
    FROM HorasExtras
    WHERE IdEmpleado = @IdEmpleado
      AND MONTH(FechaExtra) = @Mes
      AND YEAR(FechaExtra) = @Anio;

    IF @Total IS NULL
        SET @Total = 0;

    RETURN @Total;
END;
GO

-- 2. Función de Tabla: Obtener historial de mantenimientos de un equipo específico
CREATE OR ALTER FUNCTION fn_HistorialMantenimientoEquipo
(
    @IdEquipo INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        IdMantenimiento,
        FechaInicio,
        FechaFin,
        Tipo,
        Descripcion,
        Costo
    FROM Mantenimientos
    WHERE IdEquipo = @IdEquipo
);
GO
