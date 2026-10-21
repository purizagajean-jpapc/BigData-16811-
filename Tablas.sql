CREATE DATABASE MaquipesaEIRL
go

USE MaquipesaEIRL
Go

-- =============================================================================
-- LIMPIEZA PREVIA EN ORDEN INVERSO DE DEPENDENCIAS (DROP IF EXISTS)
-- Esto permite volver a ejecutar este script cuantas veces sea necesario sin errores
-- =============================================================================

-- 1. Vistas y Triggers
DROP VIEW IF EXISTS vw_ResumenPagosClientes;
DROP VIEW IF EXISTS vw_EquiposEnMantenimiento;
DROP VIEW IF EXISTS vw_EmpleadosHorarios;
GO

-- 2. Tablas dependientes (de hojas a raíz)
DROP TABLE IF EXISTS AuditoriaMantenimientos;
DROP TABLE IF EXISTS Mantenimientos;
DROP TABLE IF EXISTS Equipos;
DROP TABLE IF EXISTS Plancha;
DROP TABLE IF EXISTS Tubo;
DROP TABLE IF EXISTS InventarioProducto;
DROP TABLE IF EXISTS Almacen;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Herramientas;
DROP TABLE IF EXISTS HorasExtras;
DROP TABLE IF EXISTS EmpleadoHorario;
DROP TABLE IF EXISTS HorarioTrabajo;
DROP TABLE IF EXISTS PagoEmpleado;
DROP TABLE IF EXISTS ContratoEmpleado;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Carrosa;
DROP TABLE IF EXISTS Carro;
DROP TABLE IF EXISTS PagoCliente;
DROP TABLE IF EXISTS ContratoCliente;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS PagoProveedor;
DROP TABLE IF EXISTS ContratoProveedor;
DROP TABLE IF EXISTS ContactoProveedor;
DROP TABLE IF EXISTS Proveedor;
DROP TABLE IF EXISTS Gasto;
DROP TABLE IF EXISTS PersonaCorreo;
DROP TABLE IF EXISTS PersonaTelefono;
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS Sede;
GO

-- =============================================================================
-- 1. MODULO DE SEDES Y PERSONAS
-- =============================================================================

CREATE TABLE Sede (
    IdSede INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    NombreSede VARCHAR(50) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(30) NOT NULL,
    Pais VARCHAR(30) NOT NULL,
    Telefono VARCHAR(12) NULL,
    Estado BIT DEFAULT 1 NOT NULL
);
GO

CREATE TABLE Persona (
    IdPersona INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Documento VARCHAR(10) NOT NULL,
    NombreLegal VARCHAR(30) NOT NULL,
    ApellidoPaterno VARCHAR(20) NOT NULL,
    ApellidoMaterno VARCHAR(20) NOT NULL,
    Pais VARCHAR(20) NOT NULL,
    Ciudad VARCHAR(20) NOT NULL,
    FechaDeNacimiento DATE NOT NULL,
    Direccion VARCHAR(60) NOT NULL,
    IdSede INT NOT NULL,
    CONSTRAINT FK_Persona_Sede FOREIGN KEY (IdSede) REFERENCES Sede(IdSede)
);
GO

CREATE TABLE PersonaTelefono (
    IdTelefono INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdPersona INT NOT NULL,
    NumeroTelefono VARCHAR(12) NOT NULL,
    CONSTRAINT FK_PersonaTelefono_Persona FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);
GO

CREATE TABLE PersonaCorreo (
    IdCorreo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdPersona INT NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    CONSTRAINT FK_PersonaCorreo_Persona FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);
GO

-- =============================================================================
-- 2. MODULO DE RECURSOS HUMANOS (EMPLEADOS, HORARIOS, CONTRATOS, PAGOS)
-- =============================================================================

CREATE TABLE Empleado (
    IdEmpleado INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Cargo VARCHAR(30) NOT NULL,
    IdPersona INT NOT NULL,
    CONSTRAINT FK_Empleado_Persona FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);
GO

CREATE TABLE HorarioTrabajo (
    IdHorario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraInicioReceso TIME NOT NULL,
    HoraFinReceso TIME NOT NULL,
    HoraFin TIME NOT NULL,
    DiaSemana VARCHAR(20) NOT NULL CHECK(DiaSemana IN ('lunes','martes','miercoles','miércoles','jueves','viernes','sabado','sábado'))
);
GO

