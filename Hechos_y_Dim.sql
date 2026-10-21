Use MaquipesaEIRL
GO

CREATE TABLE dim_tiempo (
    id_tiempo INT PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes INT,
    trimestre INT,
    año INT,
    dia_semana VARCHAR(20),
    semana_año INT
);

CREATE TABLE dim_producto (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(150),
    tipo_producto VARCHAR(50),
    categoria_producto VARCHAR(50),
    precio_unitario DECIMAL(18,2),
    stock_minimo INT
);

CREATE TABLE dim_tienda (
    id_tienda INT PRIMARY KEY,
    nombre_tienda VARCHAR(100),
    direccion VARCHAR(200),
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    region VARCHAR(100),
    gerente VARCHAR(150)
);

CREATE TABLE dim_cliente (
    id_cliente INT PRIMARY KEY,
    nombre_completo VARCHAR(150),
    apellidos_cliente VARCHAR(150),
    direccion VARCHAR(200),
    ciudad VARCHAR(100),
    pais VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE dim_empleado (
    id_empleado INT PRIMARY KEY,
    nombre_completo VARCHAR(150),
    apellidos_empleado VARCHAR(150),
    cargo VARCHAR(100),
    fecha_contratacion DATE,
    salario DECIMAL(18,2)
);


CREATE TABLE hechos_ventas (
    id_venta INT PRIMARY KEY,
    id_tiempo INT,
    id_producto INT,
    id_cliente INT,
    id_tienda INT,
    id_empleado INT,
    total_venta DECIMAL(18,2),
    cantidad INT,
    FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),
    FOREIGN KEY (id_producto) REFERENCES dim_producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES dim_cliente(id_cliente),
    FOREIGN KEY (id_tienda) REFERENCES dim_tienda(id_tienda),
    FOREIGN KEY (id_empleado) REFERENCES dim_empleado(id_empleado)
);


CREATE TABLE dim_fecha (
    id_fecha INT PRIMARY KEY,
    fecha DATE,
    mes INT,
    año INT,
    quarter INT
);

CREATE TABLE dim_articulo (
    id_articulo INT PRIMARY KEY,
    nombre_articulo VARCHAR(150),
    tipo_articulo VARCHAR(50),
    categoria_articulo VARCHAR(50),
    stock_minimo INT
);

CREATE TABLE dim_tipo_movimiento (
    id_tipo_movimiento INT PRIMARY KEY,
    nombre_tipo_movimiento VARCHAR(100),
    descripcion_tipo VARCHAR(255)
);

CREATE TABLE dim_almacen (
    id_almacen INT PRIMARY KEY,
    nombre_almacen VARCHAR(100),
    ubicacion VARCHAR(200),
    capacidad_total INT
);

CREATE TABLE dim_proveedor (
    id_proveedor INT PRIMARY KEY,
    nombre_proveedor VARCHAR(150),
    contacto_principal VARCHAR(150),
    telefono VARCHAR(20)
);

-- TABLA DE HECHOS
CREATE TABLE hechos_movimientos (
    id_movimiento INT PRIMARY KEY,
    id_fecha INT,
    id_almacen INT,
    id_articulo INT,
    id_proveedor INT,
    id_tipo_movimiento INT,
    FOREIGN KEY (id_fecha) REFERENCES dim_fecha(id_fecha),
    FOREIGN KEY (id_almacen) REFERENCES dim_almacen(id_almacen),
    FOREIGN KEY (id_articulo) REFERENCES dim_articulo(id_articulo),
    FOREIGN KEY (id_proveedor) REFERENCES dim_proveedor(id_proveedor),
    FOREIGN KEY (id_tipo_movimiento) REFERENCES dim_tipo_movimiento(id_tipo_movimiento)
);


CREATE TABLE dim_fecha_apertura (
    id_fecha_apertura INT PRIMARY KEY,
    fecha_completa DATE,
    dia INT,
    semana INT,
    mes INT,
    trimestre INT,
    año INT
);

CREATE TABLE dim_usuario (
    id_usuario INT PRIMARY KEY,
    nombre_usuario VARCHAR(150),
    correo VARCHAR(100),
    departamento VARCHAR(100),
    ubicacion VARCHAR(200)
);

CREATE TABLE dim_agente (
    id_agente INT PRIMARY KEY,
    nombre_agente VARCHAR(150),
    nivel VARCHAR(50),
    equipo_soporte VARCHAR(100)
);

CREATE TABLE dim_servicio (
    id_servicio INT PRIMARY KEY,
    nombre_servicio VARCHAR(100),
    categoria VARCHAR(100),
    subcategoria VARCHAR(100)
);

CREATE TABLE dim_prioridad (
    id_prioridad INT PRIMARY KEY,
    nivel_prioridad VARCHAR(50),
    descripcion VARCHAR(255)
);

CREATE TABLE hechos_tickets (
    id_ticket INT PRIMARY KEY,
    id_fecha_apertura INT,
    id_usuario INT,
    id_agente INT,
    id_servicio INT,
    id_prioridad INT,
 
    tiempo_resolucion INT, 
    tiempo_respuesta INT,
    valoracion_satisfaccion DECIMAL(5,2),
    FOREIGN KEY (id_fecha_apertura) REFERENCES dim_fecha_apertura(id_fecha_apertura),
    FOREIGN KEY (id_usuario) REFERENCES dim_usuario(id_usuario),
    FOREIGN KEY (id_agente) REFERENCES dim_agente(id_agente),
    FOREIGN KEY (id_servicio) REFERENCES dim_servicio(id_servicio),
    FOREIGN KEY (id_prioridad) REFERENCES dim_prioridad(id_prioridad)
);