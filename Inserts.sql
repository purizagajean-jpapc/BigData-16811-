USE MaquipesaEIRL;
GO

-- INSERTS DE DATOS - EMPRESA MAQUIPESA (CAJAMARCA / TRUJILLO)
-- Fechas restringidas: Febrero - Julio 2026
-- 1. Sede
INSERT INTO Sede (NombreSede, Direccion, Ciudad, Pais, Telefono, Estado) VALUES
('Sede Principal',   'Av. Las Orquideas 1250',        'Cajamarca', 'Peru', '976980809', 1)

SELECT* FROM Sede

-- 2. Persona (Cajamarca y Trujillo)
INSERT INTO Persona (Documento, NombreLegal, ApellidoPaterno, ApellidoMaterno, Pais, Ciudad, FechaDeNacimiento, Direccion, IdSede) VALUES
('72345678', 'Carlos',   'Ramirez',   'Torres',   'Peru', 'Cajamarca', '1990-03-15', 'Av. Atahualpa 101',      1),
('73456789', 'Manuel',   'Lopez',     'Huanca',   'Peru', 'Cajamarca', '1985-06-22', 'Jr. Del Comercio 202',   1),
('74567890', 'Luis',     'Garcia',    'Flores',   'Peru', 'Cajamarca', '1992-04-10', 'Calle Amazonas 303',     1),
('75678901', 'Andres',   'Mendoza',   'Quispe',   'Peru', 'Cajamarca', '1988-07-05', 'Av. Los Heroes 404',     1),
('76789012', 'Jorge',    'Vargas',    'Paredes',  'Peru', 'Cajamarca', '1995-02-28', 'Jr. San Martin 505',     1),
('77890123', 'Rodrigo',  'Castillo',  'Diaz',     'Peru', 'Cajamarca', '1993-05-17', 'Av. Peru 606',           1),
('78901234', 'Miguel',   'Huaman',    'Llanos',   'Peru', 'Cajamarca', '1987-03-03', 'Calle Dos de Mayo 707',  1),
('79012345', 'Fernando', 'Rios',      'Vega',     'Peru', 'Cajamarca', '1991-07-19', 'Jr. Apurimac 808',       1),
('80123456', 'Pedro',    'Tello',     'Cruz',     'Peru', 'Cajamarca', '1984-02-14', 'Av. Hoyos Rubio 909',    1),
('81234567', 'Diego',    'Chaves',    'Soto',     'Peru', 'Cajamarca', '1996-06-30', 'Jr. Belen 110',          1),
('82345678', 'Roberto',  'Medina',    'Salazar',  'Peru', 'Trujillo',  '1983-04-12', 'Av. España 450',          1),
('83456789', 'Patricia', 'Reyes',     'Olivos',   'Peru', 'Trujillo',  '1990-07-08', 'Jr. Gamarra 320',         1);
GO



-- 3. PersonaTelefono
INSERT INTO PersonaTelefono (IdPersona, NumeroTelefono) VALUES
(1,  '976123456'),
(2,  '975234567'),
(3,  '974345678'),
(4,  '973456789'),
(5,  '972567890'),
(6,  '971678901'),
(7,  '970789012'),
(8,  '969890123'),
(9,  '968901234'),
(10, '967012345'),
(11, '966123456'),
(12, '965234567');
GO

-- 4. PersonaCorreo
INSERT INTO PersonaCorreo (IdPersona, Correo) VALUES
(1,  'carlos.ramirez@maquipesa.com'),
(2,  'manuel.lopez@maquipesa.com'),
(3,  'luis.garcia@maquipesa.com'),
(4,  'andres.mendoza@maquipesa.com'),
(5,  'jorge.vargas@maquipesa.com'),
(6,  'rodrigo.castillo@maquipesa.com'),
(7,  'miguel.huaman@maquipesa.com'),
(8,  'fernando.rios@maquipesa.pe'),
(9,  'pedro.tello@maquipesa.com'),
(10, 'diego.chaves@maquipesa.com'),
(11, 'roberto.medina@gmail.com'),
(12, 'patricia.reyes@gmail.com');
GO

