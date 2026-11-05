use hwatendimento_v2;

ALTER TABLE log
	ADD COLUMN cliente_id int DEFAULT NULL,
	ADD KEY ix_log_cliente (cliente_id),
	ADD CONSTRAINT fk_log_cliente FOREIGN KEY (cliente_id) REFERENCES cliente (id) ON DELETE SET NULL;