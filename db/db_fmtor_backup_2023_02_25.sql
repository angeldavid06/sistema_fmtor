-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2023 a las 00:39:56
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_fmtor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidad`
--

CREATE TABLE `cantidad` (
  `id_cantidad` int(11) NOT NULL,
  `inventario_inicial` int(11) DEFAULT NULL,
  `inventario_final` int(11) DEFAULT NULL,
  `precio_por_milla` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterio_inspeccion`
--

CREATE TABLE `criterio_inspeccion` (
  `id_criterio_inspeccion` int(11) NOT NULL,
  `nom_criterio` varchar(60) DEFAULT NULL,
  `estado_funcionalidad` int(11) DEFAULT NULL,
  `id_maquina_1` int(11) DEFAULT NULL,
  `id_mantenimiento_preventivo_1` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

CREATE TABLE `foto` (
  `id_foto` int(11) NOT NULL,
  `foto` blob DEFAULT NULL,
  `id_criterio_inspeccion_1` int(11) DEFAULT NULL,
  `id_material_empleado_1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_mantenimiento`
--

CREATE TABLE `inventario_mantenimiento` (
  `id_producto` int(11) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `medida` varchar(20) DEFAULT NULL,
  `cantidad_pieza` char(10) DEFAULT NULL,
  `cantidad_kilo` char(10) DEFAULT NULL,
  `id_localizacion_1` int(11) DEFAULT NULL,
  `id_cantidad_1` int(11) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `id_mes_1` int(11) DEFAULT NULL,
  `total_ocupado` int(11) DEFAULT NULL,
  `compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_mensual`
--

CREATE TABLE `inventario_mensual` (
  `id_mes` int(11) NOT NULL,
  `nom_mes` char(15) DEFAULT NULL,
  `no_inv_mes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizacion_inventario`
--

CREATE TABLE `localizacion_inventario` (
  `id_localizacion` int(11) NOT NULL,
  `anaquel` int(11) DEFAULT NULL,
  `no_caja_fila` varchar(20) DEFAULT NULL,
  `no_cajas_rollos` int(11) DEFAULT NULL,
  `no_cliente_proveedor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiemto_correctivo`
--

CREATE TABLE `mantenimiemto_correctivo` (
  `id_mantenimiento_co` varchar(30) NOT NULL,
  `nombre_maquina` varchar(50) DEFAULT NULL,
  `fecha_aprobacion` date DEFAULT NULL,
  `version` varchar(15) DEFAULT NULL,
  `solicitado_por` char(50) DEFAULT NULL,
  `autorizado_por` char(50) DEFAULT NULL,
  `prioridad` tinyint(1) DEFAULT NULL,
  `anomalia` text DEFAULT NULL,
  `causa_amomalia` text DEFAULT NULL,
  `solucion` text DEFAULT NULL,
  `id_maquina_1` int(11) DEFAULT NULL,
  `autorizacion` varchar(50) DEFAULT NULL,
  `realizado_por` char(50) DEFAULT NULL,
  `aprobado_por` char(50) DEFAULT NULL,
  `liberado_por` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento_preventivo`
--

CREATE TABLE `mantenimiento_preventivo` (
  `id_mantenimiento_preventivo` varchar(30) NOT NULL,
  `nombre_maquina` varchar(50) DEFAULT NULL,
  `fecha_aprobacion` date DEFAULT NULL,
  `frecuencia` varchar(30) DEFAULT NULL,
  `estado_maquina` int(11) DEFAULT NULL,
  `id_maquina_1` int(11) DEFAULT NULL,
  `realizado_por` char(50) DEFAULT NULL,
  `aprobado_por` char(50) DEFAULT NULL,
  `liberado_por` char(50) DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `id_maquina` int(11) NOT NULL,
  `tipo_de_maquina` varchar(50) DEFAULT NULL,
  `nombre_maquina` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales_empleados`
--

CREATE TABLE `materiales_empleados` (
  `id_material_empleado` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `costo` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `id_mantenimiento_co_1` varchar(30) DEFAULT NULL,
  `id_maquina_1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refacciones`
--

CREATE TABLE `refacciones` (
  `id_refaccion` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `clave_modelo` varchar(15) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `id_maquina_1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` int(11) NOT NULL,
  `tipo_de_reporte` varchar(30) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `hora_creacion` time DEFAULT NULL,
  `archivo` longblob DEFAULT NULL,
  `id_mantenimiento_co_1` varchar(30) DEFAULT NULL,
  `id_mantenimiento_preventivo_1` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_aportacionempresa`
--

CREATE TABLE `t_aportacionempresa` (
  `id_aportacion` int(11) NOT NULL,
  `monto_AE` int(11) DEFAULT NULL,
  `fecha_ultimo_abono_AE` date DEFAULT NULL,
  `acumulado_AE` bigint(20) DEFAULT NULL,
  `id_empleados_5` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_bitacora`
--

CREATE TABLE `t_bitacora` (
  `id_bitacora` int(11) NOT NULL,
  `monto` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tipoMovimiento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cajaahorro`
--

CREATE TABLE `t_cajaahorro` (
  `id_cajaAhorro` int(11) NOT NULL,
  `fecha_ultimo_abono_CA` date DEFAULT NULL,
  `monto_apertura_CA` int(11) DEFAULT NULL,
  `acumulado_CA` bigint(20) DEFAULT NULL,
  `id_empleado_3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_catalogo`
--

CREATE TABLE `t_catalogo` (
  `Id_Catalogo` varchar(50) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Medida` varchar(50) DEFAULT NULL,
  `Acabado` varchar(50) DEFAULT NULL,
  `PDF` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_certificado`
--

CREATE TABLE `t_certificado` (
  `Id_Certificado` int(11) NOT NULL,
  `Factura` varchar(50) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Cant_Ent` varchar(50) DEFAULT NULL,
  `Empaquetado` varchar(50) DEFAULT NULL,
  `No_DeParte` varchar(50) DEFAULT NULL,
  `Tornillo` varchar(50) DEFAULT NULL,
  `Material` varchar(50) DEFAULT NULL,
  `OP` varchar(50) DEFAULT NULL,
  `Cant_Inspecc` varchar(50) DEFAULT NULL,
  `Diametro_Cuerda` varchar(12) DEFAULT NULL,
  `Long_Cuerda` varchar(12) DEFAULT NULL,
  `Diametro_Cabeza` varchar(12) DEFAULT NULL,
  `Altura_Cabeza` varchar(12) DEFAULT NULL,
  `Diametro_Entre_Caras` varchar(20) DEFAULT NULL,
  `Espesor_Arand` varchar(20) DEFAULT NULL,
  `Diametro_Arand` varchar(20) DEFAULT NULL,
  `Diametro_Cuerda_1` varchar(20) DEFAULT NULL,
  `Long_Cuerda_1` varchar(20) DEFAULT NULL,
  `Diametro_Cabeza_1` varchar(20) DEFAULT NULL,
  `Altura_Cabeza_1` varchar(20) DEFAULT NULL,
  `Diametro_Entre_Caras_1` varchar(20) DEFAULT NULL,
  `Espesor_Arand_1` varchar(20) DEFAULT NULL,
  `Diametro_Arand_1` varchar(20) DEFAULT NULL,
  `Acabado` varchar(12) DEFAULT NULL,
  `Notas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_clientes`
--

CREATE TABLE `t_clientes` (
  `Id_Clientes` int(11) NOT NULL,
  `Razon_social` varchar(50) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_clientes`
--

INSERT INTO `t_clientes` (`Id_Clientes`, `Razon_social`, `Nombre`, `Telefono`, `Correo`, `Direccion`) VALUES
(1, '-', '-', '-', '-', '-'),
(24, 'Soluciones Herramientas y Tornillos', 'Max Reyes Vera', '5553959008', 'www.solucionesentornillos.com.mx', ' Presa Salinillas No. 305 Edif 62 Entr. A102 Col. '),
(31, 'Industrias Man de México S.A	', 'Magaly Florencio', '5558818011', 'm.florencio@industriasman.mx', ' Av. Cinco eje 3 Oriente No. 103 Col. Granjas San '),
(32, 'Clavos Nacionales S.A de C.V	', 'Claudia Hernández', '5550914141	', 'claudia.hernandez@cnmexico.com.mx	', ' Km. 40.5 Autopista Federal México Querétaro Fracc'),
(34, 'Cooper Crouse Hinds', 'Jesús Medel', '5558044113', 'castillo@erouse-hinds.com', ' Javier Rojo Gómez 1170 Iztapalapa CDMX CP. 09300'),
(41, 'Arnetel S.A de C.V', 'Francisco Fortolis', '5553590792', 'arnetel@prodigy.ent.mx', ' Calzada de las Armas 35, CoL. Amp. San Pedro Xalp'),
(43, 'Timco S.A de C.V	', 'Laura Marquez	', '5555415372', '	laura.marquez@timco.com.mx	', 'Avedules No.75 Santa Maria Insurgentes Cuahutemoc '),
(44, 'Panasonic de Mexico', ' 	Noe Rayon', '	5559728000	', 'rayon.noe@mx.panasonic.com', '	MX Mz. 1 Lot. 1, 2, 3 y 4\r\n'),
(46, 'Cooper Wiring Devices', '	Ana Villarroel', '	5555870211', '	anavillarroel@eatol.com	', 'Carr. Tlalnepantla-Cuahutitlan Km. 178 S/N Col. Vi'),
(48, 'Rodrigo Javier Jasso Huerta ', '	Liliana Tapia 	', '	', 'jttornillos@hotmail.com	', ''),
(49, '	koblenz Electrica', '	Ivonne Castellano', ' 	5558640300 Ext. 3391 ', '	Castellan@Koblenz.com', '	Av. Ciencia 28 Parque industrial Cuamatla, Cuahut'),
(50, 'Herramientas Stanly', 'Jesus Mani', '2222232424', 'jesus.mani@sbdinc.com', '.'),
(53, '	Fortumaq S.A de C.V ', '	Roberto Campos ', '	5558458729', '	compras@fortumaq.com', '\r\n'),
(54, '	Simon Electrica S.A de C.V', '	Alberto Hurtado', '	7222496696	', 'compras1@simonelectrica.com', '	Darwin No. 136 Col. Anzures CP. 11590\r\n'),
(55, 'Herramientas Stanley	', 'Ileana Lopez Castañeda', '	2411198619	', 'yleanalopez@sbdinc.com', '	Autopista Mexico Puebla Km. 124 CP. 72014 Puebla '),
(59, '	Tecnofijaciones ', '	Manuel Aupart Cortes', '	13338125179', '	judithduran@prodigy.net.mx', '	Av. Colon 2601 Col. Industrial Guadalajara Jalisc'),
(66, '	Gerardo de Alba Rodriguez ', '	Albina Rodriguez Granadoz', '	5557366773', '	jerrymotors-tornillos@gmail.com', '	Pajaro Azul No. 296 Col. Benito Juarez Ciudad Nez'),
(72, '	Industria Nacional de Alumbrado y Errajes', '	Eduardo Espindola	', '5556971480', '	inahsa_compras@isesa.com	', ''),
(73, '	Becomar De Mexico S DE R.L C.V	', 'Francisco Cedillo', '	7222497472', '	compras@becomardemexico.com	', 'Emiliano Zapata 103 Col. San blas otzacatipan Tolu'),
(78, '	Agustin Lua Aguirre ', '	Agustin Lua Aguirre', ' 	5553555206', '	tornilloslua@live.com.mx', '	Calzada Vallejo 335-A Col. Heroe Nacozari Del. Gu'),
(83, '	Maxiamerica Mexico Industrial 	', 'Rosa Maria Martinez ', '	5558905322	', 'rbrenda@maxxi.com.mx	', 'Benito Juares 25 Col. Vallejo Poniente Del.Gustavo'),
(86, '	Dominique Cristine Lemoine Antonio', '', '', 'ab_tornillos@hotmai.com', '	Calle. Ralph Roeder No. 2722 Int. 2 Col. Iztaccih'),
(89, 'Casa Somer S.A de C.V	', 'Miguel Angel Morales Soto', '	5526298080 Ext. 1302 / 1444', '	miguel.morales@somer.com.mx	', 'BLVD. Toluca 13 Col. San Francisco Cautlalpan Nauc'),
(95, 'Comercializadora electromencacas de R.L MI', 'Tania Palafox Cabello', '5558946536	', 'lic.palafoxc@hotmail.es', ' Privada 5 de mayo s/n Col.Buenavista Tutitlan EDO'),
(96, '	Armando Relojes S.A de C.V', '	Matha Martinez ', '	5557163151	', 'armandorelojes@prodigy.net.mx', '	2a.Cerrada de Alberto Salinas #58 Col.Aviacion Ci'),
(98, 'Actia de Mexico S.A de C.V', 'Sandra Rodriguez', '5551192350', 'srodriguez@actia.com.mx', ' Av.Central 176 Nueva Industrial Vallejo Gustavo A'),
(99, 'Jaguar de Mexico S.A deC.V', '	Alexis Aguila Avalos ', '	5589969948 ext 1506', '	compras@ncsjaguar.com.mx', '	Calle Tabla Grande No.2 Espiritu Santo ,Jilotzing'),
(103, '	Mei Telecomunicaciones	', '', '', '', '			\r\n'),
(110, '	Grupo Anavia S.A de C.V', '	Alma', '	5555823345 Ext  108', ' 	compras@navia.mx', '	Av.Año de Juarez No.168,Granjas de San Antonio  I'),
(115, 'BOMBAS,AISLANTES Y REFACCIONES			', NULL, NULL, NULL, NULL),
(121, 'Gabriela Aupart Cortes', '', '', '', ' '),
(129, '	Comercializadora Diher	', 'Jonathan Bernabe Diaz Hernandez', '	5555869846  ó 5551192055   ó  5576521470', '	diher_ventas@hotmail.com', '	Ramiriqui 1133 Col Residencial Zacatenco Del.Gust'),
(133, '	Paulino Perez Morales', '', ' 		5553551557	', 'coto433@hotmail.com	', '\r\n'),
(136, '	Carlos Nava Albarado ', '	Carlos Nava ', '	5556504814', '	tornillosnava@yahoo.com.mx	', '\r\n'),
(137, '	Turmix  de Mexico de S.A de C.V	', 'America  Reza 	', '17282884142', '	compras@turmix.com.mx', '	Av.Del Rio Ocoyocac 605 Santa Maria  EDOMEX CP.52'),
(142, '	Multiseñal S.A de C.V ', '', '', '', '				\r\n'),
(143, '	Ingenieria y Manufactura Industriales  Servin  S.', '	Victor Perez ', '	5557746881', '	victorperez4@terra.com.mx	', 'Boulevard Tonatiuh L.53 Mza.410 CD.Azteca Ecatepec'),
(145, ' Weg Mexico S.A de C.V', 'Alejandro  Toribio', '5553214205 Ext 5113	', '', '	\r\n'),
(148, '	Maria Salvadora Casas Ramirez ', '	Paulina Aldape', ' 	5554264317', '	hectotornilloc@hotmail.com', ' 	Av.Tlahuac 5754 Loc.12 San Nicolas Tolentino Izt'),
(151, 'Tornillos Gabriel', 'Antonio Gabriel', '5550260716', 'compras@tornillosgabriel.com.mx', ' Calle Saltillo No 138 Col. Valle ceylan CP 54150 '),
(152, '	Daniel Roman Ramos ', '	Daniela Roman	', '5557431618', '	DRRREFACCIONESELECTRICAS@hotmail.com ', '	Sta.Rosa de Lima 198 Col. Vigencitas Nezahualcoyo'),
(154, '	Fabrica de Instrumento de Medicion Electricos S A', 'Juan Carlos Elizarradas ', '	5553966544	', 'fimesa@prodigy.net.mx', '	Mar Bactico No. 24 Col.Popotla CP. 11400 CDMX\r\n'),
(156, '	Promotora de Tuercas y Tornillos', '', '', '', '				\r\n'),
(163, 'M&G Quality  Products S.A DE C.V ', '	Lizeth de Jesus', '	5522824568', '	compras@myg.com.mx	', 'Calle Urbina No. 61 A Col. Parque Industrial Nauca'),
(167, NULL, NULL, NULL, NULL, NULL),
(172, 'Sergio Jonathan Soto Martinez	', 'Sergio Soto 	', '4612160127', '	abstori.cya@hotmail.com', '	Eucalipto 16 \r\n'),
(175, 'Partes Forjadas	Baez	', '', '4422534496', '	cmpras@partesforjadas.com.mx', '	Constitucion #17 Col.Parque  Industrial Berna QRO'),
(177, 'Joaquien Francisco Morales Garcia', 'Joaquin', '5551265831', 'abastecedorasdisel@hotmail.com', ' Rio Lerma 11 Col.Ampliacion Tulteplac EDOMEX'),
(181, 'Juliana Teresa Ramirez Capulin', 'Teresa', '5585666718', 'tornilloscomerciales@hotmail.com', ' Av.Benito Juarez 76 lt3 Col.San Pablo Xalpa Tlan'),
(182, 'Samsonite de Mexico', 'Alejandro Muñoz', '5558649734', 'alejandromuñoz@samsonite.com', ' Autopista Cham.Lecheria Km2 Cpa.Logistica Center'),
(183, 'Francisco Javier Pozadas', 'Francisco Javier Pozadas', '58256382', 'fjpp_froy@hotmail.com', ' Almoloya 28 Lt.31'),
(186, NULL, NULL, NULL, NULL, NULL),
(192, 'THC Engineering Fasteners', 'Obdulia Hernandez', '5555472772', 'thctor@prodigy.net.mx', ' Salvador D. Miron 50 Col. Sta Maria la Ribera Alc'),
(198, 'Mitzi Melania Peña Testa', 'Mitzi Peña', '5576573127', 'tetzamitzi@hotmail.com', ' Rancho Azul 32 Mz 4 Lt 4'),
(199, 'Tornillo Vertiz ', '	Santiago Guzman', '	5555786529 ó 5555781623	', 'jaime.santiago@tornillosvetiz.com', '	Doctor Vetiz 278-D \r\n'),
(202, 'ELSA ALVARADO MAGOS', NULL, NULL, NULL, NULL),
(204, 'Koller Group', 'Claudia Castillo', '12222167549', 'claudiacastillo@koller-gruppe.com', ' '),
(206, 'Distribuidora de Tornillos Monjac', 'Isabeth Monjac', '5555842767 ó 5558842915', 'isa_jacuinde@yahoo.com.mx', ' Av. Jose Lopez Portillo 74 -B Col. San Francisco'),
(207, '	Cedis Grupo L7 S A DE C.V ', '', '', '', '			\r\n'),
(211, '	Alfredo Camacho ', '	Abel Manuel Henandez	', '5550973527 ó 5517469230	', 'mixteca291202@hotmail.com 	', '\r\n'),
(212, '	Tecnologias Unidas S.A', '	Fatima Garduño', ' 	5556056312', '	compras.tusa@complet.com.mx	', 'Tokio #522 Portales  Benito Juarez CDMX CP. 03300\r'),
(213, 'OBN Tornillos', '	Alejandro Flores ', '	554278122', '	onbtornillossas@gmail.ocm ', '	\r\n'),
(214, 'Heidi Pantoja Laredo', 'Jose Bilchis', '5555690611', 'unitor.heipa@hotmail.com', ' '),
(215, '	Innovaciones Industriales GMA ', '	Rafael Meza ', '	5551154288	', 'laurab@industrias.gma.mxp', '	\r\n'),
(216, '	Estrufas  Domesticas SAPI C.V', '	', '	7224029832', '	compras@estufasdomesticas.com.mx', '	Industrial Quimicas No 201 Lote 2 Local C Interio'),
(217, '	Manufactura Industriales DP', '	Carlos Espinoza Espinoza', ' 	4968513034', '	compras@midp.com.mx', '	Calle Revolucion  #101  La loma ,Loreto ,Zacateca'),
(218, '	Tornillos y Baleros Campos S.A	', 'Alejandro Rosas', ' 	5556082177', '	toboca@prodigy.net.mx', '	Av.Taxqueña 2374Col.Culhuacan C.P 09800 Iztapalap'),
(219, '	Industrias Sola Basic S.A', '	Edgar Martinez', ' 	5558042020	', 'compras2@isbmex.comp ', '	Calzada Javier Rojo Gomez 510 Leyes de Reforma C.'),
(220, '	Insumos Termicos y Automatizacion ', '	Roberto Garcia', ' 	5542204131', '	amdmon.tolad@ouckool.com	\r\n', ''),
(221, 'Chapiti	', 'Lourdes Aburltu', '	66262660	', 'luluab1025@hotmail.com	', '\r\n'),
(222, '	Industria Leicos SA', '	Mirella Ayala', ' 	56100211', '	compras@preicon .com.mx', '	Campesinos 411 Sta Isabel Industrial Iztapalapa C'),
(223, '	Tranformacion De Acero ARA SA', '	Albel Reyes Alcantaro', '	5558636610	', '', '	Cedro Lt 7 Mz 45 Col el Molino Iztapalapa CP 0983'),
(227, '	 Laminadora Mexicana de Metales  S.A', '	Caracamo ', '	5526299600', '	naguirre@lammsa.com', '	Carretera Tlalnepantla Cuautitlan S/N Lt2 Col.Lom'),
(231, '	Adolfo Sanchez Sanchez', '	Adolfo Sanchez', ' 	5513434197', '	delarosr@hotmail.com	', '\r\n'),
(232, '	Distribuidora de Birlos y Tornillos Huerta', '	Gilberto Huerta', '	5536908984', '', '		Av de la Torres No 109 Col. Vicente Villada CD N'),
(233, '	Ingenieria En Calentamiento Electrico', '	Ana Rodriguez', '	18183025000	', 'administracion.qro@incel.com.mx	', 'Ave Madero 2135 Puente Centro Monterrey Nuevo Leon'),
(236, '	Booster Mexicali', '	Liliana Alvarez', '	16868416011', '	liliana.alvarez@booster-presicion.com	', 'Mercurio 138 Parque Industrial Pimsa I Mexicali BC'),
(237, '	Tornillos Herrera', ' 	Hugo Cesar Herrera', ' 	5517113672', '	tornillosherrera@hotmail.com', '	Prologacion Emiliano Zapata Mz1661 Lt 3 Col. Ampl'),
(239, '	Molduras Hidroqueles S.A de C.V ', '	Blanca Sanchez ', '	56565958', '	myrsa@prodigy.net.mx	', '\r\n'),
(266, 'Grupo Lamive', 'Nelly Ologue', '5552603670', 'nellyolague@hotmail.com', ' Calle Av Nacional No 214 Col. Anahuac C.P 11320 M'),
(275, '	Productora Metalica  S.A DE  C.V', '', '', '', '				\r\n'),
(277, 'Samuel de la O', 'Samuel de la O', '5522713057', 'dskventas@hotmail.com	', '\r\n'),
(279, '	Electrotermica Nacional SA DE CV', '	Rodolfo Salazar ó  Olyzandy Hernandez Yepez', '	5591719190', '	soporte@ensa.com.mx	', 'Juan N Mirafuentes 444 Local 3 Los reyes Y B Revil'),
(287, '	Reyna Garcia Lopez ', '	Reyna Garcia ', '	1336455710	', 'ventastuercasytornillos@hotmail.com	', '\r\n'),
(291, '	Schweitzer en Gineering Laboratyries S.A DE C.V	', '', '	5556067391', '	', '	Av. Central No 205 Parque Industrial Lugistico 78'),
(296, '	Multi Electrica Industrial ', '	Adan Ramirez ', '	5553586474', '	gramon@meitelecom.com', '	Av. Indurstrial Nacional No 20 Fraccionamiento In'),
(307, '	Maximino Vaca Lopez ', '	Maximino Vaca Lopez ', '	550690028', '	carroceriasjosue@hotmail.com	', '\r\n'),
(325, '	Jorge Luis Miranda Mora ', '	Jorge Luis Miranda Mora ', '	172227213', '	tortca@hotmail.com	', 'Av Viabilidad Alfredo del Mazo No 2601 Lt 2 Col. L'),
(417, '	Tornillos Rousam S.A', '	David Velazquez', '	5556506706 ó 5556944904', '	trousam6@terra.com.mx', '	Fco.del paso y t.693 La cruz Iztcalco \r\n'),
(469, '	Industrias Riviera S.A	', 'Carlos Espinoza ', '	5556861030	', 'carlos.espinoza@rivieramex.com.mx', '	Av.Rojo Gomez 386 Col. Gpe.del Moral\r\n'),
(511, 'Elvira Araceli Hernandez Benhumea', 'Hernandez Benhumea', '53905982', 'pijasytornillos@live.com', ' Temoaya 8 Col. La loma Tlanepantla'),
(553, '	Centro Tornillero Pano Americano', '	Martinez 	', '53860718 ó 53860545 ó 55277611', '	panacp@live.com', '	Calzada Legaria 31 Col. Torre Blanca \r\n'),
(555, '	Cima Nacional SA DE CV ', '	Salvador Anaya ', '	4777172353 EXT 109', '	salvador.a@gruposyma.mx	', 'Oceano Artico Ext 102 Col.Lindavista Leon Guanajua'),
(562, '	Aluminio Y zinc de Casting Mexico SA DE CV', ' 	Francisco Chavez ', '	3336120160', '	alizinc@prodigy.net.mx', '	Galiana 116 B Sta Ana Topetitlan Zapopan Jal,Mexi'),
(567, '	Tornilleria Gerik S.A de C.V	', 'Clemente Roman 	', '5553891799', '	comprasgerik@terra.com.mx	', 'Av.Luis Ezpinoza Mz8 Lt.21 Col,Soliraridad Naciona'),
(579, 'La cuna Encantada S.A  de C.V	', 'Victor Hernandez ', '	55672933 Ext 102', '	compraslacunaencantada.com', '	Poniente 150 No. 800 Col Industrial Vallejo \r\n'),
(581, '	Hector  Reyes Vera Montes de Oca ', '	Hector Reyes ', '	14446884901', '	servitornillos2275@hotmail.com ', '	Reforma #2275 Col. Barrio San Miguelito  San Luis'),
(583, '	Grupo comercial Tornillero S.A	', 'Fernado Miranda', '	57154041 ó 57154239', '	grupoctor@prodigy.net.mx', '	Via Morelos 98 Col. Urbana Xalstoc Ecatepec EDMX\r'),
(614, 'Ditribuidora Ferretera  Dial', '	Luis Clemente Viveros', ' 	57011844	', 'ferreteradial@gmail.com	', 'Av. Rojo Gomez 441 Col. Agricola Oriental \r\n'),
(622, '	 Comercializadora Zonet S de R.L de C.V', '	Juan Cruz', ' 	58723222	', 'tornilloszonet@gmail.com	', 'Av. 16 de Septiembre 314 Local B Col. Cuatitlan Ce'),
(627, '	Tornillos y Herramientas MYL	', 'Luis Duran 	', '5551154082	', 'luisduran-tormyl@hotmail.com ', '	1ra Cerrada Rio Churubusco \r\n'),
(630, '	Vapores y Calentadores Delta 	', 'Isaac Corona ', '	58043868', '	isaaccorona189@gmail.com ', '	Los reyes 61 Col.Barrio San Lucas Iztapalapa \r\n'),
(642, '	Proveedora General de Tronilos ', '	Diana Reyes ', '	57639116', '	pgtsa@prodigy.net.mx', '	J.Rojo Gomez 433 Col.Agricola Orienta lIztapalapa'),
(643, 'Muebles Dixy', '.', '.', '.', '.'),
(656, '	Tronillos y Tuercas Milimetricas S.A', '	Daniel Ortiz ', '	54263897', '	ttmduran@hotmail.com ', '	Calz.Ermita Iztapalapa 149 Col.Amp.Ricardo Flores'),
(659, '	Tormatroc S.A', '	Gerardo Campos ', '	54266175 ó 54269717', '	tornillostorksa@prodigy.net.mx', '	Av.San Lorenzo 289 Col.Cerro de la estrella Iztap'),
(671, '	Rumara S.A	', 'Eva Daria Perez ', '	7282853690 Ext.112	', 'compras@rish.com.mx', '	Av.Santa Ana 35 Col.Parque Industrial Lerma \r\n'),
(678, '	Garniet Tornillos y Especialidades ', '	Otilia Linares ', '	5553558540', '	garnietventas@yahoo.com.mx', '	Rafael Martinez De la Torre  4457 Col.Heroe de Na'),
(684, '	Diseño y Tecnologia en Herrajes S.A ', '	Dalia Jimez Valencia', ' 	5556128390', '	fedytec@prodigy.net.mx ', '	Bellavista 42 Int.4  Col.San Juan Xalpa Iztapalap'),
(688, '	Deval de Mexico', ' 	Jazmin Cruz Ramirez', '	5553842123', '	comprasdevalmex@gmail.com	', '\r\n'),
(701, '	Yolanda Fraga  Campos', ' 	Yolanda Fraga  Campos ', '	5557640683', '', '		Calz.Zaragoza Col.Balbuena Iztacalco\r\n'),
(702, '	Arandas Frias Ma. Del Rosario', ' 	Ma. Del Rosario  Aranda ', '	5556465871 ó 5555824013		', '', 'Av.Tlahuac 333-C Col.Los Reyes Culhuacan Iztapalap'),
(709, '	Tornipoly S.A', '	Betty Caballero ', '	5555274064 ó 5555276208', '	tornipoly@gmail.com', ' 	Calz.Mexico Tacuba 1000 Col.Torre Blanca Miguel '),
(716, '	Tornillos Erlieb', '	Eusebio Velazquez Casanova ', '	5553942320', '	tornillosmarvel@hotmail.com', ' 	Av.16de Septiembre Col.Pasteros \r\n'),
(717, 'Cerraduras y Candados PHILLIPS', 'Jorge Quiroz', '5551180000', '.', 'Granjas Modernas C.P07460,Gustavo A.Madero '),
(721, '	Refrigeracion Ojeda S.A de C.V	', 'Lilia Bautista ', '	5556574422', '', '		Calle Canela 79-Bcol.Granjas Mexico Iztacalco \r\n'),
(722, '	Calentadores Magamex', '	Norali Vieyra', '	5551282740	', '', '	Aluminio No.5 Col.Esfuerzo Nacional Xalostoc EDOM'),
(725, 'Maquilas y Reprocesos Industriales S.A de C.V', 'Maquilas y Reprocesos Industriales S.A de C.V', '4422281507', 'comprasmri@hotmail.com', 'Monterrey No.31 Col San Jose de los Overa Corregid'),
(754, '	Ilena Salgado Gonzales', '	Ilena Salgado Gonzales', '', '		Ileana_salgado@hotmail.com', '	\r\n'),
(756, '	Ferretor', ' 	Rogelio Segura Sanchez', ' 	5553892456 ó 5553696170 ó 5553673130', '	ventasferretor@prodigy.net.mx	', 'Prolongacion Vallejo 100 mts Edif.C3-7 Departament'),
(761, 'Industrias en Iluminacion y transporte', 'Industrias en Iluminacion y transporte', '.', '.', '.'),
(767, 'Victor Martinez Gomez', 'Victor Martinez Gomez', '.', '.', '.'),
(769, 'Alma Graciela Sanchez Guitierrez', 'Alma Graciela Sanchez Guitierrez', '5515101382', 'griseldasanchez1@aoil.com', 'Papaloapan No 12 Ignacio Lopez Rayon C.P 52986 EDO'),
(770, 'Partes y Componentes de Lamina para la Industria S', 'Tania Lopez', '5513260040   5545521866', 'preciosatania@yahoo.com.mx', '.'),
(775, NULL, NULL, NULL, NULL, NULL),
(776, NULL, NULL, NULL, NULL, NULL),
(999, 'Forjadora Mexicana de Tornillo S.A de C.V', '.', '.', '.', '.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_contacto`
--

CREATE TABLE `t_contacto` (
  `id_contacto` int(11) NOT NULL,
  `Nombre_contacto` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_control_produccion`
--

CREATE TABLE `t_control_produccion` (
  `id_control_produccion` bigint(20) NOT NULL,
  `factor` float DEFAULT NULL,
  `Id_estado_1` int(11) DEFAULT NULL,
  `Id_Produccion_FK_1` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_control_produccion`
--

INSERT INTO `t_control_produccion` (`id_control_produccion`, `factor`, `Id_estado_1`, `Id_Produccion_FK_1`) VALUES
(1, 0, 1, 1),
(2, 0, 2, 1),
(3, 0, 3, 1),
(4, 0, 4, 1),
(5, 0, 5, 1),
(6, 0, 6, 1),
(7, 0, 1, 11085),
(8, 0, 2, 11085),
(9, 0, 3, 11085),
(10, 0, 4, 11085),
(11, 0, 5, 11085),
(12, 0, 6, 11085),
(13, 0, 1, 11086),
(14, 0, 2, 11086),
(15, 0, 3, 11086),
(16, 0, 4, 11086),
(17, 0, 5, 11086),
(18, 0, 6, 11086),
(19, 0, 1, 11087),
(20, 0, 2, 11087),
(21, 0, 3, 11087),
(22, 0, 4, 11087),
(23, 0, 5, 11087),
(24, 0, 6, 11087),
(25, 0, 1, 11088),
(26, 0, 2, 11088),
(27, 0, 3, 11088),
(28, 0, 4, 11088),
(29, 0, 5, 11088),
(30, 0, 6, 11088),
(31, 0, 1, 11089),
(32, 0, 2, 11089),
(33, 0, 3, 11089),
(34, 0, 4, 11089),
(35, 0, 5, 11089),
(36, 0, 6, 11089),
(37, 0, 1, 11090),
(38, 0, 2, 11090),
(39, 0, 3, 11090),
(40, 0, 4, 11090),
(41, 0, 5, 11090),
(42, 0, 6, 11090),
(43, 0, 1, 11091),
(44, 0, 2, 11091),
(45, 0, 3, 11091),
(46, 0, 4, 11091),
(47, 0, 5, 11091),
(48, 0, 6, 11091),
(49, 0, 1, 11092),
(50, 0, 2, 11092),
(51, 0, 3, 11092),
(52, 0, 4, 11092),
(53, 0, 5, 11092),
(54, 0, 6, 11092),
(55, 0, 1, 11093),
(56, 0, 2, 11093),
(57, 0, 3, 11093),
(58, 0, 4, 11093),
(59, 0, 5, 11093),
(60, 0, 6, 11093),
(61, 0, 1, 11094),
(62, 0, 2, 11094),
(63, 0, 3, 11094),
(64, 0, 4, 11094),
(65, 0, 5, 11094),
(66, 0, 6, 11094),
(67, 0, 1, 11095),
(68, 0, 2, 11095),
(69, 0, 3, 11095),
(70, 0, 4, 11095),
(71, 0, 5, 11095),
(72, 0, 6, 11095),
(73, 0, 1, 11096),
(74, 0, 2, 11096),
(75, 0, 3, 11096),
(76, 0, 4, 11096),
(77, 0, 5, 11096),
(78, 0, 6, 11096),
(79, 0, 1, 11097),
(80, 0, 2, 11097),
(81, 0, 3, 11097),
(82, 0, 4, 11097),
(83, 0, 5, 11097),
(84, 0, 6, 11097),
(85, 0, 1, 11098),
(86, 0, 2, 11098),
(87, 0, 3, 11098),
(88, 0, 4, 11098),
(89, 0, 5, 11098),
(90, 0, 6, 11098),
(91, 0, 1, 11099),
(92, 0, 2, 11099),
(93, 0, 3, 11099),
(94, 0, 4, 11099),
(95, 0, 5, 11099),
(96, 0, 6, 11099),
(97, 0, 1, 11100),
(98, 0, 2, 11100),
(99, 0, 3, 11100),
(100, 0, 4, 11100),
(101, 0, 5, 11100),
(102, 0, 6, 11100),
(103, 0, 1, 11101),
(104, 0, 2, 11101),
(105, 0, 3, 11101),
(106, 0, 4, 11101),
(107, 0, 5, 11101),
(108, 0, 6, 11101),
(109, 0, 1, 11102),
(110, 0, 2, 11102),
(111, 0, 3, 11102),
(112, 0, 4, 11102),
(113, 0, 5, 11102),
(114, 0, 6, 11102),
(115, 0, 1, 11103),
(116, 0, 2, 11103),
(117, 0, 3, 11103),
(118, 0, 4, 11103),
(119, 0, 5, 11103),
(120, 0, 6, 11103),
(121, 0, 1, 11104),
(122, 0, 2, 11104),
(123, 0, 3, 11104),
(124, 0, 4, 11104),
(125, 0, 5, 11104),
(126, 0, 6, 11104),
(127, 0, 1, 11105),
(128, 0, 2, 11105),
(129, 0, 3, 11105),
(130, 0, 4, 11105),
(131, 0, 5, 11105),
(132, 0, 6, 11105),
(133, 0, 1, 11106),
(134, 0, 2, 11106),
(135, 0, 3, 11106),
(136, 0, 4, 11106),
(137, 0, 5, 11106),
(138, 0, 6, 11106),
(139, 0, 1, 11107),
(140, 0, 2, 11107),
(141, 0, 3, 11107),
(142, 0, 4, 11107),
(143, 0, 5, 11107),
(144, 0, 6, 11107),
(145, 0, 1, 11108),
(146, 0, 2, 11108),
(147, 0, 3, 11108),
(148, 0, 4, 11108),
(149, 0, 5, 11108),
(150, 0, 6, 11108),
(151, 0, 1, 11109),
(152, 0, 2, 11109),
(153, 0, 3, 11109),
(154, 0, 4, 11109),
(155, 0, 5, 11109),
(156, 0, 6, 11109),
(157, 0, 1, 11110),
(158, 0, 2, 11110),
(159, 0, 3, 11110),
(160, 0, 4, 11110),
(161, 0, 5, 11110),
(162, 0, 6, 11110),
(163, 0, 1, 11111),
(164, 0, 2, 11111),
(165, 0, 3, 11111),
(166, 0, 4, 11111),
(167, 0, 5, 11111),
(168, 0, 6, 11111),
(169, 0, 1, 11112),
(170, 0, 2, 11112),
(171, 0, 3, 11112),
(172, 0, 4, 11112),
(173, 0, 5, 11112),
(174, 0, 6, 11112),
(175, 0, 1, 11113),
(176, 0, 2, 11113),
(177, 0, 3, 11113),
(178, 0, 4, 11113),
(179, 0, 5, 11113),
(180, 0, 6, 11113),
(181, 0, 1, 11114),
(182, 0, 2, 11114),
(183, 0, 3, 11114),
(184, 0, 4, 11114),
(185, 0, 5, 11114),
(186, 0, 6, 11114),
(187, 0, 1, 11115),
(188, 0, 2, 11115),
(189, 0, 3, 11115),
(190, 0, 4, 11115),
(191, 0, 5, 11115),
(192, 0, 6, 11115),
(193, 0, 1, 11116),
(194, 0, 2, 11116),
(195, 0, 3, 11116),
(196, 0, 4, 11116),
(197, 0, 5, 11116),
(198, 0, 6, 11116),
(199, 0, 1, 11117),
(200, 0, 2, 11117),
(201, 0, 3, 11117),
(202, 0, 4, 11117),
(203, 0, 5, 11117),
(204, 0, 6, 11117),
(205, 0, 1, 11118),
(206, 0, 2, 11118),
(207, 0, 3, 11118),
(208, 0, 4, 11118),
(209, 0, 5, 11118),
(210, 0, 6, 11118),
(211, 0, 1, 11119),
(212, 0, 2, 11119),
(213, 0, 3, 11119),
(214, 0, 4, 11119),
(215, 0, 5, 11119),
(216, 0, 6, 11119),
(217, 0, 1, 11120),
(218, 0, 2, 11120),
(219, 0, 3, 11120),
(220, 0, 4, 11120),
(221, 0, 5, 11120),
(222, 0, 6, 11120),
(223, 0, 1, 11121),
(224, 0, 2, 11121),
(225, 0, 3, 11121),
(226, 0, 4, 11121),
(227, 0, 5, 11121),
(228, 0, 6, 11121),
(229, 0, 1, 11122),
(230, 0, 2, 11122),
(231, 0, 3, 11122),
(232, 0, 4, 11122),
(233, 0, 5, 11122),
(234, 0, 6, 11122),
(235, 0, 1, 11123),
(236, 0, 2, 11123),
(237, 0, 3, 11123),
(238, 0, 4, 11123),
(239, 0, 5, 11123),
(240, 0, 6, 11123),
(241, 0, 1, 11124),
(242, 0, 2, 11124),
(243, 0, 3, 11124),
(244, 0, 4, 11124),
(245, 0, 5, 11124),
(246, 0, 6, 11124),
(247, 0, 1, 11125),
(248, 0, 2, 11125),
(249, 0, 3, 11125),
(250, 0, 4, 11125),
(251, 0, 5, 11125),
(252, 0, 6, 11125),
(253, 0, 1, 11126),
(254, 0, 2, 11126),
(255, 0, 3, 11126),
(256, 0, 4, 11126),
(257, 0, 5, 11126),
(258, 0, 6, 11126),
(259, 0, 1, 11127),
(260, 0, 2, 11127),
(261, 0, 3, 11127),
(262, 0, 4, 11127),
(263, 0, 5, 11127),
(264, 0, 6, 11127),
(265, 0, 1, 11128),
(266, 0, 2, 11128),
(267, 0, 3, 11128),
(268, 0, 4, 11128),
(269, 0, 5, 11128),
(270, 0, 6, 11128),
(271, 0, 1, 11129),
(272, 0, 2, 11129),
(273, 0, 3, 11129),
(274, 0, 4, 11129),
(275, 0, 5, 11129),
(276, 0, 6, 11129),
(277, 0, 1, 11130),
(278, 0, 2, 11130),
(279, 0, 3, 11130),
(280, 0, 4, 11130),
(281, 0, 5, 11130),
(282, 0, 6, 11130),
(283, 0, 1, 11131),
(284, 0, 2, 11131),
(285, 0, 3, 11131),
(286, 0, 4, 11131),
(287, 0, 5, 11131),
(288, 0, 6, 11131),
(289, 0, 1, 11132),
(290, 0, 2, 11132),
(291, 0, 3, 11132),
(292, 0, 4, 11132),
(293, 0, 5, 11132),
(294, 0, 6, 11132),
(295, 0, 1, 11133),
(296, 0, 2, 11133),
(297, 0, 3, 11133),
(298, 0, 4, 11133),
(299, 0, 5, 11133),
(300, 0, 6, 11133),
(301, 0, 1, 11134),
(302, 0, 2, 11134),
(303, 0, 3, 11134),
(304, 0, 4, 11134),
(305, 0, 5, 11134),
(306, 0, 6, 11134),
(307, 0, 1, 11135),
(308, 0, 2, 11135),
(309, 0, 3, 11135),
(310, 0, 4, 11135),
(311, 0, 5, 11135),
(312, 0, 6, 11135),
(313, 0, 1, 11136),
(314, 0, 2, 11136),
(315, 0, 3, 11136),
(316, 0, 4, 11136),
(317, 0, 5, 11136),
(318, 0, 6, 11136),
(319, 0, 1, 11137),
(320, 0, 2, 11137),
(321, 0, 3, 11137),
(322, 0, 4, 11137),
(323, 0, 5, 11137),
(324, 0, 6, 11137),
(325, 0, 1, 11138),
(326, 0, 2, 11138),
(327, 0, 3, 11138),
(328, 0, 4, 11138),
(329, 0, 5, 11138),
(330, 0, 6, 11138),
(331, 0, 1, 11139),
(332, 0, 2, 11139),
(333, 0, 3, 11139),
(334, 0, 4, 11139),
(335, 0, 5, 11139),
(336, 0, 6, 11139),
(337, 0, 1, 11140),
(338, 0, 2, 11140),
(339, 0, 3, 11140),
(340, 0, 4, 11140),
(341, 0, 5, 11140),
(342, 0, 6, 11140),
(343, 0, 1, 11141),
(344, 0, 2, 11141),
(345, 0, 3, 11141),
(346, 0, 4, 11141),
(347, 0, 5, 11141),
(348, 0, 6, 11141),
(349, 0, 1, 11142),
(350, 0, 2, 11142),
(351, 0, 3, 11142),
(352, 0, 4, 11142),
(353, 0, 5, 11142),
(354, 0, 6, 11142),
(355, 0, 1, 11143),
(356, 0, 2, 11143),
(357, 0, 3, 11143),
(358, 0, 4, 11143),
(359, 0, 5, 11143),
(360, 0, 6, 11143),
(361, 0, 1, 11144),
(362, 0, 2, 11144),
(363, 0, 3, 11144),
(364, 0, 4, 11144),
(365, 0, 5, 11144),
(366, 0, 6, 11144),
(367, 0, 1, 11145),
(368, 0, 2, 11145),
(369, 0, 3, 11145),
(370, 0, 4, 11145),
(371, 0, 5, 11145),
(372, 0, 6, 11145),
(373, 0, 1, 11146),
(374, 0, 2, 11146),
(375, 0, 3, 11146),
(376, 0, 4, 11146),
(377, 0, 5, 11146),
(378, 0, 6, 11146),
(379, 0, 1, 11147),
(380, 0, 2, 11147),
(381, 0, 3, 11147),
(382, 0, 4, 11147),
(383, 0, 5, 11147),
(384, 0, 6, 11147),
(385, 0, 1, 11148),
(386, 0, 2, 11148),
(387, 0, 3, 11148),
(388, 0, 4, 11148),
(389, 0, 5, 11148),
(390, 0, 6, 11148),
(391, 0, 1, 11149),
(392, 0, 2, 11149),
(393, 0, 3, 11149),
(394, 0, 4, 11149),
(395, 0, 5, 11149),
(396, 0, 6, 11149),
(397, 0, 1, 11150),
(398, 0, 2, 11150),
(399, 0, 3, 11150),
(400, 0, 4, 11150),
(401, 0, 5, 11150),
(402, 0, 6, 11150),
(403, 0, 1, 11151),
(404, 0, 2, 11151),
(405, 0, 3, 11151),
(406, 0, 4, 11151),
(407, 0, 5, 11151),
(408, 0, 6, 11151),
(409, 0, 1, 11152),
(410, 0, 2, 11152),
(411, 0, 3, 11152),
(412, 0, 4, 11152),
(413, 0, 5, 11152),
(414, 0, 6, 11152),
(415, 0, 1, 11153),
(416, 0, 2, 11153),
(417, 0, 3, 11153),
(418, 0, 4, 11153),
(419, 0, 5, 11153),
(420, 0, 6, 11153),
(421, 0, 1, 11154),
(422, 0, 2, 11154),
(423, 0, 3, 11154),
(424, 0, 4, 11154),
(425, 0, 5, 11154),
(426, 0, 6, 11154),
(427, 0, 1, 11155),
(428, 0, 2, 11155),
(429, 0, 3, 11155),
(430, 0, 4, 11155),
(431, 0, 5, 11155),
(432, 0, 6, 11155),
(433, 0, 1, 11156),
(434, 0, 2, 11156),
(435, 0, 3, 11156),
(436, 0, 4, 11156),
(437, 0, 5, 11156),
(438, 0, 6, 11156),
(439, 0, 1, 11157),
(440, 0, 2, 11157),
(441, 0, 3, 11157),
(442, 0, 4, 11157),
(443, 0, 5, 11157),
(444, 0, 6, 11157),
(445, 0, 1, 11158),
(446, 0, 2, 11158),
(447, 0, 3, 11158),
(448, 0, 4, 11158),
(449, 0, 5, 11158),
(450, 0, 6, 11158),
(451, 0, 1, 11159),
(452, 0, 2, 11159),
(453, 0, 3, 11159),
(454, 0, 4, 11159),
(455, 0, 5, 11159),
(456, 0, 6, 11159),
(457, 0, 1, 11160),
(458, 0, 2, 11160),
(459, 0, 3, 11160),
(460, 0, 4, 11160),
(461, 0, 5, 11160),
(462, 0, 6, 11160),
(463, 0, 1, 11161),
(464, 0, 2, 11161),
(465, 0, 3, 11161),
(466, 0, 4, 11161),
(467, 0, 5, 11161),
(468, 0, 6, 11161),
(469, 0, 1, 11162),
(470, 0, 2, 11162),
(471, 0, 3, 11162),
(472, 0, 4, 11162),
(473, 0, 5, 11162),
(474, 0, 6, 11162),
(475, 0, 1, 11163),
(476, 0, 2, 11163),
(477, 0, 3, 11163),
(478, 0, 4, 11163),
(479, 0, 5, 11163),
(480, 0, 6, 11163),
(481, 0, 1, 11164),
(482, 0, 2, 11164),
(483, 0, 3, 11164),
(484, 0, 4, 11164),
(485, 0, 5, 11164),
(486, 0, 6, 11164),
(487, 0, 1, 11165),
(488, 0, 2, 11165),
(489, 0, 3, 11165),
(490, 0, 4, 11165),
(491, 0, 5, 11165),
(492, 0, 6, 11165),
(493, 0, 1, 11166),
(494, 0, 2, 11166),
(495, 0, 3, 11166),
(496, 0, 4, 11166),
(497, 0, 5, 11166),
(498, 0, 6, 11166),
(499, 0, 1, 11167),
(500, 0, 2, 11167),
(501, 0, 3, 11167),
(502, 0, 4, 11167),
(503, 0, 5, 11167),
(504, 0, 6, 11167),
(505, 0, 1, 11168),
(506, 0, 2, 11168),
(507, 0, 3, 11168),
(508, 0, 4, 11168),
(509, 0, 5, 11168),
(510, 0, 6, 11168),
(511, 0, 1, 11169),
(512, 0, 2, 11169),
(513, 0, 3, 11169),
(514, 0, 4, 11169),
(515, 0, 5, 11169),
(516, 0, 6, 11169),
(517, 0, 1, 11170),
(518, 0, 2, 11170),
(519, 0, 3, 11170),
(520, 0, 4, 11170),
(521, 0, 5, 11170),
(522, 0, 6, 11170),
(523, 0, 1, 11171),
(524, 0, 2, 11171),
(525, 0, 3, 11171),
(526, 0, 4, 11171),
(527, 0, 5, 11171),
(528, 0, 6, 11171),
(529, 0, 1, 11172),
(530, 0, 2, 11172),
(531, 0, 3, 11172),
(532, 0, 4, 11172),
(533, 0, 5, 11172),
(534, 0, 6, 11172),
(535, 0, 1, 11173),
(536, 0, 2, 11173),
(537, 0, 3, 11173),
(538, 0, 4, 11173),
(539, 0, 5, 11173),
(540, 0, 6, 11173),
(541, 0, 1, 11174),
(542, 0, 2, 11174),
(543, 0, 3, 11174),
(544, 0, 4, 11174),
(545, 0, 5, 11174),
(546, 0, 6, 11174),
(547, 0, 1, 11175),
(548, 0, 2, 11175),
(549, 0, 3, 11175),
(550, 0, 4, 11175),
(551, 0, 5, 11175),
(552, 0, 6, 11175),
(553, 0, 1, 11176),
(554, 0, 2, 11176),
(555, 0, 3, 11176),
(556, 0, 4, 11176),
(557, 0, 5, 11176),
(558, 0, 6, 11176),
(559, 0, 1, 11177),
(560, 0, 2, 11177),
(561, 0, 3, 11177),
(562, 0, 4, 11177),
(563, 0, 5, 11177),
(564, 0, 6, 11177),
(565, 0, 1, 11178),
(566, 0, 2, 11178),
(567, 0, 3, 11178),
(568, 0, 4, 11178),
(569, 0, 5, 11178),
(570, 0, 6, 11178),
(571, 0, 1, 11179),
(572, 0, 2, 11179),
(573, 0, 3, 11179),
(574, 0, 4, 11179),
(575, 0, 5, 11179),
(576, 0, 6, 11179),
(577, 0, 1, 11180),
(578, 0, 2, 11180),
(579, 0, 3, 11180),
(580, 0, 4, 11180),
(581, 0, 5, 11180),
(582, 0, 6, 11180),
(583, 0, 1, 11181),
(584, 0, 2, 11181),
(585, 0, 3, 11181),
(586, 0, 4, 11181),
(587, 0, 5, 11181),
(588, 0, 6, 11181),
(589, 0, 1, 11182),
(590, 0, 2, 11182),
(591, 0, 3, 11182),
(592, 0, 4, 11182),
(593, 0, 5, 11182),
(594, 0, 6, 11182),
(595, 0, 1, 11183),
(596, 0, 2, 11183),
(597, 0, 3, 11183),
(598, 0, 4, 11183),
(599, 0, 5, 11183),
(600, 0, 6, 11183),
(601, 0, 1, 11184),
(602, 0, 2, 11184),
(603, 0, 3, 11184),
(604, 0, 4, 11184),
(605, 0, 5, 11184),
(606, 0, 6, 11184),
(607, 0, 1, 11185),
(608, 0, 2, 11185),
(609, 0, 3, 11185),
(610, 0, 4, 11185),
(611, 0, 5, 11185),
(612, 0, 6, 11185),
(613, 0, 1, 11186),
(614, 0, 2, 11186),
(615, 0, 3, 11186),
(616, 0, 4, 11186),
(617, 0, 5, 11186),
(618, 0, 6, 11186),
(619, 0, 1, 11187),
(620, 0, 2, 11187),
(621, 0, 3, 11187),
(622, 0, 4, 11187),
(623, 0, 5, 11187),
(624, 0, 6, 11187),
(625, 0, 1, 11188),
(626, 0, 2, 11188),
(627, 0, 3, 11188),
(628, 0, 4, 11188),
(629, 0, 5, 11188),
(630, 0, 6, 11188),
(631, 0, 1, 11189),
(632, 0, 2, 11189),
(633, 0, 3, 11189),
(634, 0, 4, 11189),
(635, 0, 5, 11189),
(636, 0, 6, 11189),
(637, 0, 1, 11190),
(638, 0, 2, 11190),
(639, 0, 3, 11190),
(640, 0, 4, 11190),
(641, 0, 5, 11190),
(642, 0, 6, 11190),
(643, 0, 1, 11191),
(644, 0, 2, 11191),
(645, 0, 3, 11191),
(646, 0, 4, 11191),
(647, 0, 5, 11191),
(648, 0, 6, 11191),
(649, 0, 1, 11192),
(650, 0, 2, 11192),
(651, 0, 3, 11192),
(652, 0, 4, 11192),
(653, 0, 5, 11192),
(654, 0, 6, 11192),
(655, 0, 1, 11193),
(656, 0, 2, 11193),
(657, 0, 3, 11193),
(658, 0, 4, 11193),
(659, 0, 5, 11193),
(660, 0, 6, 11193),
(661, 0, 1, 11194),
(662, 0, 2, 11194),
(663, 0, 3, 11194),
(664, 0, 4, 11194),
(665, 0, 5, 11194),
(666, 0, 6, 11194),
(667, 0, 1, 11195),
(668, 0, 2, 11195),
(669, 0, 3, 11195),
(670, 0, 4, 11195),
(671, 0, 5, 11195),
(672, 0, 6, 11195),
(673, 0, 1, 11196),
(674, 0, 2, 11196),
(675, 0, 3, 11196),
(676, 0, 4, 11196),
(677, 0, 5, 11196),
(678, 0, 6, 11196),
(679, 0, 1, 11197),
(680, 0, 2, 11197),
(681, 0, 3, 11197),
(682, 0, 4, 11197),
(683, 0, 5, 11197),
(684, 0, 6, 11197),
(685, 0, 1, 11198),
(686, 0, 2, 11198),
(687, 0, 3, 11198),
(688, 0, 4, 11198),
(689, 0, 5, 11198),
(690, 0, 6, 11198),
(691, 0, 1, 11199),
(692, 0, 2, 11199),
(693, 0, 3, 11199),
(694, 0, 4, 11199),
(695, 0, 5, 11199),
(696, 0, 6, 11199),
(697, 0, 1, 11200),
(698, 0, 2, 11200),
(699, 0, 3, 11200),
(700, 0, 4, 11200),
(701, 0, 5, 11200),
(702, 0, 6, 11200),
(703, 0, 1, 11201),
(704, 0, 2, 11201),
(705, 0, 3, 11201),
(706, 0, 4, 11201),
(707, 0, 5, 11201),
(708, 0, 6, 11201),
(709, 0, 1, 11202),
(710, 0, 2, 11202),
(711, 0, 3, 11202),
(712, 0, 4, 11202),
(713, 0, 5, 11202),
(714, 0, 6, 11202),
(715, 0, 1, 11203),
(716, 0, 2, 11203),
(717, 0, 3, 11203),
(718, 0, 4, 11203),
(719, 0, 5, 11203),
(720, 0, 6, 11203),
(721, 0, 1, 11204),
(722, 0, 2, 11204),
(723, 0, 3, 11204),
(724, 0, 4, 11204),
(725, 0, 5, 11204),
(726, 0, 6, 11204),
(727, 0, 1, 11205),
(728, 0, 2, 11205),
(729, 0, 3, 11205),
(730, 0, 4, 11205),
(731, 0, 5, 11205),
(732, 0, 6, 11205),
(733, 0, 1, 11206),
(734, 0, 2, 11206),
(735, 0, 3, 11206),
(736, 0, 4, 11206),
(737, 0, 5, 11206),
(738, 0, 6, 11206),
(739, 0, 1, 11207),
(740, 0, 2, 11207),
(741, 0, 3, 11207),
(742, 0, 4, 11207),
(743, 0, 5, 11207),
(744, 0, 6, 11207),
(745, 0, 1, 11208),
(746, 0, 2, 11208),
(747, 0, 3, 11208),
(748, 0, 4, 11208),
(749, 0, 5, 11208),
(750, 0, 6, 11208),
(751, 0, 1, 11209),
(752, 0, 2, 11209),
(753, 0, 3, 11209),
(754, 0, 4, 11209),
(755, 0, 5, 11209),
(756, 0, 6, 11209),
(757, 0, 1, 11210),
(758, 0, 2, 11210),
(759, 0, 3, 11210),
(760, 0, 4, 11210),
(761, 0, 5, 11210),
(762, 0, 6, 11210),
(763, 0, 1, 11211),
(764, 0, 2, 11211),
(765, 0, 3, 11211),
(766, 0, 4, 11211),
(767, 0, 5, 11211),
(768, 0, 6, 11211),
(769, 0, 1, 11212),
(770, 0, 2, 11212),
(771, 0, 3, 11212),
(772, 0, 4, 11212),
(773, 0, 5, 11212),
(774, 0, 6, 11212),
(775, 0, 1, 11213),
(776, 0, 2, 11213),
(777, 0, 3, 11213),
(778, 0, 4, 11213),
(779, 0, 5, 11213),
(780, 0, 6, 11213),
(781, 0, 1, 11214),
(782, 0, 2, 11214),
(783, 0, 3, 11214),
(784, 0, 4, 11214),
(785, 0, 5, 11214),
(786, 0, 6, 11214),
(787, 0, 1, 11215),
(788, 0, 2, 11215),
(789, 0, 3, 11215),
(790, 0, 4, 11215),
(791, 0, 5, 11215),
(792, 0, 6, 11215),
(793, 0, 1, 11216),
(794, 0, 2, 11216),
(795, 0, 3, 11216),
(796, 0, 4, 11216),
(797, 0, 5, 11216),
(798, 0, 6, 11216),
(799, 0, 1, 11217),
(800, 0, 2, 11217),
(801, 0, 3, 11217),
(802, 0, 4, 11217),
(803, 0, 5, 11217),
(804, 0, 6, 11217),
(805, 0, 1, 11218),
(806, 0, 2, 11218),
(807, 0, 3, 11218),
(808, 0, 4, 11218),
(809, 0, 5, 11218),
(810, 0, 6, 11218),
(811, 0, 1, 11219),
(812, 0, 2, 11219),
(813, 0, 3, 11219),
(814, 0, 4, 11219),
(815, 0, 5, 11219),
(816, 0, 6, 11219),
(817, 0, 1, 11220),
(818, 0, 2, 11220),
(819, 0, 3, 11220),
(820, 0, 4, 11220),
(821, 0, 5, 11220),
(822, 0, 6, 11220),
(823, 0, 1, 11221),
(824, 0, 2, 11221),
(825, 0, 3, 11221),
(826, 0, 4, 11221),
(827, 0, 5, 11221),
(828, 0, 6, 11221),
(829, 0, 1, 11222),
(830, 0, 2, 11222),
(831, 0, 3, 11222),
(832, 0, 4, 11222),
(833, 0, 5, 11222),
(834, 0, 6, 11222),
(835, 0, 1, 11223),
(836, 0, 2, 11223),
(837, 0, 3, 11223),
(838, 0, 4, 11223),
(839, 0, 5, 11223),
(840, 0, 6, 11223),
(841, 0, 1, 11224),
(842, 0, 2, 11224),
(843, 0, 3, 11224),
(844, 0, 4, 11224),
(845, 0, 5, 11224),
(846, 0, 6, 11224),
(847, 0, 1, 11225),
(848, 0, 2, 11225),
(849, 0, 3, 11225),
(850, 0, 4, 11225),
(851, 0, 5, 11225),
(852, 0, 6, 11225),
(853, 0, 1, 11226),
(854, 0, 2, 11226),
(855, 0, 3, 11226),
(856, 0, 4, 11226),
(857, 0, 5, 11226),
(858, 0, 6, 11226),
(859, 0, 1, 11227),
(860, 0, 2, 11227),
(861, 0, 3, 11227),
(862, 0, 4, 11227),
(863, 0, 5, 11227),
(864, 0, 6, 11227),
(865, 0, 1, 11228),
(866, 0, 2, 11228),
(867, 0, 3, 11228),
(868, 0, 4, 11228),
(869, 0, 5, 11228),
(870, 0, 6, 11228),
(871, 0, 1, 11229),
(872, 0, 2, 11229),
(873, 0, 3, 11229),
(874, 0, 4, 11229),
(875, 0, 5, 11229),
(876, 0, 6, 11229),
(877, 0, 1, 11230),
(878, 0, 2, 11230),
(879, 0, 3, 11230),
(880, 0, 4, 11230),
(881, 0, 5, 11230),
(882, 0, 6, 11230),
(883, 0, 1, 11231),
(884, 0, 2, 11231),
(885, 0, 3, 11231),
(886, 0, 4, 11231),
(887, 0, 5, 11231),
(888, 0, 6, 11231),
(889, 0, 1, 11232),
(890, 0, 2, 11232),
(891, 0, 3, 11232),
(892, 0, 4, 11232),
(893, 0, 5, 11232),
(894, 0, 6, 11232),
(895, 0, 1, 11233),
(896, 0, 2, 11233),
(897, 0, 3, 11233),
(898, 0, 4, 11233),
(899, 0, 5, 11233),
(900, 0, 6, 11233),
(901, 0, 1, 11234),
(902, 0, 2, 11234),
(903, 0, 3, 11234),
(904, 0, 4, 11234),
(905, 0, 5, 11234),
(906, 0, 6, 11234),
(907, 0, 1, 11235),
(908, 0, 2, 11235),
(909, 0, 3, 11235),
(910, 0, 4, 11235),
(911, 0, 5, 11235),
(912, 0, 6, 11235),
(913, 0, 1, 11236),
(914, 0, 2, 11236),
(915, 0, 3, 11236),
(916, 0, 4, 11236),
(917, 0, 5, 11236),
(918, 0, 6, 11236),
(919, 0, 1, 11237),
(920, 0, 2, 11237),
(921, 0, 3, 11237),
(922, 0, 4, 11237),
(923, 0, 5, 11237),
(924, 0, 6, 11237),
(925, 0, 1, 11238),
(926, 0, 2, 11238),
(927, 0, 3, 11238),
(928, 0, 4, 11238),
(929, 0, 5, 11238),
(930, 0, 6, 11238),
(931, 0, 1, 11239),
(932, 0, 2, 11239),
(933, 0, 3, 11239),
(934, 0, 4, 11239),
(935, 0, 5, 11239),
(936, 0, 6, 11239),
(937, 0, 1, 11240),
(938, 0, 2, 11240),
(939, 0, 3, 11240),
(940, 0, 4, 11240),
(941, 0, 5, 11240),
(942, 0, 6, 11240),
(943, 0, 1, 11241),
(944, 0, 2, 11241),
(945, 0, 3, 11241),
(946, 0, 4, 11241),
(947, 0, 5, 11241),
(948, 0, 6, 11241),
(949, 0, 1, 11242),
(950, 0, 2, 11242),
(951, 0, 3, 11242),
(952, 0, 4, 11242),
(953, 0, 5, 11242),
(954, 0, 6, 11242),
(955, 0, 1, 11243),
(956, 0, 2, 11243),
(957, 0, 3, 11243),
(958, 0, 4, 11243),
(959, 0, 5, 11243),
(960, 0, 6, 11243),
(961, 0, 1, 11244),
(962, 0, 2, 11244),
(963, 0, 3, 11244),
(964, 0, 4, 11244),
(965, 0, 5, 11244),
(966, 0, 6, 11244),
(967, 0, 1, 11245),
(968, 0, 2, 11245),
(969, 0, 3, 11245),
(970, 0, 4, 11245),
(971, 0, 5, 11245),
(972, 0, 6, 11245),
(973, 0, 1, 11246),
(974, 0, 2, 11246),
(975, 0, 3, 11246),
(976, 0, 4, 11246),
(977, 0, 5, 11246),
(978, 0, 6, 11246),
(979, 0, 1, 11247),
(980, 0, 2, 11247),
(981, 0, 3, 11247),
(982, 0, 4, 11247),
(983, 0, 5, 11247),
(984, 0, 6, 11247),
(985, 0, 1, 11248),
(986, 0, 2, 11248),
(987, 0, 3, 11248),
(988, 0, 4, 11248),
(989, 0, 5, 11248),
(990, 0, 6, 11248),
(991, 0, 1, 11249),
(992, 0, 2, 11249),
(993, 0, 3, 11249),
(994, 0, 4, 11249),
(995, 0, 5, 11249),
(996, 0, 6, 11249),
(997, 0, 1, 11250),
(998, 0, 2, 11250),
(999, 0, 3, 11250),
(1000, 0, 4, 11250),
(1001, 0, 5, 11250),
(1002, 0, 6, 11250),
(1003, 0, 1, 11251),
(1004, 0, 2, 11251),
(1005, 0, 3, 11251),
(1006, 0, 4, 11251),
(1007, 0, 5, 11251),
(1008, 0, 6, 11251),
(1009, 0, 1, 11252),
(1010, 0, 2, 11252),
(1011, 0, 3, 11252),
(1012, 0, 4, 11252),
(1013, 0, 5, 11252),
(1014, 0, 6, 11252),
(1015, 0, 1, 11253),
(1016, 0, 2, 11253),
(1017, 0, 3, 11253),
(1018, 0, 4, 11253),
(1019, 0, 5, 11253),
(1020, 0, 6, 11253),
(1021, 0, 1, 11254),
(1022, 0, 2, 11254),
(1023, 0, 3, 11254),
(1024, 0, 4, 11254),
(1025, 0, 5, 11254),
(1026, 0, 6, 11254),
(1027, 0, 1, 11255),
(1028, 0, 2, 11255),
(1029, 0, 3, 11255),
(1030, 0, 4, 11255),
(1031, 0, 5, 11255),
(1032, 0, 6, 11255),
(1033, 0, 1, 11256),
(1034, 0, 2, 11256),
(1035, 0, 3, 11256),
(1036, 0, 4, 11256),
(1037, 0, 5, 11256),
(1038, 0, 6, 11256),
(1039, 0, 1, 11257),
(1040, 0, 2, 11257),
(1041, 0, 3, 11257),
(1042, 0, 4, 11257),
(1043, 0, 5, 11257),
(1044, 0, 6, 11257),
(1045, 0, 1, 11258),
(1046, 0, 2, 11258),
(1047, 0, 3, 11258),
(1048, 0, 4, 11258),
(1049, 0, 5, 11258),
(1050, 0, 6, 11258),
(1051, 0, 1, 11259),
(1052, 0, 2, 11259),
(1053, 0, 3, 11259),
(1054, 0, 4, 11259),
(1055, 0, 5, 11259),
(1056, 0, 6, 11259),
(1057, 0, 1, 11260),
(1058, 0, 2, 11260),
(1059, 0, 3, 11260),
(1060, 0, 4, 11260),
(1061, 0, 5, 11260),
(1062, 0, 6, 11260),
(1063, 0, 1, 11261),
(1064, 0, 2, 11261),
(1065, 0, 3, 11261),
(1066, 0, 4, 11261),
(1067, 0, 5, 11261),
(1068, 0, 6, 11261),
(1069, 0, 1, 11262),
(1070, 0, 2, 11262),
(1071, 0, 3, 11262),
(1072, 0, 4, 11262),
(1073, 0, 5, 11262),
(1074, 0, 6, 11262),
(1075, 0, 1, 11263),
(1076, 0, 2, 11263),
(1077, 0, 3, 11263),
(1078, 0, 4, 11263),
(1079, 0, 5, 11263),
(1080, 0, 6, 11263),
(1081, 0, 1, 11264),
(1082, 0, 2, 11264),
(1083, 0, 3, 11264),
(1084, 0, 4, 11264),
(1085, 0, 5, 11264),
(1086, 0, 6, 11264),
(1087, 0, 1, 11265),
(1088, 0, 2, 11265),
(1089, 0, 3, 11265),
(1090, 0, 4, 11265),
(1091, 0, 5, 11265),
(1092, 0, 6, 11265),
(1093, 0, 1, 11266),
(1094, 0, 2, 11266),
(1095, 0, 3, 11266),
(1096, 0, 4, 11266),
(1097, 0, 5, 11266),
(1098, 0, 6, 11266),
(1099, 0, 1, 11267),
(1100, 0, 2, 11267),
(1101, 0, 3, 11267),
(1102, 0, 4, 11267),
(1103, 0, 5, 11267),
(1104, 0, 6, 11267),
(1105, 0, 1, 11268),
(1106, 0, 2, 11268),
(1107, 0, 3, 11268),
(1108, 0, 4, 11268),
(1109, 0, 5, 11268),
(1110, 0, 6, 11268),
(1111, 0, 1, 11269),
(1112, 0, 2, 11269),
(1113, 0, 3, 11269),
(1114, 0, 4, 11269),
(1115, 0, 5, 11269),
(1116, 0, 6, 11269),
(1117, 0, 1, 11270),
(1118, 0, 2, 11270),
(1119, 0, 3, 11270),
(1120, 0, 4, 11270),
(1121, 0, 5, 11270),
(1122, 0, 6, 11270),
(1123, 0, 1, 11271),
(1124, 0, 2, 11271),
(1125, 0, 3, 11271),
(1126, 0, 4, 11271),
(1127, 0, 5, 11271),
(1128, 0, 6, 11271),
(1129, 0, 1, 11272),
(1130, 0, 2, 11272),
(1131, 0, 3, 11272),
(1132, 0, 4, 11272),
(1133, 0, 5, 11272),
(1134, 0, 6, 11272),
(1135, 0, 1, 11273),
(1136, 0, 2, 11273),
(1137, 0, 3, 11273),
(1138, 0, 4, 11273),
(1139, 0, 5, 11273),
(1140, 0, 6, 11273),
(1141, 0, 1, 11274),
(1142, 0, 2, 11274),
(1143, 0, 3, 11274),
(1144, 0, 4, 11274),
(1145, 0, 5, 11274),
(1146, 0, 6, 11274),
(1147, 0, 1, 11275),
(1148, 0, 2, 11275),
(1149, 0, 3, 11275),
(1150, 0, 4, 11275),
(1151, 0, 5, 11275),
(1152, 0, 6, 11275),
(1153, 0, 1, 11276),
(1154, 0, 2, 11276),
(1155, 0, 3, 11276),
(1156, 0, 4, 11276),
(1157, 0, 5, 11276),
(1158, 0, 6, 11276),
(1159, 0, 1, 11277),
(1160, 0, 2, 11277),
(1161, 0, 3, 11277),
(1162, 0, 4, 11277),
(1163, 0, 5, 11277),
(1164, 0, 6, 11277),
(1165, 2.6, 1, 11278),
(1166, 1.2, 2, 11278),
(1167, 0, 3, 11278),
(1168, 0, 4, 11278),
(1169, 0, 5, 11278),
(1170, 0, 6, 11278);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cotizacion`
--

CREATE TABLE `t_cotizacion` (
  `Id_Cotizacion` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Id_Clientes_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_cotizacion`
--

INSERT INTO `t_cotizacion` (`Id_Cotizacion`, `Fecha`, `Id_Clientes_FK`) VALUES
(1, '2022-01-05', 204),
(2, '2022-01-10', 775),
(3, '2022-01-10', 50),
(4, '2022-01-10', 50),
(5, '2022-01-11', 213),
(6, '2022-01-11', 213),
(7, '2022-01-11', 222),
(8, '2022-01-11', 222),
(9, '2022-01-11', 219),
(10, '2022-01-14', 110),
(11, '2022-01-14', 198),
(12, '2022-01-14', 709),
(13, '2022-01-14', 709),
(14, '2022-01-14', 709),
(15, '2022-01-17', 31),
(16, '2022-01-17', 31),
(17, '2022-01-18', 110),
(18, '2022-01-18', 110),
(19, '2022-01-18', 110),
(20, '2022-01-18', 110),
(21, '2022-01-18', 110),
(22, '2022-01-18', 110),
(23, '2022-01-18', 110),
(24, '2022-01-18', 110),
(25, '2022-01-18', 417),
(26, '2022-01-18', 776),
(27, '2022-01-18', 417),
(28, '2022-01-18', 417),
(29, '2022-01-18', 202),
(30, '2022-01-20', 213),
(31, '2022-01-20', 767),
(32, '2022-01-20', 767),
(33, '2022-01-20', 767),
(34, '2022-01-20', 581),
(35, '2022-01-20', 581),
(36, '2022-01-21', 725),
(37, '2022-01-21', 417),
(38, '2022-01-24', 129),
(39, '2022-01-24', 767),
(40, '2022-01-24', 767),
(41, '2022-01-26', 767),
(42, '2022-01-26', 110),
(43, '2022-01-26', 110),
(44, '2022-01-26', 581),
(45, '2022-01-26', 204),
(46, '2022-01-26', 204),
(47, '2022-01-28', 31),
(48, '2022-01-28', 767),
(49, '2022-01-28', 688),
(50, '2022-02-02', 222),
(51, '2022-02-02', 222),
(52, '2022-02-03', 222),
(53, '2022-02-03', 222),
(54, '2022-02-03', 222),
(55, '2022-02-04', 137),
(56, '2022-02-04', 767),
(57, '2022-02-08', 66),
(58, '2022-02-09', 627),
(59, '2022-02-10', 50),
(60, '2022-02-10', 31),
(61, '2022-02-10', 31),
(62, '2022-02-10', 110),
(63, '2022-02-11', 110),
(64, '2022-02-11', 110),
(65, '2022-02-11', 110),
(66, '2022-02-11', 110),
(67, '2022-02-11', 110),
(68, '2022-02-11', 110),
(69, '2022-02-11', 110),
(70, '2022-02-16', 186),
(71, '2022-02-16', 143),
(72, '2022-02-16', 776),
(73, '2022-02-17', 148),
(74, '2022-02-17', 417),
(75, '2022-02-17', 231),
(76, '2022-02-17', 219),
(77, '2022-02-18', 627),
(78, '2022-02-18', 627),
(79, '2022-02-21', 767),
(80, '2022-02-21', 767),
(81, '2022-02-21', 767),
(82, '2022-02-21', 767),
(83, '2022-02-21', 767),
(84, '2022-02-22', 66),
(85, '2022-02-23', 227),
(86, '2022-02-23', 206),
(87, '2022-02-23', 129),
(88, '2022-02-24', 129),
(89, '2022-02-25', 296),
(90, '2022-03-01', 767),
(91, '2022-02-25', 296),
(92, '2022-03-02', 767),
(93, '2022-03-02', 767),
(94, '2022-03-02', 767),
(95, '2022-03-02', 767),
(96, '2022-03-02', 767),
(97, '2022-03-02', 99),
(98, '2022-03-02', 99),
(99, '2022-03-03', 43),
(100, '2022-03-03', 43),
(101, '2022-03-03', 43),
(102, '2022-03-03', 43),
(103, '2022-03-03', 219),
(104, '2022-03-03', 219),
(105, '2022-03-04', 99),
(106, '2022-03-08', 204),
(107, '2022-03-03', 204),
(108, '2022-03-08', 59),
(109, '2022-03-08', 709),
(110, '2022-03-09', 767),
(111, '2022-03-10', 581),
(112, '2022-03-10', 213),
(113, '2022-03-10', 216),
(114, '2022-03-10', 216),
(115, '2022-03-10', 152),
(116, '2022-03-10', 152),
(117, '2022-03-10', 152),
(118, '2022-03-10', 152),
(119, '2022-03-10', 767),
(120, '2022-03-11', 137),
(121, '2022-03-11', 137),
(122, '2022-03-11', 137),
(123, '2022-03-11', 767),
(124, '2022-03-11', 767),
(125, '2022-03-11', 767),
(126, '2022-03-11', 767),
(127, '2022-03-11', 767),
(128, '2022-03-11', 222),
(129, '2022-03-18', 219),
(130, '2022-03-18', 219),
(131, '2022-03-18', 213),
(132, '2022-03-18', 417),
(133, '2022-03-18', 219),
(134, '2022-03-18', 219),
(135, '2022-03-22', 219),
(136, '2022-03-22', 59),
(137, '2022-03-22', 231),
(138, '2022-03-24', 143),
(139, '2022-03-25', 115),
(140, '2022-03-28', 110),
(141, '2022-03-28', 110),
(142, '2022-03-28', 110),
(143, '2022-03-28', 110),
(144, '2022-03-28', 296),
(145, '2022-03-28', 767),
(146, '2022-03-31', 767),
(147, '2022-03-31', 222),
(148, '2022-03-31', 417),
(149, '2022-04-05', 767),
(150, '2022-04-05', 767),
(151, '2022-04-07', 767),
(152, '2022-04-07', 767),
(153, '2022-04-07', 767),
(154, '2022-04-07', 213),
(155, '2022-04-07', 207),
(156, '2022-04-07', 581),
(157, '2022-04-08', 207),
(158, '2022-04-07', 767),
(159, '2022-04-08', 129),
(160, '2022-04-08', 716),
(161, '2022-04-12', 222),
(162, '2022-04-13', 222),
(163, '2022-04-13', 222),
(164, '2022-04-13', 767),
(165, '2022-04-13', 202),
(166, '2022-04-13', 24),
(167, '2022-04-18', 24),
(168, '2022-04-19', 24),
(169, '2022-04-20', 725),
(170, '2022-04-27', 767),
(171, '2022-04-27', 110),
(172, '2022-04-27', 110),
(173, '2022-04-27', 110),
(174, '2022-04-27', 110),
(175, '2022-04-27', 110),
(176, '2022-04-27', 137),
(177, '2022-04-27', 204),
(178, '2022-04-27', 204),
(179, '2022-04-27', 183),
(180, '2022-04-27', 183),
(181, '2022-04-27', 183),
(182, '2022-04-27', 183),
(183, '2022-04-27', 183),
(184, '2022-04-27', 183),
(185, '2022-04-27', 183),
(186, '2022-04-27', 183),
(187, '2022-04-27', 222),
(188, '2022-04-27', 222),
(189, '2022-04-27', 222),
(190, '2022-04-27', 222),
(191, '2022-04-27', 183),
(192, '2022-04-27', 167),
(193, '2022-04-28', 767),
(194, '2022-04-29', 767),
(999999, '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_departamento`
--

CREATE TABLE `t_departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_departamento`
--

INSERT INTO `t_departamento` (`id_departamento`, `nombre_departamento`) VALUES
(1, 'Gerencia'),
(2, 'Calidad'),
(3, 'Galvanoplastico'),
(4, 'Produccion'),
(5, 'Taller Mecanico'),
(6, 'Mantenimiento'),
(7, 'Almacen'),
(8, 'RD6'),
(9, 'Indefinido'),
(10, 'Administracion'),
(11, 'Ventas'),
(12, 'Checador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_direccion`
--

CREATE TABLE `t_direccion` (
  `id_direccion` int(11) NOT NULL,
  `id_empleados_1` int(11) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `noInt` int(11) DEFAULT NULL,
  `noExt` int(11) DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `alcaldia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_direccion`
--

INSERT INTO `t_direccion` (`id_direccion`, `id_empleados_1`, `calle`, `noInt`, `noExt`, `colonia`, `cp`, `alcaldia`) VALUES
(1, 37, 'RET ARCOIRIS Y CIELO DEL SOL', 0, 0, 'SAN  JERONIMO CUATRO VIENTO', 56589, 'IXTAPALUCA, MEX'),
(2, 1, 'MACAHUITE 53', 0, 53, 'EL MOLINO', 9960, 'IZTAPALAPA'),
(3, 2, 'VILLA PODER', 12, 2, 'AMPLIACION POLVORILLA', 9750, 'IZTAPALAPA'),
(4, 3, 'CUAHUTEMOC', 16, 2, 'AMPLIACION LOS REYES', 9840, 'IZTAPALAPA'),
(5, 4, 'AVE 11 N 62 CONJ VEC', 13, 65, 'GRANJAS ESTRELLA', 9850, 'IZTAPALAPA'),
(6, 5, 'BARON GITANO', 0, 8, 'LA NOPALERA', 13220, 'TLAHUAC'),
(7, 6, 'CHICOLOAPAN', 27, 6, 'SANTIAGO ACAHUALTEPEC', 9608, 'IZTAPALAPA'),
(8, 7, 'AV RIO SAN JOAQUIN', 816, 4, 'LOMAS SOTELO', 11200, 'MIGUEL HIDALGO'),
(9, 8, 'GLADIOLA', 0, 5, 'LAS HUERTAS', 53427, 'NAUCALPAN'),
(10, 9, 'VILLA FRUELA', 28, 10, 'DESARROLLO URBANO QUETZALCOATL', 9700, 'IZTAPALAPA'),
(11, 10, 'VILLA FLORIDA', 13, 1, 'DESARROLLO URBANO QUETZALCOATL', 9700, 'IZTAPALAPA'),
(12, 11, 'MARTE', 21, 5, 'LOS REYES', 56383, 'CHICOLOAPAN'),
(13, 12, 'CARDO', 60, 201, 'LA DRAGA', 13273, 'TLAHUAC'),
(14, 13, 'CDA SANTA ANA', 0, 19, 'SAN FRANCISCO CULHUACAN', 4260, 'COYOACAN'),
(15, 14, 'JARDINES BARUN', 24, 102, 'JARDINES DE LAGO', 55607, 'ZUMPANGO'),
(16, 15, 'CALLE ZAPOTL', 349, 24, 'BARRIO HERREROS', 56334, 'MILPA ALTA'),
(17, 16, '', 0, 0, '', 0, ''),
(18, 17, 'MADROÑO', 0, 21, 'CONSEJO AGRARISTA', 9160, ''),
(19, 18, 'RICARDO FLORES MAGON', 0, 9, 'SAN LORENZO LA CEBADA', 16035, 'XOCHIMILCO'),
(20, 19, 'SAN ISIDRO', 21, 552, 'SANTA URSULA COAPA', 4600, 'COYOACAN'),
(21, 20, 'AV. 11', 44, 62, 'GRANJAS ESTRELLA', 9880, 'IZTAPALAPA'),
(22, 21, 'CIUDAD FRESNO', 55, 215, 'CITLALLI', 9660, 'IZTAPALAPA'),
(23, 22, 'CIRCUITO DEL SOL, RETORNO 33', 50, 41, 'CUATRO VIENTOS', 56589, 'IXTAPALUCA'),
(24, 23, 'AV 11', 17, 62, 'GRANJAS ESTRELLA', 9880, 'IZTAPALAPA'),
(25, 24, 'ARCOIRIS Y CIRCUITO DEL SOL RETORNO 3', 23, 44, 'CUATRO VIENTOS', 56589, 'IXTAPALUCA'),
(26, 25, '', 0, 0, '', 0, ''),
(27, 26, 'VERCRUZ', 32, 220, 'MIGUEL DE LA MADRID HURTADO', 9698, 'IZTAPALAPA'),
(28, 27, 'AV. 11', 8, 61, 'GRANJAS ESTRELLA', 9880, 'IZTAPALAPA'),
(29, 28, 'AV. 11', 57, 62, 'GRANJAS ESTRELLA', 9880, 'IZTAPALAPA'),
(30, 29, 'FRANCISCO ABURTO', 2, 6, 'LAS PEÑAS', 9750, 'IZTAPALAPA'),
(31, 30, 'AV. IGNACIO ZARAGOSA', 0, 2980, 'SANTA MARTA ACATITLA NORTE', 9140, 'IZTAPALAPA'),
(32, 31, 'LUIS DONALDO COLOSIO', 9, 7, 'MARGARITA MORON', 56530, 'IZTAPALAPA'),
(33, 32, 'CARABINEROS ', 13, 2, 'LAS COLONIAS', 56600, 'CHALCO'),
(34, 33, '', 0, 0, '', 0, ''),
(35, 34, 'XOCHITPANCO', 15, 0, 'SANTA CRUZ ACALPIXCA', 16500, 'XOCHIMILCO'),
(36, 35, 'CARLOS BEJARANO', 0, 203, 'LA CONCHITA', 13360, 'IZTAPALAPA'),
(37, 36, 'INOCENCIA ARREOLA', 36, 290, 'SANTA MARTHA ACATITLA', 9510, 'IZTAPALAPA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_empleados`
--

CREATE TABLE `t_empleados` (
  `id_empleados` int(11) NOT NULL,
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
  `id_puesto_1` int(11) DEFAULT NULL,
  `foto` longblob DEFAULT NULL,
  `id_departamento_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_empleados`
--

INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(1, 'ARACELI', 'GONZALEZ', 'MARTINEZ', '1972-09-02', 2147483647, 'araceligonzalezm100@hotmail.com', '2021-07-06', 'GOMA720902MDFNRR06', 'GOMA720902RYA', '4589723699-3', 'ACTIVA', 28, NULL, 11),
(2, 'GILBERTO', 'GARCIA', 'ZALDIVAR', '1961-02-04', 2147483647, 'SIN CORREO ELECTRONICO', '2013-11-11', 'GAZG610204HDFRLL07', 'GAZG6102049Z5', '17826113064', 'ACTIVO', 7, NULL, 5),
(3, 'JAVIER', 'DE LA ROSA', 'CALZADA', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2018-07-24', 'ROCJ750103HDFSLV01', 'ROCJ75010325A', '45947542036', 'ACTIVO', 7, NULL, 5),
(4, 'JOSE MIGUEL CUPERTINO', 'MARTINEZ ', 'HERNANDEZ', '1962-09-18', 2147483647, 'SIN CORREO ELECTRONICO', '2015-07-07', 'MAHM620918HPLRRG07', 'MAHM620918PTA', '06796230388', 'ACTIVO', 1, NULL, 6),
(5, 'ARNULFO', 'MARQUEZ', 'RICO', '1968-12-20', 2147483647, 'SIN CORREO ELECTRONICO', '2003-06-13', 'MARA681220HDFRCR05', 'MARA6812206Q1', '17866879855', 'ACTIVO', 19, NULL, 10),
(6, 'APOLINAR', 'CRUZ', 'GARCIA', '1977-01-05', 2147483647, 'SIN CORREO ELECTRONICO', '2006-03-01', 'CUGA770105HOCRRP03', 'CUGA770105NA7', '45947703224', 'ACTIVO', 9, NULL, 3),
(7, 'AGUSTIN', 'ZAVALA', 'CRUZ', '1970-03-02', 2147483647, 'alexisher293@gmail.com', '2019-04-23', 'ZACA700302HDFVRG04', 'ZACA700302FS0', '01887011755', 'ACTIVO', 21, NULL, 4),
(8, 'ZENEN', 'TELLEZ', 'AVILA', '1973-03-30', 0, 'SIN CORREO ELECTRONICO', '2015-01-27', 'TEAZ730730HHGLVN05', 'TEAZ730730V40', '90897314598', 'ACTIVO', 6, NULL, 9),
(9, 'JHONATHAN ANTONIO', 'JIMENEZ', 'CARRILLO', '0000-00-00', 2147483647, 'SIN CORREO ELECTRONICO', '2019-07-17', 'JICJ830718HDFMRN07', 'JICJ830718KN1', '03198306411', 'ACTIVO', 2, NULL, 9),
(10, 'PRISCILA', 'MARGARITO', 'LIZARDO', '2000-12-28', 2147483647, 'priscilamargarito117@gmail.com', '2019-03-04', 'MALP001228MDFRZRA7', 'MALP001228A88', '42150041616', 'ACTIVA', 1, NULL, 9),
(11, 'MARTIN', 'NAVARRO', 'RODRIGUEZ', '1963-10-17', 2147483647, 'SIN CORREO ELECTRONICO', '2020-01-23', 'NARM631017HDFVDR07', 'NARM631017CA1', '17816306041', 'ACTIVO', 1, NULL, 9),
(12, 'EDUARDO ALEJANDRO', 'FLORES', 'RAMOS', '1994-03-20', 2147483647, 'alejandrofr546@gmail.com', '2020-06-12', 'FORE940320MDFLMD07', 'FORE940320MM5', '08149463112', 'ACTIVO', 6, NULL, 9),
(13, 'CAROLINA ', 'REYES', 'ROSAS', '1987-10-31', 2147483647, 'caro.2431@gmail.com', '2020-06-25', 'RERC871031MVZYSR05', 'RERC871031MR7', '42118706771', 'ACTIVA', 1, NULL, 2),
(14, 'ALAN GUILLERMO', 'ZAVALA', 'LOPEZ', '1992-02-18', 2147483647, 'alanrocklink@hotmail.com', '2021-06-09', 'ZALA920218HDFVPL14', 'ZALA920218FK5', '92109211406', 'ACTIVO', 1, NULL, 4),
(15, 'GABRIEL', 'CASTAÑEDA', 'GOMORA', '1995-09-25', 2147483647, 'SIN CORREO ELECTRONICO', '2021-06-15', 'CAGG950929HDFSMB04', 'CAGG950929AZ0', '17159539703', 'ACTIVO', 1, NULL, 4),
(16, 'JUAN LUIS', 'CRISPIN', 'ORTEGA', '2000-12-09', 2147483647, 'SIN CORREO ELECTRONICO', '2021-07-13', 'CIOJ001209HDFRRNA0', 'CIOJ0012099T0', '27170082914', 'ACTIVO', 1, NULL, 4),
(17, 'ERICK MANUEL', 'AGUILAR', 'LUGO', '1993-07-31', 2147483647, 'erikmurdo477@gmail.com', '2021-07-13', 'AULE930731HDFGGR01', 'AULE930731RZ4', '45119392319', 'ACTIVO', 1, NULL, 4),
(18, 'NAYELI BETZABET', 'CALDERON', 'REYES', '1976-08-03', 2147483647, 'nayelibetzabet03@gmail.com', '2021-07-13', 'CARN760803MDFLYY03', 'CARN760803V59', '37947605616', 'ACTIVA', 1, NULL, 4),
(19, 'RODRIGO', 'MENDOZA', 'HERNANDEZ', '2000-02-16', 2147483647, 'toto123.rh@gmail.com', '2021-07-13', 'MEHR000216HDFNRDA5', 'MEHR0002166N8', '08160083526', 'ACTIVO', 13, NULL, 7),
(20, 'KEVIN YAEL', 'ZARATE ', 'PRADO', '2002-01-12', 2147483647, 'yaelprado73@gmail.com', '2021-07-13', 'ZAPK020112HDFRRVA6', 'ZAPK020112NR9', '74170239508', 'ACTIVO', 13, NULL, 7),
(21, 'IVAN', 'CALDERON', 'GUZMAN', '1991-07-22', 2147483647, 'ivancalderon22071992@gmail.com', '2021-07-13', 'CAGI920722HDFLZV09', 'CAGI920722ITA', '42129201671', 'ACTIVO', 1, NULL, 4),
(22, 'KARLA JAZMIN', 'CRUZ', 'LOPEZ', '2001-02-03', 2147483647, 'cruzlopezkarla201140021@gmail.com', '2021-03-29', 'CULK010203MMCRPRA9', 'CULK010203DD0', '17150121220', 'ACTIVA', 2, NULL, 4),
(23, 'MIRIEL ANGEL', 'MARES', 'MEDRANO', '2002-03-21', 0, 'angel21mares@gmail.com', '2021-07-13', 'MAMM020321HDFRDRA1', 'MAMM0203211EA', '0418028331', 'ACTIVO', 1, NULL, 9),
(24, 'XOCHITL', 'QUINTANA', 'ZENTENO', '1997-08-21', 2147483647, 'xochitl.quintana@hotmail.com', '2021-06-21', 'QUZX970821MDFNNC07', 'QUZX970821RA9', '05219718029', 'ACTIVA', 24, NULL, 10),
(25, 'ABEDEL', 'GARCIA', 'GRANADOS', '1991-03-13', 0, 'abdl13gs@gmail.com', '2021-07-07', 'GAGA910313HDFRRB05', 'GAGA910313R96', '62169107745', 'ACTIVO', 3, NULL, 2),
(26, 'BERTHA NAYELI', 'HILPAS', 'XIMELLO', '1996-09-06', 2147483647, 'nayelibhilpas@gmail.com', '2021-07-13', 'HIXB960906MMCLMR03', 'HIXB960906M3A', '62169651890', 'ACTIVA', 2, NULL, 4),
(27, 'CESAR EMILIO', 'CANUL', 'TRUJILLO', '2000-12-29', 0, 'cesarcanultrujillo71@gmail.com', '2021-07-01', 'CATC001229HDFNRSA8', 'CATC001229CGA', '04170099222', 'ACTIVO', 1, NULL, 4),
(28, 'LUIS AXEL', 'LOPEZ', 'CRESCENCIO', '2001-04-02', 2147483647, 'SIN CORREO ELECTRONICO', '2021-07-13', 'LOCL010402HMCPRSA4', 'LOCL010402HMC', '46190198237', 'ACTIVO', 1, NULL, 9),
(29, 'JOSE RITO', 'LARA', 'SIMON', '1992-04-27', 2147483647, 'larasimonj@gmail.com', '2021-06-05', 'LASR920427HCSRMT07', '0', '44149209197', 'ACTIVO', 1, NULL, 2),
(30, 'GUSTAVO', 'CORREA', 'APARICIO', '1964-04-15', 0, 'gustavocorrea7461@gmail.com', '2021-08-01', 'COAG640415HMNRPS05', 'COAG6404156S9', '10806411723', 'ACTIVO', 12, NULL, 4),
(31, 'FERNANDO MICHAEL', 'ONOFRE', 'CARRILLO', '1986-12-29', 0, 'fernandosegura@email.com', '2021-08-01', 'OOCF861229HDFNRR05', 'OOCF8612229', '96038616064', 'ACTIVO', 1, NULL, 9),
(32, 'EDGAR', 'TIMOTEO ', 'ROMERO', '1998-04-02', 2147483647, 'edgartimo18@gmail.com', '2021-08-01', 'TIRE980402HMCMMD05', 'TIRE980402QQ9', '1616987578', 'ACTIVO', 1, NULL, 4),
(33, 'MARCO ANTONIO', 'SANCHEZ', ' APRECIADO ', '0000-00-00', 0, '', '0000-00-00', '', '', '0', 'ACTIVO', 13, NULL, 9),
(34, 'KATY ARELI', 'GARCÍA', 'VICTORIA', '0000-00-00', 0, 'comprasfmtor@gmail.com', '2021-07-26', 'GAVK990429MDFRCT07', 'GAV9904293G0', '45149955739', 'ACTIVA', 17, NULL, 10),
(35, 'ESBEYDI PATSY', 'IBAÑEZ', 'TORRES', '1995-08-03', 2147483647, 'patsyt521@gmail.com', '2021-08-24', 'IATE950803MDFBRS09', 'IATE950803LV1', '45139508530', 'ACTIVA', 28, NULL, 11),
(36, 'RICARDO', 'FLORES', 'APRECIADO', '0000-00-00', 0, 'rdgtornillos@hotmail.com', '2021-02-15', 'FOAR900824HDFLPC03', 'FOAR9008245H0', '0', 'ACTIVO', 17, NULL, 1),
(37, 'ENRIQUE GERARDO', 'FLORES', 'NAVA', '0000-00-00', 0, 'gerard389@hotmail.com', '1979-01-01', 'FONE680411HDFLVN07', 'FONE580411VC7', '0', 'ACTIVO', 25, NULL, 1),
(38, 'FELIPE JESUS', 'RIVERA', 'DUARTE', '1959-11-18', 0, 'SIN CORREO ELECTRONICO', '2021-09-06', 'RIDF591118HDFVRL03', 'RIDF591118HY5', '11785911170', 'ACTIVO', 1, NULL, 9),
(81, 'Beatriz', 'Valdez', 'Jimenez', '1996-11-23', 2147483647, 'betsedla@gmail.com', '2021-08-28', 'VAJB961123MDFLMT01', 'VAJB961123MDFLMT01', '1234567891', 'ACTIVO', 26, 0x307866666438666665303030313034613436343934363030303130313030303030313030303130303030666664623030343330303032303130313031303130313032303130313031303230323032303230323034303330323032303230323035303430343033303430363035303630363036303530363036303630373039303830363037303930373036303630383062303830393061306130613061306130363038306230633062306130633039306130613061666664623030343330313032303230323032303230323035303330333035306130373036303730613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061666663303030313130383031613230323938303330313232303030323131303130333131303166666334303031663030303030313035303130313031303130313031303030303030303030303030303030303031303230333034303530363037303830393061306266666334303062353130303030323031303330333032303430333035303530343034303030303031376430313032303330303034313130353132323133313431303631333531363130373232373131343332383139316131303832333432623163313135353264316630323433333632373238323039306131363137313831393161323532363237323832393261333433353336333733383339336134333434343534363437343834393461353335343535353635373538353935613633363436353636363736383639366137333734373537363737373837393761383338343835383638373838383938613932393339343935393639373938393939616132613361346135613661376138613961616232623362346235623662376238623962616332633363346335633663376338633963616432643364346435643664376438643964616531653265336534653565366537653865396561663166326633663466356636663766386639666166666334303031663031303030333031303130313031303130313031303130313030303030303030303030303031303230333034303530363037303830393061306266666334303062353131303030323031303230343034303330343037303530343034303030313032373730303031303230333131303430353231333130363132343135313037363137313133323233323831303831343432393161316231633130393233333335326630313536323732643130613136323433346531323566313137313831393161323632373238323932613335333633373338333933613433343434353436343734383439346135333534353535363537353835393561363336343635363636373638363936613733373437353736373737383739376138323833383438353836383738383839386139323933393439353936393739383939396161326133613461356136613761386139616162326233623462356236623762386239626163326333633463356336633763386339636164326433643464356436643764386439646165326533653465356536653765386539656166326633663466356636663766386639666166666461303030633033303130303032313130333131303033663030666433306132386132626562306631633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861326234623436663036663862336334303836356431376333623762373638303766616338366439393937663363363239333934363261656438643236636364613262626564303366363666663839356163613039656565643664623466343237666535663237663962316561313530333765343731356438653864666232383638663163363864616666383965653635376365363435623438643633356661303264623866653335636433633665316139656632626661366136393161333532356430663130613339616661353663336636373866383533363230366664303165653065303864643731373732316366653030383166613536613639666630386265316136393837333662653062623032373966663030356630663962666630306131653662303936363734353663396665303638623062336561636639353866643238616661353765323035383763316166303765383866373365323466306265393438616561343437366630643963366233346137643133363830373365663930303761386166396236653165323932653234393230386236323333393238393963656431396530363762643734363162313166353834646138623436353532396662333736623863613238613262613463633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323964313435326366326163333034346365656537306138386239323466613030336164303033363830306231646161333234663430326264323763306266623336373861376334353161656131653235393962346162373630306163366631366539396336376136646338643963373733636662353761663738336665313266383162633130383065386661333233346333303464643563666566323463386565303966626265626336326238366236336538643237363561626665626139626333306633393661663433633133633331663034626532333738613437393930363832663639313630316633623530303632303437623032333237663031356538626531636664393537343462363331636665323766313063623734373166336331366339653561363764333731323439316639316166356230333033313435373964353331663838613962336232663233616133383761373164663533396566306637633262663837646531373664666133663835616435356639633439326139393563376165313963393232626130313161326138353534303030313830303065393462343537316361353239336263396463643932346236306330316430353134353134383631353931653363663133316630366638343666626334636236396537396234383833326335626636656532343830333237623063396164376163656631363738373263376335646531656261663065366132363431306464323664373331333631383630383230386663343061613866326633326536643834656636643066393562633537653262643666633639616434626166366264373565363464323163326138653136333565636161336230316665373961636461656366653234376331326631346663336636333761313464663639653466313737306337636166313933626437396462646639633931656664616238636166613661353361353238326636376231653534393439346264656463323861323861643039306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386165636265313166633234643462653233656135663639623930663036393730336532653665343065356366356438396561376434663631663830333135326134323934316361356232326133313733393539313939653031663836666532366638383961383764393334346235646230613330313731373932663131633433666139663631636665316364376266376333616638333565313766383764303234643064626135646466653366373937663361303263306637643833663830373364623933646339616538623430663065653864653137643332336431663432623034623762373838363132333431666139336434393365613739616262356531363237313935326262623264323364626663636566613534323334663537616230653934353134353731396238353134353134303035313435313430303531343531343030353134353134303064393631386137386363353334366165616330383635363139303431656130643739306663353866643964323262623132663838626330333061633732663264333639613330313566663030656239666637346666623237383364623164326264383238616436393536613934323563643036343465396336613262333365333662386237396564323737623562393835613339323336326232323361653061393164343131346361666134626532646663313664323765323064626236613961376564623664353931376534396330663936366330653135663166346330336434376266346166396462353864316235356630666561333265393361643538343936643731306236316532393537303437626662386634323338333565663631623135306334343734646662316537353461353261366663386164343531343537343939383531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353030313632313534363439653830353030373435663063666531656561336631313763343839613464623636336237386630663762373338653233346366666538343761303166653036626539666430623434643337633362613534316133363933366162306462646263363132323435663431656265613466353237623961653666653062373830613166303237383332313832363835376564623736303464376166623038366463343730383733636663613065336562396635616562656265376631393838373565613539366362366666303033336431613134643432333765616332386132386165333337306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306165333365326666303063323662326638386661343839326434616331613935616139333662333931633337666433333666663634666166363363666138336439643135353039636139633934613265636431333238613932623333653339643433346662656432366661356433333532623636383665323037323933343465333035353837353135306437626366656431626630626133643662343936663163653866303835626262323866663030643331313431636364313761653364353739333966346366613061663036616661336333353738653232396633326466613965366435613665396361633134353134353665363631343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356435666331356630633237386137653233653966363933326162343536663237646136363536303038363534633163313037613832646234376533356361353761396665636135363331636465326564343666646231626131643363323238323366626365626365376237646466643662306335343963333066323662623161353235636435313233646534373465393435313435376364316561303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303064396132343961333331343862393536313836303762386166393562653238663834626665313039663162646636383731343435366463343965363561363562333938396239356537646261376531356635353961663037666461623664353233663135653939373630396463666137393436663463326239323366663030343233356466393735343731633437326634363865366334633666346566643866326261323861326264643338303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303262643662663634646666393066656166663030663565373166666538363662633936626437376636346238323536643633353962393062663232646234346163373364303936363233663931616535633666663030626163386436383766313531656466343531343537636539653938353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303133386564356531646662353934353238643733343739643930383436623539353535626434383631393166613866636562646336626336336636623866663030353961303766626237356666303062346162616630336665663531663966653436333838666531333363366138613238616661313363643061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061663635666439316330646661663963373662356666303064616235653335356563626662323339316266356631656436626666303062353662393331646665656232663937653636643433663861386636376132386132626537386634383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032626336336636623866663030353961303766626237356666303062346162643965626336336636623866663539613037666262373566666234616261663033666566353166396665343633383866653133336336613861323861666131336364306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306166366566643932643533666232623561393336386464663638383431333865373162356162633436626462666636346166663030393034366235666630303566353066663030653832643563373866663030663735393763626633333763336666313531656262343531343537636639653838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303537386337656437316665623334306666303037366562666630303639353762336437386337656437316665623334306666373665626666363935373565303766646561336633666338633731316663323637386435313435313566343237396131343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356564666630306232353766633832333561666661666138376666303034313661663130616636666630306439326266653431316164376664376363336666303061306235373236336666303064643635663266636364663066663030633534376165643134353135663363376132313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135653331666235633766616364303366646462616666646135356563663565333166623563376661636430336664646261666630306461353564373831666630303761386663666632333163343766303939653335343531343537643039653638353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031643666633234663835643337633465643561653264356235316662326462356134346166336361613831393839363338353530303931643730373965643866376166373466383539663062616462653138646235653561646165616232356430626239313163393932333062623736383233623165376164373962666563396437663134376532306435623462366662663335396337326166643131383833666661313861663733616630663166353661666236373464626433343362663066303837323239373530613238613262636633613432386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326263656265336366633266663133376334383962343931653165333663303539616366653733356334613534363562636263303138303733663734643761326430343865666539356135326162326133336537386565383939633534653336363763383765323966306336616665306564373236663066656237303834623838303863656433393536303436343135336463316163666165663766363931626138326537653238346539303963393836643231343763306538373665656665343435373035356634393436366561353238633965656431653563643238636461343134353134353638343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031653935666232636364316335663131616531316462303634643232343534316561376363386365336632303662653832616639616266363737626631363366313536633135613430616233633533343437323333396664643932303765363035376432613065373931643262633263633935623133376565393165383631396665656332386132386165303361303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032393039633733346234386330313163386131383166326666633730363537663861626163393436303437396561333230663766326437333563613536643763343862633137666630303130333561626135303330373534396330646137323038306534363766346163356166613861326164343632626339376534373933333737396230613238613262343234323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306462663836666138343161353738666234376266626136646231633761383435626462336430313630333366346536626562303433393561663864303132306534316337643262656163663836316532643866633662653061623164373436303438643136636238353037323536343566393562336638386338636636323262633863636539626263363766323362333062326465323734313435313435373934373630353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303533326536653232623538316565323737306138383835393938663630303634396137643731396631653763346631373836626531636465323839353936366265356662326462656465613462376465666137636131616161313037353236613262613933323661333136643966333535643465663733373332356334386535396134373263636337613932346537333531643134353764353165343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373739663031626532343565663833376335333136383933396466363161613563323435326131363033636237363231353634633965633333636662376432623833613932636565653762306263386166656435663663623034616232343664386538633065343166636562336162346533353639623862656135343234653332626133656338613261386638363735383866633431653165623264373232303032646464623234633030333963366535303731663835356561663937623335613333643635616130613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830316233346139303436643263383730616133323464376363666630303139626532376339663131376334303035393333326539623637393562343863663162633965623231316561373831386563303762396166373866386233616534396531636638373561623661623036376363356235333163363431653863653432303366383136636665313566326164376162393664323464626138666136383865346335346461623434323861323861663563653230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303365393766643965663530376266663030383533613737396137326430333462313732643965303438643866613730343537366235653364666232393738386663636233643462633264326361333331346162373330323165613433306461666630303830323133666566616166363131636437636465326133633938393932663366636366353238636239613961363134353134353733396130353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353037313833396130306632386664616162356637623466306464383738376132396330666236356431393235343164353931303766326362306663616263326162623866646131336334653965323366383931373130646262623138623465343136616130653731623937323563653366646532343765313563336437643136306139626137383638613764373566626366333262346239616133306132386132626138633832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306538336531376638623866383233633666363361666239666463616338363362393037666537396230646163376630636537663061666161363039653162393831326532303935356533373530633865613732313831653834316166386462656235656535666233386663353231613964393266383066356362613032653264613366663030383937626262376661643863373534316565613361373763363764326263626363363833393266366231653962666131643538366138393365353637616435313435313565333964633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135386665336366313535616638333763323737646532316239336665613231336535616533336239636630613366656661323262363039303361643738303765643164663132323366313236623462653066643236363264363961373461376564306530663132636664303866613266323365613466623161646630643435643761636133643361666131396435613861396331623363646165656561653266616561346264626239396134393636373266326262316535393839633932376631613865386132626539373633636230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306139326365663265623466626138656661636137363861363835633363353232316331353630373230386138653861303066613762653061663865616666303065323037383330366166616134306139373130356331623739396434663132623261613964663863306336373737346165626162383466643963373466313635663062326365356438343335636366333461643935633766313935316635653134373335646464376363353735313864363932386564373364356136646238323663323861323861633862306132386132383030613238613238303061323861323830306132386132383030613238613238303339376638636261646464663837626531626561626139643834636631636332313538653339313361613937373534633866346662646437623537636238636363656335646438623132373234393339323464376432626662343239323365313365613938663538336666303034376135376364333565643635383937623136666363653063353566396437613035313435313565393163633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303764346666303832643633623566383637613234373139323431623034363339663536663938666561366261356163626630343538376636363738336234616433636161383330653966306139306264333231303637663561643461663935396262643439336633376639396562343535613238323861323861393238323861323861303032386132386130303238613238613030323861323861303032386132386130306531666636386139653238376531336561303932333630636232633061383364346639616137663930333566333564376431626662346237666339326539626665626636316665363662653732616636663263666630303737376561636530633537663133653431343531343537613237333035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353462363536656437393739313561323130306362323261303237613032346532626134663834626630653236663839316532356665636639323437386163656464343439376233323065343265373835303761303237663930323762353762643639316630356265313936386336333936643763323536656432343766373565373636393065373230653765363237396533663061653363343633323964303763626262333661373432353531356661316434343638393134366231633661313535353430353535313830303532643134353763663965393035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303165376666303062346239316666306162653531666634666230666633333566333964376438336163363835613366383836636666303062336635636433613262613833373836663236373430636134386538373036626338666533633763313464303734386430646263356665306664336665636336646462333762366231363461333231323036663531666333386565303731386537386337336539653033313334653961663635326561663733393331313461353237636338663161613238613262643933383832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238303039333830323830336465626636353664316131623666303735663662333831653635643566656336336665636132306330666364646266336166353261653562653063663836366533633237663065656333346362636666303035636538363739393736653061623366636462346662383034306663326261396166393963343464353461663239326565376139343937326433343832386132386163346430323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326161366264363131656139613235653639643261613931373136623234363737616534373261343732336266356162373438643964613731343663656530663534376336396433386132626131663861376531323966633137653338626564316464356263613639346362366163633431646431333132343165336631316635303662396561666161383439346532613462613965343439333862623330613238613261383431343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313461616163656331313134393234653030303238303132626164663832356531303165333066383833363936663361383336663636376564353732303863656535343233306264306630353861383365643961623165313266383039663130626335306332353937346366656365383330306639626138323934323765386238646334653364383066376166363966383535663039373463663836333662336639313765663735373337363133636539396533306130366463663061303734316366373236623833313738626137306136653331373739333361323864313934613439623561316436616138353138303331346234353135653131653830353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430316535376662353037383339623531663065343165326562353839373765396566623265316262393839633830336562383663376664663436626331656265626666303031316538353635653236643065656234306434353439383265653136386534633735303038656133646331633166633262633433633564666232666630303861373462373936653763326237663136613130323863613433323765656536336339653366626164633633396338636661353761643831633535333835336636373337366563373165323238633963623961323866326661326165366235653166643666633339373766363064373734613965643236633634343733633635343931656133336436613964376161396136616538653364353362333061323861323938303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435373437653066663030383535653338663162623262653864613262616462623063666461656537663737313633643433316662646666303163643463613730383262633964393064323732373634386537326165653837653163643762633462373366363364303334386238626239303633373263313131366462396533323466343531656536626462336332316662326666303038363734623531373365326362663764346135323031313063373938613235336466613164636466613764326264326234636431373438643136643435386539316136343136643061663438653038383238666338353739643537333261373164323961626665343734633330623237663136383738623738343366363561643561656636646366386362353834623634323134386236623333626534663730353838646162653963366566663166353266306137633330663033663833313737363833613063353163623830316165363463626338373166656433363731663431383135643030303030633031343537396235373133356562376334663465633735343239343231623231303238313462343531353831613035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313865373334353134303135333535643066343864373664396163663538643361316239383964343836343961333063333037656264326263663363356466623331373834373536326637336531396262396234633930386532326536353862333866343237373066636662663461663465613262346137356161643237373833623131323834323762613365356566313766633136663838316530653632663739613333356435626530396662353538383332613031656638313935666334303165653662393461666232636161396561326239386631386663323066303237386434393962353564316432333963383230356364616532333933396366323438653162616537393036626431613539396235613534356633356665343733346630626663616366393665386166346666313866656363336532386432303962386630616466343761393435383237636137633437323866366534653162663331663461663338643466343864353734356239333637616265396233646163613339663265653232323837316562383364616264326137356539353635656533623963643238346530663534353761323861326235323032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613764626462356364653465623664363936656632633865373039316336613539393866623031633961663436663033666563643765326466313033323564663839653431613535623163333663363031613637353363663061306531376433653665343761353637353262353361326166333736326133303934646439323363646431316534373131633661353938396330353033323439616565336331356662336666303038656663356132336262626262356665636462333765376366626235663963386636386661396663373033646562646262633137663039376331316530363531323639336134616339373030393366366362396333636263666133363365353165633331356432383138313861663265616536353237613533353666333637356333306139376334636531626331626630303363303765313535346238623962316665643162613061303334643761303332653762393534653833663163396637616565323334353864303436383030303036303030336135326431356536636537336139326263396463653938633633313536343832386132386139323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326138656239653162643066633462366336636235656432366465656532633163326366313836646239313832343165616137646337333537613861313336396464303334396133633862633635666232646539393736356165626331356161333561336530653264366566326631393365636333653635316638333537393566386237653164663863376331333337393765323164313235383930666464396434366638646266653034333866633361643764363334633965646130626138396130623938393634343735326165386562393063306635303437376165656135393835366137613462646535663866646537336366306630393661623433653336653964343531356634346638646266363731663035373839353565653734333866666232616538616531306462613066323439663738666663303861663233663162376331356631636638323561346238623864336665643936363837666533663264336536313866353635656162663838633762643761373437316234326236383964396639396362336131353230373235343530373833383334353735393838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353737376630663365303166386237633661323364346235303433613736396563353466396233326665663235353233333934356566646239333831636631396539353964346162346539343739613665633534363132396262323437306430343133356363636236663664306234393233623035343864313732353839653830303164346437613466383162663636396631343662616339376265326339346539393661346534633433306433333866613734356663373931653935656264653036663835646531316630306461383564316234663064373035373663623762333631613539333966356337316634313861653863306330633061663261626536333239363934393562636365626137383634623539313831653064663836396530666630323432313334306432393136356462383762613930366539396665616466643036303536666431343537396232393461366566323737363735323439326430323861323861343330613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613432613066366135613238303338656631616663306566303237386366636362393937346666623164646338646238646464393030616363376265653166373562336466323333656635653364653335666439666263373565313335376263623262363161393561323634393936643031646561303766373933616634663463386166613461386165616133386361663437343465656262333331396430613733336533343230613932313831303431653431613461666137666337626630366263313965336334363965663663376563643738373138626562353031363433386665663736363166356537646562633537633766663032626336356530383266373931343166646131363262623866646136643530393331613865656562386639376633323338656235656235306336643161646133643166396666303039396339353238346531653638653261386132386165633330306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306162396130663837663538663133366137316538666131643834393733373132623030313233356365303634306463346636353139653439653035323638356131366162653235643536316431373435623436396565323736646138386266636339656330373733356634636663326666383566613366633336643163356264623031333565636133666432656630616530633837643030656361336433663133356339386163353437306631656564396235326134656133663233303365313766656366626131373834633433616366383934343737666139303031393534386363353033376662323366383866336434666137303035376133383030306330313435313565306434613935326163623961366565376131313834363061633832386132386138323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239313931356265663238333462343530303739386663356566383039613666383932313937356566303864623437366261386138326432343038626235326534663164376232623633323732303732376166613866303562616235623962316239376233626462373738613638396361633931346138353539313837353034316538366265633833633863353739383763376366383365396532356230376631366638373264336665323633366339666266383632346536653530376230666533313933636635323338663461663462303538633730393261373531653964316636666638303732643761303961653638656537383135313435313565643163323134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313561376530636431336665313234663136363964613131303461646435653436393236306666303030313366333765393961353236613331366662306432626262316565336662336237633339383363333765313935663134366131366330646665613531383734363635663961313834663261613366646566626337663066346166343861366132303538633436336130303030613735376362643561393261623531636535643466353631313530386134383238613238613832383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239306138323330343532643134303166333966656430626630663933633233653262666564616432656434323538366134346261616132363136323934376465343138653939666264663839663461663366616661376265333637383531336335376630663666616463343035653662353466623535623664656131643031336661616565316638643763633335656665303262336162343263663735613766393165373632323163393533346561313435313435373639383035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373466663036626665346138363862666630303566396666623239613238616361626666303235653863613837633638666139363861323861663938336436306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303233626330316163653530343634313864623230666432626533363164323861326264356361376564666338653263356634313638613238616635636534306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830336666666439, 10);
INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(82, 'Perla Beatriz', 'Ramos', 'Lopez', '1994-09-12', 2147483647, 'ramosperla2100@gmail.com', '2021-08-28', 'RALP940912MMCMPR05', 'RALP940912T45', '1234567891', 'ACTIVO', 1, 0x307866666438666665303030313034613436343934363030303130313030303030313030303130303030666664623030343330303032303130313031303130313032303130313031303230323032303230323034303330323032303230323035303430343033303430363035303630363036303530363036303630373039303830363037303930373036303630383062303830393061306130613061306130363038306230633062306130633039306130613061666664623030343330313032303230323032303230323035303330333035306130373036303730613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061666663303030313130383031613230323938303330313232303030323131303130333131303166666334303031663030303030313035303130313031303130313031303030303030303030303030303030303031303230333034303530363037303830393061306266666334303062353130303030323031303330333032303430333035303530343034303030303031376430313032303330303034313130353132323133313431303631333531363130373232373131343332383139316131303832333432623163313135353264316630323433333632373238323039306131363137313831393161323532363237323832393261333433353336333733383339336134333434343534363437343834393461353335343535353635373538353935613633363436353636363736383639366137333734373537363737373837393761383338343835383638373838383938613932393339343935393639373938393939616132613361346135613661376138613961616232623362346235623662376238623962616332633363346335633663376338633963616432643364346435643664376438643964616531653265336534653565366537653865396561663166326633663466356636663766386639666166666334303031663031303030333031303130313031303130313031303130313030303030303030303030303031303230333034303530363037303830393061306266666334303062353131303030323031303230343034303330343037303530343034303030313032373730303031303230333131303430353231333130363132343135313037363137313133323233323831303831343432393161316231633130393233333335326630313536323732643130613136323433346531323566313137313831393161323632373238323932613335333633373338333933613433343434353436343734383439346135333534353535363537353835393561363336343635363636373638363936613733373437353736373737383739376138323833383438353836383738383839386139323933393439353936393739383939396161326133613461356136613761386139616162326233623462356236623762386239626163326333633463356336633763386339636164326433643464356436643764386439646165326533653465356536653765386539656166326633663466356636663766386639666166666461303030633033303130303032313130333131303033663030666433306132386132626562306631633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861326234623436663036663862336334303836356431376333623762373638303766616338366439393937663363363239333934363261656438643236636364613262626564303366363666663839356163613039656565643664623466343237666535663237663962316561313530333765343731356438653864666232383638663163363864616666383965653635376365363435623438643633356661303264623866653335636433633665316139656632626661366136393161333532356430663130613339616661353663336636373866383533363230366664303165653065303864643731373732316366653030383166613536613639666630386265316136393837333662653062623032373966663030356630663962666630306131653662303936363734353663396665303638623062336561636639353866643238616661353765323035383763316166303765383866373365323466306265393438616561343437366630643963366233346137643133363830373365663930303761386166396236653165323932653234393230386236323333393238393963656431396530363762643734363162313166353834646138623436353532396662333736623863613238613262613463633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323964313435326366326163333034346365656537306138386239323466613030336164303033363830306231646161333234663430326264323763306266623336373861376334353161656131653235393962346162373630306163366631366539396336376136646338643963373733636662353761663738336665313266383162633130383065386661333233346333303464643563666566323463386565303966626265626336326238366236336538643237363561626665626139626333306633393661663433633133633331663034626532333738613437393930363832663639313630316633623530303632303437623032333237663031356538626531636664393537343462363331636665323766313063623734373166336331366339653561363764333731323439316639316166356230333033313435373964353331663838613962336232663233616133383761373164663533396566306637633262663837646531373664666133663835616435356639633439326139393563376165313963393232626130313161326138353534303030313830303065393462343537316361353239336263396463643932346236306330316430353134353134383631353931653363663133316630366638343666626334636236396537396234383833326335626636656532343830333237623063396164376163656631363738373263376335646531656261663065366132363431306464323664373331333631383630383230386663343061613866326633326536643834656636643066393562633537653262643666633639616434626166366264373565363464323163326138653136333565636161336230316665373961636461656366653234376331326631346663336636333761313464663639653466313737306337636166313933626437396462646639633931656664616238636166613661353361353238326636376231653534393439346264656463323861323861643039306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386165636265313166633234643462653233656135663639623930663036393730336532653665343065356366356438396561376434663631663830333135326134323934316361356232326133313733393539313939653031663836666532366638383961383764393334346235646230613330313731373932663131633433666139663631636665316364376266376333616638333565313766383764303234643064626135646466653366373937663361303263306637643833663830373364623933646339616538623430663065653864653137643332336431663432623034623762373838363132333431666139336434393365613739616262356531363237313935326262623264323364626663636566613534323334663537616230653934353134353731396238353134353134303035313435313430303531343531343030353134353134303064393631386137386363353334366165616330383635363139303431656130643739306663353866643964323262623132663838626330333061633732663264333639613330313566663030656239666637346666623237383364623164326264383238616436393536613934323563643036343465396336613262333365333662386237396564323737623562393835613339323336326232323361653061393164343131346361666134626532646663313664323765323064626236613961376564623664353931376534396330663936366330653135663166346330336434376266346166396462353864316235356630666561333265393361643538343936643731306236316532393537303437626662386634323338333565663631623135306334343734646662316537353461353261366663386164343531343537343939383531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353030313632313534363439653830353030373435663063666531656561336631313763343839613464623636336237386630663762373338653233346366666538343761303166653036626539666430623434643337633362613534316133363933366162306462646263363132323435663431656265613466353237623961653666653062373830613166303237383332313832363835376564623736303464376166623038366463343730383733636663613065336562396635616562656265376631393838373565613539366362366666303033336431613134643432333765616332386132386165333337306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306165333365326666303063323662326638386661343839326434616331613935616139333662333931633337666433333666663634666166363363666138336439643135353039636139633934613265636431333238613932623333653339643433346662656432366661356433333532623636383665323037323933343465333035353837353135306437626366656431626630626133643662343936663163653866303835626262323866663030643331313431636364313761653364353739333966346366613061663036616661336333353738653232396633326466613965366435613665396361633134353134353665363631343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356435666331356630633237386137653233653966363933326162343536663237646136363536303038363534633163313037613832646234376533356361353761396665636135363331636465326564343666646231626131643363323238323366626365626365376237646466643662306335343963333066323662623161353235636435313233646534373465393435313435376364316561303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303064396132343961333331343862393536313836303762386166393562653238663834626665313039663162646636383731343435366463343965363561363562333938396239356537646261376531356635353961663037666461623664353233663135653939373630396463666137393436663463326239323366663030343233356466393735343731633437326634363865366334633666346566643866326261323861326264643338303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303262643662663634646666393066656166663030663565373166666538363662633936626437376636346238323536643633353962393062663232646234346163373364303936363233663931616535633666663030626163386436383766313531656466343531343537636539653938353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303133386564356531646662353934353238643733343739643930383436623539353535626434383631393166613866636562646336626336336636623866663030353961303766626237356666303062346162616630336665663531663966653436333838666531333363366138613238616661313363643061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061663635666439316330646661663963373662356666303064616235653335356563626662323339316266356631656436626666303062353662393331646665656232663937653636643433663861386636376132386132626537386634383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032626336336636623866663030353961303766626237356666303062346162643965626336336636623866663539613037666262373566666234616261663033666566353166396665343633383866653133336336613861323861666131336364306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306166366566643932643533666232623561393336386464663638383431333865373162356162633436626462666636346166663030393034366235666630303566353066663030653832643563373866663030663735393763626633333763336666313531656262343531343537636639653838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303537386337656437316665623334306666303037366562666630303639353762336437386337656437316665623334306666373665626666363935373565303766646561336633666338633731316663323637386435313435313566343237396131343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356564666630306232353766633832333561666661666138376666303034313661663130616636666630306439326266653431316164376664376363336666303061306235373236336666303064643635663266636364663066663030633534376165643134353135663363376132313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135653331666235633766616364303366646462616666646135356563663565333166623563376661636430336664646261666630306461353564373831666630303761386663666632333163343766303939653335343531343537643039653638353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031643666633234663835643337633465643561653264356235316662326462356134346166336361613831393839363338353530303931643730373965643866376166373466383539663062616462653138646235653561646165616232356430626239313163393932333062623736383233623165376164373962666563396437663134376532306435623462366662663335396337326166643131383833666661313861663733616630663166353661666236373464626433343362663066303837323239373530613238613262636633613432386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326263656265336366633266663133376334383962343931653165333663303539616366653733356334613534363562636263303138303733663734643761326430343865666539356135326162326133336537386565383939633534653336363763383765323966306336616665306564373236663066656237303834623838303863656433393536303436343135336463316163666165663766363931626138326537653238346539303963393836643231343763306538373665656665343435373035356634393436366561353238633965656431653563643238636461343134353134353638343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031653935666232636364316335663131616531316462303634643232343534316561376363386365336632303662653832616639616266363737626631363366313536633135613430616233633533343437323333396664643932303765363035376432613065373931643262633263633935623133376565393165383631396665656332386132386165303361303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032393039633733346234386330313163386131383166326666633730363537663861626163393436303437396561333230663766326437333563613536643763343862633137666630303130333561626135303330373534396330646137323038306534363766346163356166613861326164343632626339376534373933333737396230613238613262343234323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306462663836666138343161353738666234376266626136646231633761383435626462336430313630333366346536626562303433393561663864303132306534316337643262656163663836316532643866633662653061623164373436303438643136636238353037323536343566393562336638386338636636323262633863636539626263363766323362333062326465323734313435313435373934373630353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303533326536653232623538316565323737306138383835393938663630303634396137643731396631653763346631373836626531636465323839353936366265356662326462656465613462376465666137636131616161313037353236613262613933323661333136643966333535643465663733373332356334386535396134373263636337613932346537333531643134353764353165343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373739663031626532343565663833376335333136383933396466363161613563323435326131363033636237363231353634633965633333636662376432623833613932636565653762306263386166656435663663623034616232343664386538633065343166636562336162346533353639623862656135343234653332626133656338613261386638363735383866633431653165623264373232303032646464623234633030333963366535303731663835356561663937623335613333643635616130613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830316233346139303436643263383730616133323464376363666630303139626532376339663131376334303035393333326539623637393562343863663162633965623231316561373831386563303762396166373866386233616534396531636638373561623661623036376363356235333163363431653863653432303366383136636665313566326164376162393664323464626138666136383865346335346461623434323861323861663563653230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303365393766643965663530376266663030383533613737396137326430333462313732643965303438643866613730343537366235653364666232393738386663636233643462633264326361333331346162373330323165613433306461666630303830323133666566616166363131636437636465326133633938393932663366636366353238636239613961363134353134353733396130353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353037313833396130306632386664616162356637623466306464383738376132396330666236356431393235343164353931303766326362306663616263326162623866646131336334653965323366383931373130646262623138623465343136616130653731623937323563653366646532343765313563336437643136306139626137383638613764373566626366333262346239616133306132386132626138633832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306538336531376638623866383233633666363361666239666463616338363362393037666537396230646163376630636537663061666161363039653162393831326532303935356533373530633865613732313831653834316166386462656235656535666233386663353231613964393266383066356362613032653264613366663030383937626262376661643863373534316565613361373763363764326263626363363833393266366231653962666131643538366138393365353637616435313435313565333964633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135386665336366313535616638333763323737646532316239336665613231336535616533336239636630613366656661323262363039303361643738303765643164663132323366313236623462653066643236363264363961373461376564306530663132636664303866613266323365613466623161646630643435643761636133643361666131396435613861396331623363646165656561653266616561346264626239396134393636373266326262316535393839633932376631613865386132626539373633636230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306139326365663265623466626138656661636137363861363835633363353232316331353630373230386138653861303066613762653061663865616666303065323037383330366166616134306139373130356331623739396434663132623261613964663863306336373737346165626162383466643963373466313635663062326365356438343335636366333461643935633766313935316635653134373335646464376363353735313864363932386564373364356136646238323663323861323861633862306132386132383030613238613238303061323861323830306132386132383030613238613238303339376638636261646464663837626531626561626139643834636631636332313538653339313361613937373534633866346662646437623537636238636363656335646438623132373234393339323464376432626662343239323365313365613938663538336666303034376135376364333565643635383937623136666363653063353566396437613035313435313565393163633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303764346666303832643633623566383637613234373139323431623034363339663536663938666561366261356163626630343538376636363738336234616433636161383330653966306139306264333231303637663561643461663935396262643439336633376639396562343535613238323861323861393238323861323861303032386132386130303238613238613030323861323861303032386132386130306531666636386139653238376531336561303932333630636232633061383364346639616137663930333566333564376431626662346237666339326539626665626636316665363662653732616636663263666630303737376561636530633537663133653431343531343537613237333035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353462363536656437393739313561323130306362323261303237613032346532626134663834626630653236663839316532356665636639323437386163656464343439376233323065343265373835303761303237663930323762353762643639316630356265313936386336333936643763323536656432343766373565373636393065373230653765363237396533663061653363343633323964303763626262333661373432353531356661316434343638393134366231633661313535353430353535313830303532643134353763663965393035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303165376666303062346239316666306162653531666634666230666633333566333964376438336163363835613366383836636666303062336635636433613262613833373836663236373430636134386538373036626338666533633763313464303734386430646263356665306664336665636336646462333762366231363461333231323036663531666333386565303731386537386337336539653033313334653961663635326561663733393331313461353237636338663161613238613262643933383832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238303039333830323830336465626636353664316131623666303735663662333831653635643566656336336665636132306330666364646266336166353261653562653063663836366533633237663065656333346362636666303035636538363739393736653061623366636462346662383034306663326261396166393963343464353461663239326565376139343937326433343832386132386163346430323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326161366264363131656139613235653639643261613931373136623234363737616534373261343732336266356162373438643964613731343663656530663534376336396433386132626131663861376531323966633137653338626564316464356263613639346362366163633431646431333132343165336631316635303662396561666161383439346532613462613965343439333862623330613238613261383431343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313461616163656331313134393234653030303238303132626164663832356531303165333066383833363936663361383336663636376564353732303863656535343233306264306630353861383365643961623165313266383039663130626335306332353937346366656365383330306639626138323934323765386238646334653364383066376166363966383535663039373463663836333662336639313765663735373337363133636539396533306130366463663061303734316366373236623833313738626137306136653331373739333361323864313934613439623561316436616138353138303331346234353135653131653830353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430316535376662353037383339623531663065343165326562353839373765396566623265316262393839633830336562383663376664663436626331656265626666303031316538353635653236643065656234306434353439383265653136386534633735303038656133646331633166633262633433633564666232666630303861373462373936653763326237663136613130323863613433323765656536336339653366626164633633396338636661353761643831633535333835336636373337366563373165323238633963623961323866326661326165366235653166643666633339373766363064373734613965643236633634343733633635343931656133336436613964376161396136616538653364353362333061323861323938303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435373437653066663030383535653338663162623262653864613262616462623063666461656537663737313633643433316662646666303163643463613730383262633964393064323732373634386537326165653837653163643762633462373366363364303334386238626239303633373263313131366462396533323466343531656536626462336332316662326666303038363734623531373365326362663764346135323031313063373938613235336466613164636466613764326264326234636431373438643136643435386539316136343136643061663438653038383238666338353739643537333261373164323961626665343734633330623237663136383738623738343366363561643561656636646366386362353834623634323134386236623333626534663730353838646162653963366566663166353266306137633330663033663833313737363833613063353163623830316165363463626338373166656433363731663431383135643030303030633031343537396235373133356562376334663465633735343239343231623231303238313462343531353831613035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313865373334353134303135333535643066343864373664396163663538643361316239383964343836343961333063333037656264326263663363356466623331373834373536326637336531396262396234633930386532326536353862333866343237373066636662663461663465613262346137356161643237373833623131323834323762613365356566313766633136663838316530653632663739613333356435626530396662353538383332613031656638313935666334303165653662393461666232636161396561326239386631386663323066303237386434393962353564316432333963383230356364616532333933396366323438653162616537393036626431613539396235613534356633356665343733346630626663616366393665386166346666313866656363336532386432303962386630616466343761393435383237636137633437323866366534653162663331663461663338643466343864353734356239333637616265396233646163613339663265653232323837316562383364616264326137356539353635656533623963643238346530663534353761323861326235323032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613764626462356364653465623664363936656632633865373039316336613539393866623031633961663436663033666563643765326466313033323564663839653431613535623163333663363031613637353363663061306531376433653665343761353637353262353361326166333736326133303934646439323363646431316534373131633661353938396330353033323439616565336331356662336666303038656663356132336262626262356665636462333765376366626235663963386636386661396663373033646562646262633137663039376331316530363531323639336134616339373030393366366362396333636263666133363365353165633331356432383138313861663265616536353237613533353666333637356333306139376334636531626331626630303363303765313535346238623962316665643162613061303334643761303332653762393534653833663163396637616565323334353864303436383030303036303030336135326431356536636537336139326263396463653938633633313536343832386132386139323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326138656239653162643066633462366336636235656432366465656532633163326366313836646239313832343165616137646337333537613861313336396464303334396133633862633635666232646539393736356165626331356161333561336530653264366566326631393365636333653635316638333537393566386237653164663863376331333337393765323164313235383930666464396434366638646266653034333866633361643764363334633965646130626138396130623938393634343735326165386562393063306635303437376165656135393835366137613462646535663866646537336366306630393661623433653336653964343531356634346638646266363731663035373839353565653734333866666232616538616531306462613066323439663738666663303861663233663162376331356631636638323561346238623864336665643936363837666533663264336536313866353635656162663838633762643761373437316234326236383964396639396362336131353230373235343530373833383334353735393838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353737376630663365303166386237633661323364346235303433613736396563353466396233326665663235353233333934356566646239333831636631396539353964346162346539343739613665633534363132396262323437306430343133356363636236663664306234393233623035343864313732353839653830303164346437613466383162663636396631343662616339376265326339346539393661346534633433306433333866613734356663373931653935656264653036663835646531316630306461383564316234663064373035373663623762333631613539333966356337316634313861653863306330633061663261626536333239363934393562636365626137383634623539313831653064663836396530666630323432313334306432393136356462383762613930366539396665616466643036303536666431343537396232393461366566323737363735323439326430323861323861343330613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613432613066366135613238303338656631616663306566303237386366636362393937346666623164646338646238646464393030616363376265653166373562336466323333656635653364653335666439666263373565313335376263623262363161393561323634393936643031646561303766373933616634663463386166613461386165616133386361663437343465656262333331396430613733336533343230613932313831303431653431613461666137666337626630366263313965336334363965663663376563643738373138626562353031363433386665663736363166356537646562633537633766663032626336356530383266373931343166646131363262623866646136643530393331613865656562386639376633323338656235656235306336643161646133643166396666303039396339353238346531653638653261386132386165633330306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306162396130663837663538663133366137316538666131643834393733373132623030313233356365303634306463346636353139653439653035323638356131366162653235643536316431373435623436396565323736646138386266636339656330373733356634636663326666383566613366633336643163356264623031333565636133666432656630616530633837643030656361336433663133356339386163353437306631656564396235326134656133663233303365313766656366626131373834633433616366383934343737666139303031393534386363353033376662323366383866336434666137303035376133383030306330313435313565306434613935326163623961366565376131313834363061633832386132386138323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239313931356265663238333462343530303739386663356566383039613666383932313937356566303864623437366261386138326432343038626235326534663164376232623633323732303732376166613866303562616235623962316239376233626462373738613638396361633931346138353539313837353034316538366265633833633863353739383763376366383365396532356230376631366638373264336665323633366339666266383632346536653530376230666533313933636635323338663461663462303538633730393261373531653964316636666638303732643761303961653638656537383135313435313565643163323134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313561376530636431336665313234663136363964613131303461646435653436393236306666303030313366333765393961353236613331366662306432626262316565336662336237633339383363333765313935663134366131366330646665613531383734363635663961313834663261613366646566626337663066346166343861366132303538633436336130303030613735376362643561393261623531636535643466353631313530386134383238613238613832383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239306138323330343532643134303166333966656430626630663933633233653262666564616432656434323538366134346261616132363136323934376465343138653939666264663839663461663366616661376265333637383531336335376630663666616463343035653662353466623535623664656131643031336661616565316638643763633335656665303262336162343263663735613766393165373632323163393533346561313435313435373639383035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373466663036626665346138363862666630303566396666623239613238616361626666303235653863613837633638666139363861323861663938336436306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303233626330316163653530343634313864623230666432626533363164323861326264356361376564666338653263356634313638613238616635636534306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830336666666439, 4);
INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(83, 'Jesus Emanuel', 'Romero', 'Sandoval', '1998-08-24', 2147483647, 'emanuel240898@gmail.com', '2021-08-28', 'ROSJ980824HMCMNS07', 'ROSJ980824G45', '1234567891', 'ACTIVO', 1, 0x307866666438666665303030313034613436343934363030303130313030303030313030303130303030666664623030343330303032303130313031303130313032303130313031303230323032303230323034303330323032303230323035303430343033303430363035303630363036303530363036303630373039303830363037303930373036303630383062303830393061306130613061306130363038306230633062306130633039306130613061666664623030343330313032303230323032303230323035303330333035306130373036303730613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061666663303030313130383031613230323938303330313232303030323131303130333131303166666334303031663030303030313035303130313031303130313031303030303030303030303030303030303031303230333034303530363037303830393061306266666334303062353130303030323031303330333032303430333035303530343034303030303031376430313032303330303034313130353132323133313431303631333531363130373232373131343332383139316131303832333432623163313135353264316630323433333632373238323039306131363137313831393161323532363237323832393261333433353336333733383339336134333434343534363437343834393461353335343535353635373538353935613633363436353636363736383639366137333734373537363737373837393761383338343835383638373838383938613932393339343935393639373938393939616132613361346135613661376138613961616232623362346235623662376238623962616332633363346335633663376338633963616432643364346435643664376438643964616531653265336534653565366537653865396561663166326633663466356636663766386639666166666334303031663031303030333031303130313031303130313031303130313030303030303030303030303031303230333034303530363037303830393061306266666334303062353131303030323031303230343034303330343037303530343034303030313032373730303031303230333131303430353231333130363132343135313037363137313133323233323831303831343432393161316231633130393233333335326630313536323732643130613136323433346531323566313137313831393161323632373238323932613335333633373338333933613433343434353436343734383439346135333534353535363537353835393561363336343635363636373638363936613733373437353736373737383739376138323833383438353836383738383839386139323933393439353936393739383939396161326133613461356136613761386139616162326233623462356236623762386239626163326333633463356336633763386339636164326433643464356436643764386439646165326533653465356536653765386539656166326633663466356636663766386639666166666461303030633033303130303032313130333131303033663030666433306132386132626562306631633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861326234623436663036663862336334303836356431376333623762373638303766616338366439393937663363363239333934363261656438643236636364613262626564303366363666663839356163613039656565643664623466343237666535663237663962316561313530333765343731356438653864666232383638663163363864616666383965653635376365363435623438643633356661303264623866653335636433633665316139656632626661366136393161333532356430663130613339616661353663336636373866383533363230366664303165653065303864643731373732316366653030383166613536613639666630386265316136393837333662653062623032373966663030356630663962666630306131653662303936363734353663396665303638623062336561636639353866643238616661353765323035383763316166303765383866373365323466306265393438616561343437366630643963366233346137643133363830373365663930303761386166396236653165323932653234393230386236323333393238393963656431396530363762643734363162313166353834646138623436353532396662333736623863613238613262613463633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323964313435326366326163333034346365656537306138386239323466613030336164303033363830306231646161333234663430326264323763306266623336373861376334353161656131653235393962346162373630306163366631366539396336376136646338643963373733636662353761663738336665313266383162633130383065386661333233346333303464643563666566323463386565303966626265626336326238366236336538643237363561626665626139626333306633393661663433633133633331663034626532333738613437393930363832663639313630316633623530303632303437623032333237663031356538626531636664393537343462363331636665323766313063623734373166336331366339653561363764333731323439316639316166356230333033313435373964353331663838613962336232663233616133383761373164663533396566306637633262663837646531373664666133663835616435356639633439326139393563376165313963393232626130313161326138353534303030313830303065393462343537316361353239336263396463643932346236306330316430353134353134383631353931653363663133316630366638343666626334636236396537396234383833326335626636656532343830333237623063396164376163656631363738373263376335646531656261663065366132363431306464323664373331333631383630383230386663343061613866326633326536643834656636643066393562633537653262643666633639616434626166366264373565363464323163326138653136333565636161336230316665373961636461656366653234376331326631346663336636333761313464663639653466313737306337636166313933626437396462646639633931656664616238636166613661353361353238326636376231653534393439346264656463323861323861643039306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386165636265313166633234643462653233656135663639623930663036393730336532653665343065356366356438396561376434663631663830333135326134323934316361356232326133313733393539313939653031663836666532366638383961383764393334346235646230613330313731373932663131633433666139663631636665316364376266376333616638333565313766383764303234643064626135646466653366373937663361303263306637643833663830373364623933646339616538623430663065653864653137643332336431663432623034623762373838363132333431666139336434393365613739616262356531363237313935326262623264323364626663636566613534323334663537616230653934353134353731396238353134353134303035313435313430303531343531343030353134353134303064393631386137386363353334366165616330383635363139303431656130643739306663353866643964323262623132663838626330333061633732663264333639613330313566663030656239666637346666623237383364623164326264383238616436393536613934323563643036343465396336613262333365333662386237396564323737623562393835613339323336326232323361653061393164343131346361666134626532646663313664323765323064626236613961376564623664353931376534396330663936366330653135663166346330336434376266346166396462353864316235356630666561333265393361643538343936643731306236316532393537303437626662386634323338333565663631623135306334343734646662316537353461353261366663386164343531343537343939383531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353030313632313534363439653830353030373435663063666531656561336631313763343839613464623636336237386630663762373338653233346366666538343761303166653036626539666430623434643337633362613534316133363933366162306462646263363132323435663431656265613466353237623961653666653062373830613166303237383332313832363835376564623736303464376166623038366463343730383733636663613065336562396635616562656265376631393838373565613539366362366666303033336431613134643432333765616332386132386165333337306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306165333365326666303063323662326638386661343839326434616331613935616139333662333931633337666433333666663634666166363363666138336439643135353039636139633934613265636431333238613932623333653339643433346662656432366661356433333532623636383665323037323933343465333035353837353135306437626366656431626630626133643662343936663163653866303835626262323866663030643331313431636364313761653364353739333966346366613061663036616661336333353738653232396633326466613965366435613665396361633134353134353665363631343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356435666331356630633237386137653233653966363933326162343536663237646136363536303038363534633163313037613832646234376533356361353761396665636135363331636465326564343666646231626131643363323238323366626365626365376237646466643662306335343963333066323662623161353235636435313233646534373465393435313435376364316561303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303064396132343961333331343862393536313836303762386166393562653238663834626665313039663162646636383731343435366463343965363561363562333938396239356537646261376531356635353961663037666461623664353233663135653939373630396463666137393436663463326239323366663030343233356466393735343731633437326634363865366334633666346566643866326261323861326264643338303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303262643662663634646666393066656166663030663565373166666538363662633936626437376636346238323536643633353962393062663232646234346163373364303936363233663931616535633666663030626163386436383766313531656466343531343537636539653938353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303133386564356531646662353934353238643733343739643930383436623539353535626434383631393166613866636562646336626336336636623866663030353961303766626237356666303062346162616630336665663531663966653436333838666531333363366138613238616661313363643061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061663635666439316330646661663963373662356666303064616235653335356563626662323339316266356631656436626666303062353662393331646665656232663937653636643433663861386636376132386132626537386634383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032626336336636623866663030353961303766626237356666303062346162643965626336336636623866663539613037666262373566666234616261663033666566353166396665343633383866653133336336613861323861666131336364306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306166366566643932643533666232623561393336386464663638383431333865373162356162633436626462666636346166663030393034366235666630303566353066663030653832643563373866663030663735393763626633333763336666313531656262343531343537636639653838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303537386337656437316665623334306666303037366562666630303639353762336437386337656437316665623334306666373665626666363935373565303766646561336633666338633731316663323637386435313435313566343237396131343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356564666630306232353766633832333561666661666138376666303034313661663130616636666630306439326266653431316164376664376363336666303061306235373236336666303064643635663266636364663066663030633534376165643134353135663363376132313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135653331666235633766616364303366646462616666646135356563663565333166623563376661636430336664646261666630306461353564373831666630303761386663666632333163343766303939653335343531343537643039653638353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031643666633234663835643337633465643561653264356235316662326462356134346166336361613831393839363338353530303931643730373965643866376166373466383539663062616462653138646235653561646165616232356430626239313163393932333062623736383233623165376164373962666563396437663134376532306435623462366662663335396337326166643131383833666661313861663733616630663166353661666236373464626433343362663066303837323239373530613238613262636633613432386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326263656265336366633266663133376334383962343931653165333663303539616366653733356334613534363562636263303138303733663734643761326430343865666539356135326162326133336537386565383939633534653336363763383765323966306336616665306564373236663066656237303834623838303863656433393536303436343135336463316163666165663766363931626138326537653238346539303963393836643231343763306538373665656665343435373035356634393436366561353238633965656431653563643238636461343134353134353638343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031653935666232636364316335663131616531316462303634643232343534316561376363386365336632303662653832616639616266363737626631363366313536633135613430616233633533343437323333396664643932303765363035376432613065373931643262633263633935623133376565393165383631396665656332386132386165303361303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032393039633733346234386330313163386131383166326666633730363537663861626163393436303437396561333230663766326437333563613536643763343862633137666630303130333561626135303330373534396330646137323038306534363766346163356166613861326164343632626339376534373933333737396230613238613262343234323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306462663836666138343161353738666234376266626136646231633761383435626462336430313630333366346536626562303433393561663864303132306534316337643262656163663836316532643866633662653061623164373436303438643136636238353037323536343566393562336638386338636636323262633863636539626263363766323362333062326465323734313435313435373934373630353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303533326536653232623538316565323737306138383835393938663630303634396137643731396631653763346631373836626531636465323839353936366265356662326462656465613462376465666137636131616161313037353236613262613933323661333136643966333535643465663733373332356334386535396134373263636337613932346537333531643134353764353165343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373739663031626532343565663833376335333136383933396466363161613563323435326131363033636237363231353634633965633333636662376432623833613932636565653762306263386166656435663663623034616232343664386538633065343166636562336162346533353639623862656135343234653332626133656338613261386638363735383866633431653165623264373232303032646464623234633030333963366535303731663835356561663937623335613333643635616130613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830316233346139303436643263383730616133323464376363666630303139626532376339663131376334303035393333326539623637393562343863663162633965623231316561373831386563303762396166373866386233616534396531636638373561623661623036376363356235333163363431653863653432303366383136636665313566326164376162393664323464626138666136383865346335346461623434323861323861663563653230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303365393766643965663530376266663030383533613737396137326430333462313732643965303438643866613730343537366235653364666232393738386663636233643462633264326361333331346162373330323165613433306461666630303830323133666566616166363131636437636465326133633938393932663366636366353238636239613961363134353134353733396130353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353037313833396130306632386664616162356637623466306464383738376132396330666236356431393235343164353931303766326362306663616263326162623866646131336334653965323366383931373130646262623138623465343136616130653731623937323563653366646532343765313563336437643136306139626137383638613764373566626366333262346239616133306132386132626138633832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306538336531376638623866383233633666363361666239666463616338363362393037666537396230646163376630636537663061666161363039653162393831326532303935356533373530633865613732313831653834316166386462656235656535666233386663353231613964393266383066356362613032653264613366663030383937626262376661643863373534316565613361373763363764326263626363363833393266366231653962666131643538366138393365353637616435313435313565333964633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135386665336366313535616638333763323737646532316239336665613231336535616533336239636630613366656661323262363039303361643738303765643164663132323366313236623462653066643236363264363961373461376564306530663132636664303866613266323365613466623161646630643435643761636133643361666131396435613861396331623363646165656561653266616561346264626239396134393636373266326262316535393839633932376631613865386132626539373633636230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306139326365663265623466626138656661636137363861363835633363353232316331353630373230386138653861303066613762653061663865616666303065323037383330366166616134306139373130356331623739396434663132623261613964663863306336373737346165626162383466643963373466313635663062326365356438343335636366333461643935633766313935316635653134373335646464376363353735313864363932386564373364356136646238323663323861323861633862306132386132383030613238613238303061323861323830306132386132383030613238613238303339376638636261646464663837626531626561626139643834636631636332313538653339313361613937373534633866346662646437623537636238636363656335646438623132373234393339323464376432626662343239323365313365613938663538336666303034376135376364333565643635383937623136666363653063353566396437613035313435313565393163633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303764346666303832643633623566383637613234373139323431623034363339663536663938666561366261356163626630343538376636363738336234616433636161383330653966306139306264333231303637663561643461663935396262643439336633376639396562343535613238323861323861393238323861323861303032386132386130303238613238613030323861323861303032386132386130306531666636386139653238376531336561303932333630636232633061383364346639616137663930333566333564376431626662346237666339326539626665626636316665363662653732616636663263666630303737376561636530633537663133653431343531343537613237333035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353462363536656437393739313561323130306362323261303237613032346532626134663834626630653236663839316532356665636639323437386163656464343439376233323065343265373835303761303237663930323762353762643639316630356265313936386336333936643763323536656432343766373565373636393065373230653765363237396533663061653363343633323964303763626262333661373432353531356661316434343638393134366231633661313535353430353535313830303532643134353763663965393035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303165376666303062346239316666306162653531666634666230666633333566333964376438336163363835613366383836636666303062336635636433613262613833373836663236373430636134386538373036626338666533633763313464303734386430646263356665306664336665636336646462333762366231363461333231323036663531666333386565303731386537386337336539653033313334653961663635326561663733393331313461353237636338663161613238613262643933383832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238303039333830323830336465626636353664316131623666303735663662333831653635643566656336336665636132306330666364646266336166353261653562653063663836366533633237663065656333346362636666303035636538363739393736653061623366636462346662383034306663326261396166393963343464353461663239326565376139343937326433343832386132386163346430323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326161366264363131656139613235653639643261613931373136623234363737616534373261343732336266356162373438643964613731343663656530663534376336396433386132626131663861376531323966633137653338626564316464356263613639346362366163633431646431333132343165336631316635303662396561666161383439346532613462613965343439333862623330613238613261383431343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313461616163656331313134393234653030303238303132626164663832356531303165333066383833363936663361383336663636376564353732303863656535343233306264306630353861383365643961623165313266383039663130626335306332353937346366656365383330306639626138323934323765386238646334653364383066376166363966383535663039373463663836333662336639313765663735373337363133636539396533306130366463663061303734316366373236623833313738626137306136653331373739333361323864313934613439623561316436616138353138303331346234353135653131653830353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430316535376662353037383339623531663065343165326562353839373765396566623265316262393839633830336562383663376664663436626331656265626666303031316538353635653236643065656234306434353439383265653136386534633735303038656133646331633166633262633433633564666232666630303861373462373936653763326237663136613130323863613433323765656536336339653366626164633633396338636661353761643831633535333835336636373337366563373165323238633963623961323866326661326165366235653166643666633339373766363064373734613965643236633634343733633635343931656133336436613964376161396136616538653364353362333061323861323938303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435373437653066663030383535653338663162623262653864613262616462623063666461656537663737313633643433316662646666303163643463613730383262633964393064323732373634386537326165653837653163643762633462373366363364303334386238626239303633373263313131366462396533323466343531656536626462336332316662326666303038363734623531373365326362663764346135323031313063373938613235336466613164636466613764326264326234636431373438643136643435386539316136343136643061663438653038383238666338353739643537333261373164323961626665343734633330623237663136383738623738343366363561643561656636646366386362353834623634323134386236623333626534663730353838646162653963366566663166353266306137633330663033663833313737363833613063353163623830316165363463626338373166656433363731663431383135643030303030633031343537396235373133356562376334663465633735343239343231623231303238313462343531353831613035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313865373334353134303135333535643066343864373664396163663538643361316239383964343836343961333063333037656264326263663363356466623331373834373536326637336531396262396234633930386532326536353862333866343237373066636662663461663465613262346137356161643237373833623131323834323762613365356566313766633136663838316530653632663739613333356435626530396662353538383332613031656638313935666334303165653662393461666232636161396561326239386631386663323066303237386434393962353564316432333963383230356364616532333933396366323438653162616537393036626431613539396235613534356633356665343733346630626663616366393665386166346666313866656363336532386432303962386630616466343761393435383237636137633437323866366534653162663331663461663338643466343864353734356239333637616265396233646163613339663265653232323837316562383364616264326137356539353635656533623963643238346530663534353761323861326235323032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613764626462356364653465623664363936656632633865373039316336613539393866623031633961663436663033666563643765326466313033323564663839653431613535623163333663363031613637353363663061306531376433653665343761353637353262353361326166333736326133303934646439323363646431316534373131633661353938396330353033323439616565336331356662336666303038656663356132336262626262356665636462333765376366626235663963386636386661396663373033646562646262633137663039376331316530363531323639336134616339373030393366366362396333636263666133363365353165633331356432383138313861663265616536353237613533353666333637356333306139376334636531626331626630303363303765313535346238623962316665643162613061303334643761303332653762393534653833663163396637616565323334353864303436383030303036303030336135326431356536636537336139326263396463653938633633313536343832386132386139323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326138656239653162643066633462366336636235656432366465656532633163326366313836646239313832343165616137646337333537613861313336396464303334396133633862633635666232646539393736356165626331356161333561336530653264366566326631393365636333653635316638333537393566386237653164663863376331333337393765323164313235383930666464396434366638646266653034333866633361643764363334633965646130626138396130623938393634343735326165386562393063306635303437376165656135393835366137613462646535663866646537336366306630393661623433653336653964343531356634346638646266363731663035373839353565653734333866666232616538616531306462613066323439663738666663303861663233663162376331356631636638323561346238623864336665643936363837666533663264336536313866353635656162663838633762643761373437316234326236383964396639396362336131353230373235343530373833383334353735393838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353737376630663365303166386237633661323364346235303433613736396563353466396233326665663235353233333934356566646239333831636631396539353964346162346539343739613665633534363132396262323437306430343133356363636236663664306234393233623035343864313732353839653830303164346437613466383162663636396631343662616339376265326339346539393661346534633433306433333866613734356663373931653935656264653036663835646531316630306461383564316234663064373035373663623762333631613539333966356337316634313861653863306330633061663261626536333239363934393562636365626137383634623539313831653064663836396530666630323432313334306432393136356462383762613930366539396665616466643036303536666431343537396232393461366566323737363735323439326430323861323861343330613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613432613066366135613238303338656631616663306566303237386366636362393937346666623164646338646238646464393030616363376265653166373562336466323333656635653364653335666439666263373565313335376263623262363161393561323634393936643031646561303766373933616634663463386166613461386165616133386361663437343465656262333331396430613733336533343230613932313831303431653431613461666137666337626630366263313965336334363965663663376563643738373138626562353031363433386665663736363166356537646562633537633766663032626336356530383266373931343166646131363262623866646136643530393331613865656562386639376633323338656235656235306336643161646133643166396666303039396339353238346531653638653261386132386165633330306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306162396130663837663538663133366137316538666131643834393733373132623030313233356365303634306463346636353139653439653035323638356131366162653235643536316431373435623436396565323736646138386266636339656330373733356634636663326666383566613366633336643163356264623031333565636133666432656630616530633837643030656361336433663133356339386163353437306631656564396235326134656133663233303365313766656366626131373834633433616366383934343737666139303031393534386363353033376662323366383866336434666137303035376133383030306330313435313565306434613935326163623961366565376131313834363061633832386132386138323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239313931356265663238333462343530303739386663356566383039613666383932313937356566303864623437366261386138326432343038626235326534663164376232623633323732303732376166613866303562616235623962316239376233626462373738613638396361633931346138353539313837353034316538366265633833633863353739383763376366383365396532356230376631366638373264336665323633366339666266383632346536653530376230666533313933636635323338663461663462303538633730393261373531653964316636666638303732643761303961653638656537383135313435313565643163323134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313561376530636431336665313234663136363964613131303461646435653436393236306666303030313366333765393961353236613331366662306432626262316565336662336237633339383363333765313935663134366131366330646665613531383734363635663961313834663261613366646566626337663066346166343861366132303538633436336130303030613735376362643561393261623531636535643466353631313530386134383238613238613832383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239306138323330343532643134303166333966656430626630663933633233653262666564616432656434323538366134346261616132363136323934376465343138653939666264663839663461663366616661376265333637383531336335376630663666616463343035653662353466623535623664656131643031336661616565316638643763633335656665303262336162343263663735613766393165373632323163393533346561313435313435373639383035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373466663036626665346138363862666630303566396666623239613238616361626666303235653863613837633638666139363861323861663938336436306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303233626330316163653530343634313864623230666432626533363164323861326264356361376564666338653263356634313638613238616635636534306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830336666666439, 9);
INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(84, 'Giovanna Michel', 'Galvan', 'Castro', '1999-02-20', 2147483647, 'galvancastro20@gmail.com', '2021-08-28', 'GACG990220MDFLSV01', 'GACG990222T54', '1234567891', 'ACTIVO', 26, 0x307866666438666665303030313034613436343934363030303130313030303030313030303130303030666664623030343330303032303130313031303130313032303130313031303230323032303230323034303330323032303230323035303430343033303430363035303630363036303530363036303630373039303830363037303930373036303630383062303830393061306130613061306130363038306230633062306130633039306130613061666664623030343330313032303230323032303230323035303330333035306130373036303730613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061666663303030313130383031613230323938303330313232303030323131303130333131303166666334303031663030303030313035303130313031303130313031303030303030303030303030303030303031303230333034303530363037303830393061306266666334303062353130303030323031303330333032303430333035303530343034303030303031376430313032303330303034313130353132323133313431303631333531363130373232373131343332383139316131303832333432623163313135353264316630323433333632373238323039306131363137313831393161323532363237323832393261333433353336333733383339336134333434343534363437343834393461353335343535353635373538353935613633363436353636363736383639366137333734373537363737373837393761383338343835383638373838383938613932393339343935393639373938393939616132613361346135613661376138613961616232623362346235623662376238623962616332633363346335633663376338633963616432643364346435643664376438643964616531653265336534653565366537653865396561663166326633663466356636663766386639666166666334303031663031303030333031303130313031303130313031303130313030303030303030303030303031303230333034303530363037303830393061306266666334303062353131303030323031303230343034303330343037303530343034303030313032373730303031303230333131303430353231333130363132343135313037363137313133323233323831303831343432393161316231633130393233333335326630313536323732643130613136323433346531323566313137313831393161323632373238323932613335333633373338333933613433343434353436343734383439346135333534353535363537353835393561363336343635363636373638363936613733373437353736373737383739376138323833383438353836383738383839386139323933393439353936393739383939396161326133613461356136613761386139616162326233623462356236623762386239626163326333633463356336633763386339636164326433643464356436643764386439646165326533653465356536653765386539656166326633663466356636663766386639666166666461303030633033303130303032313130333131303033663030666433306132386132626562306631633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861326234623436663036663862336334303836356431376333623762373638303766616338366439393937663363363239333934363261656438643236636364613262626564303366363666663839356163613039656565643664623466343237666535663237663962316561313530333765343731356438653864666232383638663163363864616666383965653635376365363435623438643633356661303264623866653335636433633665316139656632626661366136393161333532356430663130613339616661353663336636373866383533363230366664303165653065303864643731373732316366653030383166613536613639666630386265316136393837333662653062623032373966663030356630663962666630306131653662303936363734353663396665303638623062336561636639353866643238616661353765323035383763316166303765383866373365323466306265393438616561343437366630643963366233346137643133363830373365663930303761386166396236653165323932653234393230386236323333393238393963656431396530363762643734363162313166353834646138623436353532396662333736623863613238613262613463633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323964313435326366326163333034346365656537306138386239323466613030336164303033363830306231646161333234663430326264323763306266623336373861376334353161656131653235393962346162373630306163366631366539396336376136646338643963373733636662353761663738336665313266383162633130383065386661333233346333303464643563666566323463386565303966626265626336326238366236336538643237363561626665626139626333306633393661663433633133633331663034626532333738613437393930363832663639313630316633623530303632303437623032333237663031356538626531636664393537343462363331636665323766313063623734373166336331366339653561363764333731323439316639316166356230333033313435373964353331663838613962336232663233616133383761373164663533396566306637633262663837646531373664666133663835616435356639633439326139393563376165313963393232626130313161326138353534303030313830303065393462343537316361353239336263396463643932346236306330316430353134353134383631353931653363663133316630366638343666626334636236396537396234383833326335626636656532343830333237623063396164376163656631363738373263376335646531656261663065366132363431306464323664373331333631383630383230386663343061613866326633326536643834656636643066393562633537653262643666633639616434626166366264373565363464323163326138653136333565636161336230316665373961636461656366653234376331326631346663336636333761313464663639653466313737306337636166313933626437396462646639633931656664616238636166613661353361353238326636376231653534393439346264656463323861323861643039306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386165636265313166633234643462653233656135663639623930663036393730336532653665343065356366356438396561376434663631663830333135326134323934316361356232326133313733393539313939653031663836666532366638383961383764393334346235646230613330313731373932663131633433666139663631636665316364376266376333616638333565313766383764303234643064626135646466653366373937663361303263306637643833663830373364623933646339616538623430663065653864653137643332336431663432623034623762373838363132333431666139336434393365613739616262356531363237313935326262623264323364626663636566613534323334663537616230653934353134353731396238353134353134303035313435313430303531343531343030353134353134303064393631386137386363353334366165616330383635363139303431656130643739306663353866643964323262623132663838626330333061633732663264333639613330313566663030656239666637346666623237383364623164326264383238616436393536613934323563643036343465396336613262333365333662386237396564323737623562393835613339323336326232323361653061393164343131346361666134626532646663313664323765323064626236613961376564623664353931376534396330663936366330653135663166346330336434376266346166396462353864316235356630666561333265393361643538343936643731306236316532393537303437626662386634323338333565663631623135306334343734646662316537353461353261366663386164343531343537343939383531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353030313632313534363439653830353030373435663063666531656561336631313763343839613464623636336237386630663762373338653233346366666538343761303166653036626539666430623434643337633362613534316133363933366162306462646263363132323435663431656265613466353237623961653666653062373830613166303237383332313832363835376564623736303464376166623038366463343730383733636663613065336562396635616562656265376631393838373565613539366362366666303033336431613134643432333765616332386132386165333337306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306165333365326666303063323662326638386661343839326434616331613935616139333662333931633337666433333666663634666166363363666138336439643135353039636139633934613265636431333238613932623333653339643433346662656432366661356433333532623636383665323037323933343465333035353837353135306437626366656431626630626133643662343936663163653866303835626262323866663030643331313431636364313761653364353739333966346366613061663036616661336333353738653232396633326466613965366435613665396361633134353134353665363631343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356435666331356630633237386137653233653966363933326162343536663237646136363536303038363534633163313037613832646234376533356361353761396665636135363331636465326564343666646231626131643363323238323366626365626365376237646466643662306335343963333066323662623161353235636435313233646534373465393435313435376364316561303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303064396132343961333331343862393536313836303762386166393562653238663834626665313039663162646636383731343435366463343965363561363562333938396239356537646261376531356635353961663037666461623664353233663135653939373630396463666137393436663463326239323366663030343233356466393735343731633437326634363865366334633666346566643866326261323861326264643338303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303262643662663634646666393066656166663030663565373166666538363662633936626437376636346238323536643633353962393062663232646234346163373364303936363233663931616535633666663030626163386436383766313531656466343531343537636539653938353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303133386564356531646662353934353238643733343739643930383436623539353535626434383631393166613866636562646336626336336636623866663030353961303766626237356666303062346162616630336665663531663966653436333838666531333363366138613238616661313363643061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061663635666439316330646661663963373662356666303064616235653335356563626662323339316266356631656436626666303062353662393331646665656232663937653636643433663861386636376132386132626537386634383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032626336336636623866663030353961303766626237356666303062346162643965626336336636623866663539613037666262373566666234616261663033666566353166396665343633383866653133336336613861323861666131336364306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306166366566643932643533666232623561393336386464663638383431333865373162356162633436626462666636346166663030393034366235666630303566353066663030653832643563373866663030663735393763626633333763336666313531656262343531343537636639653838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303537386337656437316665623334306666303037366562666630303639353762336437386337656437316665623334306666373665626666363935373565303766646561336633666338633731316663323637386435313435313566343237396131343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356564666630306232353766633832333561666661666138376666303034313661663130616636666630306439326266653431316164376664376363336666303061306235373236336666303064643635663266636364663066663030633534376165643134353135663363376132313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135653331666235633766616364303366646462616666646135356563663565333166623563376661636430336664646261666630306461353564373831666630303761386663666632333163343766303939653335343531343537643039653638353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031643666633234663835643337633465643561653264356235316662326462356134346166336361613831393839363338353530303931643730373965643866376166373466383539663062616462653138646235653561646165616232356430626239313163393932333062623736383233623165376164373962666563396437663134376532306435623462366662663335396337326166643131383833666661313861663733616630663166353661666236373464626433343362663066303837323239373530613238613262636633613432386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326263656265336366633266663133376334383962343931653165333663303539616366653733356334613534363562636263303138303733663734643761326430343865666539356135326162326133336537386565383939633534653336363763383765323966306336616665306564373236663066656237303834623838303863656433393536303436343135336463316163666165663766363931626138326537653238346539303963393836643231343763306538373665656665343435373035356634393436366561353238633965656431653563643238636461343134353134353638343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031653935666232636364316335663131616531316462303634643232343534316561376363386365336632303662653832616639616266363737626631363366313536633135613430616233633533343437323333396664643932303765363035376432613065373931643262633263633935623133376565393165383631396665656332386132386165303361303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032393039633733346234386330313163386131383166326666633730363537663861626163393436303437396561333230663766326437333563613536643763343862633137666630303130333561626135303330373534396330646137323038306534363766346163356166613861326164343632626339376534373933333737396230613238613262343234323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306462663836666138343161353738666234376266626136646231633761383435626462336430313630333366346536626562303433393561663864303132306534316337643262656163663836316532643866633662653061623164373436303438643136636238353037323536343566393562336638386338636636323262633863636539626263363766323362333062326465323734313435313435373934373630353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303533326536653232623538316565323737306138383835393938663630303634396137643731396631653763346631373836626531636465323839353936366265356662326462656465613462376465666137636131616161313037353236613262613933323661333136643966333535643465663733373332356334386535396134373263636337613932346537333531643134353764353165343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373739663031626532343565663833376335333136383933396466363161613563323435326131363033636237363231353634633965633333636662376432623833613932636565653762306263386166656435663663623034616232343664386538633065343166636562336162346533353639623862656135343234653332626133656338613261386638363735383866633431653165623264373232303032646464623234633030333963366535303731663835356561663937623335613333643635616130613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830316233346139303436643263383730616133323464376363666630303139626532376339663131376334303035393333326539623637393562343863663162633965623231316561373831386563303762396166373866386233616534396531636638373561623661623036376363356235333163363431653863653432303366383136636665313566326164376162393664323464626138666136383865346335346461623434323861323861663563653230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303365393766643965663530376266663030383533613737396137326430333462313732643965303438643866613730343537366235653364666232393738386663636233643462633264326361333331346162373330323165613433306461666630303830323133666566616166363131636437636465326133633938393932663366636366353238636239613961363134353134353733396130353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353037313833396130306632386664616162356637623466306464383738376132396330666236356431393235343164353931303766326362306663616263326162623866646131336334653965323366383931373130646262623138623465343136616130653731623937323563653366646532343765313563336437643136306139626137383638613764373566626366333262346239616133306132386132626138633832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306538336531376638623866383233633666363361666239666463616338363362393037666537396230646163376630636537663061666161363039653162393831326532303935356533373530633865613732313831653834316166386462656235656535666233386663353231613964393266383066356362613032653264613366663030383937626262376661643863373534316565613361373763363764326263626363363833393266366231653962666131643538366138393365353637616435313435313565333964633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135386665336366313535616638333763323737646532316239336665613231336535616533336239636630613366656661323262363039303361643738303765643164663132323366313236623462653066643236363264363961373461376564306530663132636664303866613266323365613466623161646630643435643761636133643361666131396435613861396331623363646165656561653266616561346264626239396134393636373266326262316535393839633932376631613865386132626539373633636230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306139326365663265623466626138656661636137363861363835633363353232316331353630373230386138653861303066613762653061663865616666303065323037383330366166616134306139373130356331623739396434663132623261613964663863306336373737346165626162383466643963373466313635663062326365356438343335636366333461643935633766313935316635653134373335646464376363353735313864363932386564373364356136646238323663323861323861633862306132386132383030613238613238303061323861323830306132386132383030613238613238303339376638636261646464663837626531626561626139643834636631636332313538653339313361613937373534633866346662646437623537636238636363656335646438623132373234393339323464376432626662343239323365313365613938663538336666303034376135376364333565643635383937623136666363653063353566396437613035313435313565393163633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303764346666303832643633623566383637613234373139323431623034363339663536663938666561366261356163626630343538376636363738336234616433636161383330653966306139306264333231303637663561643461663935396262643439336633376639396562343535613238323861323861393238323861323861303032386132386130303238613238613030323861323861303032386132386130306531666636386139653238376531336561303932333630636232633061383364346639616137663930333566333564376431626662346237666339326539626665626636316665363662653732616636663263666630303737376561636530633537663133653431343531343537613237333035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353462363536656437393739313561323130306362323261303237613032346532626134663834626630653236663839316532356665636639323437386163656464343439376233323065343265373835303761303237663930323762353762643639316630356265313936386336333936643763323536656432343766373565373636393065373230653765363237396533663061653363343633323964303763626262333661373432353531356661316434343638393134366231633661313535353430353535313830303532643134353763663965393035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303165376666303062346239316666306162653531666634666230666633333566333964376438336163363835613366383836636666303062336635636433613262613833373836663236373430636134386538373036626338666533633763313464303734386430646263356665306664336665636336646462333762366231363461333231323036663531666333386565303731386537386337336539653033313334653961663635326561663733393331313461353237636338663161613238613262643933383832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238303039333830323830336465626636353664316131623666303735663662333831653635643566656336336665636132306330666364646266336166353261653562653063663836366533633237663065656333346362636666303035636538363739393736653061623366636462346662383034306663326261396166393963343464353461663239326565376139343937326433343832386132386163346430323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326161366264363131656139613235653639643261613931373136623234363737616534373261343732336266356162373438643964613731343663656530663534376336396433386132626131663861376531323966633137653338626564316464356263613639346362366163633431646431333132343165336631316635303662396561666161383439346532613462613965343439333862623330613238613261383431343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313461616163656331313134393234653030303238303132626164663832356531303165333066383833363936663361383336663636376564353732303863656535343233306264306630353861383365643961623165313266383039663130626335306332353937346366656365383330306639626138323934323765386238646334653364383066376166363966383535663039373463663836333662336639313765663735373337363133636539396533306130366463663061303734316366373236623833313738626137306136653331373739333361323864313934613439623561316436616138353138303331346234353135653131653830353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430316535376662353037383339623531663065343165326562353839373765396566623265316262393839633830336562383663376664663436626331656265626666303031316538353635653236643065656234306434353439383265653136386534633735303038656133646331633166633262633433633564666232666630303861373462373936653763326237663136613130323863613433323765656536336339653366626164633633396338636661353761643831633535333835336636373337366563373165323238633963623961323866326661326165366235653166643666633339373766363064373734613965643236633634343733633635343931656133336436613964376161396136616538653364353362333061323861323938303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435373437653066663030383535653338663162623262653864613262616462623063666461656537663737313633643433316662646666303163643463613730383262633964393064323732373634386537326165653837653163643762633462373366363364303334386238626239303633373263313131366462396533323466343531656536626462336332316662326666303038363734623531373365326362663764346135323031313063373938613235336466613164636466613764326264326234636431373438643136643435386539316136343136643061663438653038383238666338353739643537333261373164323961626665343734633330623237663136383738623738343366363561643561656636646366386362353834623634323134386236623333626534663730353838646162653963366566663166353266306137633330663033663833313737363833613063353163623830316165363463626338373166656433363731663431383135643030303030633031343537396235373133356562376334663465633735343239343231623231303238313462343531353831613035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313865373334353134303135333535643066343864373664396163663538643361316239383964343836343961333063333037656264326263663363356466623331373834373536326637336531396262396234633930386532326536353862333866343237373066636662663461663465613262346137356161643237373833623131323834323762613365356566313766633136663838316530653632663739613333356435626530396662353538383332613031656638313935666334303165653662393461666232636161396561326239386631386663323066303237386434393962353564316432333963383230356364616532333933396366323438653162616537393036626431613539396235613534356633356665343733346630626663616366393665386166346666313866656363336532386432303962386630616466343761393435383237636137633437323866366534653162663331663461663338643466343864353734356239333637616265396233646163613339663265653232323837316562383364616264326137356539353635656533623963643238346530663534353761323861326235323032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613764626462356364653465623664363936656632633865373039316336613539393866623031633961663436663033666563643765326466313033323564663839653431613535623163333663363031613637353363663061306531376433653665343761353637353262353361326166333736326133303934646439323363646431316534373131633661353938396330353033323439616565336331356662336666303038656663356132336262626262356665636462333765376366626235663963386636386661396663373033646562646262633137663039376331316530363531323639336134616339373030393366366362396333636263666133363365353165633331356432383138313861663265616536353237613533353666333637356333306139376334636531626331626630303363303765313535346238623962316665643162613061303334643761303332653762393534653833663163396637616565323334353864303436383030303036303030336135326431356536636537336139326263396463653938633633313536343832386132386139323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326138656239653162643066633462366336636235656432366465656532633163326366313836646239313832343165616137646337333537613861313336396464303334396133633862633635666232646539393736356165626331356161333561336530653264366566326631393365636333653635316638333537393566386237653164663863376331333337393765323164313235383930666464396434366638646266653034333866633361643764363334633965646130626138396130623938393634343735326165386562393063306635303437376165656135393835366137613462646535663866646537336366306630393661623433653336653964343531356634346638646266363731663035373839353565653734333866666232616538616531306462613066323439663738666663303861663233663162376331356631636638323561346238623864336665643936363837666533663264336536313866353635656162663838633762643761373437316234326236383964396639396362336131353230373235343530373833383334353735393838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353737376630663365303166386237633661323364346235303433613736396563353466396233326665663235353233333934356566646239333831636631396539353964346162346539343739613665633534363132396262323437306430343133356363636236663664306234393233623035343864313732353839653830303164346437613466383162663636396631343662616339376265326339346539393661346534633433306433333866613734356663373931653935656264653036663835646531316630306461383564316234663064373035373663623762333631613539333966356337316634313861653863306330633061663261626536333239363934393562636365626137383634623539313831653064663836396530666630323432313334306432393136356462383762613930366539396665616466643036303536666431343537396232393461366566323737363735323439326430323861323861343330613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613432613066366135613238303338656631616663306566303237386366636362393937346666623164646338646238646464393030616363376265653166373562336466323333656635653364653335666439666263373565313335376263623262363161393561323634393936643031646561303766373933616634663463386166613461386165616133386361663437343465656262333331396430613733336533343230613932313831303431653431613461666137666337626630366263313965336334363965663663376563643738373138626562353031363433386665663736363166356537646562633537633766663032626336356530383266373931343166646131363262623866646136643530393331613865656562386639376633323338656235656235306336643161646133643166396666303039396339353238346531653638653261386132386165633330306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306162396130663837663538663133366137316538666131643834393733373132623030313233356365303634306463346636353139653439653035323638356131366162653235643536316431373435623436396565323736646138386266636339656330373733356634636663326666383566613366633336643163356264623031333565636133666432656630616530633837643030656361336433663133356339386163353437306631656564396235326134656133663233303365313766656366626131373834633433616366383934343737666139303031393534386363353033376662323366383866336434666137303035376133383030306330313435313565306434613935326163623961366565376131313834363061633832386132386138323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239313931356265663238333462343530303739386663356566383039613666383932313937356566303864623437366261386138326432343038626235326534663164376232623633323732303732376166613866303562616235623962316239376233626462373738613638396361633931346138353539313837353034316538366265633833633863353739383763376366383365396532356230376631366638373264336665323633366339666266383632346536653530376230666533313933636635323338663461663462303538633730393261373531653964316636666638303732643761303961653638656537383135313435313565643163323134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313561376530636431336665313234663136363964613131303461646435653436393236306666303030313366333765393961353236613331366662306432626262316565336662336237633339383363333765313935663134366131366330646665613531383734363635663961313834663261613366646566626337663066346166343861366132303538633436336130303030613735376362643561393261623531636535643466353631313530386134383238613238613832383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239306138323330343532643134303166333966656430626630663933633233653262666564616432656434323538366134346261616132363136323934376465343138653939666264663839663461663366616661376265333637383531336335376630663666616463343035653662353466623535623664656131643031336661616565316638643763633335656665303262336162343263663735613766393165373632323163393533346561313435313435373639383035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373466663036626665346138363862666630303566396666623239613238616361626666303235653863613837633638666139363861323861663938336436306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303233626330316163653530343634313864623230666432626533363164323861326264356361376564666338653263356634313638613238616635636534306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830336666666439, 10);
INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(85, 'Alix Iran', 'Alonso', 'Lucero', '1999-12-29', 2147483647, 'alixalolucero@gmail.com', '2021-08-28', 'AOLA991229MDFLCL08', 'ALOA991229Y87', '1234567891', 'ACTIVO', 28, 0x307866666438666665303030313034613436343934363030303130313030303030313030303130303030666664623030343330303032303130313031303130313032303130313031303230323032303230323034303330323032303230323035303430343033303430363035303630363036303530363036303630373039303830363037303930373036303630383062303830393061306130613061306130363038306230633062306130633039306130613061666664623030343330313032303230323032303230323035303330333035306130373036303730613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061666663303030313130383031613230323938303330313232303030323131303130333131303166666334303031663030303030313035303130313031303130313031303030303030303030303030303030303031303230333034303530363037303830393061306266666334303062353130303030323031303330333032303430333035303530343034303030303031376430313032303330303034313130353132323133313431303631333531363130373232373131343332383139316131303832333432623163313135353264316630323433333632373238323039306131363137313831393161323532363237323832393261333433353336333733383339336134333434343534363437343834393461353335343535353635373538353935613633363436353636363736383639366137333734373537363737373837393761383338343835383638373838383938613932393339343935393639373938393939616132613361346135613661376138613961616232623362346235623662376238623962616332633363346335633663376338633963616432643364346435643664376438643964616531653265336534653565366537653865396561663166326633663466356636663766386639666166666334303031663031303030333031303130313031303130313031303130313030303030303030303030303031303230333034303530363037303830393061306266666334303062353131303030323031303230343034303330343037303530343034303030313032373730303031303230333131303430353231333130363132343135313037363137313133323233323831303831343432393161316231633130393233333335326630313536323732643130613136323433346531323566313137313831393161323632373238323932613335333633373338333933613433343434353436343734383439346135333534353535363537353835393561363336343635363636373638363936613733373437353736373737383739376138323833383438353836383738383839386139323933393439353936393739383939396161326133613461356136613761386139616162326233623462356236623762386239626163326333633463356336633763386339636164326433643464356436643764386439646165326533653465356536653765386539656166326633663466356636663766386639666166666461303030633033303130303032313130333131303033663030666433306132386132626562306631633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861326234623436663036663862336334303836356431376333623762373638303766616338366439393937663363363239333934363261656438643236636364613262626564303366363666663839356163613039656565643664623466343237666535663237663962316561313530333765343731356438653864666232383638663163363864616666383965653635376365363435623438643633356661303264623866653335636433633665316139656632626661366136393161333532356430663130613339616661353663336636373866383533363230366664303165653065303864643731373732316366653030383166613536613639666630386265316136393837333662653062623032373966663030356630663962666630306131653662303936363734353663396665303638623062336561636639353866643238616661353765323035383763316166303765383866373365323466306265393438616561343437366630643963366233346137643133363830373365663930303761386166396236653165323932653234393230386236323333393238393963656431396530363762643734363162313166353834646138623436353532396662333736623863613238613262613463633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323964313435326366326163333034346365656537306138386239323466613030336164303033363830306231646161333234663430326264323763306266623336373861376334353161656131653235393962346162373630306163366631366539396336376136646338643963373733636662353761663738336665313266383162633130383065386661333233346333303464643563666566323463386565303966626265626336326238366236336538643237363561626665626139626333306633393661663433633133633331663034626532333738613437393930363832663639313630316633623530303632303437623032333237663031356538626531636664393537343462363331636665323766313063623734373166336331366339653561363764333731323439316639316166356230333033313435373964353331663838613962336232663233616133383761373164663533396566306637633262663837646531373664666133663835616435356639633439326139393563376165313963393232626130313161326138353534303030313830303065393462343537316361353239336263396463643932346236306330316430353134353134383631353931653363663133316630366638343666626334636236396537396234383833326335626636656532343830333237623063396164376163656631363738373263376335646531656261663065366132363431306464323664373331333631383630383230386663343061613866326633326536643834656636643066393562633537653262643666633639616434626166366264373565363464323163326138653136333565636161336230316665373961636461656366653234376331326631346663336636333761313464663639653466313737306337636166313933626437396462646639633931656664616238636166613661353361353238326636376231653534393439346264656463323861323861643039306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386165636265313166633234643462653233656135663639623930663036393730336532653665343065356366356438396561376434663631663830333135326134323934316361356232326133313733393539313939653031663836666532366638383961383764393334346235646230613330313731373932663131633433666139663631636665316364376266376333616638333565313766383764303234643064626135646466653366373937663361303263306637643833663830373364623933646339616538623430663065653864653137643332336431663432623034623762373838363132333431666139336434393365613739616262356531363237313935326262623264323364626663636566613534323334663537616230653934353134353731396238353134353134303035313435313430303531343531343030353134353134303064393631386137386363353334366165616330383635363139303431656130643739306663353866643964323262623132663838626330333061633732663264333639613330313566663030656239666637346666623237383364623164326264383238616436393536613934323563643036343465396336613262333365333662386237396564323737623562393835613339323336326232323361653061393164343131346361666134626532646663313664323765323064626236613961376564623664353931376534396330663936366330653135663166346330336434376266346166396462353864316235356630666561333265393361643538343936643731306236316532393537303437626662386634323338333565663631623135306334343734646662316537353461353261366663386164343531343537343939383531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353030313632313534363439653830353030373435663063666531656561336631313763343839613464623636336237386630663762373338653233346366666538343761303166653036626539666430623434643337633362613534316133363933366162306462646263363132323435663431656265613466353237623961653666653062373830613166303237383332313832363835376564623736303464376166623038366463343730383733636663613065336562396635616562656265376631393838373565613539366362366666303033336431613134643432333765616332386132386165333337306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306165333365326666303063323662326638386661343839326434616331613935616139333662333931633337666433333666663634666166363363666138336439643135353039636139633934613265636431333238613932623333653339643433346662656432366661356433333532623636383665323037323933343465333035353837353135306437626366656431626630626133643662343936663163653866303835626262323866663030643331313431636364313761653364353739333966346366613061663036616661336333353738653232396633326466613965366435613665396361633134353134353665363631343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356435666331356630633237386137653233653966363933326162343536663237646136363536303038363534633163313037613832646234376533356361353761396665636135363331636465326564343666646231626131643363323238323366626365626365376237646466643662306335343963333066323662623161353235636435313233646534373465393435313435376364316561303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303064396132343961333331343862393536313836303762386166393562653238663834626665313039663162646636383731343435366463343965363561363562333938396239356537646261376531356635353961663037666461623664353233663135653939373630396463666137393436663463326239323366663030343233356466393735343731633437326634363865366334633666346566643866326261323861326264643338303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303262643662663634646666393066656166663030663565373166666538363662633936626437376636346238323536643633353962393062663232646234346163373364303936363233663931616535633666663030626163386436383766313531656466343531343537636539653938353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303133386564356531646662353934353238643733343739643930383436623539353535626434383631393166613866636562646336626336336636623866663030353961303766626237356666303062346162616630336665663531663966653436333838666531333363366138613238616661313363643061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061663635666439316330646661663963373662356666303064616235653335356563626662323339316266356631656436626666303062353662393331646665656232663937653636643433663861386636376132386132626537386634383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032626336336636623866663030353961303766626237356666303062346162643965626336336636623866663539613037666262373566666234616261663033666566353166396665343633383866653133336336613861323861666131336364306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306166366566643932643533666232623561393336386464663638383431333865373162356162633436626462666636346166663030393034366235666630303566353066663030653832643563373866663030663735393763626633333763336666313531656262343531343537636639653838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303537386337656437316665623334306666303037366562666630303639353762336437386337656437316665623334306666373665626666363935373565303766646561336633666338633731316663323637386435313435313566343237396131343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356564666630306232353766633832333561666661666138376666303034313661663130616636666630306439326266653431316164376664376363336666303061306235373236336666303064643635663266636364663066663030633534376165643134353135663363376132313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135653331666235633766616364303366646462616666646135356563663565333166623563376661636430336664646261666630306461353564373831666630303761386663666632333163343766303939653335343531343537643039653638353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031643666633234663835643337633465643561653264356235316662326462356134346166336361613831393839363338353530303931643730373965643866376166373466383539663062616462653138646235653561646165616232356430626239313163393932333062623736383233623165376164373962666563396437663134376532306435623462366662663335396337326166643131383833666661313861663733616630663166353661666236373464626433343362663066303837323239373530613238613262636633613432386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326263656265336366633266663133376334383962343931653165333663303539616366653733356334613534363562636263303138303733663734643761326430343865666539356135326162326133336537386565383939633534653336363763383765323966306336616665306564373236663066656237303834623838303863656433393536303436343135336463316163666165663766363931626138326537653238346539303963393836643231343763306538373665656665343435373035356634393436366561353238633965656431653563643238636461343134353134353638343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031653935666232636364316335663131616531316462303634643232343534316561376363386365336632303662653832616639616266363737626631363366313536633135613430616233633533343437323333396664643932303765363035376432613065373931643262633263633935623133376565393165383631396665656332386132386165303361303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032393039633733346234386330313163386131383166326666633730363537663861626163393436303437396561333230663766326437333563613536643763343862633137666630303130333561626135303330373534396330646137323038306534363766346163356166613861326164343632626339376534373933333737396230613238613262343234323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306462663836666138343161353738666234376266626136646231633761383435626462336430313630333366346536626562303433393561663864303132306534316337643262656163663836316532643866633662653061623164373436303438643136636238353037323536343566393562336638386338636636323262633863636539626263363766323362333062326465323734313435313435373934373630353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303533326536653232623538316565323737306138383835393938663630303634396137643731396631653763346631373836626531636465323839353936366265356662326462656465613462376465666137636131616161313037353236613262613933323661333136643966333535643465663733373332356334386535396134373263636337613932346537333531643134353764353165343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373739663031626532343565663833376335333136383933396466363161613563323435326131363033636237363231353634633965633333636662376432623833613932636565653762306263386166656435663663623034616232343664386538633065343166636562336162346533353639623862656135343234653332626133656338613261386638363735383866633431653165623264373232303032646464623234633030333963366535303731663835356561663937623335613333643635616130613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830316233346139303436643263383730616133323464376363666630303139626532376339663131376334303035393333326539623637393562343863663162633965623231316561373831386563303762396166373866386233616534396531636638373561623661623036376363356235333163363431653863653432303366383136636665313566326164376162393664323464626138666136383865346335346461623434323861323861663563653230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303365393766643965663530376266663030383533613737396137326430333462313732643965303438643866613730343537366235653364666232393738386663636233643462633264326361333331346162373330323165613433306461666630303830323133666566616166363131636437636465326133633938393932663366636366353238636239613961363134353134353733396130353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353037313833396130306632386664616162356637623466306464383738376132396330666236356431393235343164353931303766326362306663616263326162623866646131336334653965323366383931373130646262623138623465343136616130653731623937323563653366646532343765313563336437643136306139626137383638613764373566626366333262346239616133306132386132626138633832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306538336531376638623866383233633666363361666239666463616338363362393037666537396230646163376630636537663061666161363039653162393831326532303935356533373530633865613732313831653834316166386462656235656535666233386663353231613964393266383066356362613032653264613366663030383937626262376661643863373534316565613361373763363764326263626363363833393266366231653962666131643538366138393365353637616435313435313565333964633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135386665336366313535616638333763323737646532316239336665613231336535616533336239636630613366656661323262363039303361643738303765643164663132323366313236623462653066643236363264363961373461376564306530663132636664303866613266323365613466623161646630643435643761636133643361666131396435613861396331623363646165656561653266616561346264626239396134393636373266326262316535393839633932376631613865386132626539373633636230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306139326365663265623466626138656661636137363861363835633363353232316331353630373230386138653861303066613762653061663865616666303065323037383330366166616134306139373130356331623739396434663132623261613964663863306336373737346165626162383466643963373466313635663062326365356438343335636366333461643935633766313935316635653134373335646464376363353735313864363932386564373364356136646238323663323861323861633862306132386132383030613238613238303061323861323830306132386132383030613238613238303339376638636261646464663837626531626561626139643834636631636332313538653339313361613937373534633866346662646437623537636238636363656335646438623132373234393339323464376432626662343239323365313365613938663538336666303034376135376364333565643635383937623136666363653063353566396437613035313435313565393163633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303764346666303832643633623566383637613234373139323431623034363339663536663938666561366261356163626630343538376636363738336234616433636161383330653966306139306264333231303637663561643461663935396262643439336633376639396562343535613238323861323861393238323861323861303032386132386130303238613238613030323861323861303032386132386130306531666636386139653238376531336561303932333630636232633061383364346639616137663930333566333564376431626662346237666339326539626665626636316665363662653732616636663263666630303737376561636530633537663133653431343531343537613237333035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353462363536656437393739313561323130306362323261303237613032346532626134663834626630653236663839316532356665636639323437386163656464343439376233323065343265373835303761303237663930323762353762643639316630356265313936386336333936643763323536656432343766373565373636393065373230653765363237396533663061653363343633323964303763626262333661373432353531356661316434343638393134366231633661313535353430353535313830303532643134353763663965393035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303165376666303062346239316666306162653531666634666230666633333566333964376438336163363835613366383836636666303062336635636433613262613833373836663236373430636134386538373036626338666533633763313464303734386430646263356665306664336665636336646462333762366231363461333231323036663531666333386565303731386537386337336539653033313334653961663635326561663733393331313461353237636338663161613238613262643933383832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238303039333830323830336465626636353664316131623666303735663662333831653635643566656336336665636132306330666364646266336166353261653562653063663836366533633237663065656333346362636666303035636538363739393736653061623366636462346662383034306663326261396166393963343464353461663239326565376139343937326433343832386132386163346430323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326161366264363131656139613235653639643261613931373136623234363737616534373261343732336266356162373438643964613731343663656530663534376336396433386132626131663861376531323966633137653338626564316464356263613639346362366163633431646431333132343165336631316635303662396561666161383439346532613462613965343439333862623330613238613261383431343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313461616163656331313134393234653030303238303132626164663832356531303165333066383833363936663361383336663636376564353732303863656535343233306264306630353861383365643961623165313266383039663130626335306332353937346366656365383330306639626138323934323765386238646334653364383066376166363966383535663039373463663836333662336639313765663735373337363133636539396533306130366463663061303734316366373236623833313738626137306136653331373739333361323864313934613439623561316436616138353138303331346234353135653131653830353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430316535376662353037383339623531663065343165326562353839373765396566623265316262393839633830336562383663376664663436626331656265626666303031316538353635653236643065656234306434353439383265653136386534633735303038656133646331633166633262633433633564666232666630303861373462373936653763326237663136613130323863613433323765656536336339653366626164633633396338636661353761643831633535333835336636373337366563373165323238633963623961323866326661326165366235653166643666633339373766363064373734613965643236633634343733633635343931656133336436613964376161396136616538653364353362333061323861323938303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435373437653066663030383535653338663162623262653864613262616462623063666461656537663737313633643433316662646666303163643463613730383262633964393064323732373634386537326165653837653163643762633462373366363364303334386238626239303633373263313131366462396533323466343531656536626462336332316662326666303038363734623531373365326362663764346135323031313063373938613235336466613164636466613764326264326234636431373438643136643435386539316136343136643061663438653038383238666338353739643537333261373164323961626665343734633330623237663136383738623738343366363561643561656636646366386362353834623634323134386236623333626534663730353838646162653963366566663166353266306137633330663033663833313737363833613063353163623830316165363463626338373166656433363731663431383135643030303030633031343537396235373133356562376334663465633735343239343231623231303238313462343531353831613035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313865373334353134303135333535643066343864373664396163663538643361316239383964343836343961333063333037656264326263663363356466623331373834373536326637336531396262396234633930386532326536353862333866343237373066636662663461663465613262346137356161643237373833623131323834323762613365356566313766633136663838316530653632663739613333356435626530396662353538383332613031656638313935666334303165653662393461666232636161396561326239386631386663323066303237386434393962353564316432333963383230356364616532333933396366323438653162616537393036626431613539396235613534356633356665343733346630626663616366393665386166346666313866656363336532386432303962386630616466343761393435383237636137633437323866366534653162663331663461663338643466343864353734356239333637616265396233646163613339663265653232323837316562383364616264326137356539353635656533623963643238346530663534353761323861326235323032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613764626462356364653465623664363936656632633865373039316336613539393866623031633961663436663033666563643765326466313033323564663839653431613535623163333663363031613637353363663061306531376433653665343761353637353262353361326166333736326133303934646439323363646431316534373131633661353938396330353033323439616565336331356662336666303038656663356132336262626262356665636462333765376366626235663963386636386661396663373033646562646262633137663039376331316530363531323639336134616339373030393366366362396333636263666133363365353165633331356432383138313861663265616536353237613533353666333637356333306139376334636531626331626630303363303765313535346238623962316665643162613061303334643761303332653762393534653833663163396637616565323334353864303436383030303036303030336135326431356536636537336139326263396463653938633633313536343832386132386139323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326138656239653162643066633462366336636235656432366465656532633163326366313836646239313832343165616137646337333537613861313336396464303334396133633862633635666232646539393736356165626331356161333561336530653264366566326631393365636333653635316638333537393566386237653164663863376331333337393765323164313235383930666464396434366638646266653034333866633361643764363334633965646130626138396130623938393634343735326165386562393063306635303437376165656135393835366137613462646535663866646537336366306630393661623433653336653964343531356634346638646266363731663035373839353565653734333866666232616538616531306462613066323439663738666663303861663233663162376331356631636638323561346238623864336665643936363837666533663264336536313866353635656162663838633762643761373437316234326236383964396639396362336131353230373235343530373833383334353735393838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353737376630663365303166386237633661323364346235303433613736396563353466396233326665663235353233333934356566646239333831636631396539353964346162346539343739613665633534363132396262323437306430343133356363636236663664306234393233623035343864313732353839653830303164346437613466383162663636396631343662616339376265326339346539393661346534633433306433333866613734356663373931653935656264653036663835646531316630306461383564316234663064373035373663623762333631613539333966356337316634313861653863306330633061663261626536333239363934393562636365626137383634623539313831653064663836396530666630323432313334306432393136356462383762613930366539396665616466643036303536666431343537396232393461366566323737363735323439326430323861323861343330613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613432613066366135613238303338656631616663306566303237386366636362393937346666623164646338646238646464393030616363376265653166373562336466323333656635653364653335666439666263373565313335376263623262363161393561323634393936643031646561303766373933616634663463386166613461386165616133386361663437343465656262333331396430613733336533343230613932313831303431653431613461666137666337626630366263313965336334363965663663376563643738373138626562353031363433386665663736363166356537646562633537633766663032626336356530383266373931343166646131363262623866646136643530393331613865656562386639376633323338656235656235306336643161646133643166396666303039396339353238346531653638653261386132386165633330306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306162396130663837663538663133366137316538666131643834393733373132623030313233356365303634306463346636353139653439653035323638356131366162653235643536316431373435623436396565323736646138386266636339656330373733356634636663326666383566613366633336643163356264623031333565636133666432656630616530633837643030656361336433663133356339386163353437306631656564396235326134656133663233303365313766656366626131373834633433616366383934343737666139303031393534386363353033376662323366383866336434666137303035376133383030306330313435313565306434613935326163623961366565376131313834363061633832386132386138323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239313931356265663238333462343530303739386663356566383039613666383932313937356566303864623437366261386138326432343038626235326534663164376232623633323732303732376166613866303562616235623962316239376233626462373738613638396361633931346138353539313837353034316538366265633833633863353739383763376366383365396532356230376631366638373264336665323633366339666266383632346536653530376230666533313933636635323338663461663462303538633730393261373531653964316636666638303732643761303961653638656537383135313435313565643163323134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313561376530636431336665313234663136363964613131303461646435653436393236306666303030313366333765393961353236613331366662306432626262316565336662336237633339383363333765313935663134366131366330646665613531383734363635663961313834663261613366646566626337663066346166343861366132303538633436336130303030613735376362643561393261623531636535643466353631313530386134383238613238613832383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239306138323330343532643134303166333966656430626630663933633233653262666564616432656434323538366134346261616132363136323934376465343138653939666264663839663461663366616661376265333637383531336335376630663666616463343035653662353466623535623664656131643031336661616565316638643763633335656665303262336162343263663735613766393165373632323163393533346561313435313435373639383035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373466663036626665346138363862666630303566396666623239613238616361626666303235653863613837633638666139363861323861663938336436306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303233626330316163653530343634313864623230666432626533363164323861326264356361376564666338653263356634313638613238616635636534306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830336666666439, 11);
INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(87, 'Itzel', 'Ramirez', 'Galicia', '1993-10-19', 2147483647, 'itzelrg@gmail.com', '2021-08-28', 'RAGI931019MMCMLT06', 'RAGI931019U56', '1234567891', 'ACTIVO', 1, 0x307866666438666665303030313034613436343934363030303130313030303030313030303130303030666664623030343330303032303130313031303130313032303130313031303230323032303230323034303330323032303230323035303430343033303430363035303630363036303530363036303630373039303830363037303930373036303630383062303830393061306130613061306130363038306230633062306130633039306130613061666664623030343330313032303230323032303230323035303330333035306130373036303730613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061666663303030313130383031613230323938303330313232303030323131303130333131303166666334303031663030303030313035303130313031303130313031303030303030303030303030303030303031303230333034303530363037303830393061306266666334303062353130303030323031303330333032303430333035303530343034303030303031376430313032303330303034313130353132323133313431303631333531363130373232373131343332383139316131303832333432623163313135353264316630323433333632373238323039306131363137313831393161323532363237323832393261333433353336333733383339336134333434343534363437343834393461353335343535353635373538353935613633363436353636363736383639366137333734373537363737373837393761383338343835383638373838383938613932393339343935393639373938393939616132613361346135613661376138613961616232623362346235623662376238623962616332633363346335633663376338633963616432643364346435643664376438643964616531653265336534653565366537653865396561663166326633663466356636663766386639666166666334303031663031303030333031303130313031303130313031303130313030303030303030303030303031303230333034303530363037303830393061306266666334303062353131303030323031303230343034303330343037303530343034303030313032373730303031303230333131303430353231333130363132343135313037363137313133323233323831303831343432393161316231633130393233333335326630313536323732643130613136323433346531323566313137313831393161323632373238323932613335333633373338333933613433343434353436343734383439346135333534353535363537353835393561363336343635363636373638363936613733373437353736373737383739376138323833383438353836383738383839386139323933393439353936393739383939396161326133613461356136613761386139616162326233623462356236623762386239626163326333633463356336633763386339636164326433643464356436643764386439646165326533653465356536653765386539656166326633663466356636663766386639666166666461303030633033303130303032313130333131303033663030666433306132386132626562306631633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861326234623436663036663862336334303836356431376333623762373638303766616338366439393937663363363239333934363261656438643236636364613262626564303366363666663839356163613039656565643664623466343237666535663237663962316561313530333765343731356438653864666232383638663163363864616666383965653635376365363435623438643633356661303264623866653335636433633665316139656632626661366136393161333532356430663130613339616661353663336636373866383533363230366664303165653065303864643731373732316366653030383166613536613639666630386265316136393837333662653062623032373966663030356630663962666630306131653662303936363734353663396665303638623062336561636639353866643238616661353765323035383763316166303765383866373365323466306265393438616561343437366630643963366233346137643133363830373365663930303761386166396236653165323932653234393230386236323333393238393963656431396530363762643734363162313166353834646138623436353532396662333736623863613238613262613463633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323964313435326366326163333034346365656537306138386239323466613030336164303033363830306231646161333234663430326264323763306266623336373861376334353161656131653235393962346162373630306163366631366539396336376136646338643963373733636662353761663738336665313266383162633130383065386661333233346333303464643563666566323463386565303966626265626336326238366236336538643237363561626665626139626333306633393661663433633133633331663034626532333738613437393930363832663639313630316633623530303632303437623032333237663031356538626531636664393537343462363331636665323766313063623734373166336331366339653561363764333731323439316639316166356230333033313435373964353331663838613962336232663233616133383761373164663533396566306637633262663837646531373664666133663835616435356639633439326139393563376165313963393232626130313161326138353534303030313830303065393462343537316361353239336263396463643932346236306330316430353134353134383631353931653363663133316630366638343666626334636236396537396234383833326335626636656532343830333237623063396164376163656631363738373263376335646531656261663065366132363431306464323664373331333631383630383230386663343061613866326633326536643834656636643066393562633537653262643666633639616434626166366264373565363464323163326138653136333565636161336230316665373961636461656366653234376331326631346663336636333761313464663639653466313737306337636166313933626437396462646639633931656664616238636166613661353361353238326636376231653534393439346264656463323861323861643039306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386165636265313166633234643462653233656135663639623930663036393730336532653665343065356366356438396561376434663631663830333135326134323934316361356232326133313733393539313939653031663836666532366638383961383764393334346235646230613330313731373932663131633433666139663631636665316364376266376333616638333565313766383764303234643064626135646466653366373937663361303263306637643833663830373364623933646339616538623430663065653864653137643332336431663432623034623762373838363132333431666139336434393365613739616262356531363237313935326262623264323364626663636566613534323334663537616230653934353134353731396238353134353134303035313435313430303531343531343030353134353134303064393631386137386363353334366165616330383635363139303431656130643739306663353866643964323262623132663838626330333061633732663264333639613330313566663030656239666637346666623237383364623164326264383238616436393536613934323563643036343465396336613262333365333662386237396564323737623562393835613339323336326232323361653061393164343131346361666134626532646663313664323765323064626236613961376564623664353931376534396330663936366330653135663166346330336434376266346166396462353864316235356630666561333265393361643538343936643731306236316532393537303437626662386634323338333565663631623135306334343734646662316537353461353261366663386164343531343537343939383531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353030313632313534363439653830353030373435663063666531656561336631313763343839613464623636336237386630663762373338653233346366666538343761303166653036626539666430623434643337633362613534316133363933366162306462646263363132323435663431656265613466353237623961653666653062373830613166303237383332313832363835376564623736303464376166623038366463343730383733636663613065336562396635616562656265376631393838373565613539366362366666303033336431613134643432333765616332386132386165333337306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306165333365326666303063323662326638386661343839326434616331613935616139333662333931633337666433333666663634666166363363666138336439643135353039636139633934613265636431333238613932623333653339643433346662656432366661356433333532623636383665323037323933343465333035353837353135306437626366656431626630626133643662343936663163653866303835626262323866663030643331313431636364313761653364353739333966346366613061663036616661336333353738653232396633326466613965366435613665396361633134353134353665363631343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356435666331356630633237386137653233653966363933326162343536663237646136363536303038363534633163313037613832646234376533356361353761396665636135363331636465326564343666646231626131643363323238323366626365626365376237646466643662306335343963333066323662623161353235636435313233646534373465393435313435376364316561303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303064396132343961333331343862393536313836303762386166393562653238663834626665313039663162646636383731343435366463343965363561363562333938396239356537646261376531356635353961663037666461623664353233663135653939373630396463666137393436663463326239323366663030343233356466393735343731633437326634363865366334633666346566643866326261323861326264643338303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303262643662663634646666393066656166663030663565373166666538363662633936626437376636346238323536643633353962393062663232646234346163373364303936363233663931616535633666663030626163386436383766313531656466343531343537636539653938353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303133386564356531646662353934353238643733343739643930383436623539353535626434383631393166613866636562646336626336336636623866663030353961303766626237356666303062346162616630336665663531663966653436333838666531333363366138613238616661313363643061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061663635666439316330646661663963373662356666303064616235653335356563626662323339316266356631656436626666303062353662393331646665656232663937653636643433663861386636376132386132626537386634383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032626336336636623866663030353961303766626237356666303062346162643965626336336636623866663539613037666262373566666234616261663033666566353166396665343633383866653133336336613861323861666131336364306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306166366566643932643533666232623561393336386464663638383431333865373162356162633436626462666636346166663030393034366235666630303566353066663030653832643563373866663030663735393763626633333763336666313531656262343531343537636639653838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303537386337656437316665623334306666303037366562666630303639353762336437386337656437316665623334306666373665626666363935373565303766646561336633666338633731316663323637386435313435313566343237396131343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356564666630306232353766633832333561666661666138376666303034313661663130616636666630306439326266653431316164376664376363336666303061306235373236336666303064643635663266636364663066663030633534376165643134353135663363376132313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135653331666235633766616364303366646462616666646135356563663565333166623563376661636430336664646261666630306461353564373831666630303761386663666632333163343766303939653335343531343537643039653638353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031643666633234663835643337633465643561653264356235316662326462356134346166336361613831393839363338353530303931643730373965643866376166373466383539663062616462653138646235653561646165616232356430626239313163393932333062623736383233623165376164373962666563396437663134376532306435623462366662663335396337326166643131383833666661313861663733616630663166353661666236373464626433343362663066303837323239373530613238613262636633613432386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326263656265336366633266663133376334383962343931653165333663303539616366653733356334613534363562636263303138303733663734643761326430343865666539356135326162326133336537386565383939633534653336363763383765323966306336616665306564373236663066656237303834623838303863656433393536303436343135336463316163666165663766363931626138326537653238346539303963393836643231343763306538373665656665343435373035356634393436366561353238633965656431653563643238636461343134353134353638343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031653935666232636364316335663131616531316462303634643232343534316561376363386365336632303662653832616639616266363737626631363366313536633135613430616233633533343437323333396664643932303765363035376432613065373931643262633263633935623133376565393165383631396665656332386132386165303361303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032393039633733346234386330313163386131383166326666633730363537663861626163393436303437396561333230663766326437333563613536643763343862633137666630303130333561626135303330373534396330646137323038306534363766346163356166613861326164343632626339376534373933333737396230613238613262343234323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306462663836666138343161353738666234376266626136646231633761383435626462336430313630333366346536626562303433393561663864303132306534316337643262656163663836316532643866633662653061623164373436303438643136636238353037323536343566393562336638386338636636323262633863636539626263363766323362333062326465323734313435313435373934373630353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303533326536653232623538316565323737306138383835393938663630303634396137643731396631653763346631373836626531636465323839353936366265356662326462656465613462376465666137636131616161313037353236613262613933323661333136643966333535643465663733373332356334386535396134373263636337613932346537333531643134353764353165343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373739663031626532343565663833376335333136383933396466363161613563323435326131363033636237363231353634633965633333636662376432623833613932636565653762306263386166656435663663623034616232343664386538633065343166636562336162346533353639623862656135343234653332626133656338613261386638363735383866633431653165623264373232303032646464623234633030333963366535303731663835356561663937623335613333643635616130613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830316233346139303436643263383730616133323464376363666630303139626532376339663131376334303035393333326539623637393562343863663162633965623231316561373831386563303762396166373866386233616534396531636638373561623661623036376363356235333163363431653863653432303366383136636665313566326164376162393664323464626138666136383865346335346461623434323861323861663563653230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303365393766643965663530376266663030383533613737396137326430333462313732643965303438643866613730343537366235653364666232393738386663636233643462633264326361333331346162373330323165613433306461666630303830323133666566616166363131636437636465326133633938393932663366636366353238636239613961363134353134353733396130353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353037313833396130306632386664616162356637623466306464383738376132396330666236356431393235343164353931303766326362306663616263326162623866646131336334653965323366383931373130646262623138623465343136616130653731623937323563653366646532343765313563336437643136306139626137383638613764373566626366333262346239616133306132386132626138633832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306538336531376638623866383233633666363361666239666463616338363362393037666537396230646163376630636537663061666161363039653162393831326532303935356533373530633865613732313831653834316166386462656235656535666233386663353231613964393266383066356362613032653264613366663030383937626262376661643863373534316565613361373763363764326263626363363833393266366231653962666131643538366138393365353637616435313435313565333964633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135386665336366313535616638333763323737646532316239336665613231336535616533336239636630613366656661323262363039303361643738303765643164663132323366313236623462653066643236363264363961373461376564306530663132636664303866613266323365613466623161646630643435643761636133643361666131396435613861396331623363646165656561653266616561346264626239396134393636373266326262316535393839633932376631613865386132626539373633636230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306139326365663265623466626138656661636137363861363835633363353232316331353630373230386138653861303066613762653061663865616666303065323037383330366166616134306139373130356331623739396434663132623261613964663863306336373737346165626162383466643963373466313635663062326365356438343335636366333461643935633766313935316635653134373335646464376363353735313864363932386564373364356136646238323663323861323861633862306132386132383030613238613238303061323861323830306132386132383030613238613238303339376638636261646464663837626531626561626139643834636631636332313538653339313361613937373534633866346662646437623537636238636363656335646438623132373234393339323464376432626662343239323365313365613938663538336666303034376135376364333565643635383937623136666363653063353566396437613035313435313565393163633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303764346666303832643633623566383637613234373139323431623034363339663536663938666561366261356163626630343538376636363738336234616433636161383330653966306139306264333231303637663561643461663935396262643439336633376639396562343535613238323861323861393238323861323861303032386132386130303238613238613030323861323861303032386132386130306531666636386139653238376531336561303932333630636232633061383364346639616137663930333566333564376431626662346237666339326539626665626636316665363662653732616636663263666630303737376561636530633537663133653431343531343537613237333035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353462363536656437393739313561323130306362323261303237613032346532626134663834626630653236663839316532356665636639323437386163656464343439376233323065343265373835303761303237663930323762353762643639316630356265313936386336333936643763323536656432343766373565373636393065373230653765363237396533663061653363343633323964303763626262333661373432353531356661316434343638393134366231633661313535353430353535313830303532643134353763663965393035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303165376666303062346239316666306162653531666634666230666633333566333964376438336163363835613366383836636666303062336635636433613262613833373836663236373430636134386538373036626338666533633763313464303734386430646263356665306664336665636336646462333762366231363461333231323036663531666333386565303731386537386337336539653033313334653961663635326561663733393331313461353237636338663161613238613262643933383832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238303039333830323830336465626636353664316131623666303735663662333831653635643566656336336665636132306330666364646266336166353261653562653063663836366533633237663065656333346362636666303035636538363739393736653061623366636462346662383034306663326261396166393963343464353461663239326565376139343937326433343832386132386163346430323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326161366264363131656139613235653639643261613931373136623234363737616534373261343732336266356162373438643964613731343663656530663534376336396433386132626131663861376531323966633137653338626564316464356263613639346362366163633431646431333132343165336631316635303662396561666161383439346532613462613965343439333862623330613238613261383431343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313461616163656331313134393234653030303238303132626164663832356531303165333066383833363936663361383336663636376564353732303863656535343233306264306630353861383365643961623165313266383039663130626335306332353937346366656365383330306639626138323934323765386238646334653364383066376166363966383535663039373463663836333662336639313765663735373337363133636539396533306130366463663061303734316366373236623833313738626137306136653331373739333361323864313934613439623561316436616138353138303331346234353135653131653830353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430316535376662353037383339623531663065343165326562353839373765396566623265316262393839633830336562383663376664663436626331656265626666303031316538353635653236643065656234306434353439383265653136386534633735303038656133646331633166633262633433633564666232666630303861373462373936653763326237663136613130323863613433323765656536336339653366626164633633396338636661353761643831633535333835336636373337366563373165323238633963623961323866326661326165366235653166643666633339373766363064373734613965643236633634343733633635343931656133336436613964376161396136616538653364353362333061323861323938303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435373437653066663030383535653338663162623262653864613262616462623063666461656537663737313633643433316662646666303163643463613730383262633964393064323732373634386537326165653837653163643762633462373366363364303334386238626239303633373263313131366462396533323466343531656536626462336332316662326666303038363734623531373365326362663764346135323031313063373938613235336466613164636466613764326264326234636431373438643136643435386539316136343136643061663438653038383238666338353739643537333261373164323961626665343734633330623237663136383738623738343366363561643561656636646366386362353834623634323134386236623333626534663730353838646162653963366566663166353266306137633330663033663833313737363833613063353163623830316165363463626338373166656433363731663431383135643030303030633031343537396235373133356562376334663465633735343239343231623231303238313462343531353831613035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313865373334353134303135333535643066343864373664396163663538643361316239383964343836343961333063333037656264326263663363356466623331373834373536326637336531396262396234633930386532326536353862333866343237373066636662663461663465613262346137356161643237373833623131323834323762613365356566313766633136663838316530653632663739613333356435626530396662353538383332613031656638313935666334303165653662393461666232636161396561326239386631386663323066303237386434393962353564316432333963383230356364616532333933396366323438653162616537393036626431613539396235613534356633356665343733346630626663616366393665386166346666313866656363336532386432303962386630616466343761393435383237636137633437323866366534653162663331663461663338643466343864353734356239333637616265396233646163613339663265653232323837316562383364616264326137356539353635656533623963643238346530663534353761323861326235323032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613764626462356364653465623664363936656632633865373039316336613539393866623031633961663436663033666563643765326466313033323564663839653431613535623163333663363031613637353363663061306531376433653665343761353637353262353361326166333736326133303934646439323363646431316534373131633661353938396330353033323439616565336331356662336666303038656663356132336262626262356665636462333765376366626235663963386636386661396663373033646562646262633137663039376331316530363531323639336134616339373030393366366362396333636263666133363365353165633331356432383138313861663265616536353237613533353666333637356333306139376334636531626331626630303363303765313535346238623962316665643162613061303334643761303332653762393534653833663163396637616565323334353864303436383030303036303030336135326431356536636537336139326263396463653938633633313536343832386132386139323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326138656239653162643066633462366336636235656432366465656532633163326366313836646239313832343165616137646337333537613861313336396464303334396133633862633635666232646539393736356165626331356161333561336530653264366566326631393365636333653635316638333537393566386237653164663863376331333337393765323164313235383930666464396434366638646266653034333866633361643764363334633965646130626138396130623938393634343735326165386562393063306635303437376165656135393835366137613462646535663866646537336366306630393661623433653336653964343531356634346638646266363731663035373839353565653734333866666232616538616531306462613066323439663738666663303861663233663162376331356631636638323561346238623864336665643936363837666533663264336536313866353635656162663838633762643761373437316234326236383964396639396362336131353230373235343530373833383334353735393838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353737376630663365303166386237633661323364346235303433613736396563353466396233326665663235353233333934356566646239333831636631396539353964346162346539343739613665633534363132396262323437306430343133356363636236663664306234393233623035343864313732353839653830303164346437613466383162663636396631343662616339376265326339346539393661346534633433306433333866613734356663373931653935656264653036663835646531316630306461383564316234663064373035373663623762333631613539333966356337316634313861653863306330633061663261626536333239363934393562636365626137383634623539313831653064663836396530666630323432313334306432393136356462383762613930366539396665616466643036303536666431343537396232393461366566323737363735323439326430323861323861343330613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613432613066366135613238303338656631616663306566303237386366636362393937346666623164646338646238646464393030616363376265653166373562336466323333656635653364653335666439666263373565313335376263623262363161393561323634393936643031646561303766373933616634663463386166613461386165616133386361663437343465656262333331396430613733336533343230613932313831303431653431613461666137666337626630366263313965336334363965663663376563643738373138626562353031363433386665663736363166356537646562633537633766663032626336356530383266373931343166646131363262623866646136643530393331613865656562386639376633323338656235656235306336643161646133643166396666303039396339353238346531653638653261386132386165633330306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306162396130663837663538663133366137316538666131643834393733373132623030313233356365303634306463346636353139653439653035323638356131366162653235643536316431373435623436396565323736646138386266636339656330373733356634636663326666383566613366633336643163356264623031333565636133666432656630616530633837643030656361336433663133356339386163353437306631656564396235326134656133663233303365313766656366626131373834633433616366383934343737666139303031393534386363353033376662323366383866336434666137303035376133383030306330313435313565306434613935326163623961366565376131313834363061633832386132386138323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239313931356265663238333462343530303739386663356566383039613666383932313937356566303864623437366261386138326432343038626235326534663164376232623633323732303732376166613866303562616235623962316239376233626462373738613638396361633931346138353539313837353034316538366265633833633863353739383763376366383365396532356230376631366638373264336665323633366339666266383632346536653530376230666533313933636635323338663461663462303538633730393261373531653964316636666638303732643761303961653638656537383135313435313565643163323134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313561376530636431336665313234663136363964613131303461646435653436393236306666303030313366333765393961353236613331366662306432626262316565336662336237633339383363333765313935663134366131366330646665613531383734363635663961313834663261613366646566626337663066346166343861366132303538633436336130303030613735376362643561393261623531636535643466353631313530386134383238613238613832383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239306138323330343532643134303166333966656430626630663933633233653262666564616432656434323538366134346261616132363136323934376465343138653939666264663839663461663366616661376265333637383531336335376630663666616463343035653662353466623535623664656131643031336661616565316638643763633335656665303262336162343263663735613766393165373632323163393533346561313435313435373639383035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373466663036626665346138363862666630303566396666623239613238616361626666303235653863613837633638666139363861323861663938336436306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303233626330316163653530343634313864623230666432626533363164323861326264356361376564666338653263356634313638613238616635636534306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830336666666439, 10);
INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(88, 'Angel David', 'Martinez', 'Mendoza', '1998-12-06', 2147483647, 'angeldavid12@gmail.com', '2021-08-28', 'MAMA981206HMCRNN01', 'MAMA981206N31', '1234567891', 'ACTIVO', 2, 0x89504e470d0a1a0a0000000d4948445200000431000003a80806000000c8c46f88000000097048597300000b1300000b1301009a9c18000000017352474200aece1ce90000000467414d410000b18f0bfc61050000acb2494441547801ecfd3d701c579ee77bffff09b0433b4e438e08b03ba24bde448704260870a2631c15bdbe96406fc612e8ed5824ad67d622683db316496b772c82d6336b91b2eeacc5923357cfe50b12ec8d1b732d958c4b82eb34e56c74b75079ee399909100001a20054659e97ef27a21b10a596d42c5456e6effc5f5400e01cf23c9fdb91d93c9332d76ce6b218938b983911ed09000048d53bfb9fa1a80c4d295ba5c86056760aeb9d00c039a800c0197c91aff46754eed86f6d6821730200007012952765597efb87e2e58600c019106200189babba28b3d99b6ae496105c00008033d3616946770933009c16210680b17c992faf669add13313d0100009808c20c00a7438801e0a3f23cef199d7d68bfed0b0000c0740cd4ecdc288a622800f0118418008e65038cdce885c7545f000080e9d3a11ab95e14cf0a01806364020047585cfe9b6f8cce3e25c0000000ed303da36673315fb92500708c190180435c80a165b961bffd440000005aa42abfbf387fe9a7b7dbafbf170038841003c001d5004f917f110000808eb8206361fed7c3ededff674b00601f666200d8d30cf1dc14d6a7020080eebd53a3d7989101603f666200d863f4c25321c00000007e98332a8fed210bf72600f6106200a82c5e59b9c3104f0000e017d32bb3d93b02000dda4900ecb691fc200000001e5223d78ae2f94000248f4a0c0062b2194e38000080b78c0af72a002a841840e2beccafacd93b8335010000f0573fcf97570540f2083180c4654a15060000f09fd1ec1e433e01106200095b5cbe7a93619e0000200ca657caec2d019034067b0289aa8779ba95aa841800002018efd4ec2c154531140049a2120348543dcc930003000004658e81e440daa8c40012c44a550000103256ae02e9a2120348900d301e0b000040a058b90aa48b1003484cb55255241700008070f59b7b1a008921c40012c34a55000010838c95ab4092083180842c5e59619827000088c51c2b5781f430d8134804c33c0100408458b90a24864a0c2011ac23030000119ab387340f054032a8c40012401506809a19d65fb5feaaf55753963fd93f78e7becfa4745fdfbdffdf64c3837f8fd9a19ca028be3ff0d7d43deb9f7ca46f7d64ff9c39f4e7cdfe5f9b2b259bdbfd75cdb25f567fcec8de9fafff5aed098024b1721548c7ac00889ed10b4fed7f0b8098b840c2060f2ad5571744647548f1ae0e24dc7feac0e170a8d0b6a2280e0523d395e7bfeb1d0c46ca9e0d417aee3bcdf43762766703b9afda1300c1332af7ec972501103d2a3180c8b9f5639966945902c1781f4e98d2fce8becfa41cd615112e94f8d3bb2614c084d49522177a75e8b11b78b88a0f177854551eb97d1dd8800078ce18b9fdaa787e5f00448d10038858dd46525561f404802776430a2d5c48510714ae6ae242d175c5043e2ecfafe6fb838ef7551d5474009e70433e3f27e805e2463b0910b1329bfd460d0106d03e1b54ec85145568317421055514612b8a67c5c7fefcbe90232f457baa7a59aa791d920b8036ccd97b1f37c8fcb6008816951840a418e6094c9b7957851336acd072b425d5cc875f0c082a70943ae070151c9a6b2697695301a6a7a9c6180a802811620091ba7c65f9a1185d130013e02a2bb2411d56d45515b47e6012f6576f982cfbca861b3da1720338afc1d6e6f36b02204a84184084becc975733d5c702e094aaea8ac218b395892944668a935a088069785fb921fdba2d85aa0de03458b90ac48b100388d0e5a5ab3f30cc13388971c33507f5dc0a19505d01dfb936411bace5554b8aca57041bc0c7e850cdcf4bb4f701f121c40022c34a55e028fb2b2c082c108ff7c106151bc061c6c8dd57c5f375011015420c2022ac540576edcdb0f88e9610a4a66e4519b98a8d26d860c60692c5ca5520428418404418e689341daeb2180db86105deb301f79cc86c53ade1da50a42f40228ccafd572f9fb3721588082106100956aa221d7568a1a6fc56242b44760a420be074f27ca55f6d44d1ec6b5a50103b867c027121c4002271f9caca6331b22a40740e8616dc880293d7b4a0f40935102956ae021121c40022c0304fc46537b490efec1f0c082d80f61dacd4a0fd04e15363ae17c58b270220788418400458a98af099a131f26d26fa84f610c03f2ed428c5acaaaa9ba9c1a050048895ab402c083180c02d5e59b9634facd705088a79279a3dd172b4654f7b37b8a904c251af75cdfa26cbbe1663fab49e2014ac5c05e2408801048c95aa088c6b11f956681101a242950602e256aeba6a8ca10008162106103056aac26ffb0772526d01a4e0609506c3a6e12195275b2f9f5f1700c122c40002c54a55f869b74dc43c62b605803c5f5e2d455655e52b7bdbd913c003ac5c05c246880104eaf2d2caa650b60b2fbc1fcac94d2180e3bc6f3b91af0934d03156ae020123c40002c44a5574cf0cd5e82361be058033c8f3ab7929e51a7334d0151bbedf7e553cbf2f0082438801048895aae806c10580c96be668ac1acdbe11020db4c70df9fc9cb647203c8418406058a98a76115c0068cffb40436fd272826963e52a1026420c20200cf3443b8c3d9dd207427001a043ef5b4e98a181e969aa31860220188418404058a98ae931efec89d423867302f0513314748d2d279802867c028121c40002f15b7b227541cda6001363ded98f81428ddc651d2a8050bc5fdbaadf083001ac5c05c24288010482619e98a0819af25b917283e00240a89af919fd6620685f8033d3e1d6e6b3cf05401008318000b05215e7b73be7c2b58b3c2b040022e2028d52666e313f0367c5ca55201c841880e7ea619e179e528581331ab87611ca6401a4e2fdfc0cda4d702aac5c0502910900af95d9ec37041838a56ace85bd19fbd40d2b23c000901277cd7b55bc58730fa46aca1b6e55b400279bb3f75c770480f7a8c4003cc64a558ccfbc13d58196f280d002000ea23a03e352a34bb45d027e23c4003cc64a559ccc0ced0dd723919dfb94c002c0c7bd1f06aa77989d8163b07215f01c2106e0a92ff3e5d54cf5b1004763d605009c03d519380e2b5701bf1162009e62a52a3eb4bb6184aa0b009894ba3a63e69661b309f6e850cdcf4b7cd6027e22c4003cc44a551c3250533e12299f70430500d393dbcf5fa399abcce80b92668cdc7d553c5f1700de21c4003cc34a55ec43cb080074805613082b57016fcd0800af5cbcf4ab7bc20950c2aa9691ffacb2737dab78f9cfdbdbaf8702006895bbf6bedd7ef36461feb34746f4535599b3677f7382947c2299cebf7df3e65b01e0152a31008fb05235656c1901009fd5ad266c35490d433e01ff1062001eb97c65e5b1185915a4849611000808733392c3ca55c0338418802718e6991cc20b0008187333d2519af2c61f8a971b02c00b8418802758a99a08633654f411e10500c4c1b5829632b34e98113356ae023e61b027e081c52b2b776ca2481b49b4f68675ded82a361f31ac1300e2b1bdbdfdeee01050cd05b1993392fdf9edf6eb8100e81c951840c79a619e9bf65ba69e47a70a2f1e30ac1300d2e13ed74566d78c9a6f18021a15b772d555630c0540a7a8c4003a56af54d5df0922b25b7931fafba278f9aff694ee4f02004882abccd8b627f60bf317bf55c97e1275ada2ac678dc0279265bdb76f5eff3701d0292a31800eb1523536545e00000eaa2b33b23eeb59e3c0ca55a07b8418408718e6190bc20b00c0c9eaf5ac84198163e52ad031420ca023ac548d01e10500e0f40833c2668cdc7e553cbf2f003a4188017420cff339a31736a9c20815e10500e07c18001a3437e4f373ee01806e30d813e8c067977efdff61a56a8818d80900980c068006ed1356ae02dda112036819c33cc3a446ee527901009816777f50caccbaaa7e230842538d311400adca0440ab4c367347100e6336ea9b94e7eb0418008069710fc3af8a176bee33c718f348e03d7b28c56c33a0035462002dfa225fe9cfa83c158460e0aa2f58a30600e80295196160e52ad03e420ca045ac540d02e10500c01b36ccc89b13ff5ce0211d6e6d3efb5c00b486c19e404bdc4a557b9ab226f09419daf0e2c656f1e23f6d6fbf1e0a00001ed8b6de6ebffee785f9f91fedf163cef04fefcc5d9cbfa40cf904da432506d0827a98e785a75461f8a85e97ea665e0800009ecbeda18851bdc35a56afb072156811833d811694d9ec4d020cffb8b61135a3cf09300000a1288a971bf6b3eb5abd350b9e98b3f77a0c6e075a4225063065ac54f5d2c09e98dc602d1a0020640cfff40b433e81765089014c192b55bd52b81b8cadcde7d708300000a1dbb79675c9cd761274caa870cf07b4804a0c608adc30cf4c33768877ae9a7be1368edc17000022c5bc8cee518d014c1f21063045ac54ed9e1af34064b4ceb02da42ecff3b93fc92773998cec7fcc9c4ad973bf6e6f04e644b26adb8166fa9bbdff81d97fed3aea3a566d4838cb9684772e583cf4f77a57fffaee1fbaefab5f13539a1feb5f2cdf19a97fdd347f6e4766879fc89fdef1fe06de6b5a4c6ea9ea4d410774a8e6e725ae4bc0f410620053b2b87cf5a6968693ffeeb8b917b7ed4d44214084f687123332caddafa964bdbd20a20a2176c307ed49fcdc03c3b0fada84207500e2c20f1dbae0c3851eff5e7c3f142001d54c2e99b927aaab82561923775f31341c981a420c600a58a9da25d73a626ebbe9ed0204ecaff3dff56665a7e72a26de871366cede1de7e7a882406d5fe061030e1b7618296dd0910d093a101b5a4c3ae156ae2e317f0b980e420c600a2e5f597e2846d704ada27504217195147f910b3d5745b11752ec554f684fd03137245187ef430e53b86a0e1b2c155c63101a77bd1199bdc5e0c916a9d9d87af9e286009838420c60c258a9da095a47e02d575171417eb64185b141c5cce5ba92427a422545c85c8851d401c768cbb5ab8c241bfe5fc533ae41f01a2d26ed62c827301d8418c0845d5e5a796abff4052d60eb08fc415881860d37c4861bb2e5aa370837e0235a4c5a33706bdd05c04411620013c44ad5f6d03a82aeecb681cccaa82f59f61b7bd2d617c20a7c5c55b961d4061c65f9632959f13f389d45c79a2d26ebaafa8d606a4a53def80373ba808922c400268895aa6d3043357a83f24cb4c105163b329b6752e6757545d9e7e41213d4546d94df116ca02b751beccc53ae6d53e3867c7ecea10b30398418c0842c5e59b9634f64d70553637f7fef8aecdce74600d352b784fca5af5976b9a9b0c80568970d364c5196e6bb91cc14b4a2a02d79beb2cee0cfe960e52a30598418c00434c33c378572f26971833b6fb0aa0c93b4576591c957fb020bdec3f04ddd8a62e4bbd25e0bd98e82696aee675c5b6c5f3049ac5c0526881003980056aa4e0b833b31392eb4b027db7dcdf42baa2c1038375f63604af3dd8c8c06841a9834067f4e05433e810921c400ce8995aa5343f505cea50e2db2d5ba35c4ac72338e88352d28f2ad0d350aae9b9804067f4e1e2b5781c920c400ce89619e9346f505ce665f7bc8d7545a207155a5860b35683fc17951953151c5d6e6f32501702e8418c039b05275e2a8bec0a97c91aff4f7cdb4e80b80a30c8c29bf65030ace8aaa8cc931466ebfe2a0063817420ce08cdca9afd10b9b54614c02d51718cf6e8b4896cd7c25558b08833881d3d161dd7a527e3b23e580d018a74155c644b072153827420ce08c58a93a31545fe0a3a8b600a66ae0369fec883e619d2bc64155c6f91995fbaf5e3ebf2d00ce841003380386794e02d51738daa1d9166b42b505d01257a55156b334fe50bc7822c0475095713e4d35c650009c1a21067006ac543d37aa2f70c0fb3691ec6ba92b2e082e806ebd936a3868d576f284d2771ca53ad4c966efd9ebf6aae0b458b90a9c112106704aaeb47d46e5a9e00ca8bec07b2eb828255b53b5c1056d2280ef06a5291f31470347c9f32bb78c66778400fa5458b90a9c0d2106704aac543db342cdce756e7ed3467001448140031fa85b6d679ed25e721a3adcda7cf6b9003815420ce01458a97a366acc83a278714b9024820b206a041a3820cf57d68dca1dc1588c91bbaf8ae7eb02606c8418c098ea13860b4fa9c2380d3354a33728954ccfde8c0bcddcf4fabe00889fca136668c0a12ae35458b90a9c122106302686799e92314f544637f8504e4b353326d36fecebef86bcd11b0da4e99da879322af5d1ff20c44e565d8537739f55ac2763e52a703a8418c01858a97a1a0cef4c8d0b2eb24cbe5223ae6588e002c03ef5da562d477769374953bd8a35bb277c3e7c14433e81f111620063a00a636c0cef4c04732e009c41519af201f333d2437bc95858b90a8c8910033801c33cc7e386778a8cd6691f895bdd2e2237c554c105a76a00ce46cd06ed26e961e8e7c7d97b297b10f4e28900f828420ce004ac543d896b1f911b7ce8c6abaabac8666fd22e0260f274686ca091953b8fa8ce48439e2fafda20e31e551947d1a19a9f973810023e8e1003f888c5e5ab37b534cc7638de40cdce0d6e3ce354555dd427667d018069abb69b98477f20148f5e336bcc55b9f60507b0721538192106700c56aa7e9c6b1f298a17b70451a1ea0240f774589ad15d6667c48ff69223b995ab4bfcec03c723c4008ec130cfe354db47ae33413b2eccba00e025666744cf06197da3e621ed25fbd89ffbad972f6e0880231162004760a5eab1d83e1211368c0008475d9df187e2e586203acd7dd763f7ada0c2ca55e0788418c0112e2fad6c0a1fa407d03e120f5a460084ab1a04fa242b771e10a8c787f6920358b90a1c831003388495aa87b9f691ec76513cdb1004ad6e1931dfd02605200a6a36b41cdd25cc884b6eefc38c66f784905d4a53dea0fa08f810210670082b55f7334335a36bdc20868d2d23002237b00f7b8f78d88b47dd5e32f3943919d590cfcf59b90a1c342300f62c5e59b96393bd5581dbf1f54465f4bfd90fce6d41705ccbc867f397fee3fcc2affe4ba6f28ff6977a020071eaa9eaaabddead7d363fffd3ffdc7e530882b6bdbdfd6e61fee22323ba605fdb94db7b3f3192fdf9edf6eb8100d8432506d06098e77b6ae46ec18ef22031ef020058d11a13e664b07215388c100368b052d5617d6aa8082f00e0308680c68235ac0cf904f623c400acdfe657f30b6a362569ccbf0811e105008c8121a0c14b7d4e062b5781f732012017541e4bc2d4984736c0a0543120ee66ce550fb916287b63b32e041800703ca36bee7ae9ae9beefa29088ebb4771f72ac698079220a3724f0054a8c440f2525fa9cafc8bb0542751d9cc1d5a9f00e01ca8cc085aaa73328c91dbaf8ae7f705481c2106925697265e789ae64a5537ff22bb5d14cf3604de23bc00802920cc08569e2faf1a557708955225222b5701a19d04892bb3d96f120d309af9170418bedbdf364280010013469b49b08ae2c513b7b5c3ddd3483adc1cac9437b500152a3190ac8457aa16f643ff3aa74e7edb37b0735d0000eda0322338cdfd9c9b6d964b22d4e8923d882a04481421069295e24a5537c05364748b32447fb16d0400ba6754eeb39a352c8bf9f27d55bd296960e52a92468881247d992faf66aa496d246180a7df082f00c0373a346a365ebd7c7e57108494067eb272152923c440922e2f5dfd219d59180cf0f4dde2f2d59b5a9a7521bc00000fe9b034a3bb7f285e6e08bc97cec04f1daaf97989ea5aa4881003c9496ba56a35c0d3cdbfa06fd2435fe42bfd99ea462bc5e1b200101ac28c50d47332669edad7ac27113346eebea2ca160922c44052d25aa9babb81847e5edfd4e14555eeda17004060b4b027e00cc8f65c2241062b57912456ac2229269bb993c8a9b7bdc11a2d7183e597665dea631b60d89b2a020c000893c959cbea3f770fe4ee85ec91ed1389d79cbdb7bd274062a8c440325259a9ea369014c58b35813718da0900f1322aeb59b9f38883037fc5beb984219f48cd8c0089b878e9d76e0ec65f4bc4ea0d242f6e09bce186768a644f6c62fc7bfb879f0800202aea2aeb7466f5b3f9f99ffee7f61b665079e8edf69b7f5d98bfa4f6c5ea4b8c547a6fb75f3f12201154622009290cf3b401c66d9bc2df177881b917009022b73142ae17c533c20c0fe5f9955b46b328db2f4a53de60e82c5241888124c4bd529515aa3ea9da96dcec15a36b020048939a0d2d47776931f14fbc2b5859b98a74d04e82e82d5e59b963d3ba5589920b30dc069297ff2ae89cfb5913c936ec8dc4ef04009030cd45b3b58b972e7df2f6cdebef04ded8de7ef3ef0bf3bffaef3668fabd7d9d620a32e68c647f7ebbfd7a2040e4a8c440d4e25ea9ca0a555fd4ad23ee542789cd37008053d16169cadb7f285ec4bc25233891ae60752b57d94e87e8b16215518b77a52a01860f0eae4c25c000001cc5f432d5c7ac64f54bb382f59abba79278cc996c9695ab881e95188856c42b550b9bb25f27c0e896db3aa2a5591756a60200c6a64363cc83570ce2f6865b836eef179fba6f2512ac5c45ec083110adcb4b2b9b12d1075263d004180c6dea085b470000e7570d61a4a2d213559091cd3e1413cd0cb5c1d6e6f36b02448a1003518a71a5aa1af3a8285eac093ae16e70ca6cf68e3dddb82500004c8051b99f953b77399cf0c3e2d2f2868a7e231130466e53f18358b19d04515a58f8f56389a8ccdf06180f6c80f11f059d70d517aa33ffbb4d7d7f2f00004c88fd5cf99de8ccdf7d363fffd3ffdc7e53083af576fbcd9385f94b36c708bfda52557eb730ffd93f6f6f6fff4980c81062203ab1ad54b527fff684e6c53f0a5ae7aa2f2e5efad5ff2f13fd2761f60500603ae6547575fed2426fe1e2c52dfbd049554687b6b75f0f2209323e61e52a62458881a8d453bfb3685698d501c6f37541ebdce0cefa6749639bab0200f092fdbcd19955aa32ba174b90a1f6df7f61feb3470463880d2106a2624fcdefc5f2d04980d10d17845d5cf8f563fbfbefda773e110000da43558627a2a9c8d02c7fbbfdfa91001121c440347e9b5fcded0ff47f9508106074a3a9bef817fbed5f0b00009da12ac307759031ff93a8863c13ab67c398efecff97a10091603b09a27179e9ea0f22a62781b301c6ed8269d2ad72d5174667dd369bbe0000e013351b5a8eeeb28eb53b797e65cd04bdf54e875b9bcf3e1720125462200a6ea5aaaaae49e0d4e80d1b6044514d120aaa2f00007ea32aa36bdbf6f77d617efe47510d7570fcdcc5f94b3fbddd7efdbd0011a01203c1ab4fd12f3c0dbd0aa30e309e6d085ae1368f189d75ab78fb02004008a8cae854e01519efd4ec7c6e7f7698b382e0650204aecc666f1260e034becc97576d80f18310600000426274cd1ddcb80a5441eb8ae2e5869af2868469cede33df11200254622068cd2c831f24600418ed71d517ee035c8ddc12000042565765dce664bd7d4d45c63dfbed9c04c6de772ed9fb4eda9210342a31103493cd049d281360b4e78b7ca56f4faf360930000051a8ab3236dd818ea0557545865eb3df0617201935f704081c2106825595529a7087791260b467f1cacabd1995e0e7a600007090a92a52ede71c6d022d73d50cf660e4ba84a79fdb831d0102463b098215f24a55028c76b03a1500900e1daaf9f91a433fdb15e6b0cfea6765895624848a4a0c04a91e68458081e32d2effcd3736c0d814020c0040124c8fa19fed0b73d8a7e995324b7b2d824525068213f24a55028ce963782700207546e57e56eedce5a4bd3d015664b07215c1a21203c1a987791260e04336c0c819de0900489dfb1c64e867bb02acc898b3f7d40cf9449066040848fd613cb32181b13713f634e4f97dc1d42c2e5fbd6973d90dfbedbc00008039d1ecd6c5f94b3fbddd7efdbd60eab6b7df140bf3f33f8aeaaa0441f385f94bdf6d6fbf1e0a1010420c04e5e2c2af1fdb2f3d09481360ac0ba6c2b58f5cbcf4abff627f9fffd1fee127020000f6a8caefe72f2df4162e5eb40fabdb7f124c551364fc647fe37f2f2150e9d990eb91000121c44030dca02a550daa4d800063ba9af928ff8730bc1300808fd05c74e6ef16e63ffbd60619cc4098321b647cbf307f496d40d017fff53e9b9ffff17fdaf0458040106220180b7515c69c04820063ba9af6917f11da47000018876b2f59bb387fe9cfb4974cdff6f6eb412841866a96db80eb11953a0805210682b07865e58e8a04d25f4880314dae7de4b34bbffeffdadfe375a17d040080d3f8c4b5975cbc7469eeed9bd7ff5d3055010519734632176e0d0408002b56e1bdba6560765302a9c250631e15c58b35c1c435ed238f454c2e0000e01c74a8e6e76b45510c0553b5982fdf57d59be237b77275899f07848015abf05ebd52950023755fe42bfd3acc22c00000e0fc8c3b18789ae7cbc154ba86ea55f1e29611e3fbf0cc397b9ff55080001062c06bd54a55a36b1286426414d4e0d150b876a21995a712d04c140000fce7820c7dec3e670553f56ab33ae41a88dffab93d3412c0738418f09a3b21902098a19a1d5792c9c4ef0972f32f2e5f597ed8ccbf00000053e03e67dde7adfbdc154c8dbd57bc2ed5a197bf8c0a8116bc4788016fb995aaee8440bce7028c1101c68435f32f3603aac40100205cf6f3d67dee5655b0980a77af5807196628feea2fe62b5416c36b0cf68497dc4940f500eb7d88b117600c0513e3e65fcca804b55217008038b8819fe646513c1f08a6a23ea899796a7faf7be22717b67cce011d7c452506bc5466b337030830de11604cdee2f2d59bccbf0000a02b6e4e863c654ec6f4b87b47770f69bff53524982b65966a0c788b4a0c78a759a9fa83784e8d5ce39462b2ec0dd33dfbfbca872600001eb061c6fd572f9fdf164c459e5fcd8d1a6f0f6e9a6a8ca1009ea11203de6956aa7acd3e68df26c0989c6a80e7d2ca53020c0000fce13e97ede7337332a6a4289e156a4a6f432256aec257330278c4cd42c844ef8bc7ec07fa5d1b60fc9360229a019eff87fb560000806fe645675617e63ffb767b7b9b190913b6bdfda65898bfa4a2d217fff4ecbfdb77dbdbaf870278844a0c786546d5ebc4b70930d60513e1422b9bf20730c015008094b93919b39bb9fddc164c9cbbb774f798e221e3f9bd39d2442506bce156aaaa7abc4ed398275bc58b7f104c841be06953d47fb1df7e220000c0779f88cadac54b97e4ed9bd7df09266a7bfbf5e0e2c2c2e72aea5b65eadcc5f94bfad6fefb09e0092a31e005d75290a9cfb330cc5065744330116ee2b996c6ebb6210000f02135b2cee692e9c8ccc8cd062bc433aa72d3cd2f13c0138418f082df2b55cdb059a54a1fe83955033caf2c3f74374002000082e43ec7dde7390fb693e5ee35d5ec5c73f79ee297397baf4e70056fb062159df37ba5aab11f26a325d64b9d5f33c0f3b1fd3d65802700007128ec43f775ee9326abb937de14cf56afdaf0ea1adbf9e0032a31d0399f57aaaa513e9827a009309e126000001095dc7dbeb38275b2dcbda7bd07bd269e312a5463c00b8418e8941be669af886be2219b36df266d3e3f7b63933701464f000040644c8f2063f28ae259a1a6f46d1e5b3fcf975705e818db49d0a985855f3f16cf4ae59c6695ea3f09cec5ad5055cdfe77713be6010040ace644b3b585f985ff7b7bfbcdbf0b26c2fe5e160bf3975454fae20bcd7eb730ffd9a3ededed3f09d011420c74c6add85463fe4e7cc32ad589585cfe9b6f32314f8415aa0000a4e01351fdbb8bf3977e7abbfdfa7bc14478b87a75ce48f66756aea24bb493a013aee4504bb925de6195ea24d42b54cb0d0100004951957bac609d2cdf56af362b577b02748410039da88779fa36238155aa93500518ac5005002059ee3e802063729ad5abd73d5abd3ae7f3607ec48f15ab689daf2b55ed87835ba5ea4dca1d227bc372cfdeb8785861030000da6654eebf7af9fcb66022f2fc6a6ed43c154fe6c9b172155da11203adb301c643f14cbd898400e33c2e5f597e488001000076b9fb02777f20988866638937a1102b57d1152a31d02ab75235d3ccab0fb36613c9bae04cf23c9fb3c194db32d3170000800f0d5c3b042dbb93b1982fdf57d59be281d29437fe50bcdc10a045841868d5e5a5ab3f78360ba3d8da7cbe2438933ac0b8f0d4bea6be4ccc0600007e2a6c90c1ecb109b9bcb4e2da4afad23d37afe3735e57b4897612b4a61ef0e45380e10679ba2149388b7ab60901060000184b6e74f6295b2d26c3a3419f73a5ccd24e8c565189815634c33c37c59341444e931a0f05a7b62fc0e8090000c0d8d41e22fd7c8d7bb0f3f3e8fefa5d33207f28400ba8c4402b9a354c1e0518d520cfa1e0d408300000c0d999ea3e828a8cf373f7b29e0cfa9cf371703fe2452506a6ceb795aa0cf23c3b020c0000301954644c8a2f833e59b98ab6508981a9ab1f7abd5110609c0d01060000981c2a3226e555f1c2cda41848c78cca3d015a402506a6caaf95aa6e90e788c4ff0c08308054b82171facede1d545f4d59fee4be66520eeb3f9f355fed5f23337b93e88be2fbe1387ff73cff5deffd1f8de6ec3faf69332cab5f2f25abbe6aa6bf11b37bbd715fb52700224545c624d41be36636bbbe5e1a23b75f15cfef0b30458418989a66fde6a62f0fbecdc0a142702a0418402ccc3bf7b020aa850b27b23ab018d6c1c4cf43dfd7e3b9cf14910bbd3af828f352b457871dd26b820e6fe62e01382d828c49c8f3abb951b329dd62e52aa68e100353e356aaaa9175f1007330ce8600030851155614c698ad3aa8c86c783b3b1cb75a225475c8319bef051caa97eb15d0841b401808322621cfafdc329a75dad66154eebf7af9dc8781a388142106a6c2ab619ec66c6c152f6e084e85000308810d29341b6839daaaab2a46034ebf0eda1f6e982cfbaaaedc905c0078882063121697963754f41be950538d3114600a0831301597af2c3fb431ec9a748e391867418001f8a8aeb05023df4935c06da720b0389bdd60a314e9abca57546c003e21c8382f4fe6630cb6369f5f13600a083130715fe6cbab99ea63f10029f0e9116000beb0a185664fea2a8b9941513c63a6cf14b95e729151bfaed6a8428d9e00e80841c6793555d16e3e4667012d2b57312d841898b8cb4b577ff0e101d85e386f174c473e15020ca04bbb9516e5b78416dddb0b3534fb9a4a0da00b0419e7d5fd7c0c1d6e6d3efb5c800923c4c04479b352953918a746800174c10c8d916f33d127b487f82dcf57faa5985555f99a2a0da02d0419e7b5982fdf57d59bd211fb1977f715c3f53161841898187f1e82ab39184b3c0c8caf5987fbb43e6d04306583badae2174f62df18122bf7792792add6551ad21700d354a8d9b9c67dddd978301f8395ab9838420c4c8c2fc33c9983713a0418402b9ae0a2dce0462e2e4da0e1da4edc2680be009806828c73e87a3e062b573169841898085f56aaaa91bb05256ba7727969c50618dc78035340709118020d60aad876710e5dcfc760c827268910031371f9caca6331b22a5d620ec6a9f9b30a1788c6a05e81ba739fe0226def030dbdc30c0d6042d4deebbde45eefac1697963754f41be906211426861003e7e6c730cf6a0e06839f4e61f1caca3dfbb0754b009c9379678c3c72c3393965c251dca69352ca5baaf2158106703eb4269c5dd7f331d498eb45f1e28900e744888173f361a52a256aa763038c3bf6f76c5d009cc7c0de903d10190da8bac0b8721bfcd36e029c8f0d32d66d907157706a6ed392fdfd7b2a9da8b6cd307c1fe73623c039540fc3d26d1b49330763433016020ce03caaaa8b7fce24fb87ade2f97fdede7ef3efdbdbdb7f12604cf667a678bbfdfad1c2fc678f8ce8a7aa6ed09e76326c0f0895bdf7ec5fbc7449debe79fd9de054b6b75f0f17e6e77f12d5df4bfbe68c647fb6d7c08100e7402506cecc8f95aa66b8b5f9e273c1581697afded4d2dc1700a755a8291f31a41393e6cabbeb75adccce004e4b4db65614ffe723c1a97538d8ddad5c5da2051ce741888133eb7e28a4b117c11117c1317d992faf66aa8f05c0690c9a6aaf810053d69479db30835613605cb4149f4da76b57559e6cbd7c7e5d803322c4c099f8b052d59e8ade288a971b821375bd1f1c088e316e82fb236e8cd10577cd2e65665db5b32d024048eca196da20e359213895dc1e70998e0eb8089f701e84183893cb4b2bee813897aeb04e756c7eb4fd002170d55dfa80f5a8f005610630ae6a60245beace60315fbe6faf3137a57dac5cc5991162e0d4ba5fa9ca3ad571116000e320bc80df0833807110649c45976b578d91dbaf8ae7cc6ac3a91162e0d4ba5ea9ca8ee9f1d41f4a5580d15dc50ce035c20b848530033851a166e71ad7f4d3e970edaa1bf2f939af174e8b15ab3895ae57aada00e3810d30486cc770f1d2affe8bfdd2c5fa2cc0735578f19f55467f5f142fff9515a90885fd597df776fbcd93f7eb5995901a38685e329d7ffbe6cdb782b1b9b5ab17e717dc35e577d2ae4f58b98ab3a0120363eb7e9867d546b2445a7bb22a6c32b22e000eaa06768eee526e8c185099011ccda8acbf7af9fcae606c1db695b07215a79609302693cddc910e35733008304e4080011c69e06e92dc40606e94100bf7b3fcaa78b1e6cab18d318f0440c5dd072de62bb7046373f7d86ab22ed69edaf064b6c3597b0811951818cb6ff3abf905359bd211fb61644f4e9faf0b3eea8b7ca53fd34d4f23e0ab4173fd180810b97a5da2dceb62401fe023d6789e9e0d7fd655a5f5834b5e2b9c062106c6d2ed304f33dcda7cf1b9e0a39a761f1734cd0990bc6aee850b2f98a183e4e4f99535a37a873003a055e12c2e2fadb8fbc9b667ee145b9bcf97041803ed2438915ba9daed3692113ba44ff07e952a0106e00600dbebc6e70418485551bcdc709f9dc6be1704485bb5a9cdcd7b108ccd063faeada4ed16ee9c16208c8b4a0c7cd4fb87e36e420cda48c67379e9ea26ab54816aeec56d7be25608804a53a5f758da3f55057c32b0a7fc1c8a9d429e5fb96534bb27ed62e52ac6c28a557cd467977e7db3bb95aa66b855bce862c0505016afacdceb72ed2dd0bdaa75e43f6d15cfff61db12007beab5acafff79617efe477b7465830ce5441a29ea5dbc7469eeed9bd7ff5d3096eded37dfcf2f5ceadb6f7bd29e4f4c967dc2eb84931062e058eef446247b221d71eb54ddcd97e058cd26927f14205155eb888cae17c5cb810038967d202916e62f7e6b443f5555aa32901c7be0f3bb8bf3977eb2a1def782b12cccff6acbfec6fd4769917b9dec3ff7dbededd71c4ae058841838d6c54bbf7213ce3bb9d1a9db485e7616a084c06d22c9443604489219aa511b5ebcf8af36ecfc930038515d95f1e6c9c2fca5efec076d9faa0ca446557eef7efeed03f25070221724d8e0c7e69ed29736a9fcb50d9b581b8d6331130347fa325f5ecd541f4b27d8467292ae6795005dd26a58e1689d9e59e0ecea4187b3b74c07ab14818eb1b1e494bad856c2ca557c0c21068ed4e54a557bba6a3f589e3198ef18eec6d306189b0418484f557d71839b1a6072ea507ce629eb589116b59f273f2f11868f27cf57fa36f07c2aade235c2f158b18a0f74b952d59db012607c9cc966ee11602035cddad425020c60b2dc69b47b6fb18e156931bdfa7e0ae3709fbded5f234caf945956aee2485462e0806edb14dc29ebe81ae57dc76b0679ae0b900caa2f80b6d4a7ade6215519488551597ff5f2f95dc189ea4ae099cd96af0fac5cc591a8c4c0013695bed36115c65d028ce3b939250418488a314fa8be00dae3de6bee30c19eb832500f4970f7552ebc139cc80509ee5041da3547c50c8e422506f6d45518b33f48178cd9d82a5eb47d610c06833c9116e36e946ca8f9fcbe00e8449e5fb9653473433fd96082d831e8f31416f3e50d55fd465ac4904f1c462506f6986cb6a3a4d30c554694f27d040106d251b5952d116000dd2a8a97f7dd839d7b4f0a10b7397b88f7b8ded88393643272732a5a6def608b120e23c440a51ae66964553a604f5c1f907e1f6ff1ca0a833c9184f7c33bb91e003e60e827129297d92c0fca63a8db4acab60f1ffbf5e201a0463b092addad5435c3adcd179f0b8eb4b87cf5a696861369448ef611c077b4972005c6c8ed577c168de5f2d28a5bb9da97d6b07215ef5189816ae34577c33c47d704477273306c80b12e40d476b71271d308f88cf612a44055eeb8fb2fc189ecf5a0e55976ac5cc57b841889ab1e948dae49075ce93865e347abd758b939189c7821627bdb478a420078af692fb9262a4f04885375ffc57c8c93b9eb8131d26a5b890d996e1232c121c4485c772b55dd49ce8893d763d4eba498838178a9bdf1d92a5e5ca72c14088b7b70d97af9fcbab6fcf002b4c7f458eb399e4c76eeb75c9d35d7dd2202f8644690ac3ac99cd9900ea831b78b627320f8403507c3c83f0a102537ff22fb07da4780b06d6fbf1e2ccccfff688f46fbf60f3f11202a9a5f9cbff4d3dbedd7df0b8eb5bdbdfda785f95f6d89ca9ab4e7af17e62f7d67af414341b2a8c448985b27255d507952142f37041f68e660f0708748edcebf78b6210082e73ecb99938158d5f331aee6828fb2871203fb65202d62e52a083112d5ac29eae4c2ace5ce6dc107f6cdc1006254d40106f32f8098eccdc920c8407cec7d993c663ec6c99a219f6db687f617f315867c268c10235199ce749260ba1e5a86791eadde4fce1c0cc4478d79646f70aef1de07e2d404194b0cfc447c4cafbe3fc3c734433e1f488b9a4d32044c8962264682dc4a55155995d699a1cae886eb9f131ce02a6332d17f1220327570f9e216ef7b206eee3dfef6cdebffb6307f496d98d1172012f69ef9770bf3bf1e6e6fff3f5b82632dcc7f56d864e1efecef585bc1c22746b23fbfdd7e3d10244705497133178ccefe201d5053de6016c687ead7c4b591508581b8d401c6f3750190943c5f59a7671d9179e7e6bf5051f871f6bddfb7effd565ba3edebf239af4b7a6827494cbd52b5130501c6d108301023357a83000348937befbb830b01e231670f011f0a3eaa9b219fbc2e2922c448c86fdd8465a36bd2019b925e177cc0b5f61060202e6e85aab08104485cbdb944ae49bbc3fe8069eadbfbb67b828f6a867cb6a9ef2a40044921c448c805956e56aa1ab34199d787aa75aa46d60588860b30dc0692ea240640e2dcb5408db2b904d1b0f76db77860feb87ac8a76975c8a751a51a2331841889a857aa7671e25f0df3bc2b388075aa888fa9b613b04215c07e45f1ac60052b62e21e98d98af171998cd6a5d52a2cd363e56a5a083112e04efcbb5ba9aa8fa8c2f890c966eed14682785401062b54011ca959c14a908148b076f524f63dff4e4dd9ea21262b57d3428891007ba1bdd955150683fd3e5455c574349b04983c020c002723c8404ceab692e555c1b18ae2e5fd96dfef73844be920c4885c3377a193f22a3586369243baac8a01268f0003c0f808321013da4a4ee63695498bea70e96a2e881e2146e43a5ca93a60a5ea87ead7833612c4800003c0e9116420226eed6a3743f303d1cdca55c3069904106244accbb6850ed62b798f3612c4830003c0d9116420227d064a7e9c1abd2ded62e56a02083122d659db022b553f401b09e2418001e0fc0832108b66a0644f7024b7a1a88b95abb4fac48d1023528bcb573b1ae6692fe6ac54fd006d248803010680c921c840245c5bc943c1b1ba58b95aca2c15321123c4885035ccb3ec6c98e7031e700ea28d047120c0003079ef838c361f708089a3ade423dcca5563a4d56a0c55b9493546bc083122d4dda9bf3b4919dd17eca18d047130efec43c675020c00d35007194a9081a0d156f27199ecb8678436dfe373f69988219f9122c4884c75f1ec6c98a7528571086d2488817d6fbb00a310009812d737af46ae0b102eda4a3ec25563a829db6d39b7cf440cf98c13214664babb789a61513ca70a631fda481003b7e3bd5991060053e5ae35f62187ed6608196d251f51142fefb73d03c7a850111d21428c88540fcdf6e2291d506318e6b90f6d2488813d15bd6b4f473704005a621f7236dcb5478040356d25cc6238867d7fb7be72b579464244083122d2dd43b3abc278b921d8431b0942570718cfd705005ae6ae3d041908d89cc9682b394e51bc7862bf0ca4459966f70896e242881189c52b2b9d3d34538571106d24089e314f08300074c95d838c98470284c8c82ab3188ed7414839c7cad5b8106244a05aa96aa4a337265518fbb99497361284cd0c5546f4a403e85c6646eede86a1c20892517dc8e9ffd19a595b036951b372b5278802214604ead605e9e422d9415f9bd7ca6c96361204cc06186674cd4d101700e858bdcd60e77adb830081c930bdfabe1047e9a21a83ed31f15041d05ca268df903f4837065b9bcfaf092a1dbf16c03919fbb0305a624d3200dfe4f9d5dca8792a1d1dd800e7611fd6afb1e5eb68979756dcfbba2f2de2f58803951881337ae1a97484a15b0775f95a00e7a5c6dc26c000e0a3a27856a829a9fc449058f179bc2e9e25783de2302308961b20a9dad900c9c156f19c10a3b1b87cf5a67d08fc3b0102546f2279715f00c053dbdb6f8a85f94b2adacd2a79e01c7a17e72ffdf476fbf5f78203b6b75f0fe7172ef5edb73d690faf4704682709941b14644ffe37bbdb48b2f339a7b6b5ba8dc45561300b030132e6c956f1e2ba0040002e5f5979ec363f08101637df8596cd23b82d2e46a5ed6ae677cdb30c33c002453b49a0ca6cf666670fcdc66c70117eaf1eac4a808110559b4828d106100c2d776e30e813019a33d9ec3dc107bad854226ee52a435783468811a066a5eaba74c43ef4d046d2f8325f5e15d3594b0f700ed520cf6b04920042526f2cc95cf51827a8088b9155577520f84017b331ec3ff3162b57c3458811a066a56a47ff70aa30f6cb3423554790d4e85ddecb0042d40cfae44005c131aaacf83c4247d518c2cad570116204e60b97e07678f24f15c67b8b575668234190d49807f68681419e008255142fef1b7b2d132028a6b798afac0b3ed0d1d6c33ed5316122c408cc4cb709ee8093db5ad3d2734b80e0b85ef2d1ba0040e0b2ea5ac67c0c8445556ed2c6f0a1eeaa31a88e0911214640dc4ad52e4ffe3b4a48bdd4b4f4cc091094bd3918f49203085e3d1f63744d988f81b0cc75da1aeeb16e9e35a88e09112b5603e1c11acfc1d6e6f36b02f96d7e35bfa0665380c0d89b83dbb49100884d9e5fb965985185c0d8cfe46b4df501f6b9bcb4e2d6adf6a55dac5c0d0c951881e874a5aa5085b1df0595c70284a61aca4b8001203e6e3e863d967b2240408c0ad51847e8e8998395ab8121c4088007f3170624c5b5ae5b7a80b3314386f2028899963b37988f81c0f417f315e6ab1dd2d56c8c7ae52a433e4341881180aefbe6d4948f04559894293d8c088f1abdc1505e0031abe763e80d0102a22a77ecfd2533d60ee9aa029cea9870106278ae3af9ef70a5aa3bd5288a971b02d7d2f30d5518084db34e752000103977ad63ed2a023357ca2cd5188774558d21d5cad5e55581f708313cd7f5c9bf7d00a2045df65a7ad605080aeb5401a485b5ab080d2b578fd65d3546768fea18ff1162786c71f9eacd6e4ffea9c2d8c52a2c848875aa0052435b09023467b259b6eb1cd2546314d23ad3a33ac67f84189eaa4efecb4e87795285d1a8d2f14e5b7a80d3732718ccc1009022da4a101c23ab0c95fc909ab293f731d531fe23c4f0547df24f15860f8cceb252158171a5d43bac5305902cda4a101a864a7ea87916e9a2a2748e2a6cbf116278c887937f35ca4612d95da92ab9000169b691d046022059b49520407daa313e648c745355659fc5783dfc4588e1217bf2ff503ab7b321e87cb02a706ac66cb08d0400682b41788caa07cf007ec9eacad24e0e66a88ef1172186679a93ffbe74a97a08a297be7e2d58a98a9098a1ca88593600d0a8db4a84ca3404c2f416f315864aeee3aaaa3aabc6b0cf64cdb3193c4388e1191f4efe7908aa518581d0b861bc049000f05edd5652725f8360a83dfd67c5e741598773be3256ae7a8910c3238b5756ee747ef24f1546c58bd702389d8261bc00f0217b6d740f400301c230c78acf83aa395fc63c916ef07a788810c313d54a5523ebd23115067ad6af052b551116353bd705007024fbb97e5b8040342b3e39fddfc73ea37436df8695abfe21c4f0841f6b7cdc5a55060296d9ec4daa30101235e60115540070bca2785630e41301e1f4ff90e6196520dd98f363f10276116278c08795aa8eeba797c43515317c682020662832eaac57140042c1904f84846a8c0fd97bf42e9f555881eb11420c0f18bdf0543ae7aa30e8a7f7a32206181fc33c01603c0cf94460a8c638a4a9c6e82c88342af7045e20c4e8982f6b3cd568f22596be54c400e3237c0480d360c82742d26c2ae909f674b86ed5c95981eb07428c0eb912317fd678ee7435f1d71b546120346a84417500704a1d97a403a7c2fde941cdbad5ceaa315881eb07428c0e79334092b5aa5461203cd5fbf645f2e123009c56c7030281d3b1f7a75463bce7dac28c315d6e539cb3cf70044b1d23c4e8882f2b551dd6aa9272233c2a234e1201e08c58b98a90709f7a5026dae9218e5b0240b0d42d428c8e7874312a525fab4a15068243f514009c4bb37235f9431c04826a8c037ca8a662e56ab708313af065bebceacb43b39a32f9819ea4db080d551800707eac5c4548b85f3dc883d936ac5ced1021460732cd3c59cfc36603aa30101caa30006022dcb5b4e34d07c0f8a8c638a0eb75ab8e51a51aa32384182df365a56ac530d48a541ba1a10a030026a7eb4d07c06970df7a50f721a4e92de62beb82d61162b4c8a5a7feac54e561882a0c04872a0c0098a87ad301d5180884d155d67bbed784909d52959bbc26ed23c468519d9e7a5285213248fd6188341ba1a10a0300268f6a0c0464ae94d95b828a0b21a5fb75c9ac5ced0021464b7c3bf55753263d919b2a0c04872a0c00980aaa3110124efe0ff260c067b37295219f6d22c46889c9663d19e6e930d0d326a637050808551800303d546320205463ece3c3804fc7a8508dd122428c1654c33c8dac8a2f121fe8e9aa30d4a83faf077012aa300060aaa8c64048a8c638c893f76e3fcf9779be680921460b7c1ae6e9a47ea23b92acefd16c12e044546100c0f4f93024101813d518fbf8f2de359add235c6a0721c6942d5e59f16998a793fc404fdf4225e0a3a8c2008056d4d51826e999610807d518ef7932e053dc331fe1523b0831a6a8695b58138fa43ed0b36aeda10a0301a10a0300da93896e081006578db126a8f830e0d369c2a59e60aa0831a6c8b395aac2404faa30109ce42ba700a04dcd90c081000150d56f04155f067c5a737e2d74881321c69478b9c233f1819e54612034be9c2a00404ab8f6221c2667b5e77bde0ce735b2caeb325d8418536274f6b17846254b7aea76a619693502e22aa7aa530500408b9a6b6f21400058edf95e263b4fc413bc2ed345883105f589bfe4e215f740f42cd90fe4a637ad2f4020d4184e0201a023f64497019f08459f53ff5a61893fed60fdc57c85219f53428831053ece5d48fd81a89e4f0284c20c454a6f4e13002035f6447743fce8af074e643243b571c30690df8a2754e50e1b64a6831063c23c5ca9da280792282fe793001f63aa819edc3c03404758b78aa0d8fb5c1e966b9e059073ac5c9d0e428c09aa57aacaba78c62592296f3828b3d99b020484b5aa00d0bd4c461b02048287e55a7308e44d0b7d538dd1134c1421c604f9dab290255e96ae46570508076b5501c0039ef5d7031f651f966f528d51f36dc390d1d987828922c49890dfe657734f5b16de15c5cb0d49146b55111a3525e5cb00e0093526e9cd6e088a6b5d5813ec6e18f2a92d97e1ab13468831211754bc5ba95a3126e92a0c1f87ac02c7735b84d20d1d01c03fa38130e013815095af0515df66da1855aa3126881063027c3eed57d1644f75bfa8124faa30101043d93200f884019f080c27fe8d4cd4b3835cd363e5eae410629c931bd4e2ef69bf3bd5adcaa99234c3ba29044625a36c19003ce3dfc310703c930903ed65b7a5c4adacf7072b57278710e39cca6cf61b6f4ffb133ed565ad2ac2e342c767de4cd30600d49a03a181002130ae1a830765c718ef2ad2e7ecb323adee134088710ebeae54dd95f2a9ee48b2be0001516358ab0a009e3246be13200c73ac5bad65b2b3219eb1cf8eb772b71002e74288710ebeae54ada57daacb404f84a71c0800c04bf661e8be008170eb5605d2acac1f88678c9a7b827321c438a32ff3e5559fdb158cd164ab30aad786819e08cba0f9a0050078c80df8145a4a108e39067cd63cada26200eb3911629c51a699d7099a3d31487608559609033d1114352593ef01c073f661e85b01026154a84a167faba8dcca5566979c1d21c619f8bc52b551a47aaadb0cf45c152028b4920080ef7cecaf073e82019fe2731595e931bbe4ec08314ec9ef95aa357b5290eca9aebd18ac0910165a49002000b49420343c24d77cada272b34b089ace8610e394ea619e7ecf5b48b9954455692541506825018070d052829030e0b3e67115d59c7db664c8e71910629c42d3aab0267e4bb695e48b6a400e033d111a5a49002014b49420300cf814cfaba8ecb325afd1e911629c82c966bd4fca526e2599c90c5518080dad240010105a4a101a93518de1f85c45c510d6d323c4185335ccd388f70323536d2509a44a063880b26400080fd76e04c530e0d3f1bc8aaa5f2f8ec0b80831c6e4fb30cf46b2ad2423c9fa020426e5f93500102aaedd08cc1c83effdafa272cf9a844de323c418c3e29515ef87793ac698ef2451996694ca213066482b090084a7be769ba100815095af05ae8acae3672556ae9e0621c6095c9b821a09e2072a936c431254b592d82f0204847264000817d77004a6cff048ff07f3362b577b821311629ca05ea92a0194f6b853dd678524a8798d80a064a294230340a0b8862334a50d322471015451cd85b048c20784181f11d4b04893f0a46c93f50508cbbba2783e100040a076dcc1d13b0102e14ef905628cfabdc9d1c82a55332723c4f808a3179e4a20543c7f434ec917d59bdcff7925c02149564d01402c9a21815ccb1192391e8eab87df81788e95ab2723c43846bde626948763d74a92e6a9ee4c66be112030f4520340f8b89623344634f9fbe6e699c9f72aaafe62bec290cf8f20c43846202b556b89b692546b888cae0a10984c74200080a065b2331020246a5659e3596d74f4be825d5558b9fa118418470865a5ea2e95344f024692b9008337370293ee105e008849610973311096b9e6fe3969810ce69d63e5eaf108310e6956aaae4b504603495096293baf111c63744b000051b027bab49420289966b462073298b7a9c6e8093e4088714880eb3a07cd70a9a4349b63682541880602008884525987d0f4536f53086930afd1d987820f1062ec536dba0865a56a434d99e4569291647d0102c43c0c008807733110a25266d72471010de6edb355e6438418fbcca806987495034910a57008d43be66100403c988b8110a94af22dd93680dc904098209f51a78b10a311d64ad55d6e40603194c434bd617d01c243800100f1e1da8ed0d05212504b897b4665e5ea418418523f1407b5527557a2ab55692541a88c91ef04001015aeed08112d25d560de60debbac5c3d8810c32ab3d99be15561b8d5aa9ae43c0c5a4910aa8ca19e00101daeed08112d25c1ac5add35679f59c33b749f1295c4b92a0ca3b33f4880b6369f27f7fa85fc7a016a763e4d719b1000c4cc9d8eda7b933f0a1018ee4b442e2fadb8f76e30150e6ae45a513c1f48e292afc40870a5eaae812488561204ac20c00080f8d4d77633142030b494884b05061210a3423586241e6254c33c035ba9ba2ba0b54013452b094265dfb33f0a00204accc540886829b1efdd52437befb27255120f31821ce6d9c84407929866984d5f80300d040010296543094294fc96924c76429a8b51712b5779dd12b5b87c35c8619e35b75af559721f9623c956050854c60a3e008896a19d04814afdfeba288a6178ed60a657ca6cd22b57930c31dc70482d25dc173ed1d5aa59a6c997bc21643b84180010a919190d040810adda61b6e9abcacd94ab31920c31ea619ea15661b89532e1ec349e28a37d01c2f48ea19e0010afe61acf751e21ca536f4d3061b6fcced967da7b92a8e4420c578511ea30cff7ca8124e6cb7cd995ba257d8145d0a8c20080f871ad4788ecfdf56c2e090bb692ca3ed3a63ae433b910c3e8ec43095b51f76ea525cb989e8c701963b604001035aef508552926f5b918ae8a6a20014a75e56a522146b55235f0ed16f60332d15692ac2f40b074280080c871ad47985495b918e18690fde619372949851821af54dd9525b8a6d135ea853cc30460330900c48f6b3d0236976a5bc2ae4c34b855abbb32cdeea536d724991063f1ca4ad0c33cdf4b6ffa7529b3ac5645e0d84c0200f1db190a10a832f06af5f30bfa5e6d2eb595ab498418d54a5513f04ad5f78a14371ca8ca5702848bcd24009080666619d77b0429f5fbed90e76238cdcad59e24228910a35ea91afe668b14e761346fc6be00e11a0a0020154301c2d44f7ed56ad8c379e722586031b6e8438c3856aad6529c873192ac2f40c08c911f0500900436942064f6be3be916ee90e76234faa9cc36893ec4307ae1a94423bd791859a6ac5645e0cc500000a9a09d04c1ca6426f116eef0679819957b9280a8438c7add4c345b2d929c872126cb05081a2bf700201d5cf3113035495762843e17a3912fe62bd10ff98c36c4703d5d31ac54dd634c72db0dbea8caa158ad8ab0b1720f00d261a8be43d8925fb51a434b98aadc897dbe49b4214699cdde8ce9015845be95c4d81f4eaa301001a5b41800123123a3a100014b7dd5aa896306e19c7d168ee730ff08518618cd4ad57589ca28b9d35c9b22320f0311f879280080540c050858eaab5667229941689f856fc5bc7235ca10a359a91a11336c768f27a32981ea0b10b82467d90040a2b8e6230249af5aaddfc371b485c5bc7235ba10a39aa310c94ad55dc66872ebba76649656124480016f00901ee662207469df871b23df491ca25db91a5d8831a31a63e23490c46492f67464c4821b5900480fb39010b632f1fb702366209130713e1bc7156244b652754f263a90c4a86ae27baa0100409094001b614bfd3e7c46ca8144c3f416f39575894c3421861b5c12d54ad5f7de15c5b3a4867a364368682741f80ced2400901a53ca4f02842d4f7c2ec6d07e89a6a24a556ec6f67a461362c4b652759fe4b6928c648600035130627e1400406a682741f04692a5dddaadf1b49448842b57a308319a95aab72442c698e4867a6619ab55010040a8988981f0a968dac33dcbb8162bd42b57e319f219458811df4ad5f7b204877a8a49fba289781829870200480ad77ec440354bfa50d18889ae1adea844f3cc1c7c88510df38c6ca5ea41a3d4e661b87e2d420c000000a033a697f25c8c19190d243efd3c5f8ea24d28f81023d2619e0d336c06cb246324337d01223123d950000049315cfb118d74efcbed33d83bf72c2691319add8b219c0a3ac4585cbe1aeb30cf8a3171f5628d436d4228000000003a55267e5f6e8c7c27d131bd5266839f25196c88510df32ce31ce6b94f729b4952df4b8dd830dc0d0052332b3b430122c07db946f92cd6ac5ced49c0820d31ea619ef1566138a90df5641e0662a37ae18f02000010a63ce5b91859bc07ca73a12fc60832c4a892a3a88779eeda49aa126347660930000000006fa47c7f1ef1b3987d960e79e56a902186d1d9c712bd6aa86752a5e819f330000000006fa43c1723d6e19ebb425eb91a5c8851ad544da0e520c9a19e2accc340543637ffed4701002425b5cd72885beaf7e7710ef7dcd36f9ead83135c8811f74ad503921bea29ccc3000000007c92f8fd799cc33d776581ae5c0d2ac458bcb212fd30cf5d9998a4420c3735c87e49767010000000e0a1b9a5a5bffd8d242ae2e19ebbe6425cb91a4c8851ad5435b22ec9182515628c24a30a03000000f0cc8ef9d3354956fc8b16425cb91a4c8811fa1a98537a975a3f6596a5be871a000000f08f8a267bd818fb70cfc69cd1d987129020428cdfe657f33456aaee496f1e8649f7e208000000f84a35f1c3464de2d9ac1fd2cad520428c0b2a09ac547dcf1893dc661261a827000000e0a33cc4e18f93624a4962db9c51b92781f03ec4a8d7bea431cc73576a433dbf0828f503000000d2339bec81a349e7d92c5fcc578218f2e97588e1068c24b452759f6c2809c9a8c200000000bc55267cbf3e23e54012a12a7742a8baf13ac428b3d96f52abc2a8c53f05773fcd0c433d010000004fa9e8654954620b17e6ec33b8f74504de8618e9ad54dd53d453701362b427408452deab0e00a90a6d5521301695bea42d994366fb0c7e2b778b353ce66d8891d84ad53dc6a43138e610da49000000006f995ed2c33d135bbc60d4783de4d3cb10e3cb7c7935b195aafb31d41300000080672ef424599ad4339a78be72d5cb1023d32c98f52e9396da6612867a2266c6fcfca900005293ec6935e2568ae94ba28c98a124c6a83ef4b5fac6bb1023c595aa07a5b59924edd71af133dcc80240627664966b3f2295ee7dfb8c8c52abc410f77a9732ebe5ca55af428c7457aaeef7f35012a29aeea4630000002014f6be3dd98d82896d28d9a32a377dacc6f02ac4a88779267d329fde6612da4910b191943d01002445b9f6235e3d495a7a2d25e2e9ca556f428c6a1d55bac33c77251560d8d7dc0518945c02000000fe9b4b7a7dbca6b5806157bd72d5af219fde8418269b4d7698e7aed456f78c64a62740c454b29e000092c2b51f3133e6cf4b922853ca8f9228a3e255358617214635ccd3c8aa244f87921015a595049163b0270000884729da934499c4b6481ed2cff3656f9ed7bd083118e659b32f46526f0ccd0c433d11357b1af74b01002486cd6b88973d844cf6fe7d46ca94430c319addf365c867e721c6e29595d48779ee51fdc50f9212a33d01226613fb4f05009014554d776600e2a7d297740d2569feac5ced34c470c33c95619e7b3637ff2db53e2bda49103555e1461600004424dd56d9668b646a9b240f6856aef6a4639d8618ac543d20a9f2a466330910396526060024877b5b442ded0d25c95763c89c0f0b393a0b3158a9fa81a4523d3693200ddcc802407ab42740c492de5092d836c9231959ed7ae56a672186d1d9c7823da9bd2154b42740027c19800400983eaef94841ca1b4a24f176925d5daf5ced24c4a856aa320fe190b4d6abda1f7d5e7f24e2424f0000a9e80910b994379424be6675bffe62bed2d990cf4e420c56aa7e28b9f5aa4cee4632ca9e000092b023b35462207e9af261a45289d150953b5d559fb51e62b052f538c9bd21a8c44012122fb90480a464dcdf200d3d49d48c8ca8c4786faeab95abad8618f54a5559177ca0289e25f38668123b4e2a9008425b004807d77c24612ed5f92f45510c057b9a6a8c9eb4acd510a35ea98a23245585b123b39c5220192ad92f05009004cd8476592422e5995f6628d86374f6a1b4acb510e3b7f9d59c95aac74a6b1e8618aa30908ea4fb46012031467b02246024a394e7620c05fbf5db5eb9da5a8871418595aac730467e9284a8280f7548494f0000a9e809900095ac278932c6fc2838c0a8b65a8dd14a8851af54a547f078a99524f1b380a4cc2d2dfd2de5c5001039667e2125f65032e17b1b2a313e647a6dae5c9d7a88e1067db052f52469bd1158af8ad418f397cf05001035667e21299aeea1a4917228f8409b2b57a71e6294d9ec379cbc7f5c46250610b592957b00103dd6ab222dda936469524b194e61ce3efbb752bc30d5108395aae34aed8da03d019242700700f1e35a8f94a4fbf33e23a3a496329c867df6bf95bb851e5336d5108395aae351fdc50f92882ef608035d53d5cb0200881ad77aa426e1995f54627c8451734fa66c6a214635cc9395aa63d9dcfcb76426dceec86c4f80f450620c00f1e35a8fa4a43af3ab280a176210641c6fea2b57a7166230cc735c890df594b227407ae6da1a740400681f9b4990a251d2f7f58610e323dccad569defb4e25c460a5ea69a435d433e59dd248dd4c5f0000516233095294f67d3d6b563fcef44a999ddacad5898718ac543d1d63e427490ae116d2548af604001025369320452a9aea4c0cfb0c679219077056aa72735ad518130f31ea619e3ca88e2fb14a0c4df76287b4d90f7a06be0140a434335f09901823e6534917ed24279bb3d9c054867c4e34c4a8364f30ccf39492db334cbf28d2a4d21700409c8cf604484cda1b796827198bcd06a631e473a22186c966a7be4e253646caa1a4a52740924c8fe19e00109fe6da4e3b09126492bdafb1cf7054628cc9a84c7cd4c4c4428c7aa5aaac0a4e65864a0c20210c7e0380d830d413094b76fb9a916c281857bf5efc3139130b3118e67956e9841855bb1190b05268290180d8645cdb9130d5bffaa5246856768682b1b9ac609281d744428cc52b2b0cf33c23d55ffc2089b027153d0112a62a0c7e0380c8706d47ca8cf939e5e19e18db6457ae9e3bc470a7eb6a646a3b606367ccff4a66c5aa26dc37073428390680f8706d47b246324af2e7bf288aa1e0549a95ab3d9980738718f54a55e61c9c957d0324d34ea2a23d01d23697e757b9d9058048d81b72774de73e184813c33d4f676e528b40ce1562b052f5bc925bcdc3873c92578ae90b00200aa5ccf60548984ad6936419428cd332b23a8995abe70a318c5e782a3887d47ef0999b02a8a4bc531d00e2a299611e069266ef6b7e23c94aee407a2226b172f5cc2146bd268587d2734a2ac4d04c929c5e0c1ca08655d400100b93d12208a44aa9c438a3fe62be72ae999a670a31dc7a1456aa9e9f3192cc50cf8a51da4900e662004014ea79181ce821719aee7bc094893dcb4d90aa9c6be5ea99428c329bbdc945fbfc54f48f9216420c40988b010031601e06e0684fd24525c6d9cd9d67e5eaa9438c66a5eabae0dc8c981f252d3d01e0d2e7af05001034aee540ea9410e31c9a6a8c9e9cc1a9438c66a52a7016546200b5fc3c257400002fd01a08245c9d6fa41c0acec5e8ec4339835385185fb87528ac549d98947ef07960030eb0ef87596e7e0120505fd42b02b9b70184fb7c9c4bff2c2b574f1562cca89e2929c1d166d22a41e2e206ec530a5b4a00205419d770608fea5f25ba81907692493067c818c60e3158a93a0de9fce0efc86c4f00ec51cde8a5068040710d07de33e6e74f2541861063424c6f315f593fcdff62ac10c30ddc60a52a004c92e92d2dfded6f040010947a101d077bc07b26c98aeb59d9190a2642556e9ea62d69ac108395aad3a1fa8b1f24119ae8c50df89891f9cb75010004a594595a49807d4652f604389f399b398c5d34716288d1ac543df30e57a04688011cc67a3e00080fd76e000dda4926c8650ee30ef93c31c460a5eaf418f3bf7e9244a8648418c087fa4cf4068070d4ad24d217007b52bdcf2f8a821063c28cca58d9c347438c6a98272b55a726b11f7c1ed480239432bb260080208c24eb0b80c3b8cfc7a48cb572f5a32106c33c0160ba284b068070649a7d2300b0c70c0513e556ae9e54a97c6c88b1b87c95619e53a543490a3f4bc0316829018000d04a021c4d45d9b6860932bd52663f3a93f3c810a31ae65932cc1300da404b0900f88f5612006847b372b577dc9f3f32c4a8877972728ec9d14c7e29008e444b0900f88f5612001f52867b4ec7dcc7168c7c1062548907c33c5b9058ff9451cae581e3d15202001ea39504f8084dfaf09b10635a6c2671dc90cfecc3bf76f6a100005a7552ef1f00a03bb4920040fb8e5bb97a20c4a856aa92320340eb54e52b010078898d7d008ea4864a8ce9ea3719c50107420c2ed098224ae5818f1b6b2f3600a05db9c5ac38e063b4278932a5fc2498aa4cb37b87dbaef7428c3ae1e002dd166352fb81378418c0094a31ab0200f08ac9666e0a00a02b7387dbaef7420caa30daa5a27f1400d84755bf61c0270078c6647d010074a659b9ba778f5c85185fe6cbab54610040e7e64632d317008017a85406002f1cb847ae428c2c93af0500d0b94c95b26500f044a6d9370200e8dcfe7be4ba9dc4287dd89832a5441e184f3fcfafe60200e8549ee73d616b1f30869467dfe950d0967cb7a524fba29e86cf0326a68d9f31604ca5946b0200e894c99817078c89fb7cb4c1fe9ccd56077d5946c2dc092325eb78001c89019f00d0adea1acc404f00f0caee26bf4c337359d0017d27007034b74a6a4d00009d1849c6d07b00f08ef6dc7f6762ea6f0000fe70d5180200e844a6b49200806fecfd715580e1067bf60400e01993e7f5cc2200408bea7971546100807fea21b22ec4a0ef1a003c64543809048096cd70ed05005fed851800003ff5a9c60080f6b0561500fc478801001e339961360600b484b5aa00e03f1762b02503007c65748d75ab00307d551586bde60a00c06b36c430841800e0b152666f090060aaa8c20000ef15eebf32d1fa1b00809f54e526d51800303d5461004010aa028ccc94f2a300007c36473506004c0f551800e03f63cc96fb9a65a24f0400e035aa3100603aa8c2008030642283e6eb8e6b27612e46eb4c6a0f23fc8c01e7433506004c015518c0b9719f8f968c06eebfb3a228dc0f1d73315aa692fd5292c20059e0bca8c60080c9a20a039804e53e1f6d1834d945b56255d498070200f01dd5180030415461004018d4948f76bfcfea2f555906091a0078aea9c6e80900e05ca8c200707ea62768811916c5cb8ddd3faa420c5796618c508d0100fe9be3e41000ce8f6b290084418d3edaffc7d9fb6f76ee0bd51800e03f7b7298e7577301009c095518c02431fb0ed36486223b1bfb7f652fc470d5186acabb024c850e05c0c41835f70400702654610013458881a951a30f6c5631dcff6bd9fe3f288a97ae1a6320983ea57f0ac0b9f4f37ca52f008053f9325f5ea50a030042e066613cbf7ff857b3c3bfa046a8c600800018154e1201e09432cda864033011aafa1bc1d4a8314766131f841836e91888ca130126c818f3a30098b4fe62bec2ca550018d397f99535b6090093658cfc24c0a419b3b17f23c97ed951bfa8e5ce6da1b769dae60400ce4955eee479cef504004ee0867966ca2c0c60d254f48f024c98cae8d80e9123430c37388395abd3a63c74009884b9329be5a61c004e60af9537a9c20000ffa9311f0cf3dc2f3bfe4fb895abe6d8ff21703a6c2701a6458ddc62e52a001ccf5561b86ba50098382329b78d138c4e9ecb2046f73ff6571c1b62d42b570d433e012000ac5c0580e3199d7d2c0000efb90ce26355184ef6b13fd90cd21808a620b9d48e192bc07431e413008e500ff314aad580e9e13e1f13e256aa1e3dcc73bfeca4bf8095ab98042325173760ca18f209000731cc1398beb4eff3b527981835d9f571feba13430cb772d518f34830713c6c009830867c02c03e267301063debc034cd88725889f3ab56aa3e2bc6f94b4f0c31eabf68e44a94f9e19c30d5bffaa524c24836140053570ff95ce90b0024ee0b772d34ba2600a62ccd108303e9c9fad84ad5c3c60a31dc904f56aee23c666587100c6889517dc8072b80d4cdd86ba100c0f470af35216e84c549c33cf71b2bc4a8ff4256ae4e9a313f7f2ae920c4005a637ab4950048d9e29515da488096a8fee207491321c644b8619ecfd74ff3bf183bc4a857aeea0dc10499947ef009318016d1560220556e98a7bd06ae0b805618f3bf7e9204edc82c21c604b895aa724a6387188e1bf229ac5c9d9891943d49840bc10440ab682b01901a77cd337ae1a900680df7f93887629c95aa879d2ac470d4e86d01ce847624a05db49500484b7dcda38d046851b201862674203d2d6a76c65aa97ad8a9430cb7f6c418c390cf0950c93821053055b495004885db46e2ae7902a04d4301cea25aa93afe30cffd4e1d62d4ffa3d1ba30e36012120b317428005a475b0980d8b939186c23013a91702546d6139c91199e66a5ea61670a31ea219fe599ffa1a8a9e86f2421c6981f0540074ccf64b3dcdc038896c9666823013a608c2439d413e7a3461f9db50ac3395388e114c5cbfbee8b0000fc676475315fa1cc1a40741697afde14a36b02a075f650f68f922c82d3b339fd4ad5c3ce1c62386a84219fe7a1a9fde0d34e02744955eeb8926b01804854eb544bb32e003a6124dd4a6bcde49782533bcb4ad5c3ce1562b072f5dc92ea5137520e054097aad583ccc70010837deb54b9a601dd49774ea251ae3da7a5f2e42c2b550f3b578851fd7b989d1bc290cf33e2071f40db58bb0a200eac5305ba9789194aba78963b252d7726d2c971ee10c30de4304658b97a2626a91ffc192999a10278c0ad20643e068090b93918ac53057ca0291f66f704e33bc74ad5c3ce1d62d47f931d37e4936a8cd39b4bacac9b9f11c013f57c8cabb9004060988301f843f5173f48baa8c418dbf956aa1e3691108395ab67a7fa57290d8421c400fc3167541e331f0340485c80c11c0cc01f9b9bff96e4604fee9f4ec70df39c541586339110c36956ae0e04a762cccf9f4a225cd825041980474ccf64b30f05000261b2997bccc100bc412b09c6e056aa9e7f98e77e130b311c354235c6a9953d498a21c4007c626475f1ca0a833e0178afba56195d1500be184aa27664964a8c31d98c6022c33cf79b6888e156ae1a631e09c6364a6cb8a7a830dc13f08cfd7059cff3bff94600c0535fe657d6dcb54a00f824d9c3494ded19eeacaa619e2f9ec8844d34c4a8ff86a375a165606c2a594f12624af9490078c768799f419f007ce4e660649add13007e313a9444a9684f70a2490ef3dc6fe221062b574f2bb5142fdd8b1de0b9dd419f3d01004f30c813f0971193e450cf06d7a413b85113931ce6b9dfc4438cfa6fea56ae9aa1e0442a594adb49ecc5ae1c0a004f19fbb030cbc612005e70d7a23ac0609027e0a3b4efebb92e7d9ccb027636644aa61262d42b57273fc0234a6a922adf36920d0580cff27afa3f0074cb5e8b1ef2a000f86b26e1fb7a55fd8de058935ea97ad854420ca719e031109c40933af19c959da100f09bd135369600e8129b4800ffa9fee207491755abc79afc4ad5c3a6166238ac5c1d475a270cd34ce4004c8edb02409001a00beedac32612c07f9b9bff96f24c8c9ee0486ab2eb3265530d319a95ab0cf93cc1d2d2df26568ec4bc142004ac5e05d0b6c5e5bff98600030841bac3fa9bd96154621ca55aa9faac90299b6a8851ff0358b97a12637efe5492c28612201446cb8d3c5fe90b004cd917f65aa365b921000290f4a1644f70a469ad543d6cea21861bf2c9cad593943d49883149af63028253af5ebd9ad4106200edb2279bf98cbdd608803098740f257764962a8c234c73a5ea61530f319c57c5f3755a088e578af624295462008199336a9eda678c9e00c084b96b8bd10b2ec0e0c100088491740f2535b103e8f1b8619eee99bf1dad84188e1abd2138465ac33dd3de290d04cb0619170832004c5413603c65952a10964cccd4e71ef84a25eb090e702b55a545ad85186ec8a7b072f548f68df04b49c88c94c95ef480b0991e4106804921c00042a609cf3ce49a754831ed95aa87b51662386a76a8c6388a9ad47acd87022050041900ce8f000308dd4eba9518aa896d96fc38fb8c3ff595aa87b51a62b8411fac5c3d8a26d503ea86bd0a1b6b8080116400383b020c2078ef9afbf95431bf6757b552b59d619efbb51a62d4ff4056ae7e28c90ff1a1000818410680d323c000a2907a6b381bdb2a66d8d64ad5c35a0f315c6aa7a6ece4ffaccf9696fe36a9b22463cc9600081c410680f1116000914878bd2af73cefa9d1475d546138ad87184e51bcbc2f24780718f3e725498af2fa035120c8007032020c201e46d23d8cdc91d99e40da5ea97a58272186a3466e0bf68cc424d55b652f7e43011009820c00c723c000e292257c1faf52f604adaf543dacb3108395ab07a96852bd553332a2120388ca6e9071953e51007b6c80911b9ddd24c00062920d25512a594f52570df36c77a5ea619d85184eb37295219f15ed49429afe295e7b202a2ec83036c858e90b80e47d61af0536c0782a4cf207a25214cfd25daf9a99cb92b8ae8679eed7698851af5c1556ae8adb372c29ee1b1e0a80d8cc19151b64fccd370220598bcb7ff3cd8cbd16080106109bb4aba98da67d4deb68a5ea619d8618f5bfc08e1bf2c989bc484f12c38612205e46cb8dc52b2b77044072dc7b5fcb72430044c71e40ff28694bb86db6bb95aa87751e62342b5719f2694f2a525bb3ca8612206e6a649d2003484b1560d8f7be008855b2f7ef799ebb2a8c642b31dc304f1faa309cce430ca7190c3290c419f397cf25216c2801e2e71e662e5f5979dc7cf00388947b8f5fbeb2fc900003885b2626d91063476693aec2e87a98e77e5e84188efdd0f3a234a54ba3c456f6b0a10448849155a3173659c10ac4696f85aad1350110b99437939884ab30c4abce096f420cb772d518f3481296da9a5536940029d95dc14a9001c4a45ea16a030c31ac5706e2f72ee9cd24893dabeda98679be78221ef126c4703219ad4bd20fb5da93f40c0540225c9031bbf9657e654d0004cf6d20a957a89a9e004841d255d4a9ae57f56598e77e5e8518a9af5c55d5e4de18c698ef04404ae632cd1e32f01308dbbe0d24ccbb011291fc6641a33d498c1bf9e0cb30cffdbc0a319c7ae56aaa031f4d2fbde1773a1400c9d937f0b3270082d10cf07ccc004f2045c9dfb727d64ee29ec9ddb3b97fbc0b31ea95ab7e0d0e6993ea5ffd52126243ab810048533df093391940209af9179bf63472550024274b7bbd6a72f3309a95aa5e8e7af02ec4709ac1210349d08ef9d33549cb500024ac9e93b198afdc1200de5a5cbe7a93f91740dadc220649d48ecc26562defd74ad5c3bc0c319c5457aeaa643d49489deea5da3e04a031a72af716afacdc4bafa50ef09b7b4fbaf7a696c69514f3fe04d295f450cf2cb156123523af0fd6bd0d319a95abc90df954d1df48628c11867b0270e1f52d57aa4e7b09e007f75e74ef49f7de140049b3f7eb3f4ac234335f492aaa95aafe0df3dccfdb10c34972e5aa4a5f92a34927bb00f6a3bd04f041d33eb249fb0880c640526634914a34f3cec795aa87791d62b85683f456aea6b7a124e52141008e54b5975cbeb2fc90aa0ca05d7bdb47681f01b00ff7eb691c34abd107be5761385e8718ceabe2f97a7a33132ef424293b8418003e6474adde5eb2d2170053f7857dafb17d04c051521eea99ce661237ccd33d7bfbcffb10c3b189d00d49c84846490d8e6956f710640038826b2f91a70cfd04a6677778e78c7dafd13e02e00849dfa78f64a62709702b5525104184184df2379044a868727b888d310cf704702c867e02d3b15b7dc1f04e00c73226e910239167b381cf2b550f0b22c470d4ec24548da13d498c91b42f8e00c6510dfdfcc19e18dfa12a03381faa2f008c4b25edc346cdcc65895c68cfdac184186ec08831124c89cb79a84a3a2b7c1a33520e0400c6604f8cd7ebaa0c6665006741f50580d39949fbb0d1684f6216c04ad5c35402e24e0ddc299c24302ddba6619f36b32292717969e58fc2247400a7a16643cbd1ddd03e7c812eb8fba8329bbd437801e014de6d6d3eff5412d53c7ffe51a265866a46d742bb8f0aa612c3710ff56aca24aa316ce2d997f4d05202e0749a0d265fe657d604c0b11697afde7407410418004e29e9fbf31d998d7a1e46282b550f0b2ac4708ae2a5db5b3e90c895a23d498c31c2704f0067607a99660f2f2f5d65f02770885b0d787969e5a996c6dd3f51ed08e05452bf3fb70fcb118718d54ad5fb12a0e0420c4713988da1a2d10f90392c4b68030d8069307933f8f31e610652b73bb8d3be2736ed1ff60500ce20f5fb73cd4cb4b30a435aa97a58902146b57255e589c44c53bce1d8a19d04c0b935eb58693141b2681d01303989df9fc73ad4b31ae619ce4ad5c3820c311c2d776edb2f110fbe34bdd4560836834c0932004cc05e8bc90f5fe6cbab0224c06d1da17504c00415a92d1a384294ed242aa3a03b1b820d319a95ab0f246a710f92398a3169efa10630692eccd0c797af2c3fa4c504b1da9d7b31a3f254681d013021a9df977f11e92a773526c8619efb051b623899ecdc770349245265d483648e66988b01601aaa2d26b33f10662026ee67d9fd4c33f702c034a43e0f23cea19eeed97914e430cffd820e31ea95abe10e2439498ac33d67643410009816c20c44a019da79a70a2feccfb400c054a47d5f1ee3504ff7ec1c7a1586a31201574229519e40e8706bf3d9e79298cb4bcb3fd8ffef3d01806953b3a1e5288a0f74c4cf851765367bb319d8c9cc0b00d3546c6d3e5f9284d9674c57e516513586b1cf962fa278b60cba126357bc2b57d31beee91823df0a00b481ca0c04605fe585db38b22e041800a6cd98a487ed37cf6051b593a8d11b128928420cb772d518f348a234d397c41849fba209a0038419f010e10580aea8a47da8b813db82856aa5eaf38144228a10c3c964e44a2ba35b01542638a86b46ca2702005d20cc8007aa55a9f5c0ce3f125e00e8c628e943c5d8867a86be52f5b068420c37e433c695abaae90df76cf651538d01a03bbb61c6d2cad35857acc13f5578b1bb2a95819d00ba53a43e2b2aa6a19e6ef4426cafe7ac44c4ad5c3532f34d644321935bb3eab8bdd436c049f2ff3b00aff4ed03a57db0bc3a2ccde8aeab146b82566022aa619d92ada966df48a29ff900fce2eec3257546fb12853856aa1e164d258653af5c8d676049636e69e96f7f2389c944692901e011d3cb347b68f4c226ad269884dfe657f3c52b2bf7aa79179add13020c009e48fd3edc7ec6bbeb71146d7ccd4ad5e80e5fa20a319c6660c9402232327fb92ec9d9a19d0480874c6f7fabc997f9953501c6e4aa2ebecc9757ddcfce05359bac4a05e0a7b4efc34732d39328986151bcdc9008451762386af4b6444425d9b9180301007ff55d75c6e5a5abd5205077b22ec011dcac8bddaa8b4cf5b12438b41b403006a9b74d6a24d76835a36b12a9a86662ec2a8a67c562befc40556f4a0c34cd9b1d63e43b4df4ff3b8090d4d519f6647d6ddfec8c41ea43d15257cdbac8666faaa93ec7fa620400bc67efbf935eadead867c8f0877a562b55e3bd0f518994bb7970271e124d3fd3cea7a9a5a2b93db9326e423b008469509af21181463af60de9fc5aa8b60010201bbc5e6bdaf393d43c43fe518266dea9192d1162042acfafdc32f5b0ace0a931d78be2457243762e2fadb88b08fdc2004247a01129820b00f130c3adcd179f4bc25cfbdf4ce087a8f54ad5e7eb12b128db497615c5cbfb9797966fc6b072b5ac6f8c920b318c31dfaaea3702006173f333fa463217ce0e8c29bfcdea75ad434170fe3aff5def17f29755175c18fbda467d22042019c6e896242e13b31af639bf1be6f9625d22177588e1b895ab31b42444d19b750646cc408510034054fa5a071af7dc0c0da3e64959cab7ff23e1f25ddfb96a8b1d99cdb34cbe56e36e70777a91ce4607903017ae4be2ec3357d00b15dc4a5549401287076e95994450e299e65c8c18fad200602ceefa5eb82a8d1d9919fc5fc533564d77c86d9b999551bf6913719b67686d041035fbacf179ea1582f6b931dc31cc2a4fb65e3ebf2e094822c4b00fc2bd66c867d0521db4134b080500a7a3437be12f4c597e47a8317d7ba145367359aa6a0b420b0049196c6d3e8f7625e738429f87915208157d3b89e35eccc57ce5aeaadc918095558f960c2431ac5a059026b7ba557aaad9ea05fb8d0d749b4a0df9aeb49f05b3b253a4569d3729fbda43be6a56a0e6f6f77bae6a1131ec4205901ef7d92289cb423e348d7ca5ea614984184e263bf78dccde94804f5642efd13a2b7b4119d85bcaa00328009800f7f9d577a1ee8cbd26dacf34176c14a23274d51aa56405c1c6875c60319299beda50a8aeb228fb46b437e3fe24790500543251e661a8043a83d00c554649ccc2d895d440ed1856aea63817c361d52a008cadaed85029a42c7f4c25dc701b43ecffcf5e26652e59f61b35d51c0b665900c08958adea843a0f434d79a3285e6e484292a9c470ea95ab2b81ef719f75376403498c31e691aade1400c049ea8a0dd726a199b88a83a66ac38518c3aa72c37d6d028e52f4dd2fe4e7a1ef2187aba8f88b5ce8cd48d97355155550213a673f20dce7624f64a7092b322a2c00e0344c7acf1687b979181224b75235ad00c3492ac470ec4ddd5d13f07c8554e762b812377b4f4a88010067e71ef2737bb39a5765984dc031e39659d72187b89ba16aa068f5e775684af3a3fbd64839acbf66d557177c9432b3177afc7bf1fd709c7f01572db1fb7d26a3b9ac9a43e1ca42cb5efd35b3e184fcb20a27dc9f332e9c707f8df65c2e71a14a27b4fe8fa9ff8d0000e763afa8df4ae2429d8791ca4ad5c3920b31dc768fcb57569ed8fb9e550990aa06daab755e3b85fd717537cc940503c0d4684faaaa06a9a6bc69d374aaeef66e9f992a3cd8d9fbe33a0019c7ce31bfbeefefff41389154e72b00b4ed5d51bc601e4688f330aa619ee9556138992448cb9ddb52f70c87287725b59298aacc59cd40000000004c045b49ea764509b01223b5619efb251962b8f533f60dfb408235d3970495a549bed40d00000098944ccae4ab3076ea99834151631ea4b452f5b024430cc7ad5cad7b7fc353063d98f4ec66b8c80200000013c4fd7556cf1c0c887b861ddd9784251b62b8f6845007a1a8665f4b829ac9f90301000000705e83d8d76f8f23b49983ee1936e52a0c27d910c36906a10c2438a6b7b4f4b7bf910419c3f464000000e0bcd4948f2471799ef7dc1709469a2b550f4b3ac470dcca5509d0c8fce5ba2428939d0d01000000704ee540123792ac2f01519325f90c7858f221865bb96a8c093185ec4b82682901000000ce6d907a4b82936501b592542b559f1502420c2793d12d096ce56a90bb8c27849612000000e0ec68256998ac2f814879a5ea618418529fee07b872752ecf57fa92205a4a00000080f3a095e48bea59caf424006e04029533ef116234425cb95a06b70e6832682901000000ce8c5612a91e84fb120437ccf3f9ba600f2146a35eb9aa372420a1ad039a245a4a00000080d3a395a4164a7bbe5ba92a388010631f37e453c23ae1cfad3949102d25000000c059d04ad2ac56ed8bff0a56aa7e8810e310357a5b0252caec9a24889612000000e0745c3533ad24e1ac5655b3c34ad52310621ce2d6d618638219f2a92a5f4ba24a4ae100000080b165523e11b8d5aafe3f43552b55099c8e428871844c46eb12cecad5645b4a66ea8b7050ab71010000808ed8fb66428c8ad1be78cd0c59a97a3c428c23d4433ecb507e686c80319b4b82ead5b886019f000000c0498c79d2b46427ad5ead2a5e1f02abd14754611c8f10e31845f1f2befb22014875d5aa93896e08000000808f52515ab1ad99cc7c235e63a5ea4908313e428d0431e453553d7f234e4fb351869612000000e058d583f140607f2bb2be788c95aa2723c4f8888056aecee5755954928c916006b102000000ad336cf573dc3041fb9bd1135fa93c61a5eac908314ea066e7860470d25f86b1e7782a3256ad02000000c7624864ad94d9be784ccb9d203a01ba4688710237502584937e5a4a08320000008023140c89aca98abfcf4cac541d1b21c61832d971433e3dafc630bda5a5bffd8d24ca064d6c29010000000e5153d27a2d552b49cf7d112fb152f5340831c6d0ac5cf5beb46764fe7243126583a60d61c02700000070483910c848b2be78ca0df3a40a637c8418636a06ac0cc463aaf29524aada796dcc4000000000d46851d89369e6692b89db1cc330cfd320c4380535e27b894f3fcff33949948a522a0700000034ecfdf123c16e2b495f3c649f3119e6794a8418a7e006481a63bcbe109432bb26896a067cd252020000005427fcd5fd71f2bc6d25a92a655e3c119c0a21c62965325a178f1f9455e56b4958089b64000000806933862a8c5dbeb69230ccf36c08314e298095ab49b794349b6400000080a43583ef93e76b2b891b55c0bc92b321c43883fa41d90cc55369b79414ae4a662000000040a2eca1ebb73c20d7fc6c2571cf92844c6745887106f5ca557f07b0a4de5212c00056000000606a32311b828a8fad24ac543d1f159cd9e5a595a7e2ed94db9d4f9baa8424d9d7e68ff64bb26d350000004895196e6dbef85c50b592189dfd41bcc2eb735e54629c83cf27fea5ccde928431e0130000002972a7fc828a8fad246ab2eb827321c4388766e5aa970fcbaaf29524ac19f0c9ba5500000024a61c082adeb592542b559f15827321c438278f57aef69796fef63792a8aa95c6988100000000a9a81e9299b5e0f8b8958495aa934188714eee61d9d7d68591f9cb0d49988ad2520200008064d8fbdf47828a6fad24ac549d1c428c0978553c5ff771e5aaaa7a3789b74daedd4758b70a00008024986173ff0ba95a496e8a37aad7665d3011841813a2463dac7a30bd3c5fe94bc2dc8e6c0100000022c740cff79a56925c3cc16b3359841813e2eba97f2966551296c9ce8630e013000000517327fd2f37041593cddc117f14bc3693458831416a76bcabc6a0a5c4df9925000000c02418a34f04ef99ac2f9eb0cf88ac549d30428c0972835a3c5cb93a977a4b49b36e150000008892bddfe5d0aef145f5ec637ae203b6c54c0521c684f9b872d564e2d1509bf6d5d5188649cd000000880f0fca07cc64c6934a743364a5ea7410624c987b605653faf5c36aa49fe7f99c242c13dd1000000020323c28bf573df318f56226a01a7d40b8341d84185350142f5dfb4221fe982b65764d12c6ba550000004468c083f27b23c95c80e1c1e16db5529596f62921c4981235725b3ca22a5f4be2ec6b424a0d00008068a8296999de27d3cc8b561256aa4e970aa6e6f2d2ca53fba52f9e50a34b45f1cca70a91d6d9d764533cda190d00dd30c3faab0eed9dc03bfbf59d29cb9fdc57f7ab9994bb7ffeddeeafd55f670ecd7cfad33bd74629a790e7bfeb1dfc959d7d7f6ce6eaffb815e1596ff7d734cb7e29666f48db5c3db04d936e930400772ddfda7cf1b9a092e779cfe8ec0fd2356336b68a17de6dad8cc9ac606adcca55fb46720fcd5edc6895625c7955d2218631f248951003408c8c0b13ded5c1840e5d2891d56185fdb5cc7e9d1d9e257498b4a2f87e78e897867246f5bca70bbdf7e187e9d9f0c3861efa9b26f420f000102d4efb0f72edf33e9cd033a364faa8c498b2c57c65dd3e34df113fbcdbda7cfea924ccddf036092d37b40002d38414aa8529cd8f754061038b2aa0f879d87538e1b3f76147d9ab830eedd54187f408390084892a8cc32e2f5dfda1ebd5aa36587a50142f6e09a68a1063ca7c7b685623d79a2197c9f22c58028043cc705f505188ccb8ffbc3ba282011352871cb3b90d39f22ae050bd2cf5e736957b00bca4a6bc51142f3704952ff295fe8cca53e99419aa195d63d0eaf4d14e3265ee642ccfafdc369a3d140f98fae17d2009cb64e7be91d99b423506804e1d15565051d185e6f77c20477c3ee6f955176eb8ea8d5c33b95c576f106e00e892abc42b07823d3399f9c63de874c9b5f71060b4834a8c96f834e453cdcea7a9df24538d01a065850b2cb41c6dd928d586153b056145b80e556ee44de506c10680561823f75f15cfbdda84d8253f067ad2ded3262a315ae2d67bda70b02f1e2865d6f569ad4bc2a8c600303daec2221bd481c5cc80ea8af81c57b991e72b7d820d00d366ef631f08f68c24eb67d22d35ca3692165189d1a2c57c79c3ded4f8b0bb38f9019f0ed51800cecf0ddbd4c206d5df49f5404b8505dedbadd82845faf6f3e62bfbf392334414c0b9b0bef3039d0ff4e435691d21468b9a52272f56ae32e0934d2500cec286169a3dd9adb2288a6749afadc6e9d53336467d93655fd91b5f176af40400c6a466e773e62ebce7c3404f5e93f61162b4cca3d3ffc1d6e6f36b92388faa630078697f68f18b276c08c1a435a1466e438daf0935007c1427fe1fb87c65f9a1185d938eb89101f660785dd02a428c96d5a7ff339b3edca430e0d397414000fcb1db1e527e4ba505bab057a9a136d4a0fd04c03e9cf81fd4fd7d7cb552758936d2f6116274c00dfe329def31ae261bdf7d457248350680c218f35d26fa849916f08dbb6728c5acdacfa9af8441a140baa8c2f8c097f995b54cb387d2117be071a3285e6e085a4788d1114f56ae32e053a8c600d2b3bfdaa2dc20b44028dce79548d66f5a4ffa546900e9a00ae343dd0ef464a56a9708313ae24b3506033e6b546300b133ef8c9147545b20264d95c65abdf9447b02204e54617ce0cb7c7935537d2c1d2154ea16214687ec83f37dfbe07c53bac5804fa11a038893eb55d547f69b01612d62f7beed44be26d000e2c203f3872e5f597e2c4657a50b844a9d23c4e8902f2b3ea9c6a8518d01c480e00270c3414b29d708348008f0c0fc816e0f1fcdbb6698e750d0995941675c39f362bef2a0eb95abeee4c67e1948e23219ad1b9925c40082b33fb87831102071cd569d5bee3f041a40d85446770507986ce68e18e984bddf784080d13d2a313c707969f9878e6f2cde35656ac9f788db5069bdeb5009c038decfb8a0e202184f1368dc6286061008aa308ed4dd404f8679fa824a0c0fd844ef46c7433ee74a99752736eb92b84c76ee1b9975734a98f80e78677f7041c505705a4d85c69afb7edf50d0afd97202f8892a8c0fb9b5aa5d6d245163783d3c412586273c58b9cabad506d5188077066aca4722e5132ac680c972f3b96c84bf6a3473ed947d01e005fbc0fcc006f6b7040774b8569565081e21c4f0840fdb3118f059f365e02a903637384b1f88ecdc27b800dae1ee454466d78c9a6f683701bae4663d8dae317be1a02ff295fe4c47d5eb6c88f1cb8cc00bdbdbdbef2ece5f52d50e4f41547a6fb75f3f92c4d9d7e24ff6b5f80f9dbe1640ba063650bdb155bcf887ededd703f77e1400ad70f722ee7df776fbcd8385f94bdf1931f6be447301d0aa7a78e4cb278203162e2ddcb3bf3b7f2d6dab66936c26ff8ce4132a313ce2430500d51835aa318036517501f8aaaecec8fa36ceb8437506d00686471ea5bbaa75aa627c44258647dc89e3c2fcfc9f45f5f7d295ccc8db376fbe95c479f15a00f1a3ea02f05c5d9df1a6a8ab3316b624d34fec2fb77f120a24428db9edde7382032e5efa95abc268bd32cc1eb2dc2d8a97ff2af00a95181eea7ac8a79a9d4f390dad79b0fe16880c551740e8dc89682933ebac6a05268d2a8ca3745985c1ebe12756ac7ac89e4cde351dce6360ddea7b1eacbf056251341b4636082f80b03565d56beefb3cbfb246ab093019acf03c5a99cd7e639f8f5ac7ebe12f2a313c75f9caca6331b22add78d74ce0e54143bc587f0b84ccb58cdc65d60e10b73c5fe99b7a3d795f009c45b1b5f97c49f0814ed6aa56c33c5fdc107829137849cb9ddbf64b5721c25c538d01a92b6304c0e9d80f7f3728d8ed5427c000e2e7dee7eefdee0e418c314cf1074ec9be77ae0b3ef0657e65adf50043dc49ff88fb7f8f116278ca956a1a230fa423aa725350a91ec0545873059cc8cdbb90bb6eae8e3bbd20bc00d2e3ee5f5e152fd6de87196628003ece06ff6cbf385aa63377a4656acc035e0fbf1162782c939dfb1d7ef8cfd5c9279c8e2b6300cfed8617a3cf6d70b14e2b1a80f761c6e89abd3edc26cc008ec7a9ffd1baa9c270d7aad17d81d758b1eab17acde7c24fa2dac96c0c559d7bbbfd9a9250a957cc5d9cbff41f54e9f505deab368dfc677bf3f5f76efd182b52011c56af687dfd7dbda275fe47fbb496db3b8c390150a9e746bda4e2f7080b0bbf7e6cbfb47abd702b6e8b627320f01a833d03d0e56049d7d34e49782dcff3b966bd13375f489c19ba524b368d00380b369a00bbdce7e9e81aad0b1ffa225fe9cfb4be219095aaa1a09d24005d0e966c268d43aad2587bea5c52ee8784b99badf286fb80b7a746f70930009c85bd7e6cb8eb88bb9ed0668294b9159e0418479be9e019448db28d241054620462315fde50d56fa40354631cc4ca55a4a7aabc70e5ae1b020013466506d2c4a9ff71f23cef35d5cfed61a56a50a8c408442623b7f2b493534faa310e62e52ad2b137b073890003c0b450998114a9c958a97a0c9375b09184e1aa4161b06720dcc0bc0e074bf616e62f7db7bdfd7a2810f7fb70717ee17355cd058812033b01b46f7bfb4d510f00bda4f609afc7005044ab3af57ffecf820fb82a0cfb88ba212d62b86a78a8c40848972b57a9c6382893d1bab07215d161552a80eeb9eb4fb39a95935144c87ed672ea7facf6ab30dcb3d50e2b550343254640ea95abbfda129535691fd518fbb07215d1b1a742f6a6ea7fa3f202800f9ad5ac8385f9cf1e19d14fa97e442c5ca523a7fe47eba60aa35aa9fabd20280cf60c50878325075b9bcfaf09f65c5e5afe81416408dc40cd8efd002f0a01004fb9879b5266d6bb1a720e4c06c33c3fe6f295e58762744d5ac3eb112ada49026413dcdbd28d7e9eaff4057b58c58480156ef3900b26093000f8ceada17c55bc58b3a7a6d719fe8950d9cfddaeeee1bd575561b41a60b8d763c4e16ca00831025414cf0a63cc03e980c90c2720fb54ab675528094440aab917b76d78b1c4ea6400a1298a174fd864822019b3e17e7e05476a7d1646f57a14434190083102d5d960499b90d6fd6ad8a5e58e4bd5198008efed1bdac9002b0041736b59dd296a57873ac0e99821c33c8fd77e1506c35543c760cf40d5433ee7ff2caabf97b6653af7f6cd9b6f0515377cacb3d702188f9b7b71cd0d126368278058b8cfdfb7db6ffe95e19ff09d1a752b3cff5570a48b977e75cffe2eb5f6fe65b86af818ec19b8ae064bba5e7a4ad10fea70e02a700c7bf263f406ef550029c8f32b6b46f50e03b7e11786477e8cabc2303afb83b486d72306b49304aeabc19246a5e51dcefe639f3dfc51cdbd70ad23ccbd00900cd76252cfcbe0f318fe6078e4c7b53d0b438de1fa10012a3122d0550500d5181f5acc97efabea4d01bae35a476e30ac0a40caaad35d99b927aaab0274c43e303f288a17b704476abd0a43e5c9d6cbe7d705c1a3122302ee81453a4035c687ea81ab4c4b47175cf585b9deac4c1d0a0024cc5d07b78a17d7d96282eeb89fbb6a103f8ed17a15463d8c1f1160b06704dc60ab8bf39754b5f56a8cdec2fca5efb6b75f0f05957ae0eaafb66cd2bb26404bdc498fcae87a516c160200d8b3bdfda65898bff82d833fd136fbd97cdb7e2e7f2f3852bded706643da62ccc656b1f94810052a312291c98e5b99d8fa9a4faa313e54b5d8a830f1182d70833b5d5bd78b5bf6d49135bf0070045795f1aa78b1a6666789aa0cb4c23e30bb192d8263b55b85c18adbd8106244c23dc0a829bb7873f6f37ca52f3840cbaac587874a4c0d833b01e074ecbd52c1e04f4c1f0fcc27f96d7e35b727a16bd21237cc9356dbb8106244c426beae1a63202da31ae3431d864a885fe14e136d78b14ef505009c9ebb7edaebe8e75465601a78603ed90535f7a4356648554c7c083122d3d1e902d51847e82a5442bcdcfb7b6bf3f9923b4d1400c09955833fa9cac0a4d14672a22ff32b6bd2e25645fb1e67986784083122d3d53c06a3fa50f08166730ca7e538afbdea0b01004c0c5519981cda48c691698bb330aa50e90573ea22c47692082d5cfcecff2f9aadd96f3f91f6cc5d9cbff4d3dbedd74c61dec76d8e59989fffb3a8fe5e8033a8aa2f8ae77f6f7f96b605003071eeb3faedf69b070bf39754dadff4864834db48068263b92a0cd5166761c8e8ba7b7f0ba2432546845c89a431f2405aa62a77f23c9f131c405b09cec66d1ea1fa0200da425506ce8c3692b1b45985e10e81984d122f428c48d52b575bff109e2b65f696e003b495e034ec69ce837af308b32f00a04dbbb3328cbd0e0b3016da48c651cfc2303d69857b06dad910448b7692486d6f6fff6961fed28fa2fa77d22255c917e63ffb67f7cf17eca1ad04e371d5177abd285efc57de4300d09db7db6ffe75617e614b547e67ef6ea832c5b1682339599ee73dd559373faf95f712af49fca8c4885833c86620ed9a2bb35956ae1e81b6127c94314feaea8be703010074cedd47d9ebf23563cc23018e421bc958ecb3c1cd36ab30784de2478811b92e5687d97fe62d97b80a3ea066e7bad0568203cc3bb7fe6bab7871bd280a7e3600c023aebde455f1624d4dc99a461c421bc938aa2a0cfb6c202d51935d17448f102372ee54b78bbe4e53978ce110f790aac6dc10a0e2da47aaea8bfb0200f096aba664e827f6b3f7730c8e1c83c9da5ea9fa8c79620920c4484026a37569fff4bf9fe72b7dc1075c792a03c3b06f78e7500000de73d76b77dde6331cb4918ca7aacc36adae54a532261184180970a7ff5dac5c352accc638461d2c719a9326d73ea2376c98758bf61100088bbb6ebfb2d76f35255bc79255b591d05e3406a3179e4a4b58a99a16428c4474b472b5bf98afb072f508755b89d256929ea2aebe78b621008060b95378353b4b1c48a4c70d7be510e2646daf542d8ae7eb8264106224a2ab876655b993e739abc98ed0d5bc1274a36e1fd9b9c6290100c481f692f470da3fbe4cdb9b85e1e6930892322348c6f6f6ebe1fcc2a5befdb627edf9c448f6e7b7dbaf07820fb83df41dbc266855d53ef29f8ae2c5faf6f6f69f0400100d775d779fe50bf3f33fd9939bdf0b2266866e9398e0448b5756eea8c8aab4a3b0afcb3f089242254662ec497057d5183dc1919ad784b2c42855db47aeb17d0400e2c6f692d8d59fe78213352b55d7a525f67d47b09420428cc4b8123856aefaa52e4765ff7c8406cdf611567d0140029af6926ba2f2441015d6a98eaffd95aabc2e29a29d24410bf317bf17cdfea3fdf613694f6f61fed277aea545f081eded37c5c5f9854f55f57782e0b99ed9ade2f90dda4700202df6baffeeed9bd7ffcddef3a80d33fa82e0b9995645f1f29f0427fa225fe967a22d559f565b62dcbd16d5cc09a2122341f590cfb2f5013846f521433e8fc7dad518ecae4f65423600a4cc7d0eb0863506eebeccdd9f611c33f65e5f5a62efb71e5185912e428c44b9de4df7455a657aa5ccb272f51875b894b9be3e6e7882b43bff82f5a90000d6b0c68075aae35b5cbe7a9395aa680b2146c2d448eb731854e526433e8f671f808b2eaa64706e83e64687f91700803d7b73325a3f38c279b9fb644efac7530df32ca5b5834a56aa82991809eb6ae5aa6459cff58b0a8eb4bdfde6fb8b0b0b9fab682ef09eeb95dd2a5efc3d3d990080a3547332b65fff33b3af0262cc86fd6cff4f82b15cbcf4ab7bf64b5fdaa0f2646b93d72675546224ae93f59e4656f37ca52f38566646b7283ff59f1be059142f689102009ce895fdbc709f1b02cf550323d91a37a6dfe6577331ba262dd17287d7068418a9ab57ae4a072b5719f2f931f57c8caafc94d37d2fb9019ee63afd980080d3a8077e1ae65f79cbbc630ec6e95c50792c6d61a52a1a8418b03f043b6ec867cb176b867c9ea4eea3653e867f760778be782200009c92fbfc60e0a79fd4e85d1e92c7b77865e54e9bc33c5546dc17a3c24c0cb85ecd3f2dcccfbf15d5556991aae40bf39ffd3766091caf9a8f410fad4776038ce2df0500803372f73e0bf317bfadefbd94ca540fb8195736605a178ca51ed49f6d889b77d702fbfadc2e8acd81004225061a6e0d98fd329076cd199d6d6d9f74a8b27a3f3953cdbbe736902c7142030098846673c9921b5428e8985bd9c98cabd330d9cc1dfba5a500cebd3ed5b30a5021c4c09e8e864df5f37cb9d50a90d0d4f33176e89fed50b58164f3393db2008089729f2b5b2f9f5f37f67346d011b3bb061763fa32bfb2d6ea304f230cf3c4018418d85314cf07f643f491b48c219f27ab4f6be4baa0756c2001004c1b9b4bbae31e90a9b21c9fbb67cfb4aac2684735cc933964388810030734ad0b6d9f36cf95d96c7b17c340b990891b9c76d537366c2001004c5fbdb984cff9363507153c209f427dcfded6304ffb1a31cc134760b0270e7083a62ece5ffa0faad29716a9c8ef16e62f7db7bdfd7a283896fdfd195c5c58f85c4573c114b9156bd93fd81bcaff2a0000b4c47dce2fcccfffd8f6b0f524d913feade2056d0aa7d00cf3fc1769491d32fdbfeddd3f701cd7b5e7f1731a908b8e164a881958551e66aa5712d0f84315377ac38c99c1ecbd8860b619c968b511c1e8d91189685f4630d38b0845962242997609601af2abad97711c18683a8232c9c2ccdd7ba71b244811c0cca0a7fb76f7f753651374d1552a02425ffcfadcf3db2364c2af3089815f492a57f3affde25ac97002d3bb4f2ddb249d74c4bfdc14000072e61618aad1456117d6040dea3a09304664f4a317921b77d63dde14e0030831f02bc922c92216e898565fa6d93d7081e4f3335840c5e126736f2a546983010014c606e9919ae3455e5a4cc29b673de7a811cc2fade47b8dc49847ec2ac1595480332c2caeb8b4b52d39736f1fdcc35b70ae305c691b951c13f1aa7b73a8e90a00001e70e3fb46a7ecb35e5b824cd8177537dd9e31c1d092afc3e957921bd3ddefec5e13e00c4c62e04c452d97326a1e0b2e942cfaec330a9909020c00807f927632377dc9444616921d0b0418a3b201c673c91195b7b8088b3d7126b76473b6d1fc58556f48be5ab38db91f5fc707df0bce15c787df17f439aa10020c0080bfdcd2f56663f6eb64d9a7b23b6c4c6acc4614ed7e2918c9fcf2f57b36fc5993bc0c16ae769e09700eae93e05c6ed1663a3e96f743f3c8dd05e507cbe11475f5a702dc9de3db7c9d01007cc7d5924b89f63b3b8b8291a4d7483a92e3cf01f65c768d73192ec275129ccb2d3d324636247f2e3c792a188afb419c51d391b90083090c004029a4574bdc0fe2ec0d1b899bb874e7248c2a3d8be7186008cb3c31142631309485c5e5574524ff364079f043b4f34470a122d2f2123b0930d84c0e002895744ad64d6086820b0c6ad399ec1dc3e01a49dfe4780667992786c7240686a246ef4a0154e5a1fbe15c70a1e40d8df0a6e16204180080d24aaad68fdde24326322e60cfaf5c191d833b7bdb00635d72e42a55051812210686926e72de96fc71ad640434965c88000300507a041917a389647c795f2391c197f4dea6004322c4c0d0ecc3b290690cab3d1faedc170cc53e049e14558feb39020c00406510649c2d0d30d6052373d74824e765f1ec2cc1a8a858c5d05cc55751759eaa72a3d9b8fa1fee9f4170a1383ed89e6d36afa928f7651304180080cab1e7a29fdcf94834b8657fdb10b86b09cfa26897975f6348ae70075fd90faf485ea854c51898c4c04802e9addb5f8af841d05d2b792e185a607aee01cedb19020c0040853191f10efb77d023c01893d18fdcc2d81caf9198ae4a8fe9618c8c100323491e94fda2bed984f3e1caba6028e9a1a6e6d5ab835a35020c0040a511643849952acffcf1cc2fad3cb47f872dc9911add60f12ac641c52ac6b2b0b8e2aa3c0bb9aaa0466eb2a8697849f5ead48b222a728be50e33bd9b3c1c010075c1339f67fe3892af9be957922b2a55313e263130161b2414d68061549fba8e74c15092ead5c02d4caad19b090e330080fa499ef9bd9bf59ac234473cf32f27bd46922b2a5571198418184b8195abe246ddfac1f443c1d0a2e8656483a79a6c7e26c00000d457dd820c7bbeb9cb337f7c455c2371cb3ca954c5651062606c69e56a216ff7ed03eb7e18aeb4054373c1939a7e5135b93921c00000a02e41869b0c8ea2dd2dc1583eb36769fb77b82e396399272e8b100363730f486364430a62549e27555018964bbd5d77ba5412e3a400009ca8fa7552779eb12f689e08c6e2ced053aa4f25676a0ccb3c71698418b894408eddc3a3a887a3ab5dcdfd9b6fd9d907fe7a15830c020c0000de955c2755d75a52a920230d30d6056333c154fed7480693413d82275cda94009710c7f14fcd46e3b5a8ae4a315ab38db91f5fc707df0b8616c707dbb38de6c7aa7a432ac01ed0ee46d1de37020000de619ff971c167b54c256ff277bf148c6d7ef9fa3d1b04e5fe77683f770fa2a8b32dc0251162e0d2e2f8306a34e7daf6c3961440556e341bbffbd63da405437b1d1f7e33db6c5e53d142aa72b3c238290000e77367351b64fc680f4db7a4c4ec0fc1cf6c80f13f04634bae62075fd90faf48ae4c773fdaabf86e36e485eb24c844c1d71366d2fd18d4ae8ee887ceee9a14d63273798c930200309c28da7b52f2eba4db36c058135c4a5aa79afb99d94dcd0a9011420c64c2355f189b8e4b61a85d1d979a63b7f42b929249c6490930000018967b6edaf35a614bd92f214acf2bb88442ea549d41a5eaceb6001921c4406602e9dd9702174725b5ab5fdc118c248aa2237b30704bbfca136418b365dfc6dc17000030921f92e7e7b694870b30dcf2ee4ab6ace4e5f37069ad883a55874a55648d100399710f97222b571da3fd27d4ae8e2e0d326e97a34fde74edc39091440000c654aa67befd6725c0b81c77360e74aa9089e5e4ea2fed71c8162106329554ae16fa5074b5abcf05234bfae47b37fd3ed4986e5aa5ca6106008031252f2f4af3ccef0a2ec5e847cf0bb94632f8fa3a66f93a324788814c250fc5c217f784f34b2b8f0523f33bc830471c660000c846f2cc0fdc9e090f5f0c10606425dd835148139d1af388174f9804156002161657dce6e3b614c87ee3bc1d45bb5b8291b9b143a353f673a82df1049f4f0000b21786cbab46d5a32956028cac7c6e3fb741619f5bd3ddefec5e13600298c4c044a8d1075230fb407eca7e8cf1f8369191dca724c00000206beef9ea4ff52a014656923d18416193c9c93912980c420c4c4414bd8c3ca8f01aecc7b0dfc473efc2ae025f820caa540100982c3faa570930b254dc1e0c492b55f93c62720831303181f4d6a5f87b96613f982e641b73157810644454a902003079c556af126064a9c83d18831d6654aa62c208313031c992cf7ee1dfc4d4c8fdf970851f84c7545c9091d4aa090000c8857deede2de6794f809195cfc3a5357bf65d9782a8d10d3e979834167b62e21616975f79b020d2b5a6dc74d75c0463c977d9e7a089649187200000f90ac3eba151e316b4e7701d9700234bc9596dba23b97cee3e84659ec807931898380f2a579d19a3c27e8c4bc87322438d79c081060080fcb9173e6afa392c6827c0c8923be31afd28a7f0e9c35ca5aa003920c4c0c445d1ceb61476c7f234d332c1f453c1d8f20832922692bd4d0100008570cfe1c93696106064cd04538f0b5be499d8e6fc86bc10622017c91d4b0f18594d961d615c130d328cd9a289040080e2a5cfe36dc91c0146d606675ba36b52206fcefaa805420ce4c23da88c271de46ed95118aeb405637b1b6448863b46eca1467a398caf02008061240bb6337d6911116064eb337ba62d7291e70095aac81921067213c8f11329be727520dd8fd1128c2d09328e330b3238d40000e097a4692e704d61599cdf22776ee0599f1d77969d522df8aaf4e02514bb30902b420ce4c697cad5d460f9118b3e2f27f99c0e828c6db904fb0681459e000078285df479d9f3db761a6078f132ab0ade2ef22c740f0695aa28c49400398ae3c3ef1bcdb9b6fdb025c59b91401baf0f0fbf168c2d8ee39f5ec707cf669bcd6b2a1aca88d418fbf0db5d170000e025777e9b6d343f56d51b3222fb9c7fb61fedde76e7054166aece7df26f2a724b0a65baf673fbaf02e48c490ce44e3dd98d3160748d459fd9f8a1b3bb666c2031d2ff6970cfb6b72e0000c06b41f2bc1ee90a69faa2624d90297776b5e7e9fb52302a555114263190bb383ee836e6e6dc1bfb4fc50336c56e371b9f74e3f86ffb824b791d1f7ed36ccca9fd4b6d5ffca7cd919ade7f8fa228160000e0353749d16c5cfd563458b3bfbd72d19f4f2ad377bf1464eaf370793510fd77299a319bfbd11e21060ac124060aa1fd63d742e1cdbd48a3fd272cfacc86ab641b66dac6a6f7ecc10000a04492a5defd0b9bc4920083caf4acb9b36aa0c163f100cb3c5124263150089be61fcd36e67eab43bdb1cfc515d1a955fb86e16bf7cf26b894383ed86e361a3f8aea07ef6a26e3a57b7f140000502a717c189db71f438ddeb501c61341a65c80e1c3224f2739c775be12a0204c62a03049e56aa6dde39764ecc361fab9201336a478621f721fa865630f0600006596ecc778ff0ce7ae89cacd287ab929c89c3da33ef521c048cf718454281421060a93d4737ab710289c5f5af1624caf0aa268774bcdf1e2e9838e9a1e156b000094587286ebb98af5f4796ebac9f37d675b90b974097d5b3ce0ceee5c0746d1b84e8242b991448f2a570754e4c6ecdc9cbc3e3cf84e7069ee7a4eb331fbb5a8aeaa51fbe0dbfb46000040a925cff7c6cff6e0f469fa82e2bf04994b9b48d6c50bae5275efae000553010a16862b6da3f2423ca326588ba2fffb4c9089300c6798c00000a05a78be4fcea08944d59babcef665d46214bd1ca966179804420c78613e5cde54d53be29723fbcdfa26dfac01000090a76491e774c77e38233e1854aaee3285012fb013035e08a4775f3caa5c4dcd1895e754af020000202f6f9b483c0930844a55f88510035e706388c6c88678c70c1e226e5452000000800972674e7bf67cee471349428db0cc135e21c48037fcab5c3d41f52a00000026cf0453ae4a35146f986e14edac0be011420c7823a9eb525fefdab5a95e050000c0a40caa548dae8a475ca5aa009ea162155e89e383ae6f95ab27a85e050000c024f855a57a824a55f889490c78478d3e104fb9874b187ee15b8b0a0000004a6a7ef98b3bfe0518eedcdbbb29808798c48077e2f8209e6d343f56d51be22335abcdc6dc776e6a44000000803185963d5c7e23be1954aa769e09e0212631e0a5407aebe25fe5ea1b49f5ea758f962e010000a04cd22a550f97c79b2e95aaf0192106bc942cf9ecfbfccd73260932c296000000002348038c173e55a99e50a3cfa85485cf54008f2d2c2ebfb25fa62df19676d5fc72936ff40000001886cf01c660996767f79a001e6312035ef3b8723565ec4368da4d64cc08000000700e77664cae90f8186050a98a7220c480d7a26867dbfeb22d7e0b6d90f14200000080739860eaa9fd6f3ff7aaa96c45d1dea6009e23c480f7d41cbb690c6f977ca6c285a5e5a7020000007cc0fcd2ca6331ba2a9ed2fef103014a808a55782f8ee3a3d9c6dc6f55a52d5ed370766e6ee6f5e1c1b702000000a46c80f1508d7c29bea2521525c224064a2190e327e2ff3486d887d37df7901200000040de0418ebe22d2a55512e4c62a014e238fea9d968fc2caab7c4732ad29e9d9b93d78707df090000006acbff0063b0ccf3411475b6052809420c94461c1f7edf68ceb5ed872df11c4106000040bdcd2f5fbf67038c3f8ad74c773fdaf3bc0d107817d749502af641509a513797ba87e1177704000000b532bffcc51ded9b27e2397b5e6599274a87490c944a1c1f741b7373ae96ea53290335abcdc627dd38fedbbe000000a0f29200a3bf29be1b2cf3dcfd930025c324064a27ad7ff27ec9e709a3fd4d2632000000aa2fb44a116088bbfecc324f941321064a278aa2ae31b221259204192b6d0100004025b900c3e8f40b29017745db9da9052821420c945252b96aba522246e579185e0f0500000095722ac09811efb933f4f1a6002545888152b2c9f151091711cd18352f0832000000aaa35c01c6a05295290c949a0a50620b8b2bee81d19672b1018cde8ca29791000000a0b4ca16600c2a553bbbd70428312631506a65aa5c3d85890c000080922b5f80e1cecec16d014a8e1003a516453bdbc698522df94c1164000000945419030c57a9ca2430aa801003a517486f5d4a54b97a0a4106000040c99432c0102a55511d8418283db7e4b36c95aba71064000000944469030c2a5551212cf644652c2c2ebfb25fd22d2927967d02000078acac0106cb3c51354c62a0326c087057ca8b890c0000004f9537c0482a5505a810420c54865bf2697fd996f24a838c2fee08000000bc50e600430637aff73605a810420c548a9ae3324f633836c8e86f126400000014eff37079b5c401863b1b53a98aca9912a042e2383e9a6d343f56d51b52666a569b8d4fba71fcb77d01000040eee697bfb863dff87e653fbc226564cce67ed4792640c5308981ca2971e5ea3bdc44c6fcd2ca4301000040ae5c80a1fdfea69496e952a98aaa6212039513c7f14fcd46e36751bd2525a722edd9b939797d78f09d00000060e2dc4b2435e68994981add88a2bd2d012a8810039514c787df379a73abf6c386941c41060000403e920043d6a5d44c773fda6517062a8beb24a82cfb007a2015e11ea65c2d010000989c6a041854aaa2fa98c44065c5f141b7d19c6bdb0f5b5201e944c6ccebc3836f0500000099b101c6631b607c2965a7b2b5dfd9fd5f0254189318a8b4b472b5f44b3e4fd887ebfd85a595e7611896b2e60b0000c0370b4bcb4fdd194b2a40fbc795994406cec224062a2da95c9dfbadaab4a53a3e150d6e351b57ffc32d31150000008cccbd149a6d7ef267fba3ffaa540195aaa80926315079811cbbedd29599c64885463fead8876f4b00000030127786b267a917f6c3b6540295aaa80f420c545e1445476afa151cad3383872f41060000c0f0de061826948a70cb3ced99b72b400da80035b1b0b852a1b4fd34edaa91db51f432120000009cc906186e9af5b97b19249561bafb9ddd6b02d4049318a80dfb837e4547ecdc44867911865fdc110000007cd067e14adbe8f48b6a051883332ecb3c512b2cf6446db8cad5d946f39aaa566674f0942bf609b63a3b3727af0f0fbe13000000bc31bf7cfd9e7d7bfb95b83353950c9679eefe49801a21c440ad341bb39168b026557b80a554a44d90010000f0d6fcd2ca4335f247a92095de6dd7c627408d1062a0562a5ab9fa8e34c898b141c6b7020000506336c0786c038c2fa582dc55e928dadb12a06658ec89da719de046a73af6cbbf25d516a939becda66a00005037c9796ffab95472a9bb63ba6a7a8bae854f809a61b1276a27a95cadc502a4900a56000050376985aa7d6155e1c9dba452950003b5c424066aabba95abefa382150000d443352b54df47a52aea8d490cd456752b57df37a860edcc872bf7050000a0a2e697bfb853c50ad5f7a9e9dd14a0c658ec89da4a2b573f56d51b5203aa728be612000050454903897922156da07b6350a9da7926408d719d04b5962e7d7a653f9c91ba50d9d2fef15dee51020080b21b9ce582a9c762744d2acf1ca5cb3cbb02d418d749506bee0779636443eac4c8aa5b76c5c24f00005066e902cf17f50830dc3512dd20c00098c400061616975fd5a072f53d2cfc040000e5548f059ea7b1cc1338c12406208364fbaed40e0b3f010040f9d46581e769ae5255000cb0d8139064c967a339d7b61fb6a46658f8090000caa2360b3cdfb5bd1fed3e1000035c270152c9bdcac192cfba8ad41cdfe6ae250000f04dba8cfdb9fdb02d3563cf67d7389f016f719d0448b987833152e7513d77b7f4050b3f0100804fd2059e1da96180e12a5509308077116200a70472ecc6136b5c3d6a06d328ecc90000003e48f75f74eab4ffe22dd355e9b10b03780f3b318053e238fea9d968fc2caab7a4c6d8930100008a36bfb4f2588df9a3d46bffc51b6af45114ed7d2300dec14e0ce0031616575e481d47167f8d3d1900002057e99eb2a752ebb31895aac059b84e027c80d67b37c669e99e8c95b60000004c980d3006670fa9f9cb242a5581b3719d04f8803a57ae7ec08ca8ac71bd0400004cd2fcf2f57bf61deb96b8b3479d19b3b91fed11620067e03a0970867494d16dc2aef783f434952ded1f3fe07a090000c8caa03e35987a2c46d70454aa0217e03a097086b4727543f09691556a5801004056d2eb231d028c841ab34180019c8f1003380795ab1f92d6b02ead3c1400008031b9eb23f64cf1a29ef5a91f62ba22bd2702e05cecc400ce9156aebe16d555c13b54a4dd986bb69ab3b3fbf6ef89a00700000cc55d1f999dfbddff56235f4a4deb533f448d7910459d6d01702e76620043a072f53cda55f3cb4d461f0100c045d2eb23cf99be781f95aac0b0b84e020c81cad5f370bd0400005c8ceb236753a37705c05098c40086341f2e6faaea1dc1d9682f010000ef49db479e8ae17aee070d2a5577093180213189010c2990de7d61c9e7f9deb4972c7348010000f259b8d24edb47381b9c41a5c7c42f3002167b0243724b3e671b73bf556537c6056644f55f66e7e6e4f5e1c1770200006a697e69e5b17d63faefe2ce06f8207765398af6b604c0d0b84e028c60300ea9531dfbaf4e4b3004967e02005037f6bcd44a9777868273187b4eea2dda731293bec008b84e028cc03d6458bc348a74e967b8725f000040e5a5cb3b3b04181753631e116000a3631203180395ab6360e927000095c5f2ce5151a90a8c8b490c600c6af4816034e9d2cfcfc3a53501000095912cef9c7e4580313c35bd9b02602c2cf604c610c707f16ca3f9b1aade108c62c6fe9dad36e69aade6ecec7e1cc78c50020050526efae2eadc27ff962eefbc2218cea052b5f34c008c85490c604c81f4d685cad5f1185da38a150080f23aa94e5523ecbd1a8939a25215b81c26318031b9cad566a3f1b3a8de128ce3a48a75a6397bf5ffb8bf4f0100005e7b6ffa82ead411a9d13f51a90a5c0e8b3d814b5a585c7e45e5ea65b92a5673378a76b605000078c94d5f4ca93e75ed638231b0cc13c802d749804ba272350bae8a555ecc2fad3c766f7804000078c33d9bdd337aca3eab0930c6e72a5505c0a53189016480cad52c31950100802f98bec8ccf67e67874612200384184006ec1b8ad6a05a0cd951b3a9fddea3288aba02000072e5a62ffac1f44316776643cdf135ce34403658ec0964c05585ce36e65495698cec68283ab57ab5d1f8f1eff16124000020176efa4275eacff66d27cbcbb340a52a90292631808cb83716e934063b1db2c654060000133738cb04538f5d15ba2023a6aba67793330c901d2631808c50b93a494c6500003049f3cbd7ef89045bf6997b439019356a5fc2ec7d230032c324069031967c4e9a466a7eb9cd1b0d00002e2fddebf55438bb4c0095aac02450b10a644c8d509f35512674d776e697561e0a0000189b7b96da676a47083026824a55603298c40026606169e5b91859154c9876fba6ffe02fd1ee96000080a1509b9a83c132cfddbb0220738418c004a4a399eecd064b3ef3c0e24f00002ec4e2cefc50a90a4c0e8b3d8109482b577f4be56a5e92c59faee6f6757cf0bd00008077b0b8333f6acc461475be120013c12406302149e5ea54c7fe6bd612e448bb6ae47614bda4c50400507bc9d511717ba4da821c50a90a4c1a2106304161b8b46634782ac81f574c000035e65ea6f483e98736d8bf2fc88d9afedd28dadb1400134388014c1895ab853a322a4f7ed8db613b3800a036dcd511ed9b75613757cea85405f2c04e0c60c29a8db9bfdab8704d50842b36a96d379abf5bbbda68fcf8f7f8902b260080ca7257479acddfbd5063fec5fef68a20576a829b717c100b8089621203c8c17cb8bca9aa7704c5e28a0900a082d25634777db52d280695aa406e0831801c244b3ea75f09639d7e20cc00005440baf7e29e1a5917148a4a55203f5c27017210c7f14f54aefa844a560040b99d54a6da3792b70485b221927d31b2b7250072c1240690132a577da5ddbee93dfa0b9bc40100259054a6ea5311d3127880659e40de0831801c85f6e061545e083ca4917d9372378a5eb2fc1300e09d24bc9087c2de0baf50a90ae48f1003c81995ab9e635f0600c02383a59dc1d46331ba2af04db4dfd9591400b922c400721686d743a3a623f01b610600a0402cedf41fcb3c8162b0d813c899eb0f9f6d343f56d51b028fb9e59fc1fdd9b93969ce5efd6b1cc7470200c084b9f0e2eadc27ff5324f88aa59d1e1b54aa769e0980dc3189011480cad5b2d1ae51b3f9c3dece23010060024e4d5edc17ce079e335d35bd9b4c6100c56012032880ab5c6d361a3f8b2a6f58ca61c626beed46f3776b571b8d1fff1e1fb2fc13009099cfc3a535d5a93fa7931757045e53a31b54aa02c561120328d0c2e28adb8d110a4a865a5600c0e5b9f022d0a987d4a5960995aa40d10201501835f2405042a61568f07461f1fa2b770015000046e09e1dee19e29e250418e5a2c670b5142818931840c1a85cad02263300001763f2a2e454b6f6f7766e0b8042116200051bf4bfebb4bb56c212afd223cc0000fc1ae1453550a90af8811003f0c07cb8b2ae2a0f05154198010020bca89441a5eaee5d015038420cc00354ae5615610600d4cda02a5502d736728ff0a22aa854057c42880178220c97ee1b0d1e0b2a280933a6a4bfcd010800aa69105e04d3f7d4c87de1a544a5a8e9df8d78210178831003f0084b3eab4ebb46cd56d03fde20cc00806a20bca83a2a5501df1062001e09c395b6517921a83e359bdaef3d22cc008072728bb96d787187f0a2dad498db51b4bb2500bc41880178663e5cde54d53b827ab06146afafcffe33dad9160080f73eb32f1ca602b927465605d5c6324fc04b84188067a85cadadedbee93f63092800f869105e244d626d412d50a90af8891003f01095ab75f66609e8963d381d0900a030348dd4971a7914453beb02c03b8418808792cad5a98efd57b425a829ed8af6b7d99b0100f9635967dd51a90af88c1003f054182eaf1ad5e702b037030072c195113854aa027e23c4003c46e52adec5551300c8dadb2b23c11f84672ea85405bc478801788cca557c18574d00e0b2fe29bc1e4e07e60f5c19c1696a74318a5e4602c05b841880e7e6c3e527aa7a4f800fa3d5040046c095119c894a55a014083100cf254b3ea75f096f89702ea63300e02c2ceac430a85405ca81100328012a573122a63300d49e0b2e8e653a64ea02c3a05215280f420ca0241616975f51b98ad124d319bff4838dffc7fd5e0035e1ae8b0481fc335317181ecb3c813221c4004a82259fb8a4a86ffa1b53d2df66541640d5d03082cba052152817420ca044a85c4526d46cf6fbf2f55fa2dd2d0180121b2ce90ce49e98c1b391a90b8c23daefec2c0a80d220c4004ac4be696aa54b3e810c70dd0440f9705d0459629927503e841840c950b98ac9d0ae31bd8d40fa5b1ce600f8e654bb485b98484456a854054a89100328192a57918341bb09fb330014893d17982cd355d3bbc9730e281f420ca084c270e9bed1e0b1009347a00120370417c80b95aa407911620025b5b0b8d2b1bf8402e487400340e65c70d1936035d0e08e105c201754aa0265362d004ac9be417840e52a72d6b63f64b48d042e4423d00030b6d31317c67d6f11203f6acc2301505a4c62002546e52a3c41a001e0425c15811758e609941e2106506269e5aabb56c2924ff822322adbc77d7d466d2b805375a86d21b88007a85405ca8f100328b9f970655d551e0ae01ded8af6b7fb7df9fa2fd1ee9600a83c376d712cd3a10d2efe60838b352164874f98c2002a81100328392a57511a2a5bfd7eff6bae9d00d5f2de3511b7709ae7113c44a52a50158418400584e1d29ad1e0a900e531b876e2a634fe33dad91600a5f1deb4455b68ca4209a8e9df8da2bd4d01507a84184045b0e41325b76d4cffeb6399da669706e09f4fc31baddfc83f5699b6403951a90a54092106501161b8d2a67215d570b24bc37cc7d513a0186edaa227c16a104cfdb318b32a8416283135e676c46e26a0320831800a990f973755f58e0095f27641e894f422420d207b27a18506c1820e420b6d0950052cf3042a871003a8102a575113917dad16116a00e373d7433e927fb4092d507554aa02d5438801540c95aba81f37a9e1428dfed73d998ad8a901fcda9b9d16c1d482987e9bd00275a0461e45d1ceba00a814420ca06292cad5a90e0754d4d891b8f61323dff545b6a7e5d84d6b1c0950136fda43a41fb28813f535a8545de4fb3f503d8418400585e1f2aa517d2e004e44f689d735fdbe0d3682885a5754c93f85d7c369e9b599b200dea25215a82e420ca0a2a85c052eb46d54221b6cec1b09ba041b280317584c492f4c76590cbec7b784290be03d54aa0255468801541495abc058de99d8e02a0a8af2ce9590c1848571574242017021967902d546880154d87cb8fc4455ef09804bd0ae7bab974c6d98ef7a1274591e8aacb8b0e21ff251ebcd74859bac180416da1200a3a35215a83c420ca0c292259fd3af8451636012d2a90dd9376222237ac4e406ce425801e4c11ca5cb3cbb02a0b20831808aa37215c8dda01d45546dc061feea020e37bdf11bf9a54bc0516d6f838a7e4bc5b4de5e0331338415c0e451a90ad403210650030b8bcbaf3840035e48030e394a2638fa5db754b42f7ac4159572f834bcd1fa487e1904132a810d2af4f70415800f58e609d405210650032cf9044ae36dc821d295befc783ae8609a6372dc14c54f7265665a8e5b3a98a490190982dfabe80c2105e03f2a5581fa20c4006a82ca55a04a4c77b070545de8a147eeda8a48df051f472ef0707fe258a6bbff157ddf959a3a092502e9d9ffb8a9893498906066303de118d3b2ff65ffa36e6f10bb8380f2dadeefecdc1400b5408801d4843dd0b7d2259f006ac7851e8e26bf9e841f628edcb4c7e04f48ffe4cf1cb925a527ff4f3701d297a937bfbf223f1d653d0d7212389cfedfdc44c4c9c72e8078fb71907c1cc87fd3247c48c388c107e9afda1200b541a52a502f8418408db0e4130000540a95aa40ed0402a03602397e22c99d7b00008092335d95de2301502b8418408db81170357d1ef60000a0f4d4e806d74880fae13a0950432cf9040000e546a52a50574c620035a44698c6000000a5a5c67096016a8a1003a8a128dad916952d010000281b6336a3686f5300d41221065053da3f7e202cf904000025c3324fa0de0831809a728bb08c910d01000028093586659e40cd116200359654ae9aae00000078cf9d597a4f0440ad4d0980da8ae3f8a766a3f9a3a8ae0a000080c7d4980751d4d91600b546c52a002a57010080e7a8540590e03a09002a57010080d7d4e85d0100e13a090071d74a0ebab38de6c7aa7a430000007c62cce67eb4cb327200034c62001808a4b7ce924f0000e017d3a55215c069ecc400f046185e0f8d9a8e0000007840cdf162640900a4b84e02e08d383e889b8d866b2bb92500000005723bbba268ef2b018053083100bc238e0fbf6f36e65494b6120000508c24c0d8591700780f2106805f89e3836d820c00005004020c00e7612706803385e1f2aa517d6a3f9c110000808932476a820751f4725300e00c841800ce158661cbe8d40bfbeda2250000009311a939be1d45515700e01c8418008612862beb46cd1dc20c0000901d377da11b5c1f01302c766200184ab22763f66b23fab1aa8602000030b64178f12795debf46d1de37020043621203c0c8dc151391a06d34b8e77e2b000000c3d95623df891c3f89a2e8480060448418002ee524d0e88bb655f5f7f6cd8a0d359445a00000d49eb12185764535d27ecf0617bfd98ea2efbb0200974088016022c2f0464b0000402d1156009894ff0fe5084ef5a5047d8e0000000049454e44ae426082, 4);
INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(89, 'Andres', 'Mendoza', 'Flores', '1997-09-29', 2147483647, 'gringoevangelistadark@gmail.com', '2021-08-28', 'MEFA970929HDFNLN04', 'MEFA9709291Y2', '1234567891', 'ACTIVO', 1, 0x307866666438666665303030313034613436343934363030303130313030303030313030303130303030666664623030343330303032303130313031303130313032303130313031303230323032303230323034303330323032303230323035303430343033303430363035303630363036303530363036303630373039303830363037303930373036303630383062303830393061306130613061306130363038306230633062306130633039306130613061666664623030343330313032303230323032303230323035303330333035306130373036303730613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061306130613061666663303030313130383031613230323938303330313232303030323131303130333131303166666334303031663030303030313035303130313031303130313031303030303030303030303030303030303031303230333034303530363037303830393061306266666334303062353130303030323031303330333032303430333035303530343034303030303031376430313032303330303034313130353132323133313431303631333531363130373232373131343332383139316131303832333432623163313135353264316630323433333632373238323039306131363137313831393161323532363237323832393261333433353336333733383339336134333434343534363437343834393461353335343535353635373538353935613633363436353636363736383639366137333734373537363737373837393761383338343835383638373838383938613932393339343935393639373938393939616132613361346135613661376138613961616232623362346235623662376238623962616332633363346335633663376338633963616432643364346435643664376438643964616531653265336534653565366537653865396561663166326633663466356636663766386639666166666334303031663031303030333031303130313031303130313031303130313030303030303030303030303031303230333034303530363037303830393061306266666334303062353131303030323031303230343034303330343037303530343034303030313032373730303031303230333131303430353231333130363132343135313037363137313133323233323831303831343432393161316231633130393233333335326630313536323732643130613136323433346531323566313137313831393161323632373238323932613335333633373338333933613433343434353436343734383439346135333534353535363537353835393561363336343635363636373638363936613733373437353736373737383739376138323833383438353836383738383839386139323933393439353936393739383939396161326133613461356136613761386139616162326233623462356236623762386239626163326333633463356336633763386339636164326433643464356436643764386439646165326533653465356536653765386539656166326633663466356636663766386639666166666461303030633033303130303032313130333131303033663030666433306132386132626562306631633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861326234623436663036663862336334303836356431376333623762373638303766616338366439393937663363363239333934363261656438643236636364613262626564303366363666663839356163613039656565643664623466343237666535663237663962316561313530333765343731356438653864666232383638663163363864616666383965653635376365363435623438643633356661303264623866653335636433633665316139656632626661366136393161333532356430663130613339616661353663336636373866383533363230366664303165653065303864643731373732316366653030383166613536613639666630386265316136393837333662653062623032373966663030356630663962666630306131653662303936363734353663396665303638623062336561636639353866643238616661353765323035383763316166303765383866373365323466306265393438616561343437366630643963366233346137643133363830373365663930303761386166396236653165323932653234393230386236323333393238393963656431396530363762643734363162313166353834646138623436353532396662333736623863613238613262613463633238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323964313435326366326163333034346365656537306138386239323466613030336164303033363830306231646161333234663430326264323763306266623336373861376334353161656131653235393962346162373630306163366631366539396336376136646338643963373733636662353761663738336665313266383162633130383065386661333233346333303464643563666566323463386565303966626265626336326238366236336538643237363561626665626139626333306633393661663433633133633331663034626532333738613437393930363832663639313630316633623530303632303437623032333237663031356538626531636664393537343462363331636665323766313063623734373166336331366339653561363764333731323439316639316166356230333033313435373964353331663838613962336232663233616133383761373164663533396566306637633262663837646531373664666133663835616435356639633439326139393563376165313963393232626130313161326138353534303030313830303065393462343537316361353239336263396463643932346236306330316430353134353134383631353931653363663133316630366638343666626334636236396537396234383833326335626636656532343830333237623063396164376163656631363738373263376335646531656261663065366132363431306464323664373331333631383630383230386663343061613866326633326536643834656636643066393562633537653262643666633639616434626166366264373565363464323163326138653136333565636161336230316665373961636461656366653234376331326631346663336636333761313464663639653466313737306337636166313933626437396462646639633931656664616238636166613661353361353238326636376231653534393439346264656463323861323861643039306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386165636265313166633234643462653233656135663639623930663036393730336532653665343065356366356438396561376434663631663830333135326134323934316361356232326133313733393539313939653031663836666532366638383961383764393334346235646230613330313731373932663131633433666139663631636665316364376266376333616638333565313766383764303234643064626135646466653366373937663361303263306637643833663830373364623933646339616538623430663065653864653137643332336431663432623034623762373838363132333431666139336434393365613739616262356531363237313935326262623264323364626663636566613534323334663537616230653934353134353731396238353134353134303035313435313430303531343531343030353134353134303064393631386137386363353334366165616330383635363139303431656130643739306663353866643964323262623132663838626330333061633732663264333639613330313566663030656239666637346666623237383364623164326264383238616436393536613934323563643036343465396336613262333365333662386237396564323737623562393835613339323336326232323361653061393164343131346361666134626532646663313664323765323064626236613961376564623664353931376534396330663936366330653135663166346330336434376266346166396462353864316235356630666561333265393361643538343936643731306236316532393537303437626662386634323338333565663631623135306334343734646662316537353461353261366663386164343531343537343939383531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353030313632313534363439653830353030373435663063666531656561336631313763343839613464623636336237386630663762373338653233346366666538343761303166653036626539666430623434643337633362613534316133363933366162306462646263363132323435663431656265613466353237623961653666653062373830613166303237383332313832363835376564623736303464376166623038366463343730383733636663613065336562396635616562656265376631393838373565613539366362366666303033336431613134643432333765616332386132386165333337306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306165333365326666303063323662326638386661343839326434616331613935616139333662333931633337666433333666663634666166363363666138336439643135353039636139633934613265636431333238613932623333653339643433346662656432366661356433333532623636383665323037323933343465333035353837353135306437626366656431626630626133643662343936663163653866303835626262323866663030643331313431636364313761653364353739333966346366613061663036616661336333353738653232396633326466613965366435613665396361633134353134353665363631343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356435666331356630633237386137653233653966363933326162343536663237646136363536303038363534633163313037613832646234376533356361353761396665636135363331636465326564343666646231626131643363323238323366626365626365376237646466643662306335343963333066323662623161353235636435313233646534373465393435313435376364316561303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303064396132343961333331343862393536313836303762386166393562653238663834626665313039663162646636383731343435366463343965363561363562333938396239356537646261376531356635353961663037666461623664353233663135653939373630396463666137393436663463326239323366663030343233356466393735343731633437326634363865366334633666346566643866326261323861326264643338303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303262643662663634646666393066656166663030663565373166666538363662633936626437376636346238323536643633353962393062663232646234346163373364303936363233663931616535633666663030626163386436383766313531656466343531343537636539653938353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303133386564356531646662353934353238643733343739643930383436623539353535626434383631393166613866636562646336626336336636623866663030353961303766626237356666303062346162616630336665663531663966653436333838666531333363366138613238616661313363643061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061663635666439316330646661663963373662356666303064616235653335356563626662323339316266356631656436626666303062353662393331646665656232663937653636643433663861386636376132386132626537386634383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032626336336636623866663030353961303766626237356666303062346162643965626336336636623866663539613037666262373566666234616261663033666566353166396665343633383866653133336336613861323861666131336364306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306166366566643932643533666232623561393336386464663638383431333865373162356162633436626462666636346166663030393034366235666630303566353066663030653832643563373866663030663735393763626633333763336666313531656262343531343537636639653838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303537386337656437316665623334306666303037366562666630303639353762336437386337656437316665623334306666373665626666363935373565303766646561336633666338633731316663323637386435313435313566343237396131343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031356564666630306232353766633832333561666661666138376666303034313661663130616636666630306439326266653431316164376664376363336666303061306235373236336666303064643635663266636364663066663030633534376165643134353135663363376132313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135653331666235633766616364303366646462616666646135356563663565333166623563376661636430336664646261666630306461353564373831666630303761386663666632333163343766303939653335343531343537643039653638353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031643666633234663835643337633465643561653264356235316662326462356134346166336361613831393839363338353530303931643730373965643866376166373466383539663062616462653138646235653561646165616232356430626239313163393932333062623736383233623165376164373962666563396437663134376532306435623462366662663335396337326166643131383833666661313861663733616630663166353661666236373464626433343362663066303837323239373530613238613262636633613432386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326263656265336366633266663133376334383962343931653165333663303539616366653733356334613534363562636263303138303733663734643761326430343865666539356135326162326133336537386565383939633534653336363763383765323966306336616665306564373236663066656237303834623838303863656433393536303436343135336463316163666165663766363931626138326537653238346539303963393836643231343763306538373665656665343435373035356634393436366561353238633965656431653563643238636461343134353134353638343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343031653935666232636364316335663131616531316462303634643232343534316561376363386365336632303662653832616639616266363737626631363366313536633135613430616233633533343437323333396664643932303765363035376432613065373931643262633263633935623133376565393165383631396665656332386132386165303361303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032393039633733346234386330313163386131383166326666633730363537663861626163393436303437396561333230663766326437333563613536643763343862633137666630303130333561626135303330373534396330646137323038306534363766346163356166613861326164343632626339376534373933333737396230613238613262343234323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306462663836666138343161353738666234376266626136646231633761383435626462336430313630333366346536626562303433393561663864303132306534316337643262656163663836316532643866633662653061623164373436303438643136636238353037323536343566393562336638386338636636323262633863636539626263363766323362333062326465323734313435313435373934373630353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303533326536653232623538316565323737306138383835393938663630303634396137643731396631653763346631373836626531636465323839353936366265356662326462656465613462376465666137636131616161313037353236613262613933323661333136643966333535643465663733373332356334386535396134373263636337613932346537333531643134353764353165343835313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373739663031626532343565663833376335333136383933396466363161613563323435326131363033636237363231353634633965633333636662376432623833613932636565653762306263386166656435663663623034616232343664386538633065343166636562336162346533353639623862656135343234653332626133656338613261386638363735383866633431653165623264373232303032646464623234633030333963366535303731663835356561663937623335613333643635616130613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830316233346139303436643263383730616133323464376363666630303139626532376339663131376334303035393333326539623637393562343863663162633965623231316561373831386563303762396166373866386233616534396531636638373561623661623036376363356235333163363431653863653432303366383136636665313566326164376162393664323464626138666136383865346335346461623434323861323861663563653230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303365393766643965663530376266663030383533613737396137326430333462313732643965303438643866613730343537366235653364666232393738386663636233643462633264326361333331346162373330323165613433306461666630303830323133666566616166363131636437636465326133633938393932663366636366353238636239613961363134353134353733396130353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353037313833396130306632386664616162356637623466306464383738376132396330666236356431393235343164353931303766326362306663616263326162623866646131336334653965323366383931373130646262623138623465343136616130653731623937323563653366646532343765313563336437643136306139626137383638613764373566626366333262346239616133306132386132626138633832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130306538336531376638623866383233633666363361666239666463616338363362393037666537396230646163376630636537663061666161363039653162393831326532303935356533373530633865613732313831653834316166386462656235656535666233386663353231613964393266383066356362613032653264613366663030383937626262376661643863373534316565613361373763363764326263626363363833393266366231653962666131643538366138393365353637616435313435313565333964633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303135386665336366313535616638333763323737646532316239336665613231336535616533336239636630613366656661323262363039303361643738303765643164663132323366313236623462653066643236363264363961373461376564306530663132636664303866613266323365613466623161646630643435643761636133643361666131396435613861396331623363646165656561653266616561346264626239396134393636373266326262316535393839633932376631613865386132626539373633636230613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306139326365663265623466626138656661636137363861363835633363353232316331353630373230386138653861303066613762653061663865616666303065323037383330366166616134306139373130356331623739396434663132623261613964663863306336373737346165626162383466643963373466313635663062326365356438343335636366333461643935633766313935316635653134373335646464376363353735313864363932386564373364356136646238323663323861323861633862306132386132383030613238613238303061323861323830306132386132383030613238613238303339376638636261646464663837626531626561626139643834636631636332313538653339313361613937373534633866346662646437623537636238636363656335646438623132373234393339323464376432626662343239323365313365613938663538336666303034376135376364333565643635383937623136666363653063353566396437613035313435313565393163633134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303764346666303832643633623566383637613234373139323431623034363339663536663938666561366261356163626630343538376636363738336234616433636161383330653966306139306264333231303637663561643461663935396262643439336633376639396562343535613238323861323861393238323861323861303032386132386130303238613238613030323861323861303032386132386130306531666636386139653238376531336561303932333630636232633061383364346639616137663930333566333564376431626662346237666339326539626665626636316665363662653732616636663263666630303737376561636530633537663133653431343531343537613237333035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353462363536656437393739313561323130306362323261303237613032346532626134663834626630653236663839316532356665636639323437386163656464343439376233323065343265373835303761303237663930323762353762643639316630356265313936386336333936643763323536656432343766373565373636393065373230653765363237396533663061653363343633323964303763626262333661373432353531356661316434343638393134366231633661313535353430353535313830303532643134353763663965393035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303165376666303062346239316666306162653531666634666230666633333566333964376438336163363835613366383836636666303062336635636433613262613833373836663236373430636134386538373036626338666533633763313464303734386430646263356665306664336665636336646462333762366231363461333231323036663531666333386565303731386537386337336539653033313334653961663635326561663733393331313461353237636338663161613238613262643933383832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238303039333830323830336465626636353664316131623666303735663662333831653635643566656336336665636132306330666364646266336166353261653562653063663836366533633237663065656333346362636666303035636538363739393736653061623366636462346662383034306663326261396166393963343464353461663239326565376139343937326433343832386132386163346430323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326161366264363131656139613235653639643261613931373136623234363737616534373261343732336266356162373438643964613731343663656530663534376336396433386132626131663861376531323966633137653338626564316464356263613639346362366163633431646431333132343165336631316635303662396561666161383439346532613462613965343439333862623330613238613261383431343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313461616163656331313134393234653030303238303132626164663832356531303165333066383833363936663361383336663636376564353732303863656535343233306264306630353861383365643961623165313266383039663130626335306332353937346366656365383330306639626138323934323765386238646334653364383066376166363966383535663039373463663836333662336639313765663735373337363133636539396533306130366463663061303734316366373236623833313738626137306136653331373739333361323864313934613439623561316436616138353138303331346234353135653131653830353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430316535376662353037383339623531663065343165326562353839373765396566623265316262393839633830336562383663376664663436626331656265626666303031316538353635653236643065656234306434353439383265653136386534633735303038656133646331633166633262633433633564666232666630303861373462373936653763326237663136613130323863613433323765656536336339653366626164633633396338636661353761643831633535333835336636373337366563373165323238633963623961323866326661326165366235653166643666633339373766363064373734613965643236633634343733633635343931656133336436613964376161396136616538653364353362333061323861323938303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435373437653066663030383535653338663162623262653864613262616462623063666461656537663737313633643433316662646666303163643463613730383262633964393064323732373634386537326165653837653163643762633462373366363364303334386238626239303633373263313131366462396533323466343531656536626462336332316662326666303038363734623531373365326362663764346135323031313063373938613235336466613164636466613764326264326234636431373438643136643435386539316136343136643061663438653038383238666338353739643537333261373164323961626665343734633330623237663136383738623738343366363561643561656636646366386362353834623634323134386236623333626534663730353838646162653963366566663166353266306137633330663033663833313737363833613063353163623830316165363463626338373166656433363731663431383135643030303030633031343537396235373133356562376334663465633735343239343231623231303238313462343531353831613035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313865373334353134303135333535643066343864373664396163663538643361316239383964343836343961333063333037656264326263663363356466623331373834373536326637336531396262396234633930386532326536353862333866343237373066636662663461663465613262346137356161643237373833623131323834323762613365356566313766633136663838316530653632663739613333356435626530396662353538383332613031656638313935666334303165653662393461666232636161396561326239386631386663323066303237386434393962353564316432333963383230356364616532333933396366323438653162616537393036626431613539396235613534356633356665343733346630626663616366393665386166346666313866656363336532386432303962386630616466343761393435383237636137633437323866366534653162663331663461663338643466343864353734356239333637616265396233646163613339663265653232323837316562383364616264326137356539353635656533623963643238346530663534353761323861326235323032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613764626462356364653465623664363936656632633865373039316336613539393866623031633961663436663033666563643765326466313033323564663839653431613535623163333663363031613637353363663061306531376433653665343761353637353262353361326166333736326133303934646439323363646431316534373131633661353938396330353033323439616565336331356662336666303038656663356132336262626262356665636462333765376366626235663963386636386661396663373033646562646262633137663039376331316530363531323639336134616339373030393366366362396333636263666133363365353165633331356432383138313861663265616536353237613533353666333637356333306139376334636531626331626630303363303765313535346238623962316665643162613061303334643761303332653762393534653833663163396637616565323334353864303436383030303036303030336135326431356536636537336139326263396463653938633633313536343832386132386139323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030326138656239653162643066633462366336636235656432366465656532633163326366313836646239313832343165616137646337333537613861313336396464303334396133633862633635666232646539393736356165626331356161333561336530653264366566326631393365636333653635316638333537393566386237653164663863376331333337393765323164313235383930666464396434366638646266653034333866633361643764363334633965646130626138396130623938393634343735326165386562393063306635303437376165656135393835366137613462646535663866646537336366306630393661623433653336653964343531356634346638646266363731663035373839353565653734333866666232616538616531306462613066323439663738666663303861663233663162376331356631636638323561346238623864336665643936363837666533663264336536313866353635656162663838633762643761373437316234326236383964396639396362336131353230373235343530373833383334353735393838353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353737376630663365303166386237633661323364346235303433613736396563353466396233326665663235353233333934356566646239333831636631396539353964346162346539343739613665633534363132396262323437306430343133356363636236663664306234393233623035343864313732353839653830303164346437613466383162663636396631343662616339376265326339346539393661346534633433306433333866613734356663373931653935656264653036663835646531316630306461383564316234663064373035373663623762333631613539333966356337316634313861653863306330633061663261626536333239363934393562636365626137383634623539313831653064663836396530666630323432313334306432393136356462383762613930366539396665616466643036303536666431343537396232393461366566323737363735323439326430323861323861343330613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613432613066366135613238303338656631616663306566303237386366636362393937346666623164646338646238646464393030616363376265653166373562336466323333656635653364653335666439666263373565313335376263623262363161393561323634393936643031646561303766373933616634663463386166613461386165616133386361663437343465656262333331396430613733336533343230613932313831303431653431613461666137666337626630366263313965336334363965663663376563643738373138626562353031363433386665663736363166356537646562633537633766663032626336356530383266373931343166646131363262623866646136643530393331613865656562386639376633323338656235656235306336643161646133643166396666303039396339353238346531653638653261386132386165633330306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306162396130663837663538663133366137316538666131643834393733373132623030313233356365303634306463346636353139653439653035323638356131366162653235643536316431373435623436396565323736646138386266636339656330373733356634636663326666383566613366633336643163356264623031333565636133666432656630616530633837643030656361336433663133356339386163353437306631656564396235326134656133663233303365313766656366626131373834633433616366383934343737666139303031393534386363353033376662323366383866336434666137303035376133383030306330313435313565306434613935326163623961366565376131313834363061633832386132386138323832386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239313931356265663238333462343530303739386663356566383039613666383932313937356566303864623437366261386138326432343038626235326534663164376232623633323732303732376166613866303562616235623962316239376233626462373738613638396361633931346138353539313837353034316538366265633833633863353739383763376366383365396532356230376631366638373264336665323633366339666266383632346536653530376230666533313933636635323338663461663462303538633730393261373531653964316636666638303732643761303961653638656537383135313435313565643163323134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313435303031343531343530303134353134353030313435313561376530636431336665313234663136363964613131303461646435653436393236306666303030313366333765393961353236613331366662306432626262316565336662336237633339383363333765313935663134366131366330646665613531383734363635663961313834663261613366646566626337663066346166343861366132303538633436336130303030613735376362643561393261623531636535643466353631313530386134383238613238613832383238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303238613238613030323861323861303032386132386130303239306138323330343532643134303166333966656430626630663933633233653262666564616432656434323538366134346261616132363136323934376465343138653939666264663839663461663366616661376265333637383531336335376630663666616463343035653662353466623535623664656131643031336661616565316638643763633335656665303262336162343263663735613766393165373632323163393533346561313435313435373639383035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035313435313430303531343531343030353134353134303035373466663036626665346138363862666630303566396666623239613238616361626666303235653863613837633638666139363861323861663938336436306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830306132386132383030613238613238303233626330316163653530343634313864623230666432626533363164323861326264356361376564666338653263356634313638613238616635636534306132386132383030613238613238303061323861323830306132386132383030613238613238303061323861323830336666666439, 10);
INSERT INTO `t_empleados` (`id_empleados`, `nombre`, `apellidoP`, `apellidoM`, `fechaNacimiento`, `telefono`, `correo`, `fechaIngreso`, `curp`, `rfc`, `nss`, `estado`, `id_puesto_1`, `foto`, `id_departamento_2`) VALUES
(93, 'Jonathan', 'Cano', 'Lopez', '1991-11-26', 5244545, 'calidad@fmtor.com', '0000-00-00', 'CALJ911126HDFNPN02', 'CALJ911126T25', '08179112019', 'ACTIVO', 3, 0x89504e470d0a1a0a0000000d49484452000001c2000001c208060000007c18c9450000198649444154789ceddcdbb6d3c8920550d1a3ffff97773fd470170506d238e5581931e7a34b27ef525867e3f5edebebebeb0280a1fea77a0000504921046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d1feb77a00eff8f6ed5bf5106ef5f5f5553d046013cfab5cdfbe0e1c7df703f5a303b7e83f7edcaf4fcd67b5dfaaf1f1dcee7dabde5fcfab7c4715c26907ea47076dd5fffbd59edd3d97d57eabc6c773bbf7ad727f3dafceb9878ef91be1f443755de7adc1efc67be75c56fbad1a1fcfeddeb7cafd757ece5a83630a2100dce1884278d2378bbb590bc8e61efdd7296b7144210480bbc417c253be517cd2296bf2bb3f96dff987f4d57eabc6c773bbf7ad627f4fb9373fe98435892f849cedd903e7134566b5dfaaf1f1dcee7db3bfac88fff9c409df262a846f1b8ce479f55cfaf3eae8649955699be066017ec5f3eaf35a17c2b403f5f018d78403765d754921dd124afea46a1ee9fb71cafea69da78709cfab967f23fcfafa8a3d54df3b659cef7876f374feac4ad53c92d6fed4fd3de53970ca38ff46bb4278e2469d38e6155549219d124a5654cd237d3f4ed8df13effd13c7fc27ed0a2100bca255213cf99bcac963075e77f23d7ff2d89f69550801e0556d0a61876f281de6f0bdaaa4900e0925afa89a47fa7e24ef6fc2b9795787393cb4298464aa4a0a99965052358fa4b5efbcbfdcab4db24cf834964d9b2f7432edfeed32dfd63fa87fd5bbff543a7db3813e3caff65108af7dbf157ab4937ac0ba25719cae6afdba9c83f4f1dd65caf3ea9346ff8df0dbb76fb7fc60f6ae76dfd12989a383aaf5eb720ed2c7778749cfab4f1b5b08ab6ed60a9d92383aa85abf2ee7207d7c7798f4bcaa30b61002c0750d2d849ffce633f95b16f03ecfabfb8d2c8400f030ae10567ce3a9fe96d52189a393aaf5eb720ed2c7b7d3c4e755857185702a491c59aad6afcb39481f1f67f13bc241561f00bbafe3b9aaf5eb720ed2c7c739bc1102309a37c241d29338aac6372d69a5aadff4eb98cb1be110e9491c55e39b96b452d56ffa67cca6100e909ec45135be69492b55fda65f070a2100a32984008ca61002309a4238407a1247d5f8a625ad54f59b7e1d288443a42771548d6f5ad24a55bfe99f319bdf110e929ec45135be69492b55fda65fc75cde080118cd1be1201236de939e8c929eccb3bbbdf479700e6f844348d8784f520a4a52d24a7ad2cfee7ee9695c21acf89657fdcd52c2c67bd29351d2937976b7973e8f9d263eaf2a8c2b8400f0bd9185f093df78267ebb02f6f1bcbadfc84208000f630b61d58f8d2b48d8784f7a324a7a32cfeef6d2e7718749cfab0a630be175fdb3f1776cfe5dedbe43c2c67b925250929256d2937e76f75b69d2f3ead3be7d85afc0eabfdada318d77ff85d827c710be6d3092e7d57d7dddc90feabf93be59000f9e57fb288483a42794acea32beaa7ed31354ba9c53ce31fa6f8493a42794acea32beaa7ed31354ba9c53ced2a6107638dc77cd213da1645597f155f59b9ca0f2a7319c744e5754f7bf4387393cb4298400f0375a15c293bfa19c3c76e07527dff3278ffd99568510005ed5ae109ef84de5ee31a72794acea32beaa7ed31354ba9cd357785e65685708afeb9f8d3a61b33e39cef48492555dc657d56f7a824a9773fa0acfab7a6d92657e276d8a1de704f4bcb73bcee947237e50dff55b0cd08fe7d5e78d2884fc6377c286f6b4a73d3a68f937427eb63b61437bdad31e5dc41742dfca7ef6ea9aec4ed8d09ef6b4f79ce7d5cf4e5893f8420800773aa2109ef08de253ac0564738ffeeb94b538a21002c05d8e2984a77cb3b8d3dfaec1ee840ded694f7b7fdfe61427ad41fc0fea9f99f6afb9766d51fa3f37d79ef63ab5f7ab76bb3bb0a49c59081fba1fb083b706f881e755aea30b2100bc4bb2cc20abffd74f55c246d5ffd5957edd6e55e39bd62fe738e61fcbf09ed5e48caa848daaa490f4cf76ab1adfb47e398b4238c06a72c6eec48e55554921e9d7ed5635be69fd721e851080d114420046530801184d211c603539e38e848d15554921e9d7ed5635be69fd721e8570886737f43b9fedb6bbdfddf3adfa6cb7aaf14deb97b3f8413d00a379230460b4a39265d21327ba248ff05c97fd3825ac7a57bf5dc6e7f9729f63de08d31327ba248ff05c97fda8ba8f764bbf8f929e1149eb92ea8842989e38d1257984e7baec47d57db45bfa7d94fedce8729e773aa21002c05d1442004653080118ed8842989e38d1257984e7baec47d57db45bfa7d94fedce8729e773aa2105e577ee24497e4119eebb21f55f7d16ee9f751d23322695d5249960160b463de0801e00e926516da4b4fe2484f92484fcee8b21fd3dadbdd6ffa75abd2db4b74cc1b617ab2ccee7e77b72761236b7fbb9cabaaf676f79bfed9aaf4f6521d5108d3936576f7bbbb3d091bef5db72abddf2eededee37fdba55e9ed253ba21002c05d1442004653080118ed8842989e2cb3bbdfdded49d878efba55e9fd76696f77bfe9d7ad4a6f2fd91185f0baf2936576f7bbbb3d091b59fbdbe55c55b5b7bbdff4cf56a5b7974ab20c00a31df346080077382a5966b7f42489f4c4982ae949305d923da6f5bb2afdbcacea328f1dc6be1126a546242553a44b4f82e992ec31addf55e9e765559779ec32b210a62749a427c654494f82e992ec31addf55e9e765559779ec34b21002c0834208c0680a2100a38d2c84e94912e9893155d29360ba247b4ceb7755fa7959d5651e3b8d2c84d795951a91944c912e3d09a64bb2c7b47e57a59f97555de6b18b641900461bfb460800d7d53459263dd94392c4679847d6fe4e5be7aa7ed39f2f89dabd11a6277b4892f80cf3c8dadf69eb5cd56ffaf32555ab42989eec2149e233cce333d7ad9ab6ce55fda63f5f92b52a8400f02a851080d1144200466b5508d3933d24497c86797ce6ba55d3d6b9aadff4e74bb25685f0baf2933d24497c867964edefb475aeea37fdf9924ab20c00a3b57b230480578c4e96999610316d7cbbfbedd25e55bf5d9251d2af5b953ebe4f6af7462821e2b969e3dbdd6f97f6aafaed928c92fed9aaf4f17d5aab422821e2f5ff4dc7f1edeeb74b7b55fd76494649bf6e55faf82ab42a8400f02a851080d1144200466b55082544bcfebfe938beddfd7669afaadf2ec928e9d7ad4a1f5f855685f0ba2444fccab4f1edeeb74b7b55fd76494649ff6c55faf83e4db20c00a3b57b230480578c4e96a96a6f9a2e0916e9fda68f2f5d7ac24b95f4f1edd0ee8db04bb247175d122cd2fb4d1f5fbaf484972ae9e3dba55521ec92ecd14597048bf47ed3c7972e3de1a54afaf8766a550801e0550a2100a32984008cd6aa107649f6e8a24b82457abfe9e34b979ef052257d7c3bb52a84d7d527d9a38b2e0916e9fda68f2f5d7ac24b95f4f1ed22590680d1dabd1102c02b8e4a96494f7e48bf6e559779ac4a5fe72ae9e35b957e9ed3efa3f4fb778763de08d3931fd23f5b9534e6a46414892259e35b957476933e5b957effee7244214c4f7e48bf6e559779ac4a5fe72ae9e35b957e9ed3efa3f4fb77a7230a2100dc4521046034851080d18e2884e9c90fe9d7adea328f55e9eb5c257d7cabd2cf73fa7d947effee744421bcaefce487f4cf56258d39291945a248d6f856259ddda4cf56a5dfbfbb48960160b463de0801e00e2d9365782e3dc16237f395cc73c775abd2c7b72afddcef70cc1be1e9c905d5d2132c76335fc93c777cb62a7d7cabd2cffd2e4714c20ec90595d2132c7633dfb5fff6a97ed3134fa68d6f55fab9dfe98842080077510801184d210460b4230a6187e4824ae90916bb99efda7ffb54bfe98927d3c6b72afddcef744421bcaef3930baaa52758ec66be9279eef86c55faf856a59ffb5d24cb0030da316f84007087a3926556552544ec6eaf4ba24397648fddd2e79b7e1fed96be7ebb7599c70eedde08ab122276b7d725d1a14bb2c76ee9f34dbf8f764b5fbfddbacc63975685b02a2162777b5d121dba247bec963edff4fb68b7f4f5dbadcb3c766a550801e0550a2100a32984008cd6aa10562544ec6eaf4ba24397648fddd2e79b7e1fed96be7ebb7599c74ead0ae175d52544ec6eaf4ba24397648fddd2e79b7e1fed96be7ebb7599c72e92650018addd1b2100bce2a86499aae487f40486f4f1ad9a96b4c2735df6cdf8ce71cc1b6155f2437a0243faf8564d4b5ae1b92efb667c6739a21056253fa42730a48f6fd5b4a4159eebb26fc6779e230a2100dc4521046034851080d18e288455c90fe9090ce9e35b352d6985e7baec9bf19de78842785d75c90fe9090ce9e35b352d6985e7baec9bf19d45b20c00a31df346080077382a59669a2ec90f55893155aaf62d3d51c97559f76f9779ece08d305497e487aac4982a55fb96949ee4b3fcfbb7cb3c7651080375497ea84a8ca952b56fe9894aae7befbaddbacc6327851080d114420046530801184d210cd425f9a12a31a64ad5bea5272ab9eebdeb76eb328f9d14c2505d921faa1263aa54ed5b527a92cff2efdf2ef3d845b20c00a379230460b4a39265ba247654999660312dd16655fa3aef967e0eac73bd63de08bb247654999660312dd16655fa3aef967e0eac7386230a6197c48e2ad3122ca625daac4a5fe7ddd2cf8175ce7144210480bb2884008ca6100230da1185b04b624795690916d3126d56a5aff36ee9e7c03ae738a2105e579fc48e2ad3122ca625daac4a5fe7ddd2cf8175ce20590680d18e792304803b1c952cb32a3d496277bfe9492be9f3e0b969e76a55977edd47ff6af746989e24b1bbdff4a495f479f0dcb473b5aa4bbfeea3ff6a5508d3932476f79b9eb4923e0f9e9b76ae5675e9d77df4b3568510005ea51002309a4208c068ad0a617a92c4ee7ed39356d2e7c173d3ced5aa2efdba8f7ed6aa105e577e92c4ee7ed39356d2e7c173d3ced5aa2efdba8ffe4bb20c00a3b57b23048057489629909e7c939e4c312dd9233d5124bdbdddfd4e7bbe4cd0ee8d303d31213df9263d99625ab2477aa2487a7bbbfb9df67c99a255214c4f4c484fbe494fa69896ec919e2892dedeee7ea73d5f2669550801e0550a2100a32984008cd6aa10a62726a427dfa427534c4bf6484f14496f6f77bfd39e2f93b42a84d7959f98909e7c939e4c312dd9233d5124bdbdddfd4e7bbe4c21590680d1dabd1102c02b8e4a96494f0ad92d7d7cbba5af73557bbbfb4d3f2f9274ce9c6ffab9fa9d63de08d39342764b1fdf6ee9eb5cd5deee7ed3cf8b249d33e79b7eaefee48842989e14b25bfaf8764b5fe7aaf676f79b7e5e24e93cff6fe9f34d3f572b8e2884007017851080d1144200463ba210a62785ec963ebeddd2d7b9aabdddfda69f17493acfff5bfa7cd3cfd58a230ae175e52785ec963ebeddd2d7b9aabdddfda69f17493a67ce37fd5cfd89641900463be68d1000ee7054b2cc6e131213be27f1e4b9aa648f69d7ad720eb2ee8f55e9e3fb9db16f845312131e249e3c5795ec31edb355ce41d6fdb12a7d7c7f32b2104e4a4cb82e89277fd3f69dc91ed3ae5be51cbc775d95f4f1ad18590801e04121046034851080d14616c2498909d725f1e46fdabe33d963da75ab9c83f7aeab923ebe15230be175cd494c789078f25c55b2c7b4cf56390759f7c7aaf4f1fd89641900461bfb460800d77558b24c7ae2c4b47eab1245d2d725bddff4f676f7db657ce9f79b64990f484f9c98d66f55a248fabaa4f79bdedeee7ebb8c2ffd7e932cf301e98913d3faad4a14495f97f47ed3dbdbdd6f97f1a5df6f926500e0700a2100a32984008c7644214c4f9c98d66f55a248fabaa4f79bdedeee7ebb8c2ffd7e932cf341e98913d3faad4a14495f97f47ed3dbdbdd6f97f1a5df6f926500e060c7bc1102c01d5a26cb744992d8dd6f9569fbb16a5a5248fa3aa79f9755e9e34b74cc1b617ac2417a42449569fbb16a5a5248fa3aa79f9755e9e34b7544214c4f38484f88a8326d3f564d4b0a495fe7f4f3b22a7d7cc98e2884007017851080d1144200463ba210a6271ca427445499b61faba62585a4af73fa7959953ebe644714c2ebca4f38484f88a8326d3f564d4b0a495fe7f4f3b22a7d7ca924cb0030da316f8400708796c93255fd76490ab1ce67ae4b557bbb75195ffa3c564d98ef316f845d9229aafa4d4fcee8b2cebb75497859d5657ce9f3583565be4714c22ec91455fda627677459e7ddba24bcacea32bef479ac9a34df230a2100dc4521046034851080d18e28845d9229aafa4d4fcee8b2cebb75497859d5657ce9f3583569be4714c2ebea934c51d56f7a72469775dead4bc2cbaa2ee34b9fc7aa29f3952c03c068c7bc1102c01d24cb6c943ebe555d9224cc232b61a84b7b5d1286f8d7316f84e9c905e9e35bd52549c23cb21286bab4d7256188ff3aa210a62717a48f6f55972409f3f8cc75abbab4d72561889f1d510801e02e0a2100a32984008c7644214c4f2e481fdfaa2e4912e6f199eb567569af4bc2103f3ba2105e577e7241faf856754992308fac84a12eed754918e2bf24cb0030da316f84007007c93283faed9228b25bfa7c9dbfac739a7eddaaf4f17dd2316f84d3121dba2467a42762a4cfd7f9cb3aa7e99fad4a1fdfa71d5108a7253a7449ce484fc4489faff3f7de75abd2137cbacc37d911851000eea21002309a4208c0684714c269890e5d9233d21331d2e7ebfcbd77ddaaf4049f2ef34d764421bcae79890e5d9233d21331d2e7ebfc659dd3f4cf56a58fefd324cb0030da316f84007087a39265784f7a42447ad2457ab24795f479a48f6f55977924f24638447a42447ad2457ab24795f479a48f6f559779a4520807484f88484fba484ff6a8923e8ff4f1adea328f640a2100a32984008ca61002309a4238407a42447ad2457ab24795f479a48f6f55977924530887484f88484fba484ff6a8923e8ff4f1adea328f5492650018ede81fd477ff27c1bea300dcefc842d8bd003e3ce6995a10d3132cd29338baac5f175d928876b7977e1fed70d4ff353aa500fe4ad256fd6a2f52c6b83abeaa797459bf2e76cfb74b7be9f7d12ec7fc6399e945f0ba72d6203dc1223d89a3cbfa75d1258968777be9f7d14ec7144200b8c31185f0946f159f602d00f63aa21002c05de20ba137a09f55af497a82457a124797f5eba24b12d1eef6d2efa39de20b2199d2132cd29338baac5f175d928876b7977e1fed12fff389eab79f54e1db06708c237f50ffaab4a2a1b803e4685d08d30ae0c3635c9f2e8892299e4b4fc4485fbf2ae9c92dbb559d8309e7afe5df08bfbebe8ed8844f8ef359d17da710afb6b7fbb3ddaafa5d95be7e55aace7395aa7330e5fcb52b842714c01f55c579fde9bfbddb5e7a32457a2246fafa55494f6ed9adea1c4c3a7fed0a2100bca255213cf16df0e1e4b1039cac5521048057b529841ddea8ee9a83648ad7db4e384fe9eb57253db965b7aa7330e9fcb52984fc9e648ae7d21331d2d7af4a7a72cb6e55e760caf96b932c133e8d65d3e60b50adf50fea5ff5ee3ff5559c00cea3105efb7eebf26827b520a627714c4bc4a84ae649bf6eb7f4f9a627c654b5f749a3ff46f8eddbb75b7ef07957bbef484fe29896885195cc93fed96e49734b5abff4f63e6d6c21acba092ba427714c4bc4a84ae649bf6eb7f4f9a627c654b557616c210480eb1a5a083ff92de5946f4400538d2c8400f030ae1056bca155bf15a627714c4bc4a84ae649bf6eb7f4f9a627c654b557615c219c2a3d89635a224655324ffa67bb25cd2d69fdd2dbfbb471c932556f67bbc717be6d00c7f04608c068926506494fbaa8625db2486ef94c7be9fd7e9237c221d2932eaa58972c49292d49492be9c93ca7530807484fbaa8625db2486ef94c7be9fd56500801184d21046034851080d114c201d2932eaa58972c925b3ed35e7abf1514c221d2932eaa58972c49292d49492be9c93ca7932cf321926500327923046034c9328348e2e8fd169dbe6fd3cedf3427af9f37c2212471f4fb11f0f7d2f76ddaf99be6f4f51b57082bbea5547f3392c4f15e7be9d2f76ddaf99ba6c3fa8d2b8400f0bd9185f0936f68d56f8300fcdec84208000f630b61d58f512b48e278afbd74e9fb36edfc4dd361fdc616c2ebfa6793eed8a8bbda7d87248e736ecabf91be6fd3cedf34a7afdfb864991d7d258c217cdb008ee107f5df515c00e65108f9c9c90911df933cf25c7ac2cbaa690934e9e72f7d7cbf33fa6f84fcecf4848807c923cfa527bcac9a9640937efed2c7f7276d0ae1498bfe2bd573e89010715d92477e253de165d5b4049af4f3973ebe156d0a2100fc8d5685f0946f1fcf9c3c768093b52a8400f0aa7685f0c437ab9431774888b82ec923bf929ef0b26a5a024dfaf94b1fdf8a7685f0bafe292c29c5e57712c7797a42c483e491e7d2135e564d4ba0493f7fe9e3fb9336c932bf9336c58e730238d5881fd4a7bd750190634421e41f92383e338f931336be579540939e7c93deefeef6269cfb967f23e46792383e338fd313361eaa1268d2936fd2fbddddde94731f5f084ffa56f129afae89248ef7fa4d4f5ad9ad2a81263df926bddfdded4d3af7f1851000ee744421f456f82f6b01b0d711851000ee724c21f426f4f76b2089e3bd7ed3935676ab4aa0494fbe49ef77777b93ce7dfc0fea9f39e50fb0bbecdaa22effecbbaadf09ff8cfc7be93f77483fcfe9f751fa3a7fd29185f0a17b413c786b008e71f40fea150a00de75ccdf0801e00e0a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008cf67f393f8e46be3097940000000049454e44ae426082, 2),
(94, 'Lizbeth', 'Carbajal', 'Santos', '1998-09-28', 505050, 'calidad@fmtor.com', '0000-00-00', 'CASL980928MDFRNZ07', '0', '62169826476', 'ACTIVA', 1, 0x89504e470d0a1a0a0000000d49484452000001c2000001c208060000007c18c9450000195649444154789ceddddb72db4a9205507862feff97350f0ec5f1d8b454340bac9d996b3db2d1750792688bbb7f7c7c7c7c5c0030d4ff9c1e00009ca41002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c068ff7b7a00aff8f1e3c7e921dceae3e3e3f410804d3caf72fdf82838faee07ea7705b7a8a5dfcf9d7db9c7ea3aefbeee2e9e57f94a15c26907ea7785b6aa9dbf9d3d7bb2d7ea3aefbeee0e9e5775ee8d32ff4638fd505d973538e5ab75b727fbacaef3eeebeee05cd45a8332851000ee50a21056fa6671376b01d9dca3ffa9b216250a2100dc25be1056f946f14ed6e4bdbefa47ff4a7f10906e759d775fb7937bf34f15d624be104282470f4e4570bfd575defd19b395fe413dbc9307e87bacaef3eeeb986b44214cbb112afc4f05c0199e57efd7ba10a61da84f9fe39a70c09e712a51e474f2c82ea7e69bbe6f55ce41eab99bf0bc6af96f841f1f1fb187ea5755c6f90e8f6eb2a4cfd29d9a6fd21e553d07559e0355c6f92fda15c28a1b5571cc3b9d4a14e99218736abee9fb56e11c54bcf72b8ef93bed0a21003ca35521acfc4da5f2d881e755bee72b8ffd91568510009ed5a61076f886d2610effe254a24897c49853f34ddfb7e47350e97cfd4d87397c6a5308a9ed54a24897e49153f34dda23e7807f15ff7fccbbfa575be1d358366dbed0c9b4fbb7cb7c5bffa0fe59affea974fa66037d785eeda3105efb7e2bf4d94eea019b9ad891ead4ba74d9dff4f1dd65caf3ea9d46ff1be18f1f3f6ef9c1ec5dedbe22299d236d6d4e38b52e5df6377d7c7798f4bc7ab7b185f0d4cd7ac2c4c48e64a7d6a5cbfea68fef0e939e57278c2d8400705d430be13bbff94cfe9605bccef3ea7e230b21007c1a57084f7ce339fd2d6b52624705a7d6a5cbfea68f6fa789cfab13c615c2a992d239aa3c84ee746a5dbaec6ffaf8a8c5ef0807597d009cba6e9a53ebd2657fd3c7471dde080118cd1be120a792382499648def54bfe9d7319737c2214e25714832c91adfa97ed33f633685708053491c924cd6da78557abfe9d7814208c0680a2100a32984008ca6100e702a894392c95a1baf4aef37fd3a5008873895c421c9246b7ca7fa4dff8cd9fc8e709053491c924cde23bddff4eb98cb1b2100a379231ca44bc2860495aca495f424a2ddfdd28f37c221ba246c4850c94a5a494f22dadd2f3d8d2b8427bee59dfe66d925614382ca7bae5b959e44b4bbdf13263eaf4e18570801e057230be13bbff14cfc7605ece37975bf918510003e8d2d84a77e6c7c4297840d092aefb96e557a12d1ee7e4f9af4bc3a616c21bcae9f1b7fc7e6dfd5ee2bba246c4850c94a5a494f22daddef49939e57eff6e3237c0556ff6a6bc7345efd0bb1778e217cdb6024cfabfbfaba931fd4ff227db3003e795eeda3100e929e50b25b7a02cda97ebbec5b97f972dee87f239c243da164b7f4049a53fd76d9b72ef325439b42d8e170df3587f48492ddd213684ef5db65df3accf774ff3b7498c3a736851000fe45ab4258f91b4ae5b103cfab7ccf571efb23ad0a21003cab5d21acf84de5ee31a72794ec969e4073aadf2efbd665bed7e57995a25d21bcae9f1b5561b3de39cef48492ddd213684ef5db65dfbaccf7ba3caf12b44996f94ada143bce09e8796f779cd3ef46fca0beebb718a01fcfabf71b5108f96977c286f6b4a73d3a68f96f84fc6977c286f6b4a73dba882f84be95fde9d935d99db0a13ded69ef31cfab3f555893f8420800772a51082b7ca378176b01d9dca3ffa9b216250a2100dca54c21acf2cde24effba06bb1336b4a73dedfd7b9b53545a83f81fd43f32edafb9766d51fa9f9b6b4f7b9ddafb5bbbdd152c29350be1a7ee07acf0d600bff1bcca55ba1002c0ab24cb0c92fe3f259d6a2ffdbadd4e8d6f5abfd451e68f65784d7a12c7a9f6d23fdbedd4f8a6f54b2d0ae100c9491c27db4bbf6eb753e39bd62ff52884008ca61002309a4208c0680ae100e9491ca7da4bbf6eb753e39bd62ff52884433cbaa15fb9c9bbb497fed96ea7c637ad5f6af1837a0046f34608c068a59265d21327ba248facea922c73aabd53baac4bfa7d94fedce8729e7728f346989e38d12579645597649953ed9dd2655dd2efa3a46744d2baa42a5108d31327ba248facea922c73aabd53baac4bfa7d94fedce8729e772a510801e02e0a2100a32984008c56a210a6274e74491e59d52559e6547ba7745997f4fb28fdb9d1e53cef54a2105e577ee24497e491555d92654eb5774a977549bf8f929e1149eb924ab20c00a395792304803b4896d9d8dea97ed3e7d1e5ba55e9fd76696f77bfe9e3ebd25ea2326f84d312314eb5b7bbdf2e9fad4aefb74b7bbbfb4d1f5f97f652952884d312314eb5b7bbdf2ed7ad4aefb74b7bbbfb4d1f5f97f692952884007017851080d1144200462b5108a725629c6a6f77bf5dae5b95de6f97f676f79b3ebe2eed252b5108af6b5e22c6a9f676f7dbe5b355e9fd76696f77bfe9e3ebd25e2ac932008c56e68d1000ee502a59e694698927bba5cfc3bee9f719e9e765559779ece08df01b49e926151322d2e761dff4fb8cf4f3b2aacb3c765108bf302df164b7f479d837fd3e23fdbcacea328f9d14420046530801184d2104603485f00bd3124f764b9f877dd3ef33d2cfcbaa2ef3d84921fc4652ba49c58488f479d837fd3e23fdbcacea328f5d24cb00309a374200466b992c939e84909e3c322d49273d1163da7e9c92be2ee9e7397d7fbfd2ee8d303d09213d7924293527691ea724ad7dd239dd2d7d5dd2cf73fafe7ea755214c4f42484f1e9996a4939e88316d3f4e495f97f4f39cbebf2b5a15420078964208c0680a2100a3b52a84e94908e9c923d39274d21331a6edc729e9eb927e9ed3f77745ab42785df94908e9c92349a93949f3382569ed93cee96ee9eb927e9ed3f7f73b92650018addd1b21003c43b2ccc275a7fa35beac7ebbb477aadf2ec928e9d7ad4a1fdf3bb57b239410f1d8b4f1edeeb74b7ba7faed928c92fed9aaf4f1bd5bab422821e2f9ff4ec7f1edeeb74b7ba7faed928c927eddaaf4f19dd0aa1002c0b31442004653080118ad55219410f1fc7fa7e3f876f7dba5bd53fd76494649bf6e55faf84e685508af4b42c4df4c1bdfee7ebbb477aadf2ec928e99fad4a1fdfbb49960160b4766f8400f08c52c932e9090c5d48b0782cbddff4f1a5f37c792c7d7c3b9479234c4f60e84282c563e9fda68f2f9de7cb63e9e3dba544214c4f60e84282c5f36d27f49b3ebe749e2fcf8f21617c3b952884007017851080d1144200462b5108d31318ba9060f17cdb09fda68f2f9de7cbf3634818df4e250ae175e527307421c1e2b1f47ed3c797cef3e5b1f4f1ed22590680d1cabc1102c01d5a26cb9cea37fdba53d2e72151e4b1f4f1ad9a76fed293a1129579234c4fce48ffec94f4794814792c7d7caba69dbff464a854250a617a7246fa75a7a4cf43a2c8f3634818dfaa69e72f3d192a598942080077510801184d210460b41285303d3923fdba53d2e72151e4f931248c6fd5b4f3979e0c95ac4421bcaefce48cf4cf4e499f874491c7d2c7b76adaf94b4f864a25590680d1cabc1102c01d5a26cb544e38b853976414c9198fa5ef47fabe4d5bbf55e9e77e87326f8453120eeed225194572c663e9fb91be6fd3d66f55fab9dfa544219c947070872ec92892339e1f43c27ea4efdbb4f55b957eee772a510801e02e0a2100a32984008c56a2104e4a38b843976414c919cf8f21613fd2f76ddafaad4a3ff73b952884d73527e1e02e5d925124673c96be1fe9fb366dfd56a59ffb5d24cb00305a99374200b843cb649953ba24b7ac3a95ec312d5164777be94930a7a4afdf6e5de6b1439937c2f484832ec92dab4e257b4c4b14d9dd5e7a12cc29e9ebb75b9779ec52a210a6271c74496e59752ad9635aa2c8eef6d293604e495fbfddbacc63a712851000eea21002309a4208c068250a617ac24197e49655a7923da6258aec6e2f3d09e694f4f5dbadcb3c762a5108af2b3fe1a04b72cbaa53c91ed3124576b7979e04734afafaedd6651ebb48960160b4326f8400708796c932e949215d123bd2e7312d29a48bf47d4b1fdfaaf4f1bd539937c2f4248469891de9f3989614d245fabea58f6f55faf8dead44214c4f429896d8913e8f6949215da4ef5bfaf856a58fef8412851000eea21002309a4208c068250a617a12c2b4c48ef4794c4b0ae9227ddfd2c7b72a7d7c27942884d7959f84302db1237d1ed39242ba48dfb7f4f1ad4a1fdfbb49960160b4326f8400708752c932a774497e489fc7a9f6769b9678e2badef765fa3c76f046f88d2ec90fe9f338d5de6ed3124f7cd6fbbe4c9fc72e0ae117ba243fa4cfe3547bbb4d4b3c71dd7baedbadcb3c76520801184d21046034851080d114c22f74497e489fc7a9f6769b9678e2baf75cb75b9779eca4107ea34bf243fa3c4eb5b7dbb4c4139ff5be2fd3e7b18b64190046f34608c068a59265d2931fd29315ba8c2f3db9255dfa3aef967e0eacf37965de0893521e2a262b74195f7a724bbaf475de2dfd1c58e70c250a617af2437ab24297f1a527b7a44b5fe7ddd2cf8175ce51a21002c05d1442004653080118ad44214c4f7e484f56e832bef4e49674e9ebbc5bfa39b0ce394a14c2ebca4a79a898acd0657ce9c92de9d2d779b7f473609d3348960160b4326f8400708752c932abba2467a4cf43c2466fe9e7aacbf84ef5eb3efa4fbb37c22ec919e9f390b0d15bfab9ea32be53fdba8ffebf5685b04b7246fa3c246cf4967eaeba8cef54bfeea33fb52a8400f02c851080d1144200466b5508bb2467a4cf43c2466fe9e7aacbf84ef5eb3efa53ab42785d7d9233d2e72161a3b7f473d5657ca7fa751ffd7f92650018addd1b21003ca354b24c97c484f484972efd7649f6484f14496f6f77bfd39e2f13947923ec9298909ef0d2a5df2ec91ee98922e9ededee77daf3658a1285b04b62427ac24b977ebb247ba4278aa4b7b7bbdf69cf97494a144200b88b4208c0680a2100a39528845d1213d2135ebaf4db25d9233d5124bdbdddfd4e7bbe4c52a2105e579fc484f484972efd7649f6484f14496f6f77bfd39e2f5348960160b4326f8400708752c932abd2133bd293424ee9b27e92515e93bebfaba69de7f473f595766f8449e91c499fa54b5a2bc928e7a4efefaaa4b39b94a894aa55214c4fec484f0a39a5cbfa4946794dfafeae9a769ed3cfd58a568510009ea51002309a4208c068ad0a617a62477a52c8295dd64f32ca6bd2f777d5b4f39c7eae56b42a84d79595ce91f459baa4b5928c724efafeae4a3abbef38cfe9e7ea3b92650018addd1b21003ca354b28cc484d7a4af9f0490ded7ad720eb2ee8f55e9e3fb4a9937428909af495f3f0920bd3f5be51c64dd1fabd2c7f79d12855062c26bd2d74f0248efeb563907af5d774afaf856942884007017851080d1144200462b51082526bc267dfd2480f4be6e9573f0da75a7a48f6f458942785d12135e95be7e12407a7fb6ca39c8ba3f56a58fef3b92650018adcc1b2100dc6174b2cc29e9891dd3d6f9547ba7fa4d6f6f77bf5dc697fe3ca8fcdc28f346583db9e0537a62c7b4753ed5dea97ed3dbdbdd6f97f1a53f0faa3f374a14c20ec905d7959fd8316d9d4fb577aadff4f676f7db657ce9cf830ecf8d12851000eea21002309a4208c068250a6187e482ebca4fec98b6cea7da3bd56f7a7bbbfbed32bef4e74187e7468942785df5930b3ea527764c5be753ed9dea37bdbdddfd76195ffaf3a0fa7343b20c00a395792304803b8c4e96496f6fb7f4848d53fda68f6f777be94926bba5afcb6ee9e34b54e68d303d11233d59213d61e354bfe9e3dbdd5e7a92c96ee9ebb25bfaf852952884e98918e9c90ae9091ba7fa4d1fdfeef6d2934c764b5f97ddd2c797ac44210480bb2884008ca61002305a8942989e88919eac909eb071aadff4f1ed6e2f3dc964b7f475d92d7d7cc94a14c2ebca4fc4484f56484fd838d56ffaf876b7979e64b25bfabaec963ebe5492650018adcc1b2100dc6174b2cc6ee9491ce989225dc6b75bfab9daadcbf8d2e7b16ac27ccbbc11a62726a42771a4278a7419df6ee9e76ab72ee34b9fc7aa29f32d5108d31313d29338d21345ba8c6fb7f473b55b97f1a5cf63d5a4f9962884007017851080d1144200462b5108d31313d29338d21345ba8c6fb7f473b55b97f1a5cf63d5a4f9962884d7959f98909ec4919e28d2657cbba59fabddba8c2f7d1eaba6cc57b20c00a395792304803b4896d9685af2487ae244faf8569dda8ff4449bf473bf5bfa39adaccc1b617a72c1b4e491f4c489f4f1ad3ab51fe98936e9e77eb7f4735a5d8942989e5c302d79243d71227d7cab4eed477aa24dfab9df2dfd9c7650a21002c05d1442004653080118ad44214c4f2e98963c929e38913ebe55a7f6233dd126fddcef967e4e3b285108af2b3fb9605af2487ae244faf8569dda8ff4449bf473bf5bfa39ad4eb20c00a395792304803b8c4e96e99224919e2892ae4be2c96ee9f75b97f14d9b6fa2326f849224b23eeba24be2c96ee9f75b97f14d9b6faa12855092c4e3ff2c3d51245d97c493ddd2efb72ee39b36df64250a2100dc4521046034851080d14a144249128fffb3f44491745d124f764bbfdfba8c6fda7c93952884d7254922edb32eba249eec967ebf7519dfb4f9a6922c03c06865de0801e00ea59265784d7a42447ad2457ab2c729e9f3481fdfaa2ef348e48d7088f48488f4a48bf4648f53d2e7913ebe555de6914a211c203d21223de9223dd9e394f479a48f6f55977924530801184d21046034851080d114c201d21322d2932ed2933d4e499f47faf85675994732857088f48488f4a48bf4648f53d2e7913ebe555de6914ab20c00a395fe417df73f09f61d05e07e250b61f702f8e9739e0ae2bdd2134f4e491fdf6e5d928876b73721d1a6d4ff343aa500fe4da1ad2ae36f67eaeeb53ed5efaaf4f1edb67bbe5ddadb7d5daa327f2c33bd085e9735d82d3df1e494f4f1edd6258968777b93126dca144200b843894258e55bc53b580b80bd4a144200b84b7c21f406f4276bb2477ae2c929e9e3dbad4b12d1eef62625dac41742b8537ae2c929e9e3dbad4b12d1eef6a624dac4ff7cc2dbcf63e1db065046c91fd43f2bad6828ee00395a17c2b402f8e9735cef2e88a71222d29329d21331d2d7ef94f4e496dddcbff769f96f841f1f1f2536e19de37c54745ff92cbddf55a7fa5d95be7ea79c3aa7a7b87fefd5ae10562880bf3b15e7f5fb7f969e60b15b7a2246fafa9d929edcb29bfbf77eed0a21003ca35521acf836f8a9f2d8012a6b550801e0596d0a618737aabbe6702a21223d99223d11237dfd4e494f6ed9cdfd7bbf368590af9d4a88484fa6484fc4485fbf53d2935b7673ffdeab4db24cf834964d9b2fc069ad7f50ffac57ffd4577102a84721bcf6fdd6e5b39dd482b83b21223dd9233d11e3d47ea45fb75bfa7ca7dd6f8946ff1be18f1f3f6ef9c1e75dedbe627742447ab2477a22c6a9fd48ff6cb7a4b925ad5f7a7bef36b6109eba094fd89d10919eec919e88716a3fd2afdb2d7dbed3eeb764630b21005cd7d042f8ce6f2955be11014c35b21002c0a77185f0c41bdae9b7c2dd0911e9c91ee98918a7f623fdbaddd2e73bed7e4b36ae104eb53b21223dd9233d11e3d47ea47fb65bd2dc92d62fbdbd771b972c73eaed6cf7f8c2b70da00c6f84008c265966902e0916bba527804c23b9e53deda5f7fb4ede0887e89260b15b7a02c83449292d49e73e3d99a73a8570802e0916bba527804c23b9e53deda5f77b824208c0680a2100a32984008ca6100ed025c162b7f404906924b7bca7bdf47e4f500887e89260b15b7a02c83449292d49e73e3d99a73ac9326f225906209337420046932c33487a624797248e53d2d7d979e9adf2fa79231c22299da362b247baf475765e7aabbe7ee30ae1896f29a7bf19a527767449e238257d9d9d97de3aacdfb8420800bf1a5908dff98676fa6d1080af8d2c8400f0696c213cf563d413d2133bba24719c92becece4b6f1dd66f6c21bcae9f9b74c746ddd5ee2b92d2392a267ba44b5f67e7a5b7eaeb372e5966475f096308df368032fca0fe178a0bc03c0a217fa89c10f12bc9238fa527bcac9a9640937efed2c7f795d1ff46c89faa27447c923cf2587ac2cbaa690934e9e72f7d7cdf6953082b2dfadf9c9e43878488eb923cf237e9092faba625d0a49fbff4f1ad68530801e05fb42a8455be7d3c5279ec0095b52a8400f0ac7685b0e29b55ca983b24445c97e491bf494f7859352d8126fdfca58f6f45bb42785d3f0b4b4a71f94ae238ab27447c923cf2587ac2cbaa690934e9e72f7d7cdf69932cf395b429769c134055237e509ff6d605408e1185909f2471bc671e9513367e752a81263df926bddfdded4d38f72dff8d903f49e278cf3caa276c7c3a9540939e7c93deefeef6a69cfbf84258e95bc5bb3cbb2692385eeb373d6965b7530934e9c937e9fdee6e6fd2b98f2f840070a71285d05be17fac05c05e250a2100dca54c21f426f4ef6b2089e3b57ed39356763b9540939e7c93deefeef6269dfbf81fd43f52e51f6077d9b5455dfeecfb54bf13fe8cfc57e93f77483fcfe9f751fa3abf53c942f8a97b412cbc35006594fe41bd4201c0abcafc1b2100dc4121046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d1fe0fc51dc3566b9ce9760000000049454e44ae426082, 2),
(120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, 9),
(121, 'checador', 'fmtor', 'rdg', '2022-01-21', 0, 'fmtor.rdgprograma@gmail.com', '2022-01-21', 'FMTOR220121', 'FMTOR220121', 'FMTOR220121', 'ACTIVO', 25, NULL, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_estados`
--

CREATE TABLE `t_estados` (
  `id_estados` int(11) NOT NULL,
  `estados` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_estados`
--

INSERT INTO `t_estados` (`id_estados`, `estados`) VALUES
(1, 'FORJADO'),
(2, 'RANURADO'),
(3, 'ROLADO'),
(4, 'SHANK'),
(5, 'CEMENTADO'),
(6, 'ACABADO'),
(7, 'CANCELADO'),
(8, 'TERMINADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_facturacion`
--

CREATE TABLE `t_facturacion` (
  `Id_Facutracion` bigint(20) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Factura` varchar(30) DEFAULT '-',
  `Empaque` varchar(30) DEFAULT '-',
  `Cantidad_Entregada` bigint(20) DEFAULT NULL,
  `Kilos_Entregados` float DEFAULT NULL,
  `Concepto` tinyint(1) DEFAULT 0,
  `Id_Pedido_FK` bigint(20) DEFAULT NULL,
  `Id_Empresa_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_horario`
--

CREATE TABLE `t_horario` (
  `id_horario` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `entrada` time DEFAULT NULL,
  `almuerzoS` time DEFAULT NULL,
  `almuerzoR` time DEFAULT NULL,
  `salida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_incidencias`
--

CREATE TABLE `t_incidencias` (
  `id_incidencias` int(11) NOT NULL,
  `id_empleados_2` int(11) DEFAULT NULL,
  `tipo_incidencia` varchar(255) DEFAULT NULL,
  `inicio_in` date DEFAULT NULL,
  `fin_in` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_informacion_empresa`
--

CREATE TABLE `t_informacion_empresa` (
  `Id_Empresa` int(11) NOT NULL,
  `Empresa` varchar(150) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Ciudad` varchar(20) DEFAULT NULL,
  `Codigo_Postal` varchar(10) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Correo` varchar(110) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_informacion_empresa`
--

INSERT INTO `t_informacion_empresa` (`Id_Empresa`, `Empresa`, `Direccion`, `Ciudad`, `Codigo_Postal`, `Telefono`, `Correo`) VALUES
(1, 'FORJADORA MEXICANA DE TORNILLOS, S.A. DE C.V.', 'SAN LUIS N° 20 COL. LOMAS ESTRELLA ALCALDÍA IZTAPALAPA', 'CDMX', '09890', '55-89-54-05-76', 'ventas1@fmtor.mx'),
(2, 'RDG TORNILLOS', 'SAN LUIS N° 20 COL. LOMAS ESTRELLA ALCALDÍA IZTAPALAPA', 'CDMX', '09890', '55-89-54-05-76', 'ventas1@fmtor.mx');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_inventario_productos_comprados`
--

CREATE TABLE `t_inventario_productos_comprados` (
  `Id_productos_comprados` int(11) NOT NULL,
  `Kardex_pc` int(11) NOT NULL,
  `Id_Proveedor_FK` int(11) DEFAULT NULL,
  `Medida_pc` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Num_parte` varchar(50) DEFAULT NULL,
  `Precio_pc` float DEFAULT NULL,
  `Costo_total_pc` float DEFAULT NULL,
  `Anaquel_fila_pc` varchar(50) NOT NULL,
  `Inventario_inicial_pc` float DEFAULT NULL,
  `Inventario_final_pc` float DEFAULT NULL,
  `Explosion_pc` float DEFAULT NULL,
  `Factor_pc` float DEFAULT NULL,
  `Kilos_pc` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_inventario_productos_finalizados`
--

CREATE TABLE `t_inventario_productos_finalizados` (
  `Id_productos_finalizados` int(11) NOT NULL,
  `Kardex_pf` int(11) NOT NULL,
  `Anaquel_fila_pf` varchar(50) NOT NULL,
  `Inventario_inicial_pf` float DEFAULT NULL,
  `Inventario_final_pf` float DEFAULT NULL,
  `Explosion_pf` float DEFAULT NULL,
  `Kilos_pf` float DEFAULT NULL,
  `Id_pedido_FK` bigint(20) DEFAULT NULL,
  `Id_Folio_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_iso`
--

CREATE TABLE `t_iso` (
  `Id_Iso` int(11) NOT NULL,
  `Mes_de_creacion` varchar(50) DEFAULT NULL,
  `PDF` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_materia_prima`
--

CREATE TABLE `t_materia_prima` (
  `Id_materia_prima` int(11) NOT NULL,
  `Medida_mp` varchar(50) NOT NULL,
  `Num_rollo` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Referencia` varchar(50) NOT NULL,
  `Entrada` int(11) DEFAULT NULL,
  `Salida` int(11) DEFAULT NULL,
  `Saldo` int(11) NOT NULL,
  `Saldo_rollo` varchar(2) DEFAULT '1R'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_orden_compra`
--

CREATE TABLE `t_orden_compra` (
  `Id_Compra` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Solicitado` varchar(50) DEFAULT NULL,
  `Terminos` varchar(350) DEFAULT NULL,
  `Contacto` varchar(350) DEFAULT NULL,
  `FK_Proveedor` int(11) DEFAULT NULL,
  `FK_Empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_orden_produccion`
--

CREATE TABLE `t_orden_produccion` (
  `Id_Produccion` bigint(20) NOT NULL,
  `Id_Catalogo_FK` varchar(50) DEFAULT NULL,
  `Calibre` float DEFAULT 0,
  `Cantidad` double DEFAULT NULL,
  `Estado_general` varchar(25) DEFAULT 'PENDIENTE',
  `Id_Pedido_FK` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_orden_produccion`
--

INSERT INTO `t_orden_produccion` (`Id_Produccion`, `Id_Catalogo_FK`, `Calibre`, `Cantidad`, `Estado_general`, `Id_Pedido_FK`) VALUES
(1, '-', 1, 1, 'FORJADO', 999999),
(11085, '-', 111, 25, 'TERMINADA', 1),
(11086, '-', 328, 6, 'TERMINADA', 2),
(11087, '-', 250, 10, 'TERMINADA', 3),
(11088, '-', 172, 80, 'TERMINADA', 4),
(11089, '-', 157, 20, 'TERMINADA', 5),
(11090, '-', 111, 20, 'TERMINADA', 6),
(11091, '-', 131, 75, 'TERMINADA', 7),
(11092, '-', 142, 60, 'TERMINADA', 8),
(11093, '-', 70, 50, 'TERMINADA', 9),
(11094, '-', 158, 20, 'TERMINADA', 10),
(11095, '-', 138, 30, 'TERMINADA', 11),
(11096, '-', 0, 50, 'CANCELADA', 12),
(11097, '-', 0, 0, 'CANCELADA', 13),
(11098, '-', 0, 0, 'CANCELADA', 14),
(11099, '-', 164, 60, 'TERMINADA', 15),
(11100, '-', 164, 48, 'TERMINADA', 16),
(11101, '-', 122, 40, 'TERMINADA', 17),
(11102, '-', 95, 50, 'TERMINADA', 18),
(11103, '-', 158, 25, 'TERMINADA', 19),
(11104, '-', 135, 100, 'TERMINADA', 20),
(11105, '-', 92, 200, 'TERMINADA', 21),
(11106, '-', 92, 120, 'TERMINADA', 22),
(11107, '-', 198, 20, 'TERMINADA', 23),
(11108, '-', 122, 200, 'TERMINADA', 24),
(11109, '-', 306, 200, 'TERMINADA', 25),
(11110, '-', 69, 30, 'TERMINADA', 26),
(11111, '-', 158, 30, 'TERMINADA', 27),
(11112, '-', 158, 20, 'ACABADO', 28),
(11113, '-', 94, 50, 'ACABADO', 29),
(11114, '-', 114, 30, 'TERMINADA', 30),
(11115, '-', 140, 100, 'TERMINADA', 31),
(11116, '-', 140, 100, 'TERMINADA', 32),
(11117, '-', 111, 20, 'TERMINADA', 33),
(11118, '-', 142, 50, 'TERMINADA', 34),
(11119, '-', 164, 50, 'TERMINADA', 35),
(11120, '-', 204, 50, 'TERMINADA', 36),
(11121, '-', 111, 100, 'ACABADO', 37),
(11122, '-', 204, 20, 'TERMINADA', 38),
(11123, '-', 140, 0, 'TERMINADA', 39),
(11124, '-', 140, 0, 'TERMINADA', 40),
(11125, '-', 122, 30, 'TERMINADA', 41),
(11126, '-', 135, 30, 'TERMINADA', 42),
(11127, '-', 164, 90, 'TERMINADA', 43),
(11128, '-', 132, 0, 'TERMINADA', 44),
(11129, '-', 111, 50, 'ACABADO', 45),
(11130, '-', 131, 25, 'TERMINADA', 46),
(11131, '-', 164, 140, 'TERMINADA', 47),
(11132, '-', 172, 50, 'TERMINADA', 48),
(11133, '-', 111, 30, 'TERMINADA', 49),
(11134, '-', 142, 120, 'TERMINADA', 50),
(11135, '-', 131, 80, 'ACABADO', 51),
(11136, '-', 131, 30, 'ACABADO', 52),
(11137, '-', 142, 50, 'TERMINADA', 53),
(11138, '-', 131, 20, 'ACABADO', 54),
(11139, '-', 138, 80, 'ACABADO', 55),
(11140, '-', 149, 30, 'ACABADO', 56),
(11141, '-', 211, 20, 'TERMINADA', 57),
(11142, '-', 94, 30, 'TERMINADA', 58),
(11143, '-', 204, 25, 'ROLADO', 59),
(11144, '-', 164, 30, 'ACABADO', 60),
(11145, '-', 111, 120, 'TERMINADA', 61),
(11146, '-', 122, 45, 'ACABADO', 62),
(11147, '-', 164, 80, 'ACABADO', 63),
(11148, '-', 122, 150, 'TERMINADA', 64),
(11149, '-', 94, 150, 'ACABADO', 65),
(11150, '-', 95, 60, 'ACABADO', 66),
(11151, '-', 135, 170, 'TERMINADA', 67),
(11152, '-', 92, 300, 'TERMINADA', 68),
(11153, '-', 135, 25, 'ACABADO', 69),
(11154, '-', 164, 50, 'ACABADO', 70),
(11155, '-', 172, 30, 'ACABADO', 71),
(11156, '-', 69, 60, 'TERMINADA', 72),
(11157, '-', 210, 20, 'TERMINADA', 73),
(11158, '-', 157, 40, 'ROLADO', 74),
(11159, '-', 135, 100, 'FORJADO', 75),
(11160, '-', 0, 0, 'TERMINADA', 76),
(11161, '-', 131, 350, 'PENDIENTE', 77),
(11162, '-', 204, 15, 'ACABADO', 78),
(11163, '-', 122, 300, 'TERMINADA', 79),
(11164, '-', 122, 100, 'ROLADO', 80),
(11165, '-', 142, 30, 'ROLADO', 81),
(11166, '-', 144, 200, 'TERMINADA', 82),
(11167, '-', 131, 30, 'ACABADO', 83),
(11168, '-', 211, 15, 'ACABADO', 84),
(11169, '-', 211, 15, 'ACABADO', 85),
(11170, '-', 211, 20, 'ROLADO', 86),
(11171, '-', 204, 20, 'FORJADO', 87),
(11172, '-', 182, 30, 'TERMINADA', 88),
(11173, '-', 164, 20, 'ACABADO', 89),
(11174, '-', 149, 20, 'ACABADO', 90),
(11175, '-', 105, 25, 'FORJADO', 91),
(11176, '-', 238, 10, 'ACABADO', 92),
(11177, '-', 238, 15, 'ACABADO', 93),
(11178, '-', 238, 15, 'TERMINADA', 94),
(11179, '-', 157, 20, 'FORJADO', 95),
(11180, '-', 211, 10, 'TERMINADA', 96),
(11181, '-', 184, 40, 'ACABADO', 97),
(11182, '-', 204, 15, 'ACABADO', 98),
(11183, '-', 94, 30, 'SHANK', 99),
(11184, '-', 90, 100, 'SHANK', 100),
(11185, '-', 90, 100, 'ROLADO', 101),
(11186, '-', 111, 60, 'ACABADO', 102),
(11187, '-', 158, 4, 'ROLADO', 103),
(11188, '-', 158, 4, 'TERMINADA', 104),
(11189, '-', 0, 20, 'SHANK', 105),
(11190, '-', 149, 50, 'TERMINADA', 106),
(11191, '-', 111, 20, 'PENDIENTE', 107),
(11192, '-', 164, 30, 'ROLADO', 108),
(11193, '-', 80, 50, 'TERMINADA', 109),
(11194, '-', 211, 25, 'TERMINADA', 110),
(11195, '-', 132, 100, 'FORJADO', 111),
(11196, '-', 111, 20, 'ACABADO', 112),
(11197, '-', 131, 200, 'PENDIENTE', 113),
(11198, '-', 0, 0, 'CANCELADA', 114),
(11199, '-', 157, 50, 'ACABADO', 115),
(11200, '-', 211, 10, 'SHANK', 116),
(11201, '-', 210, 10, 'PENDIENTE', 117),
(11202, '-', 211, 10, 'PENDIENTE', 118),
(11203, '-', 212, 10, 'TERMINADA', 119),
(11204, '-', 210, 45, 'TERMINADA', 120),
(11205, '-', 138, 130, 'TERMINADA', 121),
(11206, '-', 131, 75, 'TERMINADA', 122),
(11207, '-', 164, 75, 'TERMINADA', 123),
(11208, '-', 111, 20, 'ROLADO', 124),
(11209, '-', 140, 170, 'TERMINADA', 125),
(11210, '-', 144, 600, 'PENDIENTE', 126),
(11211, '-', 212, 30, 'TERMINADA', 127),
(11212, '-', 157, 10, 'ACABADO', 128),
(11213, '-', 0, 0, 'CANCELADA', 129),
(11214, '-', 131, 70, 'ACABADO', 130),
(11215, '-', 70, 50, 'PENDIENTE', 131),
(11216, '-', 157, 10, 'ACABADO', 132),
(11217, '-', 114, 30, 'ROLADO', 133),
(11218, '-', 306, 200, 'PENDIENTE', 134),
(11219, '-', 104, 0.4, 'PENDIENTE', 135),
(11220, '-', 104, 0.5, 'PENDIENTE', 136),
(11221, '-', 104, 0.5, 'PENDIENTE', 137),
(11222, '-', 172, 50, 'PENDIENTE', 138),
(11223, '-', 164, 15, 'ROLADO', 139),
(11224, '-', 172, 78, 'TERMINADA', 140),
(11225, '-', 140, 25, 'TERMINADA', 141),
(11226, '-', 94, 100, 'PENDIENTE', 142),
(11227, '-', 94, 200, 'TERMINADA', 143),
(11228, '-', 275, 15, 'TERMINADA', 144),
(11229, '-', 122, 80, 'TERMINADA', 145),
(11230, '-', 164, 20, 'TERMINADA', 146),
(11231, '-', 238, 15, 'PENDIENTE', 147),
(11232, '-', 158, 10, 'TERMINADA', 148),
(11233, '-', 142, 50, 'TERMINADA', 149),
(11234, '-', 0, 0, 'CANCELADA', 150),
(11235, '-', 144, 200, 'PENDIENTE', 151),
(11236, '-', 140, 100, 'TERMINADA', 152),
(11237, '-', 140, 30, 'TERMINADA', 153),
(11238, '-', 122, 40, 'TERMINADA', 154),
(11239, '-', 122, 220, 'TERMINADA', 155),
(11240, '-', 111, 80, 'TERMINADA', 156),
(11241, '-', 157, 10, 'TERMINADA', 157),
(11242, '-', 164, 50, 'TERMINADA', 158),
(11243, '-', 157, 10, 'TERMINADA', 159),
(11244, '-', 0, 60, 'TERMINADA', 160),
(11245, '-', 0, 500, 'PENDIENTE', 161),
(11246, '-', 142, 100, 'PENDIENTE', 162),
(11247, '-', 131, 66, 'TERMINADA', 163),
(11248, '-', 131, 30, 'TERMINADA', 164),
(11249, '-', 131, 30, 'TERMINADA', 165),
(11250, '-', 270, 10, 'PENDIENTE', 166),
(11251, '-', 92, 50, 'PENDIENTE', 167),
(11252, '-', 92, 10, 'PENDIENTE', 168),
(11253, '-', 92, 40, 'PENDIENTE', 169),
(11254, '-', 92, 10, 'PENDIENTE', 170),
(11255, '-', 204, 50, 'PENDIENTE', 171),
(11256, '-', 111, 40, 'PENDIENTE', 172),
(11257, '-', 158, 30, 'PENDIENTE', 173),
(11258, '-', 135, 40, 'PENDIENTE', 174),
(11259, '-', 122, 250, 'PENDIENTE', 175),
(11260, '-', 164, 100, 'PENDIENTE', 176),
(11261, '-', 122, 100, 'PENDIENTE', 177),
(11262, '-', 138, 30, 'PENDIENTE', 178),
(11263, '-', 149, 50, 'PENDIENTE', 179),
(11264, '-', 135, 25, 'PENDIENTE', 180),
(11265, '-', 0, 20, 'CANCELADA', 181),
(11266, '-', 164, 25, 'PENDIENTE', 182),
(11267, '-', 164, 25, 'PENDIENTE', 183),
(11268, '-', 211, 25, 'PENDIENTE', 184),
(11269, '-', 211, 25, 'PENDIENTE', 185),
(11270, '-', 212, 20, 'PENDIENTE', 186),
(11271, '-', 212, 20, 'PENDIENTE', 187),
(11272, '-', 210, 20, 'CANCELADA', 188),
(11273, '-', 131, 50, 'PENDIENTE', 189),
(11274, '-', 131, 0, 'PENDIENTE', 190),
(11275, '-', 131, 80, 'PENDIENTE', 191),
(11276, '-', 131, 30, 'PENDIENTE', 192),
(11277, '-', 164, 25, 'PENDIENTE', 193),
(11278, '-', 92, 50, 'FORJADO', 194);

--
-- Disparadores `t_orden_produccion`
--
DELIMITER $$
CREATE TRIGGER `nueva_orden` AFTER INSERT ON `t_orden_produccion` FOR EACH ROW BEGIN
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,1,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,2,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,3,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,4,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,5,NEW.Id_Produccion);
	INSERT INTO t_control_produccion (factor,Id_estado_1,Id_Produccion_FK_1) VALUES (0.0,6,NEW.Id_Produccion);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_pedido`
--

CREATE TABLE `t_pedido` (
  `Id_Pedido` bigint(20) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Medida` varchar(50) DEFAULT NULL,
  `Acabado` varchar(50) DEFAULT NULL,
  `Factor` float DEFAULT NULL,
  `Material` varchar(100) DEFAULT '-',
  `Cantidad_millares` int(11) DEFAULT NULL,
  `Pedido_pza` varchar(100) DEFAULT '-',
  `Fecha_entrega` date DEFAULT NULL,
  `Precio_millar` double DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Tratamiento` varchar(100) DEFAULT '0',
  `Kardex` int(11) DEFAULT NULL,
  `Id_Cotizacion_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_pedido`
--

INSERT INTO `t_pedido` (`Id_Pedido`, `Descripcion`, `Medida`, `Acabado`, `Factor`, `Material`, `Cantidad_millares`, `Pedido_pza`, `Fecha_entrega`, `Precio_millar`, `Codigo`, `Tratamiento`, `Kardex`, `Id_Cotizacion_FK`) VALUES
(1, 'C/BOTON C/AI TORKS SEMS ', '6-20 X 1/2', 'ZIN ESP ', 1.04, '-', 0, '-', '0000-00-00', 455, '-', '0', 0, 1),
(2, 'C/BOTON ALLEN ', '3/8-16X2', 'GALVANIZADO', 1.82, '-', 0, '-', '0000-00-00', 2500, '-', '0', 0, 2),
(3, 'C/OVAL RAN ', '1/4-24 X 1', 'GALVANIZADO ', 6.81, '-', 0, '-', '0000-00-00', 0.03, '-', '0', 0, 3),
(4, 'C/CIL RAN ', 'M5*80*12', 'GALVANIZADO ', 2.91, '-', 0, '-', '0000-00-00', 0.02, '-', '0', 0, 4),
(5, 'C/RED RAN', '10-24*1/4', 'GALV', 1.56, '-', 0, '-', '0000-00-00', 219, '-', '0', 0, 5),
(6, 'c/plana ph t/b ', '6-20 x 3/8', 'galv', 0.88, '-', 0, '-', '0000-00-00', 165, '-', 'T/TERMICO', 0, 6),
(7, 'c/fij ph t/a', '8-12*1/2', 'GALV', 1.58, '-', 0, '-', '0000-00-00', 181.3, '-', '0', 0, 7),
(8, 'C/FIJ PH T/A', '10-12 X 3/8', 'PAVONADO', 1.89, '-', 0, '-', '0000-00-00', 229.22, '-', '0', 0, 8),
(9, 'C/FIJ PH T/AB ', '2-32*1/4', 'GALV', 0.22, '-', 0, '-', '0000-00-00', 430, '-', 'T/TERMICO', 0, 9),
(10, 'C/FIJ PH RAN ', '10-24*17', 'TROPIZALIZADO', 2.88, '-', 0, '-', '0000-00-00', 317.21, '-', '0', 0, 10),
(11, 'C/RED T/23', '8-32 X 5/8', 'GALV', 1.84, '-', 0, '-', '0000-00-00', 215, '-', 'T/TERMICO', 0, 11),
(12, 'C/FIJ PH T/AB', '2-32X3/16', 'TROPIZALIZADO', 0.45, '-', 0, '-', '0000-00-00', 195, '-', '0', 0, 12),
(13, '', 'CANCELADA', '', 0, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 13),
(14, '', 'CANCELADA', '', 0, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 14),
(15, 'C/FILL RAN ', '10-32* 1 1/2', 'GALV', 4, '-', 0, '-', '0000-00-00', 499, '-', '0', 0, 15),
(16, 'C/FILL RAN ', '10-32* 1 1/2', 'GALV', 4.85, '-', 0, '-', '0000-00-00', 499, '-', '0', 0, 16),
(17, 'C/FIJ PH T/25', '8-15*1/2', 'TROPIZALIZADO', 1.58, '-', 0, '-', '0000-00-00', 224.95, '-', '0', 0, 17),
(18, 'C/FIJ PH T/25', '4-24*12', 'TROPIZALIZADO', 0.63, '-', 0, '-', '0000-00-00', 190.96, '-', '0', 0, 18),
(19, 'C/FIJ PH RAN ', '10-24*17', 'TROPIZALIZADO', 2.88, '-', 0, '-', '0000-00-00', 317.21, '-', '0', 0, 19),
(20, 'C/EST PH ', '5-32 X 8', 'TROPI ', 1.2, '-', 0, '-', '0000-00-00', 175.05, '-', '0', 0, 20),
(21, 'C/FIJ PHJ C/AI ', '4-24 X 3/8 ', 'TROPI', 0.52, '-', 0, '-', '0000-00-00', 149.59, '-', '0', 0, 21),
(22, 'C/FIJ PH T/B ', '4-24 X 14 ', 'TROPI', 0.69, '-', 0, '-', '0000-00-00', 180.35, '-', '0', 0, 22),
(23, 'FIJ PH CUELLO ', '10-24X1 1/8', 'TROPI', 3.87, '-', 0, '-', '0000-00-00', 426.48, '-', '0', 0, 23),
(24, 'c/fij ph hilo t/b ', '8-18*3/4', 'GALVANIZADO', 2.1, '-', 0, '-', '0000-00-00', 263.1, '-', '0', 0, 24),
(25, 'c/plana especial', '5/16*3/4', 'pulido', 0, '-', 0, '-', '0000-00-00', 80, '-', '0', 0, 25),
(26, 'c/fij ph t/ab ', '2-32 x 5/8 ', 'GALVA', 0.43, '-', 0, '-', '0000-00-00', 150, '-', 'T/TERMICO', 0, 26),
(27, 'C/PLANA PH T/23', '10-24X3/4', 'GALVANIZADO', 2.88, '-', 0, '-', '0000-00-00', 400, '-', 'T/TERMICO', 0, 27),
(28, 'C/PLANA PH T/23', '10-24X3/4', 'ZINCADO', 2.88, '-', 0, '-', '0000-00-00', 445, '-', 'T/TERMICO', 0, 28),
(29, 'C/HEX C/AI T/AB ', '4-24x1/2', 'GALVANIZADO', 0.63, '-', 0, '-', '0000-00-00', 175, '-', 'T/TERMICO', 0, 29),
(30, 'C/PLQNA RAN ', '6-32 X 5/8', 'GALV ', 1.21, '-', 0, '-', '0000-00-00', 146, '-', '0', 0, 30),
(31, 'C/FIJ QUAREFLO ', '8-32 X 1/2', 'PAVONADO ', 1.58, '-', 0, '-', '0000-00-00', 150, '-', 'T/TERMICO', 0, 31),
(32, 'C/FIJ QUAREFLO ', '8-32 x 1/2', 'PAVONADO ', 1.58, '-', 0, '-', '0000-00-00', 150, '-', 'T/TERMICO', 0, 32),
(33, 'C/PLANA PH T/25', '6-20 x 1 3/16', 'INOX ', 2.06, '-', 0, '-', '0000-00-00', 200, '-', '0', 0, 33),
(34, 'C/FIJ PH ', '8-32 X 1/4', 'GALVANIZADO ', 1.08, '-', 0, '-', '0000-00-00', 165, '-', '0', 0, 34),
(35, 'C/FIJ PH ', '8-32 X 3/8', 'GALVANIZADO ', 1.08, '-', 0, '-', '0000-00-00', 165, '-', '0', 0, 35),
(36, 'C/HEX C/AI FLANGE', 'm6x100x10', 'PULIDO', 3.85, '-', 0, '-', '0000-00-00', 659, '-', 'T/TERMICO', 0, 36),
(37, 'C/PLANA PH T/AB', '6-20X.545', 'ZINC NEGRO ', 1.13, '-', 0, '-', '0000-00-00', 192, '-', 'T/TERMICO', 0, 37),
(38, 'c/cil ran ph ', 'M6x40', 'TROPI ', 9.17, '-', 0, '-', '0000-00-00', 947, '-', '0', 0, 38),
(39, 'C/MONEDA C/SPINLOOCK ', '8-32 X 3/4', 'PULIDO ', 2.1, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 39),
(40, 'C/MONEDA C/SPINLOOCK ', '8-31X3/4', 'GALVA', 2.1, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 40),
(41, 'C/FILL PH T/AB ROL ', '7-19 X 3/4', '?VONADO ', 1.7, '-', 0, '-', '0000-00-00', 165, '-', 'T/TERMICO', 0, 41),
(42, 'C/RDT PH ', '5-32X 8', 'TROPI ', 1.2, '-', 0, '-', '0000-00-00', 175.05, '-', '0', 0, 42),
(43, 'C/FIJ PH', '10-32X3/8', 'GALV', 1.89, '-', 0, '-', '0000-00-00', 222.79, '-', '0', 0, 43),
(44, 'C/HEX EMB PUNTA GUIA ', 'M4X70X16', 'PULIDO ', 1.84, '-', 0, '-', '0000-00-00', 1000, '-', '0', 0, 44),
(45, 'C/BOTON C/AI TORKS SEMS ', '6-20 X 1/2', 'ZINC ESP ', 1.04, '-', 0, '-', '0000-00-00', 505, '-', '0', 0, 45),
(46, 'C/BOTON TORKS T/B ', 'M4X18X3/8', 'ZINC ESP ', 1.33, '-', 0, '-', '0000-00-00', 455, '-', '0', 0, 46),
(47, 'C/EST TRAN ', '10-32 X 3/8', 'GALVANZIADO ', 1.89, '-', 0, '-', '0000-00-00', 199, '-', '0', 0, 47),
(48, 'C/FIJ PH T/A ', '12-10 X 1', 'GALVANIZADO ', 1.89, '-', 0, '-', '0000-00-00', 430, '-', '0', 0, 48),
(49, 'C/PLANA PH T/ AB ', '6-20 X 9', 'PAVONADO ', 0.88, '-', 0, '-', '0000-00-00', 195, '-', '0', 0, 49),
(50, 'C/FIJ PH T/A', '10-12 X 1/2', 'PAVONADO ', 2.22, '-', 0, '-', '0000-00-00', 214.8, '-', 'T/TERMICO', 0, 50),
(51, 'C/FIJ PH T/A ', '8-12X1/2', 'GALVA ', 1.58, '-', 0, '-', '0000-00-00', 181.3, '-', '0', 0, 51),
(52, 'C/PLANA ESPECIAL PH T/A', '8-12X1/2', 'GALVA ', 1.58, '-', 0, '-', '0000-00-00', 206.4, '-', '0', 0, 52),
(53, 'C/FIH PH T/A', '10-12X3/8', 'PAVONADO ', 1.59, '-', 0, '-', '0000-00-00', 229.22, '-', '0', 0, 53),
(54, 'C/OVAL ', '8-18 X 13', 'GALVANIZADO ', 1.58, '-', 0, '-', '0000-00-00', 180, '-', '0', 0, 54),
(55, 'c/fij ph t/23', '8-12 x 1/2', 'galvanizado ', 1.58, '-', 0, '-', '0000-00-00', 365, '-', '0', 0, 55),
(56, 'c/fij ph c/ai t/a', '10-12*5/8', 'GALVANIZADO ', 2.55, '-', 0, '-', '0000-00-00', 250, '-', '0', 0, 56),
(57, 'BIRLO ', '1/4-20 X 2 21/2 ', 'GALV', 9.17, '-', 0, '-', '0000-00-00', 875, '-', '0', 0, 57),
(58, 'C/FIJ PH T/B ', '4-10 X 1/2', 'GALVANIZADO ', 0.63, '-', 0, '-', '0000-00-00', 180, '-', '0', 0, 58),
(59, 'C/OVAL RAN ', 'm6x100x17', 'NIQUEL', 5.03, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 59),
(60, 'C/EST RAN ', '10-32 X 3/8', 'GALV', 1.89, '-', 0, '-', '0000-00-00', 200, '-', '0', 0, 60),
(61, 'TOR C/FIJ RAN T/25', '6-20X 12.7', 'GALVANIZADO', 1.04, '-', 0, '-', '0000-00-00', 195, '-', 'T/TERMICO', 0, 61),
(62, 'C*EST PH T/25', '8-18X1/2', 'TROPI', 1.59, '-', 0, '-', '0000-00-00', 224.91, '-', 'T/TERMICO', 0, 62),
(63, 'C/FIJ PH ', '10-32X3/8', 'GALVA', 1.89, '-', 0, '-', '0000-00-00', 222.79, '-', '0', 0, 63),
(64, 'c/fij ph hilo t/b ', '8-18*3/4', 'GALVA', 2.1, '-', 0, '-', '0000-00-00', 263.1, '-', '0', 0, 64),
(65, 'C/FIJ  PH T/B', '4-24X14', 'TROPI', 0.69, '-', 0, '-', '0000-00-00', 180.35, '-', '0', 0, 65),
(66, 'C/FIJPH T/25', '4-24X12', 'TROPI', 6.63, '-', 0, '-', '0000-00-00', 190.86, '-', '0', 0, 66),
(67, 'C/EST PH ', '5-32 X 8', 'TROP ', 1.02, '-', 0, '-', '0000-00-00', 175.1, '-', '0', 0, 67),
(68, 'C/FIJ PH ', '4-24 X 3/8 ', 'TROPI', 0.52, '-', 0, '-', '0000-00-00', 149.59, '-', '0', 0, 68),
(69, 'C/EST PH ', '5-32 X 8', 'TROPI', 1.02, '-', 0, '-', '0000-00-00', 175.1, '-', '0', 0, 69),
(70, 'C/PLAN ESP.', '10-32*3/4', 'GALVANIADA ', 2.88, '-', 0, '-', '0000-00-00', 415, '-', '0', 0, 70),
(71, 'C/FILL RAN ', 'M5X80X25', 'GALVANIZADA ', 4.9, '-', 0, '-', '0000-00-00', 457, '-', '0', 0, 71),
(72, 'C/FIJ PH T/AB ', '2-32X5/8', 'GALVANIZADA ', 0.43, '-', 0, '-', '0000-00-00', 150, '-', '0', 0, 72),
(73, 'C/HEX C/AI T/23', '1/4-20*3/8', 'TROPI', 3.85, '-', 0, '-', '0000-00-00', 516, '-', 'T/TERMICO', 0, 73),
(74, 'C/HEX C/AI T/B SLOOCK', '10-16*3/8', 'GALVANIZADO', 1.89, '-', 0, '-', '0000-00-00', 417, '-', 'T/TERMICO', 0, 74),
(75, 'C/FIJ PH RAN TRIBULAR C/SLOOCK', '5-32 X 3/4', 'TROPIZALIZADO', 2.1, '-', 0, '-', '0000-00-00', 333, '-', 'T/TERMICO', 0, 75),
(76, 'cuerda de 1 1/2 POR LADO ', '10-24 x 5 1/2 ', 'PAVONADO ', 0, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 76),
(77, 'C/FIJ T/B', '8-15 X 1/2', 'INOXIDABLE ', 1.58, '-', 0, '-', '0000-00-00', 150, '-', '0', 0, 77),
(78, 'BIRLO', '1/4-14-20*7/8', 'TROPIZALIZADO', 6.21, '-', 0, '-', '0000-00-00', 627, '-', '0', 0, 78),
(79, 'C/HEX C/AI T/B ', '7-19 X 5/16 ', 'PULIDO', 2.47, '-', 0, '-', '0000-00-00', 170, '-', '0', 0, 79),
(80, 'C/HEX C/AI T/B ', '7-19X3/8', 'PULIDO', 2.69, '-', 0, '-', '0000-00-00', 170, '-', '0', 0, 80),
(81, 'C/FIJ RAN ', '8-32 X 3/4', 'GALVANZADO ', 2.01, '-', 0, '-', '0000-00-00', 200, '-', '0', 0, 81),
(82, 'C/FIJ PH S/FLOO', '8-32 X 1/4', 'PAVONADO', 1.08, '-', 0, '-', '0000-00-00', 145, '-', 'T/TERMICO', 0, 82),
(83, 'C/HEX C/AI T/AB ', '8-18X3/4', 'GALVANIZADO ', 2.1, '-', 0, '-', '0000-00-00', 200, '-', 'T/TERMICO', 0, 83),
(84, 'BIRLO ', '1/4-20*2 1/2 ', 'GALVANIZQDO ', 17.7, '-', 0, '-', '0000-00-00', 875, '-', '0', 0, 84),
(85, 'C/REDTORX', '1/4-20 X 3/4', 'GALVANIZADO', 5.62, '-', 0, '-', '0000-00-00', 707, '-', 'T/TERMICO', 0, 85),
(86, 'C/HEX EMB C/AI', '1/4-20*3/8', 'INOX', 3.85, '-', 0, '-', '0000-00-00', 2200, '-', '0', 0, 86),
(87, 'C/CIL RAN PH ', 'm6x40', 'TROPIZALIZADO', 9.17, '-', 0, '-', '0000-00-00', 947, '-', '0', 0, 87),
(88, 'C/FIJ PH RAN T/23', '12-24*5/8', 'PULDO ', 3.58, '-', 0, '-', '0000-00-00', 466, '-', 'T/TERMICO', 0, 88),
(89, 'C/HEX C/AI T/23', '10-32*1/2', 'TROPIZALIZADO', 2.22, '-', 0, '-', '0000-00-00', 346, '-', 'T/TERMICO', 0, 89),
(90, 'C/FIJ RAN T/AB ', '10-16*1/2', 'GALVANIZADO', 1.94, '-', 0, '-', '0000-00-00', 180, '-', '0', 0, 90),
(91, 'C/FIJ PH', '5-40*1/2', 'TROPICALIZADO ', 0.84, '-', 0, '-', '0000-00-00', 96, '-', '0', 0, 91),
(92, 'C/FIJ PH C/CUELLO C/AI', '1/4-20*1 3/4', 'GALVANIZADO', 10.35, '-', 0, '-', '0000-00-00', 650, '-', '0', 0, 92),
(93, 'C/FIJ PH C/CUELLO C/AI', '1/4-20*2', 'GALVANIZADO', 11.53, '-', 0, '-', '0000-00-00', 700, '-', '0', 0, 93),
(94, 'C/FIJ PH C/CUELLO C/AI', '1/4*1 1/8', 'GALVANIZADO', 7.4, '-', 0, '-', '0000-00-00', 850, '-', '0', 0, 94),
(95, 'C/COCHE', '10-24*30.5', 'GALVANIZADO', 3.87, '-', 0, '-', '0000-00-00', 444, '-', '0', 0, 95),
(96, 'C/FIJ PH C/AI', '1/4-20*1 1/8', 'GALVANIZADO', 7.4, '-', 0, '-', '0000-00-00', 850, '-', '0', 0, 96),
(97, 'C/FIJ PH RAN P GUIA T/23', '12-24*5/8', 'GALVANIZADO', 3.58, '-', 0, '-', '0000-00-00', 411, '-', 'T/TERMICO', 0, 97),
(98, 'C/FIJ PH RAN P GUIA T/23', 'M6*3/4', 'GALVANIZADO', 5.62, '-', 0, '-', '0000-00-00', 645, '-', 'T/TERMICO', 0, 98),
(99, 'C/FIJ PH T/25', '4-24*3/4', 'GALVANIZADO', 0.85, '-', 0, '-', '0000-00-00', 97, '-', '0', 0, 99),
(100, 'C/FIJ PH T/25', '4-24*1/2', 'NIQUEL ', 0.63, '-', 0, '-', '0000-00-00', 72, '-', 'T/TERMICO', 0, 100),
(101, 'C/FIJ PH C/AI T/AB', '4-24*1/2', 'GALVANIZADA', 0.63, '-', 0, '-', '0000-00-00', 72, '-', 'T/TERMICO', 0, 101),
(102, 'C/FIJ PH T/25', '6-20*5/8', 'GALVANIZADO', 1.21, '-', 0, '-', '0000-00-00', 139, '-', 'T/TERMICO', 0, 102),
(103, 'BIRLO', '10-24*5 1/2', 'PAVONADO ', 0, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 103),
(104, 'BIRLO', '10-24*5', 'ZINC. NEGRO', 0, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 104),
(105, 'C/HEX C/AI T/23', '1/4-20*1/2', 'TROPICALIZADO ', 4.44, '-', 0, '-', '0000-00-00', 510, '-', 'T/TERMICO', 0, 105),
(106, 'C/BOTON TORX', '10x16', 'ZIN NEGRO ', 2.55, '-', 0, '-', '0000-00-00', 965, '-', '0', 0, 106),
(107, ' C/BOTON C/AI SEMS TORX', '6-20X1/2', 'ZIN NEGRO ', 1.04, '-', 0, '-', '0000-00-00', 569, '-', '0', 0, 107),
(108, 'C/HEX RAN C/AI T/23', '10-32X3/4', 'GALVANIZADO', 2.88, '-', 0, '-', '0000-00-00', 495, '-', 'T/TERMICO', 0, 108),
(109, 'C/FIJ PH T/AB', '2-32X3/16', 'TROPICALIZADO ', 0.22, '-', 0, '-', '0000-00-00', 195, '-', '0', 0, 109),
(110, 'C/EST PH ', '1/4-20*1/2', 'GALVANIZADO', 4.44, '-', 0, '-', '0000-00-00', 300, '-', '0', 0, 110),
(111, 'C/HEX EMB PUNTA GUIA ', 'M4*70*16', 'INOX ', 1.84, '-', 0, '-', '0000-00-00', 1000, '-', '0', 0, 111),
(112, 'C/PLANA  PH T/B ', '6-20*3/8', 'GALVANIZADO ', 0.88, '-', 0, '-', '0000-00-00', 165, '-', 'T/TERMICO', 0, 112),
(113, 'C/FIJ PH T/AB', '8-18*3/8', 'GALVANIZADO', 1.33, '-', 0, '-', '0000-00-00', 190, '-', 'T/TERMICO', 0, 113),
(114, '', '', '', 0, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 114),
(115, 'C/FIJ RAN', '10-24*3/8', 'GALVANIZADO ', 1.89, '-', 0, '-', '0000-00-00', 290, '-', '0', 0, 115),
(116, 'C/HEX C/AI RAN T/23', '1/4-20*1', 'GALVANIZADO', 6.81, '-', 0, '-', '0000-00-00', 840, '-', 'T/TERMICO', 0, 116),
(117, 'C/HEX C/AI RARANN T/23', '1/4-20*2', 'GALVANIZADO', 11.53, '-', 0, '-', '0000-00-00', 133, '-', 'T/TERMICO', 0, 117),
(118, 'C/HEX C/AI RAN T/23', '1/4-20*1 3/4', 'GALVANIZADO', 10.35, '-', 0, '-', '0000-00-00', 120, '-', 'T/TERMICO', 0, 118),
(119, 'C/HEX C/AI RAN T/23', '1/4-20*1 1/2', 'GALVANIZADO', 9.17, '-', 0, '-', '0000-00-00', 108, '-', 'T/TERMICO', 0, 119),
(120, 'C/RED TORX', '1/4-20*2', 'PULIDO', 4.44, '-', 0, '-', '0000-00-00', 1400, '-', 'T/TERMICO', 0, 120),
(121, 'C/FIJ PH CC/SPPINLOOCK', '8-32*9.5', 'GALVANIZADO', 1.2, '-', 0, '-', '0000-00-00', 165, '-', '0', 0, 121),
(122, 'C/FIJ PH HILO', '10-12*20', 'GALVANIZADO ', 2.88, '-', 0, '-', '0000-00-00', 280, '-', '0', 0, 122),
(123, 'C/PLANA PH T/23', '10-32*1/2', 'GALVANIZADO', 2.22, '-', 0, '-', '0000-00-00', 280, '-', 'T/TERMICO', 0, 123),
(124, 'C/PLANA PH T/25', '6-20*1 3/16', 'INOX ', 2.06, '-', 0, '-', '0000-00-00', 200, '-', '0', 0, 124),
(125, 'C/FIJ PH S/FLO', '8-32*1/2', 'PAVONADO ', 1.58, '-', 0, '-', '0000-00-00', 160, '-', 'T/TERMICO', 0, 125),
(126, 'C/FIJ PH S/FLO', '8-32*1/4', 'PAVONADO ', 1.08, '-', 0, '-', '0000-00-00', 150, '-', 'T/TERMICO', 0, 126),
(127, 'C/ESTUFA  PH ', '1/4-20*1/2', 'GALVANIZADO', 4.44, '-', 0, '-', '0000-00-00', 300, '-', '0', 0, 127),
(128, 'C/ESTUFA PH', '10-24*15/32', 'GALVANIZADO', 4.44, '-', 0, '-', '0000-00-00', 300, '-', '0', 0, 128),
(129, '', '', '', 0, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 129),
(130, 'C/PLAN ESPECIAL PH T/A', '8-12*1/2', 'GALVANIZADO', 1.58, '-', 0, '-', '0000-00-00', 206, '-', '0', 0, 130),
(131, 'C/FIJ PH T/AB', '2-32*1/4', 'GALVANIZADA', 0.22, '-', 0, '-', '0000-00-00', 280, '-', 'T/TERMICO', 0, 131),
(132, 'C/RED PH', '10-24*1 1/2', 'GALVANIZADO', 4.85, '-', 0, '-', '0000-00-00', 1760, '-', '0', 0, 132),
(133, 'C/PLANA RAN', '6-32*5/8', 'GALVANIZADO', 1.21, '-', 0, '-', '0000-00-00', 170, '-', '0', 0, 133),
(134, 'C/PLANA ESPECIAL  ', '5/16*3/4', 'PULIDO', 0, '-', 0, '-', '0000-00-00', 92, '-', '0', 0, 134),
(135, 'C/RED PH', '5-40*2 1/4', 'GALVANIZADO', 0.55, '-', 0, '-', '0000-00-00', 900, '-', '0', 0, 135),
(136, 'C/RED PH', '5-40*2', 'GALVANIZADO', 4.65, '-', 0, '-', '0000-00-00', 750, '-', '0', 0, 136),
(137, 'C/RED PH', '5-40*1 3/4', 'GALVANIZADO', 2.28, '-', 0, '-', '0000-00-00', 700, '-', '0', 0, 137),
(138, 'C/ESP TORX TRIBULAR', 'M5*100*3/8', 'GALVANIZADO', 2.69, '-', 0, '-', '0000-00-00', 700, '-', '0', 0, 138),
(139, 'FIJ RAN', '10-32*3/8', 'TROPICALIZADO ', 1.89, '-', 0, '-', '0000-00-00', 343, '-', '0', 0, 139),
(140, 'C/FIJ RAN ', 'M5*80*25', 'GALVANIZADO', 4.9, '-', 0, '-', '0000-00-00', 457, '-', '0', 0, 140),
(141, 'C/ESP CUADRO', '8-32*1/2', 'COBRIZADO', 1.58, '-', 0, '-', '0000-00-00', 341, '-', '0', 0, 141),
(142, 'C/FIJ PH C/AI T/23', '4-24*3/8', 'TROPICALIZADO ', 0.52, '-', 0, '-', '0000-00-00', 172, '-', '0', 0, 142),
(143, 'C/FIJ PH T/B', '4-24*14', 'TROPICALIZADO ', 0.69, '-', 0, '-', '0000-00-00', 207, '-', '0', 0, 143),
(144, 'C/FIJ PH RAN', '5/16*1 1/4', 'TROPICALIZADO ', 21, '-', 0, '-', '0000-00-00', 1377, '-', '0', 0, 144),
(145, 'C/FIJ PH T/25', '8-15*1/2', 'TROPICALIZADO ', 1.58, '-', 0, '-', '0000-00-00', 258, '-', '0', 0, 145),
(146, 'C/FIJ PH', '10-32*1/2', 'TROPICALIZADO ', 2.22, '-', 0, '-', '0000-00-00', 293, '-', '0', 0, 146),
(147, 'C/FIJ PH C/AI C/CUELLO', '1/4-20*1 3/4', 'GALVANIZADO', 10.35, '-', 0, '-', '0000-00-00', 650, '-', '0', 0, 147),
(148, 'C/HEX EMB PUNTA GUIA (M5)', '10-32*38', 'GALVANIZADO', 4.46, '-', 0, '-', '0000-00-00', 350, '-', '0', 0, 148),
(149, 'C/FIJ PH T/A', '10-12*3/8', 'PAVONADO ', 1.89, '-', 0, '-', '0000-00-00', 229, '-', '0', 0, 149),
(150, '', '', 'GALVANIZADO', 1.58, '-', 0, '-', '0000-00-00', 0, '-', '0', 0, 150),
(151, 'C/FIJ PH S/FLO', '8-32*1/4', 'PAVONADO ', 1.08, '-', 0, '-', '0000-00-00', 150, '-', 'T/TERMICO', 0, 151),
(152, 'C/FIJ PH S/FLO', '8-32*1/2', 'PAVONADO ', 1.58, '-', 0, '-', '0000-00-00', 170, '-', 'T/TERMICO', 0, 152),
(153, 'C/FIIL RAN', '8-32*3/4', 'GALVANIZADO', 2.1, '-', 0, '-', '0000-00-00', 200, '-', '0', 0, 153),
(154, 'C/HEX C/AI T/B', '7-19*5/16', 'INOX', 2.47, '-', 0, '-', '0000-00-00', 170, '-', '0', 0, 154),
(155, 'C/HEX C/AI T/B', '7-19*3/8', 'INOX', 2.69, '-', 0, '-', '0000-00-00', 170, '-', '0', 0, 155),
(156, 'C/PLANA PH T/B', '6-20*3/8', 'GALVANIZADO', 0.88, '-', 0, '-', '0000-00-00', 165, '-', '0', 0, 156),
(157, 'C/HEX EMB', '10-24*1 1/2', 'GALVANIZADO', 4.85, '-', 0, '-', '0000-00-00', 1015, '-', '0', 0, 157),
(158, 'C/FIJ PH RAN', '10-32*5/16', 'PULIDO', 2.88, '-', 0, '-', '0000-00-00', 310, '-', '0', 0, 158),
(159, 'C/HEX EMB', '10-24*1', 'GALVANIZADO', 3.54, '-', 0, '-', '0000-00-00', 858, '-', '0', 0, 159),
(160, 'C/PLANA PH T/25', '6-20*1 3/16', 'GALVANIZADO', 2.06, '-', 0, '-', '0000-00-00', 160, '-', 'T/TERMICO', 0, 160),
(161, 'C/HEX C/AI RAN S/LOOK', '10-24*3/8', 'PULIDO', 1.89, '-', 0, '-', '0000-00-00', 320, '-', 'T/TERMICO', 0, 161),
(162, 'C/FIJ PH', 'M2*40*4.5', 'NIQUELADO', 0.31, '-', 0, '-', '0000-00-00', 210, '-', '0', 0, 162),
(163, 'C/EST PH T/A', '8-15*32', 'GALVANIZADO', 3.12, '-', 0, '-', '0000-00-00', 441, '-', '0', 0, 163),
(164, 'C/OVAL PH T/AB ', '8-18*13', 'GALVANIZADO', 1.58, '-', 0, '-', '0000-00-00', 180, '-', '0', 0, 164),
(165, 'C/FIJ PH T/A', '8-12*1/2', 'GALVANIZADO', 1.58, '-', 0, '-', '0000-00-00', 181, '-', '0', 0, 165),
(166, 'C/COCHE', '5-16*2 5/16', 'GALVANIZADO', 31.7, '-', 0, '-', '0000-00-00', 120, '-', '0', 0, 166),
(167, 'C/HEX C/AI T/AB', '4-24*1/2', 'GALVANIZADO', 0.8, '-', 0, '-', '0000-00-00', 191, '-', 'T/TERMICO', 0, 167),
(168, 'C/FIJ PH T/AB', '4*-24*3/4', 'GALVANIZADO', 0.85, '-', 0, '-', '0000-00-00', 195, '-', 'T/TERMICO', 0, 168),
(169, 'C/FIJ PH T/AB', '4-24*7/8', 'GALVANIZADO', 0.96, '-', 0, '-', '0000-00-00', 195, '-', 'T/TERMICO', 0, 169),
(170, 'C/FIJ PH T/AB', '4-24*1/4', 'GALVANIZADO', 0.5, '-', 0, '-', '0000-00-00', 195, '-', 'T/TERMICO', 0, 170),
(171, 'C/HEX C/AI FLANGE', 'm6*10', 'PULIDO', 4, '-', 0, '-', '0000-00-00', 660, '-', 'T/TERMICO', 0, 171),
(172, 'C/FIJ PH T/AB C/AI', '6-20*3/8', 'GALVANIZADO', 0.88, '-', 0, '-', '0000-00-00', 140, '-', 'T/TERMICO', 0, 172),
(173, 'C/FIJ PH RAN', '10-24*17', 'TROPICALIZADO', 2.88, '-', 0, '-', '0000-00-00', 364, '-', '0', 0, 173),
(174, 'C/EST PH  ', '5-32*8', 'TROPICALIZADO', 1.2, '-', 0, '-', '0000-00-00', 201, '-', '0', 0, 174),
(175, 'C/FIJ PH HILO T/B', '8-18*3/4', 'GALVANIZADO', 2.1, '-', 0, '-', '0000-00-00', 302, '-', '0', 0, 175),
(176, 'C/FIJ PH ', '10-32*3/8', 'GALVANIZADO', 1.89, '-', 0, '-', '0000-00-00', 256, '-', '0', 0, 176),
(177, 'C/EST PH T/25', '8-14*1/2', 'TROPICALIZADO', 1.58, '-', 0, '-', '0000-00-00', 258, '-', 'T/TERMICO', 0, 177),
(178, 'C/FIJ PH C/SPINLOOK', '8-32*9.5', 'GALVANIZADO', 1.2, '-', 0, '-', '0000-00-00', 400, '-', '0', 0, 178),
(179, 'C/BOTON C/AI TORKS SEMS', '10*16', 'ZINC. ESP', 2.55, '-', 0, '-', '0000-00-00', 1250, '-', '0', 0, 179),
(180, 'C/BOTON C/AI ALLEN', 'M4*10', 'ZINC. ESP', 1.33, '-', 0, '-', '0000-00-00', 670, '-', '0', 0, 180),
(181, 'C/HEX C/AI RAN T/23', '1/4-20*3/4', 'TROPICALIZADO', 5.62, '-', 0, '-', '0000-00-00', 828, '-', 'T/TERMICO', 0, 181),
(182, 'C/HEX C/AI RAN T/23', '10-32*3/4', 'TROPICALIZADO', 2.88, '-', 0, '-', '0000-00-00', 499, '-', 'T/TERMICO', 0, 182),
(183, 'C/HEX C/AI RAN T/23', '10-32*1/2', 'TROPICALIZADO', 2.22, '-', 0, '-', '0000-00-00', 385, '-', 'T/TERMICO', 0, 183),
(184, 'C/HEX C/AI RAN T/23', '1/4-20*1/2', 'TROPICALIZADO', 4.44, '-', 0, '-', '0000-00-00', 690, '-', 'T/TERMICO', 0, 184),
(185, 'C/HEX C/AI  T/23', '1/4-20*1/2', 'GALVANIZADO', 4.44, '-', 0, '-', '0000-00-00', 690, '-', 'T/TERMICO', 0, 185),
(186, 'C/HEX C/AI RAN T/23', '1/4-20*1', 'GALVANIZADO', 6.81, '-', 0, '-', '0000-00-00', 1095, '-', 'T/TERMICO', 0, 186),
(187, 'C/HEX C/AI  T/23', '1/4-20*3/4', 'TROPICALIZADO', 6.81, '-', 0, '-', '0000-00-00', 1095, '-', 'T/TERMICO', 0, 187),
(188, 'C/HEX C/AI  T/23', '1/4-20*1', 'GALVANIZADO', 6.81, '-', 0, '-', '0000-00-00', 930, '-', 'T/TERMICO', 0, 188),
(189, 'C/OVAL PH T/AB ', '8-18*13', 'GALVANIZADO', 1.58, '-', 0, '-', '0000-00-00', 220, '-', '0', 0, 189),
(190, '', '8*32', '', 3.12, '-', 0, '-', '0000-00-00', 225, '-', 'T/TERMICO', 0, 190),
(191, 'C/FIJ PH T/A', '8-12*1/2', 'GALVANIZADO', 1.58, '-', 0, '-', '0000-00-00', 310, '-', '0', 0, 191),
(192, 'C/FIJ PH T/A', '8*17', 'TROPICALIZADO', 1.84, '-', 0, '-', '0000-00-00', 522, '-', '0', 0, 192),
(193, 'C/HEX RAN C/AI T/233', '10-32*1', 'GALVANIZADO', 3.54, '-', 0, '-', '0000-00-00', 150, '-', 'T/TERMICO', 0, 193),
(194, 'C/FIJ PH T/AB', '4-24*3/16', 'GALVANIZADO', 0.3, '-', 0, '-', '0000-00-00', 170, '-', '0', 0, 194),
(999999, '', '', '', 0, '', 0, '', '0000-00-00', 0, '0', '0', NULL, 999999);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_pedido_compra`
--

CREATE TABLE `t_pedido_compra` (
  `Id_Pedido_Compra` int(11) NOT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Producto` varchar(350) DEFAULT NULL,
  `Factor` float DEFAULT NULL,
  `Medida` varchar(50) DEFAULT NULL,
  `Cantidad` bigint(20) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `FK_Orden_Compra` int(11) DEFAULT NULL,
  `Id_Pedido_FK` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_periodo`
--

CREATE TABLE `t_periodo` (
  `id_periodo` int(11) NOT NULL,
  `fecha_inicio_AP` date DEFAULT NULL,
  `fecha_cierre_AP` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_prestamos`
--

CREATE TABLE `t_prestamos` (
  `id_prestamos` int(11) NOT NULL,
  `fecha_solicitud_P` date DEFAULT NULL,
  `fecha_cierre_P` date DEFAULT NULL,
  `monto_P` int(11) DEFAULT NULL,
  `porcentaje_interes_P` varchar(255) DEFAULT NULL,
  `acumulado_P` bigint(20) DEFAULT NULL,
  `estatus` varchar(255) DEFAULT NULL,
  `semana` bigint(20) DEFAULT NULL,
  `id_empelados_4` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_prestamospendientes`
--

CREATE TABLE `t_prestamospendientes` (
  `id_prestamoP` int(11) NOT NULL,
  `monto_P` int(11) DEFAULT NULL,
  `porcentaje_interes_P` varchar(255) DEFAULT NULL,
  `fecha_inicio_P` date DEFAULT NULL,
  `fecha_cierre_P` date DEFAULT NULL,
  `acumulado_semanal_P` bigint(20) DEFAULT NULL,
  `acumulado_total_P` bigint(20) DEFAULT NULL,
  `total_final_P` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_programa_forjado`
--

CREATE TABLE `t_programa_forjado` (
  `Id_Programa_Forjado` bigint(20) NOT NULL,
  `Id_Produccion_FK` bigint(20) DEFAULT NULL,
  `Fecha_entrega` varchar(15) DEFAULT NULL,
  `Herramental` varchar(250) DEFAULT NULL,
  `no_maquina` int(11) DEFAULT NULL,
  `producto_desc` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_proveedores`
--

CREATE TABLE `t_proveedores` (
  `Id_Proveedor` int(11) NOT NULL,
  `Proveedor` varchar(150) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Ciudad` varchar(20) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Correo` varchar(110) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_proveedores`
--

INSERT INTO `t_proveedores` (`Id_Proveedor`, `Proveedor`, `Direccion`, `Ciudad`, `Telefono`, `Correo`) VALUES
(1, 'EL REY DEL TORNILLO', 'CALLE 4 #379 AGRICOLA PANTITLAN', 'CDMX', '5536169911', 'g@elreydeltornillo.com'),
(2, 'CLAVOS NACIONALES', 'CUAUTITLAN IZCALLI CP 54714 ', 'EDO MEX ', '5091 4141', 'CREDITO@CNMEXICO.COM.MX'),
(3, 'LAMSSA', 'CUAUTITLAN IZCALLI ', 'EDO MEX ', '55 5007 3505', 'JCRESENDIZ@LAMMSA.COM'),
(4, 'TORNILLOS VENUS ', 'ANTROPOLOGOS #98 COL EL TRIUNFO IZTAPALA ', 'CDMX', '56 5633 9584', 'TORNILLOS_VENUS@HOTMAIL.COM'),
(5, 'TOLEDO', 'Av. Tezozómoc No. 235 Col. Industrial San Antonio, C.P. 02760', 'CDMX', '55-5561-1911', 'ventas3@toledo.com.mx'),
(6, 'PRE-MEX', 'CIRCUITO BAHAMAS N.390 COL. LOMAS ESTRELLA ', 'CDMX', '56329230/31', 'eva.lopez@pre-mex.com.mx'),
(7, 'DMT ', 'CALLE 17 CIUDAD INDUSTRIAL MERIDA, YUCATAN ', 'CDMX, YUCATAN ', '5542597346', 'telemarketing12.mexico@dmt.com.mx'),
(8, 'OMAR CALZADA ', '', 'CDMX', '55 2252 9362', ''),
(9, 'FABRICA DE TREFILADOS ', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_puesto`
--

CREATE TABLE `t_puesto` (
  `id_puesto` int(11) NOT NULL,
  `nombrePuesto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_puesto`
--

INSERT INTO `t_puesto` (`id_puesto`, `nombrePuesto`) VALUES
(1, 'Ayudante General'),
(2, 'Gerente de Produccion'),
(3, 'Gerente de Calidad'),
(4, 'Gerente de Compras'),
(5, 'Gerente de Producción'),
(6, 'Gerente de Almacen'),
(7, 'Tornero A+'),
(8, 'Tornero B+'),
(9, 'Recubridor A+'),
(10, 'Recubridor B+'),
(11, 'Forjador A+'),
(12, 'Forjador B+'),
(13, 'Almacenista'),
(14, 'Contador'),
(15, 'Shak y Ranulado A+'),
(16, 'Shak y Ranulado B+'),
(17, 'Compras y RH'),
(18, 'Compras y ventas'),
(19, 'Logístico A+'),
(20, 'Logístico B+'),
(21, 'Rolador A+'),
(22, 'Rolador B+'),
(23, 'Seleccionador'),
(24, 'Secretaria'),
(25, 'Gerente General'),
(26, 'Gerente Administración'),
(28, 'Gerente de Ventas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_registro`
--

CREATE TABLE `t_registro` (
  `id_registro` int(11) NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tipo_registro` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_registro_diario`
--

CREATE TABLE `t_registro_diario` (
  `id_registro_diario` bigint(20) NOT NULL,
  `bote` int(11) DEFAULT NULL,
  `no_maquina` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `pzas` int(11) DEFAULT NULL,
  `kilos` float DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `observaciones` varchar(25) DEFAULT NULL,
  `Id_control_produccion_1` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_registro_diario`
--

INSERT INTO `t_registro_diario` (`id_registro_diario`, `bote`, `no_maquina`, `fecha`, `pzas`, `kilos`, `turno`, `observaciones`, `Id_control_produccion_1`) VALUES
(2, 3, 1, '2023-02-21', 192, 98, 1, 'Sin Observaciones', 1165),
(3, 3, 2, '2023-02-21', 256, 45, 1, 'Herramental', 1165),
(5, 6, 3, '2023-02-21', 600, 195, 1, 'Sin Observaciones', 1),
(6, 6, 4, '2023-02-21', 600, 195, 1, 'Sin Observaciones', 1),
(7, 6, 5, '2023-02-21', 600, 195, 1, 'Sin Observaciones', 1),
(8, 6, 6, '2023-02-21', 954, 2054, 1, 'Sin Observaciones', 1165),
(9, 6, 7, '2023-02-21', 160, 20, 1, 'Sin Observaciones', 1165),
(10, 6, 8, '2023-02-21', 753, 451, 1, 'Sin Observaciones', 1165),
(11, 1, 9, '2023-02-21', 7536, 45, 1, 'Sin Observaciones', 1);

--
-- Disparadores `t_registro_diario`
--
DELIMITER $$
CREATE TRIGGER `actualizar_estado_general` AFTER INSERT ON `t_registro_diario` FOR EACH ROW BEGIN
    DECLARE op INT;
	DECLARE p INT;
	DECLARE estado VARCHAR(25);
	DECLARE primer_registro INT;

	SET op  = (
				SELECT Cantidad
				FROM t_orden_produccion, t_control_produccion
				WHERE t_control_produccion.Id_Produccion_FK_1 = t_orden_produccion.Id_Produccion
				AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
				);
	
	SET p  = (
				SELECT SUM(pzas) 
				FROM t_registro_diario, t_control_produccion 
				WHERE t_control_produccion.id_control_produccion = t_registro_diario.id_control_produccion_1
				AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
			);

	SET estado = (
					SELECT estados 
					FROM t_estados, t_control_produccion 
					WHERE t_estados.id_estados = t_control_produccion.Id_estado_1
					AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
				);

	SET primer_registro = (
							SELECT count(id_registro_diario) 
							FROM t_registro_diario, t_control_produccion 
							WHERE t_registro_diario.Id_control_produccion_1 = t_control_produccion.id_control_produccion
							AND t_registro_diario.Id_control_produccion_1 = NEW.id_control_produccion_1
							AND t_control_produccion.Id_estado_1 = 1
						);


	IF (p >= op) THEN
		UPDATE t_orden_produccion, t_control_produccion
		SET Estado_general = estado 
		WHERE id_control_produccion = NEW.Id_control_produccion_1
		AND t_orden_produccion.Id_Produccion = t_control_produccion.Id_Produccion_FK_1;
	ELSEIF (primer_registro = 1) THEN
		UPDATE t_orden_produccion, t_control_produccion
		SET Estado_general = 'FORJADO'
		WHERE id_control_produccion =  NEW.Id_control_produccion_1
		AND t_orden_produccion.Id_Produccion = t_control_produccion.Id_Produccion_FK_1;
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `modificar_estado_general` AFTER UPDATE ON `t_registro_diario` FOR EACH ROW BEGIN
    DECLARE op INT;
	DECLARE p INT;
	DECLARE estado VARCHAR(25);
	DECLARE primer_registro INT;

	SET op  = (
				SELECT Cantidad
				FROM t_orden_produccion, t_control_produccion
				WHERE t_control_produccion.Id_Produccion_FK_1 = t_orden_produccion.Id_Produccion
				AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
				);
	
	SET p  = (
				SELECT SUM(pzas) 
				FROM t_registro_diario, t_control_produccion 
				WHERE t_control_produccion.id_control_produccion = t_registro_diario.id_control_produccion_1
				AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
			);

	SET estado = (
					SELECT estados 
					FROM t_estados, t_control_produccion 
					WHERE t_estados.id_estados = t_control_produccion.Id_estado_1
					AND t_control_produccion.id_control_produccion = NEW.Id_control_produccion_1
				);

	SET primer_registro = (
							SELECT count(id_registro_diario) 
							FROM t_registro_diario, t_control_produccion 
							WHERE t_registro_diario.Id_control_produccion_1 = t_control_produccion.id_control_produccion
							AND t_registro_diario.Id_control_produccion_1 = NEW.id_control_produccion_1
							AND t_control_produccion.Id_estado_1 = 1
						);


	IF (p >= op) THEN
		UPDATE t_orden_produccion, t_control_produccion
		SET Estado_general = estado 
		WHERE id_control_produccion = NEW.Id_control_produccion_1
		AND t_orden_produccion.Id_Produccion = t_control_produccion.Id_Produccion_FK_1;
	ELSEIF (primer_registro = 1) THEN
		UPDATE t_orden_produccion, t_control_produccion
		SET Estado_general = 'FORJADO'
		WHERE id_control_produccion =  NEW.Id_control_produccion_1
		AND t_orden_produccion.Id_Produccion = t_control_produccion.Id_Produccion_FK_1;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_reportes_prestamos`
--

CREATE TABLE `t_reportes_prestamos` (
  `id_reporte_p` int(11) NOT NULL,
  `id_prestamos_1` int(11) DEFAULT NULL,
  `id_aportacion_1` int(11) DEFAULT NULL,
  `id_cajaAhorro_1` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_rol`
--

CREATE TABLE `t_rol` (
  `id_rol` int(11) NOT NULL,
  `nombreRol` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_rol`
--

INSERT INTO `t_rol` (`id_rol`, `nombreRol`) VALUES
(1, 'SuperUsuario'),
(2, 'Administrativo'),
(3, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_salida_almacen`
--

CREATE TABLE `t_salida_almacen` (
  `Id_Folio` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT 0,
  `Id_Cotizacion_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_salida_almacen`
--

INSERT INTO `t_salida_almacen` (`Id_Folio`, `Fecha`, `Estado`, `Id_Cotizacion_FK`) VALUES
(1, '2023-01-15', 0, 103),
(2, '2023-01-15', 0, 104),
(3, '2022-01-14', 0, 13),
(4, '2022-01-14', 0, 14),
(5, '2022-01-18', 0, 17),
(6, '2022-01-18', 0, 18),
(7, '2022-01-18', 0, 19),
(8, '2022-01-18', 0, 20),
(9, '2022-01-18', 0, 21),
(10, '2022-01-18', 0, 22),
(11, '2022-01-18', 0, 23),
(12, '2022-01-18', 0, 24),
(13, '2022-02-17', 0, 76),
(14, '2022-02-24', 0, 88),
(11130, '2022-01-26', 0, 46),
(12267, '2022-01-05', 0, 1),
(12270, '2022-01-10', 0, 2),
(12271, '2022-01-10', 0, 3),
(12272, '2022-01-10', 0, 4),
(12273, '2022-01-11', 0, 5),
(12274, '2022-01-11', 0, 6),
(12275, '2022-01-11', 0, 7),
(12276, '2022-01-11', 0, 8),
(12277, '2022-01-11', 0, 9),
(12278, '2022-01-14', 0, 10),
(12280, '2022-01-14', 0, 11),
(12281, '2022-01-14', 0, 12),
(12285, '2022-01-17', 0, 15),
(12287, '2022-01-17', 0, 16),
(12290, '2022-01-18', 0, 25),
(12291, '2022-01-18', 0, 26),
(12292, '2022-01-18', 0, 27),
(12293, '2022-01-18', 0, 28),
(12294, '2022-01-18', 0, 29),
(12298, '2022-01-20', 0, 30),
(12299, '2022-01-20', 0, 31),
(12300, '2022-01-20', 0, 32),
(12301, '2022-01-20', 0, 33),
(12302, '2022-01-20', 0, 34),
(12303, '2022-01-20', 0, 35),
(12304, '2022-01-21', 0, 36),
(12305, '2022-01-21', 0, 37),
(12307, '2022-01-24', 0, 38),
(12308, '2022-01-24', 0, 39),
(12309, '2022-01-24', 0, 40),
(12312, '2022-01-26', 0, 41),
(12313, '2022-01-26', 0, 42),
(12314, '2022-01-26', 0, 43),
(12315, '2022-01-26', 0, 44),
(12316, '2022-01-26', 0, 45),
(12326, '2022-01-28', 0, 47),
(12329, '2022-01-28', 0, 49),
(12330, '2022-01-28', 0, 48),
(12336, '2023-01-15', 0, 111),
(12337, '2022-02-02', 0, 50),
(12338, '2022-02-03', 0, 54),
(12339, '2022-02-02', 0, 51),
(12340, '2022-02-03', 0, 52),
(12341, '2022-02-03', 0, 53),
(12344, '2022-02-04', 0, 55),
(12345, '2022-02-04', 0, 56),
(12346, '2022-02-08', 0, 57),
(12347, '2022-02-09', 0, 58),
(12355, '2022-02-10', 0, 59),
(12356, '2022-02-10', 0, 60),
(12359, '2022-02-10', 0, 61),
(12370, '2022-02-10', 0, 62),
(12371, '2022-02-11', 0, 63),
(12372, '2022-02-11', 0, 64),
(12373, '2022-02-11', 0, 65),
(12374, '2022-02-11', 0, 66),
(12375, '2022-02-11', 0, 67),
(12376, '2022-02-11', 0, 68),
(12377, '2022-02-11', 0, 69),
(12385, '2022-02-16', 0, 70),
(12386, '2022-02-16', 0, 71),
(12387, '2022-02-16', 0, 72),
(12388, '2022-02-17', 0, 73),
(12389, '2022-02-17', 0, 74),
(12390, '2022-02-17', 0, 75),
(12398, '2022-02-18', 0, 77),
(12399, '2022-02-18', 0, 78),
(12400, '2022-02-21', 0, 79),
(12401, '2022-02-21', 0, 80),
(12402, '2022-02-21', 0, 81),
(12403, '2022-02-21', 0, 82),
(12404, '2022-02-21', 0, 83),
(12405, '2022-02-22', 0, 84),
(12409, '2022-02-23', 0, 86),
(12410, '2022-02-23', 0, 87),
(12412, '2022-02-25', 0, 89),
(12414, '2022-02-25', 0, 91),
(12415, '2023-01-15', 0, 144),
(12417, '2023-01-15', 0, 90),
(12418, '2023-01-15', 0, 92),
(12419, '2023-01-15', 0, 93),
(12420, '2023-01-15', 0, 94),
(12421, '2023-01-15', 0, 95),
(12422, '2023-01-15', 0, 96),
(12423, '2023-01-15', 0, 97),
(12424, '2023-01-15', 0, 98),
(12425, '2023-01-15', 0, 99),
(12426, '2023-01-15', 0, 100),
(12427, '2023-01-15', 0, 101),
(12428, '2023-01-15', 0, 102),
(12429, '2023-01-15', 0, 105),
(12432, '2023-01-15', 0, 106),
(12433, '2023-01-15', 0, 107),
(12434, '2023-01-15', 0, 108),
(12435, '2023-01-15', 0, 109),
(12436, '2023-01-15', 0, 143),
(12438, '2023-01-15', 0, 110),
(12440, '2023-01-15', 0, 112),
(12441, '2023-01-15', 0, 113),
(12443, '2023-01-15', 0, 114),
(12444, '2023-01-15', 0, 115),
(12445, '2023-01-15', 0, 116),
(12446, '2023-01-15', 0, 117),
(12447, '2023-01-15', 0, 118),
(12448, '2023-01-15', 0, 119),
(12449, '2023-01-15', 0, 120),
(12450, '2023-01-15', 0, 121),
(12452, '2023-01-15', 0, 122),
(12453, '2023-01-15', 0, 123),
(12454, '2023-01-15', 0, 124),
(12455, '2023-01-15', 0, 125),
(12456, '2023-01-15', 0, 126),
(12457, '2023-01-15', 0, 127),
(12473, '2023-01-15', 0, 128),
(12474, '2023-01-15', 0, 129),
(12475, '2023-01-15', 0, 130),
(12476, '2023-01-15', 0, 131),
(12477, '2023-01-15', 0, 132),
(12479, '2023-01-15', 0, 133),
(12480, '2023-01-15', 0, 134),
(12481, '2023-01-15', 0, 135),
(12482, '2023-01-15', 0, 136),
(12483, '2023-01-15', 0, 137),
(12487, '2023-01-15', 0, 138),
(12488, '2023-01-15', 0, 139),
(12491, '2023-01-15', 0, 140),
(12492, '2023-01-15', 0, 141),
(12493, '2023-01-15', 0, 142),
(12499, '2023-01-15', 0, 145),
(12500, '2023-01-15', 0, 146),
(12503, '2023-01-15', 0, 147),
(12504, '2023-01-15', 0, 148),
(12505, '2023-02-15', 0, 149),
(12506, '2023-02-15', 0, 150),
(12507, '2023-02-15', 0, 151),
(12508, '2023-02-15', 0, 152),
(12509, '2023-02-15', 0, 153),
(12510, '2023-02-15', 0, 154),
(12511, '2023-02-15', 0, 156),
(12512, '2023-02-15', 0, 157),
(12514, '2023-02-15', 0, 155),
(12515, '2023-02-15', 0, 158),
(12526, '2023-02-15', 0, 159),
(12527, '2023-02-15', 0, 160),
(12528, '2023-02-15', 0, 161),
(12529, '2023-02-15', 0, 162),
(12530, '2023-02-15', 0, 163),
(12531, '2023-02-15', 0, 164),
(12532, '2023-02-15', 0, 165),
(12533, '2023-02-15', 0, 166),
(12534, '2023-02-15', 0, 167),
(12535, '2023-02-15', 0, 168),
(12536, '2023-02-15', 0, 169),
(12542, '2023-02-15', 0, 170),
(12543, '2023-02-15', 0, 175),
(12544, '2023-02-15', 0, 174),
(12545, '2023-02-15', 0, 173),
(12546, '2023-02-15', 0, 172),
(12547, '2023-02-15', 0, 171),
(12548, '2023-02-15', 0, 176),
(12549, '2023-02-15', 0, 177),
(12550, '2023-02-15', 0, 178),
(12551, '2023-02-15', 0, 179),
(12552, '2023-02-15', 0, 180),
(12553, '2023-02-15', 0, 181),
(12554, '2023-02-15', 0, 182),
(12555, '2023-02-15', 0, 183),
(12556, '2023-02-15', 0, 184),
(12557, '2023-02-15', 0, 185),
(12558, '2023-02-15', 0, 186),
(12559, '2023-02-15', 0, 187),
(12560, '2023-02-15', 0, 188),
(12561, '2023-02-15', 0, 189),
(12563, '2023-02-15', 0, 190),
(12564, '2023-02-15', 0, 191),
(12572, '2023-02-15', 0, 192),
(12573, '2023-02-15', 0, 193),
(12574, '2023-02-15', 0, 194),
(23407, '2022-02-23', 0, 85);

--
-- Disparadores `t_salida_almacen`
--
DELIMITER $$
CREATE TRIGGER `cancelar_factura` AFTER UPDATE ON `t_salida_almacen` FOR EACH ROW BEGIN

	IF (NEW.Estado = 1) THEN
		UPDATE 
			t_salida_almacen,
			t_clientes,
			t_pedido,
			t_cotizacion,
			t_facturacion
		SET 
			t_facturacion.Concepto = 4 
		WHERE 
			t_cotizacion.Id_Cotizacion = t_salida_almacen.Id_Cotizacion_FK
			AND t_cotizacion.Id_Clientes_FK = t_clientes.Id_Clientes
			AND t_cotizacion.Id_Cotizacion = t_pedido.Id_Cotizacion_FK
			AND t_facturacion.Id_Pedido_FK = t_pedido.Id_Pedido
			AND t_cotizacion.Id_Cotizacion = NEW.Id_Cotizacion_FK;
	END IF;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuario`
--

CREATE TABLE `t_usuario` (
  `usuario` varchar(50) NOT NULL,
  `id_empleado_1` int(11) DEFAULT NULL,
  `id_rol_1` int(11) DEFAULT NULL,
  `contrasena` varchar(65) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_usuario`
--

INSERT INTO `t_usuario` (`usuario`, `id_empleado_1`, `id_rol_1`, `contrasena`) VALUES
('fmtor-000', 120, 2, ''),
('fmtor-001', 1, 2, '$2y$10$jBjq7ZDl3x.RNisawtTqD.mXhGkgoYkUT2/psDJXXXxCDIFZgvQim'),
('fmtor-002', 2, 2, '$2y$10$MhR2BlXsE8tp9xYMkO5B9eitiSILMF5Q4JdaDPaBc7Lp.ID7zpE.C'),
('fmtor-003', 3, 2, '$2y$10$lh1j3KtpJolGo2xuy90eR.brCEGew2eXzLbvYa5JnjcjSRjcPKeq.'),
('fmtor-004', 4, 2, '$2y$10$CSMdEi2gtfvpcn9qXWFid.yOF8zfT8xUwKVup5kM4TBpJisqREcrq'),
('fmtor-005', 5, 2, '$2y$10$2PpQ9xIIBQrk2MD.m7YQou8PLCdlT7cdjwfagnCTmnAJqFaOidfdG'),
('fmtor-006', 6, 2, '$2y$10$Deeeuty82bqsFrQyM7KHe.XbVhfwBHqpWOKpwvV/Jz3I3yTKJI9My'),
('fmtor-007', 7, 2, '$2y$10$W/t04KboK2E7WoXEVbaFNeZKIjUOYxmmykFnsUVFPiF37CM6ds1P2'),
('fmtor-008', 8, 2, '$2y$10$u4/FtVuqFaCkbHsuue/uruooOwXUKBVMFjwrzhZGylAvXVuLxm63G'),
('fmtor-009', 9, 2, '$2y$10$LuAG0uRsUAvpFqw4/EFE5.w0JqixMgfyNPB42XfhWhY.e/sxj5x5a'),
('fmtor-010', 10, 2, '$2y$10$QfZB/ZyEs0erT6qq/C1IA.xgLEFmivdU/p51K.8PmObTLS5KKw702'),
('fmtor-011', 11, 2, '$2y$10$EFZwq43bJMP8gGcDovwJheg7TKm8qAC55JmpdfGpkyfzhZWuQvXMm'),
('fmtor-012', 12, 2, '$2y$10$Pb9V4DXTd3K3tg7VS3b.suZ8KUgak6exm48QSSu1JXnxc/XQR0.dK'),
('fmtor-013', 13, 2, '$2y$10$uRg/w/ret3ddIGZxZOq27evW4x.KEog6GJEei9jQB9TlftzHumVNa'),
('fmtor-014', 14, 2, '$2y$10$hw0Iw6F5d0zzER6B2H6Zsel3Uwwjzc8YDI1mi1xpxF48j4CDZpcBO'),
('fmtor-015', 15, 2, '$2y$10$9Q7u7/1b8gaaHer4ENNkeO0O8R18SgciEWc5NI0hL0PGWjnINBoNW'),
('fmtor-016', 16, 2, '$2y$10$3kK7H5hs0yo8IVV8Xx3dEOWvq6xng9hzIns2QLfaLMkHKMBXD6fx6'),
('fmtor-017', 17, 2, '$2y$10$ROQp5FpwQevOASsyTOjwe.9rBwyMox/mzBzbfxqZvhAo7MKlNvMtC'),
('fmtor-018', 18, 2, '$2y$10$pB/FlpePfecdOk6xeDUz1.7i6.jQ6AaMaIFY7zFMw09x7zMGUkH6G'),
('fmtor-019', 20, 2, '$2y$10$j7.LtTKVsx6EZTrNtAkNmueahhdh/P/aV/S6XZMQl4u2PHQh.TTCS'),
('fmtor-021', 21, 2, '$2y$10$W3C4rraw5fxU2giIcJJkY.UnhqkIFDtxVROn0ovNu8wao2EH975g2'),
('fmtor-022', 22, 2, '$2y$10$6MzEaDwQF44hX4cFfovdjeVZnSqJgftzxojLWzmYidjHqFWECWkeq'),
('fmtor-023', 23, 2, '$2y$10$v7FegMagdC59kc7OwVYns.SqioHQhhLR0THe0rMRyapWgFjZC06jW'),
('fmtor-024', 24, 2, '$2y$10$8Dxu6HN6u3qy/hfmyySfLex83g8.rWD15GoYxKJ7MI/59Idi.ZxqG'),
('fmtor-025', 25, 2, '$2y$10$EyUUR5bki5jYjGAUi7cZiO5CFgpix.NhtpAXGxX.AA1mHNdRjWGma'),
('fmtor-026', 26, 2, '$2y$10$he3ocE35vmbpcme6bwk3rexC6lj6U7TynDH/PF93nfq4YQIMhZWi6'),
('fmtor-027', 27, 2, '$2y$10$QdYJEDGZ0sMQdB3fdH6bSuiPBTUnugtVu2/ExZEdSdMGavrLVwjU.'),
('fmtor-028', 28, 2, '$2y$10$ezQX84jAeo1uw6p7VNFzz.dNdfs9CWBZpS/qEwMcnGLuEAwUTCc0q'),
('fmtor-029', 29, 2, '$2y$10$6Xnreouc5Q.6vqNWt/FB.uSayPStYEVsUx/tFbi7H01lAk8uVOF4e'),
('fmtor-030', 30, 2, '$2y$10$PUU7QYANQQP4THDOV1cc3elxT.PNqMfdCE9OvKBIvp2V5vYqQ2EcK'),
('fmtor-031', 31, 2, '$2y$10$UGFrsJnxuxgE4DZ1mevL1.VMBRVCSC8J7EayiY.Q2vxIerS1ovGmm'),
('fmtor-032', 32, 2, '$2y$10$lE1CbIc9kwLoN4KnSf4zzOC76ACFeuWX8gtu2ST9HqUjYKjpS1S0.'),
('fmtor-034', 34, 2, '$2y$10$16CwwMFsApwjlJZJKMgHSuriYdp1oaYWKEm4ytOQzwMGD4IQ4qtIS'),
('fmtor-035', 35, 3, '$2y$10$C2B7PUxJoL1iYRu.4.DaReW2kOSSgRnLBLKgrk5rdsOzecdJHhC86'),
('fmtor-036', 36, 1, '$2y$10$G35hp8jRyeaOsLJpx2rrfeS9V.6jaJT5tTayMpMC1j7pf8Gv8M43S'),
('fmtor-037', 37, 1, '$2y$10$lxAvhkZ3Pf3zEgvSlzC44eOPcEjM3WgvQdM8Z45M5YF9is5jHxBKK'),
('fmtor-038', 38, 2, '$2y$10$8zmPidyxLEHhgTyMe6mwNuDeJwlWyjN3cIKlKiNf.8I41H9l5k8AO'),
('fmtor-039-A', 81, 2, '$2y$10$bnB/Z62UKXDyqWcMMY2s8OVg/Ba5j8Kmn4IvuuohTFWv6oCyL9Q3.'),
('fmtor-040-A', 82, 2, '$2y$10$NWOa0G96nNZB.BHBJnFA3.YfXdxr54L4QuXX769mN56.h0AUi27Ei'),
('fmtor-041-A', 83, 2, '$2y$10$monub8X6YXw6aiglGBUmFuYbTuXjQld4l97W/H7Pc93MKYszLnkWu'),
('fmtor-042-A', 84, 2, '$2y$10$qDreGRXusXIhEMAF0Vki6OnMr/Cxj22p6FRqnZgo3.zv2nEFf6ZX.'),
('fmtor-043-A', 85, 2, '$2y$10$lumrrfI4I6vlg/m1E9Cw6eylAHe8JvJsDPLZxFgyE7GGZkz6GbbIe'),
('fmtor-044-U', 87, 2, '$2y$10$8tFgo23r0EKtEyhu6PE09u/HwYkJ5D38OABwtUOkiHFxMRYILn28y'),
('fmtor-045-U', 88, 2, '$2y$10$nOwGFHaKtbRt6suDnZ0JqeQUNraq0Zll2y5ngSMmtmKDTgADlWe3y'),
('fmtor-046-U', 89, 2, '$2y$10$jkzZM7TxsAapoZGQU2mpBOLF2JLDDu/CjKwnrWd3UxlVYR9m8nFLC'),
('fmtor-047U', 93, 2, '$2y$10$NbGyWMmHh7XIZKASW/3pzelRjQ08s4F/YpuKG/vLk7Xm7lBwni02e'),
('fmtor-048A', 94, 2, '$2y$10$MiZPqKQqKZL/OoG/aWVyb.0vUZ6PTRBmfZI9beC0r9R3aj64ZbFIG');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_acabado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_acabado` (
`id_registro_diario` bigint(20)
,`no_maquina` int(11)
,`bote` int(11)
,`fecha` date
,`pzas` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`Id_Produccion_FK_1` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_cementado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_cementado` (
`id_registro_diario` bigint(20)
,`no_maquina` int(11)
,`bote` int(11)
,`fecha` date
,`pzas` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`Id_Produccion_FK_1` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_clientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_clientes` (
`Id_Clientes` int(11)
,`Razon_social` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_control`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_control` (
`Orden_Produccion` bigint(20)
,`Factor` float
,`Cliente` int(11)
,`razon_social` varchar(50)
,`Fecha` date
,`cantidad_elaborar` double
,`descripcion` varchar(101)
,`tratamiento` varchar(100)
,`material` varchar(100)
,`acabados` varchar(50)
,`plano` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_cotizacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_cotizacion` (
`id_cotizacion` int(11)
,`id_clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_cotizaciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_cotizaciones` (
`id_cotizacion` int(11)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`nombre` varchar(50)
,`telefono` varchar(50)
,`correo` varchar(50)
,`fecha` date
,`cantidad` int(11)
,`no_parte` varchar(50)
,`pedido_cliente` varchar(100)
,`costo` double
,`fecha_entrega` date
,`medida` varchar(50)
,`descripcion` varchar(50)
,`acabado` varchar(50)
,`material` varchar(100)
,`factor` float
,`tratamiento` varchar(100)
,`Id_Pedido` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_empresa`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_empresa` (
`Id_Empresa` int(11)
,`Empresa` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_estado_op`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_estado_op` (
`Id_Folio` bigint(20)
,`Fecha` date
,`Clientes` int(11)
,`descripcion` varchar(101)
,`tratamiento` varchar(100)
,`material` varchar(100)
,`cantidad_elaborar` double
,`precio_millar` double
,`TOTAL` double
,`estado_general` varchar(25)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_facuracion_salida`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_facuracion_salida` (
`id_folio` int(11)
,`factura` varchar(30)
,`empaque` varchar(30)
,`cantidad` bigint(20)
,`kilos` float
,`concepto` tinyint(1)
,`id_empresa` int(11)
,`empresa` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_forjado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_forjado` (
`id_registro_diario` bigint(20)
,`no_maquina` int(11)
,`bote` int(11)
,`fecha` date
,`pzas` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`Id_Produccion_FK_1` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_historial_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_historial_cliente` (
`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`cantidad` int(11)
,`no_parte` varchar(50)
,`pedido_cliente` varchar(100)
,`costo` double
,`fecha_entrega` date
,`medida` varchar(50)
,`descripcion` varchar(50)
,`acabados` varchar(50)
,`material` varchar(100)
,`Id_Pedido` bigint(20)
,`kardex` int(11)
,`Factor` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_historial_compra`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_historial_compra` (
`id_folio` int(11)
,`id_compra` int(11)
,`empresa` varchar(150)
,`fk_empresa` int(11)
,`codigo` varchar(50)
,`producto` varchar(350)
,`factor` float
,`medida` varchar(50)
,`cantidad` bigint(20)
,`precio` float
,`id_pedido_compra` int(11)
,`id_pedido` bigint(20)
,`proveedor` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_historial_salidas_almacen`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_historial_salidas_almacen` (
`id_folio` int(11)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`cantidad` int(11)
,`no_parte` varchar(50)
,`pedido_cliente` varchar(100)
,`costo` double
,`fecha_entrega` date
,`medida` varchar(50)
,`descripcion` varchar(50)
,`acabados` varchar(50)
,`material` varchar(100)
,`Id_Pedido` bigint(20)
,`kardex` int(11)
,`Factor` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_informacion_pedido`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_informacion_pedido` (
`cantidad` int(11)
,`no_parte` varchar(50)
,`pedido_cliente` varchar(100)
,`costo` double
,`fecha_entrega` date
,`medida` varchar(50)
,`descripcion` varchar(50)
,`acabados` varchar(50)
,`material` varchar(100)
,`Id_Pedido` bigint(20)
,`Factor` float
,`Id_Produccion` bigint(20)
,`Id_Catalogo_FK` varchar(50)
,`cantidad_elaborar` double
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_info_registro_diario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_info_registro_diario` (
`id_registro_diario` bigint(20)
,`bote` int(11)
,`no_maquina` int(11)
,`fecha` date
,`pzas` int(11)
,`kilos` float
,`turno` int(11)
,`observaciones` varchar(25)
,`Id_estado_1` int(11)
,`Id_Produccion_FK_1` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_login`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_login` (
`id_empleados` int(11)
,`usuario` varchar(50)
,`foto` longblob
,`nombre_completo` text
,`nombreRol` varchar(255)
,`nombre_departamento` varchar(50)
,`nombrePuesto` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_ordenes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_ordenes` (
`razon_social` varchar(50)
,`calibre` float
,`Id_Folio` bigint(20)
,`Id_Catalogo` varchar(50)
,`cantidad_elaborar` double
,`estado_general` varchar(25)
,`Fecha` date
,`Clientes` int(11)
,`factor` float
,`Id_Salida_FK` int(11)
,`Id_Pedido` bigint(20)
,`medida` varchar(50)
,`descripcion` varchar(50)
,`tratamiento` varchar(100)
,`material` varchar(100)
,`acabados` varchar(50)
,`precio_millar` double
,`TOTAL` double
,`fecha_entrega` date
,`codigo` varchar(50)
,`Pedido_pza` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_orden_compra`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_orden_compra` (
`Id_Compra` int(11)
,`Fecha` date
,`Solicitado` varchar(50)
,`Terminos` varchar(350)
,`Contacto` varchar(350)
,`Proveedor` varchar(150)
,`Empresa` varchar(150)
,`FK_Empresa` int(11)
,`FK_Proveedor` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_programa_forjado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_programa_forjado` (
`Id_Programa_Forjado` bigint(20)
,`Calibre` float
,`factor` float
,`Id_Produccion` bigint(20)
,`Fecha` date
,`Clientes` int(11)
,`medida` varchar(50)
,`descripcion` varchar(50)
,`acabados` varchar(50)
,`cantidad_elaborar` double
,`precio_millar` double
,`Fecha_entrega` varchar(15)
,`Herramental` varchar(250)
,`producto_desc` varchar(100)
,`tratamiento` varchar(100)
,`TOTAL` double
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_proveedor`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_proveedor` (
`Id_Proveedor` int(11)
,`Proveedor` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_ranurado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_ranurado` (
`id_registro_diario` bigint(20)
,`no_maquina` int(11)
,`bote` int(11)
,`fecha` date
,`pzas` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`Id_Produccion_FK_1` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reportediario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reportediario` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`estado_general` varchar(25)
,`Id_Folio` bigint(20)
,`Clientes` int(11)
,`kilos` float
,`pzas` int(11)
,`Maquina` int(11)
,`descripcion` varchar(50)
,`observaciones` varchar(25)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_acabado_kilos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_acabado_kilos` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_acabado_pzas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_acabado_pzas` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`pzas` int(11)
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_forjado_kilos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_forjado_kilos` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_forjado_pzas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_forjado_pzas` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`pzas` int(11)
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_ranurado_kilos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_ranurado_kilos` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_ranurado_pzas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_ranurado_pzas` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`pzas` int(11)
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_rolado_kilos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_rolado_kilos` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_rolado_pzas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_rolado_pzas` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`pzas` int(11)
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_shank_kilos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_shank_kilos` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_reporte_shank_pzas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_reporte_shank_pzas` (
`id_registro_diario` bigint(20)
,`fecha` date
,`turno` int(11)
,`pzas` int(11)
,`observaciones` varchar(25)
,`no_maquina` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_rolado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_rolado` (
`id_registro_diario` bigint(20)
,`no_maquina` int(11)
,`bote` int(11)
,`fecha` date
,`pzas` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`Id_Produccion_FK_1` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_almacen`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_almacen` (
`id_folio` int(11)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`estado` tinyint(1)
,`id_cotizacion` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_almacen_canceladas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_almacen_canceladas` (
`id_folio` varchar(30)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`cantidad` bigint(20)
,`kilos` float
,`costo` double
,`factura` varchar(30)
,`empaque` varchar(30)
,`fecha_entrega` date
,`Id_Pedido` bigint(20)
,`Factor` float
,`Estado` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_almacen_comision`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_almacen_comision` (
`id_folio` varchar(30)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`cantidad` bigint(20)
,`kilos` float
,`costo` double
,`factura` varchar(30)
,`empaque` varchar(30)
,`fecha_entrega` date
,`Id_Pedido` bigint(20)
,`Factor` float
,`Estado` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_almacen_compra`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_almacen_compra` (
`id_folio` varchar(30)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`cantidad` bigint(20)
,`kilos` float
,`costo` double
,`factura` varchar(30)
,`empaque` varchar(30)
,`fecha_entrega` date
,`Id_Pedido` bigint(20)
,`Factor` float
,`Estado` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_almacen_externo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_almacen_externo` (
`id_folio` int(11)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`id_empresa` int(11)
,`empresa` varchar(150)
,`fecha` date
,`estado` tinyint(1)
,`id_cotizacion` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_almacen_notas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_almacen_notas` (
`id_folio` varchar(30)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`cantidad` bigint(20)
,`kilos` float
,`costo` double
,`factura` varchar(30)
,`empaque` varchar(30)
,`fecha_entrega` date
,`Id_Pedido` bigint(20)
,`Factor` float
,`Estado` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_almacen_terminadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_almacen_terminadas` (
`id_folio` varchar(30)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`cantidad` bigint(20)
,`kilos` float
,`costo` double
,`factura` varchar(30)
,`empaque` varchar(30)
,`fecha_entrega` date
,`Id_Pedido` bigint(20)
,`Factor` float
,`Estado` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_almacen_terminadas_rdg`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_almacen_terminadas_rdg` (
`id_folio` varchar(30)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
,`fecha` date
,`cantidad` bigint(20)
,`kilos` float
,`costo` double
,`factura` varchar(30)
,`empaque` varchar(30)
,`fecha_entrega` date
,`Id_Pedido` bigint(20)
,`Factor` float
,`Estado` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_salidas_disponibles`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_salidas_disponibles` (
`id_folio` int(11)
,`Id_Clientes` int(11)
,`razon_social` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_shank`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_shank` (
`id_registro_diario` bigint(20)
,`no_maquina` int(11)
,`bote` int(11)
,`fecha` date
,`pzas` int(11)
,`kilos` float
,`observaciones` varchar(25)
,`Id_Produccion_FK_1` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_acabado`
--
DROP TABLE IF EXISTS `v_acabado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_acabado`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`no_maquina` AS `no_maquina`, `t_registro_diario`.`bote` AS `bote`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_control_produccion`.`Id_Produccion_FK_1` AS `Id_Produccion_FK_1` FROM ((`t_registro_diario` join `t_estados`) join `t_control_produccion`) WHERE `t_estados`.`id_estados` = `t_control_produccion`.`Id_estado_1` AND `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_estados`.`estados` = 'ACABADO''ACABADO'  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_cementado`
--
DROP TABLE IF EXISTS `v_cementado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cementado`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`no_maquina` AS `no_maquina`, `t_registro_diario`.`bote` AS `bote`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_control_produccion`.`Id_Produccion_FK_1` AS `Id_Produccion_FK_1` FROM ((`t_registro_diario` join `t_estados`) join `t_control_produccion`) WHERE `t_estados`.`id_estados` = `t_control_produccion`.`Id_estado_1` AND `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_estados`.`estados` = 'CEMENTADO''CEMENTADO'  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_clientes`
--
DROP TABLE IF EXISTS `v_clientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_clientes`  AS SELECT `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `Razon_social` FROM `t_clientes` ORDER BY `t_clientes`.`Razon_social` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_control`
--
DROP TABLE IF EXISTS `v_control`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_control`  AS SELECT `t_orden_produccion`.`Id_Produccion` AS `Orden_Produccion`, `t_pedido`.`Factor` AS `Factor`, `t_cotizacion`.`Id_Clientes_FK` AS `Cliente`, `t_clientes`.`Razon_social` AS `razon_social`, `t_salida_almacen`.`Fecha` AS `Fecha`, `t_orden_produccion`.`Cantidad` AS `cantidad_elaborar`, concat(`t_pedido`.`Descripcion`,' ',`t_pedido`.`Medida`) AS `descripcion`, `t_pedido`.`Tratamiento` AS `tratamiento`, `t_pedido`.`Material` AS `material`, `t_pedido`.`Acabado` AS `acabados`, `t_orden_produccion`.`Id_Catalogo_FK` AS `plano` FROM ((((`t_salida_almacen` join `t_pedido`) join `t_orden_produccion`) join `t_clientes`) join `t_cotizacion`) WHERE `t_pedido`.`Id_Pedido` = `t_orden_produccion`.`Id_Pedido_FK` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_clientes`.`Id_Clientes` = `t_cotizacion`.`Id_Clientes_FK` AND `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK``Id_Cotizacion_FK`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_cotizacion`
--
DROP TABLE IF EXISTS `v_cotizacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cotizacion`  AS SELECT `t_cotizacion`.`Id_Cotizacion` AS `id_cotizacion`, `t_clientes`.`Id_Clientes` AS `id_clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_cotizacion`.`Fecha` AS `fecha` FROM (`t_clientes` join `t_cotizacion`) WHERE `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` ORDER BY `t_cotizacion`.`Id_Cotizacion` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_cotizaciones`
--
DROP TABLE IF EXISTS `v_cotizaciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cotizaciones`  AS SELECT `t_cotizacion`.`Id_Cotizacion` AS `id_cotizacion`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_clientes`.`Nombre` AS `nombre`, `t_clientes`.`Telefono` AS `telefono`, `t_clientes`.`Correo` AS `correo`, `t_cotizacion`.`Fecha` AS `fecha`, `t_pedido`.`Cantidad_millares` AS `cantidad`, `t_pedido`.`Codigo` AS `no_parte`, `t_pedido`.`Pedido_pza` AS `pedido_cliente`, `t_pedido`.`Precio_millar` AS `costo`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Medida` AS `medida`, `t_pedido`.`Descripcion` AS `descripcion`, `t_pedido`.`Acabado` AS `acabado`, `t_pedido`.`Material` AS `material`, `t_pedido`.`Factor` AS `factor`, `t_pedido`.`Tratamiento` AS `tratamiento`, `t_pedido`.`Id_Pedido` AS `Id_Pedido` FROM ((`t_clientes` join `t_pedido`) join `t_cotizacion`) WHERE `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` ORDER BY `t_cotizacion`.`Id_Cotizacion` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_empresa`
--
DROP TABLE IF EXISTS `v_empresa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_empresa`  AS SELECT `t_informacion_empresa`.`Id_Empresa` AS `Id_Empresa`, `t_informacion_empresa`.`Empresa` AS `Empresa` FROM `t_informacion_empresa``t_informacion_empresa`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_estado_op`
--
DROP TABLE IF EXISTS `v_estado_op`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_estado_op`  AS SELECT `t_orden_produccion`.`Id_Produccion` AS `Id_Folio`, `t_salida_almacen`.`Fecha` AS `Fecha`, `t_cotizacion`.`Id_Clientes_FK` AS `Clientes`, concat(`t_pedido`.`Descripcion`,' ',`t_pedido`.`Medida`) AS `descripcion`, `t_pedido`.`Tratamiento` AS `tratamiento`, `t_pedido`.`Material` AS `material`, `t_orden_produccion`.`Cantidad` AS `cantidad_elaborar`, `t_pedido`.`Precio_millar` AS `precio_millar`, `t_pedido`.`Precio_millar`* `t_orden_produccion`.`Cantidad` AS `TOTAL`, `t_orden_produccion`.`Estado_general` AS `estado_general` FROM (((`t_salida_almacen` join `t_orden_produccion`) join `t_pedido`) join `t_cotizacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_pedido`.`Id_Pedido` = `t_orden_produccion`.`Id_Pedido_FK` AND `t_orden_produccion`.`Estado_general` <> 'TERMINADO' AND `t_orden_produccion`.`Estado_general` <> 'TERMINADA' AND `t_orden_produccion`.`Estado_general` <> 'CANCELADA' AND `t_orden_produccion`.`Estado_general` <> 'CANCELADO' AND `t_salida_almacen`.`Fecha` <> '0000-00-00' ORDER BY `t_orden_produccion`.`Id_Produccion` ASC, `t_salida_almacen`.`Fecha` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_facuracion_salida`
--
DROP TABLE IF EXISTS `v_facuracion_salida`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_facuracion_salida`  AS SELECT `t_salida_almacen`.`Id_Folio` AS `id_folio`, `t_facturacion`.`Factura` AS `factura`, `t_facturacion`.`Empaque` AS `empaque`, `t_facturacion`.`Cantidad_Entregada` AS `cantidad`, `t_facturacion`.`Kilos_Entregados` AS `kilos`, `t_facturacion`.`Concepto` AS `concepto`, `t_facturacion`.`Id_Empresa_FK` AS `id_empresa`, `t_informacion_empresa`.`Empresa` AS `empresa` FROM (((`t_salida_almacen` join `t_facturacion`) join `t_informacion_empresa`) join `t_pedido`) WHERE `t_facturacion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_facturacion`.`Id_Empresa_FK` = `t_informacion_empresa`.`Id_Empresa` ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_forjado`
--
DROP TABLE IF EXISTS `v_forjado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_forjado`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`no_maquina` AS `no_maquina`, `t_registro_diario`.`bote` AS `bote`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_control_produccion`.`Id_Produccion_FK_1` AS `Id_Produccion_FK_1` FROM ((`t_registro_diario` join `t_estados`) join `t_control_produccion`) WHERE `t_estados`.`id_estados` = `t_control_produccion`.`Id_estado_1` AND `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_estados`.`estados` = 'FORJADO''FORJADO'  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_historial_cliente`
--
DROP TABLE IF EXISTS `v_historial_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_historial_cliente`  AS SELECT `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_cotizacion`.`Fecha` AS `fecha`, `t_pedido`.`Cantidad_millares` AS `cantidad`, `t_pedido`.`Codigo` AS `no_parte`, `t_pedido`.`Pedido_pza` AS `pedido_cliente`, `t_pedido`.`Precio_millar` AS `costo`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Medida` AS `medida`, `t_pedido`.`Descripcion` AS `descripcion`, `t_pedido`.`Acabado` AS `acabados`, `t_pedido`.`Material` AS `material`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Kardex` AS `kardex`, `t_pedido`.`Factor` AS `Factor` FROM ((`t_clientes` join `t_pedido`) join `t_cotizacion`) WHERE `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK``Id_Cotizacion_FK`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_historial_compra`
--
DROP TABLE IF EXISTS `v_historial_compra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_historial_compra`  AS SELECT `t_salida_almacen`.`Id_Folio` AS `id_folio`, `t_orden_compra`.`Id_Compra` AS `id_compra`, `t_informacion_empresa`.`Empresa` AS `empresa`, `t_orden_compra`.`FK_Empresa` AS `fk_empresa`, `t_pedido_compra`.`Codigo` AS `codigo`, `t_pedido_compra`.`Producto` AS `producto`, `t_pedido_compra`.`Factor` AS `factor`, `t_pedido_compra`.`Medida` AS `medida`, `t_pedido_compra`.`Cantidad` AS `cantidad`, `t_pedido_compra`.`Precio` AS `precio`, `t_pedido_compra`.`Id_Pedido_Compra` AS `id_pedido_compra`, `t_pedido`.`Id_Pedido` AS `id_pedido`, `t_proveedores`.`Proveedor` AS `proveedor` FROM ((((((`t_salida_almacen` join `t_orden_compra`) join `t_informacion_empresa`) join `t_pedido_compra`) join `t_pedido`) join `t_cotizacion`) join `t_proveedores`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_orden_compra`.`FK_Proveedor` = `t_proveedores`.`Id_Proveedor` AND `t_salida_almacen`.`Id_Cotizacion_FK` = `t_cotizacion`.`Id_Cotizacion` AND `t_pedido`.`Id_Pedido` = `t_pedido_compra`.`Id_Pedido_FK` AND `t_informacion_empresa`.`Id_Empresa` = `t_orden_compra`.`FK_Empresa` AND `t_orden_compra`.`Id_Compra` = `t_pedido_compra`.`FK_Orden_Compra` ORDER BY `t_orden_compra`.`Id_Compra` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_historial_salidas_almacen`
--
DROP TABLE IF EXISTS `v_historial_salidas_almacen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_historial_salidas_almacen`  AS SELECT `t_salida_almacen`.`Id_Folio` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_salida_almacen`.`Fecha` AS `fecha`, `t_pedido`.`Cantidad_millares` AS `cantidad`, `t_pedido`.`Codigo` AS `no_parte`, `t_pedido`.`Pedido_pza` AS `pedido_cliente`, `t_pedido`.`Precio_millar` AS `costo`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Medida` AS `medida`, `t_pedido`.`Descripcion` AS `descripcion`, `t_pedido`.`Acabado` AS `acabados`, `t_pedido`.`Material` AS `material`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Kardex` AS `kardex`, `t_pedido`.`Factor` AS `Factor` FROM (((`t_salida_almacen` join `t_clientes`) join `t_pedido`) join `t_cotizacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_informacion_pedido`
--
DROP TABLE IF EXISTS `v_informacion_pedido`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_informacion_pedido`  AS SELECT `t_pedido`.`Cantidad_millares` AS `cantidad`, `t_pedido`.`Codigo` AS `no_parte`, `t_pedido`.`Pedido_pza` AS `pedido_cliente`, `t_pedido`.`Precio_millar` AS `costo`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Medida` AS `medida`, `t_pedido`.`Descripcion` AS `descripcion`, `t_pedido`.`Acabado` AS `acabados`, `t_pedido`.`Material` AS `material`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Factor` AS `Factor`, `t_orden_produccion`.`Id_Produccion` AS `Id_Produccion`, `t_orden_produccion`.`Id_Catalogo_FK` AS `Id_Catalogo_FK`, `t_orden_produccion`.`Cantidad` AS `cantidad_elaborar` FROM (`t_pedido` join `t_orden_produccion`) WHERE `t_pedido`.`Id_Pedido` = `t_orden_produccion`.`Id_Pedido_FK` ORDER BY `t_pedido`.`Id_Pedido` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_info_registro_diario`
--
DROP TABLE IF EXISTS `v_info_registro_diario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_info_registro_diario`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`bote` AS `bote`, `t_registro_diario`.`no_maquina` AS `no_maquina`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_control_produccion`.`Id_estado_1` AS `Id_estado_1`, `t_control_produccion`.`Id_Produccion_FK_1` AS `Id_Produccion_FK_1` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1``Id_control_produccion_1`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_login`
--
DROP TABLE IF EXISTS `v_login`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_login`  AS SELECT `t_empleados`.`id_empleados` AS `id_empleados`, `t_usuario`.`usuario` AS `usuario`, `t_empleados`.`foto` AS `foto`, concat(`t_empleados`.`nombre`,' ',`t_empleados`.`apellidoP`,' ',`t_empleados`.`apellidoM`) AS `nombre_completo`, `t_rol`.`nombreRol` AS `nombreRol`, `t_departamento`.`nombre_departamento` AS `nombre_departamento`, `t_puesto`.`nombrePuesto` AS `nombrePuesto` FROM ((((`t_empleados` join `t_rol`) join `t_departamento`) join `t_usuario`) join `t_puesto`) WHERE `t_empleados`.`id_empleados` = `t_usuario`.`id_empleado_1` AND `t_rol`.`id_rol` = `t_usuario`.`id_rol_1` AND `t_departamento`.`id_departamento` = `t_empleados`.`id_departamento_2` AND `t_puesto`.`id_puesto` = `t_empleados`.`id_puesto_1` ORDER BY `t_empleados`.`id_empleados` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_ordenes`
--
DROP TABLE IF EXISTS `v_ordenes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ordenes`  AS SELECT `t_clientes`.`Razon_social` AS `razon_social`, `t_orden_produccion`.`Calibre` AS `calibre`, `t_orden_produccion`.`Id_Produccion` AS `Id_Folio`, `t_orden_produccion`.`Id_Catalogo_FK` AS `Id_Catalogo`, `t_orden_produccion`.`Cantidad` AS `cantidad_elaborar`, `t_orden_produccion`.`Estado_general` AS `estado_general`, `t_salida_almacen`.`Fecha` AS `Fecha`, `t_cotizacion`.`Id_Clientes_FK` AS `Clientes`, `t_pedido`.`Factor` AS `factor`, `t_salida_almacen`.`Id_Folio` AS `Id_Salida_FK`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Medida` AS `medida`, `t_pedido`.`Descripcion` AS `descripcion`, `t_pedido`.`Tratamiento` AS `tratamiento`, `t_pedido`.`Material` AS `material`, `t_pedido`.`Acabado` AS `acabados`, `t_pedido`.`Precio_millar` AS `precio_millar`, `t_pedido`.`Precio_millar`* `t_orden_produccion`.`Cantidad` AS `TOTAL`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Codigo` AS `codigo`, `t_pedido`.`Pedido_pza` AS `Pedido_pza` FROM ((((`t_salida_almacen` join `t_pedido`) join `t_orden_produccion`) join `t_clientes`) join `t_cotizacion`) WHERE `t_pedido`.`Id_Pedido` = `t_orden_produccion`.`Id_Pedido_FK` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_clientes`.`Id_Clientes` = `t_cotizacion`.`Id_Clientes_FK` ORDER BY `t_orden_produccion`.`Id_Produccion` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_orden_compra`
--
DROP TABLE IF EXISTS `v_orden_compra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_orden_compra`  AS SELECT `t_orden_compra`.`Id_Compra` AS `Id_Compra`, `t_orden_compra`.`Fecha` AS `Fecha`, `t_orden_compra`.`Solicitado` AS `Solicitado`, `t_orden_compra`.`Terminos` AS `Terminos`, `t_orden_compra`.`Contacto` AS `Contacto`, `t_proveedores`.`Proveedor` AS `Proveedor`, `t_informacion_empresa`.`Empresa` AS `Empresa`, `t_orden_compra`.`FK_Empresa` AS `FK_Empresa`, `t_orden_compra`.`FK_Proveedor` AS `FK_Proveedor` FROM ((`t_orden_compra` join `t_proveedores`) join `t_informacion_empresa`) WHERE `t_orden_compra`.`FK_Proveedor` = `t_proveedores`.`Id_Proveedor` AND `t_orden_compra`.`FK_Empresa` = `t_informacion_empresa`.`Id_Empresa` ORDER BY `t_orden_compra`.`Id_Compra` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_programa_forjado`
--
DROP TABLE IF EXISTS `v_programa_forjado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_programa_forjado`  AS SELECT `t_programa_forjado`.`Id_Programa_Forjado` AS `Id_Programa_Forjado`, `t_orden_produccion`.`Calibre` AS `Calibre`, `t_pedido`.`Factor` AS `factor`, `t_orden_produccion`.`Id_Produccion` AS `Id_Produccion`, `t_salida_almacen`.`Fecha` AS `Fecha`, `t_cotizacion`.`Id_Clientes_FK` AS `Clientes`, `t_pedido`.`Medida` AS `medida`, `t_pedido`.`Descripcion` AS `descripcion`, `t_pedido`.`Acabado` AS `acabados`, `t_orden_produccion`.`Cantidad` AS `cantidad_elaborar`, `t_pedido`.`Precio_millar` AS `precio_millar`, `t_programa_forjado`.`Fecha_entrega` AS `Fecha_entrega`, `t_programa_forjado`.`Herramental` AS `Herramental`, `t_programa_forjado`.`producto_desc` AS `producto_desc`, `t_pedido`.`Tratamiento` AS `tratamiento`, `t_pedido`.`Precio_millar`* `t_pedido`.`Cantidad_millares` AS `TOTAL`, `t_programa_forjado`.`no_maquina` AS `no_maquina` FROM ((((`t_cotizacion` join `t_salida_almacen`) join `t_pedido`) join `t_programa_forjado`) join `t_orden_produccion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_orden_produccion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_orden_produccion`.`Id_Produccion` = `t_programa_forjado`.`Id_Produccion_FK``Id_Produccion_FK`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_proveedor`
--
DROP TABLE IF EXISTS `v_proveedor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_proveedor`  AS SELECT `t_proveedores`.`Id_Proveedor` AS `Id_Proveedor`, `t_proveedores`.`Proveedor` AS `Proveedor` FROM `t_proveedores``t_proveedores`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_ranurado`
--
DROP TABLE IF EXISTS `v_ranurado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ranurado`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`no_maquina` AS `no_maquina`, `t_registro_diario`.`bote` AS `bote`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_control_produccion`.`Id_Produccion_FK_1` AS `Id_Produccion_FK_1` FROM ((`t_registro_diario` join `t_estados`) join `t_control_produccion`) WHERE `t_estados`.`id_estados` = `t_control_produccion`.`Id_estado_1` AND `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_estados`.`estados` = 'RANURADO''RANURADO'  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reportediario`
--
DROP TABLE IF EXISTS `v_reportediario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reportediario`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_estados`.`estados` AS `estado_general`, `t_control_produccion`.`Id_Produccion_FK_1` AS `Id_Folio`, `t_cotizacion`.`Id_Clientes_FK` AS `Clientes`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`no_maquina` AS `Maquina`, `t_pedido`.`Descripcion` AS `descripcion`, `t_registro_diario`.`observaciones` AS `observaciones` FROM (((((`t_control_produccion` join `t_registro_diario`) join `t_estados`) join `t_orden_produccion`) join `t_pedido`) join `t_cotizacion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_orden_produccion`.`Id_Produccion` = `t_control_produccion`.`Id_Produccion_FK_1` AND `t_orden_produccion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_control_produccion`.`Id_estado_1` = `t_estados`.`id_estados` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK``Id_Cotizacion_FK`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_acabado_kilos`
--
DROP TABLE IF EXISTS `v_reporte_acabado_kilos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_acabado_kilos`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 6 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_acabado_pzas`
--
DROP TABLE IF EXISTS `v_reporte_acabado_pzas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_acabado_pzas`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 6 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_forjado_kilos`
--
DROP TABLE IF EXISTS `v_reporte_forjado_kilos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_forjado_kilos`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 1 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_forjado_pzas`
--
DROP TABLE IF EXISTS `v_reporte_forjado_pzas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_forjado_pzas`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 1 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_ranurado_kilos`
--
DROP TABLE IF EXISTS `v_reporte_ranurado_kilos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_ranurado_kilos`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 2 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_ranurado_pzas`
--
DROP TABLE IF EXISTS `v_reporte_ranurado_pzas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_ranurado_pzas`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 2 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_rolado_kilos`
--
DROP TABLE IF EXISTS `v_reporte_rolado_kilos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_rolado_kilos`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 3 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_rolado_pzas`
--
DROP TABLE IF EXISTS `v_reporte_rolado_pzas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_rolado_pzas`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 3 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_shank_kilos`
--
DROP TABLE IF EXISTS `v_reporte_shank_kilos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_shank_kilos`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 4 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_reporte_shank_pzas`
--
DROP TABLE IF EXISTS `v_reporte_shank_pzas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reporte_shank_pzas`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`turno` AS `turno`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_registro_diario`.`no_maquina` AS `no_maquina` FROM (`t_registro_diario` join `t_control_produccion`) WHERE `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_control_produccion`.`Id_estado_1` = 4 ORDER BY `t_registro_diario`.`id_registro_diario` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_rolado`
--
DROP TABLE IF EXISTS `v_rolado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rolado`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`no_maquina` AS `no_maquina`, `t_registro_diario`.`bote` AS `bote`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_control_produccion`.`Id_Produccion_FK_1` AS `Id_Produccion_FK_1` FROM ((`t_registro_diario` join `t_estados`) join `t_control_produccion`) WHERE `t_estados`.`id_estados` = `t_control_produccion`.`Id_estado_1` AND `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_estados`.`estados` = 'ROLADO''ROLADO'  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_almacen`
--
DROP TABLE IF EXISTS `v_salidas_almacen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_almacen`  AS SELECT `t_salida_almacen`.`Id_Folio` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_salida_almacen`.`Fecha` AS `fecha`, `t_salida_almacen`.`Estado` AS `estado`, `t_cotizacion`.`Id_Cotizacion` AS `id_cotizacion` FROM ((`t_cotizacion` join `t_salida_almacen`) join `t_clientes`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_almacen_canceladas`
--
DROP TABLE IF EXISTS `v_salidas_almacen_canceladas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_almacen_canceladas`  AS SELECT `t_facturacion`.`Factura` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_facturacion`.`Fecha` AS `fecha`, `t_facturacion`.`Cantidad_Entregada` AS `cantidad`, `t_facturacion`.`Kilos_Entregados` AS `kilos`, `t_pedido`.`Precio_millar` AS `costo`, `t_facturacion`.`Factura` AS `factura`, `t_facturacion`.`Empaque` AS `empaque`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Factor` AS `Factor`, `t_salida_almacen`.`Estado` AS `Estado` FROM ((((`t_salida_almacen` join `t_clientes`) join `t_pedido`) join `t_cotizacion`) join `t_facturacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_facturacion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_facturacion`.`Concepto` = 4 ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_almacen_comision`
--
DROP TABLE IF EXISTS `v_salidas_almacen_comision`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_almacen_comision`  AS SELECT `t_facturacion`.`Factura` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_facturacion`.`Fecha` AS `fecha`, `t_facturacion`.`Cantidad_Entregada` AS `cantidad`, `t_facturacion`.`Kilos_Entregados` AS `kilos`, `t_pedido`.`Precio_millar` AS `costo`, `t_facturacion`.`Factura` AS `factura`, `t_facturacion`.`Empaque` AS `empaque`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Factor` AS `Factor`, `t_salida_almacen`.`Estado` AS `Estado` FROM ((((`t_salida_almacen` join `t_clientes`) join `t_pedido`) join `t_cotizacion`) join `t_facturacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_facturacion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_salida_almacen`.`Estado` = 0 AND `t_facturacion`.`Concepto` = 2 ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_almacen_compra`
--
DROP TABLE IF EXISTS `v_salidas_almacen_compra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_almacen_compra`  AS SELECT `t_facturacion`.`Factura` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_facturacion`.`Fecha` AS `fecha`, `t_facturacion`.`Cantidad_Entregada` AS `cantidad`, `t_facturacion`.`Kilos_Entregados` AS `kilos`, `t_pedido`.`Precio_millar` AS `costo`, `t_facturacion`.`Factura` AS `factura`, `t_facturacion`.`Empaque` AS `empaque`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Factor` AS `Factor`, `t_salida_almacen`.`Estado` AS `Estado` FROM ((((`t_salida_almacen` join `t_clientes`) join `t_pedido`) join `t_cotizacion`) join `t_facturacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_facturacion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_facturacion`.`Concepto` = 3 ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_almacen_externo`
--
DROP TABLE IF EXISTS `v_salidas_almacen_externo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_almacen_externo`  AS SELECT `t_salida_almacen`.`Id_Folio` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_informacion_empresa`.`Id_Empresa` AS `id_empresa`, `t_informacion_empresa`.`Empresa` AS `empresa`, `t_salida_almacen`.`Fecha` AS `fecha`, `t_salida_almacen`.`Estado` AS `estado`, `t_cotizacion`.`Id_Cotizacion` AS `id_cotizacion` FROM (((`t_cotizacion` join `t_informacion_empresa`) join `t_salida_almacen`) join `t_clientes`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_almacen_notas`
--
DROP TABLE IF EXISTS `v_salidas_almacen_notas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_almacen_notas`  AS SELECT `t_facturacion`.`Factura` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_facturacion`.`Fecha` AS `fecha`, `t_facturacion`.`Cantidad_Entregada` AS `cantidad`, `t_facturacion`.`Kilos_Entregados` AS `kilos`, `t_pedido`.`Precio_millar` AS `costo`, `t_facturacion`.`Factura` AS `factura`, `t_facturacion`.`Empaque` AS `empaque`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Factor` AS `Factor`, `t_salida_almacen`.`Estado` AS `Estado` FROM ((((`t_salida_almacen` join `t_clientes`) join `t_pedido`) join `t_cotizacion`) join `t_facturacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_facturacion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_salida_almacen`.`Estado` = 0 AND `t_facturacion`.`Concepto` = 1 ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_almacen_terminadas`
--
DROP TABLE IF EXISTS `v_salidas_almacen_terminadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_almacen_terminadas`  AS SELECT `t_facturacion`.`Factura` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_facturacion`.`Fecha` AS `fecha`, `t_facturacion`.`Cantidad_Entregada` AS `cantidad`, `t_facturacion`.`Kilos_Entregados` AS `kilos`, `t_pedido`.`Precio_millar` AS `costo`, `t_facturacion`.`Factura` AS `factura`, `t_facturacion`.`Empaque` AS `empaque`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Factor` AS `Factor`, `t_salida_almacen`.`Estado` AS `Estado` FROM ((((`t_salida_almacen` join `t_clientes`) join `t_pedido`) join `t_cotizacion`) join `t_facturacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_facturacion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_facturacion`.`Concepto` = 0 AND `t_facturacion`.`Id_Empresa_FK` = 1 ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_almacen_terminadas_rdg`
--
DROP TABLE IF EXISTS `v_salidas_almacen_terminadas_rdg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_almacen_terminadas_rdg`  AS SELECT `t_facturacion`.`Factura` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social`, `t_facturacion`.`Fecha` AS `fecha`, `t_facturacion`.`Cantidad_Entregada` AS `cantidad`, `t_facturacion`.`Kilos_Entregados` AS `kilos`, `t_pedido`.`Precio_millar` AS `costo`, `t_facturacion`.`Factura` AS `factura`, `t_facturacion`.`Empaque` AS `empaque`, `t_pedido`.`Fecha_entrega` AS `fecha_entrega`, `t_pedido`.`Id_Pedido` AS `Id_Pedido`, `t_pedido`.`Factor` AS `Factor`, `t_salida_almacen`.`Estado` AS `Estado` FROM ((((`t_salida_almacen` join `t_clientes`) join `t_pedido`) join `t_cotizacion`) join `t_facturacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_cotizacion`.`Id_Cotizacion` = `t_pedido`.`Id_Cotizacion_FK` AND `t_facturacion`.`Id_Pedido_FK` = `t_pedido`.`Id_Pedido` AND `t_facturacion`.`Concepto` = 0 AND `t_facturacion`.`Id_Empresa_FK` = 2 ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_salidas_disponibles`
--
DROP TABLE IF EXISTS `v_salidas_disponibles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_salidas_disponibles`  AS SELECT `t_salida_almacen`.`Id_Folio` AS `id_folio`, `t_clientes`.`Id_Clientes` AS `Id_Clientes`, `t_clientes`.`Razon_social` AS `razon_social` FROM ((`t_salida_almacen` join `t_clientes`) join `t_cotizacion`) WHERE `t_cotizacion`.`Id_Cotizacion` = `t_salida_almacen`.`Id_Cotizacion_FK` AND `t_cotizacion`.`Id_Clientes_FK` = `t_clientes`.`Id_Clientes` AND `t_salida_almacen`.`Estado` <> 1 ORDER BY `t_salida_almacen`.`Id_Folio` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_shank`
--
DROP TABLE IF EXISTS `v_shank`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_shank`  AS SELECT `t_registro_diario`.`id_registro_diario` AS `id_registro_diario`, `t_registro_diario`.`no_maquina` AS `no_maquina`, `t_registro_diario`.`bote` AS `bote`, `t_registro_diario`.`fecha` AS `fecha`, `t_registro_diario`.`pzas` AS `pzas`, `t_registro_diario`.`kilos` AS `kilos`, `t_registro_diario`.`observaciones` AS `observaciones`, `t_control_produccion`.`Id_Produccion_FK_1` AS `Id_Produccion_FK_1` FROM ((`t_registro_diario` join `t_estados`) join `t_control_produccion`) WHERE `t_estados`.`id_estados` = `t_control_produccion`.`Id_estado_1` AND `t_control_produccion`.`id_control_produccion` = `t_registro_diario`.`Id_control_produccion_1` AND `t_estados`.`estados` = 'SHANK''SHANK'  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cantidad`
--
ALTER TABLE `cantidad`
  ADD PRIMARY KEY (`id_cantidad`);

--
-- Indices de la tabla `criterio_inspeccion`
--
ALTER TABLE `criterio_inspeccion`
  ADD PRIMARY KEY (`id_criterio_inspeccion`),
  ADD KEY `FK_Id_maquina4` (`id_maquina_1`);

--
-- Indices de la tabla `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `FK_Id_criterio` (`id_criterio_inspeccion_1`);

--
-- Indices de la tabla `inventario_mantenimiento`
--
ALTER TABLE `inventario_mantenimiento`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `FK_Id_localizacion` (`id_localizacion_1`),
  ADD KEY `FK_Id_cantidad` (`id_cantidad_1`),
  ADD KEY `FK_Id_mes` (`id_mes_1`);

--
-- Indices de la tabla `inventario_mensual`
--
ALTER TABLE `inventario_mensual`
  ADD PRIMARY KEY (`id_mes`);

--
-- Indices de la tabla `localizacion_inventario`
--
ALTER TABLE `localizacion_inventario`
  ADD PRIMARY KEY (`id_localizacion`);

--
-- Indices de la tabla `mantenimiemto_correctivo`
--
ALTER TABLE `mantenimiemto_correctivo`
  ADD PRIMARY KEY (`id_mantenimiento_co`),
  ADD KEY `FK_Id_maquina2` (`id_maquina_1`);

--
-- Indices de la tabla `mantenimiento_preventivo`
--
ALTER TABLE `mantenimiento_preventivo`
  ADD PRIMARY KEY (`id_mantenimiento_preventivo`),
  ADD KEY `FK_Id_maquina3` (`id_maquina_1`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`id_maquina`);

--
-- Indices de la tabla `materiales_empleados`
--
ALTER TABLE `materiales_empleados`
  ADD PRIMARY KEY (`id_material_empleado`),
  ADD KEY `FK_Id_mantenimiento_co1` (`id_mantenimiento_co_1`),
  ADD KEY `FK_Id_maquina5` (`id_maquina_1`);

--
-- Indices de la tabla `refacciones`
--
ALTER TABLE `refacciones`
  ADD PRIMARY KEY (`id_refaccion`),
  ADD KEY `FK_Id_maquina1` (`id_maquina_1`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `FK_Id_mantenimiento_co2` (`id_mantenimiento_co_1`),
  ADD KEY `FK_Id_mantenimiento_preventivo` (`id_mantenimiento_preventivo_1`);

--
-- Indices de la tabla `t_aportacionempresa`
--
ALTER TABLE `t_aportacionempresa`
  ADD PRIMARY KEY (`id_aportacion`),
  ADD KEY `FK_Id_empleado_5` (`id_empleados_5`);

--
-- Indices de la tabla `t_bitacora`
--
ALTER TABLE `t_bitacora`
  ADD PRIMARY KEY (`id_bitacora`);

--
-- Indices de la tabla `t_cajaahorro`
--
ALTER TABLE `t_cajaahorro`
  ADD PRIMARY KEY (`id_cajaAhorro`),
  ADD KEY `FK_Id_empleado_3` (`id_empleado_3`);

--
-- Indices de la tabla `t_catalogo`
--
ALTER TABLE `t_catalogo`
  ADD PRIMARY KEY (`Id_Catalogo`);

--
-- Indices de la tabla `t_certificado`
--
ALTER TABLE `t_certificado`
  ADD PRIMARY KEY (`Id_Certificado`);

--
-- Indices de la tabla `t_clientes`
--
ALTER TABLE `t_clientes`
  ADD PRIMARY KEY (`Id_Clientes`);

--
-- Indices de la tabla `t_contacto`
--
ALTER TABLE `t_contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `t_control_produccion`
--
ALTER TABLE `t_control_produccion`
  ADD PRIMARY KEY (`id_control_produccion`),
  ADD KEY `FK_Id_Produccion_FK` (`Id_Produccion_FK_1`),
  ADD KEY `FK_Id_estado_2` (`Id_estado_1`);

--
-- Indices de la tabla `t_cotizacion`
--
ALTER TABLE `t_cotizacion`
  ADD PRIMARY KEY (`Id_Cotizacion`),
  ADD KEY `FK_Id_Clientes_1` (`Id_Clientes_FK`);

--
-- Indices de la tabla `t_departamento`
--
ALTER TABLE `t_departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `t_direccion`
--
ALTER TABLE `t_direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `FK_Id_empleado_1` (`id_empleados_1`);

--
-- Indices de la tabla `t_empleados`
--
ALTER TABLE `t_empleados`
  ADD PRIMARY KEY (`id_empleados`),
  ADD KEY `FK_Id_puesto_1` (`id_puesto_1`),
  ADD KEY `FK_Id_departamento_2` (`id_departamento_2`);

--
-- Indices de la tabla `t_estados`
--
ALTER TABLE `t_estados`
  ADD PRIMARY KEY (`id_estados`);

--
-- Indices de la tabla `t_facturacion`
--
ALTER TABLE `t_facturacion`
  ADD PRIMARY KEY (`Id_Facutracion`),
  ADD KEY `FK_Id_Pedido_FK` (`Id_Pedido_FK`),
  ADD KEY `FK_Id_Empresa_2` (`Id_Empresa_FK`);

--
-- Indices de la tabla `t_horario`
--
ALTER TABLE `t_horario`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `FK_Id_usuario_2` (`usuario`);

--
-- Indices de la tabla `t_incidencias`
--
ALTER TABLE `t_incidencias`
  ADD PRIMARY KEY (`id_incidencias`),
  ADD KEY `FK_Id_empleados_2` (`id_empleados_2`);

--
-- Indices de la tabla `t_informacion_empresa`
--
ALTER TABLE `t_informacion_empresa`
  ADD PRIMARY KEY (`Id_Empresa`);

--
-- Indices de la tabla `t_inventario_productos_comprados`
--
ALTER TABLE `t_inventario_productos_comprados`
  ADD PRIMARY KEY (`Id_productos_comprados`),
  ADD KEY `FK_Proveedores` (`Id_Proveedor_FK`);

--
-- Indices de la tabla `t_inventario_productos_finalizados`
--
ALTER TABLE `t_inventario_productos_finalizados`
  ADD PRIMARY KEY (`Id_productos_finalizados`),
  ADD KEY `FK_Id_Pedido` (`Id_pedido_FK`),
  ADD KEY `FK_Id_Salida_FK_3` (`Id_Folio_FK`);

--
-- Indices de la tabla `t_iso`
--
ALTER TABLE `t_iso`
  ADD PRIMARY KEY (`Id_Iso`);

--
-- Indices de la tabla `t_materia_prima`
--
ALTER TABLE `t_materia_prima`
  ADD PRIMARY KEY (`Id_materia_prima`);

--
-- Indices de la tabla `t_orden_compra`
--
ALTER TABLE `t_orden_compra`
  ADD PRIMARY KEY (`Id_Compra`),
  ADD KEY `FK_Proveedor` (`FK_Proveedor`),
  ADD KEY `FK_Empresa` (`FK_Empresa`);

--
-- Indices de la tabla `t_orden_produccion`
--
ALTER TABLE `t_orden_produccion`
  ADD PRIMARY KEY (`Id_Produccion`),
  ADD KEY `FK_Id_Pedido_FK_1` (`Id_Pedido_FK`);

--
-- Indices de la tabla `t_pedido`
--
ALTER TABLE `t_pedido`
  ADD PRIMARY KEY (`Id_Pedido`),
  ADD KEY `FK_Id_Cotizacion_1` (`Id_Cotizacion_FK`);

--
-- Indices de la tabla `t_pedido_compra`
--
ALTER TABLE `t_pedido_compra`
  ADD PRIMARY KEY (`Id_Pedido_Compra`),
  ADD KEY `FK_Orden_Compra_2` (`FK_Orden_Compra`),
  ADD KEY `FK_Id_Pedido_FK_2` (`Id_Pedido_FK`);

--
-- Indices de la tabla `t_periodo`
--
ALTER TABLE `t_periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `t_prestamos`
--
ALTER TABLE `t_prestamos`
  ADD PRIMARY KEY (`id_prestamos`),
  ADD KEY `FK_Id_empleados_4` (`id_empelados_4`);

--
-- Indices de la tabla `t_prestamospendientes`
--
ALTER TABLE `t_prestamospendientes`
  ADD PRIMARY KEY (`id_prestamoP`);

--
-- Indices de la tabla `t_programa_forjado`
--
ALTER TABLE `t_programa_forjado`
  ADD PRIMARY KEY (`Id_Programa_Forjado`),
  ADD KEY `FK_Id_Produccion_FK_1` (`Id_Produccion_FK`);

--
-- Indices de la tabla `t_proveedores`
--
ALTER TABLE `t_proveedores`
  ADD PRIMARY KEY (`Id_Proveedor`);

--
-- Indices de la tabla `t_puesto`
--
ALTER TABLE `t_puesto`
  ADD PRIMARY KEY (`id_puesto`);

--
-- Indices de la tabla `t_registro`
--
ALTER TABLE `t_registro`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `FK_Id_usuario_1` (`usuario`);

--
-- Indices de la tabla `t_registro_diario`
--
ALTER TABLE `t_registro_diario`
  ADD PRIMARY KEY (`id_registro_diario`),
  ADD KEY `FK_Id_control_produccion_1` (`Id_control_produccion_1`);

--
-- Indices de la tabla `t_reportes_prestamos`
--
ALTER TABLE `t_reportes_prestamos`
  ADD PRIMARY KEY (`id_reporte_p`),
  ADD KEY `FK_Id_prestamos` (`id_prestamos_1`),
  ADD KEY `FK_Id_aportacion` (`id_aportacion_1`),
  ADD KEY `FK_Id_cajaAhorro` (`id_cajaAhorro_1`);

--
-- Indices de la tabla `t_rol`
--
ALTER TABLE `t_rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `t_salida_almacen`
--
ALTER TABLE `t_salida_almacen`
  ADD PRIMARY KEY (`Id_Folio`),
  ADD KEY `FK_Id_Cotizacion_3` (`Id_Cotizacion_FK`);

--
-- Indices de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `FK_Id_empleado` (`id_empleado_1`),
  ADD KEY `FK_Id_rol` (`id_rol_1`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cantidad`
--
ALTER TABLE `cantidad`
  MODIFY `id_cantidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `criterio_inspeccion`
--
ALTER TABLE `criterio_inspeccion`
  MODIFY `id_criterio_inspeccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `foto`
--
ALTER TABLE `foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_mantenimiento`
--
ALTER TABLE `inventario_mantenimiento`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario_mensual`
--
ALTER TABLE `inventario_mensual`
  MODIFY `id_mes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `id_maquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `refacciones`
--
ALTER TABLE `refacciones`
  MODIFY `id_refaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_aportacionempresa`
--
ALTER TABLE `t_aportacionempresa`
  MODIFY `id_aportacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_bitacora`
--
ALTER TABLE `t_bitacora`
  MODIFY `id_bitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_cajaahorro`
--
ALTER TABLE `t_cajaahorro`
  MODIFY `id_cajaAhorro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_certificado`
--
ALTER TABLE `t_certificado`
  MODIFY `Id_Certificado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_contacto`
--
ALTER TABLE `t_contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_control_produccion`
--
ALTER TABLE `t_control_produccion`
  MODIFY `id_control_produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1171;

--
-- AUTO_INCREMENT de la tabla `t_cotizacion`
--
ALTER TABLE `t_cotizacion`
  MODIFY `Id_Cotizacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000;

--
-- AUTO_INCREMENT de la tabla `t_direccion`
--
ALTER TABLE `t_direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `t_empleados`
--
ALTER TABLE `t_empleados`
  MODIFY `id_empleados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `t_estados`
--
ALTER TABLE `t_estados`
  MODIFY `id_estados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `t_facturacion`
--
ALTER TABLE `t_facturacion`
  MODIFY `Id_Facutracion` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_horario`
--
ALTER TABLE `t_horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_incidencias`
--
ALTER TABLE `t_incidencias`
  MODIFY `id_incidencias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_informacion_empresa`
--
ALTER TABLE `t_informacion_empresa`
  MODIFY `Id_Empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_iso`
--
ALTER TABLE `t_iso`
  MODIFY `Id_Iso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_orden_compra`
--
ALTER TABLE `t_orden_compra`
  MODIFY `Id_Compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_orden_produccion`
--
ALTER TABLE `t_orden_produccion`
  MODIFY `Id_Produccion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11279;

--
-- AUTO_INCREMENT de la tabla `t_pedido`
--
ALTER TABLE `t_pedido`
  MODIFY `Id_Pedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000000;

--
-- AUTO_INCREMENT de la tabla `t_pedido_compra`
--
ALTER TABLE `t_pedido_compra`
  MODIFY `Id_Pedido_Compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_periodo`
--
ALTER TABLE `t_periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_prestamos`
--
ALTER TABLE `t_prestamos`
  MODIFY `id_prestamos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_prestamospendientes`
--
ALTER TABLE `t_prestamospendientes`
  MODIFY `id_prestamoP` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_programa_forjado`
--
ALTER TABLE `t_programa_forjado`
  MODIFY `Id_Programa_Forjado` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_proveedores`
--
ALTER TABLE `t_proveedores`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `t_puesto`
--
ALTER TABLE `t_puesto`
  MODIFY `id_puesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `t_registro`
--
ALTER TABLE `t_registro`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_registro_diario`
--
ALTER TABLE `t_registro_diario`
  MODIFY `id_registro_diario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `t_reportes_prestamos`
--
ALTER TABLE `t_reportes_prestamos`
  MODIFY `id_reporte_p` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_rol`
--
ALTER TABLE `t_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `t_salida_almacen`
--
ALTER TABLE `t_salida_almacen`
  MODIFY `Id_Folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23408;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `criterio_inspeccion`
--
ALTER TABLE `criterio_inspeccion`
  ADD CONSTRAINT `FK_Id_maquina4` FOREIGN KEY (`id_maquina_1`) REFERENCES `maquina` (`id_maquina`);

--
-- Filtros para la tabla `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `FK_Id_criterio` FOREIGN KEY (`id_criterio_inspeccion_1`) REFERENCES `criterio_inspeccion` (`id_criterio_inspeccion`);

--
-- Filtros para la tabla `inventario_mantenimiento`
--
ALTER TABLE `inventario_mantenimiento`
  ADD CONSTRAINT `FK_Id_cantidad` FOREIGN KEY (`id_cantidad_1`) REFERENCES `cantidad` (`id_cantidad`),
  ADD CONSTRAINT `FK_Id_localizacion` FOREIGN KEY (`id_localizacion_1`) REFERENCES `localizacion_inventario` (`id_localizacion`),
  ADD CONSTRAINT `FK_Id_mes` FOREIGN KEY (`id_mes_1`) REFERENCES `inventario_mensual` (`id_mes`);

--
-- Filtros para la tabla `mantenimiemto_correctivo`
--
ALTER TABLE `mantenimiemto_correctivo`
  ADD CONSTRAINT `FK_Id_maquina2` FOREIGN KEY (`id_maquina_1`) REFERENCES `maquina` (`id_maquina`);

--
-- Filtros para la tabla `mantenimiento_preventivo`
--
ALTER TABLE `mantenimiento_preventivo`
  ADD CONSTRAINT `FK_Id_maquina3` FOREIGN KEY (`id_maquina_1`) REFERENCES `maquina` (`id_maquina`);

--
-- Filtros para la tabla `materiales_empleados`
--
ALTER TABLE `materiales_empleados`
  ADD CONSTRAINT `FK_Id_mantenimiento_co1` FOREIGN KEY (`id_mantenimiento_co_1`) REFERENCES `mantenimiemto_correctivo` (`id_mantenimiento_co`),
  ADD CONSTRAINT `FK_Id_maquina5` FOREIGN KEY (`id_maquina_1`) REFERENCES `maquina` (`id_maquina`);

--
-- Filtros para la tabla `refacciones`
--
ALTER TABLE `refacciones`
  ADD CONSTRAINT `FK_Id_maquina1` FOREIGN KEY (`id_maquina_1`) REFERENCES `maquina` (`id_maquina`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `FK_Id_mantenimiento_co2` FOREIGN KEY (`id_mantenimiento_co_1`) REFERENCES `mantenimiemto_correctivo` (`id_mantenimiento_co`),
  ADD CONSTRAINT `FK_Id_mantenimiento_preventivo` FOREIGN KEY (`id_mantenimiento_preventivo_1`) REFERENCES `mantenimiento_preventivo` (`id_mantenimiento_preventivo`);

--
-- Filtros para la tabla `t_aportacionempresa`
--
ALTER TABLE `t_aportacionempresa`
  ADD CONSTRAINT `FK_Id_empleado_5` FOREIGN KEY (`id_empleados_5`) REFERENCES `t_empleados` (`id_empleados`);

--
-- Filtros para la tabla `t_cajaahorro`
--
ALTER TABLE `t_cajaahorro`
  ADD CONSTRAINT `FK_Id_empleado_3` FOREIGN KEY (`id_empleado_3`) REFERENCES `t_empleados` (`id_empleados`);

--
-- Filtros para la tabla `t_control_produccion`
--
ALTER TABLE `t_control_produccion`
  ADD CONSTRAINT `FK_Id_Produccion_FK` FOREIGN KEY (`Id_Produccion_FK_1`) REFERENCES `t_orden_produccion` (`Id_Produccion`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Id_estado_2` FOREIGN KEY (`Id_estado_1`) REFERENCES `t_estados` (`id_estados`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_cotizacion`
--
ALTER TABLE `t_cotizacion`
  ADD CONSTRAINT `FK_Id_Clientes_1` FOREIGN KEY (`Id_Clientes_FK`) REFERENCES `t_clientes` (`Id_Clientes`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_direccion`
--
ALTER TABLE `t_direccion`
  ADD CONSTRAINT `FK_Id_empleado_1` FOREIGN KEY (`id_empleados_1`) REFERENCES `t_empleados` (`id_empleados`);

--
-- Filtros para la tabla `t_empleados`
--
ALTER TABLE `t_empleados`
  ADD CONSTRAINT `FK_Id_departamento_2` FOREIGN KEY (`id_departamento_2`) REFERENCES `t_departamento` (`id_departamento`),
  ADD CONSTRAINT `FK_Id_puesto_1` FOREIGN KEY (`id_puesto_1`) REFERENCES `t_puesto` (`id_puesto`);

--
-- Filtros para la tabla `t_facturacion`
--
ALTER TABLE `t_facturacion`
  ADD CONSTRAINT `FK_Id_Empresa_2` FOREIGN KEY (`Id_Empresa_FK`) REFERENCES `t_informacion_empresa` (`Id_Empresa`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Id_Pedido_FK` FOREIGN KEY (`Id_Pedido_FK`) REFERENCES `t_pedido` (`Id_Pedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_horario`
--
ALTER TABLE `t_horario`
  ADD CONSTRAINT `FK_Id_usuario_2` FOREIGN KEY (`usuario`) REFERENCES `t_usuario` (`usuario`);

--
-- Filtros para la tabla `t_incidencias`
--
ALTER TABLE `t_incidencias`
  ADD CONSTRAINT `FK_Id_empleados_2` FOREIGN KEY (`id_empleados_2`) REFERENCES `t_empleados` (`id_empleados`);

--
-- Filtros para la tabla `t_inventario_productos_comprados`
--
ALTER TABLE `t_inventario_productos_comprados`
  ADD CONSTRAINT `FK_Proveedores` FOREIGN KEY (`Id_Proveedor_FK`) REFERENCES `t_proveedores` (`Id_Proveedor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_inventario_productos_finalizados`
--
ALTER TABLE `t_inventario_productos_finalizados`
  ADD CONSTRAINT `FK_Id_Pedido` FOREIGN KEY (`Id_pedido_FK`) REFERENCES `t_pedido` (`Id_Pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Id_Salida_FK_3` FOREIGN KEY (`Id_Folio_FK`) REFERENCES `t_salida_almacen` (`Id_Folio`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_orden_compra`
--
ALTER TABLE `t_orden_compra`
  ADD CONSTRAINT `FK_Empresa` FOREIGN KEY (`FK_Empresa`) REFERENCES `t_informacion_empresa` (`Id_Empresa`),
  ADD CONSTRAINT `FK_Proveedor` FOREIGN KEY (`FK_Proveedor`) REFERENCES `t_proveedores` (`Id_Proveedor`);

--
-- Filtros para la tabla `t_orden_produccion`
--
ALTER TABLE `t_orden_produccion`
  ADD CONSTRAINT `FK_Id_Pedido_FK_1` FOREIGN KEY (`Id_Pedido_FK`) REFERENCES `t_pedido` (`Id_Pedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_pedido`
--
ALTER TABLE `t_pedido`
  ADD CONSTRAINT `FK_Id_Cotizacion_1` FOREIGN KEY (`Id_Cotizacion_FK`) REFERENCES `t_cotizacion` (`Id_Cotizacion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_pedido_compra`
--
ALTER TABLE `t_pedido_compra`
  ADD CONSTRAINT `FK_Id_Pedido_FK_2` FOREIGN KEY (`Id_Pedido_FK`) REFERENCES `t_pedido` (`Id_Pedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Orden_Compra_2` FOREIGN KEY (`FK_Orden_Compra`) REFERENCES `t_orden_compra` (`Id_Compra`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_prestamos`
--
ALTER TABLE `t_prestamos`
  ADD CONSTRAINT `FK_Id_empleados_4` FOREIGN KEY (`id_empelados_4`) REFERENCES `t_empleados` (`id_empleados`);

--
-- Filtros para la tabla `t_programa_forjado`
--
ALTER TABLE `t_programa_forjado`
  ADD CONSTRAINT `FK_Id_Produccion_FK_1` FOREIGN KEY (`Id_Produccion_FK`) REFERENCES `t_orden_produccion` (`Id_Produccion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_registro`
--
ALTER TABLE `t_registro`
  ADD CONSTRAINT `FK_Id_usuario_1` FOREIGN KEY (`usuario`) REFERENCES `t_usuario` (`usuario`);

--
-- Filtros para la tabla `t_registro_diario`
--
ALTER TABLE `t_registro_diario`
  ADD CONSTRAINT `FK_Id_control_produccion_1` FOREIGN KEY (`Id_control_produccion_1`) REFERENCES `t_control_produccion` (`id_control_produccion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_reportes_prestamos`
--
ALTER TABLE `t_reportes_prestamos`
  ADD CONSTRAINT `FK_Id_aportacion` FOREIGN KEY (`id_aportacion_1`) REFERENCES `t_aportacionempresa` (`id_aportacion`),
  ADD CONSTRAINT `FK_Id_cajaAhorro` FOREIGN KEY (`id_cajaAhorro_1`) REFERENCES `t_cajaahorro` (`id_cajaAhorro`),
  ADD CONSTRAINT `FK_Id_prestamos` FOREIGN KEY (`id_prestamos_1`) REFERENCES `t_prestamos` (`id_prestamos`);

--
-- Filtros para la tabla `t_salida_almacen`
--
ALTER TABLE `t_salida_almacen`
  ADD CONSTRAINT `FK_Id_Cotizacion_3` FOREIGN KEY (`Id_Cotizacion_FK`) REFERENCES `t_cotizacion` (`Id_Cotizacion`) ON DELETE CASCADE;

--
-- Filtros para la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD CONSTRAINT `FK_Id_empleado` FOREIGN KEY (`id_empleado_1`) REFERENCES `t_empleados` (`id_empleados`),
  ADD CONSTRAINT `FK_Id_rol` FOREIGN KEY (`id_rol_1`) REFERENCES `t_rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;