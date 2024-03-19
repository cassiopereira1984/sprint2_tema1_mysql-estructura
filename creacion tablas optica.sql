CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fax VARCHAR(20),
    NIF VARCHAR(20) NOT NULL
);

INSERT INTO Proveedores (nombre, direccion, telefono, NIF)
VALUES ('Óptica Visión', 'Calle Mayor', '+34 93 123 4567', '12345678A'),
       ('Gafas Sol', 'Avenida Diagonal','+34 91 987 6543', '87654321B'),
       ('VisionCenter', 'Calle Gran Vía', '+34 96 543 2109', '78901234C'),
       ('LentesDirectas', 'Paseo de la Castellana', '+34 91 654 3210', '34567890D'),
       ('Ver Más Claro', 'Calle Real', '+34 95 678 4321', '90123456E');

CREATE TABLE Gafas (
    id_gafa INT PRIMARY KEY AUTO_INCREMENT,
    id_proveedor INT,
    marca VARCHAR(100) NOT NULL,
    graduacion_cristal VARCHAR(50) NOT NULL,
    tipo_montura ENUM('Metálica', 'Pasta', 'Flotante') NOT NULL,
    color_montura VARCHAR(50) NOT NULL,
    color_cristal VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

INSERT INTO Gafas (id_proveedor, marca, graduacion_cristal, tipo_montura, color_montura, color_cristal, precio)
VALUES (1, 'Ray-Ban', '+2.00', 'Metálica', 'Negro', 'Gris', 150.00),
       (2, 'Prada', '-1.50', 'Pasta', 'Azul', 'Marrón', 180.00),
       (3, 'Oakley', '+1.75', 'Metálica', 'Plateado', 'Transparente', 200.00),
       (4, 'Gucci', '-3.25', 'Pasta', 'Rosa', 'Verde', 220.00),
       (5, 'Dior', '+3.50', 'Metálica', 'Dorado', 'Azul', 250.00);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion_postal VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL,
    id_cliente_recomendador INT,
    FOREIGN KEY (id_cliente_recomendador) REFERENCES Clientes(id_cliente)
);

INSERT INTO Clientes (nombre, direccion_postal, telefono, correo_electronico, fecha_registro, id_cliente_recomendador)
VALUES ('Juan Pérez', 'Calle Gran Vía 123', '+34 678 987 654', 'juan@example.com', '2023-05-15', NULL),
       ('María Gómez', 'Calle Comercial 101', '+34 666 123 456', 'maria@example.com', '2023-06-20', 1),
       ('Luisa Martínez', 'Avenida Libertador 555', '+34 611 987 654', 'luisa@example.com', '2023-07-10', 2),
       ('Pedro Sánchez', 'Carrera 9 #45-50', '+34 622 345 678', 'pedro@example.com', '2023-08-05', 3),
       ('Ana Rodríguez', 'Rua das Flores 78', '+34 633 456 789', 'ana@example.com', '2023-09-30', 4);

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_gafa INT,
    id_cliente INT,
    id_empleado INT,
    fecha_venta DATE NOT NULL,
    FOREIGN KEY (id_gafa) REFERENCES Gafas(id_gafa),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

INSERT INTO Ventas (id_gafa, id_cliente, id_empleado, fecha_venta)
VALUES (1, 1, 1, '2023-06-01'),
       (2, 2, 1, '2023-07-10'),
       (3, 3, 2, '2023-08-15'),
       (4, 4, 3, '2023-09-20'),
       (5, 5, 4, '2023-10-05');

CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO Empleados (nombre)
VALUES ('Carla López'),
       ('Miguel García'),
       ('Elena Fernández'),
       ('Javier Ruiz'),
       ('Laura Martínez');