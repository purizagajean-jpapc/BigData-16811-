	USE MaquipesaEIRL
GO

EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all";

DELETE FROM Carrosa; 
DELETE FROM Carro; 
DELETE FROM ContratoCliente; 
DELETE FROM PagoCliente;
DELETE FROM Cliente; 
DELETE FROM Gasto; 
DELETE FROM PagoEmpleado; 
DELETE FROM ContratoEmpleado;
DELETE FROM PagoProveedor; 
DELETE FROM ContratoProveedor; 
DELETE FROM ContactoProveedor;
DELETE FROM Proveedor; 
DELETE FROM InventarioProducto; 
DELETE FROM Almacen; 
DELETE FROM Tubo; 
DELETE FROM Plancha; 
DELETE FROM Producto; 
DELETE FROM Mantenimientos; 
DELETE FROM Equipos; 
DELETE FROM HorasExtras; 
DELETE FROM EmpleadoHorario; 
DELETE FROM HorarioTrabajo; 
DELETE FROM Empleado;
DELETE FROM PersonaCorreo; 
DELETE FROM PersonaTelefono; 
DELETE FROM Persona; 
DELETE FROM Sede;

EXEC sp_MSforeachtable "IF OBJECTPROPERTY(OBJECT_ID('?'), 'TableHasIdentity') = 1 DBCC CHECKIDENT ('?', RESEED, 0)";
EXEC sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all";
GO

INSERT INTO Sede (NombreSede, Direccion, Ciudad, Pais, Telefono, Estado) VALUES
('Sede Principal Trujillo', 'Av. America Sur 1230', 'Trujillo', 'Peru', '044-203040', 1),
('Sede Cajamarca', 'Av. Atahualpa 1250', 'Cajamarca', 'Peru', '076-361234', 1);
GO

INSERT INTO Persona (Documento, NombreLegal, ApellidoPaterno, ApellidoMaterno, Pais, Ciudad, FechaDeNacimiento, Direccion, IdSede) VALUES
('71000001', 'Carlos', 'Ramirez', 'Torres', 'Peru', 'Trujillo', '1990-03-15', 'Urb. El Recreo 101', 1),
('71000002', 'Manuel', 'Lopez', 'Huanca', 'Peru', 'Trujillo', '1985-06-22', 'Av. Larco 202', 1),
('71000003', 'Luis', 'Garcia', 'Flores', 'Peru', 'Trujillo', '1992-04-10', 'Urb. Primavera 303', 1),
('71000004', 'Andres', 'Mendoza', 'Quispe', 'Peru', 'Trujillo', '1988-07-05', 'San Andres 404', 1),
('71000005', 'Jorge', 'Vargas', 'Paredes', 'Peru', 'Trujillo', '1995-02-28', 'Centro Hist. 505', 1),
('71000006', 'Miguel', 'Huaman', 'Llanos', 'Peru', 'Cajamarca', '1987-03-03', 'Dos de Mayo 707', 2),
('71000007', 'Fernando', 'Rios', 'Vega', 'Peru', 'Cajamarca', '1991-07-19', 'Jr. Apurimac 808', 2),
('71000008', 'Pedro', 'Tello', 'Cruz', 'Peru', 'Cajamarca', '1984-02-14', 'Hoyos Rubio 909', 2),
('71000009', 'Diego', 'Chaves', 'Soto', 'Peru', 'Cajamarca', '1996-06-30', 'Jr. Belen 110', 2),
('71000010', 'Raul', 'Pinto', 'Mora', 'Peru', 'Cajamarca', '1990-11-21', 'Av. La Paz 220', 2),
('71000011', 'Ana', 'Rojas', 'Salas', 'Peru', 'Trujillo', '1993-01-12', 'Los Pinos 101', 1),
('71000012', 'Sofia', 'Cueva', 'Leon', 'Peru', 'Cajamarca', '1989-05-20', 'La Victoria 500', 2),
('71000013', 'Bruno', 'Alva', 'Reyes', 'Peru', 'Trujillo', '1994-08-08', 'Av. España 303', 1),
('71000014', 'Carla', 'Gomez', 'Ruiz', 'Peru', 'Cajamarca', '1986-12-15', 'Jr. Lima 900', 2),
('71000015', 'Hugo', 'Silva', 'Castro', 'Peru', 'Trujillo', '1991-03-30', 'Urb. Monserrate 404', 1),
('83000001', 'Constructora Norte', 'S.A.C.', 'Corp', 'Peru', 'Trujillo', '1980-01-01', 'Parque Ind. 1', 1),
('83000002', 'Ingenieria Total', 'S.R.L.', 'Corp', 'Peru', 'Trujillo', '1985-01-01', 'Urb. Golf 12', 1),
('83000003', 'Mineria Cajamarca', 'E.I.R.L.', 'Corp', 'Peru', 'Cajamarca', '1990-01-01', 'Baños del Inca', 2),
('83000004', 'Logisticos Andes', 'S.A.', 'Corp', 'Peru', 'Cajamarca', '1982-01-01', 'Av. Evitamiento', 2),
('83000005', 'Metalurgica Peru', 'S.A.C.', 'Corp', 'Peru', 'Trujillo', '1995-01-01', 'Av. Larco 500', 1),
('83000006', 'Edificaciones Sur', 'E.I.R.L.', 'Corp', 'Peru', 'Trujillo', '1990-05-15', 'Urb. San Isidro', 1),
('83000007', 'Mecanica Avanzada', 'S.R.L.', 'Corp', 'Peru', 'Cajamarca', '1988-11-20', 'Vía Evitamiento Sur', 2),
('83000008', 'Agroindustrial X', 'S.A.C.', 'Corp', 'Peru', 'Trujillo', '1992-03-10', 'Parque Industrial 2', 1),
('83000009', 'Transportes Max', 'S.A.', 'Corp', 'Peru', 'Cajamarca', '1985-07-25', 'Carretera Industrial', 2),
('83000010', 'Acabados Premium', 'E.I.R.L.', 'Corp', 'Peru', 'Trujillo', '1998-02-18', 'Urb. La Noria', 1),
('83000011', 'Proyectos Alpha', 'S.A.C.', 'Corp', 'Peru', 'Cajamarca', '1991-09-09', 'Av. Los Heroes', 2),
('83000012', 'Consorcio Vial', 'S.R.L.', 'Corp', 'Peru', 'Trujillo', '1984-06-30', 'Urb. California', 1),
('83000013', 'Mineria del Sur', 'S.A.', 'Corp', 'Peru', 'Cajamarca', '1987-12-05', 'Av. Industrial 400', 2),
('83000014', 'Ferreteria Gigante', 'E.I.R.L.', 'Corp', 'Peru', 'Trujillo', '1996-04-14', 'Mercado Mayorista', 1),
('83000015', 'Servicios Globales', 'S.A.C.', 'Corp', 'Peru', 'Cajamarca', '1993-10-22', 'Jr. Silva Santisteban', 2);
GO

INSERT INTO Empleado (Cargo, IdPersona) VALUES
('Gerente General', 1), ('Jefe Produccion', 2), ('Operario Master', 3), ('Operario Base', 4), ('Ingeniero Mant.', 5), 
('Administrador', 6), ('Supervisor', 7), ('Almacenero', 8), ('Vendedor', 9), ('Contador', 10),
('Asistente RRHH', 11), ('Tecnico CNC', 12), ('Vendedor Senior', 13), ('Inspector Calidad', 14), ('Soldador 1G', 15);
GO

