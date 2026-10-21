USE MaquipesaEIRL;
GO

-- VISTAS 
-- Aplicando buenas prácticas y seguridad del nivel lógico

-- 1. Vista de Resumen de Clientes y Pagos Totales (Protegiendo datos sensibles)
CREATE OR ALTER VIEW vw_ResumenPagosClientes
AS
SELECT 
    c.IdCliente,
    c.RazonSocial,
    p.Documento AS RUC_o_DNI,
    c.ComprasTotales,
    ISNULL(SUM(pc.MontoPEN), 0) AS TotalPagadoPEN
FROM Cliente c
INNER JOIN Persona p ON c.IdPersona = p.IdPersona
LEFT JOIN PagoCliente pc ON c.IdCliente = pc.IdCliente
GROUP BY 
    c.IdCliente,
    c.RazonSocial,
    p.Documento,
    c.ComprasTotales;
GO

-- 2. Vista de Equipos en Mantenimiento o Malogrados
CREATE OR ALTER VIEW vw_EquiposEnMantenimiento
AS
SELECT 
    e.IdEquipo,
    e.Nombre AS NombreEquipo,
    e.Marca,
    m.FechaInicio,
    m.Tipo AS TipoMantenimiento,
    m.Costo
FROM Equipos e
INNER JOIN Mantenimientos m ON e.IdEquipo = m.IdEquipo
WHERE m.FechaFin IS NULL OR e.Estado IN ('Mantenimiento', 'Malogrado');
GO

-- 3. Vista de empleados y sus horarios 
CREATE OR ALTER VIEW vw_EmpleadosHorarios
AS
SELECT 
    e.IdEmpleado,
    p.NombreLegal + ' ' + p.ApellidoPaterno AS Empleado,
    e.Cargo,
    h.DiaSemana,
    h.HoraInicio,
    h.HoraFin
FROM Empleado e
INNER JOIN Persona p ON e.IdPersona = p.IdPersona
INNER JOIN EmpleadoHorario eh ON e.IdEmpleado = eh.IdEmpleado
INNER JOIN HorarioTrabajo h ON eh.IdHorario = h.IdHorario;
GO
