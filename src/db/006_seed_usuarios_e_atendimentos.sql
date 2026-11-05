-- Usuários de teste (um de cada perfil) e atendimentos refeitos, cada um com um dono.
-- ATENÇÃO: apaga TODOS os atendimentos do hwatendimento_v2 (e o log deles) e cria de novo.
-- Os atendimentos originais continuam guardados no banco antigo (hwatendimento), que não é tocado.
-- Rodar depois do 005.
--
-- Usuários criados (senha = nome do usuário; troque depois):
--   suporte / suporte          perfil Suporte
--   atendimento / atendimento  perfil Atendimento
--   manutencao / manutencao    perfil Manutenção
--   auditoria / auditoria      perfil Auditoria
--   (o admin / admin já existe, perfil Administrador)

USE hwatendimento_v2;

-- O Safe Updates do Workbench bloqueia UPDATE/DELETE sem chave primária no WHERE.
-- Desliga só nesta conexão, para o script rodar até o fim.
SET SQL_SAFE_UPDATES = 0;


-- ===== Usuários =====

SET @salt = LOWER(HEX(RANDOM_BYTES(16)));
INSERT INTO usuario (nome, senha_hash, senha_salt, perfil_id, ativo)
SELECT 'suporte', SHA2(CONCAT(@salt, 'suporte'), 256), @salt, id, 1 FROM perfil WHERE nome = 'Suporte';

SET @salt = LOWER(HEX(RANDOM_BYTES(16)));
INSERT INTO usuario (nome, senha_hash, senha_salt, perfil_id, ativo)
SELECT 'atendimento', SHA2(CONCAT(@salt, 'atendimento'), 256), @salt, id, 1 FROM perfil WHERE nome = 'Atendimento';

SET @salt = LOWER(HEX(RANDOM_BYTES(16)));
INSERT INTO usuario (nome, senha_hash, senha_salt, perfil_id, ativo)
SELECT 'manutencao', SHA2(CONCAT(@salt, 'manutencao'), 256), @salt, id, 1 FROM perfil WHERE nome = 'Manutenção';

SET @salt = LOWER(HEX(RANDOM_BYTES(16)));
INSERT INTO usuario (nome, senha_hash, senha_salt, perfil_id, ativo)
SELECT 'auditoria', SHA2(CONCAT(@salt, 'auditoria'), 256), @salt, id, 1 FROM perfil WHERE nome = 'Auditoria';


-- ===== Limpa os atendimentos antigos =====

DELETE FROM log WHERE tabela = 'atendimento';
DELETE FROM atendimento;
ALTER TABLE atendimento AUTO_INCREMENT = 1;


-- ===== Atendimentos (cliente = dono do equipamento) =====

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'suporte'),
       TIMESTAMP(CURDATE() - INTERVAL 60 DAY, '09:10:00'),
       TIMESTAMP(CURDATE() - INTERVAL 60 DAY, '10:05:00'),
       'Equipamento não ligava. Fonte de alimentação substituída e teste de funcionamento realizado.',
       TIMESTAMP(CURDATE() - INTERVAL 60 DAY, '09:10:00')
FROM equipamento WHERE numero_serie = 'EC102345671';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'manutencao'),
       TIMESTAMP(CURDATE() - INTERVAL 12 DAY, '14:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 12 DAY, '14:40:00'),
       'Atualização de software para a versão mais recente e calibração do sinal.',
       TIMESTAMP(CURDATE() - INTERVAL 12 DAY, '14:00:00')
FROM equipamento WHERE numero_serie = 'EC102345671';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'manutencao'),
       TIMESTAMP(CURDATE() - INTERVAL 45 DAY, '08:30:00'),
       TIMESTAMP(CURDATE() - INTERVAL 45 DAY, '09:15:00'),
       'Cabo de paciente com mau contato. Cabo substituído.',
       TIMESTAMP(CURDATE() - INTERVAL 45 DAY, '08:30:00')
FROM equipamento WHERE numero_serie = 'EC105551203';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'suporte'),
       TIMESTAMP(CURDATE() - INTERVAL 3 DAY, '10:20:00'),
       NULL,
       'Cliente relata ruído no traçado. Aguardando envio de eletrodos para teste.',
       TIMESTAMP(CURDATE() - INTERVAL 3 DAY, '10:20:00')
FROM equipamento WHERE numero_serie = 'EC105551203';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'atendimento'),
       TIMESTAMP(CURDATE() - INTERVAL 30 DAY, '13:15:00'),
       TIMESTAMP(CURDATE() - INTERVAL 30 DAY, '13:50:00'),
       'Instalação do equipamento e treinamento da equipe.',
       TIMESTAMP(CURDATE() - INTERVAL 30 DAY, '13:15:00')
FROM equipamento WHERE numero_serie = 'EC112349876';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'atendimento'),
       TIMESTAMP(CURDATE() - INTERVAL 2 DAY, '11:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 2 DAY, '11:25:00'),
       'Cliente pediu segunda via do manual. Enviado por e-mail.',
       TIMESTAMP(CURDATE() - INTERVAL 2 DAY, '11:00:00')
FROM equipamento WHERE numero_serie = 'EC112349876';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'manutencao'),
       TIMESTAMP(CURDATE() - INTERVAL 21 DAY, '15:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 21 DAY, '16:30:00'),
       'Impressora térmica travando. Rolete de tração limpo e ajustado.',
       TIMESTAMP(CURDATE() - INTERVAL 21 DAY, '15:00:00')
FROM equipamento WHERE numero_serie = 'EC118800452';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'suporte'),
       TIMESTAMP(CURDATE() - INTERVAL 1 DAY, '09:00:00'),
       NULL,
       'Erro ao exportar exames para o computador. Em análise.',
       TIMESTAMP(CURDATE() - INTERVAL 1 DAY, '09:00:00')
