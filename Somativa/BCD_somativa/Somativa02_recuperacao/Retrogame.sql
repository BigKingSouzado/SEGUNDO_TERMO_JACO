-- Active: 1794917661822@@127.0.0.1@3308@recuperativa_retrogame_jaco
-- Active: 1794917661822@@127.0.0.1@3308@recuperativa_retrogame_jaco-- Active: 1794917661822@@127.0.0.1@3308@recuperativa_retrogame_jaco-- Active: 1794917661822@@127.0.0.1@3308@recuperativa_retrogame_jaco-- Active: 1794917661822@@127.0.0.1@3308@recuperativa_retrogame_jaco-- Active: 1794917661822@@127.0.0.1@3308@recuperativa_retrogame_jaco

DROP DATABASE Recuperativa_Retrogame_Jaco;

CREATE DATABASE IF NOT EXISTS Recuperativa_Retrogame_Jaco;

USE Recuperativa_Retrogame_Jaco;

-- FASE 1

-- COMFIRMAR +
CREATE TABLE IF NOT EXISTS PLATAFORMA (
    id_plataforma INT AUTO_INCREMENT,
    nome_plataforma VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT pk_id_plataforma PRIMARY KEY (id_plataforma),
    CONSTRAINT uq_nome_plataforma UNIQUE (nome_plataforma)
);

-- COMFIRMAR +
CREATE TABLE IF NOT EXISTS CATEGORIA (
    id_categoria INT AUTO_INCREMENT,
    descricao VARCHAR(80) NOT NULL UNIQUE,

    CONSTRAINT pk_id_categoria PRIMARY KEY (id_categoria),
    CONSTRAINT uq_descricao UNIQUE (descricao)
);

-- CORFIRMAR +
CREATE TABLE IF NOT EXISTS CLIENTE (
    id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) NULL,
    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_email UNIQUE (email)
);

-- CORFIRMAR +
CREATE TABLE IF NOT EXISTS JOGO (
    id_jogo INT AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    codigo VARCHAR(15) NOT NULL UNIQUE,
    ano_lancamento INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >=0),
    id_plataforma INT NOT NULL,
    id_categoria INT NOT NULL,

    CONSTRAINT pk_id_jogo PRIMARY KEY (id_jogo),
    CONSTRAINT uq_codigo UNIQUE (codigo),
    CONSTRAINT fk_id_plataforma FOREIGN KEY (id_plataforma) REFERENCES PLATAFORMA (id_plataforma),
    CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA (id_categoria)
);

SELECT * FROM JOGO

ALTER TABLE JOGO ADD desenvolvidora VARCHAR(100);

-- CONFIRMAR +
CREATE TABLE IF NOT EXISTS LOCACAO (
    id_locacao INT AUTO_INCREMENT,
    data_retirada DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NULL,
    status_locacao VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_locacao IN ('ABERTO', 'DEVOLVIDA', 'ATRASADA')),
    id_cliente INT NOT NULL, 
    id_jogo INT NOT NULL,


    CONSTRAINT pk_id_locacao PRIMARY KEY (id_locacao),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE (id_cliente),
    CONSTRAINT fk_id_jogo FOREIGN KEY (id_jogo) REFERENCES JOGO (id_jogo)
);

-- FASE 2
INSERT INTO CLIENTE (nome_cliente, email, telefone, ativo) VALUES
('Jacó de Souza', 'jaco@gmail.com', '19999999999', TRUE),
('Alan Ferreira Pereira', 'alan@gmail.com', '19999999998', TRUE),
('Leon Martins', 'leon@gmail.com', '19999999997', TRUE),
('Eduardo Vieira', 'eduardo@gmail.com', '', TRUE);

select * from cliente

INSERT INTO PLATAFORMA (nome_plataforma) VALUES
('Nintento Switch'),
('Playstation');

INSERT INTO CATEGORIA (descricao) VALUES
('Aventura'),
('Plataforma');



