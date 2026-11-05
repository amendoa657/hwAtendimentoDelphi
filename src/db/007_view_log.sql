-- View usada pela tela de Log: junta o log com o nome do usuário e do cliente.
-- Rodar uma vez, depois do 006.

USE hwatendimento_v2;

CREATE OR REPLACE VIEW logcomfiltro AS
SELECT
  log.id          AS id,
  log.criado_em   AS data,
  log.usuario_id  AS usuario_id,
  usuario.nome    AS Usuario,
  log.acao        AS Acao,
  log.tabela      AS Tabela,
  cliente.nome    AS Cliente,
  log.detalhe     AS Detalhe
FROM log
JOIN usuario     ON usuario.id = log.usuario_id
LEFT JOIN cliente ON cliente.id = log.cliente_id;

-- Conferência: últimas 20 ações
SELECT * FROM logcomfiltro ORDER BY data DESC LIMIT 20;
