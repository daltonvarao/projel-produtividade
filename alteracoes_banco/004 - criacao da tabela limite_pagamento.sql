-- public.limite_pagamento_id_seq definition

-- DROP SEQUENCE public.limite_pagamento_id_seq;

CREATE SEQUENCE public.limite_pagamento_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


CREATE TABLE public.limite_pagamento (
	id serial4 NOT NULL,
    contrato_id int NULL,
	limite decimal(10, 2) NULL
	
);

CREATE UNIQUE INDEX limite_pagamento_pkey ON public.limite_pagamento (id);

ALTER TABLE public.limite_pagamento ADD CONSTRAINT limite_pagamento_fk FOREIGN KEY (id) REFERENCES public.contratos(id);
