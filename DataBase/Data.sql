CREATE DATABASE Desafio_1;

USE Desafio_1;

CREATE TABLE Tipo_Usuario
(
	id INT PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	descripcion varchar(255),
);

CREATE TABLE Usuarios
(
	id BIGINT PRIMARY KEY, 
	nombre VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	correo VARCHAR(100) NOT NULL,
	cel VARCHAR(8) NOT NULL,
	password VARCHAR(40),
	tipo_usuario INT FOREIGN KEY REFERENCES Tipo_Usuario(id)
);

CREATE TABLE Categorias
(
	id INT PRIMARY KEY,
	nombre VARCHAR(40) NOT NULL,
	descripcion VARCHAR(255)
);

CREATE TABLE Productos
(
	id BIGINT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	descripcion TEXT,
	img TEXT,
	precio MONEY NOT NULL,
	cantidad INT NOT NULL,
	id_categoria INT FOREIGN KEY REFERENCES Categorias(id)
);

CREATE TABLE Rubros
(
	id INT PRIMARY KEY,
	nombre VARCHAR(40) NOT NULL,
	descripcion VARCHAR(255),
);

CREATE TABLE Sub_Rubros
(
	id INT PRIMARY KEY,
	nombre VARCHAR(40) NOT NULL,
	descripcion VARCHAR(255),
	id_rubro INT FOREIGN KEY REFERENCES Rubros(id),
	id_categoria INT FOREIGN KEY REFERENCES Categorias(id)
);

CREATE TABLE Proveedores
(
	id INT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	tel VARCHAR(8),
);

CREATE TABLE Compras
(
	id BIGINT PRIMARY KEY,
	numero_factura VARCHAR(10) NOT NULL,
	cantidad INT NOT NULL,
	costo MONEY NOT NULL,
	total MONEY NOT NULL,
	fecha DATETIME NOT NULL,
	id_producto BIGINT FOREIGN KEY REFERENCES Productos(id),
	id_proveedor INT FOREIGN KEY REFERENCES Proveedores(id),
	id_usuario BIGINT FOREIGN KEY REFERENCES Usuarios(id)
);

CREATE TABLE Ventas
(
	id BIGINT PRIMARY KEY,
	numero_factura VARCHAR(10) NOT NULL,
	cantidad INT NOT NULL, 
	precio MONEY NOT NULL,
	total MONEY NOT NULL, 
	fecha DATETIME,
	id_usuario BIGINT FOREIGN KEY REFERENCES Usuarios(id),
	id_producto BIGINT FOREIGN KEY REFERENCES Productos(id)
);
