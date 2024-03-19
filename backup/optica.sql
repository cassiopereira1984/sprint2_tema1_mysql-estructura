-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2024 at 10:45 AM
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
-- Database: `optica`
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
  `fecha_registro` date NOT NULL,
  `id_cliente_recomendador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `direccion_postal`, `telefono`, `correo_electronico`, `fecha_registro`, `id_cliente_recomendador`) VALUES
(1, 'Juan Pérez', 'Calle Gran Vía 123', '+34 678 987 654', 'juan@example.com', '2023-05-15', NULL),
(2, 'María Gómez', 'Calle Comercial 101', '+34 666 123 456', 'maria@example.com', '2023-06-20', 1);

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
(1, 'Carlos Martínez'),
(2, 'Laura González');

-- --------------------------------------------------------

--
-- Table structure for table `gafas`
--

CREATE TABLE `gafas` (
  `id_gafa` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `marca` varchar(100) NOT NULL,
  `graduacion_cristal` varchar(50) NOT NULL,
  `tipo_montura` varchar(50) NOT NULL,
  `color_montura` varchar(50) NOT NULL,
  `color_cristal` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gafas`
--

INSERT INTO `gafas` (`id_gafa`, `id_proveedor`, `marca`, `graduacion_cristal`, `tipo_montura`, `color_montura`, `color_cristal`, `precio`) VALUES
(1, 1, 'Ray-Ban', '+2.00', 'Metálica', 'Negro', 'Gris', 150.00),
(2, 2, 'Prada', '-1.50', 'Pasta', 'Azul', 'Marrón', 180.00);

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion_calle` varchar(100) NOT NULL,
  `direccion_numero` varchar(10) NOT NULL,
  `direccion_piso` varchar(10) DEFAULT NULL,
  `direccion_puerta` varchar(10) DEFAULT NULL,
  `direccion_ciudad` varchar(50) NOT NULL,
  `direccion_codigopostal` varchar(10) NOT NULL,
  `direccion_pais` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `NIF` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `direccion_calle`, `direccion_numero`, `direccion_piso`, `direccion_puerta`, `direccion_ciudad`, `direccion_codigopostal`, `direccion_pais`, `telefono`, `fax`, `NIF`) VALUES
(1, 'Óptica Visión', 'Calle Mayor', '123', NULL, NULL, 'Barcelona', '08001', 'España', '+34 93 123 4567', NULL, '12345678A'),
(2, 'Gafas Sol', 'Avenida Diagonal', '456', NULL, NULL, 'Madrid', '28001', 'España', '+34 91 987 6543', NULL, '87654321B');

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
(2, 2, 2, 1, '2023-07-10');

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
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gafas`
--
ALTER TABLE `gafas`
  MODIFY `id_gafa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
