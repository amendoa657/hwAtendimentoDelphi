-- Dados de teste: clientes, equipamentos (um de cada modelo, com número de série válido)
-- e atendimentos (finalizados e em aberto), com datas recentes.
-- Rodar uma vez, depois do 001 e do 002. Só INSERE dados: não altera nem apaga nada.
--
-- Regra dos números de série (igual ao verificaModelo da tela de registro):
--   EC10... = ECGV6   EC11... = ECGV11   TE... = Ergo13   TC... = ErgoMET13   TP... = ErgoCP

USE hwatendimento_v2;


-- ===== Clientes =====

INSERT INTO cliente (tipo, nome, nome_empresa, telefone) VALUES
  ('F', 'Maria Souza', NULL, '(11) 98765-1001'),
  ('F', 'João Pereira', NULL, '(11) 98765-1002'),
  ('F', 'Ana Lima', NULL, '(19) 99812-1003'),
  ('F', 'Carlos Mendes', NULL, '(21) 99731-1004'),
  ('J', 'Fernanda Rocha', 'Clínica Coração Saudável', '(11) 3456-1005'),
  ('J', 'Roberto Alves', 'Hospital Santa Luzia', '(11) 3321-1006'),
  ('J', 'Patrícia Gomes', 'Laboratório Vida', '(31) 3289-1007'),
  ('J', 'Ricardo Nunes', 'Cardio Center', '(41) 3022-1008');


-- ===== Equipamentos (dono encontrado pelo telefone do cliente) =====

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'ECGV6', 'EC102345671', id FROM cliente WHERE telefone = '(11) 98765-1001';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'ECGV6', 'EC105551203', id FROM cliente WHERE telefone = '(11) 3456-1005';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'ECGV11', 'EC112349876', id FROM cliente WHERE telefone = '(11) 98765-1002';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'ECGV11', 'EC118800452', id FROM cliente WHERE telefone = '(11) 3321-1006';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'Ergo13', 'TE200045871', id FROM cliente WHERE telefone = '(19) 99812-1003';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'Ergo13', 'TE200091234', id FROM cliente WHERE telefone = '(11) 3321-1006';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'ErgoMET13', 'TC300012345', id FROM cliente WHERE telefone = '(31) 3289-1007';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'ErgoMET13', 'TC300067890', id FROM cliente WHERE telefone = '(21) 99731-1004';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'ErgoCP', 'TP400011122', id FROM cliente WHERE telefone = '(41) 3022-1008';

INSERT INTO equipamento (modelo, numero_serie, cliente_id)
SELECT 'ErgoCP', 'TP400033344', id FROM cliente WHERE telefone = '(11) 3456-1005';


-- ===== Atendimentos =====
-- Cliente = dono do equipamento; usuário = admin; data_hora_fim NULL = em aberto.

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 60 DAY, '09:10:00'),
       TIMESTAMP(CURDATE() - INTERVAL 60 DAY, '10:05:00'),
       'Equipamento não ligava. Fonte de alimentação substituída e teste de funcionamento realizado.',
       TIMESTAMP(CURDATE() - INTERVAL 60 DAY, '09:10:00')
FROM equipamento WHERE numero_serie = 'EC102345671';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 12 DAY, '14:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 12 DAY, '14:40:00'),
       'Atualização de software para a versão mais recente e calibração do sinal.',
       TIMESTAMP(CURDATE() - INTERVAL 12 DAY, '14:00:00')
FROM equipamento WHERE numero_serie = 'EC102345671';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 45 DAY, '08:30:00'),
       TIMESTAMP(CURDATE() - INTERVAL 45 DAY, '09:15:00'),
       'Cabo de paciente com mau contato. Cabo substituído.',
       TIMESTAMP(CURDATE() - INTERVAL 45 DAY, '08:30:00')
FROM equipamento WHERE numero_serie = 'EC105551203';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 3 DAY, '10:20:00'),
       NULL,
       'Cliente relata ruído no traçado. Aguardando envio de eletrodos para teste.',
       TIMESTAMP(CURDATE() - INTERVAL 3 DAY, '10:20:00')
