-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2021 a las 03:16:43
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id16614203_thebarnet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritocompras`
--

CREATE TABLE `carritocompras` (
  `id` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idPrecioEnvio` int(11) NOT NULL,
  `precio` double NOT NULL,
  `fecha` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `codigoPostal` int(11) NOT NULL,
  `entregado` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `tipoPago` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertaproducto`
--

CREATE TABLE `ofertaproducto` (
  `id` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `nuevoPrecio` double NOT NULL,
  `fechaInicio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fechaFin` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fecha` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `tipoEnvio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `modalidadPago` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precioenvio`
--

CREATE TABLE `precioenvio` (
  `idPrecio` int(11) NOT NULL,
  `barrio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `categoria` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `fechaVencimiento` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fotos` varchar(21000) COLLATE utf8_unicode_ci NOT NULL,
  `stockMin` int(11) NOT NULL,
  `stockMax` int(11) NOT NULL,
  `stockActual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promobanco`
--

CREATE TABLE `promobanco` (
  `id` int(11) NOT NULL,
  `idBanco` int(11) NOT NULL,
  `descuento` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fechaInicio` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fechaFin` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remito`
--

CREATE TABLE `remito` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `fecha` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `recibidoPorCliente` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `horarios` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` int(11) NOT NULL,
  `idBanco` int(11) NOT NULL,
  `nombreCliente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `estaActiva` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dni` int(11) NOT NULL,
  `cuit` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `localidad` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `provincia` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `codigoPostal` int(11) NOT NULL,
  `confiable` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `tipo`, `nombre`, `apellido`, `dni`, `cuit`, `email`, `password`, `telefono`, `direccion`, `localidad`, `provincia`, `codigoPostal`, `confiable`) VALUES
(1, 'encargado', 'Micaela', 'Saez', 3287490, 32874908, 'micaaelasaez@gmail.com', 'micabarnet', 1589928, 'Del Valle Iberlucea 2645', 'Lanús', 'Buenos Aires', 1826, 'yes'),
(2, 'encargado', 'Federico', 'López', 5454534, 54545348, 'fedelopez1492@gmail.com', 'fedebarnet', 1475978, 'Del Valle Iberlucea 2714', 'Lanús', 'Buenos Aires', 1826, 'yes'),
(3, 'empleado', 'Marcelo', 'Dominguez', 54646, 546467, 'm.dominguez@gmail.com', 'marcelobarnet', 354637, 'Peron 3421', 'Valentin Alsina', 'Buenos Aires', 1822, 'yes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ofertaproducto`
--
ALTER TABLE `ofertaproducto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `precioenvio`
--
ALTER TABLE `precioenvio`
  ADD PRIMARY KEY (`idPrecio`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promobanco`
--
ALTER TABLE `promobanco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remito`
--
ALTER TABLE `remito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ofertaproducto`
--
ALTER TABLE `ofertaproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precioenvio`
--
ALTER TABLE `precioenvio`
  MODIFY `idPrecio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promobanco`
--
ALTER TABLE `promobanco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `remito`
--
ALTER TABLE `remito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
