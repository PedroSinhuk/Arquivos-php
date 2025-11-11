CREATE DATABASE IF NOT EXISTS crud_db
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE crud_db;

-- Criação da tabela de categorias
CREATE TABLE IF NOT EXISTS categorias (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Criação da tabela de produtos
CREATE TABLE IF NOT EXISTS produtos (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  descricao TEXT,
  preco DECIMAL(10,2) NOT NULL,
  categoria_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserção de categorias apenas se não existirem
INSERT IGNORE INTO categorias (nome) VALUES
  ('Motorola'),
  ('Xiaomi'),
  ('Samsung'),
  ('Apple');

-- Inserção de produtos com categoria dinâmica
INSERT INTO produtos (nome, descricao, preco, categoria_id)
SELECT 'Moto G Power', 'Smartphone Motorola com bateria de longa duração', 199.99, id
FROM categorias WHERE nome = 'Motorola';

INSERT INTO produtos (nome, descricao, preco, categoria_id)
SELECT 'Redmi Note 10', 'Smartphone Xiaomi com excelente câmera', 759.99, id
FROM categorias WHERE nome = 'Xiaomi';

INSERT INTO produtos (nome, descricao, preco, categoria_id)
SELECT 'Galaxy S21', 'Smartphone Samsung topo de linha', 799.99, id
FROM categorias WHERE nome = 'Samsung';

INSERT INTO produtos (nome, descricao, preco, categoria_id)
SELECT 'iPhone 13', 'Smartphone Apple com desempenho avançado', 999.99, id
FROM categorias WHERE nome = 'Apple';