FROM equipamento WHERE numero_serie = 'EC118800452';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'manutencao'),
       TIMESTAMP(CURDATE() - INTERVAL 50 DAY, '10:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 50 DAY, '11:20:00'),
       'Esteira com velocidade irregular. Correia ajustada e motor lubrificado.',
       TIMESTAMP(CURDATE() - INTERVAL 50 DAY, '10:00:00')
FROM equipamento WHERE numero_serie = 'TE200045871';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 8 DAY, '16:10:00'),
       TIMESTAMP(CURDATE() - INTERVAL 8 DAY, '16:45:00'),
       'Manutenção preventiva semestral concluída sem ocorrências.',
       TIMESTAMP(CURDATE() - INTERVAL 8 DAY, '16:10:00')
FROM equipamento WHERE numero_serie = 'TE200045871';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'manutencao'),
       TIMESTAMP(CURDATE() - INTERVAL 15 DAY, '11:30:00'),
       TIMESTAMP(CURDATE() - INTERVAL 15 DAY, '12:10:00'),
       'Botão de emergência não respondia. Chave substituída.',
       TIMESTAMP(CURDATE() - INTERVAL 15 DAY, '11:30:00')
FROM equipamento WHERE numero_serie = 'TE200091234';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'atendimento'),
       TIMESTAMP(CURDATE() - INTERVAL 4 DAY, '15:30:00'),
       TIMESTAMP(CURDATE() - INTERVAL 4 DAY, '15:50:00'),
       'Agendamento de visita técnica para revisão anual.',
       TIMESTAMP(CURDATE() - INTERVAL 4 DAY, '15:30:00')
FROM equipamento WHERE numero_serie = 'TE200091234';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'suporte'),
       TIMESTAMP(CURDATE() - INTERVAL 40 DAY, '09:45:00'),
       TIMESTAMP(CURDATE() - INTERVAL 40 DAY, '10:30:00'),
       'Configuração de protocolos de teste ergométrico.',
       TIMESTAMP(CURDATE() - INTERVAL 40 DAY, '09:45:00')
FROM equipamento WHERE numero_serie = 'TC300012345';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'manutencao'),
       TIMESTAMP(CURDATE() - INTERVAL 5 DAY, '14:20:00'),
       TIMESTAMP(CURDATE() - INTERVAL 5 DAY, '15:05:00'),
       'Cicloergômetro com carga incorreta. Recalibrado.',
       TIMESTAMP(CURDATE() - INTERVAL 5 DAY, '14:20:00')
FROM equipamento WHERE numero_serie = 'TC300012345';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'suporte'),
       TIMESTAMP(CURDATE() - INTERVAL 25 DAY, '08:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 25 DAY, '08:40:00'),
       'Atualização de software e backup dos exames.',
       TIMESTAMP(CURDATE() - INTERVAL 25 DAY, '08:00:00')
FROM equipamento WHERE numero_serie = 'TC300067890';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'atendimento'),
       TIMESTAMP(CURDATE() - INTERVAL 6 DAY, '13:40:00'),
       NULL,
       'Cliente solicitou orçamento de cabo extra. Aguardando aprovação.',
       TIMESTAMP(CURDATE() - INTERVAL 6 DAY, '13:40:00')
FROM equipamento WHERE numero_serie = 'TC300067890';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'manutencao'),
       TIMESTAMP(CURDATE() - INTERVAL 35 DAY, '13:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 35 DAY, '14:15:00'),
       'Sensor de pressão com leitura instável. Sensor substituído.',
       TIMESTAMP(CURDATE() - INTERVAL 35 DAY, '13:00:00')
FROM equipamento WHERE numero_serie = 'TP400011122';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 9 DAY, '10:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 9 DAY, '10:35:00'),
       'Revisão geral após reclamação do cliente. Nenhum defeito encontrado.',
       TIMESTAMP(CURDATE() - INTERVAL 9 DAY, '10:00:00')
FROM equipamento WHERE numero_serie = 'TP400011122';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'atendimento'),
       TIMESTAMP(CURDATE() - INTERVAL 10 DAY, '10:40:00'),
       TIMESTAMP(CURDATE() - INTERVAL 10 DAY, '11:00:00'),
       'Dúvida de uso sobre emissão de laudos. Orientação por telefone.',
       TIMESTAMP(CURDATE() - INTERVAL 10 DAY, '10:40:00')
FROM equipamento WHERE numero_serie = 'TP400033344';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'suporte'),
       TIMESTAMP(CURDATE() - INTERVAL 0 DAY, '08:15:00'),
       NULL,
       'Equipamento reiniciando sozinho. Técnico a caminho.',
       TIMESTAMP(CURDATE() - INTERVAL 0 DAY, '08:15:00')
FROM equipamento WHERE numero_serie = 'TP400033344';


-- Conferência: atendimentos por responsável
SELECT usuario.nome AS responsavel, perfil.nome AS perfil, COUNT(atendimento.id) AS atendimentos
FROM usuario
JOIN perfil ON perfil.id = usuario.perfil_id
LEFT JOIN atendimento ON atendimento.usuario_id = usuario.id
GROUP BY usuario.id, usuario.nome, perfil.nome
ORDER BY usuario.id;