-- 5. Empleado (IdPersona 1 al 10)
INSERT INTO Empleado (Cargo, IdPersona) VALUES
('Gerente General',      1),
('Jefe de Produccion',   2),
('Operario',             3),
('Operario',             4),
('Tecnico Mecanico',     5),
('Administrador',        6),
('Vendedor',             7),
('Almacenero',           8),
('Supervisor',           9),
('Contador',             10);
GO

-- 6. HorarioTrabajo
INSERT INTO HorarioTrabajo (HoraInicio, HoraInicioReceso, HoraFinReceso, HoraFin, DiaSemana) VALUES
('08:00', '12:00', '13:00', '17:00', 'lunes'),
('08:00', '12:00', '13:00', '17:00', 'martes'),
('08:00', '12:00', '13:00', '17:00', 'miercoles'),
('08:00', '12:00', '13:00', '17:00', 'jueves'),
('08:00', '12:00', '13:00', '17:00', 'viernes'),
('08:00', '12:00', '13:00', '13:00', 'sabado');
GO

-- 7. EmpleadoHorario
INSERT INTO EmpleadoHorario (IdEmpleado, IdHorario) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 1), (7, 2), (8, 3), (9, 4), (10, 5);
GO

-- 8. HorasExtras (fechas: febrero - julio)
INSERT INTO HorasExtras (IdEmpleado, FechaExtra, CantidadDeHoras) VALUES
(1,  '2026-02-05', 2.0),
(2,  '2026-02-20', 3.5),
(3,  '2026-03-10', 1.5),
(4,  '2026-03-25', 4.0),
(5,  '2026-04-08', 2.5),
(6,  '2026-04-22', 3.0),
(7,  '2026-05-15', 2.0),
(8,  '2026-06-03', 1.0),
(9,  '2026-06-18', 4.0),
(10, '2026-07-10', 3.0);
GO

-- 9. ContratoEmpleado
INSERT INTO ContratoEmpleado (FechaContrato, FechaInicio, FechaFin, IdEmpleado) VALUES
('2026-02-01', '2026-02-03', NULL,         1),
('2026-02-01', '2026-02-03', NULL,         2),
('2026-03-01', '2026-03-03', NULL,         3),
('2026-03-01', '2026-03-03', NULL,         4),
('2026-04-01', '2026-04-02', '2026-07-31', 5),
('2026-04-01', '2026-04-02', NULL,         6),
('2026-05-01', '2026-05-02', NULL,         7),
('2026-05-01', '2026-05-02', NULL,         8),
('2026-06-01', '2026-06-02', NULL,         9),
('2026-07-01', '2026-07-02', NULL,         10);
GO

-- 10. PagoEmpleado
INSERT INTO PagoEmpleado (FechaPago, MontoPEN, MetodoPago, NumeroOperacion, IdEmpleado) VALUES
('2026-02-28 12:00:00', 5000.00, 'Transferencia', 'NOM-001-FEB', 1),
('2026-02-28 12:00:00', 3500.00, 'Transferencia', 'NOM-002-FEB', 2),
('2026-03-31 12:00:00', 2200.00, 'Transferencia', 'NOM-003-MAR', 3),
('2026-03-31 12:00:00', 2200.00, 'Transferencia', 'NOM-004-MAR', 4),
('2026-04-30 12:00:00', 2800.00, 'Transferencia', 'NOM-005-ABR', 5),
('2026-04-30 12:00:00', 3200.00, 'Transferencia', 'NOM-006-ABR', 6),
('2026-05-31 12:00:00', 2500.00, 'Yape',          'NOM-007-MAY', 7),
('2026-06-30 12:00:00', 2000.00, 'Transferencia', 'NOM-008-JUN', 8),
('2026-06-30 12:00:00', 3800.00, 'Transferencia', 'NOM-009-JUN', 9),
('2026-07-31 12:00:00', 4500.00, 'Transferencia', 'NOM-010-JUL', 10);
GO

