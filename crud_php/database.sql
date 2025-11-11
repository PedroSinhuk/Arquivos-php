CREATE DATABASE IF NOT EXISTS crud_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE crud_db;

CREATE TABLE IF NOT EXISTS categorias (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS produtos (
  id INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10,2) NOT NULL,
  categoria_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO categorias (nome) VALUES
('Motorola'), ('Xiaomi'), ('Samsung'), ('Apple');

INSERT INTO produtos (nome, descricao, preco, categoria_id) VALUES
('Moto G Power', 'Smartphone Motorola com bateria de longa duração', 199.99, 1),
('Redmi Note 10', 'Smartphone Xiaomi com excelente câmera', 179.99, 2),
('Galaxy S21', 'Smartphone Samsung topo de linha', 799.99, 3),
('iPhone 13', 'Smartphone Apple com desempenho avançado', 999.99, 4);