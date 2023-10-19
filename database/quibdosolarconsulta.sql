--Creación de la Data Base

CREATE DATABASE quibdosolar;

----Creación de las tablas

CREATE TABLE cliente(
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(60) NOT NULL,
    contrasenia VARCHAR(50) NOT NULL,
    token VARCHAR(45) NULL,
    estado BOOLEAN NOT NULL
);

CREATE TABLE administrador(
    id_administrador INT(11) PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    contrasenia VARCHAR(50) NOT NULL
);

CREATE TABLE producto(
    id_producto INT(11) PRIMARY KEY AUTO_INCREMENT,
    serial VARCHAR(12) NOT NULL UNIQUE,
    producto VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NOT NULL,
    caracteristicas TEXT NOT NULL,
    cantidad INT(11) NOT NULL,
    precio FLOAT(12,2),
    id_categoria INT(11) NOT NULL,
    estado_producto BOOLEAN NOT NULL
);
CREATE TABLE imagenes(
    id_imagenes INT(11) PRIMARY KEY AUTO_INCREMENT,
    producto_id INT(11)NOT NULL,
    url VARCHAR(50) NULL
);

CREATE TABLE categoria(
    id_categoria INT(11) PRIMARY KEY AUTO_INCREMENT,
    categoria VARCHAR(50) NOT NULL UNIQUE,
    estado_categoria BOOLEAN NOT NULL
);

