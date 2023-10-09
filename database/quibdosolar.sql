-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-10-2023 a las 04:02:11
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
(1, 1, 'panel-solar-1.webp'),
(2, 2, 'panel-solar-2.webp'),
(3, 3, 'panel-solar-3.webp'),
(4, 4, 'panel-solar-4.webp'),
(5, 5, 'panel-solar-5.webp'),
(6, 6, 'panel-solar-6.webp'),
(7, 7, 'bateriagel1.webp'),
(8, 7, 'bateriagel2.webp'),
(9, 7, 'bateriagel3.png'),
(10, 8, 'bateriaaokly1.jpg'),
(11, 8, 'bateriaaokly2.jpg'),
(12, 8, 'bateriaaokly3.webp'),
(13, 9, 'bateriaagm1.jpg'),
(14, 9, 'bateriaagm2.jpg'),
(15, 9, 'bateriaagm3.jpg'),
(16, 10, 'inversor1.png'),
(17, 10, 'inversor2.png'),
(18, 10, 'inversor3.png'),
(19, 11, 'multiplus1.jpg'),
(20, 11, 'multiplus2.jpg'),
(21, 11, 'multiplus3.jpg'),
(22, 12, 'inversoroff1.jpg'),
(23, 12, 'inversoroff2.jpg'),
(24, 12, 'inversoroff3.png'),
(25, 13, 'controlador1.jpg'),
(26, 13, 'controlador2.png'),
(27, 13, 'controlador3.png'),
(28, 14, 'controladorsolar1.webp'),
(29, 14, 'controladorsolar2.jpg'),
(30, 14, 'controladorsolar3.jpg'),
(31, 15, 'controladormppt1.webp'),
(32, 15, 'controladormppt2.webp'),
(33, 15, 'controladormppt3.png'),
(34, 16, 'cable1.webp'),
(35, 16, 'cable2.jpg'),
(36, 16, 'cable3.jpg'),
(37, 17, 'cargador1.png'),
(38, 17, 'cargador2.jpg'),
(39, 17, 'cargador3.png'),
(40, 18, 'Crimpiadora1.webp'),
(41, 18, 'Crimpiadora2.webp'),
(42, 18, 'Crimpiadora3.jpg'),
(43, 19, 'spanner1.webp'),
(44, 19, 'spanner2.jpg'),
(45, 19, 'spanner3.jpg'),
(46, 20, 'monitolcd1.webp'),
(47, 20, 'monitolcd2.webp'),
(48, 20, 'monitolcd3.webp'),
(49, 21, 'tenaza1.jpg'),
(50, 21, 'tenaza2.jpg'),
(51, 21, 'tenaza3.jpg'),
(52, 22, 'sonda1.jpg'),
(53, 22, 'sonda2.jpg'),
(54, 22, 'sonda3.jpg'),
(55, 23, 'reguladorcarga1.jpg'),
(56, 23, 'reguladorcarga2.jpg'),
(57, 23, 'reguladorcarga3.jpg'),
(58, 24, 'reguladorPLW1.jpg'),
(59, 24, 'reguladorPLW2.jpg'),
(60, 24, 'reguladorPLW3.png');

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
(10, 'I123056781', 'Inversor MULTIPLUS-II 12V 3000VA Victron Energy\r\n', '\r\nEl Inversor MULTIPLUS-II 12V 3000VA de Victron Energy es una poderosa y versátil solución para la gestión de energía en sistemas autónomos y aplicaciones de energía renovable. Este inversor de onda sinusoidal pura de 3000VA y 12V es capaz de convertir la energía de la batería en electricidad de alta calidad, adecuada para alimentar una amplia variedad de dispositivos y equipos.\r\n\r\nCon su diseño avanzado y tecnología de vanguardia, el MULTIPLUS-II ofrece un rendimiento confiable y eficiente. Además de su función de inversor, también incorpora un cargador de batería con capacidad de carga adaptativa, lo que significa que puede recargar las baterías de manera óptima, maximizando su vida útil.\r\n\r\nUna de las características destacadas de este inversor es su capacidad de funcionar en modo de transferencia sin interrupción, lo que significa que puede cambiar automáticamente entre la alimentación de la red eléctrica y la energía almacenada en las baterías, garantizando un suministro de energía constante y sin cortes.', '\r\n\r\nControl de Potencia / Asistencia Eléctrica: Permite el control de potencia y asistencia eléctrica en el sistema.\r\nConmutador de Transferencia: Con un conmutador de transferencia de 32 A para la conmutación entre fuentes de alimentación.\r\nEntrada de CA: Rango de tensión de entrada de CA de 187-265 VCA y frecuencia de entrada de 45-65 Hz.\r\nInversor: Ofrece una potencia continua de salida de 3000 VA o 2400 W a 25°C, 2200 W a 40°C y 1700 W a 65°C, con un pico de potencia de 5500 W.\r\nEficiencia Máxima: Hasta un 93% de eficiencia y bajo consumo en modo de espera.\r\nCargador: Proporciona una máxima corriente de carga de la batería de 120 A con ajustes de tensión de carga de \"absorción\", \"flotación\" y \"modo de almacenamiento\".\r\nProtección y Comunicación: Ofrece protección contra diversos factores y tiene puertos de comunicación VE.Bus y puertos de comunicación de uso general, así como la opción de un sensor de CA externo.\r\nTemperatura y Carcasa: Funciona en temperaturas de 40 a +65°C y tiene una carcasa de acero con grado de protección IP22.\r\nDimensiones y Peso: Con dimensiones de 546 x 275 x 147 mm y un peso de 19 kg.\r\nNormas: Cumple con estándares de seguridad y emisiones/inmunidad, como EN-IEC 60335-1, EN-IEC 60335-2-29, EN-IEC 62109-1, EN-IEC 62109-2, EN 55014-1, EN 55014-2, EN-IEC 61000-3-2, EN-IEC 61000-3-3, IEC 61000-6-1, IEC 61000-6-2 y IEC 61000-6-3.\r\n', 50, 1050990.00, 3, 1),
(11, 'I123056802', 'Inversor MULTIPLUS 12V 1600VA Victron Energy', '\r\n El Inversor MULTIPLUS 12V 1600VA de Victron Energy es una solución de alta calidad diseñada para satisfacer las necesidades de energía de forma eficiente y confiable. Este inversor es una pieza clave en sistemas de energía autónomos y se destaca por su versatilidad y rendimiento excepcionales. Con una potencia de 1600VA, puede convertir la energía de 12 voltios en una fuente de corriente alterna estable, lo que lo hace ideal para aplicaciones en vehículos recreativos, embarcaciones, sistemas de energía solar y más.\r\n\r\nEl Inversor MULTIPLUS de Victron Energy no solo convierte la energía de manera eficiente, sino que también cuenta con funciones avanzadas de carga de batería, lo que lo convierte en una solución integral para la gestión de energía. Su diseño robusto y su tecnología de vanguardia garantizan un funcionamiento sin problemas y una larga vida útil.\r\n', '\r\n\r\nEl modelo MULTIPLUS-12-1600 es un inversor con control de potencia y asistencia eléctrica. Tiene un conmutador de transferencia de 16 amperios y un rango de tensión de entrada de 9.5V a 17V CC. Su salida proporciona 230V CA a una frecuencia de 50Hz, con una potencia continua de 1600VA (1300W a 25°C, 1200W a 40°C y 800W a 65°C) y una capacidad de pico de 3000W. Ofrece una eficiencia máxima del 93% y tiene un bajo consumo en vacío.\r\n\r\nEl cargador de entrada CA admite un rango de tensión de 187-265V CA con una frecuencia de entrada de 45-65Hz y una corriente de carga de batería auxiliar de 70A. También incluye un sensor de temperatura de la batería.\r\n\r\nEn cuanto a características generales, cuenta con una salida auxiliar de 50A, protección, puertos de comunicación VE.Bus y de uso general, capacidad de encendido/apagado remoto, y opera en un rango de temperatura de -40 a +65°C. La carcasa está hecha de aluminio con categoría de protección IP21 y tiene conexiones para batería y CA.\r\n\r\nEste producto cumple con varios estándares de seguridad y emisiones. Es una solución versátil y robusta para sistemas de energía en diversas aplicaciones.\r\n', 50, 1050990.00, 3, 1),
(12, 'I123177891', 'Inversor OFF GRID PHOENIX 12V 800VA Victron Energy\r\n', '\r\nDescubre el potente Inversor OFF GRID PHOENIX 12V 800VA de Victron Energy, la solución perfecta para tu sistema de energía independiente. Con una capacidad de 800VA y diseñado para operar fuera de la red eléctrica convencional, este inversor te proporciona la libertad de generar y utilizar tu propia energía. Con la confiabilidad y calidad que caracteriza a Victron Energy, este inversor es la elección ideal para aplicaciones fuera de la red, como sistemas de energía solar, eólica o de respaldo.\r\n', '\r\n\r\nPotencia Continua: 800 VA (vatios aparentes) a 25°C.\r\nPotencia Continua a 25°C/40°C: 650/560 W (vatios) respectivamente.\r\nPico de Potencia: 1500 W (vatios) para manejar cargas de arranque.\r\nTensión/Frecuencia de Salida Ajustable: 230 VCA o 120 VCA +/- 3 %, 50Hz o 60Hz +/- 0,1 %.\r\nRango de Tensión de Entrada: 9,2 – 17 V.\r\nDesconexión por CC Baja Ajustable: 9,3 V.\r\nReinicio y Alarma por CC Baja Ajustable: 10,9 V.\r\nDetector de Batería Cargada Ajustable: 14,0 V.\r\nEficacia Máxima: 90 %.\r\nConsumo en Vacío: 6,5 W en condiciones normales, 1 W en modo ECO (ajustable).\r\nRango de Temperatura de Trabajo: -40 a +65°C (requiere refrigeración por ventilador, con reducción de potencia a temperaturas elevadas).\r\nHumedad Máxima: 95 % (sin condensación).\r\nCarcasa: Chasis de acero y carcasa de plástico (azul RAL 5012).\r\nConexión de la Batería: Bornes de tornillo.\r\nTomas de Corriente CA Estándar: Schuko (CEE 7/4), IEC-320 (enchufe macho incluido) para 230 V; Nema 5-15R, GFCI para 120 V.\r\nTipo de Protección: IP 21.\r\nPeso: 5,5 kg.\r\nDimensiones (al x an x p en mm): 105 x 230 x 325.\r\nCaja: IP20.\r\nAccesorios: Incluye On/Off remoto y es compatible con el conmutador de transferencia automático Filax.\r\nEstándares de Seguridad: Cumple con EN-IEC 60335-1, EN-IEC 62109-1 y UL 458.\r\nEstándares de EMC: Cumple con EN 55014-1, EN 55014-2, IEC 61000-6-1, IEC 61000-6-2, IEC 61000-6-3.\r\nDirectiva de Automoción: Cumple con ECE R10-4.\r\n', 50, 1050990.00, 3, 1),
(13, 'C123056892', 'Controlador Solar SmartSolar MPPT 250V 100A – TR VE.Can', '\r\nEl Controlador Solar SmartSolar MPPT 250V 100A – TR VE.Can de Victron Energy es una avanzada solución de gestión de energía solar diseñada para optimizar la eficiencia de tu sistema fotovoltaico. Con una capacidad de hasta 100 amperios y una tensión máxima de 250 voltios, este controlador inteligente utiliza la tecnología Maximum Power Point Tracking (MPPT) para rastrear y extraer la máxima cantidad de energía solar disponible de tus paneles solares.\r\n\r\nUna de las características destacadas de este controlador es su compatibilidad con la red VE.Can de Victron Energy, lo que permite una integración perfecta con otros dispositivos y sistemas de la marca. Esto facilita la supervisión y el control centralizados de tu sistema solar, lo que te permite mantener un seguimiento preciso del rendimiento y la producción de energía.\r\n', '\r\n\r\n\r\nTensión de la batería: Ajuste automático a 12, 24 o 48 V (Requiere una herramienta de software para ajustar el sistema en 36 V).\r\n\r\nCorriente de carga nominal: 100 A.\r\n\r\nPotencia FV nominal:\r\n\r\n12 V: 1450 W.\r\n24 V: 2900 W.\r\n36 V: 4350 W.\r\n48 V: 5800 W.\r\nMáx. corriente de cortocircuito FV: 70 A (máx. 30 A por conector MC4).\r\n\r\nTensión máxima del circuito abierto FV: 250 V máximo absoluto en las condiciones más frías (245 V en arranque y funcionamiento máximo).\r\n\r\nEficiencia máxima: 99 %.\r\n\r\nAutoconsumo: Menos de 35 mA a 12 V / 20 mA a 48 V.\r\n\r\nTensión de carga de “absorción”: Valores predeterminados ajustables.\r\n\r\nTensión de carga de “flotación”: Valores predeterminados ajustables.\r\n\r\nAlgoritmo de carga: Variable multietapas (ocho algoritmos preprogramados) o algoritmo definido por el usuario.\r\n\r\nCompensación de temperatura: -16 mV / -32 mV / -64 mV por grado Celsius.\r\n\r\nProtección: Polaridad inversa, cortocircuito de salida, sobretemperatura.\r\n\r\nPuerto de comunicación de datos: VE.Direct o Bluetooth.\r\n\r\nInterruptor on/off remoto: Sí.\r\n\r\nRelé programable: DPST (Capacidad nominal CA 240 VAC / 4 A, Capacidad nominal CC 4 A hasta 35 VCC, 1 A hasta 60 VCC).\r\n\r\nFuncionamiento en paralelo: Sí, hasta 10 unidades se pueden sincronizar con Bluetooth.\r\n', 50, 1050990.00, 4, 1),
(14, 'C123056912', 'Controlador Solar 30 Amperes PWM VS3024AU', '\r\n Controlador de carga solar 30A VS3024AU PWM de trabajo automático de 12V / 24V con pantalla LCD incorporada y puerto USB.\r\nCarga PWM\r\nTipo de batería seleccionable: Sellado, Gel e Inundado\r\nPantalla LCD informativa con luz negra\r\nDiseño USB doble, Máx. salida 2.4A\r\nMúltiples modos de control de carga\r\nFunción de estadísticas de energía\r\nPotencia total trabajando en un rango de temperatura de -25 a 55\r\nAdopta componentes de alta calidad y alta confiabilidad de ST, IR e Infineon\r\nCertificados UL y VDE terminales de cobre niquelado, para asegura una conexión segura y sólida\r\nFunción de compensación de temperatura de la batería\r\nProtección electrónica extensa\r\n', '\r\n\r\nTensión nominal del sistema: Puede operar en sistemas de 12V o 24V de manera automática.\r\n\r\nRango de voltaje de entrada de la batería: Acepta voltajes de entrada de la batería en un rango de 9V a 32V.\r\n\r\nCorriente nominal de carga / descarga: Tiene una capacidad de carga / descarga máxima de 30A a una temperatura de 55 °C.\r\n\r\nMax. Voltaje de circuito abierto fotovoltaico: Puede manejar un máximo de 50V de voltaje de circuito abierto de paneles solares fotovoltaicos.\r\n\r\nTipo de Batería: Es compatible con varios tipos de baterías, incluyendo selladas, gel, inundadas y permite configuración personalizada por el usuario.\r\n\r\nVoltajes de carga: Ofrece diferentes voltajes de carga para diferentes tipos de baterías, como voltaje de carga igualar, aumentar y flotante.\r\n\r\nProtección de bajo voltaje: Cuenta con funciones de reconexión y desconexión de bajo voltaje para proteger las baterías.\r\n\r\nEficiencia energética: Tiene un bajo autoconsumo de energía, con menos de 10mA a 12V o menos de 18mA a 24V.\r\n\r\nCompensación de temperatura: Ajusta el voltaje en función de la temperatura ambiente con un coeficiente de compensación de temperatura de -3mV/°C/2V.\r\n\r\nPantalla LCD: Tiene una pantalla que opera en un rango de temperatura de -20 °C a +70 °C para mostrar información clave del sistema.\r\n\r\nDiseño robusto: Puede funcionar en un rango de temperatura ambiente de -25 °C a +55 °C a carga completa de manera continua.\r\n\r\nProtección contra humedad y polvo: Cuenta con un grado de protección IP20 y es adecuado para entornos con humedad ≤95%, sin condensación.\r\n\r\nEntrada USB: Dispone de una entrada USB de 5VDC / 2.4A para cargar dispositivos.\r\n\r\nDimensiones compactas: Tiene dimensiones totales de 181×100.9×59.8mm, con un tamaño de montaje de 172x80mm.\r\n\r\nTerminales: Los terminales son de 16mm2 para facilitar la conexión.\r\n\r\nPeso neto: Pesa aproximadamente 0.55 kg.\r\n', 50, 1050990.00, 4, 1),
(15, 'C123178902', 'Controlador Solar MPPT 80A 12-48V Tracer8415AN\r\n', '\r\nEl Controlador Solar MPPT 80A Tracer 8415 AN es una solución de vanguardia para maximizar la eficiencia de tu sistema de energía solar. Diseñado para trabajar con paneles solares de 12 a 48 voltios, este controlador utiliza la tecnología de seguimiento del punto de máxima potencia (MPPT) para optimizar la generación de energía solar.\r\n', '\r\nPotencia Solar: Admite una potencia solar máxima de 1000/2000/3000/4000 W.\r\nVoltaje del Panel Solar: Puede manejar un voltaje de circuito abierto del panel solar de hasta 150 V.\r\nVoltaje Nominal de la Batería: Es compatible con sistemas de baterías de 12/24/36/48 V.\r\nRango de Voltaje de la Batería: Opera en un amplio rango de voltaje de batería, desde 8 V hasta 68 V.\r\nCorriente Máxima de Carga de la Batería: Tiene una capacidad de carga de batería de hasta 80 A.\r\nEficiencia Máxima de Conversión: Ofrece una alta eficiencia de conversión del 98.50%.\r\nDimensiones y Peso: Sus dimensiones son 394x240x134 mm, con un peso de 6.10 kg.\r\nTerminales: Utiliza terminales de cable de 35.0 mm².\r\nAlgoritmo de Carga: Emplea un algoritmo de carga de 3 etapas (Bulk, Float, Ecualización).\r\nVoltaje de Carga: El voltaje de carga se ajusta automáticamente a 14.6/14.8 V (Igualar), 14.4/14.2 V (Aumentar), y 13.8 V (Flotador).\r\nTipo de Batería: Es compatible con varios tipos de baterías, incluyendo GEL, AGM, VLA y plomo carbono.\r\nCompensación de Temperatura: Posee un coeficiente de compensación de temperatura de -3mV/°C @ 2V.\r\nClase de Protección: Tiene una clasificación de protección IP20.\r\nRango de Temperatura: Funciona en temperaturas de -30 ~ +60 °C y se puede almacenar en temperaturas de -30 ~ +85 °C.\r\nHumedad: Puede operar en entornos con una humedad del 5 al 95%.\r\nPuertos de Comunicación: Dispone de puertos de comunicación RJ45, RS485 y WLAN.\r\nMonitor: Cuenta con una pantalla LCD para la visualización de datos.\r\nSensor de Temperatura: Incluye un sensor de temperatura.\r\nModo de Enfriamiento: El enfriamiento es natural, sin requerir sistemas adicionales.\r\n', 50, 1050990.00, 4, 1),
(16, 'C123057993', 'Cable Solar 4mm por metros', '\r\nCable Importado\r\nIP67, IP68\r\nCumple todas las normas Chilenas\r\nInterperie\r\nEl valor es por metro\r\nDisponible en colores : Rojo y Negro\r\n', '\r\nDiámetro: 4mm\r\nConductor: 99.7% de cobre estañado\r\nResistencia a la radiación ultravioleta (UV)\r\nAislamiento XLPE (XLPO) de doble pared\r\nRango de temperatura: -40 ℃ ~ 90 ℃\r\nColores disponibles: Negro / Rojo\r\nCumple con estándares de pruebas contra el fuego: DIN EN 50265-2-1 y UL 1571 (VW-1)\r\nCurvatura permisible: 5xD\r\n\r\n', 50, 1050990.00, 5, 1),
(17, 'C122306599', 'Cargador de batería Blue Smart IP65 12V 7A 230v', '\r\nEl Cargador de batería Blue Smart IP65 12V 7A 230V CEE 7/16 retail de Victron Energy es una solución de carga de baterías de alta calidad diseñada para satisfacer las necesidades de una variedad de aplicaciones, desde vehículos automotores hasta sistemas de energía independientes y embarcaciones. Este cargador se destaca por su eficiencia y versatilidad, lo que lo convierte en una elección confiable para mantener sus baterías en óptimas condiciones.\r\n\r\n', '\r\n\r\nEficiencia: Tiene una eficiencia del 94%, lo que garantiza un uso eficiente de la energía.\r\nTensión de Entrada: Funciona con una tensión de entrada de 230 VCA.\r\nConsumo en Espera: Su consumo en espera es bajo, de tan solo 0,5 W.\r\nTensión de Batería Mínima: Puede comenzar a cargar incluso cuando la tensión de la batería es de 0 V.\r\nTensión de Carga: Ofrece múltiples niveles de tensión de carga de absorción, flotación y almacenamiento, dependiendo de la aplicación.\r\nCorriente de Carga: Proporciona opciones de corriente de carga que varían de 4 a 25 A.\r\nModo de Corriente Baja: Tiene un modo de corriente baja que varía de 2 a 10 A.\r\nCompensación de Temperatura: Ofrece una compensación de temperatura (para baterías de plomo-ácido) de 16 mV/ºC.\r\nModo Fuente de Alimentación: Puede funcionar como una fuente de alimentación.\r\nProtecciones: Ofrece protección contra polaridad inversa, cortocircuito de salida y sobretemperatura.\r\nRango de Temperatura: Funciona en un amplio rango de temperatura, desde -40 °C hasta +60 °C.\r\nHumedad: Soporta hasta un 95% de humedad sin condensación.\r\nAlgoritmo de Carga: Utiliza un algoritmo de carga adaptable de 7 etapas.\r\nBluetooth: Incorpora Bluetooth para facilitar la monitorización.\r\nCarcasa: Tiene una carcasa resistente con clasificación IP65 (a prueba de polvo y salpicaduras).\r\nConexiones: Viene con cables rojo y negro de 1,5 metros para la batería y un cable de 1,5 metros con enchufe CE 7/16 para la conexión a la red eléctrica.\r\nPeso: El peso varía según el modelo, desde 0,9 kg hasta 1,9 kg.\r\nDimensiones: Las dimensiones varían según el modelo, con medidas de 45 x 81 x 182 mm para algunos modelos.\r\nNormativas: Cumple con varias normativas de seguridad y emisiones, como EN 60335-1, EN 60335-2-29, EN 55014-1, EN 61000-6-3, EN 61000-3-2, EN 55014-2, EN 61000-6-1, EN 61000-6-2 y EN 61000-3-3.\r\n', 50, 1050990.00, 5, 1),
(18, 'C123058004', 'Crimpiadora para Conectores MC4', '\r\nNuevo tipo de prensa de alicates con mango de agarre posición perfecta, Peso ligero, diseño y estructura lógica y mango de forma perfectos, garantiza el efecto Crimping perfecto.\r\n\r\nEl diseño de bloqueo asegura un prensado perfecto y de calidad.\r\n\r\n Prensado desde 2.5 mm2 hasta 6,0 mm². aplicable para conexiones sin soldadura, y cumplir con los estandares electricos.\r\nPortátil y fácil de operar.\r\nHerramienta Profesional para el electricista\r\n\r\n', '\r\nIdentificador de producto del fabricante\r\nBT0688\r\nPeso del producto\r\n522 g\r\nDimensiones del paquete\r\n28,8 x 10,8 x 5 cm\r\nReferencia del fabricante\r\nBT0688\r\nIncluye baterías\r\nNo\r\nNecesita baterías\r\nNo\r\n', 50, 1050990.00, 6, 1),
(19, 'S122317699', 'Spanner para Conectores MC4', '\r\n1 Par incluye 2 llaves MC4 para conectores MC4\r\n\r\nFabricado con plástico ABS de excelente calidad\r\n\r\n', '\r\n\r\nDiseño especializado: La spanner para conectores MC4 está diseñada con una forma específica que se adapta perfectamente a los conectores MC4. Esto facilita el trabajo con estos conectores de forma eficiente y segura.\r\n\r\nMaterial duradero: Suelen estar fabricadas con materiales resistentes y duraderos, como plástico reforzado o metal de alta calidad, para garantizar una larga vida útil.\r\n\r\nTamaño compacto: La spanner es lo suficientemente pequeña como para caber en la mano y ser fácilmente transportable, lo que la hace conveniente para llevarla a instalaciones solares en el campo.\r\n\r\nHerramienta de doble función: Algunas spanners para conectores MC4 tienen una punta que puede usarse tanto para apretar como para aflojar los conectores MC4. Esto simplifica aún más la instalación y el mantenimiento.\r\n', 50, 1050990.00, 6, 1),
(20, 'M123867699', 'Monitor LCD Regulador de Carga SL series', '\r\nPresentamos el Monitor LCD Regulador de Carga SL series, una herramienta esencial para optimizar y controlar tu sistema de energía solar de manera eficiente. Diseñado para ofrecer comodidad y control total, este monitor es la pieza que faltaba para llevar tu sistema solar al siguiente nivel.\r\n\r\n', '\r\n• Se adopta un algoritmo de carga PWM de 3 etapas actualizado. La aplicación de una carga de ecualización a la batería periódicamente o cuando se\r\nLa descarga en exceso, puede prevenir eficazmente que la batería no se ecualice y se sulfure, extendiendo así la vida útil de la batería.\r\n• Con la compensación de temperatura empleada, los parámetros de carga se pueden ajustar automáticamente.\r\n• Una amplia gama de modos de trabajo de carga facilitan la aplicación del producto a diferentes tipos de carga.\r\n• El producto proporciona protección contra sobrecargas, sobredescargas y sobrecargas, así como protección contra cortocircuitos.\r\n•En virtud de un método de arranque de carga avanzado, las cargas de gran capacitancia se pueden iniciar sin problemas.\r\n• El producto proporciona una pantalla LCD gráfica de matriz de puntos y una interfaz hombre-máquina con una tecla.\r\n• El diseño fácil de usar del navegador y las interfaces dinámicas aseguran operaciones convenientes e intuitivas.\r\n• Con un diseño de grado industrial, el producto puede funcionar bien en diversas condiciones difíciles.\r\n• Se adopta la protección de iluminación TVS.\r\n\r\n', 50, 1050990.00, 6, 1),
(21, 'T123868799', 'Tenaza Cortadora de Cable Solar PV', '\r\nPelacables Solar PV\r\nCables soportados: 2.5mm2, 4.0mm2, 6.0mm2 (14 AWG, 12 AWG, 10 AWG)\r\nPeso: 0.5KG\r\n', '\r\nCorte de Alta Precisión: Estas tenazas están diseñadas para proporcionar cortes precisos y limpios en cables solares de diferentes diámetros, lo que asegura una instalación solar de alta calidad.\r\n\r\nMateriales de Alta Calidad: Suelen estar fabricadas con materiales de alta calidad, como acero al carbono o aleaciones resistentes a la corrosión, para garantizar su durabilidad y resistencia a la intemperie.\r\n\r\nDiseño Ergonómico: Tienen un diseño ergonómico que facilita su manejo y reduce la fatiga del usuario durante el uso prolongado.\r\n\r\nMangos Antideslizantes: Los mangos suelen contar con revestimientos antideslizantes que mejoran la sujeción y la seguridad durante el corte.\r\n\r\nCortadores de Alta Palanca: Algunas tenazas tienen un mecanismo de palanca que permite realizar cortes con menos esfuerzo, lo que facilita el trabajo en aplicaciones solares de gran envergadura.\r\n', 50, 1050990.00, 6, 1),
(22, 'S234868799', 'Sonda de temperatura Epsolar', '\r\nEl sensor de temperatura remoto mejora la precisión de la medición de temperatura, para optimizar la carga de los bancos de baterías en sistemas fotovoltaicos o -grid. El sensor de temperatura es un accesorio opcional, se recomienda extender la vida útil y la eficiencia de la carga del banco de baterías. El sensor de temperatura remoto es compatible con los \r\n', '\r\nMedición de Temperatura Precisa: Las sondas de temperatura EPSolar están diseñadas para proporcionar mediciones precisas de la temperatura del sistema solar. Esto es importante porque la temperatura puede afectar significativamente la eficiencia y el rendimiento de los paneles solares y las baterías.\r\n\r\nCompatibilidad: Están diseñadas para ser compatibles con los reguladores de carga solares de EPSolar u otros dispositivos de control del sistema. Deben conectarse fácilmente a estos dispositivos para proporcionar datos de temperatura en tiempo real.\r\n\r\nCableado Adecuado: Suelen incluir cables de longitud adecuada para permitir una fácil instalación y conexión al controlador de carga o al sistema de monitoreo.\r\n\r\nProtección contra la Intemperie: En algunos casos, las sondas de temperatura pueden tener una carcasa resistente a la intemperie para proteger el sensor de los elementos y garantizar una medición precisa en diferentes condiciones climáticas.\r\n\r\nRango de Temperatura: Pueden tener un rango de temperatura específico en el que son efectivas. Asegúrate de que el rango de temperatura de la sonda sea compatible con las condiciones en las que se instalará.\r\n', 50, 1050990.00, 6, 1),
(23, 'R123058004', 'Regulador de Carga PWM 60A 24 V EPSolar', '\r\n El controlador solar de la serie ViewStar es diseñado para el sistema solar fuera de la red, como como farola, sistema solar doméstico o pequeña central eléctrica, etc. Tiene LCD pantalla, carga de batería confiable, completa protección electrónica y programable parámetros.\r\n', '\r\n● Excelente diseño EMC\r\n● MCU de 32 bits con alta velocidad\r\n● Carga PWM de la serie de alta eficiencia\r\n● Cuatro opciones de tipo de batería: sellada, gel, inundada y USUARIO\r\n● Control inteligente de iluminación y temporizador para sistema de iluminación solar\r\n● Muestreo de alta precisión A / D de 12 bits para garantizar la precisión\r\n● Utilice MOSFET como interruptor electrónico\r\n● Configuración y modificación de parámetros de control total, modo de control de carga diversificado\r\n● Diseño humanizado de la interfaz del navegador, realice todas las operaciones cómodamente\r\n● Compensación de temperatura\r\n● Adopte la pantalla LCD gráfica de matriz de puntos y HMI (interfaz hombre-máquina) con 4 botones,\r\nvisualización y funcionamiento del menú integrado\r\n● Función de estadísticas de energía\r\n● Puertos RS485 con protocolo de comunicación MODBUS\r\n● Software de monitoreo de PC opcional y medidor remoto para monitoreo en tiempo real y batería.\r\najuste de parámetros de gestión\r\n● Firmware actualizable en campo\r\n', 50, 1050990.00, 7, 1),
(24, 'R303317699', 'Regulador de Carga- DriverMPPT 12/24 15A EPSolar', '\r\nLa serie TRACER-EPLI combina energía solar controlador de carga y controlador LED en uno unidad. Es ideal para iluminación LED solar requiriendo función de atenuación. El control El parámetro puede ser programado por APLICACIÓN móvil y SPP-02 a través de infrarrojos (IR) comunicación.\r\n', '\r\nTipo de Regulador de Carga: MPPT (Seguimiento del Punto de Máxima Potencia).\r\nVoltaje del Sistema: 12V/24V automático (Puede trabajar con sistemas de 12V o 24V).\r\nCorriente de Carga Máxima: 15 Amperios (15A).\r\nTecnología MPPT Eficiente: Maximiza la eficiencia de conversión de energía solar.\r\nPantalla LCD: Proporciona información en tiempo real sobre el estado del sistema.\r\nProtecciones Avanzadas: Incluye protección contra sobrecarga, protección contra cortocircuitos, protección contra polaridad inversa y protección contra sobrecalentamiento.\r\nAlgoritmo de Carga Inteligente: Optimiza la carga de las baterías para prolongar su vida útil.\r\nDiseño Duradero: Construcción robusta y resistente para soportar condiciones climáticas adversas.\r\nFácil Instalación y Configuración: Adecuado tanto para usuarios principiantes como experimentados en energía solar.\r\n', 50, 1050990.00, 7, 1);

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
-- Indices de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id_imagenes`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `producto` (`producto`),
  ADD KEY `id_categoria` (`id_categoria`);

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
-- AUTO_INCREMENT de la tabla `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id_imagenes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `imagenes`
--
ALTER TABLE `imagenes`
  ADD CONSTRAINT `imagenes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
