-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2021 a las 17:30:27
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecopuntodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `dniAdmin` int(15) NOT NULL,
  `nombreAdmin` varchar(30) NOT NULL,
  `apellidoAdmin` varchar(30) NOT NULL,
  `telefonoAdmin` int(30) NOT NULL,
  `direccionAdmin` varchar(15) NOT NULL,
  `correoAdmin` varchar(30) NOT NULL,
  `fechaNacAdmin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adminubicacion`
--

CREATE TABLE `adminubicacion` (
  `dniAdmin` int(15) NOT NULL,
  `ubicacionAdmin` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citaadmin`
--

CREATE TABLE `citaadmin` (
  `dniAdmin` int(15) NOT NULL,
  `codigoCita` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citacliente`
--

CREATE TABLE `citacliente` (
  `dniCliente` int(15) NOT NULL,
  `codigoCita` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citadetalles`
--

CREATE TABLE `citadetalles` (
  `codigoCita` int(15) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `fechaRealizada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citapesospuntos`
--

CREATE TABLE `citapesospuntos` (
  `codigoCita` int(15) NOT NULL,
  `pesoPapel` float NOT NULL,
  `pesoOrganicos` float NOT NULL,
  `pesoPlasticos` float NOT NULL,
  `pesoMetalV` float NOT NULL,
  `puntosObtenidos` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `dniCliente` int(15) NOT NULL,
  `nombreCliente` varchar(30) NOT NULL,
  `apellidoCliente` varchar(30) NOT NULL,
  `telefonoCliente` int(12) NOT NULL,
  `direccionCliente` varchar(30) NOT NULL,
  `correoCliente` varchar(30) NOT NULL,
  `fechaNacCliente` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clienteubicacion`
--

CREATE TABLE `clienteubicacion` (
  `dniCliente` int(15) NOT NULL,
  `ubicacionCliente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecopuntocliente`
--

CREATE TABLE `ecopuntocliente` (
  `dniCliente` int(15) NOT NULL,
  `IMAC` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecopuntodispositivo`
--

CREATE TABLE `ecopuntodispositivo` (
  `IMAC` varchar(30) NOT NULL,
  `pesoTotalesPapel` float NOT NULL,
  `pesoTotalesOrganicos` float NOT NULL,
  `pesoTotalesPlasticos` float NOT NULL,
  `pesoTotalesMetalV` float NOT NULL,
  `pesosTotales` float NOT NULL,
  `fechaActivacion` date NOT NULL,
  `puntosObtenidosTotales` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ecopuntoreciente`
--

CREATE TABLE `ecopuntoreciente` (
  `IMAC` varchar(30) NOT NULL,
  `pesoCensadoPapel` float NOT NULL,
  `pesoCensadoOrganicos` float NOT NULL,
  `pesoCensadoPlasticos` float NOT NULL,
  `pesoCensadoMetalV` float NOT NULL,
  `pesosTotalesCensados` float NOT NULL,
  `puntosObtenidosCensados` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosadmin`
--

CREATE TABLE `usuariosadmin` (
  `dniAdmin` int(30) NOT NULL,
  `contrasenaAdmim` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioscliente`
--

CREATE TABLE `usuarioscliente` (
  `dniUsuarios` int(30) NOT NULL,
  `contrasenaCliente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`dniAdmin`);

--
-- Indices de la tabla `adminubicacion`
--
ALTER TABLE `adminubicacion`
  ADD PRIMARY KEY (`dniAdmin`),
  ADD KEY `dniAdmin` (`dniAdmin`);

--
-- Indices de la tabla `citaadmin`
--
ALTER TABLE `citaadmin`
  ADD PRIMARY KEY (`codigoCita`),
  ADD KEY `codigoCita` (`codigoCita`),
  ADD KEY `dniAdmin` (`dniAdmin`);

--
-- Indices de la tabla `citacliente`
--
ALTER TABLE `citacliente`
  ADD PRIMARY KEY (`codigoCita`),
  ADD KEY `dniCliente` (`dniCliente`),
  ADD KEY `codigoCita` (`codigoCita`);

--
-- Indices de la tabla `citadetalles`
--
ALTER TABLE `citadetalles`
  ADD PRIMARY KEY (`codigoCita`);

--
-- Indices de la tabla `citapesospuntos`
--
ALTER TABLE `citapesospuntos`
  ADD PRIMARY KEY (`codigoCita`),
  ADD KEY `codigoCita` (`codigoCita`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dniCliente`);

--
-- Indices de la tabla `clienteubicacion`
--
ALTER TABLE `clienteubicacion`
  ADD PRIMARY KEY (`dniCliente`),
  ADD KEY `dniCliente` (`dniCliente`);

--
-- Indices de la tabla `ecopuntocliente`
--
ALTER TABLE `ecopuntocliente`
  ADD KEY `dniCliente` (`dniCliente`,`IMAC`),
  ADD KEY `IMAC` (`IMAC`);

--
-- Indices de la tabla `ecopuntodispositivo`
--
ALTER TABLE `ecopuntodispositivo`
  ADD PRIMARY KEY (`IMAC`);

--
-- Indices de la tabla `ecopuntoreciente`
--
ALTER TABLE `ecopuntoreciente`
  ADD PRIMARY KEY (`IMAC`),
  ADD KEY `IMAC` (`IMAC`);

--
-- Indices de la tabla `usuariosadmin`
--
ALTER TABLE `usuariosadmin`
  ADD PRIMARY KEY (`dniAdmin`),
  ADD KEY `dniAdmin` (`dniAdmin`);

--
-- Indices de la tabla `usuarioscliente`
--
ALTER TABLE `usuarioscliente`
  ADD PRIMARY KEY (`dniUsuarios`),
  ADD KEY `dniUsuarios` (`dniUsuarios`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adminubicacion`
--
ALTER TABLE `adminubicacion`
  ADD CONSTRAINT `adminubicacion_ibfk_1` FOREIGN KEY (`dniAdmin`) REFERENCES `administrador` (`dniAdmin`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `citaadmin`
--
ALTER TABLE `citaadmin`
  ADD CONSTRAINT `citaadmin_ibfk_1` FOREIGN KEY (`codigoCita`) REFERENCES `citadetalles` (`codigoCita`) ON UPDATE CASCADE,
  ADD CONSTRAINT `citaadmin_ibfk_2` FOREIGN KEY (`dniAdmin`) REFERENCES `administrador` (`dniAdmin`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `citacliente`
--
ALTER TABLE `citacliente`
  ADD CONSTRAINT `citacliente_ibfk_1` FOREIGN KEY (`dniCliente`) REFERENCES `cliente` (`dniCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `citacliente_ibfk_2` FOREIGN KEY (`codigoCita`) REFERENCES `citadetalles` (`codigoCita`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `citapesospuntos`
--
ALTER TABLE `citapesospuntos`
  ADD CONSTRAINT `citapesospuntos_ibfk_1` FOREIGN KEY (`codigoCita`) REFERENCES `citadetalles` (`codigoCita`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `clienteubicacion`
--
ALTER TABLE `clienteubicacion`
  ADD CONSTRAINT `clienteubicacion_ibfk_1` FOREIGN KEY (`dniCliente`) REFERENCES `cliente` (`dniCliente`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ecopuntocliente`
--
ALTER TABLE `ecopuntocliente`
  ADD CONSTRAINT `ecopuntocliente_ibfk_1` FOREIGN KEY (`dniCliente`) REFERENCES `cliente` (`dniCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ecopuntocliente_ibfk_2` FOREIGN KEY (`IMAC`) REFERENCES `ecopuntodispositivo` (`IMAC`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ecopuntoreciente`
--
ALTER TABLE `ecopuntoreciente`
  ADD CONSTRAINT `ecopuntoreciente_ibfk_1` FOREIGN KEY (`IMAC`) REFERENCES `ecopuntodispositivo` (`IMAC`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariosadmin`
--
ALTER TABLE `usuariosadmin`
  ADD CONSTRAINT `usuariosadmin_ibfk_1` FOREIGN KEY (`dniAdmin`) REFERENCES `administrador` (`dniAdmin`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarioscliente`
--
ALTER TABLE `usuarioscliente`
  ADD CONSTRAINT `usuarioscliente_ibfk_1` FOREIGN KEY (`dniUsuarios`) REFERENCES `cliente` (`dniCliente`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
