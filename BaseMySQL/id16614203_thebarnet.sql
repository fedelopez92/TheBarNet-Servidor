-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2021 a las 01:54:49
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
-- Estructura de tabla para la tabla `combo`
--

CREATE TABLE `combo` (
  `id` int(11) NOT NULL,
  `productos` varchar(900) NOT NULL,
  `precio` float NOT NULL,
  `fechaInicio` varchar(50) NOT NULL,
  `fechaFin` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `combo`
--

INSERT INTO `combo` (`id`, `productos`, `precio`, `fechaInicio`, `fechaFin`, `foto`) VALUES
(2, '[{\"idProducto\": 1, \"cantidad\": 3}, {\"idProducto\":2, \"cantidad\": 2}]', 800, '3/7/2021', '14/9/2021', ''),
(5, '[{\"idProducto\": 6, \"cantidad\": 2}, {\"idProducto\": 9, \"cantidad\": 1}]', 1000, '4/7/2021', '20/8/2021', '');

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
-- AUTO_INCREMENT de la tabla `combo`
--
ALTER TABLE `combo`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
