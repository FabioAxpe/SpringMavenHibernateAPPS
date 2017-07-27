-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-07-2017 a las 14:12:19
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `liga`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociacion`
--

CREATE TABLE `asociacion` (
  `idjugador` int(11) NOT NULL,
  `idequipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asociacion`
--

INSERT INTO `asociacion` (`idjugador`, `idequipo`) VALUES
(13, 10),
(10, 9),
(12, 10),
(9, 11),
(14, 11),
(16, 11),
(18, 9),
(19, 11),
(20, 10),
(21, 10),
(22, 9),
(23, 11),
(24, 10),
(25, 9),
(26, 11),
(27, 24),
(28, 31),
(29, 33),
(30, 35),
(31, 36),
(32, 25),
(33, 38),
(34, 39),
(35, 29),
(36, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre`) VALUES
(8, 'Valencia'),
(9, 'Madrid'),
(10, 'Barcelona'),
(11, 'Athletic'),
(12, 'Celta'),
(19, 'Valencia'),
(21, 'Villareal'),
(22, 'Sevilla'),
(23, 'Real Sociedad'),
(24, 'Malaga'),
(25, 'Racing'),
(26, 'Osasuna'),
(27, 'Levante'),
(28, 'Girona'),
(29, 'Las Palmas'),
(30, 'Getafe'),
(31, 'Rayo'),
(32, 'Leganes'),
(33, 'Cordoba'),
(34, 'Atletico de Madrid'),
(35, 'Deportivo '),
(36, 'Lugo'),
(37, 'Albacete'),
(38, 'Sporting'),
(39, 'Valladolid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `valor` int(11) NOT NULL,
  `posicion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id`, `nombre`, `valor`, `posicion`) VALUES
(9, 'Muniain', 30, 'Medio'),
(10, 'Kroos', 65, 'Medio'),
(12, 'Messi', 100, 'Delantero'),
(13, 'Motta', 25, 'Medio'),
(14, 'Raul Garcia', 60, 'Medio'),
(16, 'Aduriz', 45, 'Delantero'),
(18, 'Casillas', 48, 'Portero'),
(19, 'Kepa', 25, 'Portero'),
(20, 'Valdes', 18, 'Portero'),
(21, 'Pique', 70, 'Defensa'),
(22, 'Ramos', 80, 'Defensa'),
(23, 'Laporte', 80, 'Defensa'),
(24, 'Alba', 75, 'Defensa'),
(25, 'Marcelo', 70, 'Defensa'),
(26, 'Chiellini', 60, 'Defensa'),
(27, 'Alves', 60, 'Defensa'),
(28, 'Iniesta', 80, 'Medio'),
(29, 'Modric', 65, 'Medio'),
(30, 'Isco', 100, 'Medio'),
(31, 'Ceballos', 80, 'Medio'),
(32, 'Cristiano', 90, 'Delantero'),
(33, 'Neymar', 90, 'Delantero'),
(34, 'Suarez', 100, 'Delantero'),
(35, 'Lewandoski', 85, 'Delantero'),
(36, 'Robben', 50, 'Delantero');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asociacion`
--
ALTER TABLE `asociacion`
  ADD KEY `idequipo` (`idequipo`),
  ADD KEY `idjugador` (`idjugador`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asociacion`
--
ALTER TABLE `asociacion`
  ADD CONSTRAINT `asociacion_ibfk_1` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `asociacion_ibfk_2` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
