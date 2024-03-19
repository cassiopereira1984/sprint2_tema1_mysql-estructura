-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2024 at 11:33 AM
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
-- Database: `sprint2_tema1_optica2`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion_postal` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_cliente_recomendador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `direccion_postal`, `telefono`, `correo_electronico`, `fecha_registro`, `id_cliente_recomendador`) VALUES
(1, 'Juan Pérez', 'Calle Gran Vía 123', '+34 678 987 654', 'juan@example.com', '2024-03-19 10:26:27', NULL),
(2, 'María Gómez', 'Calle Comercial 101', '+34 666 123 456', 'maria@example.com', '2024-03-19 10:26:27', 1),
(3, 'Luisa Martínez', 'Avenida Libertador 555', '+34 611 987 654', 'luisa@example.com', '2024-03-19 10:26:27', 2),
(4, 'Pedro Sánchez', 'Carrera 9 #45-50', '+34 622 345 678', 'pedro@example.com', '2024-03-19 10:26:27', 3),
(5, 'Ana Rodríguez', 'Rua das Flores 78', '+34 633 456 789', 'ana@example.com', '2024-03-19 10:26:27', 4),
(6, 'Juan Pérez', 'Calle Gran Vía 123', '+34 678 987 654', 'juan@example.com', '2024-03-19 10:26:49', NULL),
(7, 'María Gómez', 'Calle Comercial 101', '+34 666 123 456', 'maria@example.com', '2024-03-19 10:26:49', 1),
(8, 'Luisa Martínez', 'Avenida Libertador 555', '+34 611 987 654', 'luisa@example.com', '2024-03-19 10:26:49', 2),
(9, 'Pedro Sánchez', 'Carrera 9 #45-50', '+34 622 345 678', 'pedro@example.com', '2024-03-19 10:26:49', 3),
(10, 'Ana Rodríguez', 'Rua das Flores 78', '+34 633 456 789', 'ana@example.com', '2024-03-19 10:26:49', 4),
(11, 'Juan Pérez', 'Calle Gran Vía 123', '+34 678 987 654', 'juan@example.com', '2023-05-14 22:00:00', NULL),
(12, 'María Gómez', 'Calle Comercial 101', '+34 666 123 456', 'maria@example.com', '2023-06-19 22:00:00', 1),
(13, 'Luisa Martínez', 'Avenida Libertador 555', '+34 611 987 654', 'luisa@example.com', '2023-07-09 22:00:00', 2),
(14, 'Pedro Sánchez', 'Carrera 9 #45-50', '+34 622 345 678', 'pedro@example.com', '2023-08-04 22:00:00', 3),
(15, 'Ana Rodríguez', 'Rua das Flores 78', '+34 633 456 789', 'ana@example.com', '2023-09-29 22:00:00', 4),
(16, 'Juan Pérez', 'Calle Gran Vía 123', '+34 678 987 654', 'juan@example.com', '2023-05-14 22:00:00', NULL),
(17, 'María Gómez', 'Calle Comercial 101', '+34 666 123 456', 'maria@example.com', '2023-06-19 22:00:00', 1),
(18, 'Luisa Martínez', 'Avenida Libertador 555', '+34 611 987 654', 'luisa@example.com', '2023-07-09 22:00:00', 2),
(19, 'Pedro Sánchez', 'Carrera 9 #45-50', '+34 622 345 678', 'pedro@example.com', '2023-08-04 22:00:00', 3),
(20, 'Ana Rodríguez', 'Rua das Flores 78', '+34 633 456 789', 'ana@example.com', '2023-09-29 22:00:00', 4),
(21, 'Juan Pérez', 'Calle Gran Vía 123', '+34 678 987 654', 'juan@example.com', '2023-05-14 22:00:00', NULL),
(22, 'María Gómez', 'Calle Comercial 101', '+34 666 123 456', 'maria@example.com', '2023-06-19 22:00:00', 1),
(23, 'Luisa Martínez', 'Avenida Libertador 555', '+34 611 987 654', 'luisa@example.com', '2023-07-09 22:00:00', 2),
(24, 'Pedro Sánchez', 'Carrera 9 #45-50', '+34 622 345 678', 'pedro@example.com', '2023-08-04 22:00:00', 3),
(25, 'Ana Rodríguez', 'Rua das Flores 78', '+34 633 456 789', 'ana@example.com', '2023-09-29 22:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`) VALUES
(1, 'Carla López'),
(2, 'Miguel García'),
(3, 'Elena Fernández'),
(4, 'Javier Ruiz'),
(5, 'Laura Martínez'),
(6, 'Carla López'),
(7, 'Miguel García'),
(8, 'Elena Fernández'),
(9, 'Javier Ruiz'),
(10, 'Laura Martínez'),
(11, 'Carla López'),
(12, 'Miguel García'),
(13, 'Elena Fernández'),
(14, 'Javier Ruiz'),
(15, 'Laura Martínez'),
(16, 'Carla López'),
(17, 'Miguel García'),
(18, 'Elena Fernández'),
(19, 'Javier Ruiz'),
(20, 'Laura Martínez');

