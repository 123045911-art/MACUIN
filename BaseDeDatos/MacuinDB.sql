CREATE DATABASE IF NOT EXISTS macuin_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE macuin_db;

-- Catálogo de Roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    empresa VARCHAR(100),
    rol_id INT NOT NULL,
    CONSTRAINT fk_usuarios_roles FOREIGN KEY (rol_id) REFERENCES roles(id)
);

-- Catálogo de Autopartes
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE autopartes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    imagen_url VARCHAR(255),
    categoria_id INT NOT NULL,
    stock_actual INT DEFAULT 0,
    CONSTRAINT fk_autopartes_categorias FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Pedidos
CREATE TABLE estados_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    estado_id INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) DEFAULT 0.00,
    CONSTRAINT fk_pedidos_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT fk_pedidos_estados FOREIGN KEY (estado_id) REFERENCES estados_pedido(id)
);

-- Datos maestros iniciales
INSERT INTO roles (nombre) VALUES ('ADMIN'), ('CLIENTE'), ('ALMACEN');
INSERT INTO estados_pedido (nombre) VALUES ('PAGADO'), ('EN PROCESO'), ('ENVIADO'), ('ENTREGADO');