CREATE TABLE EmpleadoHorario (
    IdAsignacion INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdEmpleado INT NOT NULL,
    IdHorario INT NOT NULL,
    CONSTRAINT FK_EmpleadoHorario_Empleado FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado),
    CONSTRAINT FK_EmpleadoHorario_Horario FOREIGN KEY (IdHorario) REFERENCES HorarioTrabajo(IdHorario)
);
GO

CREATE TABLE HorasExtras (
    IdHorasExtras INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdEmpleado INT NOT NULL,
    FechaExtra DATE NOT NULL,
    CantidadDeHoras DECIMAL(4,1) NOT NULL,
    CONSTRAINT FK_HorasExtras_Empleado FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);
GO

CREATE TABLE ContratoEmpleado (
    IdContrato INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FechaContrato DATE NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NULL,
    IdEmpleado INT NOT NULL,
    CONSTRAINT FK_ContratoEmpleado_Empleado FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);
GO

CREATE TABLE PagoEmpleado (
    IdPago INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FechaPago DATETIME NOT NULL,
    MontoPEN DECIMAL(10,2) NOT NULL CHECK (MontoPEN > 0),
    MetodoPago VARCHAR(20) NOT NULL CHECK (MetodoPago IN ('Transferencia', 'Efectivo', 'Tarjeta', 'Yape')),
    NumeroOperacion VARCHAR(40) NOT NULL,
    IdEmpleado INT NOT NULL,
    CONSTRAINT FK_PagoEmpleado_Empleado FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado)
);
GO

-- =============================================================================
-- 3. MODULO DE EQUIPOS Y MANTENIMIENTOS INDUSTRIALES
-- =============================================================================

CREATE TABLE Equipos (
    IdEquipo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    AnioAdquisicion INT NOT NULL,
    Estado VARCHAR(20) NOT NULL CHECK(Estado IN ('Operativo', 'Mantenimiento', 'Malogrado')),
    IdSede INT NOT NULL,
    CONSTRAINT FK_Equipos_Sede FOREIGN KEY (IdSede) REFERENCES Sede(IdSede)
);
GO

CREATE TABLE Mantenimientos (
    IdMantenimiento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdEquipo INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NULL,
    Tipo VARCHAR(20) NOT NULL CHECK(Tipo IN ('Preventivo', 'Correctivo')),
    Descripcion VARCHAR(200) NULL,
    Costo DECIMAL(10,2) NULL,
    CONSTRAINT FK_Mantenimientos_Equipos FOREIGN KEY (IdEquipo) REFERENCES Equipos(IdEquipo)
);
GO

-- =============================================================================
-- 4. MODULO DE PRODUCTOS, ALMACENES E INVENTARIO
-- =============================================================================

CREATE TABLE Producto (
    IdProducto INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
);
GO

CREATE TABLE Plancha (
    IdPlancha INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdProducto INT NOT NULL,
    Alto DECIMAL(5,2) DEFAULT 2.40,
    Ancho DECIMAL(5,2) DEFAULT 1.20,
    Grosor DECIMAL(5,2) NULL,
    Tipo VARCHAR(20) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Plancha_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);
GO

CREATE TABLE Tubo (
    IdTubo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdProducto INT NOT NULL,
    Alto DECIMAL(5,2) NULL,
    Grosor DECIMAL(5,2) NULL,
    Tipo VARCHAR(20) NOT NULL CHECK(Tipo IN ('Circular', 'Cuadrada', 'Cuadrado')),
    Stock INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Tubo_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto)
);
GO

CREATE TABLE Almacen (
    IdAlmacen INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Ubicacion VARCHAR(100) NOT NULL,
    Capacidad INT NOT NULL DEFAULT 1000,
    IdSede INT NOT NULL,
    CONSTRAINT FK_Almacen_Sede FOREIGN KEY (IdSede) REFERENCES Sede(IdSede)
);
GO

CREATE TABLE InventarioProducto (
    IdInventario INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    StockActual INT NOT NULL DEFAULT 0 CHECK (StockActual >= 0),
    StockMinimo INT NOT NULL DEFAULT 1,
    IdAlmacen INT NOT NULL,
    IdProducto INT NOT NULL,
    CONSTRAINT FK_Inventario_Almacen FOREIGN KEY (IdAlmacen) REFERENCES Almacen(IdAlmacen),
    CONSTRAINT FK_Inventario_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
    CONSTRAINT UQ_Almacen_Producto UNIQUE (IdAlmacen, IdProducto)
);
GO

-- =============================================================================
-- 5. MODULO DE PROVEEDORES Y GASTOS OPERATIVOS
-- =============================================================================

