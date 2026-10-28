
create DATABASE Bibiblioteca_conecta_jaco;

USE Bibiblioteca_conecta_jaco;

-- TABELAS


-- FASE 1 — DDL: CRIAÇÃO E ESTRUTURA

CREATE TABLE IF NOT EXISTS USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20) NULL,
    ativo ENUM('DEFAULT', 'TRUE') DEFAULT 'TRUE'
);

CREATE TABLE IF NOT EXISTS LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >=0)
);

DROP TABLE LIVRO;
ALTER TABLE LIVRO
MODIFY isbn char(13) NOT NULL;
ALTER TABLE LIVRO
ADD editora varchar(255);

select * from livro

CREATE TABLE IF NOT EXISTS EMPRESTIMO (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolecao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_emprestimo = 'ABERTO'),
    id_usuario INT, Foreign Key (id_usuario) REFERENCES USUARIO(id_usuario),
    id_livro INT, Foreign Key (id_livro) REFERENCES LIVRO(id_livro)
);


CREATE TABLE  IF NOT EXISTS PROGRAMA_FIDELIDADE (
    id_programa_fidelidade INT PRIMARY KEY AUTO_INCREMENT,
    nome_social VARCHAR(150) NOT NULL,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    endereco VARCHAR(300) NOT NULL,
    pontos INT DEFAULT 100 CHECK (pontos >=100),
    data_vencimento DATETIME,
    id_usuario INT, Foreign Key (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE IF NOT EXISTS FUNCIONARIO (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(150) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    cpf_funcionario VARCHAR(20) NOT NULL,
    horario_chegada DATE NOT NULL,
    horario_saida DATE
)

-- FASE 2 — DML: MANIPULAÇÃO DE DADOS 

INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES 
('Jacó de Souza', 'jaco@gmail.com', '19982592467', 'TRUE'),
('Noah de Souza', 'noah@gmail.com', '', 'DEFAULT'),
('Carolina Cumpian', 'carolina@gmail.com', '19999999999', 'TRUE'),
('Danilo Cumpian', 'danilo@gmail.com', '19999999998', 'TRUE');
        
SELECT * FROM USUARIO

INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES 
('Cauãn Cumpian', 'cauan@gmail.com', '19594799998', 'TRUE');

DELETE FROM USUARIO
WHERE id_usuario = 5;

DELETE FROM USUARIO
WHERE id_usuario = 1;
-- O ERRO QUE DÁ AO DELETAR UM USUARIO COM UM EMPRESTIMO É QUE A CHAVE ESTRANGEIRA ESTÁ PROTEGENDO ELE DE SER EXCLUIDO

-- OLHEI OS USUARIOS E ESCOLHI O USUARIO 31 PARA MUDAR SEU TELEFONE 
UPDATE USUARIO
SET telefone = '19990979801'
WHERE id_usuario = 2;

INSERT INTO LIVRO (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora) VALUES
('A Arte da Guerra', 'Sun Wu', '9788560018000', '1080', '10', 'Editora Jardim dos Livros'),
('As 48 Leis do Poder', 'Robert Greene', '9788660018000', '1998', '17', ' Rocco'),
('Meridiano de sangue', 'Cormac McCarthy', '9788760018000', '1985', '8', 'Alfaguara'),
('I Have No Mouth, and I Must Scream', ' Harlan Ellison', '9788860018000', '1967', '3', 'Union Square & Co'),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', '9788960018000', '1943', '43', 'HarperCollins Brasil'),
('Moby Dick', 'Herman Melville', '9789060018000', ' 1851', '28', 'Nova Fronteira');

INSERT INTO LIVRO (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora) VALUES
('Harry Potter e a Câmara Secreta', 'J.K.Rowling', '9788670019000', '1998', '20', 'Rocco')


-- AO INVES DE ANO 2020 FOI O ANO 1998 E OS LIVROS FORAM As 48 Leis do Poder E Harry Potter e a Câmara Secreta
UPDATE LIVRO
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao = 1998; 


SELECT * FROM LIVRO

-- DATETIMA 2026-09-01 00:00:00
-- DATE YYYY-MM-DD
INSERT INTO EMPRESTIMO (data_emprestimo, data_prevista, data_devolecao, status_emprestimo, id_usuario, id_livro) VALUES
('2026-10-28 10:25:00', '2026-11-28', '2026-11-15', 'ABERTO', '1', '3'),
('2026-10-28 12:30:00', '2026-12-10', '2026-12-10', 'ABERTO', '2', '1'),
('2026-10-28 13:00:00', '2027-01-01', '2026-12-23', 'ABERTO', '3', '5');

SELECT * FROM EMPRESTIMO

-- FASE 3 — DQL: CONSULTAS E ANÁLISE

SELECT titulo, autor, quantidade_disponivel FROM LIVRO


SELECT titulo, quantidade_disponivel
FROM LIVRO
ORDER BY quantidade_disponivel DESC;

SELECT titulo
FROM LIVRO
WHERE TITULO LIKE 'Harry%';

-- AQUI AO INVES DE 2015 A 2020 FOI DE 1967 A 1998
SELECT titulo, ano_publicacao
FROM LIVRO
WHERE ano_publicacao BETWEEN 1967 AND 1998;


SELECT id_emprestimo, id_usuario, id_livro, data_emprestimo, status_emprestimo FROM EMPRESTIMO





DELETE FROM USUARIO;
DELETE FROM LIVRO;

SELECT * FROM USUARIO;

drop table USUARIO;
