-- Usuários, log de ações e autor de cada atendimento.
-- Rodar uma vez, no MySQL Workbench, depois do 001_criar_banco_v2.sql.

USE hwatendimento_v2;


-- ===== Usuários =====
-- A senha nunca é guardada em texto: guarda-se o hash SHA-256 de (salt + senha).

CREATE TABLE usuario (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(50) NOT NULL,
  senha_hash varchar(64) NOT NULL,
  senha_salt varchar(32) NOT NULL,
  admin tinyint(1) NOT NULL DEFAULT 0,
  ativo tinyint(1) NOT NULL DEFAULT 1,
  criado_em datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_usuario_nome (nome)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===== Log de ações =====
-- tabela + registro_id dizem qual linha sofreu a ação (sem chave estrangeira,
-- para o log continuar existindo mesmo depois que o registro for excluído).

CREATE TABLE log (
  id int NOT NULL AUTO_INCREMENT,
  usuario_id int NOT NULL,
  acao varchar(20) NOT NULL,
  tabela varchar(30) NOT NULL,
  registro_id int DEFAULT NULL,
  detalhe text DEFAULT NULL,
  criado_em datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY ix_log_criado_em (criado_em),
  KEY ix_log_usuario (usuario_id),
  CONSTRAINT fk_log_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===== Autor do atendimento =====
-- Fica NULL nos atendimentos que já existiam antes dos usuários.

ALTER TABLE atendimento
  ADD COLUMN usuario_id int DEFAULT NULL AFTER cliente_id,
  ADD KEY ix_atendimento_usuario (usuario_id),
  ADD CONSTRAINT fk_atendimento_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id);


-- ===== Primeiro usuário (administrador) =====
-- Usuário: admin   Senha: admin   -> troque a senha assim que o login estiver funcionando.

SET @salt = LOWER(HEX(RANDOM_BYTES(16)));

INSERT INTO usuario (nome, senha_hash, senha_salt, admin, ativo)
VALUES ('admin', SHA2(CONCAT(@salt, 'admin'), 256), @salt, 1, 1);


-- Conferência
SELECT id, nome, admin, ativo, criado_em FROM usuario;