INSERT INTO Cliente (IdPersona, RazonSocial, ComprasTotales, FechaRegistro) VALUES
(16, 'Constructora Norte S.A.C.', 0, '2026-01-02'), (17, 'Ingenieria Total S.R.L.', 0, '2026-01-15'),
(18, 'Mineria Cajamarca E.I.R.L.', 0, '2026-02-10'), (19, 'Logisticos Andes S.A.', 0, '2026-03-05'),
(20, 'Metalurgica Peru S.A.C.', 0, '2026-04-12'), (21, 'Edificaciones Sur E.I.R.L.', 0, '2026-01-20'),
(22, 'Mecanica Avanzada S.R.L.', 0, '2026-02-18'), (23, 'Agroindustrial X S.A.C.', 0, '2026-03-14'),
(24, 'Transportes Max S.A.', 0, '2026-04-01'), (25, 'Acabados Premium E.I.R.L.', 0, '2026-05-10'),
(26, 'Proyectos Alpha S.A.C.', 0, '2026-01-11'), (27, 'Consorcio Vial S.R.L.', 0, '2026-02-22'),
(28, 'Mineria del Sur S.A.', 0, '2026-03-30'), (29, 'Ferreteria Gigante E.I.R.L.', 0, '2026-04-18'),
(30, 'Servicios Globales S.A.C.', 0, '2026-05-25');
GO

INSERT INTO Producto (Nombre) VALUES 
('Plancha Acero 1'), ('Plancha Acero 2'), ('Plancha Acero 3'), ('Plancha Aluminio 1'), ('Plancha Aluminio 2'),
('Plancha Inox 1'), ('Plancha Inox 2'), ('Plancha Cobre 1'), ('Plancha Cobre 2'), ('Plancha Zinc 1'),
('Plancha Zinc 2'), ('Plancha Titanio 1'), ('Plancha Titanio 2'), ('Plancha Bronce 1'), ('Plancha Bronce 2'),
('Tubo Circular 1'), ('Tubo Circular 2'), ('Tubo Circular 3'), ('Tubo Cuadrado 1'), ('Tubo Cuadrado 2'),
('Tubo Inox 1'), ('Tubo Inox 2'), ('Tubo Cobre 1'), ('Tubo Cobre 2'), ('Tubo Aluminio 1'),
('Tubo Aluminio 2'), ('Tubo PVC 1'), ('Tubo PVC 2'), ('Tubo Bronce 1'), ('Tubo Bronce 2');
GO

INSERT INTO Almacen (Nombre, Ubicacion, Capacidad, IdSede) VALUES
('Bodega Principal Trujillo', 'Av. America Sur 1230', 8000, 1),
('Bodega Cajamarca', 'Av. Atahualpa 1250', 4000, 2);
GO

INSERT INTO InventarioProducto (StockActual, StockMinimo, IdAlmacen, IdProducto) VALUES
(150, 10, 1, 1), (120, 15, 1, 2), (300, 20, 2, 3), (85, 5, 1, 4), (110, 12, 2, 5),
(200, 25, 1, 6), (90, 10, 2, 7), (140, 18, 1, 8), (160, 22, 2, 9), (75, 8, 1, 10),
(180, 20, 2, 11), (210, 30, 1, 12), (130, 15, 2, 13), (95, 10, 1, 14), (220, 25, 2, 15),
(310, 40, 1, 16), (280, 35, 2, 17), (150, 20, 1, 18), (170, 22, 2, 19), (260, 30, 1, 20),
(190, 25, 2, 21), (230, 28, 1, 22), (110, 12, 2, 23), (145, 15, 1, 24), (275, 35, 2, 25),
(165, 18, 1, 26), (320, 40, 2, 27), (290, 38, 1, 28), (105, 10, 2, 29), (250, 30, 1, 30);
GO

INSERT INTO Proveedor (RazonSocial, NombreComercial, IdentificacionFiscal, TipoProveedor) VALUES
('Siderperu S.A.A.', 'Siderperu', '20100000001', 'Metalurgia'), 
('Aceros Arequipa S.A.', 'AceroAqp', '20100000002', 'Metalurgia'),
('Herramientas Truper S.A.', 'Truper Peru', '20100000003', 'Herramientas'),
('Distribuidora Makita', 'Makita', '20100000004', 'Herramientas'),
('Soldaduras Lincoln', 'Lincoln', '20100000005', 'Equipos'),
('Lubricantes Shell', 'Shell', '20100000006', 'Insumos'),
('Pinturas Vencedor', 'Vencedor', '20100000007', 'Insumos'),
('Ferreteria B&C', 'FerretBC', '20100000008', 'Materiales'),
('Neumaticos Goodyear', 'Goodyear', '20100000009', 'Repuestos'),
('Repuestos CAT', 'CatParts', '20100000010', 'Repuestos'),
('Electrica Sol', 'ElecSol', '20100000011', 'Materiales'),
('Gases Industriales', 'Aga', '20100000012', 'Insumos'),
('Tornillos y Mas', 'TorMas', '20100000013', 'Materiales'),
('Seguridad 3M', '3M Peru', '20100000014', 'EPP'),
('Cables Indeco', 'Indeco', '20100000015', 'Materiales');
GO

INSERT INTO Equipos (Nombre, Marca, Modelo, AnioAdquisicion, Estado, IdSede) VALUES
('Prensa Hidraulica Alpha', 'Hidra', 'PH-200', 2020, 'Operativo', 1), ('Torno CNC Principal', 'Mazak', 'QT-200', 2021, 'Operativo', 1),
('Compresor A1', 'Atlas', 'GA-37', 2022, 'Operativo', 1), ('Soldadora MIG 1', 'Lincoln', 'M-350', 2019, 'Operativo', 1),
('Taladro Radial 1', 'Knuth', 'TR-50', 2021, 'Operativo', 2), ('Fresadora Universal', 'Bridge', 'FU-1', 2020, 'Operativo', 2),
('Grua Puente 10T', 'Demag', 'GP-10', 2018, 'Mantenimiento', 2), ('Cortadora Plasma', 'Hyper', 'P-45', 2023, 'Operativo', 1),
('Dobladora Chapas', 'Amada', 'DC-150', 2021, 'Operativo', 1), ('Torno Convencional', 'Tardini', 'TC-3M', 2017, 'Operativo', 2),
('Prensa Excentrica', 'Mec', 'PE-50', 2019, 'Malogrado', 1), ('Soldadora TIG 1', 'Miller', 'T-200', 2022, 'Operativo', 2),
('Compresor B2', 'Kaeser', 'SK-22', 2020, 'Operativo', 2), ('Esmeril de Banco 1', 'Bosch', 'EB-10', 2021, 'Operativo', 1),
('Taladro Pedestal', 'Makita', 'TP-15', 2018, 'Operativo', 2), ('Sierra Cinta', 'Banda', 'SC-40', 2022, 'Operativo', 1),
('Guillotina Ind', 'Amada', 'G-300', 2019, 'Operativo', 1), ('Generador 50kW', 'Cat', 'G-50', 2023, 'Operativo', 2),
('Aspiradora Ind', 'Karcher', 'AI-80', 2021, 'Operativo', 1), ('Montacargas 3T', 'Toyota', 'M-30', 2020, 'Operativo', 1),
('Montacargas 2T', 'Hyster', 'M-20', 2019, 'Mantenimiento', 2), ('Elevador Tijera', 'JLG', 'ET-10', 2022, 'Operativo', 1),
('Bomba Hidraulica', 'Rexroth', 'BH-5', 2021, 'Operativo', 2), ('Enfriador Agua', 'Chiller', 'CH-15', 2020, 'Operativo', 1),
('Secador Aire', 'Sullair', 'SA-20', 2022, 'Operativo', 2), ('Pulidora Ind', 'DeWalt', 'PI-7', 2023, 'Operativo', 1),
('Rodillos Curvado', 'Davi', 'RC-4', 2018, 'Operativo', 2), ('Cizalla CNC', 'Trumpf', 'CZ-2', 2021, 'Operativo', 1),
('Horno Tratamiento', 'Nabertherm', 'HT-9', 2019, 'Operativo', 2), ('Cabina Pintura', 'Blowtherm', 'CP-1', 2022, 'Operativo', 1);
GO