CREATE TABLE Proveedor (
    IdProveedor INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    RazonSocial VARCHAR(50) NOT NULL,
    NombreComercial VARCHAR(50) NOT NULL,
    IdentificacionFiscal VARCHAR(50) NOT NULL,
    TipoProveedor VARCHAR(50) NOT NULL
);
GO

CREATE TABLE ContactoProveedor (
    IdContactoProveedor INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdProveedor INT NOT NULL,
    SedeProveedor VARCHAR(50) NOT NULL,
    TelefonoProveedor VARCHAR(12) NOT NULL,
    CorreoProveedor VARCHAR(200) NOT NULL,
    CONSTRAINT FK_ContactoProveedor_Proveedor FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor)
);
GO

CREATE TABLE ContratoProveedor (
    IdContratoProveedor INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    NombreContrato VARCHAR(100) NOT NULL,
    FechaContrato DATE NOT NULL,
    IdProveedor INT NOT NULL,
    CONSTRAINT FK_ContratoProveedor_Proveedor FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor)
);
GO

CREATE TABLE PagoProveedor (
    IdPagoProveedor INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FechaPago DATETIME NOT NULL,
    MontoPEN DECIMAL(10,2) NOT NULL CHECK (MontoPEN > 0),
    MetodoPago VARCHAR(20) NOT NULL CHECK (MetodoPago IN ('Transferencia', 'Efectivo', 'Tarjeta', 'Yape')),
    NumeroOperacion VARCHAR(40) NOT NULL,
    IdProveedor INT NOT NULL,
    CONSTRAINT FK_PagoProveedor_Proveedor FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor)
);
GO

CREATE TABLE Gasto (
    IdGasto INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FechaGasto DATE NOT NULL,
    MontoPENGasto DECIMAL(10,2) NOT NULL CHECK (MontoPENGasto > 0),
    MetodoGasto VARCHAR(20) NOT NULL CHECK (MetodoGasto IN ('Transferencia', 'Efectivo', 'Tarjeta', 'Yape')),
    NumeroOperacion VARCHAR(40) NOT NULL
);
GO

-- =============================================================================
-- 6. MODULO DE CLIENTES, VEHICULOS Y CARROZAS
-- =============================================================================

CREATE TABLE Cliente (
    IdCliente INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdPersona INT NOT NULL,
    RazonSocial VARCHAR(100) NOT NULL,
    ComprasTotales INT NULL DEFAULT 0,
    FechaRegistro DATE NOT NULL,
    CONSTRAINT FK_Cliente_Persona FOREIGN KEY (IdPersona) REFERENCES Persona(IdPersona)
);
GO

CREATE TABLE PagoCliente (
    IdPagoCliente INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FechaPago DATETIME NOT NULL,
    MontoPEN DECIMAL(10,2) NOT NULL CHECK (MontoPEN > 0),
    MetodoPago VARCHAR(20) NOT NULL CHECK (MetodoPago IN ('Transferencia', 'Efectivo', 'Tarjeta', 'Yape')),
    NumeroOperacion VARCHAR(40) NOT NULL,
    IdCliente INT NOT NULL,
    CONSTRAINT FK_PagoCliente_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);
GO

CREATE TABLE ContratoCliente (
    IdContrato INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    IdCliente INT NOT NULL,
    NombreContrato VARCHAR(100) NOT NULL,
    FechaContrato DATE NOT NULL,
    CONSTRAINT FK_ContratoCliente_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);
GO

CREATE TABLE Carro (
    IdCarro INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Placa VARCHAR(10) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Color VARCHAR(50) NOT NULL,
    AnioFabricacion VARCHAR(50) NOT NULL,
    AnioModelo VARCHAR(50) NOT NULL,
    IdCliente INT NOT NULL,
    CONSTRAINT FK_Carro_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);
GO

CREATE TABLE Carrosa (
    IdCarrosa INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    ModeloCarrosa VARCHAR(100) NOT NULL,
    Altura DECIMAL(5,2) NOT NULL,
    Ancho DECIMAL(5,2) NOT NULL,
    Largo DECIMAL(5,2) NOT NULL,
    Color VARCHAR(20) NOT NULL,
    Estado VARCHAR(50) NOT NULL CHECK (Estado IN ('Entregado', 'Mantenimiento', 'Elaboracion', 'Elaboración', 'Terminado', 'Revision', 'Revisión')),
    IdCarro INT NOT NULL,
    CONSTRAINT FK_Carrosa_Carro FOREIGN KEY (IdCarro) REFERENCES Carro(IdCarro)
);
GO
