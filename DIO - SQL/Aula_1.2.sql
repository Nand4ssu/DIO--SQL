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


ALTER TABLE usuarios MODIFY COLUMN id INT AUTO_INCREMENT, ADD PRIMARY KEY (id);
ALTER TABLE destinos MODIFY COLUMN id INT AUTO_INCREMENT, ADD PRIMARY KEY (id);
ALTER TABLE reservas MODIFY COLUMN id INT AUTO_INCREMENT, ADD PRIMARY KEY (id);


DELETE FROM reservas WHERE id = 1;
DELETE FROM destinos WHERE id = 2;
SELECT * FROM destinos;

ALTER TABLE reservas ADD CONSTRAINT fk_reservas_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios (id);
ALTER TABLE reservas ADD CONSTRAINT fk_reservas_destinos FOREIGN KEY (id_destino) REFERENCES destinos (id);

-- Normalização de Dados 
-- Apenas a 1FN foi utilizada neste exemplo.

ALTER TABLE usuarios ADD rua VARCHAR(100), ADD numero VARCHAR(100), ADD cidade VARCHAR(50),
ADD estado VARCHAR(20);

/* SUBSTRING_INDEX(texto, separador, número)
separador: caractere usado para dividir o texto (ex: vírgula)
número positivo: pega a partir da esquerda
número negativo: pega a partir da direita
-- Exemplo: "Rua A, 123, São Paulo, SP"*/

UPDATE usuarios 
SET rua = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 1), ',', -1),
	numero = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 2), ',', -1),
    cidade = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 3), ',', -1),
    estado = SUBSTRING_INDEX(endereco, ',', -1);
    
ALTER TABLE usuarios MODIFY estado VARCHAR(50);
SELECT * FROM usuarios;

ALTER TABLE usuarios DROP COLUMN endereco;

-- Consultas Avançadas
 -- Não será utilizado o FULL JOIN
 
-- Inner Join
SELECT * FROM usuarios us INNER JOIN reservas rs ON us.id = rs.id_usuario INNER JOIN destinos ds
ON rs.id_destino = ds.id;

INSERT INTO usuarios (nome, emaill, data_nascimento, rua, numero, cidade, estado) VALUES
("sem reservas", "dio.teste@gmail.com", "1998-05-05", "rua", "12", "cidade", "estado"); 

-- Left Join
SELECT * FROM usuarios us LEFT JOIN reservas rs ON us.id = rs.id_usuario; 

-- Right Join
INSERT INTO destinos (nome, descricao) VALUES ("Destino sem reservas", "Descrição"); 

SELECT * FROM reservas rs RIGHT JOIN destinos ds ON rs.id_destino = ds.id;
 
 -- Sub Consultas
 SELECT * FROM destinos WHERE id NOT IN (SELECT id_destino FROM reservas);
 
 SELECT * FROM usuarios WHERE id NOT IN (SELECT id_usuario FROM reservas);
 
 -- Funções Agregadas 
 
 SELECT COUNT(*) as total_usuarios FROM usuarios;
 
 SELECT COUNT(*) as total_usuarios FROM usuarios us INNER JOIN reservas rs
 ON us.id = rs.id_usuario; -- Apenas usuários que contém reservas.
 
SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())) AS maior_idade FROM usuarios; -- Usuário que tenha a maioridade

INSERT INTO reservas (id_usuario, id_destino) VALUES (1,3);

SELECT COUNT(*), id_destinos FROM reservas GROUP BY id_destino; -- Quantidades de reservas para cada destino.

SELECT COUNT(*) AS qtd_reservas, id_destino FROM reservas GROUP BY id_destino 
ORDER BY qtd_reservas; -- Colocar por ordem o destino que mais tem reservas.

INSERT INTO usuarios (nome, emaill, data_nascimento, rua) VALUES
('João Silva', 'joao.silva@example.com', '1990-01-01', 'Rua A'),
('Maria Santos', 'maria.santos@example.com', '1992-03-15', 'Rua B'),
('Pedro Almeida', 'pedro.almeida@example.com', '1985-07-10', 'Rua C'),
('Ana Oliveira', 'ana.oliveira@example.com', '1998-12-25', 'Rua D'),
('Carlos Pereira', 'carlos.pereira@example.com', '1991-06-05', 'Rua E'),
('Laura Mendes', 'laura.mendes@example.com', '1994-09-12', 'Rua F'),
('Fernando Santos', 'fernando.santos@example.com', '1988-02-20', 'Rua G'),
('Mariana Costa', 'mariana.costa@example.com', '1997-11-30', 'Rua H'),
('Ricardo Rodrigues', 'ricardo.rodrigues@example.com', '1993-04-18', 'Rua I'),
('Camila Alves', 'camila.alves@example.com', '1989-08-08', 'Rua J'),
('Bruno Carvalho', 'bruno.carvalho@example.com', '1995-03-25', 'Rua K'),
('Amanda Silva', 'amanda.silva@example.com', '1996-12-02', 'Rua L'),
('Paulo Mendonça', 'paulo.mendonca@example.com', '1999-07-20', 'Rua M'),
('Larissa Oliveira', 'larissa.oliveira@example.com', '1987-10-15', 'Rua N'),
('Fernanda Sousa', 'fernanda.sousa@example.com', '1992-05-08', 'Rua O'),
('Gustavo Santos', 'gustavo.santos@example.com', '1993-09-18', 'Rua P'),
('Helena Costa', 'helena.costa@example.com', '1998-02-22', 'Rua Q'),
('Diego Almeida', 'diego.almeida@example.com', '1991-11-27', 'Rua R'),
('Juliana Lima', 'juliana.lima@example.com', '1997-04-05', 'Rua S'),
('Rafaela Silva', 'rafaela.silva@example.com', '1996-01-10', 'Rua T'),
('Lucas Pereira', 'lucas.pereira@example.com', '1986-08-30', 'Rua U'),
('Fábio Rodrigues', 'fabio.rodrigues@example.com', '1989-03-12', 'Rua V'),
('Isabela Santos', 'isabela.santos@example.com', '1994-12-07', 'Rua W'),
('André Alves', 'andre.alves@example.com', '1995-09-28', 'Rua X'),
('Clara Carvalho', 'clara.carvalho@example.com', '1990-02-15', 'Rua Y'),
('Roberto Mendes', 'roberto.mendes@example.com', '1992-07-21', 'Rua Z'),
('Mariana Oliveira', 'mariana.oliveira@example.com', '1997-05-03', 'Av. A'),
('Gustavo Costa', 'gustavo.costa@example.com', '1998-11-16', 'Av. B'),
('Lara Sousa', 'lara.sousa@example.com', '1993-06-09', 'Av. C'),
('Pedro Lima', 'pedro.lima@example.com', '1996-09-27', 'Av. D');

EXPLAIN 
	SELECT * FROM usuarios WHERE emaill = "roberto.mendes@example.com";

CREATE INDEX idx_nome ON usuarios (nome);
EXPLAIN 
	SELECT * FROM usuarios WHERE nome = "João Silva";
    


/* Desativa o modo seguro do MySQL, permitindo executar comandos UPDATE e DELETE
mesmo sem usar uma chave primária ou índice na cláusula WHERE */
SET SQL_SAFE_UPDATES = 0;
-- Reativa o modo seguro do MySQL, voltando a impedir alterações/exclusões
SET SQL_SAFE_UPDATES = 1;