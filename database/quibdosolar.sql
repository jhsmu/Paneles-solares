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

INSERT INTO producto (serial, producto, descripcion_breve, descripcion, cantidad, precio, id_categoria, id_marca, estado_producto) VALUES
('A123456789', 'Monitor LG de 27 pulgadas', 'Monitor con tecnología LG para un alto rendimiento y mejor calidad visual y auditiva.', 'Pantalla led de 27\".\r\nTiene una resolución de 1920px-1080px.\r\nRelación de aspecto de 16:9.\r\nPanel IPS.\r\nSu brillo es de 250cd/m².\r\nTipos de conexión: 2 HDMI 1.4, DisplayPort 1.2, VGA, Jack 3.5 mm.\r\nEs giratorio y reclinable.\r\nComodidad visual en todo momento.', 50, '1455000', 1, 1, '1'),