SELECT * 
FROM PagoEmpleado

-- 11. Equipos
INSERT INTO Equipos (Nombre, Marca, Modelo, AnioAdquisicion, Estado, IdSede) VALUES
('Prensa Hidraulica 1',  'Hidra',     'PH-200',  2020, 'Operativo',     1),
('Soldadora MIG',        'Lincoln',   'MIG-350', 2021, 'Operativo',     1),
('Torno CNC',            'Mazak',     'QT-200',  2019, 'Mantenimiento', 1),
('Compresor Industrial', 'Atlas',     'GA-37',   2022, 'Operativo',     1),
('Cortadora Laser',      'Trumpf',    'TL-3000', 2023, 'Operativo',     1),
('Grua Puente',          'Demag',     'GP-10T',  2018, 'Mantenimiento', 1),
('Taladro Radial',       'Knuth',     'TR-50',   2021, 'Operativo',     1),
('Fresadora',            'Bridgeport','FU-1',    2020, 'Malogrado',     1),
('Rectificadora',        'Jones',     'RC-300',  2022, 'Operativo',     1),
('Dobladora CNC',        'Amada',     'DC-150',  2023, 'Operativo',     1);
GO

Select * from Equipos

-- 12. Mantenimientos
INSERT INTO Mantenimientos (IdEquipo, FechaInicio, FechaFin, Tipo, Descripcion, Costo) VALUES
(41,  '2026-02-03', '2026-02-10', 'Preventivo', 'Revision de sistema CNC',           1500.00),
(44,  '2026-02-17', '2026-03-01', 'Correctivo', 'Cambio de cable de acero',          3200.00),
(50,  '2026-03-05', '2026-03-20', 'Correctivo', 'Reparacion de cabezal fresador',    2800.00),
(49,  '2026-04-01', '2026-04-05', 'Preventivo', 'Cambio de aceite hidraulico',        600.00),
(52,  '2026-04-15', NULL,         'Preventivo', 'Calibracion de parametros MIG',      450.00),
(29,  '2026-05-02', '2026-05-04', 'Preventivo', 'Limpieza de lentes laser',           300.00),
(33,  '2026-05-20', '2026-05-22', 'Correctivo', 'Cambio de broca y mandril',          750.00),
(36, '2026-06-10', '2026-06-12', 'Preventivo', 'Ajuste de muela abrasiva',           400.00),
(35, '2026-07-01', '2026-07-03', 'Preventivo', 'Lubricacion de ejes CNC',            500.00),
(32,  '2026-07-15', NULL,         'Correctivo', 'Revision de valvulas compresor',    1200.00);
GO

-- 13. Producto
INSERT INTO Producto (Nombre) VALUES
('Plancha Acero'),
('Plancha Aluminio'),
('Plancha Cobre'),
('Tubo Circular'),
('Tubo Cuadrada');
GO

-- 14. Plancha
INSERT INTO Plancha (IdProducto, Alto, Ancho, Grosor, Tipo, Stock) VALUES
(1, 2.40, 1.20, 0.12, 'Acero',    500),
(2, 2.40, 1.20, 0.10, 'Aluminio', 300),
(3, 2.40, 1.20, 0.08, 'Cobre',    150);
GO

-- 15. Tubo
INSERT INTO Tubo (IdProducto, Alto, Grosor, Tipo, Stock) VALUES
(4, 6.00, 0.30, 'Circular', 400),
(5, 6.00, 0.40, 'Cuadrada', 250);
GO

-- 16. Almacen
INSERT INTO Almacen (Nombre, Ubicacion, Capacidad, IdSede) VALUES
('Almacen Central A1',  'Zona Industrial Km 4', 2000, 1),
('Almacen Secundario',  'Jr. Eucaliptos 350',   1000, 1),
('Almacen Chota',       'Av. San Martin 900',   800,  1),
('Almacen Jaen',        'Calle Mesones 570',    600,  1),
('Almacen Celendin',    'Jr. Union 730',        500,  1);
GO
SELECT * FROM ALMACEN

