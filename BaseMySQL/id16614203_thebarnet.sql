-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2021 a las 04:21:23
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

--
-- Volcado de datos para la tabla `banco`
--

INSERT INTO `banco` (`id`, `nombre`) VALUES
(1, 'ICBC'),
(2, 'BBVA'),
(3, 'Banco Provincia'),
(4, 'Santander Río'),
(6, 'Banco Credicoop'),
(7, 'Banco Supervielle'),
(8, 'Banco Ciudad');

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
-- Estructura de tabla para la tabla `codigotarjeta`
--

CREATE TABLE `codigotarjeta` (
  `numero` int(50) NOT NULL,
  `idTarjeta` int(11) NOT NULL,
  `fechaVencimiento` varchar(50) NOT NULL,
  `codSeguridad` int(11) NOT NULL,
  `estaActiva` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `combo`
--

CREATE TABLE `combo` (
  `id` int(11) NOT NULL,
  `productos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`productos`)),
  `precio` float NOT NULL,
  `fechaInicio` varchar(50) NOT NULL,
  `fechaFin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `combo`
--

INSERT INTO `combo` (`id`, `productos`, `precio`, `fechaInicio`, `fechaFin`) VALUES
(8, '[{\"idProducto\": 7, \"cantidad\": 2}, {\"idProducto\": 10, \"cantidad\": 1}]', 700, '20/7/2021', '30/8/2021');

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

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id`, `idUsuario`, `idPedido`, `idPrecioEnvio`, `precio`, `fecha`, `direccion`, `codigoPostal`, `entregado`) VALUES
(3, 2, 2, 2, 1750, '14-7-2021 0:21:55', 'Mitre 750', 1870, 'no');

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

--
-- Volcado de datos para la tabla `ofertaprod`
--

INSERT INTO `ofertaprod` (`id`, `idProducto`, `nuevoPrecio`, `fechaInicio`, `fechaFin`) VALUES
(1, 2, 200, '28/6/2021', '10/8/2021'),
(2, 1, 250, '30/6/2021', '18/8/2021'),
(4, 9, 150, '30/6/2021', '15/9/2021');

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
(1, 1, 'Sun Jun 06 2021 03:53:18', 1500, 'sucursal', 'efectivo', 'pagado'),
(2, 1, 'Sun Jun 08 2021 03:53:18', 1500, 'sucursal', 'efectivo', 'pagado'),
(3, 1, 'July 4, 2021 23:30:00', 2000, 'sucursal', 'efectivo', 'pagado'),
(4, 1, 'July 4, 2021 23:30:00', 2000, 'sucursal', 'efectivo', 'pagado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedprod`
--

CREATE TABLE `pedprod` (
  `id` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pedprod`
--

INSERT INTO `pedprod` (`id`, `idPedido`, `idProducto`) VALUES
(1, 2, 2),
(2, 2, 6),
(3, 2, 10),
(7, 4, 9),
(8, 4, 10),
(9, 4, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precioenvio`
--

CREATE TABLE `precioenvio` (
  `id` int(11) NOT NULL,
  `localidad` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `precioenvio`
--

INSERT INTO `precioenvio` (`id`, `localidad`, `precio`) VALUES
(1, 'CABA', 100),
(2, 'Avellaneda', 250);

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
(1, 'Vino Tinto Bravio Malbec', 'vinos', 200, '750 ml', '', 'https://jumboargentina.vteximg.com.br/arquivos/ids/206370-750-750/Vino-Uxmal-Bravio-Malbec-X-750-Cc-Vino-Tinto-Uxmal-BravIo-Malbec-750-Cc-1-42768.jpg?v=636383693767200000', 40, 80, 55),
(2, 'Pack Cerveza Patagonia Weisse', 'cervezas', 700, ' 473 ml', '', 'https://statics.dinoonline.com.ar/imagenes/full_600x600_ma/3100659_f.jpg', 30, 53, 42),
(6, 'Pack cerveza Schneider ', 'cervezas', 480, '473 ml', '', 'https://d1on8qs0xdu5jz.cloudfront.net/webapp/images/fotos/b/0000000000/1321_1.jpg', 72, 120, 98),
(9, 'Gaseosa Coca Cola Grande', 'sin_alcohol', 180, '2,25l', '10/12/2021', 'https://www.casa-segal.com/wp-content/uploads/2020/03/coca-cola-225L-almacen-gaseosas-casa-segal-mendoza-600x600.jpg', 250, 400, 300),
(10, 'Gaseosa Sprite Chica', 'sin_alcohol', 180, '600ml', '14/12/2021', 'data:image/jpeg;base64,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', 100, 200, 130),
(11, 'Vino tinto Perro Callejero Blend Malbec ', 'vinos', 560, '750 ml', '', 'https://lh3.googleusercontent.com/proxy/pXrJwfcGQd5WGOy8ITepDZeAuK_CEB08JA-iVEGvP2U7gizaA7LSPa46MDVNp_5ZCXupCsiborh40bdaLAUHz0inAzP6KkRPxZ1Jd-KCYrDQGynq3_nAwueEstIyIhBrCH3gB5KKVRgnsgrBqUvSsFXH', 50, 80, 0),
(12, 'Vino La Linda Rose de Malbec', 'vinos', 570, '750 ml', '', 'https://www.arflina.com/ProductoImagen/gp655/2349.jpg', 80, 150, 100),
(13, 'Champagne Chandon ', 'espumantes', 750, '187 ml', '', 'https://cepadevinos.com/wp-content/uploads/2017/07/Chandon_Extra_Brut_fq58bj.jpg', 20, 55, 30),
(14, 'Whiskey Jim Beam', 'whiskys', 2550, '750 ml', '', 'http://d3ugyf2ht6aenh.cloudfront.net/stores/001/211/660/products/jim-beam-bourbon1-6d38b5f7c045ba2d9f16089984212482-640-0.jpg', 30, 55, 35),
(15, 'Pack cerveza Imperial', 'cervezas', 780, '473 ml', '', 'https://mercanet.com.ar/server/Portal_0019782/img/products/cerveza-imperial-473-ml-sixpack_9310698_xxl.jpg', 54, 80, 60),
(16, 'Lata Cerveza Andes Origen Roja', 'cervezas', 85, '473 ml', '', 'https://elbaronline.com.ar/wp-content/uploads/2021/03/Andes-Roja-473ml.jpg', 2, 28, 3),
(17, 'Lata Cerveza Andes Origen Roja', 'cerveza', 85, '473 ml', '', 'https://elbaronline.com.ar/wp-content/uploads/2021/03/Andes-Roja-473ml.jpg', 2, 28, 3);

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

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id`, `nombre`, `direccion`, `horarios`) VALUES
(1, 'Deposito', 'Cordoba 5653', 'Lunes a sábados de 11 a 21 hs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` int(11) NOT NULL,
  `idBanco` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cuotasSinInteres` int(11) NOT NULL,
  `cuotasConInteres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`id`, `idBanco`, `nombre`, `tipo`, `cuotasSinInteres`, `cuotasConInteres`) VALUES
(6, 1, 'Visa', 'debito', 1, 1),
(7, 2, 'Visa', 'debito', 1, 1),
(8, 3, 'Visa', 'debito', 1, 1),
(9, 4, 'Visa', 'debito', 1, 1),
(10, 6, 'Visa', 'debito', 1, 1),
(11, 7, 'Visa', 'debito', 1, 1),
(12, 8, 'Visa', 'debito', 1, 1),
(13, 1, 'Visa', 'credito', 3, 12),
(14, 2, 'Visa', 'credito', 6, 12),
(15, 3, 'Visa', 'credito', 1, 12),
(16, 4, 'Visa', 'credito', 3, 12),
(17, 6, 'Visa', 'credito', 1, 12),
(18, 7, 'Visa', 'credito', 6, 12),
(19, 8, 'Visa', 'credito', 3, 12),
(20, 1, 'Mastercard', 'debito', 1, 1),
(21, 2, 'Mastercard', 'debito', 1, 1),
(22, 3, 'Mastercard', 'debito', 1, 1),
(23, 4, 'Mastercard', 'debito', 1, 1),
(24, 6, 'Mastercard', 'debito', 1, 1),
(25, 7, 'Mastercard', 'debito', 1, 1),
(26, 8, 'Mastercard', 'debito', 1, 1),
(27, 1, 'Mastercard', 'credito', 3, 18),
(28, 2, 'Mastercard', 'credito', 1, 18),
(29, 3, 'Mastercard', 'credito', 3, 18),
(30, 4, 'Mastercard', 'credito', 1, 18),
(31, 6, 'Mastercard', 'credito', 12, 18),
(32, 7, 'Mastercard', 'credito', 12, 18),
(33, 8, 'Mastercard', 'credito', 3, 18);

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
  `cuit` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
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
(1, 'encargado', 'Micaela', 'Saez', 32874908, '1132874908', 'micaaelasaez@gmail.com', 'micabarnet', 1589928, 'Del Valle Iberlucea 2645', 'Lanús', 'Buenos Aires', 1826, 'yes'),
(2, 'encargado', 'Federico', 'López', 5454534, '54545348', 'fedelopez1492@gmail.com', 'fedebarnet', 1475978, 'Del Valle Iberlucea 2714', 'Lanús', 'Buenos Aires', 1826, 'yes'),
(3, 'empleado', 'Marcelo', 'Dominguez', 54646, '546467', 'm.dominguez@gmail.com', 'marcelobarnet', 354637, 'Peron 3421', 'Valentin Alsina', 'Buenos Aires', 1822, 'yes'),
(10, 'cliente', 'Sofia', 'García', 789654, '7896547', 'sofia.garcia@gmail.com', 'sofia1765', 56436789, 'Arenales 1200', 'CABA', 'CABA', 1061, 'yes'),
(11, 'cliente', 'Micaela', 'Saez', 12345678, '123456789', 'mica123@gmail.com', '12345', 1234566789, '9 de julio ', 'lanus', 'buenos aires', 1824, 'yes'),
(14, 'cliente', 'Juan', 'Garcia', 346546, '3465468', 'garcia@gmail.com', 'garcia6534', 4856925, 'Santa Fe 1530', 'CABA', 'CABA', 1016, 'yes'),
(19, 'cliente', 'Lionel', 'Battista', 5456463, '2147483647', 'battista@gmail.com', 'lionel', 1144565655, 'Peron 3400', 'Valentín Alsina', 'Buenos Aires', 1822, 'yes'),
(21, 'cliente', 'Lautaro', 'Martinez', 35444777, '2147483647', 'l.martinez@gmail.com', '12345', 11, '9 de Julio 888', 'Lanús Este', 'Buenos Aires', 1824, 'yes'),
(22, 'cliente', 'Andrea', 'Martinez', 27483647, '22274836471', 'andrea.m@gmail.com', '12345', 1166558899, '9 de Julio 999', 'Microcentro', 'CABA', 2222, 'yes'),
(23, 'cliente', 'Pablo', 'Perez', 25666777, '24256667771', 'p.perez@gmail.com', '12345', 11, '9 de Julio 124', 'Microcentro', 'CABA', 1010, 'yes'),
(24, 'cliente', 'Luciano', 'Montenegro', 346546, '3465468', 'luciano.montenegro@gmail.com', 'luciano1543', 4856925, 'Santa Fe 1500', 'CABA', 'CABA', 1016, 'yes');

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
-- Indices de la tabla `codigotarjeta`
--
ALTER TABLE `codigotarjeta`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `combo`
--
ALTER TABLE `combo`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT de la tabla `combo`
--
ALTER TABLE `combo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `envio`
--
ALTER TABLE `envio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ofertaprod`
--
ALTER TABLE `ofertaprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedprod`
--
ALTER TABLE `pedprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `precioenvio`
--
ALTER TABLE `precioenvio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `unidadprod`
--
ALTER TABLE `unidadprod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