INSERT INTO Gasto (FechaGasto, MontoPENGasto, MetodoGasto, NumeroOperacion) VALUES
('2026-01-05', 2150.00, 'Transferencia', 'GST-1001'), ('2026-01-12', 450.50, 'Efectivo', 'GST-1002'),
('2026-01-18', 1230.00, 'Tarjeta', 'GST-1003'), ('2026-01-25', 890.00, 'Yape', 'GST-1004'),
('2026-02-03', 3100.00, 'Transferencia', 'GST-1005'), ('2026-02-09', 215.00, 'Efectivo', 'GST-1006'),
('2026-02-14', 1450.20, 'Tarjeta', 'GST-1007'), ('2026-02-22', 670.00, 'Yape', 'GST-1008'),
('2026-03-05', 2890.00, 'Transferencia', 'GST-1009'), ('2026-03-11', 340.50, 'Efectivo', 'GST-1010'),
('2026-03-19', 1780.00, 'Tarjeta', 'GST-1011'), ('2026-03-27', 920.00, 'Yape', 'GST-1012'),
('2026-04-04', 2340.00, 'Transferencia', 'GST-1013'), ('2026-04-10', 510.00, 'Efectivo', 'GST-1014'),
('2026-04-16', 1560.80, 'Tarjeta', 'GST-1015'), ('2026-04-24', 780.00, 'Yape', 'GST-1016'),
('2026-05-02', 2670.00, 'Transferencia', 'GST-1017'), ('2026-05-08', 420.50, 'Efectivo', 'GST-1018'),
('2026-05-15', 1340.00, 'Tarjeta', 'GST-1019'), ('2026-05-23', 850.00, 'Yape', 'GST-1020'),
('2026-06-06', 2980.00, 'Transferencia', 'GST-1021'), ('2026-06-12', 390.00, 'Efectivo', 'GST-1022'),
('2026-06-18', 1890.50, 'Tarjeta', 'GST-1023'), ('2026-06-25', 960.00, 'Yape', 'GST-1024'),
('2026-06-28', 1250.00, 'Transferencia', 'GST-1025'), ('2026-01-30', 430.00, 'Efectivo', 'GST-1026'),
('2026-02-28', 1670.00, 'Tarjeta', 'GST-1027'), ('2026-03-31', 710.00, 'Yape', 'GST-1028'),
('2026-04-30', 2450.00, 'Transferencia', 'GST-1029'), ('2026-05-30', 580.00, 'Efectivo', 'GST-1030');
GO

INSERT INTO PagoProveedor (FechaPago, MontoPEN, MetodoPago, NumeroOperacion, IdProveedor) VALUES
('2026-01-08', 14500.00, 'Transferencia', 'PRV-501', 1), ('2026-01-15', 8200.00, 'Transferencia', 'PRV-502', 2),
('2026-01-22', 3400.00, 'Tarjeta', 'PRV-503', 3), ('2026-02-05', 11200.00, 'Transferencia', 'PRV-504', 4),
('2026-02-12', 5600.00, 'Transferencia', 'PRV-505', 5), ('2026-02-20', 2300.00, 'Efectivo', 'PRV-506', 6),
('2026-03-02', 15800.00, 'Transferencia', 'PRV-507', 7), ('2026-03-14', 9100.00, 'Transferencia', 'PRV-508', 8),
('2026-03-24', 4500.00, 'Tarjeta', 'PRV-509', 9), ('2026-04-06', 13400.00, 'Transferencia', 'PRV-510', 10),
('2026-04-15', 6700.00, 'Transferencia', 'PRV-511', 11), ('2026-04-26', 1800.00, 'Efectivo', 'PRV-512', 12),
('2026-05-04', 16500.00, 'Transferencia', 'PRV-513', 13), ('2026-05-12', 7800.00, 'Transferencia', 'PRV-514', 14),
('2026-05-22', 5200.00, 'Tarjeta', 'PRV-515', 15), ('2026-06-03', 12900.00, 'Transferencia', 'PRV-516', 1),
('2026-06-11', 8400.00, 'Transferencia', 'PRV-517', 2), ('2026-06-21', 2900.00, 'Efectivo', 'PRV-518', 3),
('2026-06-28', 17200.00, 'Transferencia', 'PRV-519', 4), ('2026-01-28', 6100.00, 'Transferencia', 'PRV-520', 5),
('2026-02-26', 3800.00, 'Tarjeta', 'PRV-521', 6), ('2026-03-28', 14300.00, 'Transferencia', 'PRV-522', 7),
('2026-04-28', 7500.00, 'Transferencia', 'PRV-523', 8), ('2026-05-28', 2100.00, 'Efectivo', 'PRV-524', 9),
('2026-06-30', 15600.00, 'Transferencia', 'PRV-525', 10), ('2026-01-10', 8900.00, 'Transferencia', 'PRV-526', 11),
('2026-02-18', 4200.00, 'Tarjeta', 'PRV-527', 12), ('2026-03-10', 11800.00, 'Transferencia', 'PRV-528', 13),
('2026-04-20', 5300.00, 'Transferencia', 'PRV-529', 14), ('2026-05-10', 3600.00, 'Efectivo', 'PRV-530', 15);
GO

INSERT INTO PagoEmpleado (FechaPago, MontoPEN, MetodoPago, NumeroOperacion, IdEmpleado) VALUES
('2026-01-31', 8500, 'Transferencia', 'NOM-01-1', 1), ('2026-01-31', 6200, 'Transferencia', 'NOM-01-2', 2),
('2026-01-31', 3150, 'Transferencia', 'NOM-01-3', 3), ('2026-01-31', 2600, 'Transferencia', 'NOM-01-4', 4),
('2026-01-31', 4100, 'Transferencia', 'NOM-01-5', 5), ('2026-02-28', 8500, 'Transferencia', 'NOM-02-1', 1),
('2026-02-28', 6200, 'Transferencia', 'NOM-02-2', 2), ('2026-02-28', 3150, 'Transferencia', 'NOM-02-3', 3),
('2026-02-28', 2600, 'Transferencia', 'NOM-02-4', 4), ('2026-02-28', 4100, 'Transferencia', 'NOM-02-5', 5),
('2026-03-31', 4600, 'Transferencia', 'NOM-03-6', 6), ('2026-03-31', 3550, 'Transferencia', 'NOM-03-7', 7),
('2026-03-31', 2550, 'Transferencia', 'NOM-03-8', 8), ('2026-03-31', 3050, 'Transferencia', 'NOM-03-9', 9),
('2026-03-31', 3600, 'Transferencia', 'NOM-03-10', 10),('2026-04-30', 4600, 'Transferencia', 'NOM-04-6', 6),
('2026-04-30', 3550, 'Transferencia', 'NOM-04-7', 7), ('2026-04-30', 2550, 'Transferencia', 'NOM-04-8', 8),
('2026-04-30', 3050, 'Transferencia', 'NOM-04-9', 9), ('2026-04-30', 3600, 'Transferencia', 'NOM-04-10', 10),
('2026-05-31', 2200, 'Transferencia', 'NOM-05-11', 11),('2026-05-31', 3800, 'Transferencia', 'NOM-05-12', 12),
('2026-05-31', 4200, 'Transferencia', 'NOM-05-13', 13),('2026-05-31', 3300, 'Transferencia', 'NOM-05-14', 14),
('2026-05-31', 2800, 'Transferencia', 'NOM-05-15', 15),('2026-06-30', 2200, 'Transferencia', 'NOM-06-11', 11),
('2026-06-30', 3800, 'Transferencia', 'NOM-06-12', 12),('2026-06-30', 4200, 'Transferencia', 'NOM-06-13', 13),
('2026-06-30', 3300, 'Transferencia', 'NOM-06-14', 14),('2026-06-30', 2800, 'Transferencia', 'NOM-06-15', 15);
GO

