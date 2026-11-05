-- Perfis de usuário e permissões.
-- Substitui a coluna usuario.admin (sim/não) por um perfil, e cada perfil tem uma lista de permissões.
-- Para criar um perfil novo no futuro: INSERT em perfil + INSERTs em perfil_permissao (sem mexer no código).
-- Rodar uma vez, depois do 004.

USE hwatendimento_v2;

-- O Safe Updates do Workbench bloqueia UPDATE/DELETE sem chave primária no WHERE.
-- Desliga só nesta conexão, para o script rodar até o fim.
SET SQL_SAFE_UPDATES = 0;


-- ===== Tabelas =====

CREATE TABLE perfil (
  id int NOT NULL AUTO_INCREMENT,
  nome varchar(50) NOT NULL,
  criado_em datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_perfil_nome (nome)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE perfil_permissao (
  perfil_id int NOT NULL,
  permissao varchar(40) NOT NULL,
  PRIMARY KEY (perfil_id, permissao),
  CONSTRAINT fk_perfil_permissao_perfil FOREIGN KEY (perfil_id) REFERENCES perfil (id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===== Perfis =====

INSERT INTO perfil (nome) VALUES
  ('Administrador'),
  ('Suporte'),
  ('Atendimento'),
  ('Manutenção'),
  ('Auditoria');


-- ===== Permissões =====
--   registrar_atendimento       salvar atendimento novo
--   editar_atendimento          editar qualquer atendimento
--   editar_proprio_atendimento  editar só os atendimentos que o próprio usuário registrou
--   excluir_atendimento         excluir atendimento
--   ver_log                     abrir a tela de Log
--   ver_usuarios                abrir a tela de Usuários (só consulta)
--   gerenciar_usuarios          cadastrar, ativar/desativar e trocar perfil de usuários

-- Administrador: tudo
INSERT INTO perfil_permissao (perfil_id, permissao)
SELECT id, 'registrar_atendimento' FROM perfil WHERE nome = 'Administrador' UNION ALL
SELECT id, 'editar_atendimento'    FROM perfil WHERE nome = 'Administrador' UNION ALL
SELECT id, 'excluir_atendimento'   FROM perfil WHERE nome = 'Administrador' UNION ALL
SELECT id, 'ver_log'               FROM perfil WHERE nome = 'Administrador' UNION ALL
SELECT id, 'ver_usuarios'          FROM perfil WHERE nome = 'Administrador' UNION ALL
SELECT id, 'gerenciar_usuarios'    FROM perfil WHERE nome = 'Administrador';

-- Suporte, Atendimento e Manutenção: registram e editam só os próprios atendimentos
INSERT INTO perfil_permissao (perfil_id, permissao)
SELECT id, 'registrar_atendimento'      FROM perfil WHERE nome IN ('Suporte', 'Atendimento', 'Manutenção') UNION ALL
SELECT id, 'editar_proprio_atendimento' FROM perfil WHERE nome IN ('Suporte', 'Atendimento', 'Manutenção');

-- Auditoria: consulta tudo, não altera nada
INSERT INTO perfil_permissao (perfil_id, permissao)
SELECT id, 'ver_log'      FROM perfil WHERE nome = 'Auditoria' UNION ALL
SELECT id, 'ver_usuarios' FROM perfil WHERE nome = 'Auditoria';


-- ===== Usuário passa a ter um perfil (no lugar da coluna admin) =====

ALTER TABLE usuario
  ADD COLUMN perfil_id int DEFAULT NULL AFTER senha_salt;

-- quem era admin vira Administrador; os demais, Atendimento
UPDATE usuario SET perfil_id = (SELECT id FROM perfil WHERE nome = 'Administrador') WHERE admin = 1;
UPDATE usuario SET perfil_id = (SELECT id FROM perfil WHERE nome = 'Atendimento') WHERE perfil_id IS NULL;

ALTER TABLE usuario
  MODIFY COLUMN perfil_id int NOT NULL,
  ADD KEY ix_usuario_perfil (perfil_id),
  ADD CONSTRAINT fk_usuario_perfil FOREIGN KEY (perfil_id) REFERENCES perfil (id),
  DROP COLUMN admin;


-- ===== Pesquisa: dono do atendimento =====
-- usuario_id (escondido na tela) serve para a regra "editar só os próprios";
-- Responsavel mostra o nome de quem registrou (vazio nos atendimentos sem dono).

CREATE OR REPLACE VIEW atendimentoscomfiltro AS
SELECT
  atendimento.id               AS id,
  atendimento.usuario_id       AS usuario_id,
  atendimento.data_hora_inicio AS inicio,
  equipamento.modelo           AS modelo,
  equipamento.numero_serie     AS numero_serie,
  cliente.nome                 AS Cliente,
  cliente.telefone             AS Telefone,
  CASE
    WHEN atendimento.data_hora_fim IS NULL THEN 'Em aberto'
    ELSE TIME_FORMAT(TIMEDIFF(atendimento.data_hora_fim, atendimento.data_hora_inicio), '%H:%i')
  END                          AS duracao,
  usuario.nome                 AS Responsavel,
  atendimento.descricao        AS descricao
FROM cliente
JOIN atendimento ON atendimento.cliente_id = cliente.id
JOIN equipamento ON equipamento.id = atendimento.equipamento_id
LEFT JOIN usuario ON usuario.id = atendimento.usuario_id;


-- Conferência: permissões de cada perfil
SELECT perfil.nome AS perfil, GROUP_CONCAT(perfil_permissao.permissao ORDER BY perfil_permissao.permissao SEPARATOR ', ') AS permissoes
FROM perfil
LEFT JOIN perfil_permissao ON perfil_permissao.perfil_id = perfil.id
GROUP BY perfil.id, perfil.nome
ORDER BY perfil.id;
