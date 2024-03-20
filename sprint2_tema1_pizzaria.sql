-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2024 at 01:02 PM
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
CREATE DATABASE IF NOT EXISTS `creacion tablas pizzaria2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `creacion tablas pizzaria2`;

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
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `id_pizza` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`id_pizza`, `id_categoria`, `id_producto`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 4),
(4, 1, 4),
(5, 1, 4),
(6, 1, 1),
(7, 1, 4),
(8, 1, 4),
(9, 1, 4),
(10, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `tipo_producto` enum('pizza','hambuguesa','bebida') NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id_producto`, `tipo_producto`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'pizza', 'Pizza Margarita', 'Deliciosa pizza con salsa de tomate, mozzarella y albahaca fresca.', 'pizza_margarita.jpg', 10.50),
(2, '', 'Hamburguesa Clásica', 'Jugosa hamburguesa de carne de res con lechuga, tomate y cebolla.', 'hamburguesa_clasica.jpg', 8.75),
(3, 'bebida', 'Refresco de Cola', 'Refresco carbonatado sabor cola.', 'cola.jpg', 2.50),
(4, 'pizza', 'Pizza Pepperoni', 'Pizza con salsa de tomate, mozzarella y rodajas de pepperoni.', 'pizza_pepperoni.jpg', 12.00),
(5, 'bebida', 'Agua Mineral', 'Agua purificada sin gas.', 'agua_mineral.jpg', 1.50),
(6, 'pizza', 'Pizza Margarita', 'Deliciosa pizza con salsa de tomate, mozzarella y albahaca fresca.', 'pizza_margarita.jpg', 10.50),
(7, '', 'Hamburguesa Clásica', 'Jugosa hamburguesa de carne de res con lechuga, tomate y cebolla.', 'hamburguesa_clasica.jpg', 8.75),
(8, 'bebida', 'Refresco de Cola', 'Refresco carbonatado sabor cola.', 'cola.jpg', 2.50),
(9, 'pizza', 'Pizza Pepperoni', 'Pizza con salsa de tomate, mozzarella y rodajas de pepperoni.', 'pizza_pepperoni.jpg', 12.00),
(10, 'bebida', 'Agua Mineral', 'Agua purificada sin gas.', 'agua_mineral.jpg', 1.50);

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
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id_pizza`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

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
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id_pizza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Constraints for table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `pizza_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"creacion tablas pizzaria2\",\"table\":\"detalles\"},{\"db\":\"creacion tablas pizzaria2\",\"table\":\"producto\"},{\"db\":\"creacion tablas pizzaria2\",\"table\":\"pedido\"},{\"db\":\"creacion tablas pizzaria2\",\"table\":\"tienda\"},{\"db\":\"creacion tablas pizzaria2\",\"table\":\"empleado\"},{\"db\":\"creacion tablas pizzaria2\",\"table\":\"entrega\"},{\"db\":\"creacion tablas pizzaria2\",\"table\":\"pizza\"},{\"db\":\"creacion tablas pizzaria2\",\"table\":\"cliente\"},{\"db\":\"creacion tablas pizzaria2\",\"table\":\"categoria\"},{\"db\":\"sprint2_tema1_pizzaria\",\"table\":\"entrega\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'universidad', 'asignatura', '{\"sorted_col\":\"`nombre` ASC\"}', '2024-03-15 14:41:05'),
('root', 'universidad', 'persona', '{\"sorted_col\":\"`persona`.`tipo` ASC\"}', '2024-03-15 16:03:17'),
('root', 'universidad', 'profesor', '{\"sorted_col\":\"`id_profesor` ASC\"}', '2024-03-15 14:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-03-20 10:22:24', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Table structure for table `fabricante`
--

CREATE TABLE `fabricante` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fabricante`
--

INSERT INTO `fabricante` (`codigo`, `nombre`) VALUES
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `codigo` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` double NOT NULL,
  `codigo_fabricante` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES
(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185, 7),
(5, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 'Monitor 24 LED Full HD', 202, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portátil Yoga 520', 559, 2),
(9, 'Portátil Ideapd 320', 444, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigo_fabricante` (`codigo_fabricante`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`codigo_fabricante`) REFERENCES `fabricante` (`codigo`);
--
-- Database: `universidad`
--
CREATE DATABASE IF NOT EXISTS `universidad` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `universidad`;

-- --------------------------------------------------------

--
-- Table structure for table `alumno_se_matricula_asignatura`
--

CREATE TABLE `alumno_se_matricula_asignatura` (
  `id_alumno` int(10) UNSIGNED NOT NULL,
  `id_asignatura` int(10) UNSIGNED NOT NULL,
  `id_curso_escolar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alumno_se_matricula_asignatura`
--

INSERT INTO `alumno_se_matricula_asignatura` (`id_alumno`, `id_asignatura`, `id_curso_escolar`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(19, 1, 5),
(19, 2, 5),
(19, 3, 5),
(19, 4, 5),
(19, 5, 5),
(19, 6, 5),
(19, 7, 5),
(19, 8, 5),
(19, 9, 5),
(19, 10, 5),
(23, 1, 5),
(23, 2, 5),
(23, 3, 5),
(23, 4, 5),
(23, 5, 5),
(23, 6, 5),
(23, 7, 5),
(23, 8, 5),
(23, 9, 5),
(23, 10, 5),
(24, 1, 5),
(24, 2, 5),
(24, 3, 5),
(24, 4, 5),
(24, 5, 5),
(24, 6, 5),
(24, 7, 5),
(24, 8, 5),
(24, 9, 5),
(24, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `asignatura`
--

CREATE TABLE `asignatura` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `creditos` float UNSIGNED NOT NULL,
  `tipo` enum('básica','obligatoria','optativa') NOT NULL,
  `curso` tinyint(3) UNSIGNED NOT NULL,
  `cuatrimestre` tinyint(3) UNSIGNED NOT NULL,
  `id_profesor` int(10) UNSIGNED DEFAULT NULL,
  `id_grado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asignatura`
--

INSERT INTO `asignatura` (`id`, `nombre`, `creditos`, `tipo`, `curso`, `cuatrimestre`, `id_profesor`, `id_grado`) VALUES
(1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4),
(2, 'Cálculo', 6, 'básica', 1, 1, 14, 4),
(3, 'Física para informática', 6, 'básica', 1, 1, 3, 4),
(4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4),
(5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4),
(6, 'Estadística', 6, 'básica', 1, 2, 14, 4),
(7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4),
(8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4),
(9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4),
(10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4),
(11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4),
(12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4),
(13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4),
(14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4),
(15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4),
(16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4),
(17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4),
(18, 'Fundamentos de Redes de Computadores', 6, 'obligatoria', 2, 2, 3, 4),
(19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4),
(20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4),
(21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4),
(22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4),
(23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4),
(25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4),
(26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4),
(27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4),
(28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4),
(29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4),
(30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4),
(31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4),
(32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4),
(33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4),
(34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4),
(35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4),
(36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4),
(37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4),
(38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4),
(39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4),
(40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4),
(41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4),
(42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4),
(43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4),
(44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4),
(45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4),
(46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4),
(47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4),
(48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4),
(49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4),
(50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4),
(51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4),
(52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7),
(53, 'Física', 6, 'básica', 1, 1, NULL, 7),
(54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7),
(55, 'Química general', 6, 'básica', 1, 1, NULL, 7),
(56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7),
(57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7),
(58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7),
(59, 'Genética', 6, 'básica', 1, 2, NULL, 7),
(60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7),
(61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7),
(62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7),
(63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7),
(64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7),
(65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7),
(66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7),
(67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7),
(68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7),
(69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7),
(70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7),
(71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7),
(72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7),
(74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7),
(75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7),
(76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7),
(78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7),
(79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7),
(80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7),
(81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7),
(82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7),
(83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `curso_escolar`
--

CREATE TABLE `curso_escolar` (
  `id` int(10) UNSIGNED NOT NULL,
  `anyo_inicio` year(4) NOT NULL,
  `anyo_fin` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `curso_escolar`
--

INSERT INTO `curso_escolar` (`id`, `anyo_inicio`, `anyo_fin`) VALUES
(1, '2014', '2015'),
(2, '2015', '2016'),
(3, '2016', '2017'),
(4, '2017', '2018'),
(5, '2018', '2019');

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`) VALUES
(1, 'Informática'),
(2, 'Matemáticas'),
(3, 'Economía y Empresa'),
(4, 'Educación'),
(5, 'Agronomía'),
(6, 'Química y Física'),
(7, 'Filología'),
(8, 'Derecho'),
(9, 'Biología y Geología');

-- --------------------------------------------------------

--
-- Table structure for table `grado`
--

CREATE TABLE `grado` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grado`
--

INSERT INTO `grado` (`id`, `nombre`) VALUES
(1, 'Grado en Ingeniería Agrícola (Plan 2015)'),
(2, 'Grado en Ingeniería Eléctrica (Plan 2014)'),
(3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)'),
(4, 'Grado en Ingeniería Informática (Plan 2015)'),
(5, 'Grado en Ingeniería Mecánica (Plan 2010)'),
(6, 'Grado en Ingeniería Química Industrial (Plan 2010)'),
(7, 'Grado en Biotecnología (Plan 2015)'),
(8, 'Grado en Ciencias Ambientales (Plan 2009)'),
(9, 'Grado en Matemáticas (Plan 2010)'),
(10, 'Grado en Química (Plan 2009)');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `id` int(10) UNSIGNED NOT NULL,
  `nif` varchar(9) DEFAULT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `ciudad` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('H','M') NOT NULL,
  `tipo` enum('profesor','alumno') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`id`, `nif`, `nombre`, `apellido1`, `apellido2`, `ciudad`, `direccion`, `telefono`, `fecha_nacimiento`, `sexo`, `tipo`) VALUES
(1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991-03-28', 'H', 'alumno'),
(2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992-08-08', 'H', 'alumno'),
(3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979-08-19', 'M', 'profesor'),
(4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000-10-05', 'H', 'alumno'),
(5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978-01-19', 'H', 'profesor'),
(6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998-01-28', 'H', 'alumno'),
(7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999-05-24', 'H', 'alumno'),
(8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977-08-21', 'M', 'profesor'),
(9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996-11-21', 'H', 'alumno'),
(10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977-05-19', 'M', 'profesor'),
(11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997-04-26', 'H', 'alumno'),
(12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor'),
(13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980-02-01', 'H', 'profesor'),
(14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977-01-02', 'H', 'profesor'),
(15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980-03-14', 'H', 'profesor'),
(16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982-03-18', 'H', 'profesor'),
(17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973-05-05', 'H', 'profesor'),
(18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976-02-25', 'H', 'profesor'),
(19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998-09-01', 'M', 'alumno'),
(20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980-10-31', 'H', 'profesor'),
(21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998-01-01', 'H', 'alumno'),
(22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999-02-11', 'H', 'alumno'),
(23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996-03-12', 'M', 'alumno'),
(24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995-04-13', 'M', 'alumno');

-- --------------------------------------------------------

--
-- Table structure for table `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` int(10) UNSIGNED NOT NULL,
  `id_departamento` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `id_departamento`) VALUES
(3, 1),
(14, 1),
(5, 2),
(15, 2),
(8, 3),
(16, 3),
(10, 4),
(12, 4),
(17, 4),
(18, 5),
(13, 6),
(20, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD PRIMARY KEY (`id_alumno`,`id_asignatura`,`id_curso_escolar`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_curso_escolar` (`id_curso_escolar`);

--
-- Indexes for table `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profesor` (`id_profesor`),
  ADD KEY `id_grado` (`id_grado`);

--
-- Indexes for table `curso_escolar`
--
ALTER TABLE `curso_escolar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- Indexes for table `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `curso_escolar`
--
ALTER TABLE `curso_escolar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `grado`
--
ALTER TABLE `grado`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumno_se_matricula_asignatura`
--
ALTER TABLE `alumno_se_matricula_asignatura`
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id`),
  ADD CONSTRAINT `alumno_se_matricula_asignatura_ibfk_3` FOREIGN KEY (`id_curso_escolar`) REFERENCES `curso_escolar` (`id`);

--
-- Constraints for table `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  ADD CONSTRAINT `asignatura_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`);

--
-- Constraints for table `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `profesor_ibfk_2` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