INSERT INTO Carro (Placa, Categoria, Modelo, Color, AnioFabricacion, AnioModelo, IdCliente) VALUES
('T1A-001', 'Camion Minero', 'Cat 793F', 'Amarillo', '2022', '2022', 1), ('T2B-002', 'Pickup', 'Hilux', 'Blanco', '2023', '2023', 2),
('C3C-003', 'Furgon', 'FH16', 'Plata', '2021', '2021', 3), ('C4D-004', 'Camioneta', 'Ranger', 'Rojo', '2023', '2023', 4),
('T5E-005', 'Volquete', 'Actros', 'Naranja', '2020', '2020', 5), ('C6F-006', 'Minivan', 'H1', 'Gris', '2022', '2022', 6),
('T7G-007', 'Tractor', 'John Deere', 'Verde', '2019', '2019', 7), ('C8H-008', 'Cisterna', 'Freightliner', 'Azul', '2021', '2021', 8),
('T9I-009', 'Grua', 'Liebherr', 'Amarillo', '2018', '2018', 9), ('C0J-010', 'Plataforma', 'Kenworth', 'Blanco', '2022', '2022', 10),
('T1K-011', 'Camioneta', 'Navara', 'Negro', '2023', '2023', 11), ('C2L-012', 'Furgon', 'Canter', 'Blanco', '2020', '2020', 12),
('T3M-013', 'Volquete', 'FMX', 'Amarillo', '2021', '2021', 13), ('C4N-014', 'Pickup', 'Amarok', 'Plata', '2022', '2022', 14),
('T5O-015', 'Cisterna', 'Scania', 'Blanco', '2019', '2019', 15), ('C6P-016', 'Tractor', 'New Holland', 'Azul', '2023', '2023', 1),
('T7Q-017', 'Minivan', 'Hiace', 'Blanco', '2021', '2021', 2), ('C8R-018', 'Grua', 'Tadano', 'Amarillo', '2020', '2020', 3),
('T9S-019', 'Plataforma', 'Mack', 'Rojo', '2022', '2022', 4), ('C0T-020', 'Camion Minero', 'Komatsu', 'Amarillo', '2018', '2018', 5),
('T1U-021', 'Camioneta', 'BT-50', 'Gris', '2023', '2023', 6), ('C2V-022', 'Furgon', 'NPR', 'Blanco', '2021', '2021', 7),
('T3W-023', 'Volquete', 'Trakker', 'Naranja', '2019', '2019', 8), ('C4X-024', 'Pickup', 'Colorado', 'Rojo', '2022', '2022', 9),
('T5Y-025', 'Cisterna', 'Atego', 'Blanco', '2020', '2020', 10), ('C6Z-026', 'Tractor', 'Massey', 'Rojo', '2023', '2023', 11),
('T7A-027', 'Minivan', 'Sprinter', 'Plata', '2021', '2021', 12), ('C8B-028', 'Grua', 'Grove', 'Amarillo', '2019', '2019', 13),
('T9C-029', 'Plataforma', 'Cascadia', 'Azul', '2022', '2022', 14), ('C0D-030', 'Camion Minero', 'Hitachi', 'Naranja', '2020', '2020', 15);
GO

INSERT INTO Carrosa (ModeloCarrosa, Altura, Ancho, Largo, Color, Estado, IdCarro) VALUES
('Tolva Minera 1', 3.50, 4.00, 8.00, 'Amarillo', 'Entregado', 1), ('Baranda Rebatible 1', 1.50, 2.00, 3.50, 'Blanco', 'Entregado', 2),
('Furgon Frio 1', 2.80, 2.50, 7.50, 'Blanco', 'Elaboracion', 3), ('Tolva Estandar 1', 1.60, 2.10, 4.00, 'Negro', 'Elaboracion', 4),
('Tolva Roquera 1', 2.50, 2.80, 6.00, 'Naranja', 'Terminado', 5), ('Caja Abierta 1', 1.20, 1.80, 3.00, 'Gris', 'Revision', 6),
('Remolque Agricola', 1.80, 2.20, 5.00, 'Verde', 'Mantenimiento', 7), ('Tanque Inox 1', 3.00, 2.50, 8.50, 'Azul', 'Entregado', 8),
('Plataforma Grua 1', 1.00, 3.00, 10.00, 'Amarillo', 'Terminado', 9), ('Cama Baja 1', 0.80, 3.20, 12.00, 'Blanco', 'Elaboracion', 10),
('Baranda Madera', 1.40, 1.90, 3.20, 'Negro', 'Revision', 11), ('Furgon Seco 1', 2.60, 2.40, 6.50, 'Blanco', 'Entregado', 12),
('Tolva Minera 2', 3.60, 4.10, 8.20, 'Amarillo', 'Mantenimiento', 13), ('Baranda Rebatible 2', 1.60, 2.10, 3.60, 'Plata', 'Terminado', 14),
('Tanque Acero 1', 2.90, 2.40, 8.00, 'Blanco', 'Elaboracion', 15), ('Remolque Ganadero', 2.20, 2.50, 7.00, 'Azul', 'Revision', 16),
('Caja Cerrada', 2.00, 2.00, 4.00, 'Blanco', 'Entregado', 17), ('Plataforma Grua 2', 1.10, 3.10, 10.50, 'Amarillo', 'Elaboracion', 18),
('Cama Alta', 1.50, 2.80, 9.00, 'Rojo', 'Terminado', 19), ('Tolva Roquera 2', 2.60, 2.90, 6.20, 'Amarillo', 'Mantenimiento', 20),
('Baranda Metalica', 1.50, 2.00, 3.40, 'Gris', 'Entregado', 21), ('Furgon Frio 2', 2.70, 2.50, 7.20, 'Blanco', 'Revision', 22),
('Tolva Estandar 2', 1.70, 2.20, 4.20, 'Naranja', 'Elaboracion', 23), ('Baranda Rebatible 3', 1.40, 1.90, 3.30, 'Rojo', 'Terminado', 24),
('Tanque Inox 2', 3.10, 2.60, 8.80, 'Blanco', 'Mantenimiento', 25), ('Remolque Agricola 2', 1.90, 2.30, 5.20, 'Rojo', 'Entregado', 26),
('Caja Abierta 2', 1.30, 1.90, 3.10, 'Plata', 'Elaboracion', 27), ('Plataforma Grua 3', 1.00, 2.90, 9.50, 'Amarillo', 'Revision', 28),
('Cama Baja 2', 0.90, 3.10, 11.50, 'Azul', 'Terminado', 29), ('Tolva Minera 3', 3.40, 3.90, 7.80, 'Naranja', 'Entregado', 30);
GO

