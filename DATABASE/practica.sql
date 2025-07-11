-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2025 a las 07:19:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `a`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `ID_Cargo` int(11) NOT NULL,
  `Cargo_Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`ID_Cargo`, `Cargo_Nombre`) VALUES
(1, 'Administrador'),
(2, 'Operador'),
(3, 'Supervisor'),
(7, 'tistoker');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casilleros`
--

CREATE TABLE `casilleros` (
  `ID_Casillero` int(11) NOT NULL,
  `Casillero_Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `casilleros`
--

INSERT INTO `casilleros` (`ID_Casillero`, `Casillero_Nombre`, `Direccion`) VALUES
(1, 'Casillero 101', 'Zona 1'),
(2, 'Casillero 102', 'Zona 2'),
(4, 'Casillero 1018', 'Zona 6K');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `Categoria_Nombre` varchar(100) DEFAULT NULL,
  `Categoria_Altura` decimal(10,2) DEFAULT NULL,
  `Categoria_Largo` decimal(10,2) DEFAULT NULL,
  `Categoria_Ancho` decimal(10,2) DEFAULT NULL,
  `Categoria_Peso` decimal(10,2) DEFAULT NULL,
  `Categoria_Piezas` int(11) DEFAULT NULL,
  `Categoria_Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_Categoria`, `Categoria_Nombre`, `Categoria_Altura`, `Categoria_Largo`, `Categoria_Ancho`, `Categoria_Peso`, `Categoria_Piezas`, `Categoria_Precio`) VALUES
(1, 'Electrónica', 15.50, 20.00, 10.00, 1.50, 1, 25.00),
(2, 'Ropa', 10.00, 30.00, 20.00, 2.00, 3, 18.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Cedula_Identidad` varchar(20) NOT NULL,
  `Nombres_Cliente` varchar(100) NOT NULL,
  `Apellidos_Cliente` varchar(100) NOT NULL,
  `Direccion_Cliente` varchar(255) DEFAULT NULL,
  `Telefono_Cliente` varchar(20) DEFAULT NULL,
  `Correo_Cliente` varchar(100) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `ID_Sucursal` int(11) DEFAULT NULL,
  `ID_Casillero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Cedula_Identidad`, `Nombres_Cliente`, `Apellidos_Cliente`, `Direccion_Cliente`, `Telefono_Cliente`, `Correo_Cliente`, `Fecha_Registro`, `ID_Sucursal`, `ID_Casillero`) VALUES
