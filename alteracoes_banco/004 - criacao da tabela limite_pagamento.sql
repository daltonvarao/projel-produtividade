-- public.limite_pagamento_id_seq definition

-- DROP SEQUENCE public.limite_pagamento_id_seq;

CREATE SEQUENCE public.limite_pagamentos_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


CREATE TABLE public.limite_pagamentos (
	id serial4 NOT NULL,
    contrato_id int not NULL,
	limite decimal(10, 2) NULL,
	cargo_id int4 not null
	
);

CREATE UNIQUE INDEX limite_pagamentos_pkey ON public.limite_pagamentos (id);

ALTER TABLE public.limite_pagamentos ADD CONSTRAINT limite_pagamento_contrato_fk FOREIGN KEY (contrato_id) REFERENCES public.contratos(id);
ALTER TABLE public.limite_pagamentos ADD CONSTRAINT limite_pagamento_cargo_fk FOREIGN KEY (cargo_id) REFERENCES public.cargos(id);
