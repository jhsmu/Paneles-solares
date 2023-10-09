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

ALTER TABLE producto ADD FOREIGN KEY(id_categoria)
REFERENCES categoria(id_categoria);

ALTER TABLE imagenes ADD FOREIGN KEY(producto_id)
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
El Inversor MULTIPLUS-II 12V 3000VA de Victron Energy es una poderosa y versátil solución para la gestión de energía en sistemas autónomos y aplicaciones de energía renovable. Este inversor de onda sinusoidal pura de 3000VA y 12V es capaz de convertir la energía de la batería en electricidad de alta calidad, adecuada para alimentar una amplia variedad de dispositivos y equipos.

Con su diseño avanzado y tecnología de vanguardia, el MULTIPLUS-II ofrece un rendimiento confiable y eficiente. Además de su función de inversor, también incorpora un cargador de batería con capacidad de carga adaptativa, lo que significa que puede recargar las baterías de manera óptima, maximizando su vida útil.

Una de las características destacadas de este inversor es su capacidad de funcionar en modo de transferencia sin interrupción, lo que significa que puede cambiar automáticamente entre la alimentación de la red eléctrica y la energía almacenada en las baterías, garantizando un suministro de energía constante y sin cortes.','

Control de Potencia / Asistencia Eléctrica: Permite el control de potencia y asistencia eléctrica en el sistema.
Conmutador de Transferencia: Con un conmutador de transferencia de 32 A para la conmutación entre fuentes de alimentación.
Entrada de CA: Rango de tensión de entrada de CA de 187-265 VCA y frecuencia de entrada de 45-65 Hz.
Inversor: Ofrece una potencia continua de salida de 3000 VA o 2400 W a 25°C, 2200 W a 40°C y 1700 W a 65°C, con un pico de potencia de 5500 W.
Eficiencia Máxima: Hasta un 93% de eficiencia y bajo consumo en modo de espera.
Cargador: Proporciona una máxima corriente de carga de la batería de 120 A con ajustes de tensión de carga de "absorción", "flotación" y "modo de almacenamiento".
Protección y Comunicación: Ofrece protección contra diversos factores y tiene puertos de comunicación VE.Bus y puertos de comunicación de uso general, así como la opción de un sensor de CA externo.
Temperatura y Carcasa: Funciona en temperaturas de 40 a +65°C y tiene una carcasa de acero con grado de protección IP22.
Dimensiones y Peso: Con dimensiones de 546 x 275 x 147 mm y un peso de 19 kg.
Normas: Cumple con estándares de seguridad y emisiones/inmunidad, como EN-IEC 60335-1, EN-IEC 60335-2-29, EN-IEC 62109-1, EN-IEC 62109-2, EN 55014-1, EN 55014-2, EN-IEC 61000-3-2, EN-IEC 61000-3-3, IEC 61000-6-1, IEC 61000-6-2 y IEC 61000-6-3.
', 50, '1050990',3,'1'),
('I123056802', 'Inversor MULTIPLUS 12V 1600VA Victron Energy','
 El Inversor MULTIPLUS 12V 1600VA de Victron Energy es una solución de alta calidad diseñada para satisfacer las necesidades de energía de forma eficiente y confiable. Este inversor es una pieza clave en sistemas de energía autónomos y se destaca por su versatilidad y rendimiento excepcionales. Con una potencia de 1600VA, puede convertir la energía de 12 voltios en una fuente de corriente alterna estable, lo que lo hace ideal para aplicaciones en vehículos recreativos, embarcaciones, sistemas de energía solar y más.

El Inversor MULTIPLUS de Victron Energy no solo convierte la energía de manera eficiente, sino que también cuenta con funciones avanzadas de carga de batería, lo que lo convierte en una solución integral para la gestión de energía. Su diseño robusto y su tecnología de vanguardia garantizan un funcionamiento sin problemas y una larga vida útil.
','

El modelo MULTIPLUS-12-1600 es un inversor con control de potencia y asistencia eléctrica. Tiene un conmutador de transferencia de 16 amperios y un rango de tensión de entrada de 9.5V a 17V CC. Su salida proporciona 230V CA a una frecuencia de 50Hz, con una potencia continua de 1600VA (1300W a 25°C, 1200W a 40°C y 800W a 65°C) y una capacidad de pico de 3000W. Ofrece una eficiencia máxima del 93% y tiene un bajo consumo en vacío.

El cargador de entrada CA admite un rango de tensión de 187-265V CA con una frecuencia de entrada de 45-65Hz y una corriente de carga de batería auxiliar de 70A. También incluye un sensor de temperatura de la batería.

En cuanto a características generales, cuenta con una salida auxiliar de 50A, protección, puertos de comunicación VE.Bus y de uso general, capacidad de encendido/apagado remoto, y opera en un rango de temperatura de -40 a +65°C. La carcasa está hecha de aluminio con categoría de protección IP21 y tiene conexiones para batería y CA.

Este producto cumple con varios estándares de seguridad y emisiones. Es una solución versátil y robusta para sistemas de energía en diversas aplicaciones.
', 50, '1050990',3,'1'),
('I123177891', 'Inversor OFF GRID PHOENIX 12V 800VA Victron Energy
','
Descubre el potente Inversor OFF GRID PHOENIX 12V 800VA de Victron Energy, la solución perfecta para tu sistema de energía independiente. Con una capacidad de 800VA y diseñado para operar fuera de la red eléctrica convencional, este inversor te proporciona la libertad de generar y utilizar tu propia energía. Con la confiabilidad y calidad que caracteriza a Victron Energy, este inversor es la elección ideal para aplicaciones fuera de la red, como sistemas de energía solar, eólica o de respaldo.
','

Potencia Continua: 800 VA (vatios aparentes) a 25°C.
Potencia Continua a 25°C/40°C: 650/560 W (vatios) respectivamente.
Pico de Potencia: 1500 W (vatios) para manejar cargas de arranque.
Tensión/Frecuencia de Salida Ajustable: 230 VCA o 120 VCA +/- 3 %, 50Hz o 60Hz +/- 0,1 %.
Rango de Tensión de Entrada: 9,2 – 17 V.
Desconexión por CC Baja Ajustable: 9,3 V.
Reinicio y Alarma por CC Baja Ajustable: 10,9 V.
Detector de Batería Cargada Ajustable: 14,0 V.
Eficacia Máxima: 90 %.
Consumo en Vacío: 6,5 W en condiciones normales, 1 W en modo ECO (ajustable).
Rango de Temperatura de Trabajo: -40 a +65°C (requiere refrigeración por ventilador, con reducción de potencia a temperaturas elevadas).
Humedad Máxima: 95 % (sin condensación).
Carcasa: Chasis de acero y carcasa de plástico (azul RAL 5012).
Conexión de la Batería: Bornes de tornillo.
Tomas de Corriente CA Estándar: Schuko (CEE 7/4), IEC-320 (enchufe macho incluido) para 230 V; Nema 5-15R, GFCI para 120 V.
Tipo de Protección: IP 21.
Peso: 5,5 kg.
Dimensiones (al x an x p en mm): 105 x 230 x 325.
Caja: IP20.
Accesorios: Incluye On/Off remoto y es compatible con el conmutador de transferencia automático Filax.
Estándares de Seguridad: Cumple con EN-IEC 60335-1, EN-IEC 62109-1 y UL 458.
Estándares de EMC: Cumple con EN 55014-1, EN 55014-2, IEC 61000-6-1, IEC 61000-6-2, IEC 61000-6-3.
Directiva de Automoción: Cumple con ECE R10-4.
', 50, '1050990',3,'1');

-- Controladores MPPT ID_CATEGORIA 4
INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('C123056892', 'Controlador Solar SmartSolar MPPT 250V 100A – TR VE.Can','
El Controlador Solar SmartSolar MPPT 250V 100A – TR VE.Can de Victron Energy es una avanzada solución de gestión de energía solar diseñada para optimizar la eficiencia de tu sistema fotovoltaico. Con una capacidad de hasta 100 amperios y una tensión máxima de 250 voltios, este controlador inteligente utiliza la tecnología Maximum Power Point Tracking (MPPT) para rastrear y extraer la máxima cantidad de energía solar disponible de tus paneles solares.

Una de las características destacadas de este controlador es su compatibilidad con la red VE.Can de Victron Energy, lo que permite una integración perfecta con otros dispositivos y sistemas de la marca. Esto facilita la supervisión y el control centralizados de tu sistema solar, lo que te permite mantener un seguimiento preciso del rendimiento y la producción de energía.
','


Tensión de la batería: Ajuste automático a 12, 24 o 48 V (Requiere una herramienta de software para ajustar el sistema en 36 V).

Corriente de carga nominal: 100 A.

Potencia FV nominal:

12 V: 1450 W.
24 V: 2900 W.
36 V: 4350 W.
48 V: 5800 W.
Máx. corriente de cortocircuito FV: 70 A (máx. 30 A por conector MC4).

Tensión máxima del circuito abierto FV: 250 V máximo absoluto en las condiciones más frías (245 V en arranque y funcionamiento máximo).

Eficiencia máxima: 99 %.

Autoconsumo: Menos de 35 mA a 12 V / 20 mA a 48 V.

Tensión de carga de “absorción”: Valores predeterminados ajustables.

Tensión de carga de “flotación”: Valores predeterminados ajustables.

Algoritmo de carga: Variable multietapas (ocho algoritmos preprogramados) o algoritmo definido por el usuario.

Compensación de temperatura: -16 mV / -32 mV / -64 mV por grado Celsius.

Protección: Polaridad inversa, cortocircuito de salida, sobretemperatura.

Puerto de comunicación de datos: VE.Direct o Bluetooth.

Interruptor on/off remoto: Sí.

Relé programable: DPST (Capacidad nominal CA 240 VAC / 4 A, Capacidad nominal CC 4 A hasta 35 VCC, 1 A hasta 60 VCC).

Funcionamiento en paralelo: Sí, hasta 10 unidades se pueden sincronizar con Bluetooth.
', 50, '1050990',4,'1'),
('C123056912', 'Controlador Solar 30 Amperes PWM VS3024AU','
 Controlador de carga solar 30A VS3024AU PWM de trabajo automático de 12V / 24V con pantalla LCD incorporada y puerto USB.
Carga PWM
Tipo de batería seleccionable: Sellado, Gel e Inundado
Pantalla LCD informativa con luz negra
Diseño USB doble, Máx. salida 2.4A
Múltiples modos de control de carga
Función de estadísticas de energía
Potencia total trabajando en un rango de temperatura de -25 a 55
Adopta componentes de alta calidad y alta confiabilidad de ST, IR e Infineon
Certificados UL y VDE terminales de cobre niquelado, para asegura una conexión segura y sólida
Función de compensación de temperatura de la batería
Protección electrónica extensa
','

Tensión nominal del sistema: Puede operar en sistemas de 12V o 24V de manera automática.

Rango de voltaje de entrada de la batería: Acepta voltajes de entrada de la batería en un rango de 9V a 32V.

Corriente nominal de carga / descarga: Tiene una capacidad de carga / descarga máxima de 30A a una temperatura de 55 °C.

Max. Voltaje de circuito abierto fotovoltaico: Puede manejar un máximo de 50V de voltaje de circuito abierto de paneles solares fotovoltaicos.

Tipo de Batería: Es compatible con varios tipos de baterías, incluyendo selladas, gel, inundadas y permite configuración personalizada por el usuario.

Voltajes de carga: Ofrece diferentes voltajes de carga para diferentes tipos de baterías, como voltaje de carga igualar, aumentar y flotante.

Protección de bajo voltaje: Cuenta con funciones de reconexión y desconexión de bajo voltaje para proteger las baterías.

Eficiencia energética: Tiene un bajo autoconsumo de energía, con menos de 10mA a 12V o menos de 18mA a 24V.

Compensación de temperatura: Ajusta el voltaje en función de la temperatura ambiente con un coeficiente de compensación de temperatura de -3mV/°C/2V.

Pantalla LCD: Tiene una pantalla que opera en un rango de temperatura de -20 °C a +70 °C para mostrar información clave del sistema.

Diseño robusto: Puede funcionar en un rango de temperatura ambiente de -25 °C a +55 °C a carga completa de manera continua.

Protección contra humedad y polvo: Cuenta con un grado de protección IP20 y es adecuado para entornos con humedad ≤95%, sin condensación.

Entrada USB: Dispone de una entrada USB de 5VDC / 2.4A para cargar dispositivos.

Dimensiones compactas: Tiene dimensiones totales de 181×100.9×59.8mm, con un tamaño de montaje de 172x80mm.

Terminales: Los terminales son de 16mm2 para facilitar la conexión.

Peso neto: Pesa aproximadamente 0.55 kg.
', 50, '1050990',4,'1'),
('C123178902', 'Controlador Solar MPPT 80A 12-48V Tracer8415AN
','
El Controlador Solar MPPT 80A Tracer 8415 AN es una solución de vanguardia para maximizar la eficiencia de tu sistema de energía solar. Diseñado para trabajar con paneles solares de 12 a 48 voltios, este controlador utiliza la tecnología de seguimiento del punto de máxima potencia (MPPT) para optimizar la generación de energía solar.
','
Potencia Solar: Admite una potencia solar máxima de 1000/2000/3000/4000 W.
Voltaje del Panel Solar: Puede manejar un voltaje de circuito abierto del panel solar de hasta 150 V.
Voltaje Nominal de la Batería: Es compatible con sistemas de baterías de 12/24/36/48 V.
Rango de Voltaje de la Batería: Opera en un amplio rango de voltaje de batería, desde 8 V hasta 68 V.
Corriente Máxima de Carga de la Batería: Tiene una capacidad de carga de batería de hasta 80 A.
Eficiencia Máxima de Conversión: Ofrece una alta eficiencia de conversión del 98.50%.
Dimensiones y Peso: Sus dimensiones son 394x240x134 mm, con un peso de 6.10 kg.
Terminales: Utiliza terminales de cable de 35.0 mm².
Algoritmo de Carga: Emplea un algoritmo de carga de 3 etapas (Bulk, Float, Ecualización).
Voltaje de Carga: El voltaje de carga se ajusta automáticamente a 14.6/14.8 V (Igualar), 14.4/14.2 V (Aumentar), y 13.8 V (Flotador).
Tipo de Batería: Es compatible con varios tipos de baterías, incluyendo GEL, AGM, VLA y plomo carbono.
Compensación de Temperatura: Posee un coeficiente de compensación de temperatura de -3mV/°C @ 2V.
Clase de Protección: Tiene una clasificación de protección IP20.
Rango de Temperatura: Funciona en temperaturas de -30 ~ +60 °C y se puede almacenar en temperaturas de -30 ~ +85 °C.
Humedad: Puede operar en entornos con una humedad del 5 al 95%.
Puertos de Comunicación: Dispone de puertos de comunicación RJ45, RS485 y WLAN.
Monitor: Cuenta con una pantalla LCD para la visualización de datos.
Sensor de Temperatura: Incluye un sensor de temperatura.
Modo de Enfriamiento: El enfriamiento es natural, sin requerir sistemas adicionales.
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

Eficiencia: Tiene una eficiencia del 94%, lo que garantiza un uso eficiente de la energía.
Tensión de Entrada: Funciona con una tensión de entrada de 230 VCA.
Consumo en Espera: Su consumo en espera es bajo, de tan solo 0,5 W.
Tensión de Batería Mínima: Puede comenzar a cargar incluso cuando la tensión de la batería es de 0 V.
Tensión de Carga: Ofrece múltiples niveles de tensión de carga de absorción, flotación y almacenamiento, dependiendo de la aplicación.
Corriente de Carga: Proporciona opciones de corriente de carga que varían de 4 a 25 A.
Modo de Corriente Baja: Tiene un modo de corriente baja que varía de 2 a 10 A.
Compensación de Temperatura: Ofrece una compensación de temperatura (para baterías de plomo-ácido) de 16 mV/ºC.
Modo Fuente de Alimentación: Puede funcionar como una fuente de alimentación.
Protecciones: Ofrece protección contra polaridad inversa, cortocircuito de salida y sobretemperatura.
Rango de Temperatura: Funciona en un amplio rango de temperatura, desde -40 °C hasta +60 °C.
Humedad: Soporta hasta un 95% de humedad sin condensación.
Algoritmo de Carga: Utiliza un algoritmo de carga adaptable de 7 etapas.
Bluetooth: Incorpora Bluetooth para facilitar la monitorización.
Carcasa: Tiene una carcasa resistente con clasificación IP65 (a prueba de polvo y salpicaduras).
Conexiones: Viene con cables rojo y negro de 1,5 metros para la batería y un cable de 1,5 metros con enchufe CE 7/16 para la conexión a la red eléctrica.
Peso: El peso varía según el modelo, desde 0,9 kg hasta 1,9 kg.
Dimensiones: Las dimensiones varían según el modelo, con medidas de 45 x 81 x 182 mm para algunos modelos.
Normativas: Cumple con varias normativas de seguridad y emisiones, como EN 60335-1, EN 60335-2-29, EN 55014-1, EN 61000-6-3, EN 61000-3-2, EN 55014-2, EN 61000-6-1, EN 61000-6-2 y EN 61000-3-3.
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

Diseño especializado: La spanner para conectores MC4 está diseñada con una forma específica que se adapta perfectamente a los conectores MC4. Esto facilita el trabajo con estos conectores de forma eficiente y segura.

Material duradero: Suelen estar fabricadas con materiales resistentes y duraderos, como plástico reforzado o metal de alta calidad, para garantizar una larga vida útil.

Tamaño compacto: La spanner es lo suficientemente pequeña como para caber en la mano y ser fácilmente transportable, lo que la hace conveniente para llevarla a instalaciones solares en el campo.

Herramienta de doble función: Algunas spanners para conectores MC4 tienen una punta que puede usarse tanto para apretar como para aflojar los conectores MC4. Esto simplifica aún más la instalación y el mantenimiento.
', 50, '1050990',6,'1'),
('M123867699', 'Monitor LCD Regulador de Carga SL series','
Presentamos el Monitor LCD Regulador de Carga SL series, una herramienta esencial para optimizar y controlar tu sistema de energía solar de manera eficiente. Diseñado para ofrecer comodidad y control total, este monitor es la pieza que faltaba para llevar tu sistema solar al siguiente nivel.

','
• Se adopta un algoritmo de carga PWM de 3 etapas actualizado. La aplicación de una carga de ecualización a la batería periódicamente o cuando se
La descarga en exceso, puede prevenir eficazmente que la batería no se ecualice y se sulfure, extendiendo así la vida útil de la batería.
• Con la compensación de temperatura empleada, los parámetros de carga se pueden ajustar automáticamente.
• Una amplia gama de modos de trabajo de carga facilitan la aplicación del producto a diferentes tipos de carga.
• El producto proporciona protección contra sobrecargas, sobredescargas y sobrecargas, así como protección contra cortocircuitos.
•En virtud de un método de arranque de carga avanzado, las cargas de gran capacitancia se pueden iniciar sin problemas.
• El producto proporciona una pantalla LCD gráfica de matriz de puntos y una interfaz hombre-máquina con una tecla.
• El diseño fácil de usar del navegador y las interfaces dinámicas aseguran operaciones convenientes e intuitivas.
• Con un diseño de grado industrial, el producto puede funcionar bien en diversas condiciones difíciles.
• Se adopta la protección de iluminación TVS.

', 50, '1050990',6,'1'),('T123868799', 'Tenaza Cortadora de Cable Solar PV','
Pelacables Solar PV
Cables soportados: 2.5mm2, 4.0mm2, 6.0mm2 (14 AWG, 12 AWG, 10 AWG)
Peso: 0.5KG
','
Corte de Alta Precisión: Estas tenazas están diseñadas para proporcionar cortes precisos y limpios en cables solares de diferentes diámetros, lo que asegura una instalación solar de alta calidad.

Materiales de Alta Calidad: Suelen estar fabricadas con materiales de alta calidad, como acero al carbono o aleaciones resistentes a la corrosión, para garantizar su durabilidad y resistencia a la intemperie.

Diseño Ergonómico: Tienen un diseño ergonómico que facilita su manejo y reduce la fatiga del usuario durante el uso prolongado.

Mangos Antideslizantes: Los mangos suelen contar con revestimientos antideslizantes que mejoran la sujeción y la seguridad durante el corte.

Cortadores de Alta Palanca: Algunas tenazas tienen un mecanismo de palanca que permite realizar cortes con menos esfuerzo, lo que facilita el trabajo en aplicaciones solares de gran envergadura.
', 50, '1050990',6,'1'),
('S234868799', 'Sonda de temperatura Epsolar','
El sensor de temperatura remoto mejora la precisión de la medición de temperatura, para optimizar la carga de los bancos de baterías en sistemas fotovoltaicos o -grid. El sensor de temperatura es un accesorio opcional, se recomienda extender la vida útil y la eficiencia de la carga del banco de baterías. El sensor de temperatura remoto es compatible con los 
','
Medición de Temperatura Precisa: Las sondas de temperatura EPSolar están diseñadas para proporcionar mediciones precisas de la temperatura del sistema solar. Esto es importante porque la temperatura puede afectar significativamente la eficiencia y el rendimiento de los paneles solares y las baterías.

Compatibilidad: Están diseñadas para ser compatibles con los reguladores de carga solares de EPSolar u otros dispositivos de control del sistema. Deben conectarse fácilmente a estos dispositivos para proporcionar datos de temperatura en tiempo real.

Cableado Adecuado: Suelen incluir cables de longitud adecuada para permitir una fácil instalación y conexión al controlador de carga o al sistema de monitoreo.

Protección contra la Intemperie: En algunos casos, las sondas de temperatura pueden tener una carcasa resistente a la intemperie para proteger el sensor de los elementos y garantizar una medición precisa en diferentes condiciones climáticas.

Rango de Temperatura: Pueden tener un rango de temperatura específico en el que son efectivas. Asegúrate de que el rango de temperatura de la sonda sea compatible con las condiciones en las que se instalará.
', 50, '1050990',6,'1');


-- Reguladores id_categoria 7

INSERT INTO producto (serial, producto, descripcion, caracteristicas, cantidad, precio, id_categoria, estado_producto) VALUES
('R123058004', 'Regulador de Carga PWM 60A 24 V EPSolar','
 El controlador solar de la serie ViewStar es diseñado para el sistema solar fuera de la red, como como farola, sistema solar doméstico o pequeña central eléctrica, etc. Tiene LCD pantalla, carga de batería confiable, completa protección electrónica y programable parámetros.
','
● Excelente diseño EMC
● MCU de 32 bits con alta velocidad
● Carga PWM de la serie de alta eficiencia
● Cuatro opciones de tipo de batería: sellada, gel, inundada y USUARIO
● Control inteligente de iluminación y temporizador para sistema de iluminación solar
● Muestreo de alta precisión A / D de 12 bits para garantizar la precisión
● Utilice MOSFET como interruptor electrónico
● Configuración y modificación de parámetros de control total, modo de control de carga diversificado
● Diseño humanizado de la interfaz del navegador, realice todas las operaciones cómodamente
● Compensación de temperatura
● Adopte la pantalla LCD gráfica de matriz de puntos y HMI (interfaz hombre-máquina) con 4 botones,
visualización y funcionamiento del menú integrado
● Función de estadísticas de energía
● Puertos RS485 con protocolo de comunicación MODBUS
● Software de monitoreo de PC opcional y medidor remoto para monitoreo en tiempo real y batería.
ajuste de parámetros de gestión
● Firmware actualizable en campo
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
(1, 'panel-solar-1.webp'),
(2, 'panel-solar-2.webp'),
(3, 'panel-solar-3.webp'),
(4, 'panel-solar-4.webp'),
(5, 'panel-solar-5.webp'),
(6, 'panel-solar-6.webp');

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
