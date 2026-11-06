-- Anexos dos atendimentos: o arquivo fica guardado no próprio banco (LONGBLOB).
-- Tabela separada para que as consultas de atendimento nunca carreguem os arquivos.
-- Rodar uma vez, depois do 007.

USE hwatendimento_v2;

CREATE TABLE atendimento_anexo (
  id int NOT NULL AUTO_INCREMENT,
  atendimento_id int NOT NULL,
  usuario_id int NOT NULL,
  nome_arquivo varchar(255) NOT NULL,
  tamanho_bytes int NOT NULL,
  conteudo longblob NOT NULL,
  criado_em datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY ix_anexo_atendimento (atendimento_id),
  KEY ix_anexo_usuario (usuario_id),
  -- excluir o atendimento apaga os anexos dele junto
  CONSTRAINT fk_anexo_atendimento FOREIGN KEY (atendimento_id) REFERENCES atendimento (id) ON DELETE CASCADE,
  CONSTRAINT fk_anexo_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- O limite de 10 MB por arquivo é conferido no programa. O MySQL 8 aceita
-- até 64 MB por envio (max_allowed_packet), então 10 MB passa com folga.
SHOW VARIABLES LIKE 'max_allowed_packet';