INSERT INTO PagoCliente (FechaPago, MontoPEN, MetodoPago, NumeroOperacion, IdCliente) VALUES
('2026-01-04', 5420.50, 'Transferencia', 'VTA-001', 1), ('2026-01-07', 1850.00, 'Tarjeta', 'VTA-002', 4),
('2026-01-09', 3120.80, 'Transferencia', 'VTA-003', 7), ('2026-01-11', 2340.00, 'Yape', 'VTA-004', 10),
('2026-01-14', 8900.50, 'Transferencia', 'VTA-005', 13), ('2026-01-16', 1250.00, 'Tarjeta', 'VTA-006', 2),
('2026-01-18', 4670.00, 'Efectivo', 'VTA-007', 5), ('2026-01-20', 7890.30, 'Transferencia', 'VTA-008', 8),
('2026-01-23', 3450.00, 'Tarjeta', 'VTA-009', 11), ('2026-01-25', 5600.00, 'Yape', 'VTA-010', 14),
('2026-01-26', 1980.50, 'Transferencia', 'VTA-011', 3), ('2026-01-27', 4120.00, 'Tarjeta', 'VTA-012', 6),
('2026-01-28', 8760.00, 'Transferencia', 'VTA-013', 9), ('2026-01-29', 2130.00, 'Efectivo', 'VTA-014', 12),
('2026-01-30', 6540.20, 'Transferencia', 'VTA-015', 15), ('2026-01-05', 3210.00, 'Yape', 'VTA-016', 1),
('2026-01-08', 7650.80, 'Transferencia', 'VTA-017', 2), ('2026-01-12', 1430.00, 'Tarjeta', 'VTA-018', 3),
('2026-01-15', 5430.00, 'Transferencia', 'VTA-019', 4), ('2026-01-17', 9870.50, 'Transferencia', 'VTA-020', 5),
('2026-01-19', 2340.00, 'Efectivo', 'VTA-021', 6), ('2026-01-21', 6780.00, 'Tarjeta', 'VTA-022', 7),
('2026-01-22', 4320.00, 'Yape', 'VTA-023', 8), ('2026-01-24', 8120.50, 'Transferencia', 'VTA-024', 9),
('2026-01-31', 1560.00, 'Tarjeta', 'VTA-025', 10), ('2026-01-10', 3890.00, 'Transferencia', 'VTA-026', 11),
('2026-01-13', 5670.00, 'Efectivo', 'VTA-027', 12), ('2026-01-02', 2980.00, 'Transferencia', 'VTA-028', 13),
('2026-01-03', 7450.50, 'Tarjeta', 'VTA-029', 14), ('2026-01-06', 4120.00, 'Transferencia', 'VTA-030', 15),
('2026-02-02', 6540.00, 'Transferencia', 'VTA-031', 2), ('2026-02-04', 2310.50, 'Yape', 'VTA-032', 5),
('2026-02-06', 8760.00, 'Transferencia', 'VTA-033', 8), ('2026-02-08', 1450.00, 'Tarjeta', 'VTA-034', 11),
('2026-02-10', 5670.80, 'Transferencia', 'VTA-035', 14), ('2026-02-12', 3210.00, 'Efectivo', 'VTA-036', 3),
('2026-02-14', 9870.00, 'Transferencia', 'VTA-037', 6), ('2026-02-16', 4560.50, 'Tarjeta', 'VTA-038', 9),
('2026-02-18', 7890.00, 'Transferencia', 'VTA-039', 12), ('2026-02-20', 1230.00, 'Yape', 'VTA-040', 15),
('2026-02-22', 6780.00, 'Transferencia', 'VTA-041', 1), ('2026-02-24', 3450.00, 'Tarjeta', 'VTA-042', 4),
('2026-02-26', 8120.00, 'Transferencia', 'VTA-043', 7), ('2026-02-28', 2980.50, 'Efectivo', 'VTA-044', 10),
('2026-02-01', 5430.00, 'Transferencia', 'VTA-045', 13), ('2026-02-03', 1980.00, 'Tarjeta', 'VTA-046', 2),
('2026-02-05', 7650.00, 'Transferencia', 'VTA-047', 5), ('2026-02-07', 4320.50, 'Yape', 'VTA-048', 8),
('2026-02-09', 8900.00, 'Transferencia', 'VTA-049', 11), ('2026-02-11', 2130.00, 'Tarjeta', 'VTA-050', 14),
('2026-02-13', 6540.80, 'Transferencia', 'VTA-051', 3), ('2026-02-15', 3890.00, 'Efectivo', 'VTA-052', 6),
('2026-02-17', 9120.00, 'Transferencia', 'VTA-053', 9), ('2026-02-19', 1560.50, 'Tarjeta', 'VTA-054', 12),
('2026-02-21', 5670.00, 'Transferencia', 'VTA-055', 15), ('2026-02-23', 3210.00, 'Yape', 'VTA-056', 1),
('2026-02-25', 7450.00, 'Transferencia', 'VTA-057', 4), ('2026-02-27', 4120.50, 'Tarjeta', 'VTA-058', 7),
('2026-02-07', 8760.00, 'Transferencia', 'VTA-059', 10), ('2026-02-15', 2340.00, 'Efectivo', 'VTA-060', 13),
('2026-03-02', 7890.50, 'Transferencia', 'VTA-061', 3), ('2026-03-04', 1450.00, 'Tarjeta', 'VTA-062', 6),
('2026-03-06', 6540.00, 'Transferencia', 'VTA-063', 9), ('2026-03-08', 3210.80, 'Yape', 'VTA-064', 12),
('2026-03-10', 9870.00, 'Transferencia', 'VTA-065', 15), ('2026-03-12', 4560.00, 'Efectivo', 'VTA-066', 1),
('2026-03-14', 8120.50, 'Transferencia', 'VTA-067', 4), ('2026-03-16', 2980.00, 'Tarjeta', 'VTA-068', 7),
('2026-03-18', 5430.00, 'Transferencia', 'VTA-069', 10), ('2026-03-20', 1980.00, 'Yape', 'VTA-070', 13),
('2026-03-22', 7650.50, 'Transferencia', 'VTA-071', 2), ('2026-03-24', 4320.00, 'Tarjeta', 'VTA-072', 5),
('2026-03-26', 8900.00, 'Transferencia', 'VTA-073', 8), ('2026-03-28', 2130.80, 'Efectivo', 'VTA-074', 11),
('2026-03-30', 6540.00, 'Transferencia', 'VTA-075', 14), ('2026-03-01', 3890.00, 'Tarjeta', 'VTA-076', 3),
('2026-03-03', 9120.50, 'Transferencia', 'VTA-077', 6), ('2026-03-05', 1560.00, 'Yape', 'VTA-078', 9),
('2026-03-07', 5670.00, 'Transferencia', 'VTA-079', 12), ('2026-03-09', 3210.00, 'Efectivo', 'VTA-080', 15),
('2026-03-11', 7450.80, 'Transferencia', 'VTA-081', 1), ('2026-03-13', 4120.00, 'Tarjeta', 'VTA-082', 4),
('2026-03-15', 8760.00, 'Transferencia', 'VTA-083', 7), ('2026-03-17', 2340.50, 'Yape', 'VTA-084', 10),
('2026-03-19', 6780.00, 'Transferencia', 'VTA-085', 13), ('2026-03-21', 3450.00, 'Tarjeta', 'VTA-086', 2),
('2026-03-23', 8120.00, 'Transferencia', 'VTA-087', 5), ('2026-03-25', 2980.80, 'Efectivo', 'VTA-088', 8),
('2026-03-27', 5430.00, 'Transferencia', 'VTA-089', 11), ('2026-03-29', 1980.00, 'Tarjeta', 'VTA-090', 14),
('2026-04-02', 8900.50, 'Transferencia', 'VTA-091', 4), ('2026-04-04', 2130.00, 'Yape', 'VTA-092', 7),
('2026-04-06', 6540.00, 'Transferencia', 'VTA-093', 10), ('2026-04-08', 3890.80, 'Tarjeta', 'VTA-094', 13),
('2026-04-10', 9120.00, 'Transferencia', 'VTA-095', 1), ('2026-04-12', 1560.00, 'Efectivo', 'VTA-096', 4),
('2026-04-14', 5670.50, 'Transferencia', 'VTA-097', 7), ('2026-04-16', 3210.00, 'Tarjeta', 'VTA-098', 10),
('2026-04-18', 7450.00, 'Transferencia', 'VTA-099', 13), ('2026-04-20', 4120.80, 'Yape', 'VTA-100', 1),
('2026-04-22', 8760.00, 'Transferencia', 'VTA-101', 4), ('2026-04-24', 2340.00, 'Tarjeta', 'VTA-102', 7),
('2026-04-26', 6780.50, 'Transferencia', 'VTA-103', 10), ('2026-04-28', 3450.00, 'Efectivo', 'VTA-104', 13),
('2026-04-30', 8120.00, 'Transferencia', 'VTA-105', 1), ('2026-04-01', 2980.00, 'Tarjeta', 'VTA-106', 4),
('2026-04-03', 5430.80, 'Transferencia', 'VTA-107', 7), ('2026-04-05', 1980.00, 'Yape', 'VTA-108', 10),
('2026-04-07', 7650.00, 'Transferencia', 'VTA-109', 13), ('2026-04-09', 4320.50, 'Tarjeta', 'VTA-110', 2),
('2026-04-11', 8900.00, 'Transferencia', 'VTA-111', 5), ('2026-04-13', 2130.00, 'Efectivo', 'VTA-112', 8),
('2026-04-15', 6540.00, 'Transferencia', 'VTA-113', 11), ('2026-04-17', 3890.80, 'Tarjeta', 'VTA-114', 14),
('2026-04-19', 9120.00, 'Transferencia', 'VTA-115', 2), ('2026-04-21', 1560.00, 'Yape', 'VTA-116', 5),
('2026-04-23', 5670.50, 'Transferencia', 'VTA-117', 8), ('2026-04-25', 3210.00, 'Tarjeta', 'VTA-118', 11),
('2026-04-27', 7450.00, 'Transferencia', 'VTA-119', 14), ('2026-04-29', 4120.00, 'Efectivo', 'VTA-120', 2),
('2026-05-02', 8760.80, 'Transferencia', 'VTA-121', 5), ('2026-05-04', 2340.00, 'Tarjeta', 'VTA-122', 8),
('2026-05-06', 6780.00, 'Transferencia', 'VTA-123', 11), ('2026-05-08', 3450.50, 'Yape', 'VTA-124', 14),
('2026-05-10', 8120.00, 'Transferencia', 'VTA-125', 3), ('2026-05-12', 2980.00, 'Efectivo', 'VTA-126', 6),
('2026-05-14', 5430.80, 'Transferencia', 'VTA-127', 9), ('2026-05-16', 1980.00, 'Tarjeta', 'VTA-128', 12),
('2026-05-18', 7650.00, 'Transferencia', 'VTA-129', 15), ('2026-05-20', 4320.50, 'Yape', 'VTA-130', 3),
('2026-05-22', 8900.00, 'Transferencia', 'VTA-131', 6), ('2026-05-24', 2130.00, 'Tarjeta', 'VTA-132', 9),
('2026-05-26', 6540.00, 'Transferencia', 'VTA-133', 12), ('2026-05-28', 3890.80, 'Efectivo', 'VTA-134', 15),
('2026-05-30', 9120.00, 'Transferencia', 'VTA-135', 3), ('2026-05-01', 1560.00, 'Tarjeta', 'VTA-136', 6),
('2026-05-03', 5670.50, 'Transferencia', 'VTA-137', 9), ('2026-05-05', 3210.00, 'Yape', 'VTA-138', 12),
('2026-05-07', 7450.00, 'Transferencia', 'VTA-139', 15), ('2026-05-09', 4120.80, 'Tarjeta', 'VTA-140', 2),
('2026-05-11', 8760.00, 'Transferencia', 'VTA-141', 5), ('2026-05-13', 2340.00, 'Efectivo', 'VTA-142', 8),
('2026-05-15', 6780.50, 'Transferencia', 'VTA-143', 11), ('2026-05-17', 3450.00, 'Tarjeta', 'VTA-144', 14),
('2026-05-19', 8120.00, 'Transferencia', 'VTA-145', 2), ('2026-05-21', 2980.00, 'Yape', 'VTA-146', 5),
('2026-05-23', 5430.80, 'Transferencia', 'VTA-147', 8), ('2026-05-25', 1980.00, 'Tarjeta', 'VTA-148', 11),
('2026-05-27', 7650.00, 'Transferencia', 'VTA-149', 14), ('2026-05-29', 4320.50, 'Efectivo', 'VTA-150', 2),
('2026-06-02', 8900.00, 'Transferencia', 'VTA-151', 6), ('2026-06-04', 2130.00, 'Tarjeta', 'VTA-152', 9),
('2026-06-06', 6540.80, 'Transferencia', 'VTA-153', 12), ('2026-06-08', 3890.00, 'Yape', 'VTA-154', 15),
('2026-06-10', 9120.00, 'Transferencia', 'VTA-155', 6), ('2026-06-12', 1560.50, 'Efectivo', 'VTA-156', 9),
('2026-06-14', 5670.00, 'Transferencia', 'VTA-157', 12), ('2026-06-16', 3210.00, 'Tarjeta', 'VTA-158', 15),
('2026-06-18', 7450.80, 'Transferencia', 'VTA-159', 6), ('2026-06-20', 4120.00, 'Yape', 'VTA-160', 9),
('2026-06-22', 8760.00, 'Transferencia', 'VTA-161', 12), ('2026-06-24', 2340.50, 'Tarjeta', 'VTA-162', 15),
('2026-06-26', 6780.00, 'Transferencia', 'VTA-163', 6), ('2026-06-28', 3450.00, 'Efectivo', 'VTA-164', 9),
('2026-06-30', 8120.80, 'Transferencia', 'VTA-165', 12), ('2026-06-01', 2980.00, 'Tarjeta', 'VTA-166', 15),
('2026-06-03', 5430.00, 'Transferencia', 'VTA-167', 1), ('2026-06-05', 1980.50, 'Yape', 'VTA-168', 4),
('2026-06-07', 7650.00, 'Transferencia', 'VTA-169', 7), ('2026-06-09', 4320.00, 'Tarjeta', 'VTA-170', 10),
('2026-06-11', 8900.80, 'Transferencia', 'VTA-171', 13), ('2026-06-13', 2130.00, 'Efectivo', 'VTA-172', 1),
('2026-06-15', 6540.00, 'Transferencia', 'VTA-173', 4), ('2026-06-17', 3890.50, 'Tarjeta', 'VTA-174', 7),
('2026-06-19', 9120.00, 'Transferencia', 'VTA-175', 10), ('2026-06-21', 1560.00, 'Yape', 'VTA-176', 13),
('2026-06-23', 5670.80, 'Transferencia', 'VTA-177', 1), ('2026-06-25', 3210.00, 'Tarjeta', 'VTA-178', 4),
('2026-06-27', 7450.00, 'Transferencia', 'VTA-179', 7), ('2026-06-29', 4120.50, 'Efectivo', 'VTA-180', 10);
GO

