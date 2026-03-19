CREATE DATABASE viagens;
USE viagens;

CREATE TABLE usuarios (
	id INT,
    nome VARCHAR (255) NOT NULL COMMENT "Nome do usuário", 
    emaill VARCHAR (100) NOT NULL UNIQUE COMMENT "Email do usuário", 
    endereco VARCHAR (50) NOT NULL COMMENT "Endereço do usuário",
    data_nascimento DATE NOT NULL COMMENT "Data de nascimento do usuário"
    /* O COMMENT serve para adicionar uma descrição ao campo da tabela. Não muda o funcionamento do Banco.
	É apenas para documentação interna. */
);

/* Em alguns casos, uma boa prática é identificar o database na criação da tabela: viagens.destinos 
Porém não é obrigatório caso esteja com o database selecionado.*/

CREATE TABLE destinos (
	id INT, 
    nome VARCHAR (255) NOT NULL UNIQUE COMMENT "Nome do destino",
    descricao VARCHAR(255) NOT NULL COMMENT "Descrição do destino"
);

CREATE TABLE reservas (
	id INT COMMENT "Identficador único da reserva",
    id_usuario INT COMMENT "Referência ao ID do usuário que fez a reserva",
    id_destino INT COMMENT "Referência ao ID do destino da reserva", 
    data DATE COMMENT "Data da reserva",
    status VARCHAR(255) DEFAULT "pendente" COMMENT "Status da reserva (confirmada, pendente, cancelada, etc"
    -- Default: Valor automático caso não seja informado um valor. 
);

-- Inserindo dados na tabela usuarios 
INSERT INTO usuarios (id, nome, emaill, data_nascimento, endereco) VALUES (1, "Amanda", "teste@gmail.com", "2007-02-07", " Av ficticia, 25 - Bairro hipotetico/SP");
INSERT INTO destinos (id, nome, descricao) VALUES (1, " Arraial do Cabo", " Praias paradisiacas!");
INSERT INTO reservas (id, id_usuario, id_destino, status, data) VALUES (1, 1, 1, "pendente", "2026-11-11");
-- Ainda não possui as Foreign keys, porém será adicionadas em breve.


INSERT INTO usuarios (id, nome, emaill, data_nascimento, endereco) VALUES 
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B, 456, Cidade Y, Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C, 789, Cidade X, Estado Y');

INSERT INTO destinos (id, nome, descricao) VALUES 
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(2, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(3, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');

INSERT INTO reservas (id, id_usuario, id_destino, data, status) VALUES 
(1, 1, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');

-- Atualizando um valor em uma tabela.
UPDATE usuarios SET id = 4 WHERE emaill = "teste@gmail.com";

-- Deletando um valor em uma tabela.
DELETE FROM destinos WHERE nome = " Praia do Rosa";


-- Tipos de Selects --

-- Selecionar todos os registros da tabela "usuarios"
SELECT * FROM usuarios;

-- Selecionar apenas o nome e o email dos usuários
SELECT nome, email FROM usuarios;

-- Selecionar os usuários que possuem o nome "João Silva"
SELECT * FROM usuarios WHERE nome = 'João Silva';

-- Selecionar os usuários que nasceram antes de uma determinada data
SELECT * FROM usuarios WHERE data_nascimento < '1990-01-01';

-- Like
SELECT * FROM usuarios WHERE nome LIKE '%Silva%';
SELECT * FROM usuarios WHERE nome LIKE 'Jo_o%';