FROM equipamento WHERE numero_serie = 'EC105551203';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 30 DAY, '13:15:00'),
       TIMESTAMP(CURDATE() - INTERVAL 30 DAY, '13:50:00'),
       'Instalação do equipamento e treinamento da equipe.',
       TIMESTAMP(CURDATE() - INTERVAL 30 DAY, '13:15:00')
FROM equipamento WHERE numero_serie = 'EC112349876';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 21 DAY, '15:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 21 DAY, '16:30:00'),
       'Impressora térmica travando. Rolete de tração limpo e ajustado.',
       TIMESTAMP(CURDATE() - INTERVAL 21 DAY, '15:00:00')
FROM equipamento WHERE numero_serie = 'EC118800452';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 1 DAY, '09:00:00'),
       NULL,
       'Erro ao exportar exames para o computador. Em análise.',
       TIMESTAMP(CURDATE() - INTERVAL 1 DAY, '09:00:00')
FROM equipamento WHERE numero_serie = 'EC118800452';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
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
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 15 DAY, '11:30:00'),
       TIMESTAMP(CURDATE() - INTERVAL 15 DAY, '12:10:00'),
       'Botão de emergência não respondia. Chave substituída.',
       TIMESTAMP(CURDATE() - INTERVAL 15 DAY, '11:30:00')
FROM equipamento WHERE numero_serie = 'TE200091234';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 40 DAY, '09:45:00'),
       TIMESTAMP(CURDATE() - INTERVAL 40 DAY, '10:30:00'),
       'Configuração de protocolos de teste ergométrico.',
       TIMESTAMP(CURDATE() - INTERVAL 40 DAY, '09:45:00')
FROM equipamento WHERE numero_serie = 'TC300012345';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 5 DAY, '14:20:00'),
       TIMESTAMP(CURDATE() - INTERVAL 5 DAY, '15:05:00'),
       'Cicloergômetro com carga incorreta. Recalibrado.',
       TIMESTAMP(CURDATE() - INTERVAL 5 DAY, '14:20:00')
FROM equipamento WHERE numero_serie = 'TC300012345';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 25 DAY, '08:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 25 DAY, '08:40:00'),
       'Atualização de software e backup dos exames.',
       TIMESTAMP(CURDATE() - INTERVAL 25 DAY, '08:00:00')
FROM equipamento WHERE numero_serie = 'TC300067890';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 35 DAY, '13:00:00'),
       TIMESTAMP(CURDATE() - INTERVAL 35 DAY, '14:15:00'),
       'Sensor de pressão com leitura instável. Sensor substituído.',
       TIMESTAMP(CURDATE() - INTERVAL 35 DAY, '13:00:00')
FROM equipamento WHERE numero_serie = 'TP400011122';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 10 DAY, '10:40:00'),
       TIMESTAMP(CURDATE() - INTERVAL 10 DAY, '11:00:00'),
       'Dúvida de uso sobre emissão de laudos. Orientação por telefone.',
       TIMESTAMP(CURDATE() - INTERVAL 10 DAY, '10:40:00')
FROM equipamento WHERE numero_serie = 'TP400033344';

INSERT INTO atendimento (equipamento_id, cliente_id, usuario_id, data_hora_inicio, data_hora_fim, descricao, criado_em)
SELECT id, cliente_id, (SELECT id FROM usuario WHERE nome = 'admin'),
       TIMESTAMP(CURDATE() - INTERVAL 0 DAY, '08:15:00'),
       NULL,
       'Equipamento reiniciando sozinho. Técnico a caminho.',
       TIMESTAMP(CURDATE() - INTERVAL 0 DAY, '08:15:00')
FROM equipamento WHERE numero_serie = 'TP400033344';


-- Conferência
SELECT 'clientes' AS tabela, COUNT(*) AS total FROM cliente
UNION ALL SELECT 'equipamentos', COUNT(*) FROM equipamento
UNION ALL SELECT 'atendimentos', COUNT(*) FROM atendimento;
