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
    cantidad INT(11) NOT NULL,
    precio FLOAT(12,2),
    estado_producto BOOLEAN NOT NULL
);
CREATE TABLE imagenes(
    id_imagenes INT(11) PRIMARY KEY AUTO_INCREMENT,
    producto_id INT(11)NOT NULL,
    url VARCHAR(50) NULL
);

ALTER TABLE imagenes ADD FOREIGN KEY(producto_id)
REFERENCES producto(id_producto);

INSERT INTO cliente ( nombre, apellido, direccion, telefono, email, contrasenia, estado) VALUES
('Usuario', 'Prueba','Torre Norte SENA', +573024650490, 'usuario@gmail.com', 'Usuario12345', 1);

INSERT INTO administrador (nombre, apellido, email, contrasenia) VALUES
('Ingrid', 'Sepulveda', 'administrador1@gmail.com', 'Administrador12345');

INSERT INTO producto (serial, producto, descripcion, cantidad, precio, estado_producto) VALUES
('A123456789', 'Panel Solar 545w 550w Monocristalino','INELDEC SAS
Panel Solar 545W marca Luxen o Longi Media celda $1.080.000 compra directa

Características Técnicas:
Tensión de circuito abierto: 49.65V
Corriente de Cortocircuito: 13.95 A
Dimensiones: 2256x1134 (Largo x Ancho)
Peso: 28 kg
Eficiencia: 21.3%
Con certificación RETIE.
Garantía: 12 Años
.', 50, '990900','1'),('A123456780', 'Hqst Panel Solar Monocristalino 100 W
','
Este panel solar está garantizado para proporcionar energía a todos tus dispositivos electrónicos favoritos. El vidrio templado y el marco de aluminio resistente a la corrosión permiten que cada panel resista fuertes cargas de viento Pa y nieve Pa, aumentando la durabilidad y el valor. Cada panel solar de 100 W es perfecto para una instalación permanente o semipermanente.
SKU: B092XDR3D5
COLOR: 100 W, paquete de 2
MARCA: HQST HIGH QUALITY SOLAR TECHNOLOGY
MODELO: HQST-100D-SSx2
PESO: 26.75 libras
', 50, '1050990','1'),('A123456790', 'Renogy Modulo De Panel Solar Monocristalino Fotovoltaico Pv
','
Renogy módulo de panel solar monocristalino fotovoltaico pv 3 piezas 100 w carga de batería de 12 v
17
* confiable el material de encapsulación avanzado con laminados de láminas de múltiples capas mejora el rendimiento de la celda y proporciona una larga vida útil
* durable tolerancia de salida positiva garantizada 03 soporta vientos fuertes 2400pa y cargas de nieve 5400pa
* versátil úselo para su rv cuando acampe o durante viajes en la playa con la familia de cualquier manera este panel monocristalino le brinda la mayor eficiencia por espacio
* instalación lista los orificios perforados en la parte posterior del panel permiten un montaje y aseguramiento rápidos orificios pretaladrados incluidos para puesta a tierra compatible con diferentes sistemas de montaje renogy como soportes en z soportes para postes y soportes para inclinación
* garantía garantía de potencia transferible de 25 años material de 5 años y garantía de mano de obra
43.87 largo - 21.5 ancho - 2.62 alto
caravan
single panel compact design
renogy
', 50, '715900','1'),('A123456800', 'Panel Solar Netion 260w Policristalino Fotovoltaico 30v
','
PANELES SOLARES MONOCRISTALINOS Y POLICRISTALINOS
Paneles Solares Policristalinos de 50W, 100W, 150W, 260W Y 325W
Paneles solares Monocristalinos de 100W, 150W, 220w, 260W, 320W, 360w, 400w, 450w, 550w
BENEFICIOS POLICRISTALINOS
Resistencia PID: Celdas de tecnología avanzada y materiales de alta calidad que generan alta resistencia PID.
• Alta Eficiencia: Módulo de conversión de alta eficiencia con tecnología innovadora.
• Alta resistencia temperaturas extremas: Certificado para soporta el peso del viento (hasta 2400 pascales), y el peso de la nieve (5400 pascales).
• Alto desempeño ante poca radiación: Avanzada superficie de vidrio y celdas solares que permiten un desempeño excelente en ambientes de baja radiación.
• Garantía de alta calidad: Control de calidad 100% antes y después de laminación y producción final.
• Máximo desempeño de energía: Con tecnología de igualación de impedancia, genera más potencia en cada módulo solar.

', 50, '631800','1'),('A123456801', 'Paneles Solares - Topsolar Flexible Solar Panel 100w 12v Mon
','
Paneles Solares - Topsolar Flexible Solar Panel 100W 12V Monocrystalline Bendable - 100 Watt 12Volt Semi-Flexible Mono Solar Panels Charger Off-Grid for RV Boat Cabin Van Car Uneven Surfaces
NOMBRE EN INGLES: Topsolar Flexible Solar Panel 100W 12V Monocrystalline Bendable - 100 Watt 12Volt Semi-Flexible Mono Solar Panels Charger Off-Grid for RV Boat Cabin Van Car Uneven Surfaces
Esto se ajusta a tu.
', 50, '900000','1'),('A123456812', 'Panel Energia Solar Netion Policristalino 150w / 18v','
Módulos solares Policristalinos de 150W

BENEFICIOS
Resistencia PID: Celdas de tecnología avanzada y materiales de alta calidad que generan alta resistencia PID.
Alta Eficiencia: Módulo de conversión de alta eficiencia con tecnología innovadora.
Alta resistencia temperaturas extremas: Certificado para soporta el peso del viento (hasta 2400 pascales), y el peso de la nieve (5400 pascales).
Alto desempeño ante poca radiación: Avanzada superficie de vidrio y celdas solares que permiten un desempeño excelente en ambientes de baja radiación.
Garantía de alta calidad: Control de calidad 100% antes y después de laminación y producción final.
Máximo desempeño de energía: Con tecnología de igualación de impedancia, genera más potencia en cada módulo solar.

CARACTERISTICAS:
- Tipo de Celda: Policristalina 156.75mmX156.75m
- Numero de Celdas: 36 (4x9)
- Eficiencia de las Celdas: 17.05%
- Dimensiones: 1485X668X35mm
- Peso: 11.0Kg.
', 50, '387900','1');

INSERT INTO imagenes (producto_id,url) VALUES
(1, 'panel-solar-1.webp'),
(2, 'panel-solar-2.webp'),
(3, 'panel-solar-3.webp'),
(4, 'panel-solar-4.webp'),
(5, 'panel-solar-5.webp'),
(6, 'panel-solar-6.webp');