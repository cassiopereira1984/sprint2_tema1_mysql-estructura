CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    localidad VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_hora DATETIME NOT NULL,
    tipo_entrega ENUM("domicilio", "recoger") NOT NULL,
    cantidad_productos INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    tipo_producto ENUM("pizza", "hambueguesa", "bebida") NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    imagen VARCHAR(200),
    precio DECIMAL(10,2) NOT NULL
);
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE Pizza (
    id_pizza INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    id_producto INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);
CREATE TABLE Tienda (
    id_tienda INT AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(200) NOT NULL,
    codigo_postal VARCHAR(10) NOT NULL,
    localidad VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL
);
CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    nif VARCHAR(20) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo_trabajo ENUM("cocinero", "repartidor") NOT NULL,
    id_tienda INT,
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda)
);
CREATE TABLE Entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_repartidor INT,
    fecha_hora_entrega DATETIME NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_repartidor) REFERENCES Empleados(id_empleado)
);
