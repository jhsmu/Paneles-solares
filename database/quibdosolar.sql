-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2023 a las 01:54:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `quibdosolar`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL,
  `contrasenia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `nombre`, `apellido`, `email`, `contrasenia`) VALUES
(1, 'Ingrid', 'Serna', 'admin@gmail.com', 'Admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `estado_categoria` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`, `estado_categoria`) VALUES
(1, 'Paneles Solares', 1),
(2, 'Baterías Solares', 1),
(3, 'Inversores Onda Pura', 1),
(4, 'Controladores MPPT', 1),
(5, 'Accesorios Solares', 1),
(6, 'Herramientas', 1),
(7, 'Reguladores', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `contrasenia` varchar(50) NOT NULL,
  `token` varchar(45) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellido`, `direccion`, `telefono`, `email`, `contrasenia`, `token`, `estado`) VALUES
(1, 'Usuario', 'Prueba', 'Torre Norte SENA', '573024650490', 'usuario@gmail.com', 'Usuario12345', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `precio` float(12,2) NOT NULL,
  `total` float(12,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_orden`
--

CREATE TABLE `detalle_orden` (
  `id_detalle_orden` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_venta` int(11) NOT NULL,
  `precio_producto` float(12,2) DEFAULT NULL,
  `monto_total` float(12,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `extra` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_venta` int(11) NOT NULL,
  `precio_producto` float(12,2) DEFAULT NULL,
  `monto_total` float(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

CREATE TABLE `imagenes` (
  `id_imagenes` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`id_imagenes`, `producto_id`, `url`) VALUES
(1, 1, 'panel-solar-1.jpeg'),
(2, 1, 'panel-solar-2.jpeg'),
(3, 1, 'panel-solar-3.jpeg'),
(4, 2, 'hqst1.jpeg'),
(5, 2, 'hqst2.jpeg'),
(6, 2, 'hqst3.webp'),
(7, 3, 'renogy1.jpeg'),
(8, 3, 'renogy2.jpeg'),
(9, 3, 'renogy3.jpeg'),
(10, 4, 'netion1.jpeg'),
(11, 4, 'netion2.jpeg'),
(12, 4, 'netion3.jpeg'),
(13, 5, 'Flexible1.webp'),
(14, 5, 'Flexible2.jpeg'),
(15, 5, 'Flexible3.webp'),
(16, 6, 'netionpoli1.jpeg'),
(17, 6, 'netionpoli2.jpeg'),
(18, 6, 'netionpoli3.webp'),
(19, 7, 'bateriagel1.webp'),
(20, 7, 'bateriagel2.webp'),
(21, 7, 'bateriagel3.png'),
(22, 8, 'bateriaaokly1.jpg'),
(23, 8, 'bateriaaokly2.jpg'),
(24, 8, 'bateriaaokly3.webp'),
(25, 9, 'bateriaagm1.jpg'),
(26, 9, 'bateriaagm2.jpg'),
(27, 9, 'bateriaagm3.jpg'),
(28, 10, 'inversor1.png'),
(29, 10, 'inversor2.png'),
(30, 10, 'inversor3.png'),
(31, 11, 'multiplus1.jpg'),
(32, 11, 'multiplus2.jpg'),
(33, 11, 'multiplus3.jpg'),
(34, 12, 'inversoroff1.jpg'),
(35, 12, 'inversoroff2.jpg'),
(36, 12, 'inversoroff3.png'),
(37, 13, 'controlador1.jpg'),
(38, 13, 'controlador2.png'),
(39, 13, 'controlador3.png'),
(40, 14, 'controladorsolar1.webp'),
(41, 14, 'controladorsolar2.jpg'),
(42, 14, 'controladorsolar3.jpg'),
(43, 15, 'controladormppt1.webp'),
(44, 15, 'controladormppt2.webp'),
(45, 15, 'controladormppt3.png'),
(46, 16, 'cable1.webp'),
(47, 16, 'cable2.jpg'),
(48, 16, 'cable3.jpg'),
(49, 17, 'cargador1.png'),
(50, 17, 'cargador2.jpg'),
(51, 17, 'cargador3.png'),
(52, 18, 'Crimpiadora1.webp'),
(53, 18, 'Crimpiadora2.webp'),
(54, 18, 'Crimpiadora3.jpg'),
(55, 19, 'spanner1.webp'),
(56, 19, 'spanner2.jpg'),
(57, 19, 'spanner3.jpg'),
(58, 20, 'monitolcd1.webp'),
(59, 20, 'monitolcd2.webp'),
(60, 20, 'monitolcd3.webp'),
(61, 21, 'tenaza1.jpg'),
(62, 21, 'tenaza2.jpg'),
(63, 21, 'tenaza3.jpg'),
(64, 22, 'sonda1.jpg'),
(65, 22, 'sonda2.jpg'),
(66, 22, 'sonda3.jpg'),
(67, 23, 'reguladorcarga1.jpg'),
(68, 23, 'reguladorcarga2.jpg'),
(69, 23, 'reguladorcarga3.jpg'),
(70, 24, 'reguladorPLW1.jpg'),
(71, 24, 'reguladorPLW2.jpg'),
(72, 24, 'reguladorPLW3.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `total` float(12,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `condicion` tinyint(1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `serial` varchar(12) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `caracteristicas` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float(12,2) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `estado_producto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `serial`, `producto`, `descripcion`, `caracteristicas`, `cantidad`, `precio`, `id_categoria`, `estado_producto`) VALUES
(1, 'A123456789', 'Panel Solar 545w 550w Monocristalino', 'INELDEC SAS\r\nPanel Solar 545W marca Luxen o Longi Media celda $1.080.000 compra directa\r\n', 'Tensión de circuito abierto: 49.65V\r\nCorriente de Cortocircuito: 13.95 A\r\nDimensiones: 2256x1134 (Largo x Ancho)\r\nPeso: 28 kg\r\nEficiencia: 21.3%\r\nCon certificación RETIE.\r\nGarantía: 12 Años\r\n.', 50, 990900.00, 1, 1),
(2, 'A123456780', 'Hqst Panel Solar Monocristalino 100 W\r\n', '\r\nEste panel solar está garantizado para proporcionar energía a todos tus dispositivos electrónicos favoritos. El vidrio templado y el marco de aluminio resistente a la corrosión permiten que cada panel resista fuertes cargas de viento Pa y nieve Pa, aumentando la durabilidad y el valor.', '\r\nCada panel solar de 100 W es perfecto para una instalación permanente o semipermanente.\r\nSKU: B092XDR3D5\r\nCOLOR: 100 W, paquete de 2\r\nMARCA: HQST HIGH QUALITY SOLAR TECHNOLOGY\r\nMODELO: HQST-100D-SSx2\r\nPESO: 26.75 libras', 50, 1050990.00, 1, 1),
(3, 'A123456790', 'Renogy Modulo De Panel Solar Monocristalino Fotovoltaico Pv', 'Renogy módulo de panel solar monocristalino fotovoltaico pv 3 piezas 100 w carga de batería de 12 v17', '\r\n confiable el material de encapsulación avanzado con laminados de láminas de múltiples capas mejora el rendimiento de la celda y proporciona una larga vida útil\r\n durable tolerancia de salida positiva garantizada 03 soporta vientos fuertes 2400pa y cargas de nieve 5400pa\r\n versátil úselo para su rv cuando acampe o durante viajes en la playa con la familia de cualquier manera este panel monocristalino le brinda la mayor eficiencia por espacio\r\n instalación lista los orificios perforados en la parte posterior del panel permiten un montaje y aseguramiento rápidos orificios pretaladrados incluidos para puesta a tierra compatible con diferentes sistemas de montaje renogy como soportes en z soportes para postes y soportes para inclinación\r\n garantía garantía de potencia transferible de 25 años material de 5 años y garantía de mano de obra\r\n43.87 largo - 21.5 ancho - 2.62 alto caravan single panel compact design renogy', 50, 715900.00, 1, 1),
(4, 'A123456800', 'Panel Solar Netion 260w Policristalino Fotovoltaico 30v', ' PANELES SOLARES MONOCRISTALINOS Y POLICRISTALINOS\r\nPaneles Solares Policristalinos de 50W, 100W, 150W, 260W Y 325W\r\nPaneles solares Monocristalinos de 100W, 150W, 220w, 260W, 320W, 360w, 400w, 450w, 550w', 'Resistencia PID: Celdas de tecnología avanzada y materiales de alta calidad que generan alta resistencia PID.\r\n Alta Eficiencia: Módulo de conversión de alta eficiencia con tecnología innovadora.\r\n Alta resistencia temperaturas extremas: Certificado para soporta el peso del viento (hasta 2400 pascales), y el peso de la nieve (5400 pascales).\r\n Alto desempeño ante poca radiación: Avanzada superficie de vidrio y celdas solares que permiten un desempeño excelente en ambientes de baja radiación.\r\n Garantía de alta calidad: Control de calidad 100% antes y después de laminación y producción final.\r\n Máximo desempeño de energía: Con tecnología de igualación de impedancia, genera más potencia en cada módulo solar.', 50, 631800.00, 1, 1),
(5, 'A123456801', 'Paneles Solares - Topsolar Flexible Solar Panel 100w 12v Mon', 'Paneles Solares - Topsolar Flexible Solar Panel 100W 12V Monocrystalline Bendable - 100 Watt 12Volt Semi-Flexible Mono Solar Panels Charger Off-Grid for RV Boat Cabin Van Car Uneven Surfaces\r\nNOMBRE EN INGLES: Topsolar Flexible Solar Panel 100W 12V Monocrystalline Bendable - 100 Watt 12Volt Semi-Flexible Mono Solar Panels Charger Off-Grid for RV Boat Cabin Van Car Uneven Surfaces\r\nEsto se ajusta a tu.', 'Potencia máxima en STC*: 100 W.\r\nVoltaje de funcionamiento óptimo (Vmp): 22,3 V.\r\nCorriente de funcionamiento óptima (Imp): 4,4A.\r\nTensión de circuito abierto (Voc): 25,9 V.\r\nCorriente de cortocircuito (Isc): 4,6 A.\r\nVoltaje máximo del sistema: 1000 VCC.', 50, 900000.00, 1, 1),
(6, 'A123456812', 'Panel Energia Solar Netion Policristalino 150w / 18v', 'Módulos solares Policristalinos de 150W\r\nResistencia PID: Celdas de tecnología avanzada y materiales de alta calidad que generan alta resistencia PID.\r\nAlta Eficiencia: Módulo de conversión de alta eficiencia con tecnología innovadora.\r\nAlta resistencia temperaturas extremas: Certificado para soporta el peso del viento (hasta 2400 pascales), y el peso de la nieve (5400 pascales).\r\nAlto desempeño ante poca radiación: Avanzada superficie de vidrio y celdas solares que permiten un desempeño excelente en ambientes de baja radiación.\r\nGarantía de alta calidad: Control de calidad 100% antes y después de laminación y producción final.\r\nMáximo desempeño de energía: Con tecnología de igualación de impedancia, genera más potencia en cada módulo solar.', '\r\n- Tipo de Celda: Policristalina 156.75mmX156.75m\r\n- Numero de Celdas: 36 (4x9)\r\n- Eficiencia de las Celdas: 17.05%\r\n- Dimensiones: 1485X668X35mm\r\n- Peso: 11.0Kg.', 50, 387900.00, 1, 1),
(7, 'B123056780', 'Batería de GEL 200Ah 12V Aokly', '\r\nLa Batería de GEL 200Ah 12V Aokly es una batería de gel de alta capacidad, libre de mantenimiento y de larga duración. Esta batería es resistente a los ciclos profundos de carga y descarga, a las fluctuaciones de temperatura y a la corrosión, lo que la hace ideal para aplicaciones en exteriores.\r\n', '\r\nVoltaje: 12V\r\nCapacidad: 200Ah (10 horas) / 208Ah (20 horas) / 175Ah (5 horas) / 129Ah (1 hora)\r\nDimensiones: 522mm x 239mm x 216mm (Largo x Ancho x Altura)\r\nPeso: Aproximadamente 58.8kg\r\nTerminal: M8\r\nResistencia Interna: Aproximadamente 3.3mΩ\r\nTemperatura de Funcionamiento: -20 ~ 55℃ (Descarga), 0 ~ 40℃ (Carga), -20 ~ 55℃ (Almacenamiento)\r\nCorriente de Descarga Máxima: 1000A (5 segundos)\r\nVida de Diseño: 12 años en carga flotante\r\nMaterial del Contenedor: ABS (UL94-HB)\r\nEsta batería de gel es una opción confiable y duradera para aplicaciones diversas, incluyendo sistemas de energía solar y sistemas de respaldo.\r\n', 50, 1050990.00, 2, 1),
(8, 'B123056791', 'Batería de GEL 100Ah 12V Aokly', '\r\n La batería de gel de 100Ah 12V Aokly es una batería sellada de plomo-ácido con alta capacidad de carga y resistencia a ciclos profundos de carga y descarga. Esta batería es ideal para aplicaciones en sistemas solares, vehículos recreativos, carros de golf, sistemas de respaldo, embarcaciones, energía eólica, sistemas de iluminación y otros usos similares.\r\n', '\r\n\r\nVoltaje nominal: 12V\r\nCapacidad nominal: 100Ah a velocidad de 10 horas (10.0A a 1.80V / 25 ℃)\r\nDimensiones: 329mm (Longitud) x 172mm (Anchura) x 216mm (Altura) x 221mm (Altura total)\r\nPeso: Aprox. 29.0kg\r\nTerminal: M8\r\nMaterial del contenedor: ABS (UL94-HB), resistencia a la inflamabilidad de UL94-V1 disponible bajo pedido\r\n', 50, 1050990.00, 2, 1),
(9, 'B123076791', 'Batería AGM 18Ah 12V Aokly', '\r\nLa batería AGM 18Ah 12V de Aokly es una batería de alta calidad y rendimiento diseñada para una amplia gama de aplicaciones. Esta batería está construida con tecnología de vanguardia y materiales de alta calidad para garantizar una larga duración y una operación segura y confiable. La tecnología AGM (Absorbent Glass Mat) de esta batería ofrece una mayor resistencia a los ciclos de carga y descarga, así como una mayor capacidad de retener la carga. Esta batería es ideal para aplicaciones que requieren una fuente de energía confiable y duradera, como sistemas de seguridad, sistemas de energía solar, sistemas de respaldo de energía, vehículos eléctricos, caravanas, barcos y más.\r\n', '\r\nVoltaje Nominal: 12V\r\nCapacidad Nominal: 18Ah\r\nDimensiones: 181 mm x 77 mm x 167 mm (Largo x Ancho x Alto)\r\nPeso: 4.8 kg\r\nTerminal: F3\r\nMaterial del Contenedor: ABS (UL94-HB), resistente a la inflamabilidad\r\nResistencia Interna: Aproximadamente 14mΩ (Completamente cargado)\r\nTemperatura de Funcionamiento:\r\nDescarga: -20°C a 55°C\r\nCarga: 0°C a 40°C\r\nAlmacenamiento: -20°C a 55°C\r\nUso Cíclico: Corriente de carga de 5.1A, voltaje de carga de 14.4V a 14.7V.\r\nUso en Espera: Corriente de carga sin límite, voltaje de carga de 13.5V a 13.8V.\r\nAutodescarga: Menos del 1% a 25°C.\r\nVida de Diseño: 3-5 años en carga flotante.\r\n', 50, 1050990.00, 2, 1),
(10, 'I123056781', 'Inversor MULTIPLUS-II 12V 3000VA Victron Energy\r\n', '\r\nEl Inversor MULTIPLUS-II 12V 3000VA de Victron Energy es una potente solución para la gestión de energía en sistemas autónomos y renovables. Convierte la energía de la batería en electricidad de alta calidad, adecuada para una amplia variedad de dispositivos. Ofrece un rendimiento confiable, incorpora un cargador de batería adaptativo para maximizar la vida útil de las baterías y puede cambiar sin interrupciones entre la red eléctrica y las baterías para un suministro de energía ininterrumpido.', '\r\nControl de Potencia / Asistencia Eléctrica: Control y asistencia eléctrica.\r\nConmutador de Transferencia: Cambio entre fuentes de alimentación.\r\nEntrada de CA: Rango de tensión y frecuencia de entrada.\r\nInversor: Potencia de salida y eficiencia.\r\nCargador: Corriente de carga y modos de carga.\r\nProtección y Comunicación: Protección contra factores y opciones de comunicación.\r\nTemperatura y Carcasa: Rango de temperatura y tipo de carcasa.\r\nDimensiones y Peso: Tamaño y peso del sistema.\r\nNormas: Cumplimiento de estándares de seguridad y emisiones.\r\n', 50, 1050990.00, 3, 1),
(11, 'I123056802', 'Inversor MULTIPLUS 12V 1600VA Victron Energy', '\r\n El Inversor MULTIPLUS 12V 1600VA de Victron Energy es una solución de alta calidad y versátil para satisfacer las necesidades de energía de manera eficiente y confiable. Con una potencia de 1600VA, convierte la energía de 12 voltios en una corriente alterna estable, siendo ideal para aplicaciones en vehículos recreativos, embarcaciones, sistemas de energía solar y más. Además, ofrece funciones avanzadas de carga de batería y está diseñado para un funcionamiento sin problemas y una larga vida útil.\r\n', '\r\n\r\n\r\nEl MULTIPLUS-12-1600 es un inversor que proporciona 230V CA con 1600VA de potencia continua y 3000W de pico. Tiene una alta eficiencia (hasta un 93%) y un rango amplio de voltaje de entrada (9.5V a 17V CC). También incluye un cargador de batería, operación en un amplio rango de temperaturas (-40 a +65°C), y cumple con estándares de seguridad y emisiones. Es una solución versátil para sistemas de energía en diversas aplicaciones.\r\n', 50, 1050990.00, 3, 1),
(12, 'I123177891', 'Inversor OFF GRID PHOENIX 12V 800VA Victron Energy\r\n', '\r\nDescubre el potente Inversor OFF GRID PHOENIX 12V 800VA de Victron Energy, la solución perfecta para tu sistema de energía independiente. Con una capacidad de 800VA y diseñado para operar fuera de la red eléctrica convencional, este inversor te proporciona la libertad de generar y utilizar tu propia energía. Con la confiabilidad y calidad que caracteriza a Victron Energy, este inversor es la elección ideal para aplicaciones fuera de la red, como sistemas de energía solar, eólica o de respaldo.\r\n', '\r\n\r\nPotencia Continua: 800 VA a 25°C.\r\nPotencia Máxima: 1500 W.\r\nTensión/Frecuencia de Salida Ajustable: 230 VCA o 120 VCA, 50Hz o 60Hz.\r\nRango de Tensión de Entrada: 9,2 – 17 V.\r\nEficiencia Máxima: 90 %.\r\nTemperatura de Trabajo: -40 a +65°C.\r\nProtección: IP 21.\r\nPeso: 5,5 kg.\r\nDimensiones: 105 x 230 x 325 mm.\r\nCumple con Estándares de Seguridad y EMC.\r\n', 50, 1050990.00, 3, 1),
(13, 'C123056892', 'Controlador Solar SmartSolar MPPT 250V 100A – TR VE.Can', '\r\nEl Controlador Solar SmartSolar MPPT 250V 100A de Victron Energy es una avanzada solución de gestión de energía solar que optimiza la eficiencia de sistemas fotovoltaicos. Con capacidad de hasta 100 amperios y 250 voltios, utiliza la tecnología MPPT para maximizar la energía solar. Su compatibilidad con la red VE.Can de Victron facilita la integración con otros dispositivos y permite el monitoreo centralizado del sistema solar para un seguimiento preciso del rendimiento y producción de energía.\r\n', '\r\nTensión de Batería: Se adapta automáticamente a 12V, 24V o 48V (requiere software para configurar en 36V).\r\nCorriente de Carga: 100 A.\r\nPotencia Fotovoltaica Nominal: Varía según la tensión (hasta 5800 W).\r\nSeguridad: Protección contra polaridad inversa, cortocircuito y sobretemperatura.\r\nEficiencia Máxima: 99%.\r\nComunicación: Puede conectarse a través de VE.Direct o Bluetooth.\r\nRelé Programable: Con capacidad para controlar cargas.\r\nFuncionamiento en Paralelo: Hasta 10 unidades se pueden sincronizar.\r\n', 50, 1050990.00, 4, 1),
(14, 'C123056912', 'Controlador Solar 30 Amperes PWM VS3024AU', '\r\n\r\nControlador de Carga Solar VS3024AU PWM 30A para sistemas de energía solar de 12V/24V con pantalla LCD, puerto USB, modos de carga selectivos, estadísticas de energía, amplio rango de temperatura, componentes de alta calidad, certificaciones UL y VDE, compensación de temperatura de batería y protección electrónica.\r\n', '\r\n\r\nEste dispositivo es versátil y eficiente, con las siguientes características clave:\r\n\r\nVoltaje: Puede operar automáticamente a 12V o 24V.\r\nEntrada de batería: Acepta voltajes de 9V a 32V.\r\nCarga/Descarga: Hasta 30A a 55°C.\r\nPaneles Solares: Admite hasta 50V de voltaje.\r\nCompatibilidad de Batería: Se adapta a varios tipos de baterías.\r\nEficiencia: Bajo consumo de energía.\r\nCompensación de Temperatura: Ajusta el voltaje según la temperatura ambiente.\r\nPantalla LCD: Muestra información importante.\r\nRobusto: Funciona en una amplia gama de temperaturas.\r\nProtección: Contra humedad y polvo (IP20).\r\nUSB: Incluye puerto USB para cargar dispositivos.\r\nCompacto: Pequeño y fácil de montar.\r\nPeso: Aproximadamente 0.55 kg.\r\n', 50, 1050990.00, 4, 1),
(15, 'C123178902', 'Controlador Solar MPPT 80A 12-48V Tracer8415AN\r\n', '\r\nEl Controlador Solar MPPT 80A Tracer 8415 AN es una solución de vanguardia para maximizar la eficiencia de tu sistema de energía solar. Diseñado para trabajar con paneles solares de 12 a 48 voltios, este controlador utiliza la tecnología de seguimiento del punto de máxima potencia (MPPT) para optimizar la generación de energía solar.\r\n', '\r\nEste dispositivo solar tiene una potencia máxima de 1000/2000/3000/4000 W, maneja voltajes de panel solar de hasta 150 V, es compatible con baterías de 12/24/36/48 V, tiene un amplio rango de voltaje de batería de 8 V a 68 V, y puede cargar baterías con una corriente de hasta 80 A. Tiene una alta eficiencia de conversión del 98.50%, es compacto (394x240x134 mm, 6.10 kg), compatible con varios tipos de baterías, tiene protección IP20, funciona en temperaturas de -30 ~ +60 °C, y puede operar en entornos con humedad del 5 al 95%. Además, dispone de puertos de comunicación RJ45, RS485 y WLAN, pantalla LCD, sensor de temperatura y utiliza enfriamiento natural.\r\n', 50, 1050990.00, 4, 1),
(16, 'C123057993', 'Cable Solar 4mm por metros', '\r\nCable Importado\r\nIP67, IP68\r\nCumple todas las normas Chilenas\r\nInterperie\r\nEl valor es por metro\r\nDisponible en colores : Rojo y Negro\r\n', '\r\nDiámetro: 4mm\r\nConductor: 99.7% de cobre estañado\r\nResistencia a la radiación ultravioleta (UV)\r\nAislamiento XLPE (XLPO) de doble pared\r\nRango de temperatura: -40 ℃ ~ 90 ℃\r\nColores disponibles: Negro / Rojo\r\nCumple con estándares de pruebas contra el fuego: DIN EN 50265-2-1 y UL 1571 (VW-1)\r\nCurvatura permisible: 5xD\r\n\r\n', 50, 1050990.00, 5, 1),
(17, 'C122306599', 'Cargador de batería Blue Smart IP65 12V 7A 230v', '\r\nEl Cargador de batería Blue Smart IP65 12V 7A 230V CEE 7/16 retail de Victron Energy es una solución de carga de baterías de alta calidad diseñada para satisfacer las necesidades de una variedad de aplicaciones, desde vehículos automotores hasta sistemas de energía independientes y embarcaciones. Este cargador se destaca por su eficiencia y versatilidad, lo que lo convierte en una elección confiable para mantener sus baterías en óptimas condiciones.\r\n\r\n', '\r\n\r\nEste dispositivo es eficiente (94%) y funciona con 230 VCA. Tiene bajo consumo en espera (0,5 W) y puede cargar desde 0 V. Ofrece varias opciones de carga, incluyendo corriente y modo de corriente baja, con compensación de temperatura. Puede funcionar como fuente de alimentación y tiene protecciones contra polaridad inversa, cortocircuito y sobrecalentamiento. Funciona en un rango amplio de temperaturas y condiciones de humedad. Utiliza un algoritmo de carga adaptable de 7 etapas y tiene conectividad Bluetooth para monitorización. Es resistente al polvo y salpicaduras (IP65) y cumple con normativas de seguridad y emisiones. Las dimensiones y el peso varían según el modelo.\r\n', 50, 1050990.00, 5, 1),
(18, 'C123058004', 'Crimpiadora para Conectores MC4', '\r\nNuevo tipo de prensa de alicates con mango de agarre posición perfecta, Peso ligero, diseño y estructura lógica y mango de forma perfectos, garantiza el efecto Crimping perfecto.\r\n\r\nEl diseño de bloqueo asegura un prensado perfecto y de calidad.\r\n\r\n Prensado desde 2.5 mm2 hasta 6,0 mm². aplicable para conexiones sin soldadura, y cumplir con los estandares electricos.\r\nPortátil y fácil de operar.\r\nHerramienta Profesional para el electricista\r\n\r\n', '\r\nIdentificador de producto del fabricante\r\nBT0688\r\nPeso del producto\r\n522 g\r\nDimensiones del paquete\r\n28,8 x 10,8 x 5 cm\r\nReferencia del fabricante\r\nBT0688\r\nIncluye baterías\r\nNo\r\nNecesita baterías\r\nNo\r\n', 50, 1050990.00, 6, 1),
(19, 'S122317699', 'Spanner para Conectores MC4', '\r\n1 Par incluye 2 llaves MC4 para conectores MC4\r\n\r\nFabricado con plástico ABS de excelente calidad\r\n\r\n', '\r\n\r\nEsta spanner para conectores MC4 ofrece un diseño especializado que se adapta perfectamente a estos conectores, facilitando así el trabajo eficiente y seguro. Está construida con materiales duraderos, como plástico reforzado o metal de alta calidad, para garantizar una larga vida útil. Su tamaño compacto la hace fácilmente transportable, lo que resulta conveniente para su uso en instalaciones solares en el campo. Además, algunas spanners MC4 cuentan con una punta que sirve tanto para apretar como para aflojar los conectores, proporcionando una herramienta de doble función que simplifica la instalación y el mantenimiento.\r\n', 50, 1050990.00, 6, 1),
(20, 'M123867699', 'Monitor LCD Regulador de Carga SL series', '\r\nPresentamos el Monitor LCD Regulador de Carga SL series, una herramienta esencial para optimizar y controlar tu sistema de energía solar de manera eficiente. Diseñado para ofrecer comodidad y control total, este monitor es la pieza que faltaba para llevar tu sistema solar al siguiente nivel.\r\n\r\n', '\r\nEl algoritmo de carga PWM de 3 etapas se ha actualizado para incluir la carga de ecualización periódica, lo que evita la sulfatación de la batería y prolonga su vida útil. Además, la compensación de temperatura permite ajustar automáticamente los parámetros de carga. El producto ofrece diversos modos de carga y protección contra sobrecargas, sobredescargas y cortocircuitos. También es capaz de arrancar cargas de gran capacitancia sin problemas. Dispone de una pantalla LCD gráfica y una interfaz hombre-máquina para una operación intuitiva. Este producto está diseñado para funcionar en condiciones difíciles y cuenta con protección de iluminación TVS.\r\n\r\n', 50, 1050990.00, 6, 1),
(21, 'T123868799', 'Tenaza Cortadora de Cable Solar PV', '\r\nPelacables Solar PV\r\nCables soportados: 2.5mm2, 4.0mm2, 6.0mm2 (14 AWG, 12 AWG, 10 AWG)\r\nPeso: 0.5KG\r\n', '\r\nTenazas de alta precisión diseñadas con materiales de alta calidad, como acero al carbono o aleaciones resistentes a la corrosión. Su diseño ergonómico, mangos antideslizantes y mecanismo de palanca hacen que sean ideales para cortar cables solares de diferentes diámetros, garantizando una instalación solar de alta calidad y durabilidad, mientras reducen la fatiga del usuario\r\n', 50, 1050990.00, 6, 1),
(22, 'S234868799', 'Sonda de temperatura Epsolar', '\r\nEl sensor de temperatura remoto mejora la precisión de la medición de temperatura, para optimizar la carga de los bancos de baterías en sistemas fotovoltaicos o -grid. El sensor de temperatura es un accesorio opcional, se recomienda extender la vida útil y la eficiencia de la carga del banco de baterías. El sensor de temperatura remoto es compatible con los \r\n', '\r\nLas sondas de temperatura EPSolar son diseñadas para medir con precisión la temperatura en sistemas solares. Son compatibles con reguladores de carga solares de EPSolar y otros dispositivos de control del sistema, ofrecen cables de longitud adecuada para una fácil instalación, cuentan con protección contra la intemperie y tienen un rango de temperatura específico para garantizar mediciones precisas en diversas condiciones.\r\n', 50, 1050990.00, 6, 1),
(23, 'R123058004', 'Regulador de Carga PWM 60A 24 V EPSolar', '\r\n El controlador solar de la serie ViewStar es diseñado para el sistema solar fuera de la red, como como farola, sistema solar doméstico o pequeña central eléctrica, etc. Tiene LCD pantalla, carga de batería confiable, completa protección electrónica y programable parámetros.\r\n', '\r\n\r\nEste producto es un controlador solar altamente eficiente con un diseño EMC excelente. Cuenta con un potente MCU de 32 bits y ofrece diversas opciones de batería. Proporciona control inteligente de iluminación solar, alta precisión en la medición y una interfaz amigable. Además, tiene funciones de estadísticas de energía, comunicación MODBUS y la capacidad de actualizar su firmware en campo.\r\n', 50, 1050990.00, 7, 1),
(24, 'R303317699', 'Regulador de Carga- DriverMPPT 12/24 15A EPSolar', '\r\nLa serie TRACER-EPLI combina energía solar controlador de carga y controlador LED en uno unidad. Es ideal para iluminación LED solar requiriendo función de atenuación. El control El parámetro puede ser programado por APLICACIÓN móvil y SPP-02 a través de infrarrojos (IR) comunicación.\r\n', '\r\nTipo de Regulador de Carga: MPPT (Seguimiento del Punto de Máxima Potencia).\r\nVoltaje del Sistema: 12V/24V automático (Puede trabajar con sistemas de 12V o 24V).\r\nCorriente de Carga Máxima: 15 Amperios (15A).\r\nTecnología MPPT Eficiente: Maximiza la eficiencia de conversión de energía solar.\r\nPantalla LCD: Proporciona información en tiempo real sobre el estado del sistema.\r\nProtecciones Avanzadas: Incluye protección contra sobrecarga, protección contra cortocircuitos, protección contra polaridad inversa y protección contra sobrecalentamiento.\r\nAlgoritmo de Carga Inteligente: Optimiza la carga de las baterías para prolongar su vida útil.\r\nDiseño Duradero: Construcción robusta y resistente para soportar condiciones climáticas adversas.\r\nFácil Instalación y Configuración: Adecuado tanto para usuarios principiantes como experimentados en energía solar.\r\n', 50, 1050990.00, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `total` float(12,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `categoria` (`categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD PRIMARY KEY (`id_detalle_orden`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle_venta`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagenes`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `cliente` (`cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `producto` (`producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `cliente` (`cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  MODIFY `id_detalle_orden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagenes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_orden`
--
ALTER TABLE `detalle_orden`
  ADD CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  ADD CONSTRAINT `detalle_orden_ibfk_3` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `imagenes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