CREATE TABLE compra(
    id_compra INT(11) PRIMARY KEY AUTO_INCREMENT,
    id_producto INT(11) NOT NULL,
    cantidad FLOAT(12) NOT NULL,
    precio FLOAT(12,2) NOT NULL,
    total FLOAT(12,2) NOT NULL,
    fecha timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE venta(
    id_venta INT(11) PRIMARY KEY AUTO_INCREMENT,
    cliente INT(11) NOT NULL,
    total FLOAT(12,2) NOT NULL,
    fecha timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE detalle_venta(
    id_detalle_venta INT(11) PRIMARY KEY AUTO_INCREMENT,
    id_venta INT(11) NOT NULL,
    id_producto INT(11) NOT NULL,
    cantidad_venta INT(11) NOT NULL,
    precio_producto  FLOAT(12,2),
    monto_total FLOAT(12,2) NOT NULL
);

CREATE TABLE orden(
    id_orden INT(11) PRIMARY KEY AUTO_INCREMENT,
    cliente INT(11) NOT NULL,
    total FLOAT(12,2) NOT NULL,
    estado BOOLEAN NOT NULL,
    condicion BOOLEAN NOT NULL,
    fecha timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);

CREATE TABLE detalle_orden(
    id_detalle_orden INT(11) PRIMARY KEY AUTO_INCREMENT,
    cliente INT(11) NOT NULL,
    id_orden INT(11) NOT NULL,
    id_producto INT(11) NOT NULL,
    cantidad_venta INT(11) NOT NULL,
    precio_producto  FLOAT(12,2),
    monto_total FLOAT(12,2) NOT NULL,
    estado BOOLEAN NOT NULL,
    extra BOOLEAN NOT NULL
);

ALTER TABLE producto ADD FOREIGN KEY(id_categoria)
REFERENCES categoria(id_categoria);

ALTER TABLE imagenes ADD FOREIGN KEY(producto_id)
REFERENCES producto(id_producto);

ALTER TABLE compra ADD FOREIGN KEY(id_producto)
REFERENCES producto(id_producto);

ALTER TABLE venta ADD FOREIGN KEY(cliente)
REFERENCES cliente(id);

ALTER TABLE detalle_venta ADD FOREIGN KEY(id_venta)
REFERENCES venta(id_venta);

ALTER TABLE detalle_venta ADD FOREIGN KEY(id_producto)
REFERENCES producto(id_producto);

ALTER TABLE orden ADD FOREIGN KEY(cliente)
REFERENCES cliente(id);

ALTER TABLE detalle_orden ADD FOREIGN KEY(cliente)
REFERENCES cliente(id);

ALTER TABLE detalle_orden ADD FOREIGN KEY(id_orden)
REFERENCES orden(id_orden);

ALTER TABLE detalle_orden ADD FOREIGN KEY(id_producto)
REFERENCES producto(id_producto);

INSERT INTO cliente ( nombre, apellido, direccion, telefono, email, contrasenia, estado) VALUES
('Usuario', 'Prueba','Torre Norte SENA', +573024650490, 'usuario@gmail.com', 'Usuario12345', 1);

INSERT INTO administrador (nombre, apellido, email, contrasenia) VALUES
('Ingrid', 'Serna', 'admin@gmail.com', 'Admin');

INSERT INTO categoria (categoria, estado_categoria) VALUES
('Paneles Solares', '1'),
('Baterías Solares', '1'),
('Inversores Onda Pura', '1'),
('Controladores MPPT', '1'),
('Accesorios Solares', '1'),
('Herramientas', '1'), 
('Reguladores', '1');



INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('A123456789', 'Panel Solar 545w 550w Monocristalino','INELDEC SAS
Panel Solar 545W marca Luxen o Longi Media celda $1.080.000 compra directa
','Tensión de circuito abierto: 49.65V
Corriente de Cortocircuito: 13.95 A
Dimensiones: 2256x1134 (Largo x Ancho)
Peso: 28 kg
Eficiencia: 21.3%
Con certificación RETIE.
Garantía: 12 Años
.' ,50, '990900',1,'1'),
('A123456780', 'Hqst Panel Solar Monocristalino 100 W
','
Este panel solar está garantizado para proporcionar energía a todos tus dispositivos electrónicos favoritos. El vidrio templado y el marco de aluminio resistente a la corrosión permiten que cada panel resista fuertes cargas de viento Pa y nieve Pa, aumentando la durabilidad y el valor.','
Cada panel solar de 100 W es perfecto para una instalación permanente o semipermanente.
SKU: B092XDR3D5
COLOR: 100 W, paquete de 2
MARCA: HQST HIGH QUALITY SOLAR TECHNOLOGY
MODELO: HQST-100D-SSx2
PESO: 26.75 libras', 50, '1050990',1,'1'),
('A123456790', 'Renogy Modulo De Panel Solar Monocristalino Fotovoltaico Pv','Renogy módulo de panel solar monocristalino fotovoltaico pv 3 piezas 100 w carga de batería de 12 v17','
 confiable el material de encapsulación avanzado con laminados de láminas de múltiples capas mejora el rendimiento de la celda y proporciona una larga vida útil
 durable tolerancia de salida positiva garantizada 03 soporta vientos fuertes 2400pa y cargas de nieve 5400pa
 versátil úselo para su rv cuando acampe o durante viajes en la playa con la familia de cualquier manera este panel monocristalino le brinda la mayor eficiencia por espacio
 instalación lista los orificios perforados en la parte posterior del panel permiten un montaje y aseguramiento rápidos orificios pretaladrados incluidos para puesta a tierra compatible con diferentes sistemas de montaje renogy como soportes en z soportes para postes y soportes para inclinación
 garantía garantía de potencia transferible de 25 años material de 5 años y garantía de mano de obra
43.87 largo - 21.5 ancho - 2.62 alto caravan single panel compact design renogy', 50, '715900',1,'1'),
('A123456800', 'Panel Solar Netion 260w Policristalino Fotovoltaico 30v',' PANELES SOLARES MONOCRISTALINOS Y POLICRISTALINOS
Paneles Solares Policristalinos de 50W, 100W, 150W, 260W Y 325W
Paneles solares Monocristalinos de 100W, 150W, 220w, 260W, 320W, 360w, 400w, 450w, 550w','Resistencia PID: Celdas de tecnología avanzada y materiales de alta calidad que generan alta resistencia PID.
 Alta Eficiencia: Módulo de conversión de alta eficiencia con tecnología innovadora.
 Alta resistencia temperaturas extremas: Certificado para soporta el peso del viento (hasta 2400 pascales), y el peso de la nieve (5400 pascales).
 Alto desempeño ante poca radiación: Avanzada superficie de vidrio y celdas solares que permiten un desempeño excelente en ambientes de baja radiación.
 Garantía de alta calidad: Control de calidad 100% antes y después de laminación y producción final.
 Máximo desempeño de energía: Con tecnología de igualación de impedancia, genera más potencia en cada módulo solar.', 50, '631800',1,'1'),
('A123456801', 'Paneles Solares - Topsolar Flexible Solar Panel 100w 12v Mon','Paneles Solares - Topsolar Flexible Solar Panel 100W 12V Monocrystalline Bendable - 100 Watt 12Volt Semi-Flexible Mono Solar Panels Charger Off-Grid for RV Boat Cabin Van Car Uneven Surfaces
NOMBRE EN INGLES: Topsolar Flexible Solar Panel 100W 12V Monocrystalline Bendable - 100 Watt 12Volt Semi-Flexible Mono Solar Panels Charger Off-Grid for RV Boat Cabin Van Car Uneven Surfaces
Esto se ajusta a tu.','Potencia máxima en STC*: 100 W.
Voltaje de funcionamiento óptimo (Vmp): 22,3 V.
Corriente de funcionamiento óptima (Imp): 4,4A.
Tensión de circuito abierto (Voc): 25,9 V.
Corriente de cortocircuito (Isc): 4,6 A.
Voltaje máximo del sistema: 1000 VCC.', 50, '900000',1,'1'),
('A123456812', 'Panel Energia Solar Netion Policristalino 150w / 18v','Módulos solares Policristalinos de 150W
Resistencia PID: Celdas de tecnología avanzada y materiales de alta calidad que generan alta resistencia PID.
Alta Eficiencia: Módulo de conversión de alta eficiencia con tecnología innovadora.
Alta resistencia temperaturas extremas: Certificado para soporta el peso del viento (hasta 2400 pascales), y el peso de la nieve (5400 pascales).
Alto desempeño ante poca radiación: Avanzada superficie de vidrio y celdas solares que permiten un desempeño excelente en ambientes de baja radiación.
Garantía de alta calidad: Control de calidad 100% antes y después de laminación y producción final.
Máximo desempeño de energía: Con tecnología de igualación de impedancia, genera más potencia en cada módulo solar.','
- Tipo de Celda: Policristalina 156.75mmX156.75m
- Numero de Celdas: 36 (4x9)
- Eficiencia de las Celdas: 17.05%
- Dimensiones: 1485X668X35mm
- Peso: 11.0Kg.', 50, '387900',1,'1');

-- Baterías id 2

INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('B123056780', 'Batería de GEL 200Ah 12V Aokly','
La Batería de GEL 200Ah 12V Aokly es una batería de gel de alta capacidad, libre de mantenimiento y de larga duración. Esta batería es resistente a los ciclos profundos de carga y descarga, a las fluctuaciones de temperatura y a la corrosión, lo que la hace ideal para aplicaciones en exteriores.
','
Voltaje: 12V
Capacidad: 200Ah (10 horas) / 208Ah (20 horas) / 175Ah (5 horas) / 129Ah (1 hora)
Dimensiones: 522mm x 239mm x 216mm (Largo x Ancho x Altura)
Peso: Aproximadamente 58.8kg
Terminal: M8
Resistencia Interna: Aproximadamente 3.3mΩ
Temperatura de Funcionamiento: -20 ~ 55℃ (Descarga), 0 ~ 40℃ (Carga), -20 ~ 55℃ (Almacenamiento)
Corriente de Descarga Máxima: 1000A (5 segundos)
Vida de Diseño: 12 años en carga flotante
Material del Contenedor: ABS (UL94-HB)
Esta batería de gel es una opción confiable y duradera para aplicaciones diversas, incluyendo sistemas de energía solar y sistemas de respaldo.
', 50, '1050990',2,'1'),
('B123056791', 'Batería de GEL 100Ah 12V Aokly','
 La batería de gel de 100Ah 12V Aokly es una batería sellada de plomo-ácido con alta capacidad de carga y resistencia a ciclos profundos de carga y descarga. Esta batería es ideal para aplicaciones en sistemas solares, vehículos recreativos, carros de golf, sistemas de respaldo, embarcaciones, energía eólica, sistemas de iluminación y otros usos similares.
','

Voltaje nominal: 12V
Capacidad nominal: 100Ah a velocidad de 10 horas (10.0A a 1.80V / 25 ℃)
Dimensiones: 329mm (Longitud) x 172mm (Anchura) x 216mm (Altura) x 221mm (Altura total)
Peso: Aprox. 29.0kg
Terminal: M8
Material del contenedor: ABS (UL94-HB), resistencia a la inflamabilidad de UL94-V1 disponible bajo pedido
', 50, '1050990',2,'1'),
('B123076791', 'Batería AGM 18Ah 12V Aokly','
La batería AGM 18Ah 12V de Aokly es una batería de alta calidad y rendimiento diseñada para una amplia gama de aplicaciones. Esta batería está construida con tecnología de vanguardia y materiales de alta calidad para garantizar una larga duración y una operación segura y confiable. La tecnología AGM (Absorbent Glass Mat) de esta batería ofrece una mayor resistencia a los ciclos de carga y descarga, así como una mayor capacidad de retener la carga. Esta batería es ideal para aplicaciones que requieren una fuente de energía confiable y duradera, como sistemas de seguridad, sistemas de energía solar, sistemas de respaldo de energía, vehículos eléctricos, caravanas, barcos y más.
','
Voltaje Nominal: 12V
Capacidad Nominal: 18Ah
Dimensiones: 181 mm x 77 mm x 167 mm (Largo x Ancho x Alto)
Peso: 4.8 kg
Terminal: F3
Material del Contenedor: ABS (UL94-HB), resistente a la inflamabilidad
Resistencia Interna: Aproximadamente 14mΩ (Completamente cargado)
Temperatura de Funcionamiento:
Descarga: -20°C a 55°C
Carga: 0°C a 40°C
Almacenamiento: -20°C a 55°C
Uso Cíclico: Corriente de carga de 5.1A, voltaje de carga de 14.4V a 14.7V.
Uso en Espera: Corriente de carga sin límite, voltaje de carga de 13.5V a 13.8V.
Autodescarga: Menos del 1% a 25°C.
Vida de Diseño: 3-5 años en carga flotante.
', 50, '1050990',2,'1');

-- Inversores Onda Pura ID_CATEGORIA 3
INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('I123056781', 'Inversor MULTIPLUS-II 12V 3000VA Victron Energy
','
El Inversor MULTIPLUS-II 12V 3000VA de Victron Energy es una potente solución para la gestión de energía en sistemas autónomos y renovables. Convierte la energía de la batería en electricidad de alta calidad, adecuada para una amplia variedad de dispositivos. Ofrece un rendimiento confiable, incorpora un cargador de batería adaptativo para maximizar la vida útil de las baterías y puede cambiar sin interrupciones entre la red eléctrica y las baterías para un suministro de energía ininterrumpido.','
Control de Potencia / Asistencia Eléctrica: Control y asistencia eléctrica.
Conmutador de Transferencia: Cambio entre fuentes de alimentación.
Entrada de CA: Rango de tensión y frecuencia de entrada.
Inversor: Potencia de salida y eficiencia.
Cargador: Corriente de carga y modos de carga.
Protección y Comunicación: Protección contra factores y opciones de comunicación.
Temperatura y Carcasa: Rango de temperatura y tipo de carcasa.
Dimensiones y Peso: Tamaño y peso del sistema.
Normas: Cumplimiento de estándares de seguridad y emisiones.
', 50, '1050990',3,'1'),
('I123056802', 'Inversor MULTIPLUS 12V 1600VA Victron Energy','
 El Inversor MULTIPLUS 12V 1600VA de Victron Energy es una solución de alta calidad y versátil para satisfacer las necesidades de energía de manera eficiente y confiable. Con una potencia de 1600VA, convierte la energía de 12 voltios en una corriente alterna estable, siendo ideal para aplicaciones en vehículos recreativos, embarcaciones, sistemas de energía solar y más. Además, ofrece funciones avanzadas de carga de batería y está diseñado para un funcionamiento sin problemas y una larga vida útil.
','


El MULTIPLUS-12-1600 es un inversor que proporciona 230V CA con 1600VA de potencia continua y 3000W de pico. Tiene una alta eficiencia (hasta un 93%) y un rango amplio de voltaje de entrada (9.5V a 17V CC). También incluye un cargador de batería, operación en un amplio rango de temperaturas (-40 a +65°C), y cumple con estándares de seguridad y emisiones. Es una solución versátil para sistemas de energía en diversas aplicaciones.
', 50, '1050990',3,'1'),
('I123177891', 'Inversor OFF GRID PHOENIX 12V 800VA Victron Energy
','
Descubre el potente Inversor OFF GRID PHOENIX 12V 800VA de Victron Energy, la solución perfecta para tu sistema de energía independiente. Con una capacidad de 800VA y diseñado para operar fuera de la red eléctrica convencional, este inversor te proporciona la libertad de generar y utilizar tu propia energía. Con la confiabilidad y calidad que caracteriza a Victron Energy, este inversor es la elección ideal para aplicaciones fuera de la red, como sistemas de energía solar, eólica o de respaldo.
','

Potencia Continua: 800 VA a 25°C.
Potencia Máxima: 1500 W.
Tensión/Frecuencia de Salida Ajustable: 230 VCA o 120 VCA, 50Hz o 60Hz.
Rango de Tensión de Entrada: 9,2 – 17 V.
Eficiencia Máxima: 90 %.
Temperatura de Trabajo: -40 a +65°C.
Protección: IP 21.
Peso: 5,5 kg.
Dimensiones: 105 x 230 x 325 mm.
Cumple con Estándares de Seguridad y EMC.
', 50, '1050990',3,'1');

-- Controladores MPPT ID_CATEGORIA 4
INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('C123056892', 'Controlador Solar SmartSolar MPPT 250V 100A – TR VE.Can','
El Controlador Solar SmartSolar MPPT 250V 100A de Victron Energy es una avanzada solución de gestión de energía solar que optimiza la eficiencia de sistemas fotovoltaicos. Con capacidad de hasta 100 amperios y 250 voltios, utiliza la tecnología MPPT para maximizar la energía solar. Su compatibilidad con la red VE.Can de Victron facilita la integración con otros dispositivos y permite el monitoreo centralizado del sistema solar para un seguimiento preciso del rendimiento y producción de energía.
','
Tensión de Batería: Se adapta automáticamente a 12V, 24V o 48V (requiere software para configurar en 36V).
Corriente de Carga: 100 A.
Potencia Fotovoltaica Nominal: Varía según la tensión (hasta 5800 W).
Seguridad: Protección contra polaridad inversa, cortocircuito y sobretemperatura.
Eficiencia Máxima: 99%.
Comunicación: Puede conectarse a través de VE.Direct o Bluetooth.
Relé Programable: Con capacidad para controlar cargas.
Funcionamiento en Paralelo: Hasta 10 unidades se pueden sincronizar.
', 50, '1050990',4,'1'),
('C123056912', 'Controlador Solar 30 Amperes PWM VS3024AU','

Controlador de Carga Solar VS3024AU PWM 30A para sistemas de energía solar de 12V/24V con pantalla LCD, puerto USB, modos de carga selectivos, estadísticas de energía, amplio rango de temperatura, componentes de alta calidad, certificaciones UL y VDE, compensación de temperatura de batería y protección electrónica.
','

Este dispositivo es versátil y eficiente, con las siguientes características clave:

Voltaje: Puede operar automáticamente a 12V o 24V.
Entrada de batería: Acepta voltajes de 9V a 32V.
Carga/Descarga: Hasta 30A a 55°C.
Paneles Solares: Admite hasta 50V de voltaje.
Compatibilidad de Batería: Se adapta a varios tipos de baterías.
Eficiencia: Bajo consumo de energía.
Compensación de Temperatura: Ajusta el voltaje según la temperatura ambiente.
Pantalla LCD: Muestra información importante.
Robusto: Funciona en una amplia gama de temperaturas.
Protección: Contra humedad y polvo (IP20).
USB: Incluye puerto USB para cargar dispositivos.
Compacto: Pequeño y fácil de montar.
Peso: Aproximadamente 0.55 kg.
', 50, '1050990',4,'1'),
('C123178902', 'Controlador Solar MPPT 80A 12-48V Tracer8415AN
','
El Controlador Solar MPPT 80A Tracer 8415 AN es una solución de vanguardia para maximizar la eficiencia de tu sistema de energía solar. Diseñado para trabajar con paneles solares de 12 a 48 voltios, este controlador utiliza la tecnología de seguimiento del punto de máxima potencia (MPPT) para optimizar la generación de energía solar.
','
Este dispositivo solar tiene una potencia máxima de 1000/2000/3000/4000 W, maneja voltajes de panel solar de hasta 150 V, es compatible con baterías de 12/24/36/48 V, tiene un amplio rango de voltaje de batería de 8 V a 68 V, y puede cargar baterías con una corriente de hasta 80 A. Tiene una alta eficiencia de conversión del 98.50%, es compacto (394x240x134 mm, 6.10 kg), compatible con varios tipos de baterías, tiene protección IP20, funciona en temperaturas de -30 ~ +60 °C, y puede operar en entornos con humedad del 5 al 95%. Además, dispone de puertos de comunicación RJ45, RS485 y WLAN, pantalla LCD, sensor de temperatura y utiliza enfriamiento natural.
', 50, '1050990',4,'1');

-- Accesorios id_categoria 5

INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('C123057993', 'Cable Solar 4mm por metros','
Cable Importado
IP67, IP68
Cumple todas las normas Chilenas
Interperie
El valor es por metro
Disponible en colores : Rojo y Negro
','
Diámetro: 4mm
Conductor: 99.7% de cobre estañado
Resistencia a la radiación ultravioleta (UV)
Aislamiento XLPE (XLPO) de doble pared
Rango de temperatura: -40 ℃ ~ 90 ℃
Colores disponibles: Negro / Rojo
Cumple con estándares de pruebas contra el fuego: DIN EN 50265-2-1 y UL 1571 (VW-1)
Curvatura permisible: 5xD

', 50, '1050990',5,'1'),
('C122306599', 'Cargador de batería Blue Smart IP65 12V 7A 230v','
El Cargador de batería Blue Smart IP65 12V 7A 230V CEE 7/16 retail de Victron Energy es una solución de carga de baterías de alta calidad diseñada para satisfacer las necesidades de una variedad de aplicaciones, desde vehículos automotores hasta sistemas de energía independientes y embarcaciones. Este cargador se destaca por su eficiencia y versatilidad, lo que lo convierte en una elección confiable para mantener sus baterías en óptimas condiciones.

','

Este dispositivo es eficiente (94%) y funciona con 230 VCA. Tiene bajo consumo en espera (0,5 W) y puede cargar desde 0 V. Ofrece varias opciones de carga, incluyendo corriente y modo de corriente baja, con compensación de temperatura. Puede funcionar como fuente de alimentación y tiene protecciones contra polaridad inversa, cortocircuito y sobrecalentamiento. Funciona en un rango amplio de temperaturas y condiciones de humedad. Utiliza un algoritmo de carga adaptable de 7 etapas y tiene conectividad Bluetooth para monitorización. Es resistente al polvo y salpicaduras (IP65) y cumple con normativas de seguridad y emisiones. Las dimensiones y el peso varían según el modelo.
', 50, '1050990',5,'1');

-- Herramientas id_categoria 6

INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('C123058004', 'Crimpiadora para Conectores MC4','
Nuevo tipo de prensa de alicates con mango de agarre posición perfecta, Peso ligero, diseño y estructura lógica y mango de forma perfectos, garantiza el efecto Crimping perfecto.

El diseño de bloqueo asegura un prensado perfecto y de calidad.

 Prensado desde 2.5 mm2 hasta 6,0 mm². aplicable para conexiones sin soldadura, y cumplir con los estandares electricos.
Portátil y fácil de operar.
Herramienta Profesional para el electricista

','
Identificador de producto del fabricante
BT0688
Peso del producto
522 g
Dimensiones del paquete
28,8 x 10,8 x 5 cm
Referencia del fabricante
BT0688
Incluye baterías
No
Necesita baterías
No
', 50, '1050990',6,'1'),
('S122317699', 'Spanner para Conectores MC4','
1 Par incluye 2 llaves MC4 para conectores MC4

Fabricado con plástico ABS de excelente calidad

','

Esta spanner para conectores MC4 ofrece un diseño especializado que se adapta perfectamente a estos conectores, facilitando así el trabajo eficiente y seguro. Está construida con materiales duraderos, como plástico reforzado o metal de alta calidad, para garantizar una larga vida útil. Su tamaño compacto la hace fácilmente transportable, lo que resulta conveniente para su uso en instalaciones solares en el campo. Además, algunas spanners MC4 cuentan con una punta que sirve tanto para apretar como para aflojar los conectores, proporcionando una herramienta de doble función que simplifica la instalación y el mantenimiento.
', 50, '1050990',6,'1'),
('M123867699', 'Monitor LCD Regulador de Carga SL series','
Presentamos el Monitor LCD Regulador de Carga SL series, una herramienta esencial para optimizar y controlar tu sistema de energía solar de manera eficiente. Diseñado para ofrecer comodidad y control total, este monitor es la pieza que faltaba para llevar tu sistema solar al siguiente nivel.

','
El algoritmo de carga PWM de 3 etapas se ha actualizado para incluir la carga de ecualización periódica, lo que evita la sulfatación de la batería y prolonga su vida útil. Además, la compensación de temperatura permite ajustar automáticamente los parámetros de carga. El producto ofrece diversos modos de carga y protección contra sobrecargas, sobredescargas y cortocircuitos. También es capaz de arrancar cargas de gran capacitancia sin problemas. Dispone de una pantalla LCD gráfica y una interfaz hombre-máquina para una operación intuitiva. Este producto está diseñado para funcionar en condiciones difíciles y cuenta con protección de iluminación TVS.

', 50, '1050990',6,'1'),('T123868799', 'Tenaza Cortadora de Cable Solar PV','
Pelacables Solar PV
Cables soportados: 2.5mm2, 4.0mm2, 6.0mm2 (14 AWG, 12 AWG, 10 AWG)
Peso: 0.5KG
','
Tenazas de alta precisión diseñadas con materiales de alta calidad, como acero al carbono o aleaciones resistentes a la corrosión. Su diseño ergonómico, mangos antideslizantes y mecanismo de palanca hacen que sean ideales para cortar cables solares de diferentes diámetros, garantizando una instalación solar de alta calidad y durabilidad, mientras reducen la fatiga del usuario
', 50, '1050990',6,'1'),
('S234868799', 'Sonda de temperatura Epsolar','
El sensor de temperatura remoto mejora la precisión de la medición de temperatura, para optimizar la carga de los bancos de baterías en sistemas fotovoltaicos o -grid. El sensor de temperatura es un accesorio opcional, se recomienda extender la vida útil y la eficiencia de la carga del banco de baterías. El sensor de temperatura remoto es compatible con los 
','
Las sondas de temperatura EPSolar son diseñadas para medir con precisión la temperatura en sistemas solares. Son compatibles con reguladores de carga solares de EPSolar y otros dispositivos de control del sistema, ofrecen cables de longitud adecuada para una fácil instalación, cuentan con protección contra la intemperie y tienen un rango de temperatura específico para garantizar mediciones precisas en diversas condiciones.
', 50, '1050990',6,'1');


-- Reguladores id_categoria 7

INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('R123058004', 'Regulador de Carga PWM 60A 24 V EPSolar','
 El controlador solar de la serie ViewStar es diseñado para el sistema solar fuera de la red, como como farola, sistema solar doméstico o pequeña central eléctrica, etc. Tiene LCD pantalla, carga de batería confiable, completa protección electrónica y programable parámetros.
','

Este producto es un controlador solar altamente eficiente con un diseño EMC excelente. Cuenta con un potente MCU de 32 bits y ofrece diversas opciones de batería. Proporciona control inteligente de iluminación solar, alta precisión en la medición y una interfaz amigable. Además, tiene funciones de estadísticas de energía, comunicación MODBUS y la capacidad de actualizar su firmware en campo.
', 50, '1050990',7,'1'),
('R303317699', 'Regulador de Carga- DriverMPPT 12/24 15A EPSolar','
La serie TRACER-EPLI combina energía solar controlador de carga y controlador LED en uno unidad. Es ideal para iluminación LED solar requiriendo función de atenuación. El control El parámetro puede ser programado por APLICACIÓN móvil y SPP-02 a través de infrarrojos (IR) comunicación.
','
Tipo de Regulador de Carga: MPPT (Seguimiento del Punto de Máxima Potencia).
Voltaje del Sistema: 12V/24V automático (Puede trabajar con sistemas de 12V o 24V).
Corriente de Carga Máxima: 15 Amperios (15A).
Tecnología MPPT Eficiente: Maximiza la eficiencia de conversión de energía solar.
Pantalla LCD: Proporciona información en tiempo real sobre el estado del sistema.
Protecciones Avanzadas: Incluye protección contra sobrecarga, protección contra cortocircuitos, protección contra polaridad inversa y protección contra sobrecalentamiento.
Algoritmo de Carga Inteligente: Optimiza la carga de las baterías para prolongar su vida útil.
Diseño Duradero: Construcción robusta y resistente para soportar condiciones climáticas adversas.
Fácil Instalación y Configuración: Adecuado tanto para usuarios principiantes como experimentados en energía solar.
', 50, '1050990',7,'1');

INSERT INTO imagenes (producto_id,url) VALUES
(1, 'panel-solar-1.jpeg'),
(1, 'panel-solar-2.jpeg'),
(1, 'panel-solar-3.jpeg'),
(2, 'hqst1.jpeg'),
(2, 'hqst2.jpeg'),
(2, 'hqst3.webp'),
(3, 'renogy1.jpeg'),
(3, 'renogy2.jpeg'),
(3, 'renogy3.jpeg'),
(4, 'netion1.jpeg'),
(4, 'netion2.jpeg'),
(4, 'netion3.jpeg'),
(5, 'Flexible1.webp'),
(5, 'Flexible2.jpeg'),
(5, 'Flexible3.webp'),
(6, 'netionpoli1.jpeg'),
(6, 'netionpoli2.jpeg'),
(6, 'netionpoli3.webp');

INSERT INTO imagenes (producto_id,url) VALUES
(7, 'bateriagel1.webp'),
(7, 'bateriagel2.webp'),
(7, 'bateriagel3.png'),
(8, 'bateriaaokly1.jpg'),
(8, 'bateriaaokly2.jpg'),
(8, 'bateriaaokly3.webp'),
(9, 'bateriaagm1.jpg'),
(9, 'bateriaagm2.jpg'),
(9, 'bateriaagm3.jpg'),
(10, 'inversor1.png'),
(10, 'inversor2.png'),
(10, 'inversor3.png'),
(11, 'multiplus1.jpg'),
(11, 'multiplus2.jpg'),
(11, 'multiplus3.jpg'),
(12, 'inversoroff1.jpg'),
(12, 'inversoroff2.jpg'),
(12, 'inversoroff3.png');

INSERT INTO imagenes (producto_id,url) VALUES
(13, 'controlador1.jpg'),
(13, 'controlador2.png'),
(13, 'controlador3.png'),
(14, 'controladorsolar1.webp'),
(14, 'controladorsolar2.jpg'),
(14, 'controladorsolar3.jpg'),
(15, 'controladormppt1.webp'),
(15, 'controladormppt2.webp'),
(15, 'controladormppt3.png'),
(16, 'cable1.webp'),
(16, 'cable2.jpg'),
(16, 'cable3.jpg'),
(17, 'cargador1.png'),
(17, 'cargador2.jpg'),
(17, 'cargador3.png'),
(18, 'Crimpiadora1.webp'),
(18, 'Crimpiadora2.webp'),
(18, 'Crimpiadora3.jpg');

INSERT INTO imagenes (producto_id,url) VALUES
(19, 'spanner1.webp'),
(19, 'spanner2.jpg'),
(19, 'spanner3.jpg'),
(20, 'monitolcd1.webp'),
(20, 'monitolcd2.webp'),
(20, 'monitolcd3.webp'),
(21, 'tenaza1.jpg'),
(21, 'tenaza2.jpg'),
(21, 'tenaza3.jpg'),
(22, 'sonda1.jpg'),
(22, 'sonda2.jpg'),
(22, 'sonda3.jpg'),
(23, 'reguladorcarga1.jpg'),
(23, 'reguladorcarga2.jpg'),
(23, 'reguladorcarga3.jpg'),
(24, 'reguladorPLW1.jpg'),
(24, 'reguladorPLW2.jpg'),
(24, 'reguladorPLW3.png');
