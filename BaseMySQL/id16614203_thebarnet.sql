-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2021 a las 08:58:15
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
-- Estructura de tabla para la tabla `carprod`
--

CREATE TABLE `carprod` (
  `id` int(11) NOT NULL,
  `idCarrito` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritocompras`
--

CREATE TABLE `carritocompras` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaprod`
--

CREATE TABLE `categoriaprod` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categoriaprod`
--

INSERT INTO `categoriaprod` (`id`, `nombre`) VALUES
(1, 'Vinos y espumantes'),
(2, 'Cervezas'),
(3, 'Whiskys'),
(4, 'Sidras'),
(5, 'Bebidas sin alcohol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
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
  `idUsuario` int(11) NOT NULL,
  `total` double NOT NULL,
  `fecha` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `tipoPago` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertaprod`
--

CREATE TABLE `ofertaprod` (
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
  `idUsuario` int(11) NOT NULL,
  `fecha` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `tipoEnvio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `modalidadPago` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id`, `idUsuario`, `fecha`, `total`, `tipoEnvio`, `modalidadPago`, `estado`) VALUES
(1, 1, 'Sun Jun 06 2021 03:53:18', 1500, 'sucursal', 'efectivo', 'pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedprod`
--

CREATE TABLE `pedprod` (
  `id` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precioenvio`
--

CREATE TABLE `precioenvio` (
  `id` int(11) NOT NULL,
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
  `cantidad` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fechaVencimiento` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fotos` varchar(21000) COLLATE utf8_unicode_ci NOT NULL,
  `stockMin` int(11) NOT NULL,
  `stockMax` int(11) NOT NULL,
  `stockActual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `categoria`, `precio`, `cantidad`, `fechaVencimiento`, `fotos`, `stockMin`, `stockMax`, `stockActual`) VALUES
(1, 'Vino Tinto Bravio Malbec', 'Vinos y espumantes', 200, '750 ml', '', 'foto1.png', 40, 80, 55),
(2, 'Pack Cerveza Patagonia Weisse', 'Cerveza', 700, ' 473 ml', '', 'foto1.png', 30, 53, 42),
(6, 'Pack cerveza Schneider ', 'Cerveza', 480, '473 ml', '', 'foto1.png', 72, 120, 98),
(7, 'Sidra Real ', 'Sidras', 250, '750 ml', '', 'foto1.png', 80, 200, 120),
(8, 'Sidra Saenz Birones 1888 ', 'Sidras', 410, '750 ml', '', 'foto1.png', 20, 50, 35),
(9, 'Gaseosa Coca Cola', 'Bebidas sin alcohol', 180, '2,25l', '10/12/2021', 'foto1.png', 250, 400, 300),
(10, 'Gaseosa Sprite', 'Bebidas sin alcohol', 180, '2.25l', '14/12/2021', 'foto1.png', 100, 200, 130),
(11, 'Vino tinto Perro Callejero Blend Malbec ', 'Vinos y espumantes', 560, '750 ml', '', 'foto1.png', 50, 80, 55),
(12, 'Vino La Linda Rose de Malbec', 'Vinos y espumantes', 570, '750 ml', '', 'foto1.png', 80, 150, 100),
(13, 'Champagne Chandon ', 'Vinos y espumantes', 190, '187 ml', '', 'foto1.png', 20, 55, 30),
(14, 'Whiskey Jim Beam', 'Whiskys', 2550, '750 ml', '', 'foto1.png', 30, 55, 35),
(15, 'Pack cerveza Imperial', 'Cerveza', 780, '473 ml', '', 'foto2.png', 54, 80, 60);

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
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `numero` int(11) NOT NULL,
  `fechaVencimiento` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `codSeguridad` int(11) NOT NULL,
  `estaActiva` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadprod`
--

CREATE TABLE `unidadprod` (
  `id` int(11) NOT NULL,
  `nombreClave` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `unidadprod`
--

INSERT INTO `unidadprod` (`id`, `nombreClave`, `nombre`) VALUES
(1, 'ml', 'Mili Litros'),
(2, 'l', 'Litro'),
(3, 'six-pack', 'Six Pack'),
(4, '12u', 'Caja 12 unidades'),
(5, '24u', 'Caja 24 unidades');

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
(3, 'empleado', 'Marcelo', 'Dominguez', 54646, 546467, 'm.dominguez@gmail.com', 'marcelobarnet', 354637, 'Peron 3421', 'Valentin Alsina', 'Buenos Aires', 1822, 'yes'),
(10, 'cliente', 'Sofia', 'García', 789654, 7896547, 'sofia.garcia@gmail.com', 'sofia1765', 56436789, 'Arenales 1200', 'CABA', 'CABA', 1061, 'yes'),
(11, 'cliente', 'Micaela', 'Saez', 12345678, 123456789, 'mica123@gmail.com', '12345', 1234566789, '9 de julio ', 'lanus', 'buenos aires', 1824, 'yes'),
(14, 'cliente', 'Juan', 'Garcia', 346546, 3465468, 'garcia@gmail.com', 'garcia6534', 4856925, 'Santa Fe 1530', 'CABA', 'CABA', 1016, 'yes'),
(19, 'cliente', 'Lionel', 'Battista', 5456463, 2147483647, 'battista@gmail.com', 'lionel', 1144565655, 'Peron 3400', 'Valentín Alsina', 'Buenos Aires', 1822, 'yes'),
(20, 'cliente', 'Luciano', 'Montenegro', 346546, 3465468, 'luciano.montenegro@gmail.com', 'luciano1543', 4856925, 'Santa Fe 1500', 'CABA', 'CABA', 1016, 'yes');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carprod`
--
ALTER TABLE `carprod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCarrito` (`idCarrito`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `categoriaprod`
--
ALTER TABLE `categoriaprod`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idPrecioEnvio` (`idPrecioEnvio`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `ofertaprod`
--
ALTER TABLE `ofertaprod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `pedprod`
--
ALTER TABLE `pedprod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedido` (`idPedido`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `precioenvio`
--
ALTER TABLE `precioenvio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promobanco`
--
ALTER TABLE `promobanco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBanco` (`idBanco`);

--
-- Indices de la tabla `remito`
--
ALTER TABLE `remito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBanco` (`idBanco`);

--
-- Indices de la tabla `unidadprod`
--
ALTER TABLE `unidadprod`
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
-- AUTO_INCREMENT de la tabla `carprod`
--
ALTER TABLE `carprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoriaprod`
--
ALTER TABLE `categoriaprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT de la tabla `ofertaprod`
--
ALTER TABLE `ofertaprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedprod`
--
ALTER TABLE `pedprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precioenvio`
--
ALTER TABLE `precioenvio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- AUTO_INCREMENT de la tabla `unidadprod`
--
ALTER TABLE `unidadprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carprod`
--
ALTER TABLE `carprod`
  ADD CONSTRAINT `carprod_ibfk_1` FOREIGN KEY (`idCarrito`) REFERENCES `carritocompras` (`id`),
  ADD CONSTRAINT `carprod_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD CONSTRAINT `carritocompras_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `envio_ibfk_3` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `envio_ibfk_4` FOREIGN KEY (`idPrecioEnvio`) REFERENCES `precioenvio` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `ofertaprod`
--
ALTER TABLE `ofertaprod`
  ADD CONSTRAINT `ofertaprod_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pedprod`
--
ALTER TABLE `pedprod`
  ADD CONSTRAINT `pedprod_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `pedprod_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `promobanco`
--
ALTER TABLE `promobanco`
  ADD CONSTRAINT `promobanco_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`id`);

--
-- Filtros para la tabla `remito`
--
ALTER TABLE `remito`
  ADD CONSTRAINT `remito_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `remito_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `tarjeta_ibfk_1` FOREIGN KEY (`idBanco`) REFERENCES `banco` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
