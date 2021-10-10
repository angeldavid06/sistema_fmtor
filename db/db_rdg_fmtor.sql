-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2021 a las 21:12:51
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_rdg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `id_puesto` int(11) NOT NULL,
  `nombrePuesto` varchar(255) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`id_puesto`, `nombrePuesto`, `id_departamento`) VALUES
(1, 'Taller Mecanico', 4),
(2, 'Mantenimiento', 4),
(3, 'Chofer', 9),
(4, 'Acabado', 8),
(5, 'Rolador', 4),
(6, 'Forjador', 4),
(7, 'Almacenista', 7),
(8, 'Ayudante general', 9),
(9, 'Contadora', 3),
(10, 'Secretaria', 5),
(11, 'Gerente de Calidad', 2),
(12, 'vendedor', 3),
(13, 'Gerente de Produccion', 4),
(14, 'Gerente general', 1),
(15, 'Gerente de Planta', 1),
(16, 'Supervisor', 4),
(17, 'gerente Recursos Humanos', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombreRol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_acabados`
--

CREATE TABLE `t_acabados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `i_e` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_aportacionempresa`
--

CREATE TABLE `t_aportacionempresa` (
  `id_aportacion` int(11) NOT NULL,
  `semana` int(11) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `totalA` int(11) DEFAULT NULL,
  `acumuladoA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_asistencia`
--

CREATE TABLE `t_asistencia` (
  `id_asistencia` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `hora_inicio_comida` time DEFAULT NULL,
  `hora_fin_comida` time DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `hora_extra` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_bitacora`
--

CREATE TABLE `t_bitacora` (
  `id_empleado` int(11) NOT NULL,
  `monto` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipoMovimiento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cajaahorro`
--

CREATE TABLE `t_cajaahorro` (
  `id_cajaAhorro` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `semana` int(11) DEFAULT NULL,
  `totalCA` int(11) DEFAULT NULL,
  `acumuladoCA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_certificados`
--

CREATE TABLE `t_certificados` (
  `id_certificado` int(11) NOT NULL,
  `no_parte` varchar(255) DEFAULT NULL,
  `pedido` varchar(255) DEFAULT NULL,
  `factura` varchar(255) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `med_tornillo` varchar(255) DEFAULT NULL,
  `acabado` varchar(255) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_clientes`
--

CREATE TABLE `t_clientes` (
  `id` int(11) NOT NULL,
  `nip` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `dateadd` datetime DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_control_de_produccion`
--

CREATE TABLE `t_control_de_produccion` (
  `id` int(11) NOT NULL,
  `kilos_acumulados` double DEFAULT NULL,
  `pzas_acumuladas` int(11) DEFAULT NULL,
  `op` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cotizacion`
--

CREATE TABLE `t_cotizacion` (
  `id_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `cantidad_millares` bigint(20) DEFAULT NULL,
  `precio_millar` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_datos_bancarios`
--

CREATE TABLE `t_datos_bancarios` (
  `id_bancarios` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `sueldo_semanal` double DEFAULT NULL,
  `periodo_pago` varchar(255) DEFAULT NULL,
  `clave_interbancaria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_departamento`
--

CREATE TABLE `t_departamento` (
  `id_departamento` int(11) NOT NULL,
  `nom_departamento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_departamento`
--

INSERT INTO `t_departamento` (`id_departamento`, `nom_departamento`) VALUES
(1, 'Gerencia'),
(2, 'Calidad'),
(3, 'Finanzas'),
(4, 'Produccion'),
(5, 'Recursos Humanos'),
(6, 'Ventas'),
(7, 'Almacen'),
(8, 'Seleccion'),
(9, 'Indefinido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_descripcion`
--

CREATE TABLE `t_descripcion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_direccion`
--

CREATE TABLE `t_direccion` (
  `id_empleado` int(11) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `noInt` int(11) DEFAULT NULL,
  `noExt` int(11) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `alcaldia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_empleados`
--

CREATE TABLE `t_empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidoP` varchar(255) DEFAULT NULL,
  `apellidoM` varchar(255) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  `curp` varchar(255) DEFAULT NULL,
  `rfc` varchar(255) DEFAULT NULL,
  `nss` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `id_puesto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_empleados`
--

INSERT INTO `t_empleados` (`id_empleado`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `foto`, `id_puesto`) VALUES
(75, 'ARACELI', 'GONZALEZ', 'MARTINEZ', '0000-00-00', 2147483647, 'araceligonzalezm100@hotmail.com', '2021-07-06', 'GOMA720902MDFNRR06', 'GOMA720902RYA', '2147483647', 'ACTIVA', '', 12),
(76, 'GILBERTO', 'GARCIA', 'ZALDIVAR', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2013-11-11', 'GAZG610204HDFRLL07', 'GAZG6102049Z5', '2147483647', 'ACTIVO', '', 1),
(77, 'JAVIER', 'DE LA ROSA', 'CALZADA', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2017-07-24', 'ROCJ750103HDFSLV01', 'ROCJ75010325A', '2147483647', 'ACTIVO', '', 1),
(78, 'JOSE MIGUEL CUPERTINO', 'MARTINEZ ', 'HERNANDEZ', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2015-07-07', 'MAHM620918HPLRRG07', 'MAHM620918PTA', '2147483647', 'ACTIVO', '', 2),
(79, 'ARNULFO', 'MARQUEZ', 'RICO', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2013-06-13', 'MARA681220HDFRCR05', 'MARA6812206Q1', '2147483647', 'ACTIVO', '', 3),
(80, 'APOLINAR', 'CRUZ', 'GARCIA', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2006-03-01', 'CUGA770105HOCRRP03', 'CUGA770105NA7', '2147483647', 'ACTIVO', '', 4),
(81, 'AGUSTIN', 'ZAVALA', 'CRUZ', '0000-00-00', 2147483647, 'alexisher293@gmail.com', '2019-04-23', 'ZACA700302HDFVRG04', 'ZACA700302FS0', '1887011755', 'ACTIVO', '', 5),
(82, 'ZENEN', 'TELLEZ', 'AVILA', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2015-01-27', 'TEAZ730730HHGLVN05', 'TEAZ730730V40', '2147483647', 'ACTIVO', '', 6),
(83, 'JHONATHAN ANTONIO', 'JIMENEZ', 'CARRILLO', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2019-07-17', 'JICJ830718HDFMRN07', 'JICJ830718KN1', '2147483647', 'ACTIVO', '', 8),
(84, 'PRISCILA', 'MARGARITO', 'LIZARDO', '0000-00-00', 2147483647, 'priscilamargarito117@gmail.com', '2019-03-04', 'MALP001228MDFRZRA7', 'MALP001228A88', '2147483647', 'ACTIVA', '', 7),
(85, 'MARTIN', 'NAVARRO', 'RODRIGUEZ', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2020-01-23', 'NARM631017HDFVDR07', 'NARM631017CA1', '2147483647', 'ACTIVO', '', 6),
(86, 'EDUARDO ALEJANDRO', 'FLORES', 'RAMOS', '0000-00-00', 0, 'alejandrofr546@gmail.com', '2020-06-12', 'FORE940320MDFLMD07', 'FORE940320MM5', '2147483647', 'ACTIVO', '', 8),
(87, 'CAROLINA ', 'REYES', 'ROSAS', '0000-00-00', 2147483647, '', '0000-00-00', 'RERC871031MVZYSR05', 'RERC871031MR7', '2147483647', 'ACTIVA', '', 9),
(88, 'ALAN GUILLERMO', 'ZAVALA', 'LOPEZ', '0000-00-00', 2147483647, 'alanrocklink@hotmail.com', '2021-06-09', 'ZALA920218HDFVPL14', 'ZALA920218FK5', '2147483647', 'ACTIVO', '', 8),
(89, 'GABRIEL', 'CASTAÑEDA', 'GOMORA', '0000-00-00', 0, 'SIN CORREO ELECTRONICO', '2021-06-15', 'CAGG950929HDFSMB04', 'CAGG950929AZ0', '2147483647', 'ACTIVO', '', 8),
(90, 'JUAN LUIS', 'CRISPIN', 'ORTEGA', '0000-00-00', 0, 'SIN CORREO ELECTRONICO', '2021-07-13', 'CIOJ001209HDFRRNA0', 'CIOJ001209T0', '2147483647', 'ACTIVO', '', 8),
(91, 'ERICK MANUEL', 'AGUILAR', 'LUGO', '0000-00-00', 0, 'SIN CORREO ELECTRONICO', '2021-07-13', 'AULE930731HDFGGR01', 'AULE930731RZ4', '2147483647', 'ACTIVO', '', 8),
(92, 'NAYELI BETZABET', 'CALDERON', 'REYES', '0000-00-00', 2147483647, 'nayelibetzabet03@gmail.com', '2021-07-13', 'CARN760803MDFLYY03', 'CARN760803V59', '2147483647', 'ACTIVA', '', 8),
(93, 'RODRIGO', 'MENDOZA', 'HERNANDEZ', '0000-00-00', 0, 'SIN CORREO ELECTRONICO', '2021-07-13', 'MEHR000216HDFNRDA5', 'MEHR0002166N8', '2147483647', 'ACTIVO', '', 8),
(94, 'KEVIN YAEL', 'ZARATE ', 'PRADO', '0000-00-00', 2147483647, 'yaelprado73@gmail.com', '2021-07-13', 'ZAPK020112HDFRRVA6', 'ZAPK020112NR9', '2147483647', 'ACTIVO', '', 8),
(95, 'IVAN', 'CALDERON', 'GUZMAN', '0000-00-00', 0, 'SIN CORREO ELECTRONICO', '2021-07-13', 'CAGI920722HDFLZV09', 'CAGI920722ITA', '2147483647', 'ACTIVO', '', 8),
(96, 'KARLA JAZMIN', 'CRUZ', 'LOPEZ', '0000-00-00', 2147483647, 'cruzlopezkarla201140021@gmail.com', '2021-03-29', 'CULK010203MMCRPRA9', 'CULK010203DD0', '2147483647', 'ACTIVA', '', 13),
(97, 'MIRIEL ANGEL', 'MARES', 'MEDRANO', '0000-00-00', 2147483647, 'angel21mares@gmail.com', '2021-07-13', 'MAMM020321HDFRDRA1', 'MAMM0203211EA', '2147483647', 'ACTIVO', '', 8),
(98, 'XOCHITL', 'QUINTANA', 'ZENTENO', '0000-00-00', 2147483647, 'xochitl.quintana@hotmail.com', '2021-06-21', 'QUZX970821MDFNNC07', 'QUZX970821RA9', '2147483647', 'ACTIVA', '', 10),
(99, 'ABEDEL', 'GARCIA', 'GRANADOS', '0000-00-00', 2147483647, 'abdl13gs@gmail.com', '2021-07-07', 'GAGA910313HDFRRB05', 'GAGA910313R96', '2147483647', 'ACTIVO', '', 11),
(100, 'BERTHA NAYELI', 'HILPAS', 'XIMELLO', '0000-00-00', 2147483647, 'nayelibhilpas@gmail.com', '2021-07-13', 'HIXB960906MMCLMR03', 'HIXB960906M3A', '2147483647', 'ACTIVA', '', 12),
(101, 'CESAR EMILIO', 'CANUL', 'TRUJILLO', '0000-00-00', 2147483647, 'cesarcanultrujillo71@gmail.com', '2021-07-01', 'CATC001229HDFNRSA8', 'CATC001229CGA', '2147483647', 'ACTIVO', '', 8),
(102, 'LUIS AXEL', 'LOPEZ', 'CRESCENCIO', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2021-07-13', 'LOCL010402HMCPRSA4', 'LOCL010402HMC', '2147483647', 'ACTIVO', '', 8),
(103, 'JOSE RITO', 'LARA', 'SIMON', '0000-00-00', 2147483647, 'larasimonj@gmail.com', '2021-06-05', 'LASR920427HCSRMT07', '', '2147483647', 'ACTIVO', '', 8),
(104, 'GUSTAVO', 'CORREA', 'APARICIO', '0000-00-00', 2147483647, 'gustavocorrea7461@gmail.com', '2021-08-01', 'COAG640415HMNRPS05', 'COAG6404156S9', '2147483647', 'ACTIVO', '', 6),
(105, 'FERNANDO MICHAEL', 'ONOFRE', 'CARRILLO', '0000-00-00', 2147483647, 'fernandosegura@email.com', '2021-08-01', 'OOCF861229HDFNRR05', 'OOCF8612229', '2147483647', 'ACTIVO', '', 8),
(106, 'EDGAR', 'TIMOTEO ', 'ROMERO', '0000-00-00', 2147483647, 'edgartimo18@gmail.com', '2021-08-01', 'TIRE980402HMCMMD05', 'TIRE980402QQ9', '1616987578', 'ACTIVO', '', 8),
(107, 'MARCO ANTONIO', 'SANCHEZ', ' APRECIADO ', '0000-00-00', 2147483647, '', '0000-00-00', '', '', '0', 'ACTIVO', '', 3),
(108, 'KATY ARELI', 'GARCÍA', 'VICTORIA', '0000-00-00', 2147483647, 'comprasfmtor@gmail.com', '2021-07-26', 'GAVK990429MDFRCT07', '', '0', 'ACTIVA', '', 10),
(109, 'ESBEYDI PATSY', 'IBAÑEZ', 'TORRES', '0000-00-00', 2147483647, 'patsyt521@gmail.com', '2021-08-24', 'IATE950803MDFBRS09', '', '0', 'ACTIVA', '', 12),
(110, 'RICARDO', 'FLORES', 'APRECIADO', '0000-00-00', 2147483647, 'rdgtornillos@hotmail.com', '2021-02-15', 'FOAR900824HDFLPC03', 'FOAR9008245H0', '0', 'ACTIVO', '', 17),
(111, 'ENRIQUE GERARDO', 'FLORES', 'NAVA', '0000-00-00', 2147483647, 'gerard389@hotmail.com', '1979-01-01', 'FONE680411HDFLVN07', 'FONE580411VC7', '2147483647', 'ACTIVO', '', 14),
(123, 'Nombre', 'dsad', 'dasd', '2021-12-31', 751709239, 'andrewdewitt09@gmail.com', '2021-06-04', 'MEFA970929HDFNLN04', 'k', '42129743466', 'Alicante', NULL, 1),
(124, 'Andre', 'dsad', 'dsad', '2021-11-30', 751709239, 'gringoevangelistadark@gmail.com', '2020-11-30', 'FOBL730715MDFLZZ01', 'k', 'j', 'Alicante', NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_estados`
--

CREATE TABLE `t_estados` (
  `id` int(11) NOT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_estatus`
--

CREATE TABLE `t_estatus` (
  `id_estatus` int(11) NOT NULL,
  `id_presamos` int(11) DEFAULT NULL,
  `id_aportacion` int(11) DEFAULT NULL,
  `id_cajaAhorro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_foto_entrada`
--

CREATE TABLE `t_foto_entrada` (
  `id_foto_entrada` int(11) NOT NULL,
  `foto_entrada` longblob DEFAULT NULL,
  `id_asistencia` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_foto_salida`
--

CREATE TABLE `t_foto_salida` (
  `id_foto_salida` int(11) NOT NULL,
  `foto_salida` longblob DEFAULT NULL,
  `id_asistencia` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_horario`
--

CREATE TABLE `t_horario` (
  `id_horario` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `entrada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `almuerzoS` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `almuerzoR` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `salida` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_material`
--

CREATE TABLE `t_material` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `calibre` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_medida`
--

CREATE TABLE `t_medida` (
  `id` int(11) NOT NULL,
  `espesor` varchar(255) DEFAULT NULL,
  `longitud` varchar(255) DEFAULT NULL,
  `factor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_op`
--

CREATE TABLE `t_op` (
  `op` int(11) NOT NULL,
  `n_pedido` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `codigo_dibujo` varchar(255) DEFAULT NULL,
  `autorizacion` varchar(255) DEFAULT NULL,
  `agente` varchar(255) DEFAULT NULL,
  `id_tornillo` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_orden_de_produccion`
--

CREATE TABLE `t_orden_de_produccion` (
  `op` int(11) NOT NULL,
  `n_pedido` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cantidad` bigint(20) DEFAULT NULL,
  `codigo_dibujo` varchar(255) DEFAULT NULL,
  `autorizacion` varchar(255) DEFAULT NULL,
  `agente` varchar(255) DEFAULT NULL,
  `id_tornillo` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_precios`
--

CREATE TABLE `t_precios` (
  `id` int(11) NOT NULL,
  `precio` float DEFAULT NULL,
  `herramienta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_prestamos`
--

CREATE TABLE `t_prestamos` (
  `id_presamos` int(11) NOT NULL,
  `fechaSolicitud` date DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `interes` int(11) DEFAULT NULL,
  `semana` int(11) DEFAULT NULL,
  `pagos` int(11) DEFAULT NULL,
  `saldo` int(11) DEFAULT NULL,
  `totalP` int(11) DEFAULT NULL,
  `acumuladoP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_prestamospendientes`
--

CREATE TABLE `t_prestamospendientes` (
  `id_prestamoP` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `totalPP` int(11) DEFAULT NULL,
  `acumuladoPP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_registro_diario`
--

CREATE TABLE `t_registro_diario` (
  `id` int(11) NOT NULL,
  `no_maquina` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `botes` int(11) DEFAULT NULL,
  `pzas` int(11) DEFAULT NULL,
  `kilos` double DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `id_control` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_reportes`
--

CREATE TABLE `t_reportes` (
  `id_cliente` int(11) NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `num_parte` int(11) DEFAULT NULL,
  `ub_orden_trab_sufijo` varchar(255) DEFAULT NULL,
  `can_ordenada` int(11) DEFAULT NULL,
  `can_recibida` int(11) DEFAULT NULL,
  `can_abierta` int(11) DEFAULT NULL,
  `recibido_inspeccionado` varchar(255) DEFAULT NULL,
  `costo_unitario` float DEFAULT NULL,
  `monto_extendido` float DEFAULT NULL,
  `op` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_salida_almacen`
--

CREATE TABLE `t_salida_almacen` (
  `fecha` date DEFAULT NULL,
  `parte` varchar(255) DEFAULT NULL,
  `factura` varchar(255) DEFAULT NULL,
  `empaque` varchar(255) DEFAULT NULL,
  `autorizacion` varchar(255) DEFAULT NULL,
  `despacho` varchar(255) DEFAULT NULL,
  `recibido` varchar(255) DEFAULT NULL,
  `op` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_tornillo`
--

CREATE TABLE `t_tornillo` (
  `id` int(11) NOT NULL,
  `id_descripcion` int(11) DEFAULT NULL,
  `id_acabado` int(11) DEFAULT NULL,
  `id_medida` int(11) DEFAULT NULL,
  `id_precio` int(11) DEFAULT NULL,
  `id_material` int(11) DEFAULT NULL,
  `id_ubicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_ubicacion`
--

CREATE TABLE `t_ubicacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuario`
--

CREATE TABLE `t_usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `t_usuario`
--

INSERT INTO `t_usuario` (`id_usuario`, `id_empleado`, `usuario`, `contrasena`) VALUES
(10, 123, 'Andrrewpepito', '$2y$10$c7LBCdCRJvvYwK7ctilMhus5V0Br3Vy8ZkTW4olElJMYEDroMfkxC'),
(11, 124, 'Andrrewpepito', '$2y$10$8Fi3ougni.Y2SouZOLEGk.rd3C6LFhCF1M14U/GpWq6Lkm7x1OtCq');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`id_puesto`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `t_acabados`
--
ALTER TABLE `t_acabados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_aportacionempresa`
--
ALTER TABLE `t_aportacionempresa`
  ADD PRIMARY KEY (`id_aportacion`);

--
-- Indices de la tabla `t_asistencia`
--
ALTER TABLE `t_asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `t_bitacora`
--
ALTER TABLE `t_bitacora`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `t_cajaahorro`
--
ALTER TABLE `t_cajaahorro`
  ADD PRIMARY KEY (`id_cajaAhorro`);

--
-- Indices de la tabla `t_certificados`
--
ALTER TABLE `t_certificados`
  ADD PRIMARY KEY (`id_certificado`);

--
-- Indices de la tabla `t_clientes`
--
ALTER TABLE `t_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_control_de_produccion`
--
ALTER TABLE `t_control_de_produccion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `op` (`op`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `t_cotizacion`
--
ALTER TABLE `t_cotizacion`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `t_datos_bancarios`
--
ALTER TABLE `t_datos_bancarios`
  ADD PRIMARY KEY (`id_bancarios`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `t_departamento`
--
ALTER TABLE `t_departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `t_descripcion`
--
ALTER TABLE `t_descripcion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_direccion`
--
ALTER TABLE `t_direccion`
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `t_empleados`
--
ALTER TABLE `t_empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `id_puesto` (`id_puesto`);

--
-- Indices de la tabla `t_estados`
--
ALTER TABLE `t_estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_estatus`
--
ALTER TABLE `t_estatus`
  ADD PRIMARY KEY (`id_estatus`),
  ADD KEY `id_presamos` (`id_presamos`),
  ADD KEY `id_aportacion` (`id_aportacion`),
  ADD KEY `id_cajaAhorro` (`id_cajaAhorro`);

--
-- Indices de la tabla `t_foto_entrada`
--
ALTER TABLE `t_foto_entrada`
  ADD PRIMARY KEY (`id_foto_entrada`),
  ADD KEY `id_asistencia` (`id_asistencia`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `t_foto_salida`
--
ALTER TABLE `t_foto_salida`
  ADD PRIMARY KEY (`id_foto_salida`),
  ADD KEY `id_asistencia` (`id_asistencia`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `t_horario`
--
ALTER TABLE `t_horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `t_material`
--
ALTER TABLE `t_material`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_medida`
--
ALTER TABLE `t_medida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_op`
--
ALTER TABLE `t_op`
  ADD PRIMARY KEY (`op`),
  ADD KEY `id_tornillo` (`id_tornillo`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `t_orden_de_produccion`
--
ALTER TABLE `t_orden_de_produccion`
  ADD PRIMARY KEY (`op`),
  ADD KEY `id_tornillo` (`id_tornillo`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `t_precios`
--
ALTER TABLE `t_precios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_prestamos`
--
ALTER TABLE `t_prestamos`
  ADD PRIMARY KEY (`id_presamos`);

--
-- Indices de la tabla `t_prestamospendientes`
--
ALTER TABLE `t_prestamospendientes`
  ADD PRIMARY KEY (`id_prestamoP`);

--
-- Indices de la tabla `t_registro_diario`
--
ALTER TABLE `t_registro_diario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_control` (`id_control`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `t_reportes`
--
ALTER TABLE `t_reportes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `op` (`op`);

--
-- Indices de la tabla `t_salida_almacen`
--
ALTER TABLE `t_salida_almacen`
  ADD KEY `op` (`op`);

--
-- Indices de la tabla `t_tornillo`
--
ALTER TABLE `t_tornillo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_descripcion` (`id_descripcion`),
  ADD KEY `id_acabado` (`id_acabado`),
  ADD KEY `id_medida` (`id_medida`),
  ADD KEY `id_precio` (`id_precio`),
  ADD KEY `id_material` (`id_material`),
  ADD KEY `id_ubicacion` (`id_ubicacion`);

--
-- Indices de la tabla `t_ubicacion`
--
ALTER TABLE `t_ubicacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `id_puesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_acabados`
--
ALTER TABLE `t_acabados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_aportacionempresa`
--
ALTER TABLE `t_aportacionempresa`
  MODIFY `id_aportacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_asistencia`
--
ALTER TABLE `t_asistencia`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_bitacora`
--
ALTER TABLE `t_bitacora`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_cajaahorro`
--
ALTER TABLE `t_cajaahorro`
  MODIFY `id_cajaAhorro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_certificados`
--
ALTER TABLE `t_certificados`
  MODIFY `id_certificado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_clientes`
--
ALTER TABLE `t_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_control_de_produccion`
--
ALTER TABLE `t_control_de_produccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_cotizacion`
--
ALTER TABLE `t_cotizacion`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_datos_bancarios`
--
ALTER TABLE `t_datos_bancarios`
  MODIFY `id_bancarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_departamento`
--
ALTER TABLE `t_departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `t_descripcion`
--
ALTER TABLE `t_descripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_empleados`
--
ALTER TABLE `t_empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `t_estados`
--
ALTER TABLE `t_estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_estatus`
--
ALTER TABLE `t_estatus`
  MODIFY `id_estatus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_foto_entrada`
--
ALTER TABLE `t_foto_entrada`
  MODIFY `id_foto_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_foto_salida`
--
ALTER TABLE `t_foto_salida`
  MODIFY `id_foto_salida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_horario`
--
ALTER TABLE `t_horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_material`
--
ALTER TABLE `t_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_medida`
--
ALTER TABLE `t_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_op`
--
ALTER TABLE `t_op`
  MODIFY `op` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_orden_de_produccion`
--
ALTER TABLE `t_orden_de_produccion`
  MODIFY `op` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_precios`
--
ALTER TABLE `t_precios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_prestamos`
--
ALTER TABLE `t_prestamos`
  MODIFY `id_presamos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_prestamospendientes`
--
ALTER TABLE `t_prestamospendientes`
  MODIFY `id_prestamoP` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_registro_diario`
--
ALTER TABLE `t_registro_diario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_reportes`
--
ALTER TABLE `t_reportes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_tornillo`
--
ALTER TABLE `t_tornillo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_ubicacion`
--
ALTER TABLE `t_ubicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD CONSTRAINT `puesto_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `t_departamento` (`id_departamento`);

--
-- Filtros para la tabla `t_asistencia`
--
ALTER TABLE `t_asistencia`
  ADD CONSTRAINT `t_asistencia_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`);

--
-- Filtros para la tabla `t_control_de_produccion`
--
ALTER TABLE `t_control_de_produccion`
  ADD CONSTRAINT `t_control_de_produccion_ibfk_1` FOREIGN KEY (`op`) REFERENCES `t_orden_de_produccion` (`op`),
  ADD CONSTRAINT `t_control_de_produccion_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `t_estados` (`id`);

--
-- Filtros para la tabla `t_datos_bancarios`
--
ALTER TABLE `t_datos_bancarios`
  ADD CONSTRAINT `t_datos_bancarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`),
  ADD CONSTRAINT `t_datos_bancarios_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `t_empleados` (`id_empleado`);

--
-- Filtros para la tabla `t_direccion`
--
ALTER TABLE `t_direccion`
  ADD CONSTRAINT `t_direccion_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `t_empleados` (`id_empleado`);

--
-- Filtros para la tabla `t_empleados`
--
ALTER TABLE `t_empleados`
  ADD CONSTRAINT `t_empleados_ibfk_1` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`);

--
-- Filtros para la tabla `t_estatus`
--
ALTER TABLE `t_estatus`
  ADD CONSTRAINT `t_estatus_ibfk_1` FOREIGN KEY (`id_presamos`) REFERENCES `t_prestamos` (`id_presamos`),
  ADD CONSTRAINT `t_estatus_ibfk_2` FOREIGN KEY (`id_aportacion`) REFERENCES `t_aportacionempresa` (`id_aportacion`),
  ADD CONSTRAINT `t_estatus_ibfk_3` FOREIGN KEY (`id_cajaAhorro`) REFERENCES `t_cajaahorro` (`id_cajaAhorro`);

--
-- Filtros para la tabla `t_foto_entrada`
--
ALTER TABLE `t_foto_entrada`
  ADD CONSTRAINT `t_foto_entrada_ibfk_1` FOREIGN KEY (`id_asistencia`) REFERENCES `t_asistencia` (`id_asistencia`),
  ADD CONSTRAINT `t_foto_entrada_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`);

--
-- Filtros para la tabla `t_foto_salida`
--
ALTER TABLE `t_foto_salida`
  ADD CONSTRAINT `t_foto_salida_ibfk_1` FOREIGN KEY (`id_asistencia`) REFERENCES `t_asistencia` (`id_asistencia`),
  ADD CONSTRAINT `t_foto_salida_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`);

--
-- Filtros para la tabla `t_horario`
--
ALTER TABLE `t_horario`
  ADD CONSTRAINT `t_horario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`);

--
-- Filtros para la tabla `t_op`
--
ALTER TABLE `t_op`
  ADD CONSTRAINT `t_op_ibfk_1` FOREIGN KEY (`id_tornillo`) REFERENCES `t_tornillo` (`id`),
  ADD CONSTRAINT `t_op_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `t_clientes` (`id`);

--
-- Filtros para la tabla `t_orden_de_produccion`
--
ALTER TABLE `t_orden_de_produccion`
  ADD CONSTRAINT `t_orden_de_produccion_ibfk_1` FOREIGN KEY (`id_tornillo`) REFERENCES `t_tornillo` (`id`),
  ADD CONSTRAINT `t_orden_de_produccion_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `t_clientes` (`id`);

--
-- Filtros para la tabla `t_registro_diario`
--
ALTER TABLE `t_registro_diario`
  ADD CONSTRAINT `t_registro_diario_ibfk_1` FOREIGN KEY (`id_control`) REFERENCES `t_control_de_produccion` (`id`),
  ADD CONSTRAINT `t_registro_diario_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `t_estados` (`id`);

--
-- Filtros para la tabla `t_reportes`
--
ALTER TABLE `t_reportes`
  ADD CONSTRAINT `t_reportes_ibfk_1` FOREIGN KEY (`op`) REFERENCES `t_op` (`op`);

--
-- Filtros para la tabla `t_salida_almacen`
--
ALTER TABLE `t_salida_almacen`
  ADD CONSTRAINT `t_salida_almacen_ibfk_1` FOREIGN KEY (`op`) REFERENCES `t_op` (`op`);

--
-- Filtros para la tabla `t_tornillo`
--
ALTER TABLE `t_tornillo`
  ADD CONSTRAINT `t_tornillo_ibfk_1` FOREIGN KEY (`id_descripcion`) REFERENCES `t_descripcion` (`id`),
  ADD CONSTRAINT `t_tornillo_ibfk_2` FOREIGN KEY (`id_acabado`) REFERENCES `t_acabados` (`id`),
  ADD CONSTRAINT `t_tornillo_ibfk_3` FOREIGN KEY (`id_medida`) REFERENCES `t_medida` (`id`),
  ADD CONSTRAINT `t_tornillo_ibfk_4` FOREIGN KEY (`id_precio`) REFERENCES `t_precios` (`id`),
  ADD CONSTRAINT `t_tornillo_ibfk_5` FOREIGN KEY (`id_material`) REFERENCES `t_material` (`id`),
  ADD CONSTRAINT `t_tornillo_ibfk_6` FOREIGN KEY (`id_ubicacion`) REFERENCES `t_ubicacion` (`id`);

--
-- Filtros para la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD CONSTRAINT `t_usuario_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `t_empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