-- 17. InventarioProducto
INSERT INTO InventarioProducto (StockActual, StockMinimo, IdAlmacen, IdProducto) VALUES
(300, 50, 4, 1),
(200, 40, 4, 2),
(100, 20, 6, 3),
(250, 50, 7, 4),
(150, 30, 5, 5),
(100, 20, 8, 1),
(50,  10, 6, 2);
GO

-- 18. Proveedor
INSERT INTO Proveedor (RazonSocial, NombreComercial, IdentificacionFiscal, TipoProveedor) VALUES
('Aceros del Norte S.A.C.',        'AceroNorte',     '20123456781', 'Materiales'),
('Tubos y Perfiles S.R.L.',        'TuboPerfil',     '20234567892', 'Materiales'),
('Repuestos Industriales E.I.R.L.', 'RepuInd',       '20345678903', 'Repuestos'),
('Lubricantes Andinos S.A.',       'LubriAndes',     '20456789014', 'Insumos'),
('Ferreteria Cajamarca S.A.C.',    'FerroCajamarca', '20567890125', 'Herramientas');
GO

-- 19. ContactoProveedor
INSERT INTO ContactoProveedor (IdProveedor, SedeProveedor, TelefonoProveedor, CorreoProveedor) VALUES
(1, 'Cajamarca', '076-551122', 'ventas@aceronorte.pe'),
(2, 'Cajamarca', '076-552233', 'contacto@tuboperfil.pe'),
(3, 'Cajamarca', '076-553344', 'info@repuind.pe'),
(4, 'Cajamarca', '076-554455', 'ventas@lubriandescom.pe'),
(5, 'Cajamarca', '076-555566', 'pedidos@ferrocajamarca.pe');
GO

-- 20. ContratoProveedor
INSERT INTO ContratoProveedor (NombreContrato, FechaContrato, IdProveedor) VALUES
('Contrato Suministro Acero 2026',     '2026-02-01', 1),
('Contrato Suministro Tubos 2026',     '2026-03-15', 2),
('Contrato Repuestos Maquinaria 2026', '2026-04-10', 3),
('Contrato Lubricantes Anual 2026',    '2026-05-20', 4),
('Contrato Herramientas 2026',         '2026-07-08', 5);
GO

-- 21. PagoProveedor
INSERT INTO PagoProveedor (FechaPago, MontoPEN, MetodoPago, NumeroOperacion, IdProveedor) VALUES
('2026-02-10 10:00:00', 15000.00, 'Transferencia', 'TRF-001-2026', 1),
('2026-03-05 09:30:00',  8500.00, 'Transferencia', 'TRF-002-2026', 2),
('2026-04-12 14:00:00',  4200.00, 'Efectivo',      'EFE-003-2026', 3),
('2026-05-22 11:00:00',  3100.00, 'Yape',          'YAP-004-2026', 4),
('2026-06-18 16:30:00',  6700.00, 'Transferencia', 'TRF-005-2026', 5),
('2026-07-20 10:00:00', 11000.00, 'Tarjeta',       'TAR-006-2026', 1);
GO

-- 22. Gasto
INSERT INTO Gasto (FechaGasto, MontoPENGasto, MetodoGasto, NumeroOperacion) VALUES
('2026-02-15', 1200.00, 'Efectivo',      'GST-001'),
('2026-03-08', 3400.00, 'Transferencia', 'GST-002'),
('2026-04-02',  850.00, 'Tarjeta',       'GST-003'),
('2026-04-25', 2100.00, 'Transferencia', 'GST-004'),
('2026-05-11', 1750.00, 'Yape',          'GST-005'),
('2026-06-07',  600.00, 'Efectivo',      'GST-006'),
('2026-07-14', 4300.00, 'Transferencia', 'GST-007');
GO