-- --------------------------------------------------------

--
-- Table structure for table `gafas`
--

CREATE TABLE `gafas` (
  `id_gafa` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `marca` varchar(100) NOT NULL,
  `graduacion_cristal` varchar(50) NOT NULL,
  `tipo_montura` enum('Metálica','Pasta','Flotante') NOT NULL,
  `color_montura` varchar(50) NOT NULL,
  `color_cristal` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gafas`
--

INSERT INTO `gafas` (`id_gafa`, `id_proveedor`, `marca`, `graduacion_cristal`, `tipo_montura`, `color_montura`, `color_cristal`, `precio`) VALUES
(1, 1, 'Ray-Ban', '+2.00', 'Metálica', 'Negro', 'Gris', 150.00),
(2, 2, 'Prada', '-1.50', 'Pasta', 'Azul', 'Marrón', 180.00),
(3, 3, 'Oakley', '+1.75', 'Metálica', 'Plateado', 'Transparente', 200.00),
(4, 4, 'Gucci', '-3.25', 'Pasta', 'Rosa', 'Verde', 220.00),
(5, 5, 'Dior', '+3.50', 'Metálica', 'Dorado', 'Azul', 250.00),
(6, 1, 'Ray-Ban', '+2.00', 'Metálica', 'Negro', 'Gris', 150.00),
(7, 2, 'Prada', '-1.50', 'Pasta', 'Azul', 'Marrón', 180.00),
(8, 3, 'Oakley', '+1.75', 'Metálica', 'Plateado', 'Transparente', 200.00),
(9, 4, 'Gucci', '-3.25', 'Pasta', 'Rosa', 'Verde', 220.00),
(10, 5, 'Dior', '+3.50', 'Metálica', 'Dorado', 'Azul', 250.00),
(11, 1, 'Ray-Ban', '+2.00', 'Metálica', 'Negro', 'Gris', 150.00),
(12, 2, 'Prada', '-1.50', 'Pasta', 'Azul', 'Marrón', 180.00),
(13, 3, 'Oakley', '+1.75', 'Metálica', 'Plateado', 'Transparente', 200.00),
(14, 4, 'Gucci', '-3.25', 'Pasta', 'Rosa', 'Verde', 220.00),
(15, 5, 'Dior', '+3.50', 'Metálica', 'Dorado', 'Azul', 250.00),
(16, 1, 'Ray-Ban', '+2.00', 'Metálica', 'Negro', 'Gris', 150.00),
(17, 2, 'Prada', '-1.50', 'Pasta', 'Azul', 'Marrón', 180.00),
(18, 3, 'Oakley', '+1.75', 'Metálica', 'Plateado', 'Transparente', 200.00),
(19, 4, 'Gucci', '-3.25', 'Pasta', 'Rosa', 'Verde', 220.00),
(20, 5, 'Dior', '+3.50', 'Metálica', 'Dorado', 'Azul', 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `NIF` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `direccion`, `telefono`, `fax`, `NIF`) VALUES
(1, 'Óptica Visión', 'Calle Mayor', '+34 93 123 4567', NULL, '12345678A'),
(2, 'Gafas Sol', 'Avenida Diagonal', '+34 91 987 6543', NULL, '87654321B'),
(3, 'VisionCenter', 'Calle Gran Vía', '+34 96 543 2109', NULL, '78901234C'),
(4, 'LentesDirectas', 'Paseo de la Castellana', '+34 91 654 3210', NULL, '34567890D'),
(5, 'Ver Más Claro', 'Calle Real', '+34 95 678 4321', NULL, '90123456E'),
(6, 'Óptica Visión', 'Calle Mayor', '+34 93 123 4567', NULL, '12345678A'),
(7, 'Gafas Sol', 'Avenida Diagonal', '+34 91 987 6543', NULL, '87654321B'),
(8, 'VisionCenter', 'Calle Gran Vía', '+34 96 543 2109', NULL, '78901234C'),
(9, 'LentesDirectas', 'Paseo de la Castellana', '+34 91 654 3210', NULL, '34567890D'),
(10, 'Ver Más Claro', 'Calle Real', '+34 95 678 4321', NULL, '90123456E'),
(11, 'Óptica Visión', 'Calle Mayor', '+34 93 123 4567', NULL, '12345678A'),
(12, 'Gafas Sol', 'Avenida Diagonal', '+34 91 987 6543', NULL, '87654321B'),
(13, 'VisionCenter', 'Calle Gran Vía', '+34 96 543 2109', NULL, '78901234C'),
(14, 'LentesDirectas', 'Paseo de la Castellana', '+34 91 654 3210', NULL, '34567890D'),
(15, 'Ver Más Claro', 'Calle Real', '+34 95 678 4321', NULL, '90123456E'),
(16, 'Óptica Visión', 'Calle Mayor', '+34 93 123 4567', NULL, '12345678A'),
(17, 'Gafas Sol', 'Avenida Diagonal', '+34 91 987 6543', NULL, '87654321B'),
(18, 'VisionCenter', 'Calle Gran Vía', '+34 96 543 2109', NULL, '78901234C'),
(19, 'LentesDirectas', 'Paseo de la Castellana', '+34 91 654 3210', NULL, '34567890D'),
(20, 'Ver Más Claro', 'Calle Real', '+34 95 678 4321', NULL, '90123456E');

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_gafa` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `fecha_venta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_gafa`, `id_cliente`, `id_empleado`, `fecha_venta`) VALUES
(1, 1, 1, 1, '2023-06-01'),
(2, 2, 2, 1, '2023-07-10'),
(3, 3, 3, 2, '2023-08-15'),
(4, 4, 4, 3, '2023-09-20'),
(5, 5, 5, 4, '2023-10-05'),
(6, 1, 1, 1, '2023-06-01'),
(7, 2, 2, 1, '2023-07-10'),
(8, 3, 3, 2, '2023-08-15'),
(9, 4, 4, 3, '2023-09-20'),
(10, 5, 5, 4, '2023-10-05'),
(11, 1, 1, 1, '2023-06-01'),
(12, 2, 2, 1, '2023-07-10'),
(13, 3, 3, 2, '2023-08-15'),
(14, 4, 4, 3, '2023-09-20'),
(15, 5, 5, 4, '2023-10-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_cliente_recomendador` (`id_cliente_recomendador`);

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indexes for table `gafas`
--
ALTER TABLE `gafas`
  ADD PRIMARY KEY (`id_gafa`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_gafa` (`id_gafa`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gafas`
--
ALTER TABLE `gafas`
  MODIFY `id_gafa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_cliente_recomendador`) REFERENCES `clientes` (`id_cliente`);

--
-- Constraints for table `gafas`
--
ALTER TABLE `gafas`
  ADD CONSTRAINT `gafas_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_gafa`) REFERENCES `gafas` (`id_gafa`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
