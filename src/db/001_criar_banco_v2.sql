-- Cria o banco hwatendimento_v2, com a estrutura corrigida, e copia os dados do banco antigo.
-- O banco antigo (hwatendimento) é só LIDO: nada nele é alterado ou apagado.
-- Rodar uma vez, no MySQL Workbench.

CREATE DATABASE IF NOT EXISTS hwatendimento_v2
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE hwatendimento_v2;


-- ===== Tabelas (InnoDB: aceita chaves estrangeiras e transações) =====

CREATE TABLE cliente (
  id int NOT NULL AUTO_INCREMENT,
  tipo char(1) NOT NULL,
  nome varchar(120) NOT NULL,
  nome_empresa varchar(120) DEFAULT NULL,
  telefone varchar(20) DEFAULT NULL,
  criado_em datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_cliente_telefone (telefone),
  KEY ix_cliente_nome (nome),
  CONSTRAINT ck_cliente_tipo CHECK (tipo IN ('F', 'J'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE equipamento (
  id int NOT NULL AUTO_INCREMENT,
  modelo varchar(20) NOT NULL,
  numero_serie varchar(30) DEFAULT NULL,
  cliente_id int NOT NULL,
  criado_em datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uk_equipamento_serie (numero_serie),
  KEY ix_equipamento_modelo (modelo),
  CONSTRAINT fk_equipamento_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE atendimento (
  id int NOT NULL AUTO_INCREMENT,
  equipamento_id int NOT NULL,
  cliente_id int NOT NULL,
  data_hora_inicio datetime NOT NULL,
  data_hora_fim datetime DEFAULT NULL,
  descricao text NOT NULL,
  criado_em datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY ix_atendimento_inicio (data_hora_inicio),
  KEY ix_atendimento_equipamento (equipamento_id, data_hora_inicio),
  CONSTRAINT fk_atendimento_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id),
  CONSTRAINT fk_atendimento_equipamento FOREIGN KEY (equipamento_id) REFERENCES equipamento (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===== Views =====

-- Histórico do equipamento (tela de registro)
CREATE OR REPLACE VIEW atendimentosequipamento AS
SELECT
  atendimento.criado_em    AS data,
  cliente.nome             AS cliente,
  atendimento.descricao    AS descricao,
  equipamento.numero_serie AS numero_serie
FROM equipamento
JOIN atendimento ON atendimento.equipamento_id = equipamento.id
JOIN cliente     ON atendimento.cliente_id = cliente.id;

-- Pesquisa (com o id, para editar e excluir; duração = fim - início)
CREATE OR REPLACE VIEW atendimentoscomfiltro AS
SELECT
  atendimento.id               AS id,
  atendimento.data_hora_inicio AS inicio,
  equipamento.modelo           AS modelo,
  equipamento.numero_serie     AS numero_serie,
  cliente.nome                 AS Cliente,
  cliente.telefone             AS Telefone,
  CASE
    WHEN atendimento.data_hora_fim IS NULL THEN 'Em aberto'
    ELSE TIME_FORMAT(TIMEDIFF(atendimento.data_hora_fim, atendimento.data_hora_inicio), '%H:%i')
  END                          AS duracao,
  atendimento.descricao        AS descricao
FROM cliente
JOIN atendimento ON atendimento.cliente_id = cliente.id
JOIN equipamento ON equipamento.id = atendimento.equipamento_id;


-- ===== Cópia dos dados do banco antigo (mantém os mesmos ids) =====
-- Se der erro de chave estrangeira aqui, existe algum registro no banco antigo
-- apontando para um id que não existe (as consultas no final mostram quais).

INSERT INTO hwatendimento_v2.cliente (id, tipo, nome, nome_empresa, telefone, criado_em)
SELECT id, tipo, nome, nome_empresa, telefone, criado_em
FROM hwatendimento.cliente;

INSERT INTO hwatendimento_v2.equipamento (id, modelo, numero_serie, cliente_id, criado_em)
SELECT id, modelo, numero_serie, cliente_id, criado_em
FROM hwatendimento.equipamento;

INSERT INTO hwatendimento_v2.atendimento (id, equipamento_id, cliente_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, equipamento_id, cliente_id, data_hora_inicio, data_hora_fim, descricao, criado_em
FROM hwatendimento.atendimento;


-- Conferência: as duas colunas de cada linha devem ter o mesmo número
SELECT 'cliente' AS tabela,
       (SELECT COUNT(*) FROM hwatendimento.cliente)    AS antigo,
       (SELECT COUNT(*) FROM hwatendimento_v2.cliente) AS novo
UNION ALL
SELECT 'equipamento',
       (SELECT COUNT(*) FROM hwatendimento.equipamento),
       (SELECT COUNT(*) FROM hwatendimento_v2.equipamento)
UNION ALL
SELECT 'atendimento',
       (SELECT COUNT(*) FROM hwatendimento.atendimento),
       (SELECT COUNT(*) FROM hwatendimento_v2.atendimento);


-- Registros órfãos no banco antigo (só leitura):
--
-- SELECT * FROM hwatendimento.equipamento WHERE cliente_id NOT IN (SELECT id FROM hwatendimento.cliente);
-- SELECT * FROM hwatendimento.atendimento WHERE cliente_id NOT IN (SELECT id FROM hwatendimento.cliente);
-- SELECT * FROM hwatendimento.atendimento WHERE equipamento_id NOT IN (SELECT id FROM hwatendimento.equipamento);
