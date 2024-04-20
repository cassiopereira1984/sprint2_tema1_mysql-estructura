-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2024 at 05:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `creacion tablas pizzaria2`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Pizzas'),
(2, 'Hamburguesas'),
(3, 'Bebidas'),
(4, 'Pizzas'),
(5, 'Bebidas'),
(6, 'Pizzas'),
(7, 'Hamburguesas'),
(8, 'Bebidas'),
(9, 'Pizzas'),
(10, 'Bebidas');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `apellidos`, `direccion`, `codigo_postal`, `localidad`, `provincia`, `telefono`) VALUES
(1, 'Juan', 'García Pérez', 'Calle Principal 123', '28001', 'Madrid', 'Madrid', '123456789'),
(2, 'María', 'Martínez López', 'Avenida Central 456', '08001', 'Barcelona', 'Barcelona', '987654321'),
(3, 'Pedro', 'Sánchez Rodríguez', 'Plaza Mayor 789', '41001', 'Sevilla', 'Sevilla', '654987321'),
(4, 'Laura', 'Gómez Martínez', 'Calle Gran Vía 234', '28004', 'Madrid', 'Madrid', '789654123'),
(5, 'Ana', 'Fernández García', 'Paseo de Gracia 567', '08002', 'Barcelona', 'Barcelona', '321456987');

-- --------------------------------------------------------

--
-- Table structure for table `detalles`
--

CREATE TABLE `detalles` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalles`
--

INSERT INTO `detalles` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`) VALUES
(1, 6, 1, 2),
(2, 6, 4, 1),
(3, 6, 2, 1),
(4, 6, 5, 3),
(5, 7, 3, 3),
(6, 7, 6, 2),
(7, 7, 1, 1),
(8, 8, 2, 2),
(9, 9, 3, 1),
(10, 10, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nif` varchar(15) NOT NULL,
  `telefono` int(15) NOT NULL,
  `funcion` enum('cocinero','repartidor') NOT NULL,
  `id_tienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `nombre`, `apellidos`, `nif`, `telefono`, `funcion`, `id_tienda`) VALUES
(1, 'Pablo', 'Gutiérrez López', '12345678A', 666555444, 'cocinero', 1),
(2, 'Lucía', 'Sánchez Pérez', '87654321B', 677888999, 'repartidor', 2),
(3, 'Carlos', 'Martínez García', '13579246C', 688777666, 'cocinero', 1),
(4, 'Elena', 'Rodríguez Fernández', '98765432D', 699444888, 'repartidor', 2),
(5, 'Sofía', 'López Martínez', '24681357E', 655333222, 'cocinero', 1);

-- --------------------------------------------------------

--
-- Table structure for table `entrega`
--

CREATE TABLE `entrega` (
  `id_entrega` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_hora_entrega` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entrega`
--

INSERT INTO `entrega` (`id_entrega`, `id_pedido`, `id_empleado`, `fecha_hora_entrega`) VALUES
(26, 1, 1, '2024-03-19 12:45:00'),
(27, 2, 2, '2024-03-18 19:15:00'),
(30, 1, 4, '2024-03-16 14:00:00'),
(31, 2, 4, '2024-03-16 14:00:00'),
(32, 1, 5, '2024-03-16 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tienda` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `tipo_entrega` enum('domicilo','recoger') NOT NULL,
  `cantidad_prod` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `id_tienda`, `fecha_hora`, `tipo_entrega`, `cantidad_prod`, `precio`) VALUES
(6, 1, 1, '2024-03-19 12:00:00', 'domicilo', 2, 25.50),
(7, 2, 1, '2024-03-18 18:30:00', 'recoger', 3, 30.75),
(8, 3, 2, '2024-03-17 19:45:00', 'domicilo', 1, 15.25),
(9, 4, 2, '2024-03-16 13:15:00', 'recoger', 2, 20.50),
(10, 5, 1, '2024-03-15 20:00:00', 'domicilo', 4, 45.00);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `tipo_producto` enum('pizza','hambuguesa','bebida') NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoria`, `tipo_producto`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, NULL, 'pizza', 'Pizza Margarita', 'Deliciosa pizza con salsa de tomate, mozzarella y albahaca fresca.', 'pizza_margarita.jpg', 10.50),
(2, NULL, '', 'Hamburguesa Clásica', 'Jugosa hamburguesa de carne de res con lechuga, tomate y cebolla.', 'hamburguesa_clasica.jpg', 8.75),
(3, NULL, 'bebida', 'Refresco de Cola', 'Refresco carbonatado sabor cola.', 'cola.jpg', 2.50),
(4, NULL, 'pizza', 'Pizza Pepperoni', 'Pizza con salsa de tomate, mozzarella y rodajas de pepperoni.', 'pizza_pepperoni.jpg', 12.00),
(5, NULL, 'bebida', 'Agua Mineral', 'Agua purificada sin gas.', 'agua_mineral.jpg', 1.50),
(6, NULL, 'pizza', 'Pizza Margarita', 'Deliciosa pizza con salsa de tomate, mozzarella y albahaca fresca.', 'pizza_margarita.jpg', 10.50),
(7, NULL, '', 'Hamburguesa Clásica', 'Jugosa hamburguesa de carne de res con lechuga, tomate y cebolla.', 'hamburguesa_clasica.jpg', 8.75),
(8, NULL, 'bebida', 'Refresco de Cola', 'Refresco carbonatado sabor cola.', 'cola.jpg', 2.50),
(9, NULL, 'pizza', 'Pizza Pepperoni', 'Pizza con salsa de tomate, mozzarella y rodajas de pepperoni.', 'pizza_pepperoni.jpg', 12.00),
(10, NULL, 'bebida', 'Agua Mineral', 'Agua purificada sin gas.', 'agua_mineral.jpg', 1.50);

-- --------------------------------------------------------

--
-- Table structure for table `tienda`
--

CREATE TABLE `tienda` (
  `id_tienda` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `codigo_postal` int(15) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tienda`
--

INSERT INTO `tienda` (`id_tienda`, `direccion`, `codigo_postal`, `localidad`, `provincia`) VALUES
(1, 'Calle Mayor 1', 28001, 'Madrid', 'Madrid'),
(2, 'Avenida Diagonal 2', 8001, 'Barcelona', 'Barcelona');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_tienda` (`id_tienda`);

--
-- Indexes for table `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id_entrega`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tienda` (`id_tienda`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id_tienda`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id_entrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id_tienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `detalles_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Constraints for table `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`);

--
-- Constraints for table `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_tienda`),
  ADD CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`);

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`);

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `productos` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