(1, '12345678', 'Juan', 'Pérez', 'Av. Las Palmas 789', '71234567', 'juan.perez@mail.com', '2025-06-25 02:21:56', 4, 2),
(2, '23456789', 'María', 'López', 'Calle 9 #456', '72345678', 'maria.lopez@mail.com', '2025-06-25 02:21:56', 2, 2),
(5, '1234567834', 'kl', 'kjkl', 'SDA', '71234567', 'ASDASD@GMAIL.COM', '2025-06-26 22:47:09', 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courier`
--

CREATE TABLE `courier` (
  `ID_Courier` int(11) NOT NULL,
  `RIF_Courier` varchar(20) NOT NULL,
  `Courier_Nombre` varchar(100) NOT NULL,
  `Courier_Direccion` varchar(255) DEFAULT NULL,
  `Courier_Telefono` varchar(20) DEFAULT NULL,
  `Courier_Correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `courier`
--

INSERT INTO `courier` (`ID_Courier`, `RIF_Courier`, `Courier_Nombre`, `Courier_Direccion`, `Courier_Telefono`, `Courier_Correo`) VALUES
(1, '4334343', 'Sucursal Centro', 'Av. Principal 123', '78945612', 'centro@sucursal.con'),
(2, '4334343', 'Sucursal Norte', 'Calle Secundaria 456', '78912345', 'norte@sucursal.com'),
(6, '4543434', 'Sucursal Centro', 'Av. Principal 123', '78945612', 'cendtro@sucurKsal.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `ID_Envio` int(11) NOT NULL,
  `ID_Manifiesto` int(11) DEFAULT NULL,
  `Servicio_Transporte` varchar(100) DEFAULT NULL,
  `Fecha_Envio` datetime DEFAULT NULL,
  `Fecha_Recepcion` datetime DEFAULT NULL,
  `Estado` enum('En tránsito','Recibido') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`ID_Envio`, `ID_Manifiesto`, `Servicio_Transporte`, `Fecha_Envio`, `Fecha_Recepcion`, `Estado`) VALUES
(1, 1, 'DHL', '2025-06-25 02:21:56', NULL, 'En tránsito'),
(2, 2, 'FedEx', '2025-06-25 02:21:56', '2025-06-25 02:21:56', 'Recibido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados`
--

CREATE TABLE `historial_estados` (
  `ID_Historial` int(11) NOT NULL,
  `ID_Paquete` int(11) DEFAULT NULL,
  `Estado_Anterior` varchar(50) DEFAULT NULL,
  `Estado_Nuevo` varchar(50) DEFAULT NULL,
  `Fecha_Cambio` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_estados`
--

INSERT INTO `historial_estados` (`ID_Historial`, `ID_Paquete`, `Estado_Anterior`, `Estado_Nuevo`, `Fecha_Cambio`) VALUES
(1, 1, 'Entrada', 'Procesado', '2025-06-25 02:21:56'),
(2, 2, 'Procesado', 'Transito', '2025-06-25 02:21:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manifiestos_carga`
--

CREATE TABLE `manifiestos_carga` (
  `ID_Manifiesto` int(11) NOT NULL,
  `ID_Saca` int(11) DEFAULT NULL,
  `Fecha_Creacion` datetime DEFAULT NULL,
  `Aerolinea` varchar(100) DEFAULT NULL,
  `Estado` enum('Generado','Enviado','Verificado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `manifiestos_carga`
--

INSERT INTO `manifiestos_carga` (`ID_Manifiesto`, `ID_Saca`, `Fecha_Creacion`, `Aerolinea`, `Estado`) VALUES
(1, 1, '2025-06-25 02:21:56', 'Avianca', 'Generado'),
(2, 2, '2025-06-25 02:21:56', 'Latam', 'Enviado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `ID_Pago` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Paquete` int(11) DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL,
  `Metodo_Pago` enum('Transferencia','Efectivo') DEFAULT NULL,
  `Fecha_Pago` datetime DEFAULT NULL,
  `Estado` enum('Pendiente','Confirmado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`ID_Pago`, `ID_Cliente`, `ID_Paquete`, `Monto`, `Metodo_Pago`, `Fecha_Pago`, `Estado`) VALUES
(1, 1, 1, 25.00, 'Transferencia', '2025-06-25 02:21:56', 'Confirmado'),
(2, 2, 2, 18.00, 'Efectivo', '2025-06-25 02:21:56', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes`
--

CREATE TABLE `paquetes` (
  `ID_Paquete` int(11) NOT NULL,
  `ID_Prealerta` int(11) DEFAULT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  `ID_Tracking` int(11) DEFAULT NULL,
  `ID_Sucursal` int(11) DEFAULT NULL,
  `ID_Courier` int(11) DEFAULT NULL,
  `Descripcion_Pre` text DEFAULT NULL,
  `Estado_Paquete` enum('Entrada','Procesado','Transito','Fallido','Entregado') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquetes`
--

INSERT INTO `paquetes` (`ID_Paquete`, `ID_Prealerta`, `ID_Usuario`, `ID_Cliente`, `ID_Categoria`, `ID_Tracking`, `ID_Sucursal`, `ID_Courier`, `Descripcion_Pre`, `Estado_Paquete`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 'Smartphone Xiaomi', 'Entrada'),
(2, 2, 2, 2, 2, 2, 2, 2, 'Ropa deportiva', 'Transito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquetes_sacas`
--

CREATE TABLE `paquetes_sacas` (
  `ID_Paquete` int(11) NOT NULL,
  `ID_Saca` int(11) NOT NULL,
  `Fecha_Asignacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paquetes_sacas`
--

INSERT INTO `paquetes_sacas` (`ID_Paquete`, `ID_Saca`, `Fecha_Asignacion`) VALUES
(1, 1, '2025-06-25 02:21:56'),
(2, 2, '2025-06-25 02:21:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prealertas`
--

CREATE TABLE `prealertas` (
  `ID_Prealerta` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Tienda` int(11) DEFAULT NULL,
  `ID_Casillero` int(11) DEFAULT NULL,
  `Tienda_Traking` varchar(100) DEFAULT NULL,
  `Prealerta_Piezas` int(11) DEFAULT NULL,
  `Prealerta_Peso` decimal(10,2) DEFAULT NULL,
  `Prealerta_Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prealertas`
--

INSERT INTO `prealertas` (`ID_Prealerta`, `ID_Cliente`, `ID_Tienda`, `ID_Casillero`, `Tienda_Traking`, `Prealerta_Piezas`, `Prealerta_Peso`, `Prealerta_Descripcion`) VALUES
(1, 1, 1, 1, 'AMZ123456', 1, 1.20, 'Smartphone Xiaomi'),
(2, 2, 2, 2, 'EBY789101', 2, 2.50, 'Ropa deportiva'),
(3, 5, 6, 4, 'ererwerwe', 6, 243.00, 'pasho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `ID_Reporte` int(11) NOT NULL,
  `Fecha_Generado` datetime DEFAULT NULL,
  `Tipo_Reporte` varchar(100) DEFAULT NULL,
  `ID_Usuario` int(11) DEFAULT NULL,
  `Detalles` text DEFAULT NULL,
  `Archivo_Ruta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`ID_Reporte`, `Fecha_Generado`, `Tipo_Reporte`, `ID_Usuario`, `Detalles`, `Archivo_Ruta`) VALUES
(1, '2025-06-25 02:21:56', 'Resumen Diario', 1, 'Reporte generado automáticamente', '/reportes/reporte1.pdf'),
(2, '2025-06-25 02:21:56', 'Estadísticas', 2, 'Paquetes por sucursal', '/reportes/estadisticas.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sacas`
--

CREATE TABLE `sacas` (
  `ID_Saca` int(11) NOT NULL,
  `ID_Sucursal` int(11) DEFAULT NULL,
  `ID_Courier` int(11) DEFAULT NULL,
  `Saca_Total` decimal(10,2) DEFAULT NULL,
  `Saca_Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sacas`
--

INSERT INTO `sacas` (`ID_Saca`, `ID_Sucursal`, `ID_Courier`, `Saca_Total`, `Saca_Descripcion`) VALUES
(1, 1, 1, 120.50, 'Saca semanal del 10/06'),
(2, 2, 1, 85.75, 'Saca semanal del 12/06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `ID_Sucursal` int(11) NOT NULL,
  `RIF_Sucursal` varchar(20) NOT NULL,
  `Sucursal_Nombre` varchar(100) NOT NULL,
  `Sucursal_Direccion` varchar(255) DEFAULT NULL,
  `Sucursal_Telefono` varchar(20) DEFAULT NULL,
  `Sucursal_Correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`ID_Sucursal`, `RIF_Sucursal`, `Sucursal_Nombre`, `Sucursal_Direccion`, `Sucursal_Telefono`, `Sucursal_Correo`) VALUES
(1, '4334343', 'Sucursal Centro', 'Av. Principal 123', '78945612', 'centro@sucursal.com'),
(2, '43443434', 'Sucursal Norte', 'Calle Secundaria 456', '78912345', 'norte@sucursal.com'),
(4, '324', '2342', 'SDFDF', '345435', '3454@GMAIL.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiendas`
--

CREATE TABLE `tiendas` (
  `ID_Tienda` int(11) NOT NULL,
  `Tienda_Nombre` varchar(100) DEFAULT NULL,
  `Tienda_Direccion` varchar(255) DEFAULT NULL,
  `Tienda_Telefono` varchar(20) DEFAULT NULL,
  `Tienda_Correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiendas`
--

INSERT INTO `tiendas` (`ID_Tienda`, `Tienda_Nombre`, `Tienda_Direccion`, `Tienda_Telefono`, `Tienda_Correo`) VALUES
(1, 'Amazon', 'Online', '00000000', 'support@amazon.com'),
(2, 'eBay', 'Online', '11111111', 'support@ebay.com'),
(6, 'onlifans', 'Online', '00000000ll', 'support@onlifans.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tracking`
--

CREATE TABLE `tracking` (
  `ID_Tracking` int(11) NOT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tracking`
--

INSERT INTO `tracking` (`ID_Tracking`, `Estado`) VALUES
(1, 'Recibido'),
(2, 'En tránsito'),
(3, 'Entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Cedula_Identidad` varchar(20) NOT NULL,
  `Nombres_Usuario` varchar(100) NOT NULL,
  `Apellidos_Usuario` varchar(100) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Telefono_Usuario` varchar(20) DEFAULT NULL,
  `Correo_Usuario` varchar(100) DEFAULT NULL,
  `Direccion_Usuario` varchar(255) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `ID_Cargo` int(11) DEFAULT NULL,
  `ID_Sucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `Cedula_Identidad`, `Nombres_Usuario`, `Apellidos_Usuario`, `Username`, `Password`, `Telefono_Usuario`, `Correo_Usuario`, `Direccion_Usuario`, `Fecha_Registro`, `ID_Cargo`, `ID_Sucursal`) VALUES
(1, '34567890', 'Luis', 'Martíneznnn', 'lmartinez', '$2y$10$vOktTe6S4DK5fL4DGqjUn.i/HHu5.RoRdhw5qFrGfhX/esRK2jEIe', '73456789', 'luis.martinez@mail.com', 'Zona Sur', '2025-06-25 02:21:56', 2, 4),
(2, '45678901', 'Ana', 'Gómez', 'agomez', '5678efgh', '74567890', 'ana.gomez@mail.com', 'Zona Norte', '2025-06-25 02:21:56', 2, 2),
(4, '123456784', 'asd', 'Martínez', 'lmartinez344', '$2y$10$YSuUvVwUqoWjQmrld93FnONXVAgYA67I44Op9Mn1RnM0EO6xsmE6O', '5656533', 'sddd@gmail.com', 'sdfsfsd', '2025-06-27 00:40:11', 3, 4),
(5, '12345678', 'Luis', 'Martínez', 'lmartinez3kk', '$2y$10$Ko/cS1J.AV/45ill/mN92OcVt2G2u5omRa2khv6cl3G60E3zNYIxa', '5656533434', 'luis.martikknez@mail.com', 'sdfsfsd', '2025-06-27 01:02:35', 7, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`ID_Cargo`);

--
-- Indices de la tabla `casilleros`
--
ALTER TABLE `casilleros`
  ADD PRIMARY KEY (`ID_Casillero`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD KEY `idx_clientes_sucursal` (`ID_Sucursal`),
  ADD KEY `idx_clientes_casillero` (`ID_Casillero`);

--
-- Indices de la tabla `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`ID_Courier`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`ID_Envio`),
  ADD KEY `ID_Manifiesto` (`ID_Manifiesto`);

--
-- Indices de la tabla `historial_estados`
--
ALTER TABLE `historial_estados`
  ADD PRIMARY KEY (`ID_Historial`),
  ADD KEY `idx_historial_paquete` (`ID_Paquete`);

--
-- Indices de la tabla `manifiestos_carga`
--
ALTER TABLE `manifiestos_carga`
  ADD PRIMARY KEY (`ID_Manifiesto`),
  ADD KEY `ID_Saca` (`ID_Saca`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`ID_Pago`),
  ADD KEY `ID_Paquete` (`ID_Paquete`),
  ADD KEY `idx_pagos_cliente` (`ID_Cliente`);

--
-- Indices de la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD PRIMARY KEY (`ID_Paquete`),
  ADD KEY `ID_Prealerta` (`ID_Prealerta`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Categoria` (`ID_Categoria`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`),
  ADD KEY `ID_Courier` (`ID_Courier`),
  ADD KEY `idx_paquetes_tracking` (`ID_Tracking`),
  ADD KEY `idx_paquetes_cliente` (`ID_Cliente`);

--
-- Indices de la tabla `paquetes_sacas`
--
ALTER TABLE `paquetes_sacas`
  ADD PRIMARY KEY (`ID_Paquete`,`ID_Saca`),
  ADD KEY `ID_Saca` (`ID_Saca`);

--
-- Indices de la tabla `prealertas`
--
ALTER TABLE `prealertas`
  ADD PRIMARY KEY (`ID_Prealerta`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Tienda` (`ID_Tienda`),
  ADD KEY `ID_Casillero` (`ID_Casillero`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`ID_Reporte`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `sacas`
--
ALTER TABLE `sacas`
  ADD PRIMARY KEY (`ID_Saca`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`ID_Sucursal`);

--
-- Indices de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`ID_Tienda`);

--
-- Indices de la tabla `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`ID_Tracking`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD KEY `ID_Cargo` (`ID_Cargo`),
  ADD KEY `ID_Sucursal` (`ID_Sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `ID_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `casilleros`
--
ALTER TABLE `casilleros`
  MODIFY `ID_Casillero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `courier`
--
ALTER TABLE `courier`
  MODIFY `ID_Courier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `ID_Envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historial_estados`
--
ALTER TABLE `historial_estados`
  MODIFY `ID_Historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `manifiestos_carga`
--
ALTER TABLE `manifiestos_carga`
  MODIFY `ID_Manifiesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `ID_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `paquetes`
  MODIFY `ID_Paquete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `prealertas`
--
ALTER TABLE `prealertas`
  MODIFY `ID_Prealerta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `ID_Reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sacas`
--
ALTER TABLE `sacas`
  MODIFY `ID_Saca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `ID_Sucursal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tiendas`
--
ALTER TABLE `tiendas`
  MODIFY `ID_Tienda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tracking`
--
ALTER TABLE `tracking`
  MODIFY `ID_Tracking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`),
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`ID_Casillero`) REFERENCES `casilleros` (`ID_Casillero`);

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`ID_Manifiesto`) REFERENCES `manifiestos_carga` (`ID_Manifiesto`);

--
-- Filtros para la tabla `historial_estados`
--
ALTER TABLE `historial_estados`
  ADD CONSTRAINT `historial_estados_ibfk_1` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquetes` (`ID_Paquete`);

--
-- Filtros para la tabla `manifiestos_carga`
--
ALTER TABLE `manifiestos_carga`
  ADD CONSTRAINT `manifiestos_carga_ibfk_1` FOREIGN KEY (`ID_Saca`) REFERENCES `sacas` (`ID_Saca`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquetes` (`ID_Paquete`);

--
-- Filtros para la tabla `paquetes`
--
ALTER TABLE `paquetes`
  ADD CONSTRAINT `paquetes_ibfk_1` FOREIGN KEY (`ID_Prealerta`) REFERENCES `prealertas` (`ID_Prealerta`),
  ADD CONSTRAINT `paquetes_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`),
  ADD CONSTRAINT `paquetes_ibfk_3` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `paquetes_ibfk_4` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`),
  ADD CONSTRAINT `paquetes_ibfk_5` FOREIGN KEY (`ID_Tracking`) REFERENCES `tracking` (`ID_Tracking`),
  ADD CONSTRAINT `paquetes_ibfk_6` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`);

--
-- Filtros para la tabla `paquetes_sacas`
--
ALTER TABLE `paquetes_sacas`
  ADD CONSTRAINT `paquetes_sacas_ibfk_1` FOREIGN KEY (`ID_Paquete`) REFERENCES `paquetes` (`ID_Paquete`),
  ADD CONSTRAINT `paquetes_sacas_ibfk_2` FOREIGN KEY (`ID_Saca`) REFERENCES `sacas` (`ID_Saca`);

--
-- Filtros para la tabla `prealertas`
--
ALTER TABLE `prealertas`
  ADD CONSTRAINT `prealertas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `prealertas_ibfk_2` FOREIGN KEY (`ID_Tienda`) REFERENCES `tiendas` (`ID_Tienda`),
  ADD CONSTRAINT `prealertas_ibfk_3` FOREIGN KEY (`ID_Casillero`) REFERENCES `casilleros` (`ID_Casillero`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_Cargo`) REFERENCES `cargos` (`ID_Cargo`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_Sucursal`) REFERENCES `sucursales` (`ID_Sucursal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
