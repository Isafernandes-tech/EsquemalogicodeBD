-- =========================================================
-- BANCO DE DADOS: Oficina Mecânica
-- =========================================================

-- Criação do Banco e Seleção
CREATE DATABASE Oficina_Mecanica;
USE Oficina_Mecanica;

-- =========================================================
-- Criação das Tabelas
-- =========================================================

-- Tabela: Cliente
CREATE TABLE Cliente (
 id_cliente INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100),
 telefone VARCHAR(15),
 email VARCHAR(100)
);

-- Tabela: Veiculo
CREATE TABLE Veiculo (
 id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
 modelo VARCHAR(50),
 ano INT,
 placa VARCHAR(10),
 id_cliente INT,
 FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela: Mecanico
CREATE TABLE Mecanico (
 id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
 nome VARCHAR(100),
 especialidade VARCHAR(50)
);

-- Tabela: Equipe
CREATE TABLE Equipe (
 id_equipe INT PRIMARY KEY AUTO_INCREMENT,
 nome_equipe VARCHAR(50)
);

-- Tabela: Equipe_Mecanico
CREATE TABLE Equipe_Mecanico (
 id_equipe INT,
 id_mecanico INT,
 PRIMARY KEY (id_equipe, id_mecanico),
 FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe),
 FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);

-- Tabela: Peca
CREATE TABLE Peca (
 id_peca INT PRIMARY KEY AUTO_INCREMENT,
 nome_peca VARCHAR(100),
 valor_peca DECIMAL(10,2)
);

-- Tabela: Ordem_Servico
CREATE TABLE Ordem_Servico (
 id_os INT PRIMARY KEY AUTO_INCREMENT,
 id_veiculo INT,
 id_equipe INT,
 status VARCHAR(20),
 valor_total DECIMAL(10,2),
 FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
 FOREIGN KEY (id_equipe) REFERENCES Equipe(id_equipe)
);

-- Tabela: OS_Peca
CREATE TABLE OS_Peca (
 id_os INT,
 id_peca INT,
 quantidade INT,
 PRIMARY KEY (id_os, id_peca),
 FOREIGN KEY (id_os) REFERENCES Ordem_Servico(id_os),
 FOREIGN KEY (id_peca) REFERENCES Peca(id_peca)
);

-- =========================================================
-- Inserção de Dados
-- =========================================================

-- Tabela Cliente
INSERT INTO Cliente (nome, telefone, email) VALUES
('João Silva', '71988887777', 'joao.silva@email.com'),
('Maria Souza', '71999996666', 'maria.souza@email.com'),
('Carlos Pereira', '71997775555', 'carlos.pereira@email.com');

-- Tabela Veiculo
INSERT INTO Veiculo (modelo, ano, placa, id_cliente) VALUES
('Civic', 2018, 'ABC1234', 1),
('Onix', 2020, 'XYZ5678', 2),
('Hilux', 2015, 'JKL9101', 3);

-- Tabela Mecanico
INSERT INTO Mecanico (nome, especialidade) VALUES
('Paulo Santos', 'Motor'),
('Ana Lima', 'Suspensão'),
('Roberto Alves', 'Elétrica');

-- Tabela Equipe
INSERT INTO Equipe (nome_equipe) VALUES
('Equipe Alfa'),
('Equipe Beta');

-- Tabela Equipe_Mecanico
INSERT INTO Equipe_Mecanico (id_equipe, id_mecanico) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Tabela Peca
INSERT INTO Peca (nome_peca, valor_peca) VALUES
('Filtro de Óleo', 35.00),
('Pastilha de Freio', 150.00),
('Correia Dentada', 120.00);

-- Tabela Ordem_Servico
INSERT INTO Ordem_Servico (id_veiculo, id_equipe, status, valor_total) VALUES
(1, 1, 'Concluído', 850.00),
(2, 1, 'Em Andamento', 600.00),
(3, 2, 'Concluído', 1100.00);

-- Tabela OS_Peca
INSERT INTO OS_Peca (id_os, id_peca, quantidade) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 1, 1),
(3, 2, 2);

-- =========================================================
-- Consultas SQL
-- =========================================================

-- 1. Recuperação simples (SELECT)
SELECT * FROM Cliente;

-- 2. Filtros com WHERE
SELECT * FROM Veiculo WHERE ano > 2016;

-- 3. Expressões com atributos derivados (contagem)
SELECT id_equipe, COUNT(id_mecanico) AS total_mecanicos
FROM Equipe_Mecanico
GROUP BY id_equipe;

-- 4. Ordenação dos dados
SELECT nome, especialidade FROM Mecanico ORDER BY nome ASC;

-- 5. Condições de filtros após agrupamento (HAVING)
SELECT id_equipe, COUNT(id_mecanico) AS total_mecanicos
FROM Equipe_Mecanico
GROUP BY id_equipe
HAVING COUNT(id_mecanico) > 1;

-- 6. Junções entre tabelas
SELECT os.id_os, c.nome AS cliente, v.modelo, os.status, os.valor_total
FROM Ordem_Servico os
JOIN Veiculo v ON os.id_veiculo = v.id_veiculo
JOIN Cliente c ON v.id_cliente = c.id_cliente;

-- 7. Expressão com soma (valor total de peças por OS)
SELECT os.id_os, SUM(p.valor_peca * osp.quantidade) AS total_pecas
FROM OS_Peca osp
JOIN Peca p ON osp.id_peca = p.id_peca
JOIN Ordem_Servico os ON osp.id_os = os.id_os
GROUP BY os.id_os;