-- 23. Cliente (Cajamarca: 1..4 | Trujillo: 11..12)
INSERT INTO Cliente (IdPersona, RazonSocial, ComprasTotales, FechaRegistro) VALUES
(1,  'Constructora Cajamarca S.A.C.',     12, '2026-02-10'),
(2,  'Metalurgica Andina E.I.R.L.',        8, '2026-03-05'),
(3,  'Industrias Cajamarca S.R.L.',         5, '2026-04-18'),
(4,  'Servicios Generales M&A',             3, '2026-05-22'),
(11, 'Constructora Trujillo S.A.C.',       7, '2026-03-20'),
(12, 'Distribuidora La Libertad E.I.R.L.', 4, '2026-06-10');
GO

-- 24. PagoCliente
INSERT INTO PagoCliente (FechaPago, MontoPEN, MetodoPago, NumeroOperacion, IdCliente) VALUES
('2026-02-20 10:00:00', 25000.00, 'Transferencia', 'CLI-001-2026', 1),
('2026-03-15 09:00:00', 12000.00, 'Tarjeta',       'CLI-002-2026', 2),
('2026-04-22 15:00:00',  8500.00, 'Transferencia', 'CLI-003-2026', 3),
('2026-05-30 11:30:00',  4300.00, 'Yape',          'CLI-004-2026', 4),
('2026-04-05 10:00:00', 18000.00, 'Transferencia', 'CLI-005-2026', 5),
('2026-07-12 14:00:00',  9500.00, 'Transferencia', 'CLI-006-2026', 6);
GO

-- 25. ContratoCliente
INSERT INTO ContratoCliente (IdCliente, NombreContrato, FechaContrato) VALUES
(1, 'Contrato Suministro Planchas Q1',    '2026-02-10'),
(2, 'Contrato Tubos Industriales',        '2026-03-05'),
(3, 'Contrato Mixto Materiales',          '2026-04-18'),
(4, 'Contrato Servicios Especiales',      '2026-05-22'),
(5, 'Contrato Suministro Trujillo 2026',  '2026-03-20'),
(6, 'Contrato Distribucion La Libertad',  '2026-06-10');
GO

-- 26. Carro
INSERT INTO Carro (Placa, Categoria, Modelo, Color, AnioFabricacion, AnioModelo, IdCliente) VALUES
('CAJ-123', 'Pickup',    'Toyota Hilux',   'Blanco', '2021', '2021', 1),
('CAJ-456', 'SUV',       'Hyundai Tucson', 'Negro',  '2020', '2020', 2),
('CAJ-789', 'Camioneta', 'Ford F-150',     'Plata',  '2022', '2022', 3),
('CAJ-012', 'Sedan',     'Kia Rio',        'Rojo',   '2021', '2021', 4),
('TRU-345', 'Furgoneta', 'Mercedes Vito',  'Blanco', '2022', '2022', 5),
('TRU-678', 'Pickup',    'Nissan Navara',  'Azul',   '2023', '2023', 6);
GO

-- 27. Carrosa
INSERT INTO Carrosa (ModeloCarrosa, Altura, Ancho, Largo, Color, Estado, IdCarro) VALUES
('Carrosa Clasica Mod-A',   2.50, 2.20, 6.00, 'Blanco',   'Elaboracion',   1),
('Carrosa Premium Mod-B',   2.60, 2.30, 6.50, 'Dorado',   'Terminado',     2),
('Carrosa Estandar Mod-C',  2.40, 2.10, 5.80, 'Negro',    'Entregado',     3),
('Carrosa Especial Mod-D',  2.70, 2.40, 7.00, 'Plateado', 'Revision',      4),
('Carrosa Lujosa Mod-E',    2.80, 2.50, 7.20, 'Blanco',   'Elaboracion',   5),
('Carrosa Compacta Mod-F',  2.30, 2.00, 5.50, 'Azul',     'Mantenimiento', 6);
GO