INSERT INTO JOGO (titulo, codigo, ano_lancamento, quantidade_disponivel, id_plataforma, id_categoria, desenvolvidora) VALUES
('The Legend of Zelda Ocarina of Time', '000-000-000-001', '1998', '10', 1, 1, 'Nintendo'),
('Donkey Kong Country', '000-000-000-002', '1994', '18', 1, 2, 'Nintendo'),
('Super Mario Bros', '000-000-000-003', '1985', '7', 1, 2, 'Nintendo'),
('Castlevania: Symphony of the Night', '000-000-000-004', '1997', '13', 2, 1, 'Konami'),
('Resident Evil 2', '000-000-000-005', '1998', '24', 2, 1, 'Capcom'),
('Crash Bandicoot Trilogy', '000-000-000-006', '1996', '9', 2, 2, 'Naughty Dog');

select * from jogo

-- 9

INSERT INTO LOCACAO (data_retirada, data_prevista, data_devolucao, status_locacao, id_cliente, id_jogo) VALUES
(now(), '2026-01-17', '2026-12-27', 'ABERTO', 1, 1),
('2026-10-28 10:25:00', '2026-12-02', '2026-11-24', 'ABERTO', 3, 4),
('2026-11-10 13:55:00', '2027-02-01', '2026-01-30', 'ABERTO', 2, 5);

select * from locacao

UPDATE JOGO 
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo = 1 and 4 and 5;

-- 10
UPDATE CLIENTE
SET telefone = '19999999123'
WHERE id_cliente = 1;


-- 11 NÃO TENHO ANO 200 ENTÃO COLOQUEI 1996
UPDATE JOGO
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_lancamento >= 1996;

-- 12

INSERT INTO CLIENTE (nome_cliente, email, telefone, ativo) VALUES
('Luan Guimarães Ferreira', 'luan@gmail.com', '19999999995', TRUE);

DELETE FROM CLIENTE
WHERE id_cliente = 5;

DELETE FROM CLIENTE
WHERE id_cliente = 1;

-- NÃO É POSSIVEL DELETAR O CLIENTE COM O ID 5 POIS A CHAVE ESTRANGEIRA FEITA NA LOCACAO PROTEGE/ INPEDE QUE ELA SEJA DELETADA

-- FASE 3

-- 13

SELECT titulo, ano_lancamento, quantidade_disponivel FROM JOGO

-- 14

SELECT titulo, quantidade_disponivel FROM JOGO
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel desc;

-- 15

SELECT titulo FROM JOGO
WHERE titulo LIKE '%The Legend%';


-- 16

SELECT titulo, ano_lancamento FROM JOGO
WHERE ano_lancamento BETWEEN 1990 AND 2005;

-- 17 

SELECT COUNT(*) AS quantidade, SUM(quantidade_disponivel) AS SOMA, 
AVG(quantidade_disponivel) AS MEDIA, 
MAX(quantidade_disponivel) AS MAXIMO, 
MIN(quantidade_disponivel) AS MINIMO FROM JOGO 

-- 18 

SELECT L.id_locacao, C.nome_cliente, J.titulo,  L.data_retirada , L.status_locacao
FROM LOCACAO AS L
INNER JOIN JOGO AS J
ON L.id_locacao = J.id_jogo
INNER JOIN CLIENTE AS C
ON L.id_locacao = C.id_cliente;

-- 19

SELECT L.id_locacao, C.nome_cliente, J.titulo,  L.data_retirada , L.status_locacao
FROM LOCACAO AS L
INNER JOIN JOGO AS J
ON L.id_locacao = J.id_jogo
INNER JOIN CLIENTE AS C
ON L.id_locacao = C.id_cliente
WHERE status_locacao = 'ABERTO';


start transaction;
INSERT INTO LOCACAO (data_retirada, data_prevista, data_devolucao, status_locacao, id_cliente, id_jogo) VALUES
(NOW(),'2026-11-17',NULL,'ABERTO',4,2);

UPDATE JOGO
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_JOGO = 6;
select id_JOGO, quantidade_disponivel from JOGO
WHERE ID_JOGO = 6;
COMMIT;

select * from jogo;

start transaction;

update JOGO
set quantidade_disponivel = quantidade_disponivel + 1000
where id_jogo = 1;
select id_jogo, quantidade_disponivel from JOGO
WHERE id_jogo = 1;
ROLLBACK;

START TRANSACTION;
UPDATE locacao
SET status_locacao = 'DEVOLVIDA'
WHERE id_locacao = 1;

UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_jogo = 5;

select * from locacao;

COMMIT;