INSERT INTO Mantenimientos (IdEquipo, FechaInicio, FechaFin, Tipo, Descripcion, Costo) VALUES
(1, '2026-01-02', '2026-01-03', 'Preventivo', 'Lubricacion', 150.00), (4, '2026-01-05', '2026-01-07', 'Correctivo', 'Ajuste polea', 320.50),
(7, '2026-01-08', '2026-01-09', 'Preventivo', 'Calibracion', 180.00), (10, '2026-01-11', '2026-01-14', 'Correctivo', 'Cambio motor', 1250.00),
(13, '2026-01-15', '2026-01-16', 'Preventivo', 'Filtros', 210.00), (16, '2026-01-18', '2026-01-20', 'Correctivo', 'Sensor', 450.50),
(19, '2026-01-21', '2026-01-22', 'Preventivo', 'Revision', 120.00), (22, '2026-01-24', '2026-01-26', 'Correctivo', 'Hidraulico', 670.00),
(25, '2026-01-27', '2026-01-28', 'Preventivo', 'Aceite', 190.00), (28, '2026-01-30', '2026-02-01', 'Correctivo', 'Banda', 340.50),
(2, '2026-01-03', '2026-01-04', 'Preventivo', 'Limpieza', 140.00), (5, '2026-01-06', '2026-01-08', 'Correctivo', 'Falla electrica', 510.00),
(8, '2026-01-09', '2026-01-10', 'Preventivo', 'Ajuste', 160.00), (11, '2026-01-12', '2026-01-15', 'Correctivo', 'Rodamiento', 890.50),
(14, '2026-01-16', '2026-01-17', 'Preventivo', 'Lubricacion', 170.00), (17, '2026-01-19', '2026-01-21', 'Correctivo', 'Cambio pieza', 560.00),
(20, '2026-01-22', '2026-01-23', 'Preventivo', 'Revision', 130.00), (23, '2026-01-25', '2026-01-27', 'Correctivo', 'Fuga', 780.50),
(26, '2026-01-28', '2026-01-29', 'Preventivo', 'Calibracion', 200.00), (29, '2026-01-31', '2026-02-02', 'Correctivo', 'Motor', 1150.00),
(3, '2026-01-04', '2026-01-05', 'Preventivo', 'Filtros', 220.00), (6, '2026-01-07', '2026-01-09', 'Correctivo', 'Sensor', 430.50),
(9, '2026-01-10', '2026-01-11', 'Preventivo', 'Revision', 150.00), (12, '2026-01-13', '2026-01-16', 'Correctivo', 'Ajuste', 620.00),
(15, '2026-01-17', '2026-01-18', 'Preventivo', 'Aceite', 180.00), (18, '2026-01-20', '2026-01-22', 'Correctivo', 'Banda', 390.50),
(21, '2026-01-23', '2026-01-24', 'Preventivo', 'Limpieza', 140.00), (24, '2026-01-26', '2026-01-28', 'Correctivo', 'Falla electrica', 540.00),
(27, '2026-01-29', '2026-01-30', 'Preventivo', 'Ajuste', 170.00), (30, '2026-02-01', '2026-02-03', 'Correctivo', 'Rodamiento', 910.50),
(1, '2026-02-04', '2026-02-05', 'Preventivo', 'Lubricacion', 160.00), (4, '2026-02-07', '2026-02-09', 'Correctivo', 'Cambio pieza', 480.00),
(7, '2026-02-10', '2026-02-11', 'Preventivo', 'Revision', 130.00), (10, '2026-02-13', '2026-02-16', 'Correctivo', 'Fuga', 820.50),
(13, '2026-02-17', '2026-02-18', 'Preventivo', 'Calibracion', 210.00), (16, '2026-02-20', '2026-02-22', 'Correctivo', 'Motor', 1250.00),
(19, '2026-02-23', '2026-02-24', 'Preventivo', 'Filtros', 230.00), (22, '2026-02-26', '2026-02-28', 'Correctivo', 'Sensor', 460.50),
(25, '2026-02-02', '2026-02-03', 'Preventivo', 'Revision', 140.00), (28, '2026-02-05', '2026-02-07', 'Correctivo', 'Ajuste', 650.00),
(2, '2026-02-08', '2026-02-09', 'Preventivo', 'Aceite', 190.00), (5, '2026-02-11', '2026-02-13', 'Correctivo', 'Banda', 420.50),
(8, '2026-02-14', '2026-02-15', 'Preventivo', 'Limpieza', 150.00), (11, '2026-02-18', '2026-02-20', 'Correctivo', 'Falla electrica', 570.00),
(14, '2026-02-21', '2026-02-22', 'Preventivo', 'Ajuste', 180.00), (17, '2026-02-25', '2026-02-27', 'Correctivo', 'Rodamiento', 940.50),
(20, '2026-02-06', '2026-02-07', 'Preventivo', 'Lubricacion', 170.00), (23, '2026-02-09', '2026-02-11', 'Correctivo', 'Cambio pieza', 510.00),
(26, '2026-02-12', '2026-02-13', 'Preventivo', 'Revision', 120.00), (29, '2026-02-16', '2026-02-18', 'Correctivo', 'Fuga', 850.50),
(3, '2026-02-19', '2026-02-20', 'Preventivo', 'Calibracion', 220.00), (6, '2026-02-22', '2026-02-24', 'Correctivo', 'Motor', 1350.00),
(9, '2026-02-27', '2026-02-28', 'Preventivo', 'Filtros', 240.00), (12, '2026-02-04', '2026-02-06', 'Correctivo', 'Sensor', 490.50),
(15, '2026-02-08', '2026-02-09', 'Preventivo', 'Revision', 150.00), (18, '2026-02-11', '2026-02-13', 'Correctivo', 'Ajuste', 680.00),
(21, '2026-02-14', '2026-02-15', 'Preventivo', 'Aceite', 200.00), (24, '2026-02-17', '2026-02-19', 'Correctivo', 'Banda', 450.50),
(27, '2026-02-21', '2026-02-22', 'Preventivo', 'Limpieza', 160.00), (30, '2026-02-25', '2026-02-27', 'Correctivo', 'Falla electrica', 600.00),
(1, '2026-03-02', '2026-03-03', 'Preventivo', 'Ajuste', 190.00), (4, '2026-03-05', '2026-03-07', 'Correctivo', 'Rodamiento', 970.50),
(7, '2026-03-09', '2026-03-10', 'Preventivo', 'Lubricacion', 180.00), (10, '2026-03-12', '2026-03-14', 'Correctivo', 'Cambio pieza', 540.00),
(13, '2026-03-16', '2026-03-17', 'Preventivo', 'Revision', 110.00), (16, '2026-03-19', '2026-03-21', 'Correctivo', 'Fuga', 880.50),
(19, '2026-03-23', '2026-03-24', 'Preventivo', 'Calibracion', 230.00), (22, '2026-03-26', '2026-03-28', 'Correctivo', 'Motor', 1450.00),
(25, '2026-03-30', '2026-03-31', 'Preventivo', 'Filtros', 250.00), (28, '2026-03-03', '2026-03-05', 'Correctivo', 'Sensor', 520.50),
(2, '2026-03-06', '2026-03-07', 'Preventivo', 'Revision', 160.00), (5, '2026-03-10', '2026-03-12', 'Correctivo', 'Ajuste', 710.00),
(8, '2026-03-13', '2026-03-14', 'Preventivo', 'Aceite', 210.00), (11, '2026-03-17', '2026-03-19', 'Correctivo', 'Banda', 480.50),
(14, '2026-03-20', '2026-03-21', 'Preventivo', 'Limpieza', 170.00), (17, '2026-03-24', '2026-03-26', 'Correctivo', 'Falla electrica', 630.00),
(20, '2026-03-27', '2026-03-28', 'Preventivo', 'Ajuste', 200.00), (23, '2026-03-31', '2026-04-02', 'Correctivo', 'Rodamiento', 1000.50),
(26, '2026-03-04', '2026-03-05', 'Preventivo', 'Lubricacion', 190.00), (29, '2026-03-07', '2026-03-09', 'Correctivo', 'Cambio pieza', 570.00),
(3, '2026-03-11', '2026-03-12', 'Preventivo', 'Revision', 100.00), (6, '2026-03-14', '2026-03-16', 'Correctivo', 'Fuga', 910.50),
(9, '2026-03-18', '2026-03-19', 'Preventivo', 'Calibracion', 240.00), (12, '2026-03-21', '2026-03-23', 'Correctivo', 'Motor', 1550.00),
(15, '2026-03-25', '2026-03-26', 'Preventivo', 'Filtros', 260.00), (18, '2026-03-28', '2026-03-30', 'Correctivo', 'Sensor', 550.50),
(21, '2026-03-01', '2026-03-02', 'Preventivo', 'Revision', 170.00), (24, '2026-03-05', '2026-03-07', 'Correctivo', 'Ajuste', 740.00),
(27, '2026-03-08', '2026-03-09', 'Preventivo', 'Aceite', 220.00), (30, '2026-03-12', '2026-03-14', 'Correctivo', 'Banda', 510.50),
(1, '2026-04-02', '2026-04-03', 'Preventivo', 'Limpieza', 180.00), (4, '2026-04-05', '2026-04-07', 'Correctivo', 'Falla electrica', 660.00),
(7, '2026-04-09', '2026-04-10', 'Preventivo', 'Ajuste', 210.00), (10, '2026-04-12', '2026-04-14', 'Correctivo', 'Rodamiento', 1030.50),
(13, '2026-04-16', '2026-04-17', 'Preventivo', 'Lubricacion', 200.00), (16, '2026-04-19', '2026-04-21', 'Correctivo', 'Cambio pieza', 600.00),
(19, '2026-04-23', '2026-04-24', 'Preventivo', 'Revision', 110.00), (22, '2026-04-26', '2026-04-28', 'Correctivo', 'Fuga', 940.50),
(25, '2026-04-30', '2026-05-01', 'Preventivo', 'Calibracion', 250.00), (28, '2026-04-03', '2026-04-05', 'Correctivo', 'Motor', 1650.00),
(2, '2026-04-06', '2026-04-07', 'Preventivo', 'Filtros', 270.00), (5, '2026-04-10', '2026-04-12', 'Correctivo', 'Sensor', 580.50),
(8, '2026-04-13', '2026-04-14', 'Preventivo', 'Revision', 180.00), (11, '2026-04-17', '2026-04-19', 'Correctivo', 'Ajuste', 770.00),
(14, '2026-04-20', '2026-04-21', 'Preventivo', 'Aceite', 230.00), (17, '2026-04-24', '2026-04-26', 'Correctivo', 'Banda', 540.50),
(20, '2026-04-27', '2026-04-28', 'Preventivo', 'Limpieza', 190.00), (23, '2026-04-01', '2026-04-03', 'Correctivo', 'Falla electrica', 690.00),
(26, '2026-04-04', '2026-04-05', 'Preventivo', 'Ajuste', 220.00), (29, '2026-04-08', '2026-04-10', 'Correctivo', 'Rodamiento', 1060.50),
(3, '2026-04-11', '2026-04-12', 'Preventivo', 'Lubricacion', 210.00), (6, '2026-04-15', '2026-04-17', 'Correctivo', 'Cambio pieza', 630.00),
(9, '2026-04-18', '2026-04-19', 'Preventivo', 'Revision', 120.00), (12, '2026-04-22', '2026-04-24', 'Correctivo', 'Fuga', 970.50),
(15, '2026-04-25', '2026-04-26', 'Preventivo', 'Calibracion', 260.00), (18, '2026-04-29', '2026-05-01', 'Correctivo', 'Motor', 1750.00),
(21, '2026-04-02', '2026-04-03', 'Preventivo', 'Filtros', 280.00), (24, '2026-04-06', '2026-04-08', 'Correctivo', 'Sensor', 610.50),
(27, '2026-04-09', '2026-04-10', 'Preventivo', 'Revision', 190.00), (30, '2026-04-13', '2026-04-15', 'Correctivo', 'Ajuste', 800.00),
(1, '2026-05-04', '2026-05-05', 'Preventivo', 'Aceite', 240.00), (4, '2026-05-07', '2026-05-09', 'Correctivo', 'Banda', 570.50),
(7, '2026-05-11', '2026-05-12', 'Preventivo', 'Limpieza', 200.00), (10, '2026-05-14', '2026-05-16', 'Correctivo', 'Falla electrica', 720.00),
(13, '2026-05-18', '2026-05-19', 'Preventivo', 'Ajuste', 230.00), (16, '2026-05-21', '2026-05-23', 'Correctivo', 'Rodamiento', 1090.50),
(19, '2026-05-25', '2026-05-26', 'Preventivo', 'Lubricacion', 220.00), (22, '2026-05-28', '2026-05-30', 'Correctivo', 'Cambio pieza', 660.00),
(25, '2026-05-01', '2026-05-02', 'Preventivo', 'Revision', 130.00), (28, '2026-05-05', '2026-05-07', 'Correctivo', 'Fuga', 1000.50),
(2, '2026-05-08', '2026-05-09', 'Preventivo', 'Calibracion', 270.00), (5, '2026-05-12', '2026-05-14', 'Correctivo', 'Motor', 1850.00),
(8, '2026-05-15', '2026-05-16', 'Preventivo', 'Filtros', 290.00), (11, '2026-05-19', '2026-05-21', 'Correctivo', 'Sensor', 640.50),
(14, '2026-05-22', '2026-05-23', 'Preventivo', 'Revision', 200.00), (17, '2026-05-26', '2026-05-28', 'Correctivo', 'Ajuste', 830.00),
(20, '2026-05-29', '2026-05-30', 'Preventivo', 'Aceite', 250.00), (23, '2026-05-02', '2026-05-04', 'Correctivo', 'Banda', 600.50),
(26, '2026-05-06', '2026-05-07', 'Preventivo', 'Limpieza', 210.00), (29, '2026-05-09', '2026-05-11', 'Correctivo', 'Falla electrica', 750.00),
(3, '2026-05-13', '2026-05-14', 'Preventivo', 'Ajuste', 240.00), (6, '2026-05-16', '2026-05-18', 'Correctivo', 'Rodamiento', 1120.50),
(9, '2026-05-20', '2026-05-21', 'Preventivo', 'Lubricacion', 230.00), (12, '2026-05-24', '2026-05-26', 'Correctivo', 'Cambio pieza', 690.00),
(15, '2026-05-27', '2026-05-28', 'Preventivo', 'Revision', 140.00), (18, '2026-05-31', '2026-06-02', 'Correctivo', 'Fuga', 1030.50),
(21, '2026-05-03', '2026-05-04', 'Preventivo', 'Calibracion', 280.00), (24, '2026-05-07', '2026-05-09', 'Correctivo', 'Motor', 1950.00),
(27, '2026-05-10', '2026-05-11', 'Preventivo', 'Filtros', 300.00), (30, '2026-05-14', '2026-05-16', 'Correctivo', 'Sensor', 670.50),
(1, '2026-06-02', '2026-06-03', 'Preventivo', 'Revision', 210.00), (4, '2026-06-05', '2026-06-07', 'Correctivo', 'Ajuste', 860.00),
(7, '2026-06-09', '2026-06-10', 'Preventivo', 'Aceite', 260.00), (10, '2026-06-12', '2026-06-14', 'Correctivo', 'Banda', 630.50),
(13, '2026-06-16', '2026-06-17', 'Preventivo', 'Limpieza', 220.00), (16, '2026-06-19', '2026-06-21', 'Correctivo', 'Falla electrica', 780.00),
(19, '2026-06-23', '2026-06-24', 'Preventivo', 'Ajuste', 250.00), (22, '2026-06-26', '2026-06-28', 'Correctivo', 'Rodamiento', 1150.50),
(25, '2026-06-29', '2026-06-30', 'Preventivo', 'Lubricacion', 240.00), (28, '2026-06-03', '2026-06-05', 'Correctivo', 'Cambio pieza', 720.00),
(2, '2026-06-06', '2026-06-07', 'Preventivo', 'Revision', 150.00), (5, '2026-06-10', '2026-06-12', 'Correctivo', 'Fuga', 1060.50),
(8, '2026-06-13', '2026-06-14', 'Preventivo', 'Calibracion', 290.00), (11, '2026-06-17', '2026-06-19', 'Correctivo', 'Motor', 2050.00),
(14, '2026-06-20', '2026-06-21', 'Preventivo', 'Filtros', 310.00), (17, '2026-06-24', '2026-06-26', 'Correctivo', 'Sensor', 700.50),
(20, '2026-06-27', '2026-06-28', 'Preventivo', 'Revision', 220.00), (23, '2026-06-01', '2026-06-03', 'Correctivo', 'Ajuste', 890.00),
(26, '2026-06-04', '2026-06-05', 'Preventivo', 'Aceite', 270.00), (29, '2026-06-08', '2026-06-10', 'Correctivo', 'Banda', 660.50),
(3, '2026-06-11', '2026-06-12', 'Preventivo', 'Limpieza', 230.00), (6, '2026-06-15', '2026-06-17', 'Correctivo', 'Falla electrica', 810.00),
(9, '2026-06-18', '2026-06-19', 'Preventivo', 'Ajuste', 260.00), (12, '2026-06-22', '2026-06-24', 'Correctivo', 'Rodamiento', 1180.50),
(15, '2026-06-25', '2026-06-26', 'Preventivo', 'Lubricacion', 250.00), (18, '2026-06-29', '2026-06-30', 'Correctivo', 'Cambio pieza', 750.00),
(21, '2026-06-02', '2026-06-03', 'Preventivo', 'Revision', 160.00), (24, '2026-06-06', '2026-06-08', 'Correctivo', 'Fuga', 1090.50),
(27, '2026-06-09', '2026-06-10', 'Preventivo', 'Calibracion', 300.00), (30, '2026-06-13', '2026-06-15', 'Correctivo', 'Motor', 2150.00);
GO