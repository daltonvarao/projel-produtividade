--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: adonis_schema; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.adonis_schema (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    batch integer NOT NULL,
    migration_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.adonis_schema OWNER TO varao;

--
-- Name: adonis_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.adonis_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adonis_schema_id_seq OWNER TO varao;

--
-- Name: adonis_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.adonis_schema_id_seq OWNED BY public.adonis_schema.id;


--
-- Name: api_sync_versions; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.api_sync_versions (
    id integer NOT NULL,
    request_url character varying(255),
    request_method character varying(255),
    contrato_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.api_sync_versions OWNER TO varao;

--
-- Name: api_sync_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.api_sync_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_sync_versions_id_seq OWNER TO varao;

--
-- Name: api_sync_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.api_sync_versions_id_seq OWNED BY public.api_sync_versions.id;


--
-- Name: api_tokens; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.api_tokens (
    id integer NOT NULL,
    user_id integer,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    expires_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.api_tokens OWNER TO varao;

--
-- Name: api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_tokens_id_seq OWNER TO varao;

--
-- Name: api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.api_tokens_id_seq OWNED BY public.api_tokens.id;


--
-- Name: areas; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    nome character varying(255),
    contrato_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.areas OWNER TO varao;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO varao;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: atividade_cargo_valores; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.atividade_cargo_valores (
    id integer NOT NULL,
    cargo_id integer,
    atividade_id integer,
    valor_unitario numeric(8,2) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.atividade_cargo_valores OWNER TO varao;

--
-- Name: atividade_cargo_valores_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.atividade_cargo_valores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atividade_cargo_valores_id_seq OWNER TO varao;

--
-- Name: atividade_cargo_valores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.atividade_cargo_valores_id_seq OWNED BY public.atividade_cargo_valores.id;


--
-- Name: atividade_rdo_users; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.atividade_rdo_users (
    id integer NOT NULL,
    quantidade numeric(8,2),
    quantidade_inicial numeric(8,2),
    quantidade_final numeric(8,2),
    rdo_id integer,
    user_id integer,
    atividade_id integer,
    contrato_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.atividade_rdo_users OWNER TO varao;

--
-- Name: atividade_rdo_users_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.atividade_rdo_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atividade_rdo_users_id_seq OWNER TO varao;

--
-- Name: atividade_rdo_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.atividade_rdo_users_id_seq OWNED BY public.atividade_rdo_users.id;


--
-- Name: atividade_rdos; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.atividade_rdos (
    id integer NOT NULL,
    quantidade numeric(8,2),
    quantidade_inicial numeric(8,2),
    quantidade_final numeric(8,2),
    hora_inicio timestamp with time zone NOT NULL,
    hora_fim timestamp with time zone NOT NULL,
    atividade_id integer,
    rdo_id integer,
    furo_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.atividade_rdos OWNER TO varao;

--
-- Name: atividade_rdos_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.atividade_rdos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atividade_rdos_id_seq OWNER TO varao;

--
-- Name: atividade_rdos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.atividade_rdos_id_seq OWNED BY public.atividade_rdos.id;


--
-- Name: atividades; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.atividades (
    id integer NOT NULL,
    descricao character varying(255),
    tipo text,
    unidade_medida text,
    contrato_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT atividades_tipo_check CHECK ((tipo = ANY (ARRAY['produtiva'::text, 'improdutiva'::text, 'parada'::text]))),
    CONSTRAINT atividades_unidade_medida_check CHECK ((unidade_medida = ANY (ARRAY['metros'::text, 'unidades'::text])))
);


ALTER TABLE public.atividades OWNER TO varao;

--
-- Name: atividades_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.atividades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atividades_id_seq OWNER TO varao;

--
-- Name: atividades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.atividades_id_seq OWNED BY public.atividades.id;


--
-- Name: cargo_permissions; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.cargo_permissions (
    id integer NOT NULL,
    cargo_id integer,
    name character varying(255),
    can_create boolean,
    can_read boolean,
    can_update boolean,
    can_delete boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.cargo_permissions OWNER TO varao;

--
-- Name: cargo_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.cargo_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargo_permissions_id_seq OWNER TO varao;

--
-- Name: cargo_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.cargo_permissions_id_seq OWNED BY public.cargo_permissions.id;


--
-- Name: cargos; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.cargos (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    contrato_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.cargos OWNER TO varao;

--
-- Name: cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.cargos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cargos_id_seq OWNER TO varao;

--
-- Name: cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.cargos_id_seq OWNED BY public.cargos.id;


--
-- Name: complexos; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.complexos (
    id integer NOT NULL,
    nome character varying(255),
    contrato_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.complexos OWNER TO varao;

--
-- Name: complexos_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.complexos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.complexos_id_seq OWNER TO varao;

--
-- Name: complexos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.complexos_id_seq OWNED BY public.complexos.id;


--
-- Name: contratos; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.contratos (
    id integer NOT NULL,
    centro_custo integer NOT NULL,
    descricao character varying(255) NOT NULL,
    numero character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.contratos OWNER TO varao;

--
-- Name: contratos_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.contratos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratos_id_seq OWNER TO varao;

--
-- Name: contratos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.contratos_id_seq OWNED BY public.contratos.id;


--
-- Name: equipamento_rdos; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.equipamento_rdos (
    id integer NOT NULL,
    quantidade numeric(8,2),
    rdo_id integer,
    equipamento_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.equipamento_rdos OWNER TO varao;

--
-- Name: equipamento_rdos_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.equipamento_rdos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipamento_rdos_id_seq OWNER TO varao;

--
-- Name: equipamento_rdos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.equipamento_rdos_id_seq OWNED BY public.equipamento_rdos.id;


--
-- Name: equipamentos; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.equipamentos (
    id integer NOT NULL,
    tag character varying(255) NOT NULL,
    descricao character varying(255),
    sonda boolean DEFAULT false,
    contrato_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.equipamentos OWNER TO varao;

--
-- Name: equipamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.equipamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipamentos_id_seq OWNER TO varao;

--
-- Name: equipamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.equipamentos_id_seq OWNED BY public.equipamentos.id;


--
-- Name: estruturas; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.estruturas (
    id integer NOT NULL,
    nome character varying(255),
    contrato_id integer,
    mina_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.estruturas OWNER TO varao;

--
-- Name: estruturas_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.estruturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estruturas_id_seq OWNER TO varao;

--
-- Name: estruturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.estruturas_id_seq OWNED BY public.estruturas.id;


--
-- Name: furos; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.furos (
    id integer NOT NULL,
    nome character varying(255),
    contrato_id integer,
    estrutura_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.furos OWNER TO varao;

--
-- Name: furos_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.furos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.furos_id_seq OWNER TO varao;

--
-- Name: furos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.furos_id_seq OWNED BY public.furos.id;


--
-- Name: minas; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.minas (
    id integer NOT NULL,
    nome character varying(255),
    contrato_id integer,
    complexo_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.minas OWNER TO varao;

--
-- Name: minas_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.minas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minas_id_seq OWNER TO varao;

--
-- Name: minas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.minas_id_seq OWNED BY public.minas.id;


--
-- Name: rdo_users; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.rdo_users (
    id integer NOT NULL,
    rdo_id integer,
    user_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.rdo_users OWNER TO varao;

--
-- Name: rdo_users_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.rdo_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rdo_users_id_seq OWNER TO varao;

--
-- Name: rdo_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.rdo_users_id_seq OWNED BY public.rdo_users.id;


--
-- Name: rdos; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.rdos (
    id integer NOT NULL,
    nome character varying(255),
    data date,
    status text DEFAULT 'andamento'::text,
    condicoes_tempo text DEFAULT 'bom'::text,
    pluviometria numeric(8,2) DEFAULT '0'::numeric,
    user_id integer,
    equipamento_id integer,
    estrutura_id integer,
    contrato_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT rdos_condicoes_tempo_check CHECK ((condicoes_tempo = ANY (ARRAY['bom'::text, 'chuvoso'::text]))),
    CONSTRAINT rdos_status_check CHECK ((status = ANY (ARRAY['andamento'::text, 'finalizado'::text])))
);


ALTER TABLE public.rdos OWNER TO varao;

--
-- Name: rdos_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.rdos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rdos_id_seq OWNER TO varao;

--
-- Name: rdos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.rdos_id_seq OWNED BY public.rdos.id;


--
-- Name: user_logs; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.user_logs (
    id integer NOT NULL,
    ip character varying(255),
    route character varying(255),
    url character varying(255),
    method character varying(255),
    user_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.user_logs OWNER TO varao;

--
-- Name: user_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.user_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_logs_id_seq OWNER TO varao;

--
-- Name: user_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.user_logs_id_seq OWNED BY public.user_logs.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: varao
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    cpf character varying(255) NOT NULL,
    password character varying(180) NOT NULL,
    remember_me_token character varying(255),
    cargo_id integer NOT NULL,
    contrato_id integer,
    banco character varying(255) NOT NULL,
    agencia character varying(255) NOT NULL,
    conta character varying(255) NOT NULL,
    operacao_caixa character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO varao;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: varao
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO varao;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: varao
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: adonis_schema id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.adonis_schema ALTER COLUMN id SET DEFAULT nextval('public.adonis_schema_id_seq'::regclass);


--
-- Name: api_sync_versions id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.api_sync_versions ALTER COLUMN id SET DEFAULT nextval('public.api_sync_versions_id_seq'::regclass);


--
-- Name: api_tokens id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.api_tokens ALTER COLUMN id SET DEFAULT nextval('public.api_tokens_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: atividade_cargo_valores id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_cargo_valores ALTER COLUMN id SET DEFAULT nextval('public.atividade_cargo_valores_id_seq'::regclass);


--
-- Name: atividade_rdo_users id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdo_users ALTER COLUMN id SET DEFAULT nextval('public.atividade_rdo_users_id_seq'::regclass);


--
-- Name: atividade_rdos id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdos ALTER COLUMN id SET DEFAULT nextval('public.atividade_rdos_id_seq'::regclass);


--
-- Name: atividades id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividades ALTER COLUMN id SET DEFAULT nextval('public.atividades_id_seq'::regclass);


--
-- Name: cargo_permissions id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.cargo_permissions ALTER COLUMN id SET DEFAULT nextval('public.cargo_permissions_id_seq'::regclass);


--
-- Name: cargos id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.cargos ALTER COLUMN id SET DEFAULT nextval('public.cargos_id_seq'::regclass);


--
-- Name: complexos id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.complexos ALTER COLUMN id SET DEFAULT nextval('public.complexos_id_seq'::regclass);


--
-- Name: contratos id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.contratos ALTER COLUMN id SET DEFAULT nextval('public.contratos_id_seq'::regclass);


--
-- Name: equipamento_rdos id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.equipamento_rdos ALTER COLUMN id SET DEFAULT nextval('public.equipamento_rdos_id_seq'::regclass);


--
-- Name: equipamentos id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.equipamentos ALTER COLUMN id SET DEFAULT nextval('public.equipamentos_id_seq'::regclass);


--
-- Name: estruturas id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.estruturas ALTER COLUMN id SET DEFAULT nextval('public.estruturas_id_seq'::regclass);


--
-- Name: furos id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.furos ALTER COLUMN id SET DEFAULT nextval('public.furos_id_seq'::regclass);


--
-- Name: minas id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.minas ALTER COLUMN id SET DEFAULT nextval('public.minas_id_seq'::regclass);


--
-- Name: rdo_users id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdo_users ALTER COLUMN id SET DEFAULT nextval('public.rdo_users_id_seq'::regclass);


--
-- Name: rdos id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdos ALTER COLUMN id SET DEFAULT nextval('public.rdos_id_seq'::regclass);


--
-- Name: user_logs id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.user_logs ALTER COLUMN id SET DEFAULT nextval('public.user_logs_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: adonis_schema; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.adonis_schema (id, name, batch, migration_time) FROM stdin;
20	database/migrations/1587988322388_contratos	1	2021-05-12 13:35:14.054504+00
21	database/migrations/1587988331388_cargos	1	2021-05-12 13:35:14.079604+00
22	database/migrations/1587988332388_users	1	2021-05-12 13:35:14.090408+00
23	database/migrations/1592489784670_api_tokens	1	2021-05-12 13:35:14.102957+00
24	database/migrations/1611757596942_equipamentos	1	2021-05-12 13:35:14.113485+00
25	database/migrations/1611757702704_atividades	1	2021-05-12 13:35:14.123898+00
26	database/migrations/1611778739900_api_sync_versions	1	2021-05-12 13:35:14.13466+00
27	database/migrations/1613267718988_atividade_cargos_valores	1	2021-05-12 13:35:14.145243+00
28	database/migrations/1615920549891_cargo_permissions	1	2021-05-12 13:35:14.155446+00
29	database/migrations/1617026444983_areas	1	2021-05-12 13:35:14.168107+00
30	database/migrations/1618922538651_complexos	1	2021-05-12 13:35:14.176545+00
31	database/migrations/1618922543646_minas	1	2021-05-12 13:35:14.184791+00
32	database/migrations/1618922549339_estruturas	1	2021-05-12 13:35:14.194491+00
33	database/migrations/1618922551083_furos	1	2021-05-12 13:35:14.204185+00
34	database/migrations/1619757884044_rdos	1	2021-05-12 13:35:14.213607+00
35	database/migrations/1620159215120_atividade_rdos	1	2021-05-12 13:35:14.23877+00
36	database/migrations/1621390879546_rdo_users	1	2021-05-12 13:35:14.255062+00
37	database/migrations/1621405917632_equipamento_rdos	1	2021-05-12 13:35:14.268008+00
38	database/migrations/1622604859304_atividade_rdo_users	1	2021-05-12 13:35:14.282733+00
39	database/migrations/1621000001757_user_logs	2	2021-05-28 05:17:30.6543+00
\.


--
-- Data for Name: api_sync_versions; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.api_sync_versions (id, request_url, request_method, contrato_id, created_at, updated_at) FROM stdin;
1	/admin/cargos	POST	\N	2021-05-12 13:36:53.268+00	2021-05-12 13:36:53.268+00
2	/admin/users/1	PUT	\N	2021-05-12 13:37:06.463+00	2021-05-12 13:37:06.463+00
3	/admin/cargos/1	DELETE	\N	2021-05-12 13:37:43.734+00	2021-05-12 13:37:43.734+00
4	/admin/cargos/2	PUT	\N	2021-05-12 13:37:52.962+00	2021-05-12 13:37:52.962+00
5	/admin/cargos	POST	\N	2021-05-12 13:38:23.662+00	2021-05-12 13:38:23.662+00
6	/admin/users	POST	\N	2021-05-12 13:38:56.929+00	2021-05-12 13:38:56.929+00
7	/admin/contratos	POST	\N	2021-05-12 13:39:12.717+00	2021-05-12 13:39:12.717+00
8	/admin/configuracoes	POST	\N	2021-05-12 13:39:19.971+00	2021-05-12 13:39:19.971+00
9	/admin/configuracoes	POST	1	2021-05-12 13:39:56.605+00	2021-05-12 13:39:56.605+00
10	/admin/cargos/3	PUT	1	2021-05-12 13:40:39.475+00	2021-05-12 13:40:39.475+00
11	/admin/cargos	POST	1	2021-05-12 13:41:14.286+00	2021-05-12 13:41:14.286+00
12	/admin/cargos	POST	1	2021-05-12 13:41:28.987+00	2021-05-12 13:41:28.987+00
13	/admin/users	POST	1	2021-05-12 13:41:53.892+00	2021-05-12 13:41:53.892+00
14	/admin/users	POST	1	2021-05-12 13:42:27.686+00	2021-05-12 13:42:27.686+00
15	/admin/cargos/3	DELETE	\N	2021-05-12 13:46:35.435+00	2021-05-12 13:46:35.435+00
16	/admin/configuracoes	POST	\N	2021-05-12 13:47:08.68+00	2021-05-12 13:47:08.68+00
17	/admin/atividades	POST	1	2021-05-12 13:47:47.493+00	2021-05-12 13:47:47.493+00
18	/admin/atividades	POST	1	2021-05-12 13:52:56.117+00	2021-05-12 13:52:56.117+00
19	/admin/equipamentos	POST	1	2021-05-12 13:53:09.842+00	2021-05-12 13:53:09.842+00
20	/admin/equipamentos	POST	1	2021-05-12 13:53:38.272+00	2021-05-12 13:53:38.272+00
21	/admin/atividades	POST	1	2021-05-12 13:54:15.374+00	2021-05-12 13:54:15.374+00
22	/admin/configuracoes	POST	\N	2021-05-13 22:02:50.381+00	2021-05-13 22:02:50.381+00
23	/admin/atividades	POST	1	2021-05-13 22:02:59.852+00	2021-05-13 22:02:59.852+00
24	/admin/atividades/4	DELETE	1	2021-05-13 22:03:46.333+00	2021-05-13 22:03:46.333+00
25	/admin/areas/complexos	POST	1	2021-05-13 22:22:13.612+00	2021-05-13 22:22:13.612+00
26	/admin/areas/minas	POST	1	2021-05-13 22:22:23.53+00	2021-05-13 22:22:23.53+00
27	/admin/areas/estruturas	POST	1	2021-05-13 22:22:33.155+00	2021-05-13 22:22:33.155+00
28	/admin/areas/furos	POST	1	2021-05-13 22:22:42.366+00	2021-05-13 22:22:42.366+00
29	/admin/areas/estruturas/1	PUT	1	2021-05-13 22:22:50.896+00	2021-05-13 22:22:50.896+00
30	/admin/areas/furos/1	PUT	1	2021-05-13 22:26:25.08+00	2021-05-13 22:26:25.08+00
31	/admin/equipamentos	POST	1	2021-05-13 22:30:31.771+00	2021-05-13 22:30:31.771+00
32	/admin/configuracoes	POST	\N	2021-05-28 11:32:30.876+00	2021-05-28 11:32:30.876+00
33	/admin/configuracoes	POST	\N	2021-05-28 11:39:27.454+00	2021-05-28 11:39:27.454+00
34	/admin/cargos	POST	1	2021-05-28 11:39:42.154+00	2021-05-28 11:39:42.154+00
35	/admin/cargos	POST	1	2021-05-28 11:39:56.803+00	2021-05-28 11:39:56.803+00
36	/admin/users/2	PUT	1	2021-05-28 11:40:17.364+00	2021-05-28 11:40:17.364+00
37	/admin/users/3	PUT	1	2021-05-28 11:40:36.642+00	2021-05-28 11:40:36.642+00
38	/admin/cargos/5	DELETE	1	2021-05-28 11:40:50.336+00	2021-05-28 11:40:50.336+00
39	/admin/cargos/4	DELETE	1	2021-05-28 11:40:54.476+00	2021-05-28 11:40:54.476+00
40	/admin/cargos/6	PUT	1	2021-05-28 11:41:01.237+00	2021-05-28 11:41:01.237+00
41	/admin/cargos/7	PUT	1	2021-05-28 11:41:08.092+00	2021-05-28 11:41:08.092+00
42	/admin/atividades/2	PUT	1	2021-05-28 11:43:42.509+00	2021-05-28 11:43:42.509+00
43	/admin/atividades/1	PUT	1	2021-05-28 11:44:07.782+00	2021-05-28 11:44:07.782+00
44	/admin/rdos/1/atividades	POST	1	2021-05-28 11:46:50.313+00	2021-05-28 11:46:50.313+00
45	/admin/rdos/1/atividades/3	DELETE	1	2021-05-28 11:47:06.177+00	2021-05-28 11:47:06.177+00
46	/admin/rdos/1/atividades/4	DELETE	1	2021-05-28 12:17:13.29+00	2021-05-28 12:17:13.29+00
47	/admin/configuracoes	POST	\N	2021-05-28 12:25:04.167+00	2021-05-28 12:25:04.167+00
48	/admin/atividades	POST	1	2021-05-28 12:27:09.483+00	2021-05-28 12:27:09.483+00
49	/admin/cargos	POST	1	2021-05-28 12:36:37.031+00	2021-05-28 12:36:37.031+00
50	/admin/users	POST	1	2021-05-28 12:38:28.856+00	2021-05-28 12:38:28.856+00
51	/admin/contratos	POST	1	2021-05-28 12:42:10.83+00	2021-05-28 12:42:10.83+00
52	/admin/contratos	POST	1	2021-05-28 12:42:17.61+00	2021-05-28 12:42:17.61+00
53	/admin/configuracoes	POST	1	2021-05-28 12:42:46.896+00	2021-05-28 12:42:46.896+00
54	/admin/configuracoes	POST	2	2021-05-28 12:43:15.697+00	2021-05-28 12:43:15.697+00
55	/admin/areas/complexos/1	PUT	1	2021-05-28 12:54:42.128+00	2021-05-28 12:54:42.128+00
56	/admin/rdos/1/atividades	POST	1	2021-06-01 14:08:58.697+00	2021-06-01 14:08:58.697+00
57	/admin/users/1	PUT	\N	2021-06-01 18:41:53.645+00	2021-06-01 18:41:53.645+00
58	/admin/contratos/1	PUT	\N	2021-06-01 18:47:24.619+00	2021-06-01 18:47:24.619+00
59	/admin/areas/complexos	POST	\N	2021-06-01 18:47:57.987+00	2021-06-01 18:47:57.987+00
60	/admin/areas/complexos/2	PUT	\N	2021-06-01 18:48:10.545+00	2021-06-01 18:48:10.545+00
61	/admin/areas/minas	POST	\N	2021-06-01 18:48:25.345+00	2021-06-01 18:48:25.345+00
62	/admin/areas/estruturas	POST	\N	2021-06-01 18:48:38.382+00	2021-06-01 18:48:38.382+00
63	/admin/areas/furos	POST	\N	2021-06-01 18:48:51.474+00	2021-06-01 18:48:51.474+00
64	/admin/equipamentos	POST	\N	2021-06-01 18:49:53.58+00	2021-06-01 18:49:53.58+00
65	/admin/contratos/1	PUT	\N	2021-06-01 18:50:15.66+00	2021-06-01 18:50:15.66+00
66	/admin/equipamentos	POST	\N	2021-06-01 18:50:24.476+00	2021-06-01 18:50:24.476+00
67	/admin/equipamentos	POST	\N	2021-06-01 18:51:10.245+00	2021-06-01 18:51:10.245+00
68	/admin/equipamentos	POST	\N	2021-06-01 18:52:01.134+00	2021-06-01 18:52:01.134+00
69	/admin/configuracoes	POST	\N	2021-06-01 18:54:40.411+00	2021-06-01 18:54:40.411+00
70	/admin/configuracoes	POST	\N	2021-06-01 18:56:24.886+00	2021-06-01 18:56:24.886+00
71	/admin/equipamentos	POST	1	2021-06-01 18:56:35.804+00	2021-06-01 18:56:35.804+00
72	/admin/equipamentos/1	PUT	1	2021-06-01 18:56:52.983+00	2021-06-01 18:56:52.983+00
73	/admin/equipamentos/3	DELETE	1	2021-06-01 18:56:59.991+00	2021-06-01 18:56:59.991+00
74	/admin/equipamentos/2	PUT	1	2021-06-01 18:57:20.113+00	2021-06-01 18:57:20.113+00
75	/admin/users	POST	1	2021-06-01 18:59:23.049+00	2021-06-01 18:59:23.049+00
76	/admin/users	POST	1	2021-06-01 18:59:44.091+00	2021-06-01 18:59:44.091+00
77	/admin/users	POST	1	2021-06-01 18:59:52.206+00	2021-06-01 18:59:52.206+00
78	/admin/configuracoes	POST	1	2021-06-01 18:59:59.318+00	2021-06-01 18:59:59.318+00
79	/admin/configuracoes	POST	1	2021-06-01 19:00:03.01+00	2021-06-01 19:00:03.01+00
80	/admin/areas/complexos/2	DELETE	\N	2021-06-01 19:00:36.566+00	2021-06-01 19:00:36.566+00
81	/admin/users/5	PUT	1	2021-06-01 19:01:41.545+00	2021-06-01 19:01:41.545+00
82	/admin/users/5	PUT	1	2021-06-01 19:01:58.564+00	2021-06-01 19:01:58.564+00
83	/admin/areas/complexos/1	PUT	1	2021-06-01 19:02:50.684+00	2021-06-01 19:02:50.684+00
84	/admin/areas/minas/1	PUT	1	2021-06-01 19:03:09.553+00	2021-06-01 19:03:09.553+00
85	/admin/areas/estruturas/1	PUT	1	2021-06-01 19:03:19.323+00	2021-06-01 19:03:19.323+00
86	/admin/areas/furos/2	DELETE	1	2021-06-01 19:03:23.831+00	2021-06-01 19:03:23.831+00
87	/admin/areas/furos/1	PUT	1	2021-06-01 19:03:33.998+00	2021-06-01 19:03:33.998+00
88	/admin/rdos/2	DELETE	1	2021-06-01 19:06:44.155+00	2021-06-01 19:06:44.155+00
89	/admin/rdos/1	DELETE	1	2021-06-01 19:06:46.432+00	2021-06-01 19:06:46.432+00
90	/admin/configuracoes	POST	\N	2021-06-01 19:06:58.776+00	2021-06-01 19:06:58.776+00
91	/admin/atividades/2	PUT	1	2021-06-01 19:16:39.472+00	2021-06-01 19:16:39.472+00
92	/admin/atividades/2	PUT	1	2021-06-01 19:16:48.507+00	2021-06-01 19:16:48.507+00
93	/admin/atividades/5	PUT	1	2021-06-01 19:16:59.592+00	2021-06-01 19:16:59.594+00
94	/admin/atividades/5	PUT	1	2021-06-01 19:17:06.211+00	2021-06-01 19:17:06.211+00
95	/admin/configuracoes	POST	\N	2021-06-04 18:23:33.144+00	2021-06-04 18:23:33.145+00
96	/admin/configuracoes	POST	1	2021-06-04 18:23:39.135+00	2021-06-04 18:23:39.135+00
97	/admin/configuracoes	POST	\N	2021-06-15 19:02:33.405+00	2021-06-15 19:02:33.405+00
98	/admin/contratos/2	PUT	\N	2021-06-17 11:33:56.868+00	2021-06-17 11:33:56.868+00
99	/admin/cargos	POST	\N	2021-06-17 11:42:38.519+00	2021-06-17 11:42:38.519+00
100	/admin/cargos/2	PUT	\N	2021-06-17 11:42:55.44+00	2021-06-17 11:42:55.44+00
101	/admin/users	POST	\N	2021-06-17 11:45:13.014+00	2021-06-17 11:45:13.014+00
102	/admin/users	POST	\N	2021-06-18 11:44:56.177+00	2021-06-18 11:44:56.177+00
103	/admin/contratos/1	PUT	\N	2021-06-18 11:45:13.878+00	2021-06-18 11:45:13.878+00
104	/admin/contratos/1	PUT	\N	2021-06-18 11:45:50.037+00	2021-06-18 11:45:50.037+00
105	/admin/areas/complexos	POST	\N	2021-06-18 11:46:13.183+00	2021-06-18 11:46:13.183+00
106	/admin/areas/minas	POST	\N	2021-06-18 11:46:26.489+00	2021-06-18 11:46:26.489+00
107	/admin/areas/estruturas	POST	\N	2021-06-18 11:46:36.855+00	2021-06-18 11:46:36.855+00
108	/admin/areas/estruturas	POST	\N	2021-06-18 11:46:47.226+00	2021-06-18 11:46:47.226+00
109	/admin/areas/estruturas	POST	\N	2021-06-18 11:46:56.108+00	2021-06-18 11:46:56.108+00
110	/admin/areas/estruturas	POST	\N	2021-06-18 11:47:05.467+00	2021-06-18 11:47:05.467+00
111	/admin/areas/furos	POST	\N	2021-06-18 11:47:17.71+00	2021-06-18 11:47:17.71+00
112	/admin/areas/furos/4	PUT	\N	2021-06-18 11:47:29.796+00	2021-06-18 11:47:29.796+00
113	/admin/cargos	POST	\N	2021-06-18 11:48:40.495+00	2021-06-18 11:48:40.495+00
114	/admin/users	POST	\N	2021-06-18 11:49:21.96+00	2021-06-18 11:49:21.96+00
115	/admin/configuracoes	POST	\N	2021-06-18 11:49:33.086+00	2021-06-18 11:49:33.086+00
116	/admin/configuracoes	POST	\N	2021-06-18 13:34:26.436+00	2021-06-18 13:34:26.436+00
117	/admin/configuracoes	POST	\N	2021-06-18 14:27:56.959+00	2021-06-18 14:27:56.959+00
118	/admin/cargos	POST	2	2021-06-18 14:29:54.277+00	2021-06-18 14:29:54.277+00
119	/admin/cargos/11	PUT	2	2021-06-18 14:30:22.01+00	2021-06-18 14:30:22.01+00
120	/admin/cargos	POST	2	2021-06-18 14:33:05.233+00	2021-06-18 14:33:05.233+00
121	/admin/cargos	POST	2	2021-06-18 14:33:19.543+00	2021-06-18 14:33:19.543+00
122	/admin/cargos	POST	2	2021-06-18 14:33:42.687+00	2021-06-18 14:33:42.687+00
123	/admin/cargos	POST	2	2021-06-18 14:34:14.157+00	2021-06-18 14:34:14.157+00
124	/admin/cargos	POST	2	2021-06-18 14:34:26.193+00	2021-06-18 14:34:26.193+00
125	/admin/cargos	POST	2	2021-06-18 14:34:59.884+00	2021-06-18 14:34:59.884+00
126	/admin/cargos	POST	2	2021-06-18 14:35:23.063+00	2021-06-18 14:35:23.063+00
127	/admin/cargos	POST	2	2021-06-18 14:36:27.708+00	2021-06-18 14:36:27.709+00
128	/admin/cargos	POST	2	2021-06-18 14:36:57.687+00	2021-06-18 14:36:57.687+00
129	/admin/cargos	POST	2	2021-06-18 14:37:30.038+00	2021-06-18 14:37:30.038+00
130	/admin/cargos	POST	2	2021-06-18 14:37:41.661+00	2021-06-18 14:37:41.661+00
131	/admin/cargos	POST	2	2021-06-18 14:38:16.882+00	2021-06-18 14:38:16.882+00
132	/admin/cargos	POST	2	2021-06-18 14:38:41.147+00	2021-06-18 14:38:41.147+00
133	/admin/cargos	POST	2	2021-06-18 14:42:53.667+00	2021-06-18 14:42:53.667+00
134	/admin/users	POST	2	2021-06-18 14:43:45.717+00	2021-06-18 14:43:45.717+00
135	/admin/users	POST	2	2021-06-18 14:44:26.024+00	2021-06-18 14:44:26.024+00
136	/admin/users	POST	2	2021-06-18 14:44:54.05+00	2021-06-18 14:44:54.05+00
137	/admin/users	POST	2	2021-06-18 14:46:42.082+00	2021-06-18 14:46:42.082+00
138	/admin/configuracoes	POST	\N	2021-06-18 14:51:43.085+00	2021-06-18 14:51:43.085+00
139	/admin/users/6	PUT	2	2021-06-18 14:52:10.967+00	2021-06-18 14:52:10.967+00
140	/admin/users	POST	2	2021-06-18 15:35:36.292+00	2021-06-18 15:35:36.292+00
141	/admin/users	POST	2	2021-06-18 15:44:05.948+00	2021-06-18 15:44:05.948+00
142	/admin/configuracoes	POST	2	2021-06-18 15:44:48.073+00	2021-06-18 15:44:48.073+00
143	/admin/configuracoes	POST	1	2021-06-18 15:45:49.048+00	2021-06-18 15:45:49.048+00
144	/admin/equipamentos	POST	2	2021-06-18 15:47:24.801+00	2021-06-18 15:47:24.801+00
145	/admin/equipamentos	POST	2	2021-06-18 15:47:48.616+00	2021-06-18 15:47:48.616+00
146	/admin/equipamentos	POST	2	2021-06-18 15:48:18.069+00	2021-06-18 15:48:18.069+00
147	/admin/equipamentos	POST	2	2021-06-18 15:48:33.877+00	2021-06-18 15:48:33.877+00
148	/admin/equipamentos	POST	2	2021-06-18 15:48:52.102+00	2021-06-18 15:48:52.102+00
149	/admin/equipamentos	POST	2	2021-06-18 15:49:11.048+00	2021-06-18 15:49:11.048+00
150	/admin/equipamentos	POST	2	2021-06-18 15:49:23.117+00	2021-06-18 15:49:23.117+00
151	/admin/equipamentos	POST	2	2021-06-18 15:49:23.138+00	2021-06-18 15:49:23.138+00
152	/admin/equipamentos	POST	2	2021-06-18 15:49:51.663+00	2021-06-18 15:49:51.663+00
153	/admin/equipamentos	POST	2	2021-06-18 15:50:06.471+00	2021-06-18 15:50:06.471+00
154	/admin/equipamentos	POST	2	2021-06-18 15:50:21.034+00	2021-06-18 15:50:21.034+00
155	/admin/equipamentos	POST	2	2021-06-18 15:50:58.438+00	2021-06-18 15:50:58.438+00
156	/admin/equipamentos	POST	2	2021-06-18 15:51:14.193+00	2021-06-18 15:51:14.193+00
157	/admin/equipamentos	POST	2	2021-06-18 15:51:30.409+00	2021-06-18 15:51:30.409+00
158	/admin/equipamentos/8	PUT	2	2021-06-18 15:52:20.767+00	2021-06-18 15:52:20.767+00
159	/admin/equipamentos	POST	2	2021-06-18 15:54:40.793+00	2021-06-18 15:54:40.793+00
160	/admin/equipamentos	POST	2	2021-06-18 15:55:43.098+00	2021-06-18 15:55:43.098+00
161	/admin/equipamentos/18	PUT	2	2021-06-18 15:55:53.795+00	2021-06-18 15:55:53.795+00
162	/admin/equipamentos	POST	2	2021-06-18 15:56:43.691+00	2021-06-18 15:56:43.691+00
163	/admin/equipamentos	POST	2	2021-06-18 15:56:55.362+00	2021-06-18 15:56:55.362+00
164	/admin/equipamentos	POST	2	2021-06-18 15:58:47.916+00	2021-06-18 15:58:47.916+00
165	/admin/equipamentos	POST	2	2021-06-18 15:59:09.323+00	2021-06-18 15:59:09.323+00
166	/admin/equipamentos	POST	2	2021-06-18 16:00:31.847+00	2021-06-18 16:00:31.847+00
167	/admin/equipamentos	POST	2	2021-06-18 16:00:52.987+00	2021-06-18 16:00:52.987+00
168	/admin/equipamentos	POST	2	2021-06-18 16:01:19.619+00	2021-06-18 16:01:19.619+00
169	/admin/configuracoes	POST	2	2021-06-18 16:02:09.09+00	2021-06-18 16:02:09.09+00
170	/admin/configuracoes	POST	1	2021-06-18 16:03:22.002+00	2021-06-18 16:03:22.002+00
171	/admin/atividades	POST	2	2021-06-18 16:06:15.536+00	2021-06-18 16:06:15.536+00
172	/admin/atividades	POST	2	2021-06-18 16:09:18.58+00	2021-06-18 16:09:18.58+00
173	/admin/cargos	POST	2	2021-06-18 16:16:51.153+00	2021-06-18 16:16:51.153+00
174	/admin/atividades	POST	2	2021-06-18 16:37:17.393+00	2021-06-18 16:37:17.393+00
175	/admin/configuracoes	POST	2	2021-06-18 16:39:19.926+00	2021-06-18 16:39:19.926+00
176	/admin/configuracoes	POST	1	2021-06-18 16:49:43.92+00	2021-06-18 16:49:43.92+00
177	/admin/atividades	POST	2	2021-06-18 16:52:47.246+00	2021-06-18 16:52:47.247+00
178	/admin/atividades	POST	2	2021-06-18 16:59:24.1+00	2021-06-18 16:59:24.1+00
179	/admin/atividades	POST	2	2021-06-18 16:59:45.218+00	2021-06-18 16:59:45.218+00
180	/admin/atividades/9	DELETE	2	2021-06-18 16:59:58.217+00	2021-06-18 16:59:58.217+00
181	/admin/configuracoes	POST	2	2021-06-18 17:58:44.653+00	2021-06-18 17:58:44.653+00
182	/admin/configuracoes	POST	1	2021-06-18 17:59:34.992+00	2021-06-18 17:59:34.992+00
183	/admin/configuracoes	POST	2	2021-06-18 18:00:13.489+00	2021-06-18 18:00:13.489+00
184	/admin/configuracoes	POST	1	2021-06-18 18:00:38.537+00	2021-06-18 18:00:38.537+00
185	/admin/atividades/8	PUT	2	2021-06-18 18:04:21.015+00	2021-06-18 18:04:21.015+00
186	/admin/atividades/8	PUT	2	2021-06-18 19:08:20.894+00	2021-06-18 19:08:20.894+00
187	/admin/areas/estruturas	POST	2	2021-06-18 19:10:12.579+00	2021-06-18 19:10:12.579+00
188	/admin/users	POST	2	2021-06-18 19:16:09.607+00	2021-06-18 19:16:09.607+00
189	/admin/users	POST	2	2021-06-18 19:16:40.335+00	2021-06-18 19:16:40.335+00
190	/admin/users	POST	2	2021-06-18 19:18:24.04+00	2021-06-18 19:18:24.04+00
191	/admin/users	POST	2	2021-06-18 19:21:17.57+00	2021-06-18 19:21:17.57+00
192	/admin/users/11	PUT	2	2021-06-18 19:22:37.819+00	2021-06-18 19:22:37.819+00
193	/admin/users	POST	2	2021-06-18 19:25:00.929+00	2021-06-18 19:25:00.929+00
194	/admin/users	POST	2	2021-06-18 19:27:08.332+00	2021-06-18 19:27:08.332+00
195	/admin/users	POST	2	2021-06-18 19:28:58.494+00	2021-06-18 19:28:58.494+00
196	/admin/users	POST	2	2021-06-18 19:55:18.832+00	2021-06-18 19:55:18.832+00
197	/admin/users/15	DELETE	2	2021-06-18 19:55:41.25+00	2021-06-18 19:55:41.25+00
198	/admin/configuracoes	POST	2	2021-06-20 17:20:58.453+00	2021-06-20 17:20:58.453+00
199	/admin/configuracoes	POST	1	2021-06-20 17:21:50.366+00	2021-06-20 17:21:50.366+00
200	/admin/users/9	PUT	2	2021-06-20 17:28:41.396+00	2021-06-20 17:28:41.397+00
201	/admin/users/9	PUT	2	2021-06-20 17:29:03.608+00	2021-06-20 17:29:03.608+00
202	/admin/users	POST	2	2021-06-20 17:44:25.398+00	2021-06-20 17:44:25.398+00
203	/admin/users	POST	2	2021-06-20 17:45:46.449+00	2021-06-20 17:45:46.449+00
204	/admin/users	POST	2	2021-06-20 17:46:54.451+00	2021-06-20 17:46:54.451+00
205	/admin/users	POST	2	2021-06-20 17:48:15.686+00	2021-06-20 17:48:15.686+00
206	/admin/users	POST	2	2021-06-20 17:50:01.48+00	2021-06-20 17:50:01.48+00
207	/admin/users	POST	2	2021-06-20 17:53:12.216+00	2021-06-20 17:53:12.216+00
208	/admin/cargos	POST	2	2021-06-20 17:53:55.985+00	2021-06-20 17:53:55.985+00
209	/admin/users	POST	2	2021-06-20 17:55:32.565+00	2021-06-20 17:55:32.565+00
210	/admin/users	POST	2	2021-06-20 17:57:07.394+00	2021-06-20 17:57:07.394+00
211	/admin/users	POST	2	2021-06-20 17:58:28.651+00	2021-06-20 17:58:28.651+00
212	/admin/users	POST	2	2021-06-20 17:59:44.068+00	2021-06-20 17:59:44.068+00
213	/admin/users	POST	2	2021-06-20 18:00:59.34+00	2021-06-20 18:00:59.34+00
214	/admin/users	POST	2	2021-06-20 18:02:26.262+00	2021-06-20 18:02:26.262+00
215	/admin/users	POST	2	2021-06-20 18:05:00.632+00	2021-06-20 18:05:00.632+00
216	/admin/users	POST	2	2021-06-20 18:06:03.124+00	2021-06-20 18:06:03.124+00
217	/admin/users	POST	2	2021-06-20 18:07:16.198+00	2021-06-20 18:07:16.198+00
218	/admin/users	POST	2	2021-06-20 18:08:19.256+00	2021-06-20 18:08:19.256+00
219	/admin/atividades	POST	2	2021-06-20 18:13:59.405+00	2021-06-20 18:13:59.405+00
220	/admin/atividades	POST	2	2021-06-20 18:14:23.717+00	2021-06-20 18:14:23.717+00
221	/admin/atividades	POST	2	2021-06-20 18:15:54.966+00	2021-06-20 18:15:54.966+00
222	/admin/atividades	POST	2	2021-06-20 18:16:57.334+00	2021-06-20 18:16:57.334+00
223	/admin/atividades	POST	2	2021-06-20 18:17:34.288+00	2021-06-20 18:17:34.288+00
224	/admin/atividades	POST	2	2021-06-20 18:18:40.657+00	2021-06-20 18:18:40.657+00
225	/admin/atividades	POST	2	2021-06-20 18:20:31.425+00	2021-06-20 18:20:31.425+00
226	/admin/areas/complexos	POST	2	2021-06-20 18:29:21.523+00	2021-06-20 18:29:21.523+00
227	/admin/areas/minas	POST	2	2021-06-20 18:29:39.303+00	2021-06-20 18:29:39.303+00
228	/admin/areas/estruturas	POST	2	2021-06-20 18:33:37.98+00	2021-06-20 18:33:37.98+00
229	/admin/areas/estruturas	POST	2	2021-06-20 18:34:10.685+00	2021-06-20 18:34:10.685+00
230	/admin/areas/estruturas	POST	2	2021-06-20 18:34:36.593+00	2021-06-20 18:34:36.593+00
231	/admin/areas/estruturas	POST	2	2021-06-20 18:35:08.143+00	2021-06-20 18:35:08.143+00
232	/admin/areas/estruturas	POST	2	2021-06-20 18:35:19.278+00	2021-06-20 18:35:19.278+00
233	/admin/areas/estruturas	POST	2	2021-06-20 18:35:37.668+00	2021-06-20 18:35:37.668+00
234	/admin/areas/estruturas	POST	2	2021-06-20 18:36:04.328+00	2021-06-20 18:36:04.328+00
235	/admin/areas/estruturas	POST	2	2021-06-20 18:36:18.647+00	2021-06-20 18:36:18.647+00
236	/admin/areas/estruturas	POST	2	2021-06-20 18:36:56.743+00	2021-06-20 18:36:56.743+00
237	/admin/areas/estruturas	POST	2	2021-06-20 18:37:05.971+00	2021-06-20 18:37:05.971+00
238	/admin/areas/estruturas	POST	2	2021-06-20 18:37:34.2+00	2021-06-20 18:37:34.2+00
239	/admin/areas/estruturas	POST	2	2021-06-20 18:37:52.238+00	2021-06-20 18:37:52.238+00
240	/admin/areas/estruturas	POST	2	2021-06-20 18:37:57.232+00	2021-06-20 18:37:57.232+00
241	/admin/areas/estruturas	POST	2	2021-06-20 18:38:24.551+00	2021-06-20 18:38:24.551+00
242	/admin/areas/estruturas	POST	2	2021-06-20 18:38:43.864+00	2021-06-20 18:38:43.864+00
243	/admin/areas/estruturas	POST	2	2021-06-20 18:38:54.933+00	2021-06-20 18:38:54.933+00
244	/admin/areas/estruturas	POST	2	2021-06-20 18:39:04.965+00	2021-06-20 18:39:04.965+00
245	/admin/areas/estruturas	POST	2	2021-06-20 18:39:19.671+00	2021-06-20 18:39:19.672+00
246	/admin/areas/estruturas	POST	2	2021-06-20 18:39:26.71+00	2021-06-20 18:39:26.71+00
247	/admin/areas/estruturas	POST	2	2021-06-20 18:39:38.631+00	2021-06-20 18:39:38.631+00
248	/admin/areas/estruturas	POST	2	2021-06-20 18:39:52.064+00	2021-06-20 18:39:52.064+00
249	/admin/areas/estruturas	POST	2	2021-06-20 18:40:00.135+00	2021-06-20 18:40:00.135+00
250	/admin/areas/estruturas	POST	2	2021-06-20 18:40:12.38+00	2021-06-20 18:40:12.38+00
251	/admin/areas/estruturas	POST	2	2021-06-20 18:40:22.143+00	2021-06-20 18:40:22.143+00
252	/admin/areas/estruturas	POST	2	2021-06-20 18:40:46.153+00	2021-06-20 18:40:46.153+00
253	/admin/areas/estruturas	POST	2	2021-06-20 18:40:52.638+00	2021-06-20 18:40:52.638+00
254	/admin/areas/estruturas	POST	2	2021-06-20 18:41:02.623+00	2021-06-20 18:41:02.623+00
255	/admin/areas/estruturas	POST	2	2021-06-20 18:41:22.105+00	2021-06-20 18:41:22.105+00
256	/admin/areas/estruturas	POST	2	2021-06-20 18:41:33.86+00	2021-06-20 18:41:33.86+00
257	/admin/areas/estruturas	POST	2	2021-06-20 18:42:00.984+00	2021-06-20 18:42:00.984+00
258	/admin/areas/estruturas	POST	2	2021-06-20 18:43:35.29+00	2021-06-20 18:43:35.29+00
259	/admin/areas/furos	POST	2	2021-06-20 18:46:07.595+00	2021-06-20 18:46:07.595+00
260	/admin/areas/minas	POST	2	2021-06-20 18:49:31.975+00	2021-06-20 18:49:31.975+00
261	/admin/areas/estruturas	POST	2	2021-06-20 18:50:02.982+00	2021-06-20 18:50:02.982+00
262	/admin/areas/furos	POST	2	2021-06-20 18:50:37.994+00	2021-06-20 18:50:37.994+00
263	/admin/areas/furos	POST	2	2021-06-20 18:50:46.479+00	2021-06-20 18:50:46.479+00
264	/admin/areas/furos	POST	2	2021-06-20 18:50:53.687+00	2021-06-20 18:50:53.687+00
265	/admin/areas/furos	POST	2	2021-06-20 18:51:00.653+00	2021-06-20 18:51:00.653+00
266	/admin/areas/furos	POST	2	2021-06-20 18:51:08.481+00	2021-06-20 18:51:08.481+00
267	/admin/rdos/5	PUT	2	2021-06-20 18:57:41.591+00	2021-06-20 18:57:41.591+00
268	/admin/rdos/5	DELETE	2	2021-06-20 18:57:48.831+00	2021-06-20 18:57:48.831+00
269	/admin/rdos/6	DELETE	2	2021-06-20 18:59:10.377+00	2021-06-20 18:59:10.377+00
270	/admin/configuracoes	POST	\N	2021-06-21 19:53:42.661+00	2021-06-21 19:53:42.661+00
271	/admin/users	POST	2	2021-06-21 19:56:44.175+00	2021-06-21 19:56:44.175+00
272	/admin/contratos/1	PUT	\N	2021-06-21 21:58:16.34+00	2021-06-21 21:58:16.34+00
273	/admin/configuracoes	POST	\N	2021-06-21 21:58:57.583+00	2021-06-21 21:58:57.583+00
274	/admin/areas/estruturas	POST	1	2021-06-21 22:00:14.366+00	2021-06-21 22:00:14.366+00
275	/admin/areas/estruturas	POST	1	2021-06-21 22:00:27.451+00	2021-06-21 22:00:27.451+00
276	/admin/cargos	POST	1	2021-06-21 22:02:53.313+00	2021-06-21 22:02:53.313+00
277	/admin/users	POST	1	2021-06-21 22:05:08.482+00	2021-06-21 22:05:08.482+00
278	/admin/users/5	DELETE	1	2021-06-21 22:05:14.951+00	2021-06-21 22:05:14.951+00
279	/admin/users/4	DELETE	1	2021-06-21 22:05:18.585+00	2021-06-21 22:05:18.585+00
280	/admin/users/3	DELETE	1	2021-06-21 22:05:23.304+00	2021-06-21 22:05:23.304+00
281	/admin/users/2	DELETE	1	2021-06-21 22:05:26.51+00	2021-06-21 22:05:26.51+00
282	/admin/cargos/6	DELETE	1	2021-06-21 22:08:09.826+00	2021-06-21 22:08:09.826+00
283	/admin/cargos/7	DELETE	1	2021-06-21 22:08:14.277+00	2021-06-21 22:08:14.277+00
284	/admin/cargos/8	DELETE	1	2021-06-21 22:08:18.85+00	2021-06-21 22:08:18.85+00
285	/admin/cargos	POST	1	2021-06-21 22:08:50.886+00	2021-06-21 22:08:50.886+00
286	/admin/cargos	POST	1	2021-06-21 22:09:11.549+00	2021-06-21 22:09:11.549+00
287	/admin/cargos	POST	1	2021-06-21 22:09:29.712+00	2021-06-21 22:09:29.712+00
288	/admin/cargos	POST	1	2021-06-21 22:09:46.053+00	2021-06-21 22:09:46.053+00
289	/admin/cargos	POST	1	2021-06-21 22:10:01.346+00	2021-06-21 22:10:01.346+00
290	/admin/atividades/2	PUT	1	2021-06-21 22:13:39.73+00	2021-06-21 22:13:39.73+00
291	/admin/areas/furos/1	PUT	1	2021-06-22 00:18:46.099+00	2021-06-22 00:18:46.099+00
292	/admin/cargos	POST	1	2021-06-22 01:52:19.558+00	2021-06-22 01:52:19.558+00
293	/admin/users	POST	1	2021-06-22 01:52:45.676+00	2021-06-22 01:52:45.676+00
294	/admin/users	POST	1	2021-06-22 01:53:10.982+00	2021-06-22 01:53:10.982+00
295	/admin/users	POST	1	2021-06-22 01:53:24.619+00	2021-06-22 01:53:24.619+00
296	/admin/configuracoes	POST	1	2021-06-22 01:54:24.274+00	2021-06-22 01:54:24.274+00
297	/admin/configuracoes	POST	2	2021-06-22 01:54:51.261+00	2021-06-22 01:54:51.261+00
298	/admin/equipamentos	POST	1	2021-06-22 12:16:58.775+00	2021-06-22 12:16:58.775+00
299	/admin/users	POST	1	2021-06-22 12:21:11.952+00	2021-06-22 12:21:11.952+00
300	/admin/users	POST	1	2021-06-22 12:21:42.867+00	2021-06-22 12:21:42.867+00
301	/admin/users	POST	1	2021-06-22 12:24:23.626+00	2021-06-22 12:24:23.626+00
302	/admin/users	POST	1	2021-06-22 12:27:36.185+00	2021-06-22 12:27:36.185+00
303	/admin/users	POST	1	2021-06-22 12:29:48.133+00	2021-06-22 12:29:48.133+00
304	/admin/users	POST	1	2021-06-22 12:31:59.167+00	2021-06-22 12:31:59.167+00
305	/admin/users	POST	1	2021-06-22 12:34:33.687+00	2021-06-22 12:34:33.687+00
306	/admin/users	POST	1	2021-06-22 12:37:16.766+00	2021-06-22 12:37:16.766+00
307	/admin/users	POST	1	2021-06-22 12:39:29.093+00	2021-06-22 12:39:29.093+00
308	/admin/users	POST	1	2021-06-22 12:45:12.262+00	2021-06-22 12:45:12.262+00
309	/admin/users	POST	1	2021-06-22 12:53:58.382+00	2021-06-22 12:53:58.382+00
310	/admin/users	POST	1	2021-06-22 12:54:32.187+00	2021-06-22 12:54:32.187+00
311	/admin/users	POST	1	2021-06-22 12:56:18.069+00	2021-06-22 12:56:18.069+00
312	/admin/users	POST	1	2021-06-22 12:57:17.849+00	2021-06-22 12:57:17.849+00
313	/admin/users	POST	1	2021-06-22 12:57:34.486+00	2021-06-22 12:57:34.486+00
314	/admin/users	POST	1	2021-06-22 13:00:46.943+00	2021-06-22 13:00:46.943+00
315	/admin/users	POST	1	2021-06-22 13:04:22.42+00	2021-06-22 13:04:22.42+00
316	/admin/users	POST	1	2021-06-22 13:07:08.811+00	2021-06-22 13:07:08.811+00
317	/admin/users	POST	1	2021-06-22 13:09:53.218+00	2021-06-22 13:09:53.218+00
318	/admin/users	POST	1	2021-06-22 13:12:57.5+00	2021-06-22 13:12:57.5+00
319	/admin/users	POST	1	2021-06-22 13:19:06.46+00	2021-06-22 13:19:06.46+00
320	/admin/users	POST	1	2021-06-22 13:20:52.54+00	2021-06-22 13:20:52.54+00
321	/admin/users	POST	1	2021-06-22 13:22:33.814+00	2021-06-22 13:22:33.814+00
322	/admin/users	POST	1	2021-06-22 13:24:28.793+00	2021-06-22 13:24:28.793+00
323	/admin/users	POST	1	2021-06-22 13:28:29.221+00	2021-06-22 13:28:29.221+00
324	/admin/cargos	POST	1	2021-06-22 13:30:36.791+00	2021-06-22 13:30:36.791+00
325	/admin/cargos	POST	1	2021-06-22 13:30:52.891+00	2021-06-22 13:30:52.891+00
326	/admin/users	POST	1	2021-06-22 16:39:44.074+00	2021-06-22 16:39:44.074+00
327	/admin/users	POST	1	2021-06-22 16:42:14.077+00	2021-06-22 16:42:14.077+00
328	/admin/users	POST	1	2021-06-22 16:44:34.495+00	2021-06-22 16:44:34.495+00
329	/admin/users	POST	1	2021-06-22 16:47:05.949+00	2021-06-22 16:47:05.949+00
330	/admin/users	POST	1	2021-06-22 16:49:35.358+00	2021-06-22 16:49:35.358+00
331	/admin/users	POST	1	2021-06-22 16:52:01.95+00	2021-06-22 16:52:01.95+00
332	/admin/users	POST	1	2021-06-22 16:54:30.105+00	2021-06-22 16:54:30.105+00
333	/admin/users	POST	1	2021-06-22 16:56:23.801+00	2021-06-22 16:56:23.801+00
334	/admin/users	POST	1	2021-06-22 16:58:36.261+00	2021-06-22 16:58:36.261+00
335	/admin/users	POST	1	2021-06-22 17:00:14.125+00	2021-06-22 17:00:14.125+00
336	/admin/atividades	POST	1	2021-06-22 17:06:18.033+00	2021-06-22 17:06:18.033+00
337	/admin/atividades/1	PUT	1	2021-06-22 17:12:52.826+00	2021-06-22 17:12:52.826+00
338	/admin/atividades/17	PUT	1	2021-06-22 17:15:37.174+00	2021-06-22 17:15:37.174+00
339	/admin/atividades	POST	1	2021-06-22 17:17:04.121+00	2021-06-22 17:17:04.121+00
340	/admin/atividades/18	PUT	1	2021-06-22 17:19:58.395+00	2021-06-22 17:19:58.396+00
341	/admin/atividades	POST	1	2021-06-22 17:22:59.772+00	2021-06-22 17:22:59.772+00
342	/admin/atividades	POST	1	2021-06-22 17:26:23.762+00	2021-06-22 17:26:23.762+00
343	/admin/cargos/36	DELETE	1	2021-06-22 17:26:44.326+00	2021-06-22 17:26:44.326+00
344	/admin/atividades	POST	1	2021-06-22 17:29:50.986+00	2021-06-22 17:29:50.986+00
345	/admin/atividades	POST	1	2021-06-22 17:33:36.003+00	2021-06-22 17:33:36.003+00
346	/admin/atividades	POST	1	2021-06-22 17:34:48.107+00	2021-06-22 17:34:48.107+00
347	/admin/atividades	POST	1	2021-06-22 17:36:27.787+00	2021-06-22 17:36:27.787+00
348	/admin/atividades/2	PUT	1	2021-06-22 17:38:18.668+00	2021-06-22 17:38:18.668+00
349	/admin/atividades	POST	1	2021-06-22 17:41:24.578+00	2021-06-22 17:41:24.578+00
350	/admin/atividades/2	PUT	1	2021-06-22 17:41:35.06+00	2021-06-22 17:41:35.06+00
351	/admin/atividades	POST	1	2021-06-22 17:44:23.67+00	2021-06-22 17:44:23.67+00
352	/admin/atividades	POST	1	2021-06-22 17:46:27.592+00	2021-06-22 17:46:27.592+00
353	/admin/atividades	POST	1	2021-06-22 17:49:01.328+00	2021-06-22 17:49:01.328+00
354	/admin/atividades	POST	1	2021-06-22 17:52:14.081+00	2021-06-22 17:52:14.081+00
355	/admin/atividades/5	PUT	1	2021-06-22 17:54:14.649+00	2021-06-22 17:54:14.649+00
356	/admin/atividades	POST	1	2021-06-22 17:56:33.173+00	2021-06-22 17:56:33.173+00
357	/admin/equipamentos	POST	1	2021-06-22 18:01:53.76+00	2021-06-22 18:01:53.76+00
358	/admin/equipamentos	POST	1	2021-06-22 18:02:29.69+00	2021-06-22 18:02:29.69+00
359	/admin/equipamentos	POST	1	2021-06-22 18:02:41.282+00	2021-06-22 18:02:41.282+00
360	/admin/equipamentos	POST	1	2021-06-22 18:04:20.233+00	2021-06-22 18:04:20.233+00
361	/admin/equipamentos	POST	1	2021-06-22 18:05:02.936+00	2021-06-22 18:05:02.936+00
362	/admin/equipamentos	POST	1	2021-06-22 18:05:52.764+00	2021-06-22 18:05:52.764+00
363	/admin/equipamentos/27	PUT	1	2021-06-22 18:06:08.101+00	2021-06-22 18:06:08.101+00
364	/admin/equipamentos/28	PUT	1	2021-06-22 18:06:18.808+00	2021-06-22 18:06:18.808+00
365	/admin/equipamentos/28	PUT	1	2021-06-22 18:07:05.048+00	2021-06-22 18:07:05.048+00
366	/admin/equipamentos/28	PUT	1	2021-06-22 18:07:10.396+00	2021-06-22 18:07:10.396+00
367	/admin/equipamentos/27	PUT	1	2021-06-22 18:07:25.665+00	2021-06-22 18:07:25.665+00
368	/admin/equipamentos	POST	1	2021-06-22 18:08:42.916+00	2021-06-22 18:08:42.916+00
369	/admin/equipamentos	POST	1	2021-06-22 18:08:50.793+00	2021-06-22 18:08:50.793+00
370	/admin/equipamentos	POST	1	2021-06-22 18:09:18.507+00	2021-06-22 18:09:18.507+00
371	/admin/equipamentos	POST	1	2021-06-22 18:09:37.797+00	2021-06-22 18:09:37.797+00
372	/admin/equipamentos	POST	1	2021-06-22 18:09:59.958+00	2021-06-22 18:09:59.958+00
373	/admin/equipamentos	POST	1	2021-06-22 18:10:52.856+00	2021-06-22 18:10:52.856+00
374	/admin/equipamentos	POST	1	2021-06-22 18:10:58.943+00	2021-06-22 18:10:58.943+00
375	/admin/equipamentos	POST	1	2021-06-22 18:11:07.666+00	2021-06-22 18:11:07.666+00
376	/admin/equipamentos	POST	1	2021-06-22 18:12:41.71+00	2021-06-22 18:12:41.71+00
377	/admin/atividades	POST	1	2021-06-22 18:55:08.948+00	2021-06-22 18:55:08.949+00
378	/admin/atividades	POST	1	2021-06-22 18:55:50.288+00	2021-06-22 18:55:50.288+00
379	/admin/atividades	POST	1	2021-06-22 18:56:23.186+00	2021-06-22 18:56:23.186+00
380	/admin/atividades	POST	1	2021-06-22 18:56:39.835+00	2021-06-22 18:56:39.835+00
381	/admin/atividades	POST	1	2021-06-22 18:57:00.168+00	2021-06-22 18:57:00.168+00
382	/admin/atividades	POST	1	2021-06-22 18:57:21.387+00	2021-06-22 18:57:21.387+00
383	/admin/atividades	POST	1	2021-06-22 18:57:47.419+00	2021-06-22 18:57:47.419+00
384	/admin/atividades	POST	1	2021-06-22 18:58:48.913+00	2021-06-22 18:58:48.913+00
385	/admin/atividades	POST	1	2021-06-22 18:59:46.508+00	2021-06-22 18:59:46.508+00
386	/admin/atividades	POST	1	2021-06-22 19:00:29.894+00	2021-06-22 19:00:29.894+00
387	/admin/atividades	POST	1	2021-06-22 19:00:47.662+00	2021-06-22 19:00:47.662+00
388	/admin/atividades	POST	1	2021-06-22 19:01:14.65+00	2021-06-22 19:01:14.65+00
389	/admin/atividades	POST	1	2021-06-22 19:02:04.412+00	2021-06-22 19:02:04.412+00
390	/admin/atividades	POST	1	2021-06-22 19:03:41.078+00	2021-06-22 19:03:41.078+00
391	/admin/atividades/40	PUT	1	2021-06-22 19:03:52.189+00	2021-06-22 19:03:52.189+00
392	/admin/atividades	POST	1	2021-06-22 19:04:56.094+00	2021-06-22 19:04:56.094+00
393	/admin/atividades	POST	1	2021-06-22 19:05:21.212+00	2021-06-22 19:05:21.212+00
394	/admin/atividades	POST	1	2021-06-22 19:05:47.734+00	2021-06-22 19:05:47.734+00
395	/admin/atividades	POST	1	2021-06-22 19:06:31.374+00	2021-06-22 19:06:31.374+00
396	/admin/atividades	POST	1	2021-06-22 19:06:57.618+00	2021-06-22 19:06:57.618+00
397	/admin/atividades	POST	1	2021-06-22 19:07:27.985+00	2021-06-22 19:07:27.985+00
398	/admin/atividades	POST	1	2021-06-22 19:08:36.726+00	2021-06-22 19:08:36.726+00
399	/admin/atividades	POST	1	2021-06-22 19:09:02.946+00	2021-06-22 19:09:02.946+00
400	/admin/atividades	POST	1	2021-06-22 19:10:26.066+00	2021-06-22 19:10:26.066+00
401	/admin/atividades	POST	1	2021-06-22 19:42:46.186+00	2021-06-22 19:42:46.186+00
402	/admin/atividades/28	PUT	1	2021-06-22 21:49:31.22+00	2021-06-22 21:49:31.22+00
403	/admin/atividades/47	PUT	1	2021-06-22 21:49:41.063+00	2021-06-22 21:49:41.063+00
404	/admin/atividades/51	PUT	1	2021-06-22 21:49:58.021+00	2021-06-22 21:49:58.021+00
405	/admin/rdos/7	DELETE	2	2021-06-23 12:22:09.744+00	2021-06-23 12:22:09.744+00
406	/admin/rdos/8	DELETE	2	2021-06-23 12:22:14.73+00	2021-06-23 12:22:14.73+00
407	/admin/configuracoes	POST	2	2021-06-23 12:43:44.717+00	2021-06-23 12:43:44.717+00
408	/admin/configuracoes	POST	1	2021-06-23 12:49:23.061+00	2021-06-23 12:49:23.061+00
409	/admin/atividades	POST	2	2021-06-23 12:50:21.052+00	2021-06-23 12:50:21.053+00
410	/admin/configuracoes	POST	2	2021-06-23 12:50:45.421+00	2021-06-23 12:50:45.421+00
411	/admin/configuracoes	POST	1	2021-06-23 12:51:54.197+00	2021-06-23 12:51:54.197+00
412	/admin/atividades	POST	2	2021-06-23 12:53:28.566+00	2021-06-23 12:53:28.566+00
413	/admin/atividades	POST	2	2021-06-23 12:54:27.357+00	2021-06-23 12:54:27.357+00
414	/admin/atividades	POST	2	2021-06-23 12:55:49.011+00	2021-06-23 12:55:49.011+00
415	/admin/atividades/57	PUT	2	2021-06-23 12:56:17.596+00	2021-06-23 12:56:17.596+00
416	/admin/atividades	POST	2	2021-06-23 12:56:41.826+00	2021-06-23 12:56:41.826+00
417	/admin/atividades	POST	2	2021-06-23 12:57:35.012+00	2021-06-23 12:57:35.012+00
418	/admin/atividades	POST	2	2021-06-23 12:59:30.05+00	2021-06-23 12:59:30.05+00
419	/admin/atividades	POST	2	2021-06-23 13:00:09.818+00	2021-06-23 13:00:09.818+00
420	/admin/atividades	POST	2	2021-06-23 13:00:59.167+00	2021-06-23 13:00:59.167+00
421	/admin/atividades	POST	2	2021-06-23 13:01:27.226+00	2021-06-23 13:01:27.226+00
422	/admin/atividades/61	PUT	2	2021-06-23 13:02:26.081+00	2021-06-23 13:02:26.081+00
423	/admin/atividades/62	PUT	2	2021-06-23 13:02:39.267+00	2021-06-23 13:02:39.267+00
424	/admin/atividades	POST	1	2021-06-24 18:45:44.012+00	2021-06-24 18:45:44.012+00
425	/admin/atividades	POST	1	2021-06-24 18:45:50.198+00	2021-06-24 18:45:50.198+00
426	/admin/atividades	POST	1	2021-06-24 18:46:24.398+00	2021-06-24 18:46:24.398+00
427	/admin/atividades	POST	1	2021-06-24 18:47:03.591+00	2021-06-24 18:47:03.591+00
428	/admin/atividades	POST	1	2021-06-24 18:47:50.355+00	2021-06-24 18:47:50.355+00
429	/admin/atividades	POST	1	2021-06-24 18:48:25.317+00	2021-06-24 18:48:25.317+00
430	/admin/atividades	POST	1	2021-06-24 18:49:13.738+00	2021-06-24 18:49:13.738+00
431	/admin/atividades	POST	1	2021-06-24 18:50:27.376+00	2021-06-24 18:50:27.376+00
432	/admin/atividades	POST	1	2021-06-24 18:51:22.253+00	2021-06-24 18:51:22.253+00
433	/admin/atividades	POST	1	2021-06-24 18:51:56.004+00	2021-06-24 18:51:56.004+00
434	/admin/atividades	POST	1	2021-06-24 18:52:27.84+00	2021-06-24 18:52:27.84+00
435	/admin/atividades	POST	1	2021-06-24 18:53:00.766+00	2021-06-24 18:53:00.766+00
436	/admin/atividades	POST	1	2021-06-24 18:53:50.209+00	2021-06-24 18:53:50.209+00
437	/admin/atividades	POST	1	2021-06-24 18:54:23.754+00	2021-06-24 18:54:23.754+00
438	/admin/atividades	POST	1	2021-06-24 18:54:57.022+00	2021-06-24 18:54:57.022+00
439	/admin/atividades	POST	1	2021-06-24 18:55:30.743+00	2021-06-24 18:55:30.743+00
440	/admin/atividades	POST	1	2021-06-24 18:56:06.46+00	2021-06-24 18:56:06.46+00
441	/admin/atividades	POST	1	2021-06-24 18:56:38.998+00	2021-06-24 18:56:38.998+00
442	/admin/atividades	POST	1	2021-06-24 18:57:03.848+00	2021-06-24 18:57:03.848+00
443	/admin/atividades	POST	1	2021-06-24 18:57:37.379+00	2021-06-24 18:57:37.379+00
444	/admin/atividades	POST	1	2021-06-24 18:58:17.794+00	2021-06-24 18:58:17.794+00
445	/admin/atividades	POST	1	2021-06-24 18:58:17.897+00	2021-06-24 18:58:17.897+00
446	/admin/atividades	POST	1	2021-06-24 18:58:54.906+00	2021-06-24 18:58:54.906+00
447	/admin/atividades	POST	1	2021-06-24 18:59:27.22+00	2021-06-24 18:59:27.22+00
448	/admin/atividades	POST	1	2021-06-24 19:00:05.88+00	2021-06-24 19:00:05.88+00
449	/admin/atividades	POST	1	2021-06-24 19:00:36.838+00	2021-06-24 19:00:36.838+00
450	/admin/users/50	DELETE	1	2021-06-26 13:38:57.883+00	2021-06-26 13:38:57.883+00
451	/admin/configuracoes	POST	1	2021-06-26 14:08:43.653+00	2021-06-26 14:08:43.653+00
452	/admin/configuracoes	POST	2	2021-06-26 14:09:40.954+00	2021-06-26 14:09:40.954+00
453	/admin/atividades/5	PUT	1	2021-06-26 14:33:58.745+00	2021-06-26 14:33:58.745+00
454	/admin/users/49	DELETE	1	2021-06-26 22:11:44.617+00	2021-06-26 22:11:44.617+00
455	/admin/users/61	PUT	1	2021-06-26 22:12:14.708+00	2021-06-26 22:12:14.708+00
456	/admin/users/57	DELETE	1	2021-06-26 22:12:24.491+00	2021-06-26 22:12:24.491+00
457	/admin/users/60	DELETE	1	2021-06-26 22:12:32.543+00	2021-06-26 22:12:32.543+00
458	/admin/users/63	DELETE	1	2021-06-26 22:12:40.965+00	2021-06-26 22:12:40.965+00
459	/admin/users/54	DELETE	1	2021-06-26 22:12:52.01+00	2021-06-26 22:12:52.01+00
460	/admin/users/42	DELETE	1	2021-06-26 22:13:12.743+00	2021-06-26 22:13:12.743+00
461	/admin/users/64	DELETE	1	2021-06-26 22:13:27.167+00	2021-06-26 22:13:27.167+00
462	/admin/users/45	DELETE	1	2021-06-26 22:13:34.216+00	2021-06-26 22:13:34.216+00
463	/admin/users	POST	1	2021-06-27 22:17:19.684+00	2021-06-27 22:17:19.684+00
464	/admin/users	POST	1	2021-06-27 22:18:04.871+00	2021-06-27 22:18:04.871+00
465	/admin/equipamentos/2	DELETE	1	2021-06-27 22:21:27.996+00	2021-06-27 22:21:27.996+00
466	/admin/equipamentos/29	PUT	1	2021-06-27 22:21:48.438+00	2021-06-27 22:21:48.438+00
467	/admin/equipamentos	POST	1	2021-06-27 22:22:08.896+00	2021-06-27 22:22:08.896+00
468	/admin/equipamentos/30	PUT	1	2021-06-27 22:23:08.884+00	2021-06-27 22:23:08.884+00
469	/admin/equipamentos/31	PUT	1	2021-06-27 22:23:23.711+00	2021-06-27 22:23:23.711+00
470	/admin/equipamentos	POST	1	2021-06-27 22:23:43.265+00	2021-06-27 22:23:43.265+00
471	/admin/equipamentos/37	PUT	1	2021-06-27 22:23:52.264+00	2021-06-27 22:23:52.264+00
472	/admin/equipamentos	POST	1	2021-06-27 22:24:18.116+00	2021-06-27 22:24:18.116+00
473	/admin/equipamentos/38	DELETE	1	2021-06-27 22:24:31.422+00	2021-06-27 22:24:31.422+00
474	/admin/equipamentos/37	DELETE	1	2021-06-27 22:24:36.051+00	2021-06-27 22:24:36.051+00
475	/admin/equipamentos/36	DELETE	1	2021-06-27 22:24:40.429+00	2021-06-27 22:24:40.429+00
476	/admin/equipamentos/31	PUT	1	2021-06-27 22:24:51.537+00	2021-06-27 22:24:51.537+00
477	/admin/equipamentos/31	PUT	1	2021-06-27 22:25:09.476+00	2021-06-27 22:25:09.476+00
478	/admin/equipamentos/34	DELETE	1	2021-06-27 22:25:15.769+00	2021-06-27 22:25:15.769+00
479	/admin/equipamentos/29	PUT	1	2021-06-27 22:25:57.807+00	2021-06-27 22:25:57.807+00
480	/admin/equipamentos/35	PUT	1	2021-06-27 22:26:19.118+00	2021-06-27 22:26:19.118+00
481	/admin/equipamentos/28	PUT	1	2021-06-27 22:26:47.89+00	2021-06-27 22:26:47.89+00
482	/admin/equipamentos/28	PUT	1	2021-06-27 22:26:50.465+00	2021-06-27 22:26:50.465+00
483	/admin/equipamentos/27	PUT	1	2021-06-27 22:27:05.326+00	2021-06-27 22:27:05.326+00
484	/admin/equipamentos/32	PUT	1	2021-06-27 22:27:22.003+00	2021-06-27 22:27:22.003+00
485	/admin/equipamentos/33	PUT	1	2021-06-27 22:27:29.563+00	2021-06-27 22:27:29.563+00
486	/admin/equipamentos/1	PUT	1	2021-06-27 22:27:43.617+00	2021-06-27 22:27:43.617+00
487	/admin/equipamentos	POST	1	2021-06-27 22:28:00.796+00	2021-06-27 22:28:00.796+00
488	/admin/equipamentos/39	PUT	1	2021-06-27 22:28:07.628+00	2021-06-27 22:28:07.628+00
489	/admin/equipamentos	POST	1	2021-06-27 22:28:21.976+00	2021-06-27 22:28:21.976+00
490	/admin/equipamentos/4	PUT	1	2021-06-27 22:28:34.448+00	2021-06-27 22:28:34.448+00
491	/admin/equipamentos/30	PUT	1	2021-06-27 22:28:56.657+00	2021-06-27 22:28:56.657+00
492	/admin/atividades/50	PUT	1	2021-06-27 22:29:51.134+00	2021-06-27 22:29:51.134+00
493	/admin/atividades/50	PUT	1	2021-06-27 22:30:01.154+00	2021-06-27 22:30:01.154+00
494	/admin/atividades/44	PUT	1	2021-06-27 22:30:26.559+00	2021-06-27 22:30:26.559+00
495	/admin/atividades/44	PUT	1	2021-06-27 22:30:31.199+00	2021-06-27 22:30:31.199+00
496	/admin/atividades/44	PUT	1	2021-06-27 22:30:45.962+00	2021-06-27 22:30:45.962+00
497	/admin/atividades/44	DELETE	1	2021-06-27 22:30:59.274+00	2021-06-27 22:30:59.274+00
498	/admin/atividades	POST	1	2021-06-27 22:31:06.879+00	2021-06-27 22:31:06.879+00
499	/admin/atividades/46	PUT	1	2021-06-27 22:32:19.816+00	2021-06-27 22:32:19.816+00
500	/admin/atividades/53	PUT	1	2021-06-27 22:32:44.591+00	2021-06-27 22:32:44.591+00
501	/admin/atividades/45	PUT	1	2021-06-27 22:33:04.674+00	2021-06-27 22:33:04.674+00
502	/admin/atividades	POST	1	2021-06-27 22:33:49.497+00	2021-06-27 22:33:49.497+00
503	/admin/rdos/10	DELETE	1	2021-06-27 22:34:15.065+00	2021-06-27 22:34:15.065+00
504	/admin/rdos/9	DELETE	1	2021-06-27 22:34:17.347+00	2021-06-27 22:34:17.347+00
505	/admin/atividades	POST	1	2021-06-27 22:57:35.288+00	2021-06-27 22:57:35.288+00
506	/admin/atividades	POST	1	2021-06-27 22:59:09.627+00	2021-06-27 22:59:09.627+00
507	/admin/atividades/91	DELETE	1	2021-06-27 22:59:20.286+00	2021-06-27 22:59:20.286+00
508	/admin/contratos/1	PUT	1	2021-06-27 23:01:19.064+00	2021-06-27 23:01:19.064+00
509	/admin/areas/estruturas/36	PUT	1	2021-06-27 23:01:40.368+00	2021-06-27 23:01:40.368+00
510	/admin/areas/furos/1	PUT	1	2021-06-27 23:01:53.723+00	2021-06-27 23:01:53.723+00
511	/admin/areas/furos	POST	1	2021-06-27 23:02:17.051+00	2021-06-27 23:02:17.051+00
512	/admin/atividades	POST	1	2021-06-27 23:10:59.986+00	2021-06-27 23:10:59.986+00
513	/admin/atividades	POST	1	2021-06-27 23:14:47.758+00	2021-06-27 23:14:47.758+00
514	/admin/rdos/12/atividades	POST	1	2021-06-27 23:24:29.096+00	2021-06-27 23:24:29.096+00
515	/admin/rdos/12/atividades/32	DELETE	1	2021-06-27 23:24:40.67+00	2021-06-27 23:24:40.67+00
516	/admin/rdos/12/atividades/33	DELETE	1	2021-06-27 23:24:45.207+00	2021-06-27 23:24:45.207+00
517	/admin/rdos/12/atividades/34	DELETE	1	2021-06-27 23:24:48.6+00	2021-06-27 23:24:48.6+00
518	/admin/rdos/12/atividades/35	DELETE	1	2021-06-27 23:24:51.821+00	2021-06-27 23:24:51.821+00
519	/admin/rdos/12/atividades/36	DELETE	1	2021-06-27 23:24:55.266+00	2021-06-27 23:24:55.266+00
523	/admin/rdos/12/atividades	POST	1	2021-06-27 23:25:31.452+00	2021-06-27 23:25:31.452+00
520	/admin/rdos/12/atividades/37	DELETE	1	2021-06-27 23:25:02.236+00	2021-06-27 23:25:02.236+00
521	/admin/rdos/12/atividades/38	DELETE	1	2021-06-27 23:25:06.016+00	2021-06-27 23:25:06.016+00
522	/admin/rdos/12/atividades/39	DELETE	1	2021-06-27 23:25:11.438+00	2021-06-27 23:25:11.438+00
524	/admin/rdos/12/atividades	POST	1	2021-06-27 23:25:46.975+00	2021-06-27 23:25:46.975+00
525	/admin/rdos/12	DELETE	1	2021-06-27 23:57:56.404+00	2021-06-27 23:57:56.404+00
526	/admin/cargos/28	PUT	1	2021-06-28 00:03:34.59+00	2021-06-28 00:03:34.59+00
527	/admin/atividades	POST	1	2021-06-28 01:07:53.496+00	2021-06-28 01:07:53.496+00
528	/admin/atividades	POST	1	2021-06-28 01:08:17.356+00	2021-06-28 01:08:17.356+00
529	/admin/atividades	POST	1	2021-06-28 01:14:44.292+00	2021-06-28 01:14:44.292+00
530	/admin/atividades/96	DELETE	1	2021-06-28 01:15:55.233+00	2021-06-28 01:15:55.233+00
531	/admin/areas/furos	POST	1	2021-06-28 01:16:15.39+00	2021-06-28 01:16:15.39+00
532	/admin/areas/furos	POST	1	2021-06-28 01:16:23.958+00	2021-06-28 01:16:23.958+00
533	/admin/atividades/95	PUT	1	2021-06-28 01:39:22.348+00	2021-06-28 01:39:22.348+00
534	/admin/atividades/94	PUT	1	2021-06-28 01:39:35.28+00	2021-06-28 01:39:35.28+00
535	/admin/rdos/17	PUT	1	2021-06-28 01:46:45.795+00	2021-06-28 01:46:45.795+00
536	/admin/rdos/18	PUT	1	2021-06-28 01:47:01.164+00	2021-06-28 01:47:01.164+00
537	/admin/rdos/19	PUT	1	2021-06-28 01:47:16.772+00	2021-06-28 01:47:16.772+00
538	/admin/rdos/20	PUT	1	2021-06-28 01:47:29.043+00	2021-06-28 01:47:29.043+00
539	/admin/rdos/21	PUT	1	2021-06-28 01:47:40.934+00	2021-06-28 01:47:40.934+00
540	/admin/users	POST	1	2021-06-28 15:57:09.995+00	2021-06-28 15:57:09.995+00
541	/admin/users	POST	1	2021-06-28 17:05:28.651+00	2021-06-28 17:05:28.651+00
542	/admin/users	POST	1	2021-06-28 17:08:07.586+00	2021-06-28 17:08:07.586+00
543	/admin/users	POST	1	2021-06-28 17:11:49.05+00	2021-06-28 17:11:49.05+00
544	/admin/configuracoes	POST	2	2021-06-28 17:22:24.037+00	2021-06-28 17:22:24.037+00
545	/admin/configuracoes	POST	1	2021-06-28 17:23:14.138+00	2021-06-28 17:23:14.139+00
546	/admin/configuracoes	POST	2	2021-06-28 17:23:22.608+00	2021-06-28 17:23:22.608+00
547	/admin/rdos/22/users/95	DELETE	1	2021-06-28 18:26:49.155+00	2021-06-28 18:26:49.155+00
548	/admin/rdos/21/users	POST	1	2021-06-28 18:29:05.709+00	2021-06-28 18:29:05.709+00
549	/admin/rdos/11/users	POST	1	2021-06-28 18:30:52.829+00	2021-06-28 18:30:52.829+00
550	/admin/rdos/13/users	POST	1	2021-06-28 18:32:02.142+00	2021-06-28 18:32:02.142+00
551	/admin/rdos/13/users	POST	1	2021-06-28 18:32:41.213+00	2021-06-28 18:32:41.213+00
552	/admin/rdos/11/users	POST	1	2021-06-28 18:33:39.479+00	2021-06-28 18:33:39.479+00
553	/admin/areas/furos	POST	1	2021-06-28 18:36:36.627+00	2021-06-28 18:36:36.627+00
554	/admin/areas/furos	POST	1	2021-06-28 18:36:47.58+00	2021-06-28 18:36:47.58+00
555	/admin/areas/furos	POST	1	2021-06-28 20:24:08.778+00	2021-06-28 20:24:08.778+00
556	/admin/areas/furos	POST	1	2021-06-28 20:31:14.706+00	2021-06-28 20:31:14.706+00
557	/admin/rdos/23	PUT	1	2021-06-30 18:49:00.992+00	2021-06-30 18:49:00.992+00
558	/admin/rdos/23	PUT	1	2021-06-30 18:49:47.683+00	2021-06-30 18:49:47.683+00
559	/admin/rdos/23	PUT	1	2021-06-30 18:51:58.131+00	2021-06-30 18:51:58.131+00
560	/admin/areas/furos	POST	1	2021-06-30 19:42:54.802+00	2021-06-30 19:42:54.802+00
561	/admin/configuracoes	POST	\N	2021-07-01 12:50:06.494+00	2021-07-01 12:50:06.494+00
562	/admin/configuracoes	POST	2	2021-07-01 13:00:54.762+00	2021-07-01 13:00:54.762+00
563	/admin/configuracoes	POST	1	2021-07-01 13:09:38.689+00	2021-07-01 13:09:38.689+00
564	/admin/cargos	POST	1	2021-07-01 19:53:02.371+00	2021-07-01 19:53:02.371+00
565	/admin/users	POST	1	2021-07-01 19:54:57.114+00	2021-07-01 19:54:57.114+00
566	/admin/users	POST	1	2021-07-01 19:59:01.184+00	2021-07-01 19:59:01.184+00
567	/admin/atividades	POST	1	2021-07-01 20:20:44.471+00	2021-07-01 20:20:44.471+00
568	/admin/atividades	POST	1	2021-07-01 20:21:02.445+00	2021-07-01 20:21:02.445+00
569	/admin/rdos/30	DELETE	1	2021-07-01 20:47:02.959+00	2021-07-01 20:47:02.959+00
570	/admin/equipamentos	POST	1	2021-07-01 20:59:44.168+00	2021-07-01 20:59:44.168+00
571	/admin/atividades	POST	1	2021-07-01 21:12:13.38+00	2021-07-01 21:12:13.38+00
572	/admin/atividades	POST	1	2021-07-01 21:17:13.217+00	2021-07-01 21:17:13.217+00
573	/admin/atividades	POST	1	2021-07-01 21:36:03.377+00	2021-07-01 21:36:03.377+00
574	/admin/atividades	POST	1	2021-07-01 21:40:14.908+00	2021-07-01 21:40:14.908+00
575	/admin/atividades/88	PUT	1	2021-07-01 22:02:27.167+00	2021-07-01 22:02:27.167+00
576	/admin/atividades/88	DELETE	1	2021-07-01 22:02:59.622+00	2021-07-01 22:02:59.622+00
577	/admin/atividades	POST	1	2021-07-01 22:03:11.004+00	2021-07-01 22:03:11.004+00
578	/admin/atividades	POST	1	2021-07-01 22:04:15.317+00	2021-07-01 22:04:15.317+00
579	/admin/users/67	PUT	1	2021-07-01 22:08:36.343+00	2021-07-01 22:08:36.343+00
580	/admin/rdos/43/equipamentos/289	DELETE	1	2021-07-01 22:30:04.695+00	2021-07-01 22:30:04.695+00
581	/admin/rdos/43/equipamentos	POST	1	2021-07-01 22:30:21.277+00	2021-07-01 22:30:21.277+00
582	/admin/atividades/5	PUT	1	2021-07-01 22:41:01.277+00	2021-07-01 22:41:01.277+00
583	/admin/atividades/5	PUT	1	2021-07-01 23:01:45.566+00	2021-07-01 23:01:45.566+00
584	/admin/rdos/45/atividades/275	DELETE	1	2021-07-01 23:18:25.047+00	2021-07-01 23:18:25.047+00
585	/admin/rdos/45/atividades	POST	1	2021-07-01 23:19:18.899+00	2021-07-01 23:19:18.899+00
586	/admin/rdos/45/atividades	POST	1	2021-07-01 23:20:29.993+00	2021-07-01 23:20:29.993+00
587	/admin/rdos/45/atividades	POST	1	2021-07-01 23:22:15.564+00	2021-07-01 23:22:15.564+00
588	/admin/rdos/45	DELETE	1	2021-07-01 23:24:47.137+00	2021-07-01 23:24:47.137+00
589	/admin/configuracoes	POST	\N	2021-07-01 23:26:10.07+00	2021-07-01 23:26:10.07+00
590	/admin/configuracoes	POST	2	2021-07-01 23:33:35.435+00	2021-07-01 23:33:35.435+00
591	/admin/configuracoes	POST	1	2021-07-01 23:34:40.51+00	2021-07-01 23:34:40.51+00
592	/admin/configuracoes	POST	2	2021-07-01 23:34:44.526+00	2021-07-01 23:34:44.526+00
593	/admin/configuracoes	POST	2	2021-07-01 23:37:43.789+00	2021-07-01 23:37:43.789+00
594	/admin/cargos	POST	2	2021-07-01 23:39:04.866+00	2021-07-01 23:39:04.866+00
595	/admin/users	POST	2	2021-07-01 23:48:21.06+00	2021-07-01 23:48:21.06+00
596	/admin/configuracoes	POST	2	2021-07-01 23:49:45.979+00	2021-07-01 23:49:45.979+00
597	/admin/configuracoes	POST	2	2021-07-06 03:53:09.622+00	2021-07-06 03:53:09.622+00
598	/admin/atividades	POST	1	2021-07-07 21:57:36.151+00	2021-07-07 21:57:36.151+00
599	/admin/configuracoes	POST	2	2021-07-08 20:22:45.642+00	2021-07-08 20:22:45.642+00
600	/admin/users	POST	1	2021-07-08 22:41:14.467+00	2021-07-08 22:41:14.467+00
601	/admin/users	POST	1	2021-07-08 22:41:32.5+00	2021-07-08 22:41:32.5+00
602	/admin/users/74	PUT	1	2021-07-08 22:44:55.127+00	2021-07-08 22:44:55.127+00
603	/admin/users	POST	1	2021-07-08 22:46:08.273+00	2021-07-08 22:46:08.273+00
604	/admin/atividades	POST	1	2021-07-08 22:52:11.178+00	2021-07-08 22:52:11.178+00
605	/admin/atividades/106	PUT	1	2021-07-08 22:57:31.599+00	2021-07-08 22:57:31.599+00
606	/admin/atividades	POST	1	2021-07-08 23:01:57.203+00	2021-07-08 23:01:57.203+00
607	/admin/configuracoes	POST	1	2021-07-10 11:43:02.495+00	2021-07-10 11:43:02.495+00
608	/admin/configuracoes	POST	2	2021-07-10 11:43:35.812+00	2021-07-10 11:43:35.812+00
609	/admin/atividades/106	DELETE	1	2021-07-10 18:08:01.556+00	2021-07-10 18:08:01.556+00
610	/admin/areas/furos	POST	1	2021-07-10 22:21:06.294+00	2021-07-10 22:21:06.294+00
611	/admin/atividades	POST	1	2021-07-11 01:06:59.241+00	2021-07-11 01:06:59.241+00
612	/admin/atividades/108	PUT	1	2021-07-11 01:10:35.015+00	2021-07-11 01:10:35.015+00
613	/admin/atividades	POST	1	2021-07-11 14:20:35.779+00	2021-07-11 14:20:35.779+00
614	/admin/equipamentos	POST	1	2021-07-11 14:56:09.175+00	2021-07-11 14:56:09.175+00
615	/admin/equipamentos/42	PUT	1	2021-07-11 14:56:37.303+00	2021-07-11 14:56:37.303+00
616	/admin/equipamentos/42	PUT	1	2021-07-11 14:56:50.078+00	2021-07-11 14:56:50.078+00
617	/admin/equipamentos/41	PUT	1	2021-07-11 14:57:14.279+00	2021-07-11 14:57:14.279+00
618	/admin/equipamentos	POST	1	2021-07-11 14:57:30.581+00	2021-07-11 14:57:30.581+00
619	/admin/atividades	POST	1	2021-07-11 15:37:42.451+00	2021-07-11 15:37:42.451+00
620	/admin/atividades/39	PUT	1	2021-07-11 15:39:19.804+00	2021-07-11 15:39:19.804+00
621	/admin/configuracoes	POST	\N	2021-07-11 17:07:44.326+00	2021-07-11 17:07:44.326+00
622	/admin/cargos/34	PUT	1	2021-07-11 17:08:44.1+00	2021-07-11 17:08:44.1+00
623	/admin/contratos	POST	1	2021-07-11 17:15:50.172+00	2021-07-11 17:15:50.172+00
624	/admin/contratos/3	PUT	1	2021-07-11 17:16:15.596+00	2021-07-11 17:16:15.596+00
625	/admin/configuracoes	POST	1	2021-07-11 17:16:31.924+00	2021-07-11 17:16:31.924+00
626	/admin/configuracoes	POST	3	2021-07-11 17:16:34.675+00	2021-07-11 17:16:34.675+00
627	/admin/cargos	POST	3	2021-07-11 17:16:50.275+00	2021-07-11 17:16:50.275+00
628	/admin/cargos	POST	3	2021-07-11 17:16:58.719+00	2021-07-11 17:16:58.719+00
629	/admin/cargos	POST	3	2021-07-11 17:17:08.515+00	2021-07-11 17:17:08.515+00
630	/admin/cargos	POST	3	2021-07-11 17:17:19.423+00	2021-07-11 17:17:19.423+00
631	/admin/cargos	POST	3	2021-07-11 17:17:27.119+00	2021-07-11 17:17:27.119+00
632	/admin/cargos	POST	3	2021-07-11 17:17:43.138+00	2021-07-11 17:17:43.138+00
633	/admin/cargos	POST	3	2021-07-11 17:17:58.538+00	2021-07-11 17:17:58.538+00
634	/admin/areas/complexos	POST	3	2021-07-11 17:18:21.904+00	2021-07-11 17:18:21.904+00
635	/admin/areas/minas	POST	3	2021-07-11 17:18:41.81+00	2021-07-11 17:18:41.81+00
636	/admin/areas/estruturas	POST	3	2021-07-11 17:18:54.747+00	2021-07-11 17:18:54.747+00
637	/admin/configuracoes	POST	3	2021-07-11 17:19:21.253+00	2021-07-11 17:19:21.253+00
638	/admin/configuracoes	POST	1	2021-07-11 17:19:30.39+00	2021-07-11 17:19:30.39+00
639	/admin/equipamentos	POST	3	2021-07-11 17:20:22.1+00	2021-07-11 17:20:22.1+00
640	/admin/equipamentos	POST	3	2021-07-11 17:20:33.846+00	2021-07-11 17:20:33.846+00
641	/admin/atividades	POST	1	2021-07-11 23:26:01.32+00	2021-07-11 23:26:01.32+00
642	/admin/atividades	POST	1	2021-07-11 23:27:31.307+00	2021-07-11 23:27:31.307+00
643	/admin/atividades	POST	1	2021-07-11 23:29:20.207+00	2021-07-11 23:29:20.207+00
644	/admin/atividades	POST	1	2021-07-11 23:32:13.622+00	2021-07-11 23:32:13.622+00
645	/admin/users	POST	1	2021-07-12 00:22:52.326+00	2021-07-12 00:22:52.326+00
646	/admin/users/72	PUT	1	2021-07-12 00:24:54.549+00	2021-07-12 00:24:54.549+00
647	/admin/areas/furos	POST	1	2021-07-12 01:07:31.824+00	2021-07-12 01:07:31.824+00
648	/admin/configuracoes	POST	2	2021-07-12 17:42:27.984+00	2021-07-12 17:42:27.984+00
649	/admin/configuracoes	POST	1	2021-07-12 17:47:12.236+00	2021-07-12 17:47:12.237+00
650	/admin/configuracoes	POST	3	2021-07-12 17:47:32.844+00	2021-07-12 17:47:32.844+00
651	/admin/configuracoes	POST	3	2021-07-12 17:48:23.353+00	2021-07-12 17:48:23.353+00
652	/admin/configuracoes	POST	3	2021-07-12 19:12:04.129+00	2021-07-12 19:12:04.129+00
653	/admin/cargos	POST	1	2021-07-12 20:05:30.991+00	2021-07-12 20:05:30.991+00
654	/admin/users	POST	1	2021-07-12 20:06:39.654+00	2021-07-12 20:06:39.654+00
655	/admin/configuracoes	POST	1	2021-07-12 20:06:53.645+00	2021-07-12 20:06:53.645+00
656	/admin/rdos/11	DELETE	1	2021-07-12 23:42:29.192+00	2021-07-12 23:42:29.192+00
657	/admin/rdos/54	DELETE	1	2021-07-12 23:43:15.238+00	2021-07-12 23:43:15.238+00
658	/admin/rdos/23	DELETE	1	2021-07-12 23:44:04.483+00	2021-07-12 23:44:04.483+00
659	/admin/rdos/17	DELETE	1	2021-07-12 23:44:23.428+00	2021-07-12 23:44:23.428+00
660	/admin/rdos/55	DELETE	1	2021-07-12 23:46:32.104+00	2021-07-12 23:46:32.104+00
661	/admin/rdos/57	DELETE	1	2021-07-12 23:46:53.548+00	2021-07-12 23:46:53.548+00
662	/admin/rdos/56	DELETE	1	2021-07-12 23:47:17.341+00	2021-07-12 23:47:17.341+00
663	/admin/rdos/22	DELETE	1	2021-07-12 23:47:42.563+00	2021-07-12 23:47:42.563+00
664	/admin/rdos/15	DELETE	1	2021-07-12 23:47:55.411+00	2021-07-12 23:47:55.411+00
665	/admin/rdos/13	DELETE	1	2021-07-12 23:59:24.114+00	2021-07-12 23:59:24.114+00
666	/admin/rdos/21	DELETE	1	2021-07-12 23:59:59.637+00	2021-07-12 23:59:59.637+00
667	/admin/rdos/14	DELETE	1	2021-07-13 00:00:44.9+00	2021-07-13 00:00:44.9+00
668	/admin/rdos/18	DELETE	1	2021-07-13 00:02:03.157+00	2021-07-13 00:02:03.157+00
669	/admin/rdos/20	DELETE	1	2021-07-13 00:02:46.501+00	2021-07-13 00:02:46.501+00
670	/admin/rdos/16	DELETE	1	2021-07-13 00:03:04.389+00	2021-07-13 00:03:04.389+00
671	/admin/rdos/19	DELETE	1	2021-07-13 00:03:23.324+00	2021-07-13 00:03:23.324+00
672	/admin/rdos/53	DELETE	1	2021-07-13 00:07:39.866+00	2021-07-13 00:07:39.866+00
673	/admin/rdos/110	PUT	1	2021-07-13 00:08:53.739+00	2021-07-13 00:08:53.739+00
674	/admin/rdos/51	DELETE	1	2021-07-13 00:09:50.296+00	2021-07-13 00:09:50.296+00
675	/admin/rdos/50	DELETE	1	2021-07-13 00:10:00.231+00	2021-07-13 00:10:00.231+00
676	/admin/rdos/52	DELETE	1	2021-07-13 00:10:24.014+00	2021-07-13 00:10:24.014+00
677	/admin/rdos/110	DELETE	1	2021-07-13 00:10:24.593+00	2021-07-13 00:10:24.593+00
678	/admin/rdos/48	DELETE	1	2021-07-13 00:11:52.369+00	2021-07-13 00:11:52.369+00
679	/admin/rdos/49	DELETE	1	2021-07-13 00:12:22.11+00	2021-07-13 00:12:22.11+00
680	/admin/rdos/24	DELETE	1	2021-07-13 00:14:14.843+00	2021-07-13 00:14:14.843+00
681	/admin/rdos/25	DELETE	1	2021-07-13 00:15:56.487+00	2021-07-13 00:15:56.487+00
682	/admin/rdos/62	DELETE	1	2021-07-13 00:17:51.794+00	2021-07-13 00:17:51.794+00
683	/admin/rdos/27	DELETE	1	2021-07-13 00:18:43.814+00	2021-07-13 00:18:43.814+00
684	/admin/rdos/26	DELETE	1	2021-07-13 00:20:05.219+00	2021-07-13 00:20:05.219+00
685	/admin/rdos/29	DELETE	1	2021-07-13 00:22:05.381+00	2021-07-13 00:22:05.381+00
686	/admin/rdos/32	DELETE	1	2021-07-13 00:24:26.764+00	2021-07-13 00:24:26.764+00
687	/admin/rdos/31	DELETE	1	2021-07-13 00:26:52.196+00	2021-07-13 00:26:52.196+00
688	/admin/rdos/43	DELETE	1	2021-07-13 00:27:41.379+00	2021-07-13 00:27:41.379+00
689	/admin/rdos/33	DELETE	1	2021-07-13 00:28:46.343+00	2021-07-13 00:28:46.343+00
690	/admin/rdos/34	DELETE	1	2021-07-13 00:29:33.085+00	2021-07-13 00:29:33.085+00
691	/admin/rdos/44	DELETE	1	2021-07-13 00:30:21.545+00	2021-07-13 00:30:21.545+00
692	/admin/rdos/35	DELETE	1	2021-07-13 00:31:54.879+00	2021-07-13 00:31:54.879+00
693	/admin/areas/furos	POST	1	2021-07-13 00:32:59.953+00	2021-07-13 00:32:59.953+00
694	/admin/rdos/37	DELETE	1	2021-07-13 00:34:19.146+00	2021-07-13 00:34:19.146+00
695	/admin/rdos/38	DELETE	1	2021-07-13 00:36:25.381+00	2021-07-13 00:36:25.381+00
696	/admin/rdos/47	DELETE	1	2021-07-13 00:37:09.535+00	2021-07-13 00:37:09.535+00
697	/admin/rdos/41	DELETE	1	2021-07-13 00:38:32.567+00	2021-07-13 00:38:32.567+00
698	/admin/rdos/40	DELETE	1	2021-07-13 00:39:15.864+00	2021-07-13 00:39:15.864+00
699	/admin/rdos/46	DELETE	1	2021-07-13 00:39:25.776+00	2021-07-13 00:39:25.776+00
700	/admin/rdos/42	DELETE	1	2021-07-13 00:40:00.27+00	2021-07-13 00:40:00.27+00
701	/admin/rdos/39	DELETE	1	2021-07-13 00:41:50.165+00	2021-07-13 00:41:50.165+00
702	/admin/rdos/36	DELETE	1	2021-07-13 00:42:40.177+00	2021-07-13 00:42:40.177+00
703	/admin/rdos/94	PUT	1	2021-07-13 00:43:59.984+00	2021-07-13 00:43:59.984+00
704	/admin/rdos/104	PUT	1	2021-07-13 00:49:39.322+00	2021-07-13 00:49:39.322+00
705	/admin/rdos/98	DELETE	1	2021-07-13 00:50:34.722+00	2021-07-13 00:50:34.722+00
706	/admin/configuracoes	POST	3	2021-07-13 11:19:29.766+00	2021-07-13 11:19:29.766+00
707	/admin/rdos/115/atividades	POST	1	2021-07-13 23:04:12.682+00	2021-07-13 23:04:12.682+00
708	/admin/rdos/115/atividades	POST	1	2021-07-13 23:05:48.188+00	2021-07-13 23:05:48.188+00
709	/admin/rdos/115/atividades/795	DELETE	1	2021-07-13 23:07:34.891+00	2021-07-13 23:07:34.891+00
710	/admin/atividades/101	PUT	1	2021-07-13 23:33:11.272+00	2021-07-13 23:33:11.272+00
711	/admin/atividades/89	PUT	1	2021-07-13 23:35:03.484+00	2021-07-13 23:35:03.484+00
712	/admin/atividades	POST	1	2021-07-14 14:38:30.707+00	2021-07-14 14:38:30.707+00
713	/admin/atividades/115	DELETE	1	2021-07-14 14:38:40.534+00	2021-07-14 14:38:40.534+00
714	/admin/users	POST	1	2021-07-14 14:40:08.478+00	2021-07-14 14:40:08.478+00
715	/admin/configuracoes	POST	1	2021-07-14 14:47:16.198+00	2021-07-14 14:47:16.198+00
716	/admin/configuracoes	POST	3	2021-07-14 19:46:01.583+00	2021-07-14 19:46:01.583+00
717	/admin/configuracoes	POST	1	2021-07-14 19:46:13.532+00	2021-07-14 19:46:13.532+00
718	/admin/configuracoes	POST	1	2021-07-14 20:05:14.688+00	2021-07-14 20:05:14.688+00
719	/admin/configuracoes	POST	1	2021-07-14 20:16:53.329+00	2021-07-14 20:16:53.329+00
720	/admin/configuracoes	POST	2	2021-07-14 20:17:21.112+00	2021-07-14 20:17:21.112+00
\.


--
-- Data for Name: api_tokens; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.api_tokens (id, user_id, name, type, token, expires_at, created_at) FROM stdin;
1	1	Opaque Access Token	api	0d78edaf22e8c3575cae62f55d70948dabeae76d53b37d4ea17414cc4f806ff9	\N	2021-05-12 13:36:13.647+00
2	1	Opaque Access Token	api	ae9a975f4911668d4fcc9d1087735ba6b5f6cd6f79bb09bd62d1786ff163f39b	\N	2021-05-12 13:43:08.083+00
3	1	Opaque Access Token	api	7b3086f24d1ed6196646135df12946ce282cacd58078b42362e8406014adcf7d	\N	2021-05-12 13:45:22.846+00
5	1	Opaque Access Token	api	068aa080d23e5267ea41c8a386ff9c84081ab6ffbedd7eb9c18f5ca87f42092f	\N	2021-05-12 13:47:02.376+00
7	1	Opaque Access Token	api	2f8864a06be0ad3db6e7d880484c9a3da329131f96b8dcc7d78b738c923da088	\N	2021-05-13 18:40:37.827+00
8	1	Opaque Access Token	api	8e74e5bd1a5bfff15dbbdafc211c7defb3268965897633971d424f19b1a68141	\N	2021-05-13 19:04:22.833+00
9	1	Opaque Access Token	api	143bf8c38d500b2256e0e99030fb738d3b714e0eeed7142016c0b6c01600317a	\N	2021-05-13 19:20:40.06+00
11	1	Opaque Access Token	api	9d15e088533938184e399aee1a8caf51130588cf934fcf413efa0de351c02f54	\N	2021-05-13 22:02:43.309+00
13	1	Opaque Access Token	api	a63d2999410c98f7cc9444e0186f26628e241be3afae650e0d4a3894487724ef	\N	2021-05-17 17:07:12.883+00
17	1	Opaque Access Token	api	0a67f1dda6d201dd53bebbd4ce8cf61d19ed05bf598ed3b0bd08611235fdefd0	\N	2021-05-28 05:36:55.676+00
18	1	Opaque Access Token	api	6d28619c991dc86a61ab2420868ec47ac8d7df76e7bb4c6c3143123b5f901c15	\N	2021-05-28 11:26:27.885+00
20	1	Opaque Access Token	api	bbb30aef944549bfdfd8d3c7b9a0e0de2e865113327dc346a19dae952edade70	\N	2021-05-28 11:32:00.182+00
21	1	Opaque Access Token	api	211f67b9520f17ae3a81299606871dde2058623d08f7934b7690e06f1aaaef15	\N	2021-05-28 11:39:16.717+00
25	1	Opaque Access Token	api	9f93bb00a80f623cd51accddaeb51ceb07bbda93ec8db085e130e06732cf439a	\N	2021-05-28 12:24:45.278+00
30	1	Opaque Access Token	api	aaab3f94f2170b020aaa648090c757618f5f8102b55ce682f48b1bc39b2871f5	\N	2021-06-01 18:29:28.003+00
31	1	Opaque Access Token	api	05a690826bc5de0d5820632f45043ca4bcca7cd06ececcedddb914fad25476cc	\N	2021-06-01 18:29:46.233+00
32	1	Opaque Access Token	api	c7dd762faed23139f4a137bfbefec618016adf6e60b0f09b351ff8787b598647	\N	2021-06-01 18:40:30.319+00
33	1	Opaque Access Token	api	dcaf048eaa4344b7adada0d6354c33f8822c5f01713214a8a1e879443d2c33b5	\N	2021-06-01 18:41:36.753+00
34	1	Opaque Access Token	api	99c4657c94bb6aeae7fd1b8cf613853309ca5f227c2de98674b66284582d7190	\N	2021-06-01 18:42:07.64+00
35	1	Opaque Access Token	api	b50a293e93c55a8646741e0ebd13e947d54a3dfdcd89b87965778afa6113be61	\N	2021-06-01 18:42:32.256+00
36	1	Opaque Access Token	api	2788f9a091a2b8445d7ecdc3a29c3f6bbd080abe4f9cab862864c588ce225db9	\N	2021-06-01 18:43:10.05+00
37	1	Opaque Access Token	api	49077d94b793e2c3936d18d5ef26a3664d731f5c59c9ae60c284283c65a63d79	\N	2021-06-01 18:46:24.736+00
38	1	Opaque Access Token	api	07504f391895939ec737c710278df7201a264857191f7414496a230d4259dbeb	\N	2021-06-01 19:00:25.657+00
41	1	Opaque Access Token	api	a40d9d383a024ee6a2123f62719e6a7fdb71a86075d57f197401a98ab021d226	\N	2021-06-04 18:23:22.416+00
42	1	Opaque Access Token	api	8b075edf0d9cc586ab3e2b2bca61fc74c997ff8db5f917b8a0eee994ad8db5b2	\N	2021-06-05 15:12:41.823+00
45	1	Opaque Access Token	api	cb108beff8edab4b4485a9af1a4d2f22e4b97ab90975a38e2e26119f34a20db9	\N	2021-06-15 19:02:16.152+00
46	1	Opaque Access Token	api	8ec7ad284b2f991b3f27922c0a59f046334fdff55b3710877976907b54d5e3f3	\N	2021-06-17 11:24:14.586+00
47	1	Opaque Access Token	api	879e62beeb836570eb6199c26c1d91a4c4d3fb286b0e2f1bfc3316320166f542	\N	2021-06-17 11:30:01.095+00
48	1	Opaque Access Token	api	64fe4023733057bffb9c3d0e2116b7129082441731a91045ae10b06e9bb23cb7	\N	2021-06-17 11:48:06.35+00
49	1	Opaque Access Token	api	40e419e8ef04c964e4d372db59032d83a93793544f774a40e1d0bc9ca2ef1a68	\N	2021-06-18 11:29:07.277+00
50	1	Opaque Access Token	api	4d84d7f39fcdd8c336b048bcad814f2ea44b8e2d6985b97c154386e15fec87c8	\N	2021-06-18 13:33:34.942+00
51	1	Opaque Access Token	api	2a4dcb935bab312684d131a7e6d3f9d3dd20464b12ee5e52ae5a5d8ce2485aa7	\N	2021-06-18 14:01:19.841+00
52	1	Opaque Access Token	api	ea65c9408a8b33f98c77865e67cadc37ac9c41a3009faf3db09a1af06d869859	\N	2021-06-18 14:01:20.178+00
53	1	Opaque Access Token	api	efb56d741b4bde95b35ee6d5746de2a339e707a6209a860d00dc927d304d77d1	\N	2021-06-18 14:07:33.589+00
54	1	Opaque Access Token	api	1b4489ead49fcc9a66ba5fa6a949e9292373ed46f91983c22e20dbf8b3beb539	\N	2021-06-18 14:27:40.209+00
55	1	Opaque Access Token	api	ea4b39f15aeff10a740be6ba2bd3824cfa19b534b18c3429572e80a83d6d84c7	\N	2021-06-18 14:51:08.711+00
56	6	Opaque Access Token	api	c4821e9508ef9cbb1c4a0d6d1c4a2e4df0457e95459b8e4361bc7579a9a0eed8	\N	2021-06-18 14:52:22.451+00
57	6	Opaque Access Token	api	4b12697256b751408aa26789ad8566f35f3d33d32e6345bfc76062b68196e2a8	\N	2021-06-18 15:27:42.588+00
58	6	Opaque Access Token	api	9894ddfea14ff3b15ec7466f63b2f46e424969c823f3258350184b2384f32b73	\N	2021-06-18 16:21:19.74+00
59	6	Opaque Access Token	api	afac98f26ea3c4fda2a50faa839a29ef444eeb44a169a021de6923f4a7a5425f	\N	2021-06-18 17:57:45.15+00
60	1	Opaque Access Token	api	80c18524f7c84d5380445f8983734a9dd2c72ff9d7a9225c9c5a8ca35d635ffd	\N	2021-06-18 19:36:24.037+00
61	1	Opaque Access Token	api	e95aba21dc774452b775aa99c7e20d1bf3b07dd293a56298144aa9ca725c83d0	\N	2021-06-18 20:09:00.677+00
62	6	Opaque Access Token	api	91874f4b97ac8c12158b0179a0f1c8a540bc3e8b8a4231acd731d723e800a058	\N	2021-06-20 17:20:37.279+00
63	1	Opaque Access Token	api	c005e429f2696ab17bca2acbcb03aa5a6489294c1f93deb7e2ce7c48d7b71c45	\N	2021-06-21 19:53:25.225+00
64	32	Opaque Access Token	api	2e02c697b3f5b7c5d4c79fa863918bfcfcde9ab97317f44cf908fbbf60386680	\N	2021-06-21 19:57:05.462+00
65	32	Opaque Access Token	api	ee958ca445dd78c4c71fbd609b2c22a1f61ebe4707bc6ec99badcfcc2688e6c8	\N	2021-06-21 19:58:22.248+00
66	32	Opaque Access Token	api	09fceed54089acb5c52e949cf8dcc85e83939454208aa702970582dbb721b41e	\N	2021-06-21 19:59:42.949+00
67	6	Opaque Access Token	api	2b825d1860f0e25aad5cbd6fc7a50cc15ba9573bdc8fa0f66d3daf5a1395baef	\N	2021-06-21 20:00:13.29+00
68	1	Opaque Access Token	api	34cdfcfa60d8e924077e44a087ce603312a01234da2f1167529fa6eb8afa9060	\N	2021-06-21 21:55:59.997+00
69	33	Opaque Access Token	api	eed836747eeb953cff47f35c839f86922e2adda942cf9bb5f9b925b061d0dfdc	\N	2021-06-21 22:07:14.971+00
70	34	Opaque Access Token	api	80fee7eebca121b3abe36f0cbf6a6ac435e4e0520f5894af1bbe96241c13d6d5	\N	2021-06-22 01:53:59.015+00
71	33	Opaque Access Token	api	521a18988cc8fa6f84e011a90803937fc06bcffbde31951cb6d2bf8885745aa5	\N	2021-06-22 12:15:09.878+00
72	6	Opaque Access Token	api	6fa98704fa76d55020c7bf1ca4c151400f40d0bff728f4b7a5509ed8426151b1	\N	2021-06-23 11:59:55.357+00
73	34	Opaque Access Token	api	86c0d081f83d3199133c45cfa440d57bdee0439035a6fea00f1d8178cdb9d658	\N	2021-06-24 13:16:40.199+00
74	33	Opaque Access Token	api	7fcd8afdabdb6398094a9662cc94bb558a57c73d63cc9ab45fda2e3a3eb8040a	\N	2021-06-24 18:28:44.306+00
75	34	Opaque Access Token	api	49be2dfda6d9f627f610d6f383c90e6d808bcb45709904eb69057dcc869ee4ba	\N	2021-06-26 13:26:24.615+00
76	34	Opaque Access Token	api	32fa569026a9658241d989107b335b92ac483d8887c61506f4995042a8dcf3d4	\N	2021-06-26 13:39:18.954+00
77	33	Opaque Access Token	api	0f433563063abd3a4594042b29c28aa691319969ee1ffde08fd1916f834bd4db	\N	2021-06-26 14:32:59.165+00
78	34	Opaque Access Token	api	8905923eaf810bb380b1bfa2d3379806c2766b0920bf2925e414c76a238407ef	\N	2021-06-28 00:49:46.952+00
79	34	Opaque Access Token	api	3cfb27ed586bab2e40d8711138cb84ab9363d007d6f1a8cd40be002a2a136545	\N	2021-06-28 00:49:46.955+00
80	34	Opaque Access Token	api	858c616d12ddc5013ee371909a547c1b4788cafed4fe266936ba2c16feac5f3b	\N	2021-06-28 00:49:46.961+00
81	34	Opaque Access Token	api	b14dd29ec02d6cd6fb3a1c17c07103d78d6399bd61a5b83874415bc2afb6f1df	\N	2021-06-28 00:49:46.974+00
82	34	Opaque Access Token	api	83603dc4b804f302c119f0dd3f033d8216b7e62955c602c6cbdc0b4383f59b0a	\N	2021-06-28 00:49:47.2+00
83	34	Opaque Access Token	api	3ba7a5a643b389f4544a3a67fa69dbcafb6d8b73c09a63882a52aa1fb1ba0e2f	\N	2021-06-28 00:49:47.278+00
84	33	Opaque Access Token	api	602a66d3be301cd5ee6c6708ed04c2e75f994309049d3e4e538b5e469b086f95	\N	2021-06-28 15:22:22.296+00
85	33	Opaque Access Token	api	4ccdd9ad65f0e51f0b577c36b0a32c50d149c7f8c57866a624644e42b0ec6a7e	\N	2021-06-28 15:25:18.414+00
86	33	Opaque Access Token	api	769b256f23a231eda218e8c80044d4850f0f7a416fcf0c32431863295f61eb74	\N	2021-06-28 15:28:46.803+00
87	6	Opaque Access Token	api	141ddd6bc201b56dfb258bcb1fa8629c05e06acdba020c54e5adfbdea20622bd	\N	2021-06-28 17:22:16.765+00
88	33	Opaque Access Token	api	7ba11d059d5c91917848c5dd91bcb3d9e7d5799f04e4a6a688eef2947840c197	\N	2021-06-30 18:48:14.735+00
89	1	Opaque Access Token	api	db67c28188ffd09025f2691664d7282ea34ddb1165600c4d6df5ba0d89f2eb64	\N	2021-07-01 12:49:49.014+00
90	33	Opaque Access Token	api	e82aa6782d78506f50a931fbf0f300a2f20a374e2dda7f986f030226458fa2da	\N	2021-07-01 19:49:44.469+00
91	33	Opaque Access Token	api	8148fd5ffd8744444985882de8194bdc38982dd19b004ca17d145b6a10a2d826	\N	2021-07-01 19:58:14.996+00
92	67	Opaque Access Token	api	99ae103bce615a56fc5d0b2ac7a0e891faba606b9e5c3862d5a7392640fb5b6f	\N	2021-07-01 22:09:17.649+00
93	67	Opaque Access Token	api	248b1ab1dec682fd4a0fc0b1f7aee5498b984079d39166fd7b5df030b446bbc4	\N	2021-07-01 22:10:06.611+00
94	1	Opaque Access Token	api	07306846977ebbbb3c8a9ca27faece775ad4e36b839c3cec8decf70e15d828e3	\N	2021-07-01 23:25:38.834+00
95	1	Opaque Access Token	api	42c9192a17c7b3a30a7a3560b3da3af1fa1e24446bce0177c7072ce022afb6c9	\N	2021-07-01 23:27:19.927+00
96	73	Opaque Access Token	api	af8308f27a0443d77ee8e6932ab0b278fd0aa8fcd362c6b2bc43ef5caecf780a	\N	2021-07-01 23:48:47.685+00
97	73	Opaque Access Token	api	755ab3466a719f1ca148e6349e5f38725781f1ebaa9056a0746fdab519080f11	\N	2021-07-02 00:08:16.69+00
98	34	Opaque Access Token	api	bb3900010b526243e03beea64958162be631e8f3e16ea3bca7bbe440aaaa4456	\N	2021-07-03 12:26:19.291+00
99	34	Opaque Access Token	api	54a9ac45dc675f92ebab85a3e130e927dab16421ba0bda4c6545bcea135f2507	\N	2021-07-05 13:24:04.072+00
100	73	Opaque Access Token	api	5e157731496c78768b33870148a35c3059485a3fc5a9eb97944ee80d39070af3	\N	2021-07-06 03:21:09.922+00
101	34	Opaque Access Token	api	1876b7bd9cf64f09b10aa3c13bcf440a6720d8b43b80333486f29c822a1e3212	\N	2021-07-07 15:12:49.851+00
102	67	Opaque Access Token	api	c24cc1af44b823e549b02c0834079f2b4d9daf56d1851277eddf3fe6c2436f13	\N	2021-07-07 20:12:32.13+00
103	73	Opaque Access Token	api	ea8988b736cbfa22081c0ed9d6a815fc050ddc4737f42ce9aedf0ae8e1450990	\N	2021-07-08 20:22:37.507+00
104	34	Opaque Access Token	api	5582db110b5fed6762af140c2aae9f9a714881ea0868a3b3f74a1ffe6a1c3515	\N	2021-07-10 11:02:06.283+00
105	67	Opaque Access Token	api	54dad00296991fcf95a242aadcfa9f7292418bb161761278de305d0a7bb5a0a4	\N	2021-07-10 12:48:45.243+00
106	33	Opaque Access Token	api	4520c3ad9e55ffc8478ab81d6816c13dd8f7204a4adf7d5a33f0b323c9a99706	\N	2021-07-10 23:31:32.561+00
107	1	Opaque Access Token	api	c7770835702f4c728d8df0212a95f9b01e29be79dc594ee2b2b454e66b9d8d51	\N	2021-07-11 17:07:18.565+00
108	73	Opaque Access Token	api	0b3fae2caaff54f5ccbd3d708aa86dd2a7e873bf929d1a5411437eedcefd9260	\N	2021-07-12 17:42:17.875+00
109	73	Opaque Access Token	api	f86a664158aa267e6e247f4192652ceed907621b3291b915454e7c3a6e834470	\N	2021-07-12 17:42:19.567+00
110	34	Opaque Access Token	api	d1ed8994e7d50aa88cb7dff4e1f41498efbfad2bf358aba2f44b7d68745c44ad	\N	2021-07-12 19:22:45.95+00
111	77	Opaque Access Token	api	a4d17c1d5df3ff27c560e63aad97001f3720837760d2ef11e5a0b8775fea20cd	\N	2021-07-12 20:06:54.539+00
112	34	Opaque Access Token	api	818b850d8becc03e0104f2b932052945159189f004957312a6695d96d3a4cded	\N	2021-07-12 21:24:18.249+00
113	67	Opaque Access Token	api	656461f8936332760a7b8c05c0ecf80671df16a0ea0ff6421e9f62e09d23150b	\N	2021-07-13 00:05:15.313+00
114	73	Opaque Access Token	api	a009270e9de182a715e07ad86e02a46e277b9887ba1f24e8eac28ee13ccd3d78	\N	2021-07-14 19:40:13.622+00
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.areas (id, nome, contrato_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: atividade_cargo_valores; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.atividade_cargo_valores (id, cargo_id, atividade_id, valor_unitario, created_at, updated_at) FROM stdin;
111	11	12	0.00	2021-06-20 18:15:54.98+00	2021-06-20 18:15:54.98+00
112	12	12	0.00	2021-06-20 18:15:54.982+00	2021-06-20 18:15:54.982+00
113	13	12	0.00	2021-06-20 18:15:54.983+00	2021-06-20 18:15:54.983+00
114	14	12	0.00	2021-06-20 18:15:54.985+00	2021-06-20 18:15:54.985+00
115	15	12	0.00	2021-06-20 18:15:54.986+00	2021-06-20 18:15:54.986+00
116	16	12	0.00	2021-06-20 18:15:54.988+00	2021-06-20 18:15:54.988+00
117	17	12	0.00	2021-06-20 18:15:54.99+00	2021-06-20 18:15:54.99+00
118	18	12	0.00	2021-06-20 18:15:54.991+00	2021-06-20 18:15:54.991+00
119	19	12	0.00	2021-06-20 18:15:54.993+00	2021-06-20 18:15:54.993+00
120	20	12	0.00	2021-06-20 18:15:54.995+00	2021-06-20 18:15:54.995+00
121	21	12	0.00	2021-06-20 18:15:54.997+00	2021-06-20 18:15:54.997+00
122	22	12	0.00	2021-06-20 18:15:54.999+00	2021-06-20 18:15:54.999+00
123	23	12	0.00	2021-06-20 18:15:55.001+00	2021-06-20 18:15:55.001+00
124	24	12	0.00	2021-06-20 18:15:55.003+00	2021-06-20 18:15:55.003+00
125	25	12	0.00	2021-06-20 18:15:55.004+00	2021-06-20 18:15:55.004+00
126	26	12	0.00	2021-06-20 18:15:55.006+00	2021-06-20 18:15:55.006+00
127	27	12	0.00	2021-06-20 18:15:55.007+00	2021-06-20 18:15:55.007+00
128	11	13	0.00	2021-06-20 18:16:57.346+00	2021-06-20 18:16:57.346+00
129	12	13	0.00	2021-06-20 18:16:57.347+00	2021-06-20 18:16:57.347+00
130	13	13	0.00	2021-06-20 18:16:57.349+00	2021-06-20 18:16:57.349+00
131	14	13	0.00	2021-06-20 18:16:57.35+00	2021-06-20 18:16:57.35+00
33	11	6	0.00	2021-06-18 16:06:15.556+00	2021-06-18 16:06:15.556+00
34	12	6	10.00	2021-06-18 16:06:15.559+00	2021-06-18 16:06:15.559+00
35	13	6	10.00	2021-06-18 16:06:15.56+00	2021-06-18 16:06:15.56+00
36	14	6	10.00	2021-06-18 16:06:15.562+00	2021-06-18 16:06:15.562+00
37	15	6	15.00	2021-06-18 16:06:15.563+00	2021-06-18 16:06:15.563+00
38	16	6	15.00	2021-06-18 16:06:15.566+00	2021-06-18 16:06:15.566+00
39	17	6	15.00	2021-06-18 16:06:15.568+00	2021-06-18 16:06:15.568+00
40	18	6	18.00	2021-06-18 16:06:15.569+00	2021-06-18 16:06:15.57+00
41	19	6	0.00	2021-06-18 16:06:15.571+00	2021-06-18 16:06:15.571+00
42	20	6	0.00	2021-06-18 16:06:15.573+00	2021-06-18 16:06:15.573+00
43	21	6	0.00	2021-06-18 16:06:15.574+00	2021-06-18 16:06:15.574+00
44	22	6	0.00	2021-06-18 16:06:15.576+00	2021-06-18 16:06:15.576+00
45	23	6	0.00	2021-06-18 16:06:15.581+00	2021-06-18 16:06:15.581+00
46	24	6	0.00	2021-06-18 16:06:15.584+00	2021-06-18 16:06:15.584+00
47	25	6	1.00	2021-06-18 16:06:15.585+00	2021-06-18 16:06:15.585+00
48	11	7	0.00	2021-06-18 16:09:18.594+00	2021-06-18 16:09:18.594+00
49	12	7	5.00	2021-06-18 16:09:18.596+00	2021-06-18 16:09:18.596+00
50	13	7	5.00	2021-06-18 16:09:18.597+00	2021-06-18 16:09:18.597+00
51	14	7	5.00	2021-06-18 16:09:18.598+00	2021-06-18 16:09:18.598+00
52	15	7	5.00	2021-06-18 16:09:18.6+00	2021-06-18 16:09:18.6+00
53	16	7	5.00	2021-06-18 16:09:18.601+00	2021-06-18 16:09:18.601+00
54	17	7	5.00	2021-06-18 16:09:18.602+00	2021-06-18 16:09:18.602+00
55	18	7	5.00	2021-06-18 16:09:18.603+00	2021-06-18 16:09:18.603+00
56	19	7	5.00	2021-06-18 16:09:18.604+00	2021-06-18 16:09:18.604+00
57	20	7	1.00	2021-06-18 16:09:18.612+00	2021-06-18 16:09:18.612+00
58	21	7	0.00	2021-06-18 16:09:18.614+00	2021-06-18 16:09:18.614+00
59	22	7	0.00	2021-06-18 16:09:18.615+00	2021-06-18 16:09:18.615+00
60	23	7	0.00	2021-06-18 16:09:18.616+00	2021-06-18 16:09:18.616+00
61	24	7	0.00	2021-06-18 16:09:18.617+00	2021-06-18 16:09:18.617+00
62	25	7	0.00	2021-06-18 16:09:18.619+00	2021-06-18 16:09:18.619+00
132	15	13	0.00	2021-06-20 18:16:57.352+00	2021-06-20 18:16:57.352+00
133	16	13	0.00	2021-06-20 18:16:57.353+00	2021-06-20 18:16:57.353+00
134	17	13	0.00	2021-06-20 18:16:57.355+00	2021-06-20 18:16:57.355+00
135	18	13	0.00	2021-06-20 18:16:57.356+00	2021-06-20 18:16:57.356+00
136	19	13	0.00	2021-06-20 18:16:57.358+00	2021-06-20 18:16:57.358+00
137	20	13	0.00	2021-06-20 18:16:57.359+00	2021-06-20 18:16:57.359+00
138	21	13	0.00	2021-06-20 18:16:57.361+00	2021-06-20 18:16:57.361+00
139	22	13	0.00	2021-06-20 18:16:57.364+00	2021-06-20 18:16:57.364+00
140	23	13	0.00	2021-06-20 18:16:57.366+00	2021-06-20 18:16:57.366+00
141	24	13	0.00	2021-06-20 18:16:57.367+00	2021-06-20 18:16:57.367+00
142	25	13	0.00	2021-06-20 18:16:57.369+00	2021-06-20 18:16:57.369+00
143	26	13	0.00	2021-06-20 18:16:57.37+00	2021-06-20 18:16:57.37+00
144	27	13	0.00	2021-06-20 18:16:57.372+00	2021-06-20 18:16:57.372+00
145	11	14	0.00	2021-06-20 18:17:34.3+00	2021-06-20 18:17:34.3+00
146	12	14	0.00	2021-06-20 18:17:34.302+00	2021-06-20 18:17:34.302+00
147	13	14	0.00	2021-06-20 18:17:34.303+00	2021-06-20 18:17:34.303+00
148	14	14	0.00	2021-06-20 18:17:34.305+00	2021-06-20 18:17:34.305+00
149	15	14	0.00	2021-06-20 18:17:34.306+00	2021-06-20 18:17:34.306+00
150	16	14	0.00	2021-06-20 18:17:34.308+00	2021-06-20 18:17:34.308+00
151	17	14	0.00	2021-06-20 18:17:34.309+00	2021-06-20 18:17:34.309+00
152	18	14	0.00	2021-06-20 18:17:34.311+00	2021-06-20 18:17:34.311+00
153	19	14	0.00	2021-06-20 18:17:34.312+00	2021-06-20 18:17:34.312+00
154	20	14	0.00	2021-06-20 18:17:34.314+00	2021-06-20 18:17:34.314+00
155	21	14	0.00	2021-06-20 18:17:34.316+00	2021-06-20 18:17:34.316+00
156	22	14	0.00	2021-06-20 18:17:34.318+00	2021-06-20 18:17:34.318+00
157	23	14	0.00	2021-06-20 18:17:34.319+00	2021-06-20 18:17:34.319+00
158	24	14	0.00	2021-06-20 18:17:34.321+00	2021-06-20 18:17:34.321+00
159	25	14	0.00	2021-06-20 18:17:34.322+00	2021-06-20 18:17:34.322+00
160	26	14	0.00	2021-06-20 18:17:34.324+00	2021-06-20 18:17:34.324+00
161	27	14	0.00	2021-06-20 18:17:34.325+00	2021-06-20 18:17:34.325+00
162	11	15	0.00	2021-06-20 18:18:40.67+00	2021-06-20 18:18:40.67+00
163	12	15	0.00	2021-06-20 18:18:40.672+00	2021-06-20 18:18:40.672+00
95	11	8	0.00	2021-06-18 19:08:20.927+00	2021-06-18 19:08:20.927+00
96	12	8	3.00	2021-06-18 19:08:20.93+00	2021-06-18 19:08:20.93+00
97	13	8	3.00	2021-06-18 19:08:20.931+00	2021-06-18 19:08:20.931+00
98	14	8	3.00	2021-06-18 19:08:20.933+00	2021-06-18 19:08:20.933+00
99	15	8	5.00	2021-06-18 19:08:20.935+00	2021-06-18 19:08:20.935+00
100	16	8	5.00	2021-06-18 19:08:20.937+00	2021-06-18 19:08:20.937+00
101	17	8	5.00	2021-06-18 19:08:20.94+00	2021-06-18 19:08:20.941+00
102	18	8	5.00	2021-06-18 19:08:20.942+00	2021-06-18 19:08:20.942+00
103	19	8	3.00	2021-06-18 19:08:20.944+00	2021-06-18 19:08:20.944+00
104	20	8	0.00	2021-06-18 19:08:20.946+00	2021-06-18 19:08:20.946+00
105	21	8	0.00	2021-06-18 19:08:20.948+00	2021-06-18 19:08:20.948+00
106	22	8	3.00	2021-06-18 19:08:20.95+00	2021-06-18 19:08:20.95+00
107	23	8	0.00	2021-06-18 19:08:20.951+00	2021-06-18 19:08:20.951+00
108	24	8	0.00	2021-06-18 19:08:20.953+00	2021-06-18 19:08:20.953+00
109	25	8	0.00	2021-06-18 19:08:20.955+00	2021-06-18 19:08:20.955+00
110	26	8	0.50	2021-06-18 19:08:20.956+00	2021-06-18 19:08:20.956+00
164	13	15	0.00	2021-06-20 18:18:40.674+00	2021-06-20 18:18:40.674+00
165	14	15	0.00	2021-06-20 18:18:40.676+00	2021-06-20 18:18:40.676+00
166	15	15	0.00	2021-06-20 18:18:40.678+00	2021-06-20 18:18:40.678+00
167	16	15	0.00	2021-06-20 18:18:40.68+00	2021-06-20 18:18:40.68+00
168	17	15	0.00	2021-06-20 18:18:40.682+00	2021-06-20 18:18:40.682+00
169	18	15	0.00	2021-06-20 18:18:40.69+00	2021-06-20 18:18:40.69+00
170	19	15	0.00	2021-06-20 18:18:40.691+00	2021-06-20 18:18:40.691+00
171	20	15	0.00	2021-06-20 18:18:40.693+00	2021-06-20 18:18:40.693+00
172	21	15	0.00	2021-06-20 18:18:40.695+00	2021-06-20 18:18:40.695+00
173	22	15	0.00	2021-06-20 18:18:40.696+00	2021-06-20 18:18:40.696+00
174	23	15	0.00	2021-06-20 18:18:40.698+00	2021-06-20 18:18:40.698+00
175	24	15	0.00	2021-06-20 18:18:40.7+00	2021-06-20 18:18:40.7+00
176	25	15	0.00	2021-06-20 18:18:40.703+00	2021-06-20 18:18:40.703+00
177	26	15	0.00	2021-06-20 18:18:40.705+00	2021-06-20 18:18:40.705+00
178	27	15	0.00	2021-06-20 18:18:40.707+00	2021-06-20 18:18:40.707+00
179	11	16	0.00	2021-06-20 18:20:31.436+00	2021-06-20 18:20:31.436+00
180	12	16	0.00	2021-06-20 18:20:31.438+00	2021-06-20 18:20:31.438+00
181	13	16	0.00	2021-06-20 18:20:31.439+00	2021-06-20 18:20:31.439+00
182	14	16	0.00	2021-06-20 18:20:31.44+00	2021-06-20 18:20:31.44+00
183	15	16	0.00	2021-06-20 18:20:31.442+00	2021-06-20 18:20:31.442+00
184	16	16	0.00	2021-06-20 18:20:31.45+00	2021-06-20 18:20:31.45+00
185	17	16	0.00	2021-06-20 18:20:31.455+00	2021-06-20 18:20:31.455+00
186	18	16	0.00	2021-06-20 18:20:31.457+00	2021-06-20 18:20:31.457+00
187	19	16	0.00	2021-06-20 18:20:31.459+00	2021-06-20 18:20:31.459+00
188	20	16	0.00	2021-06-20 18:20:31.46+00	2021-06-20 18:20:31.46+00
189	21	16	0.00	2021-06-20 18:20:31.462+00	2021-06-20 18:20:31.462+00
190	22	16	0.00	2021-06-20 18:20:31.463+00	2021-06-20 18:20:31.463+00
191	23	16	0.00	2021-06-20 18:20:31.464+00	2021-06-20 18:20:31.464+00
192	24	16	0.00	2021-06-20 18:20:31.466+00	2021-06-20 18:20:31.466+00
193	25	16	0.00	2021-06-20 18:20:31.467+00	2021-06-20 18:20:31.467+00
194	26	16	0.00	2021-06-20 18:20:31.469+00	2021-06-20 18:20:31.469+00
195	27	16	0.00	2021-06-20 18:20:31.47+00	2021-06-20 18:20:31.47+00
211	28	1	9.00	2021-06-22 17:12:52.84+00	2021-06-22 17:12:52.84+00
212	29	1	10.00	2021-06-22 17:12:52.841+00	2021-06-22 17:12:52.841+00
213	30	1	6.00	2021-06-22 17:12:52.843+00	2021-06-22 17:12:52.843+00
214	31	1	9.00	2021-06-22 17:12:52.844+00	2021-06-22 17:12:52.844+00
215	32	1	3.00	2021-06-22 17:12:52.845+00	2021-06-22 17:12:52.845+00
216	33	1	1.00	2021-06-22 17:12:52.846+00	2021-06-22 17:12:52.846+00
217	34	1	0.00	2021-06-22 17:12:52.847+00	2021-06-22 17:12:52.847+00
218	35	1	5.00	2021-06-22 17:12:52.848+00	2021-06-22 17:12:52.848+00
220	28	17	7.00	2021-06-22 17:15:37.192+00	2021-06-22 17:15:37.192+00
221	29	17	5.00	2021-06-22 17:15:37.194+00	2021-06-22 17:15:37.194+00
222	30	17	4.00	2021-06-22 17:15:37.195+00	2021-06-22 17:15:37.195+00
223	31	17	7.00	2021-06-22 17:15:37.196+00	2021-06-22 17:15:37.196+00
224	32	17	2.00	2021-06-22 17:15:37.197+00	2021-06-22 17:15:37.197+00
225	33	17	0.70	2021-06-22 17:15:37.199+00	2021-06-22 17:15:37.199+00
226	34	17	0.00	2021-06-22 17:15:37.2+00	2021-06-22 17:15:37.2+00
227	35	17	3.00	2021-06-22 17:15:37.201+00	2021-06-22 17:15:37.201+00
229	28	18	7.00	2021-06-22 17:19:58.408+00	2021-06-22 17:19:58.408+00
230	29	18	6.50	2021-06-22 17:19:58.41+00	2021-06-22 17:19:58.41+00
231	30	18	5.00	2021-06-22 17:19:58.411+00	2021-06-22 17:19:58.411+00
232	31	18	7.00	2021-06-22 17:19:58.412+00	2021-06-22 17:19:58.412+00
233	32	18	2.50	2021-06-22 17:19:58.414+00	2021-06-22 17:19:58.414+00
234	33	18	1.00	2021-06-22 17:19:58.415+00	2021-06-22 17:19:58.415+00
235	34	18	0.00	2021-06-22 17:19:58.416+00	2021-06-22 17:19:58.416+00
236	35	18	4.00	2021-06-22 17:19:58.417+00	2021-06-22 17:19:58.417+00
238	28	19	9.00	2021-06-22 17:22:59.782+00	2021-06-22 17:22:59.782+00
239	29	19	10.00	2021-06-22 17:22:59.783+00	2021-06-22 17:22:59.783+00
240	30	19	6.00	2021-06-22 17:22:59.785+00	2021-06-22 17:22:59.785+00
241	31	19	9.00	2021-06-22 17:22:59.786+00	2021-06-22 17:22:59.786+00
242	32	19	3.00	2021-06-22 17:22:59.788+00	2021-06-22 17:22:59.788+00
243	33	19	1.00	2021-06-22 17:22:59.789+00	2021-06-22 17:22:59.789+00
244	34	19	0.00	2021-06-22 17:22:59.79+00	2021-06-22 17:22:59.79+00
245	35	19	5.00	2021-06-22 17:22:59.791+00	2021-06-22 17:22:59.791+00
247	28	20	7.00	2021-06-22 17:26:23.772+00	2021-06-22 17:26:23.772+00
248	29	20	6.50	2021-06-22 17:26:23.774+00	2021-06-22 17:26:23.774+00
249	30	20	5.00	2021-06-22 17:26:23.775+00	2021-06-22 17:26:23.775+00
250	31	20	7.00	2021-06-22 17:26:23.776+00	2021-06-22 17:26:23.776+00
251	32	20	2.50	2021-06-22 17:26:23.778+00	2021-06-22 17:26:23.778+00
252	33	20	1.00	2021-06-22 17:26:23.779+00	2021-06-22 17:26:23.779+00
253	34	20	0.00	2021-06-22 17:26:23.78+00	2021-06-22 17:26:23.78+00
254	35	20	4.00	2021-06-22 17:26:23.783+00	2021-06-22 17:26:23.783+00
256	28	21	9.00	2021-06-22 17:29:50.998+00	2021-06-22 17:29:50.998+00
257	29	21	10.00	2021-06-22 17:29:51+00	2021-06-22 17:29:51+00
258	30	21	6.00	2021-06-22 17:29:51.001+00	2021-06-22 17:29:51.001+00
259	31	21	9.00	2021-06-22 17:29:51.003+00	2021-06-22 17:29:51.003+00
260	32	21	3.00	2021-06-22 17:29:51.004+00	2021-06-22 17:29:51.004+00
261	33	21	1.00	2021-06-22 17:29:51.005+00	2021-06-22 17:29:51.005+00
262	34	21	0.00	2021-06-22 17:29:51.006+00	2021-06-22 17:29:51.006+00
263	35	21	5.00	2021-06-22 17:29:51.008+00	2021-06-22 17:29:51.008+00
264	28	22	3.00	2021-06-22 17:33:36.013+00	2021-06-22 17:33:36.013+00
265	29	22	3.00	2021-06-22 17:33:36.015+00	2021-06-22 17:33:36.015+00
266	30	22	2.00	2021-06-22 17:33:36.016+00	2021-06-22 17:33:36.016+00
267	31	22	3.00	2021-06-22 17:33:36.017+00	2021-06-22 17:33:36.017+00
268	32	22	0.50	2021-06-22 17:33:36.018+00	2021-06-22 17:33:36.018+00
269	33	22	0.50	2021-06-22 17:33:36.019+00	2021-06-22 17:33:36.019+00
270	34	22	0.00	2021-06-22 17:33:36.02+00	2021-06-22 17:33:36.02+00
271	35	22	3.00	2021-06-22 17:33:36.021+00	2021-06-22 17:33:36.021+00
272	28	23	2.00	2021-06-22 17:36:27.797+00	2021-06-22 17:36:27.797+00
273	29	23	2.00	2021-06-22 17:36:27.798+00	2021-06-22 17:36:27.798+00
274	30	23	2.00	2021-06-22 17:36:27.799+00	2021-06-22 17:36:27.799+00
275	31	23	2.00	2021-06-22 17:36:27.8+00	2021-06-22 17:36:27.8+00
276	32	23	0.50	2021-06-22 17:36:27.802+00	2021-06-22 17:36:27.802+00
277	33	23	0.50	2021-06-22 17:36:27.803+00	2021-06-22 17:36:27.803+00
278	34	23	0.00	2021-06-22 17:36:27.804+00	2021-06-22 17:36:27.804+00
279	35	23	2.00	2021-06-22 17:36:27.805+00	2021-06-22 17:36:27.805+00
288	28	24	70.00	2021-06-22 17:41:24.59+00	2021-06-22 17:41:24.59+00
289	29	24	50.00	2021-06-22 17:41:24.592+00	2021-06-22 17:41:24.592+00
290	30	24	25.00	2021-06-22 17:41:24.594+00	2021-06-22 17:41:24.594+00
291	31	24	70.00	2021-06-22 17:41:24.595+00	2021-06-22 17:41:24.595+00
292	32	24	0.00	2021-06-22 17:41:24.596+00	2021-06-22 17:41:24.597+00
293	33	24	0.00	2021-06-22 17:41:24.598+00	2021-06-22 17:41:24.598+00
294	34	24	0.00	2021-06-22 17:41:24.599+00	2021-06-22 17:41:24.6+00
295	35	24	30.00	2021-06-22 17:41:24.601+00	2021-06-22 17:41:24.601+00
296	28	2	16.00	2021-06-22 17:41:35.072+00	2021-06-22 17:41:35.072+00
297	29	2	18.00	2021-06-22 17:41:35.074+00	2021-06-22 17:41:35.074+00
298	30	2	12.00	2021-06-22 17:41:35.075+00	2021-06-22 17:41:35.075+00
299	31	2	16.00	2021-06-22 17:41:35.076+00	2021-06-22 17:41:35.076+00
300	32	2	0.00	2021-06-22 17:41:35.078+00	2021-06-22 17:41:35.078+00
301	33	2	0.00	2021-06-22 17:41:35.079+00	2021-06-22 17:41:35.079+00
302	34	2	0.00	2021-06-22 17:41:35.08+00	2021-06-22 17:41:35.08+00
303	35	2	8.00	2021-06-22 17:41:35.081+00	2021-06-22 17:41:35.081+00
304	28	25	100.00	2021-06-22 17:44:23.68+00	2021-06-22 17:44:23.68+00
305	29	25	80.00	2021-06-22 17:44:23.682+00	2021-06-22 17:44:23.682+00
306	30	25	50.00	2021-06-22 17:44:23.683+00	2021-06-22 17:44:23.683+00
307	31	25	100.00	2021-06-22 17:44:23.685+00	2021-06-22 17:44:23.685+00
308	32	25	0.00	2021-06-22 17:44:23.686+00	2021-06-22 17:44:23.686+00
309	33	25	0.00	2021-06-22 17:44:23.687+00	2021-06-22 17:44:23.687+00
310	34	25	0.00	2021-06-22 17:44:23.688+00	2021-06-22 17:44:23.689+00
311	35	25	60.00	2021-06-22 17:44:23.69+00	2021-06-22 17:44:23.69+00
312	28	26	10.00	2021-06-22 17:46:27.603+00	2021-06-22 17:46:27.603+00
313	29	26	5.00	2021-06-22 17:46:27.604+00	2021-06-22 17:46:27.604+00
314	30	26	3.00	2021-06-22 17:46:27.605+00	2021-06-22 17:46:27.605+00
315	31	26	10.00	2021-06-22 17:46:27.607+00	2021-06-22 17:46:27.607+00
316	32	26	0.00	2021-06-22 17:46:27.608+00	2021-06-22 17:46:27.608+00
317	33	26	0.00	2021-06-22 17:46:27.61+00	2021-06-22 17:46:27.61+00
318	34	26	0.00	2021-06-22 17:46:27.612+00	2021-06-22 17:46:27.612+00
319	35	26	8.00	2021-06-22 17:46:27.613+00	2021-06-22 17:46:27.613+00
320	28	27	40.00	2021-06-22 17:49:01.345+00	2021-06-22 17:49:01.345+00
321	29	27	50.00	2021-06-22 17:49:01.347+00	2021-06-22 17:49:01.347+00
322	30	27	30.00	2021-06-22 17:49:01.349+00	2021-06-22 17:49:01.349+00
323	31	27	40.00	2021-06-22 17:49:01.351+00	2021-06-22 17:49:01.351+00
324	32	27	0.00	2021-06-22 17:49:01.353+00	2021-06-22 17:49:01.353+00
325	33	27	0.00	2021-06-22 17:49:01.355+00	2021-06-22 17:49:01.355+00
326	34	27	0.00	2021-06-22 17:49:01.357+00	2021-06-22 17:49:01.357+00
327	35	27	20.00	2021-06-22 17:49:01.361+00	2021-06-22 17:49:01.361+00
344	28	29	5.00	2021-06-22 17:56:33.184+00	2021-06-22 17:56:33.184+00
345	29	29	5.00	2021-06-22 17:56:33.185+00	2021-06-22 17:56:33.185+00
346	30	29	2.00	2021-06-22 17:56:33.187+00	2021-06-22 17:56:33.187+00
347	31	29	5.00	2021-06-22 17:56:33.188+00	2021-06-22 17:56:33.188+00
348	32	29	0.50	2021-06-22 17:56:33.189+00	2021-06-22 17:56:33.189+00
349	33	29	0.00	2021-06-22 17:56:33.191+00	2021-06-22 17:56:33.191+00
350	34	29	0.00	2021-06-22 17:56:33.192+00	2021-06-22 17:56:33.192+00
351	35	29	5.00	2021-06-22 17:56:33.193+00	2021-06-22 17:56:33.193+00
352	28	28	5.00	2021-06-22 21:49:31.235+00	2021-06-22 21:49:31.235+00
353	29	28	5.00	2021-06-22 21:49:31.236+00	2021-06-22 21:49:31.236+00
354	30	28	2.00	2021-06-22 21:49:31.238+00	2021-06-22 21:49:31.238+00
355	31	28	5.00	2021-06-22 21:49:31.239+00	2021-06-22 21:49:31.239+00
356	32	28	0.50	2021-06-22 21:49:31.24+00	2021-06-22 21:49:31.24+00
357	33	28	0.00	2021-06-22 21:49:31.242+00	2021-06-22 21:49:31.242+00
358	34	28	0.00	2021-06-22 21:49:31.243+00	2021-06-22 21:49:31.243+00
359	35	28	5.00	2021-06-22 21:49:31.245+00	2021-06-22 21:49:31.245+00
360	11	54	0.00	2021-06-23 12:50:21.065+00	2021-06-23 12:50:21.065+00
361	12	54	0.00	2021-06-23 12:50:21.066+00	2021-06-23 12:50:21.066+00
362	13	54	0.00	2021-06-23 12:50:21.068+00	2021-06-23 12:50:21.068+00
363	14	54	0.00	2021-06-23 12:50:21.069+00	2021-06-23 12:50:21.069+00
364	15	54	0.00	2021-06-23 12:50:21.07+00	2021-06-23 12:50:21.07+00
365	16	54	0.00	2021-06-23 12:50:21.072+00	2021-06-23 12:50:21.072+00
366	17	54	0.00	2021-06-23 12:50:21.073+00	2021-06-23 12:50:21.073+00
367	18	54	0.00	2021-06-23 12:50:21.074+00	2021-06-23 12:50:21.074+00
368	19	54	0.00	2021-06-23 12:50:21.077+00	2021-06-23 12:50:21.077+00
369	20	54	0.00	2021-06-23 12:50:21.078+00	2021-06-23 12:50:21.078+00
370	21	54	0.00	2021-06-23 12:50:21.079+00	2021-06-23 12:50:21.079+00
371	22	54	0.00	2021-06-23 12:50:21.08+00	2021-06-23 12:50:21.08+00
372	23	54	0.00	2021-06-23 12:50:21.082+00	2021-06-23 12:50:21.082+00
373	24	54	0.00	2021-06-23 12:50:21.083+00	2021-06-23 12:50:21.083+00
374	25	54	0.00	2021-06-23 12:50:21.084+00	2021-06-23 12:50:21.084+00
375	26	54	0.00	2021-06-23 12:50:21.086+00	2021-06-23 12:50:21.086+00
376	27	54	0.00	2021-06-23 12:50:21.087+00	2021-06-23 12:50:21.087+00
377	11	55	0.00	2021-06-23 12:53:28.577+00	2021-06-23 12:53:28.577+00
378	12	55	0.00	2021-06-23 12:53:28.58+00	2021-06-23 12:53:28.58+00
379	13	55	0.00	2021-06-23 12:53:28.581+00	2021-06-23 12:53:28.581+00
380	14	55	0.00	2021-06-23 12:53:28.582+00	2021-06-23 12:53:28.582+00
381	15	55	0.00	2021-06-23 12:53:28.584+00	2021-06-23 12:53:28.584+00
382	16	55	0.00	2021-06-23 12:53:28.585+00	2021-06-23 12:53:28.585+00
383	17	55	0.00	2021-06-23 12:53:28.587+00	2021-06-23 12:53:28.587+00
384	18	55	0.00	2021-06-23 12:53:28.588+00	2021-06-23 12:53:28.588+00
385	19	55	0.00	2021-06-23 12:53:28.589+00	2021-06-23 12:53:28.59+00
386	20	55	0.00	2021-06-23 12:53:28.591+00	2021-06-23 12:53:28.591+00
387	21	55	0.00	2021-06-23 12:53:28.592+00	2021-06-23 12:53:28.592+00
388	22	55	0.00	2021-06-23 12:53:28.6+00	2021-06-23 12:53:28.6+00
389	23	55	0.00	2021-06-23 12:53:28.601+00	2021-06-23 12:53:28.601+00
390	24	55	0.00	2021-06-23 12:53:28.602+00	2021-06-23 12:53:28.602+00
391	25	55	0.00	2021-06-23 12:53:28.604+00	2021-06-23 12:53:28.604+00
392	26	55	0.00	2021-06-23 12:53:28.605+00	2021-06-23 12:53:28.605+00
393	27	55	0.00	2021-06-23 12:53:28.606+00	2021-06-23 12:53:28.606+00
394	11	56	0.00	2021-06-23 12:54:27.367+00	2021-06-23 12:54:27.367+00
395	12	56	0.00	2021-06-23 12:54:27.368+00	2021-06-23 12:54:27.368+00
396	13	56	0.00	2021-06-23 12:54:27.37+00	2021-06-23 12:54:27.37+00
397	14	56	0.00	2021-06-23 12:54:27.372+00	2021-06-23 12:54:27.372+00
398	15	56	0.00	2021-06-23 12:54:27.373+00	2021-06-23 12:54:27.373+00
399	16	56	0.00	2021-06-23 12:54:27.374+00	2021-06-23 12:54:27.374+00
400	17	56	0.00	2021-06-23 12:54:27.375+00	2021-06-23 12:54:27.375+00
401	18	56	0.00	2021-06-23 12:54:27.377+00	2021-06-23 12:54:27.377+00
402	19	56	0.00	2021-06-23 12:54:27.378+00	2021-06-23 12:54:27.378+00
403	20	56	0.00	2021-06-23 12:54:27.379+00	2021-06-23 12:54:27.379+00
404	21	56	0.00	2021-06-23 12:54:27.381+00	2021-06-23 12:54:27.381+00
405	22	56	0.00	2021-06-23 12:54:27.382+00	2021-06-23 12:54:27.382+00
406	23	56	0.00	2021-06-23 12:54:27.385+00	2021-06-23 12:54:27.385+00
407	24	56	0.00	2021-06-23 12:54:27.387+00	2021-06-23 12:54:27.387+00
408	25	56	0.00	2021-06-23 12:54:27.388+00	2021-06-23 12:54:27.388+00
409	26	56	0.00	2021-06-23 12:54:27.389+00	2021-06-23 12:54:27.389+00
410	27	56	0.00	2021-06-23 12:54:27.392+00	2021-06-23 12:54:27.392+00
428	11	57	0.00	2021-06-23 12:56:17.609+00	2021-06-23 12:56:17.61+00
429	12	57	0.00	2021-06-23 12:56:17.611+00	2021-06-23 12:56:17.611+00
430	13	57	0.00	2021-06-23 12:56:17.612+00	2021-06-23 12:56:17.612+00
431	14	57	0.00	2021-06-23 12:56:17.614+00	2021-06-23 12:56:17.614+00
432	15	57	0.00	2021-06-23 12:56:17.615+00	2021-06-23 12:56:17.615+00
433	16	57	0.00	2021-06-23 12:56:17.616+00	2021-06-23 12:56:17.616+00
434	17	57	0.00	2021-06-23 12:56:17.617+00	2021-06-23 12:56:17.617+00
435	18	57	0.00	2021-06-23 12:56:17.619+00	2021-06-23 12:56:17.619+00
436	19	57	0.00	2021-06-23 12:56:17.62+00	2021-06-23 12:56:17.62+00
437	20	57	0.00	2021-06-23 12:56:17.622+00	2021-06-23 12:56:17.622+00
438	21	57	0.00	2021-06-23 12:56:17.623+00	2021-06-23 12:56:17.623+00
439	22	57	0.00	2021-06-23 12:56:17.625+00	2021-06-23 12:56:17.625+00
440	23	57	0.00	2021-06-23 12:56:17.626+00	2021-06-23 12:56:17.626+00
441	24	57	0.00	2021-06-23 12:56:17.628+00	2021-06-23 12:56:17.628+00
442	25	57	0.00	2021-06-23 12:56:17.629+00	2021-06-23 12:56:17.629+00
443	26	57	0.00	2021-06-23 12:56:17.63+00	2021-06-23 12:56:17.63+00
444	27	57	0.00	2021-06-23 12:56:17.632+00	2021-06-23 12:56:17.632+00
445	11	58	0.00	2021-06-23 12:56:41.837+00	2021-06-23 12:56:41.837+00
446	12	58	0.00	2021-06-23 12:56:41.838+00	2021-06-23 12:56:41.838+00
447	13	58	0.00	2021-06-23 12:56:41.84+00	2021-06-23 12:56:41.84+00
448	14	58	0.00	2021-06-23 12:56:41.841+00	2021-06-23 12:56:41.841+00
449	15	58	0.00	2021-06-23 12:56:41.842+00	2021-06-23 12:56:41.842+00
450	16	58	0.00	2021-06-23 12:56:41.847+00	2021-06-23 12:56:41.847+00
451	17	58	0.00	2021-06-23 12:56:41.848+00	2021-06-23 12:56:41.848+00
452	18	58	0.00	2021-06-23 12:56:41.85+00	2021-06-23 12:56:41.85+00
453	19	58	0.00	2021-06-23 12:56:41.851+00	2021-06-23 12:56:41.851+00
454	20	58	0.00	2021-06-23 12:56:41.852+00	2021-06-23 12:56:41.852+00
455	21	58	0.00	2021-06-23 12:56:41.854+00	2021-06-23 12:56:41.854+00
456	22	58	0.00	2021-06-23 12:56:41.855+00	2021-06-23 12:56:41.855+00
457	23	58	0.00	2021-06-23 12:56:41.856+00	2021-06-23 12:56:41.856+00
458	24	58	0.00	2021-06-23 12:56:41.857+00	2021-06-23 12:56:41.857+00
459	25	58	0.00	2021-06-23 12:56:41.858+00	2021-06-23 12:56:41.858+00
460	26	58	0.00	2021-06-23 12:56:41.86+00	2021-06-23 12:56:41.86+00
461	27	58	0.00	2021-06-23 12:56:41.861+00	2021-06-23 12:56:41.861+00
462	11	59	0.00	2021-06-23 12:57:35.025+00	2021-06-23 12:57:35.025+00
463	12	59	0.00	2021-06-23 12:57:35.027+00	2021-06-23 12:57:35.027+00
464	13	59	0.00	2021-06-23 12:57:35.028+00	2021-06-23 12:57:35.028+00
465	14	59	0.00	2021-06-23 12:57:35.03+00	2021-06-23 12:57:35.03+00
466	15	59	0.00	2021-06-23 12:57:35.039+00	2021-06-23 12:57:35.039+00
467	16	59	0.00	2021-06-23 12:57:35.04+00	2021-06-23 12:57:35.04+00
468	17	59	0.00	2021-06-23 12:57:35.041+00	2021-06-23 12:57:35.041+00
469	18	59	0.00	2021-06-23 12:57:35.046+00	2021-06-23 12:57:35.046+00
470	19	59	0.00	2021-06-23 12:57:35.047+00	2021-06-23 12:57:35.047+00
471	20	59	0.00	2021-06-23 12:57:35.048+00	2021-06-23 12:57:35.049+00
472	21	59	0.00	2021-06-23 12:57:35.054+00	2021-06-23 12:57:35.054+00
473	22	59	0.00	2021-06-23 12:57:35.055+00	2021-06-23 12:57:35.055+00
474	23	59	0.00	2021-06-23 12:57:35.056+00	2021-06-23 12:57:35.056+00
475	24	59	0.00	2021-06-23 12:57:35.067+00	2021-06-23 12:57:35.067+00
476	25	59	0.00	2021-06-23 12:57:35.068+00	2021-06-23 12:57:35.068+00
477	26	59	0.00	2021-06-23 12:57:35.073+00	2021-06-23 12:57:35.073+00
478	27	59	0.00	2021-06-23 12:57:35.074+00	2021-06-23 12:57:35.074+00
479	28	64	0.00	2021-06-24 18:45:50.214+00	2021-06-24 18:45:50.214+00
480	29	64	0.00	2021-06-24 18:45:50.216+00	2021-06-24 18:45:50.216+00
481	30	64	0.00	2021-06-24 18:45:50.218+00	2021-06-24 18:45:50.218+00
482	31	64	0.00	2021-06-24 18:45:50.219+00	2021-06-24 18:45:50.219+00
483	32	64	0.00	2021-06-24 18:45:50.221+00	2021-06-24 18:45:50.221+00
484	33	64	0.00	2021-06-24 18:45:50.222+00	2021-06-24 18:45:50.222+00
485	34	64	0.00	2021-06-24 18:45:50.224+00	2021-06-24 18:45:50.224+00
486	35	64	0.00	2021-06-24 18:45:50.226+00	2021-06-24 18:45:50.226+00
487	28	65	0.00	2021-06-24 18:46:24.41+00	2021-06-24 18:46:24.41+00
488	29	65	0.00	2021-06-24 18:46:24.412+00	2021-06-24 18:46:24.412+00
489	30	65	0.00	2021-06-24 18:46:24.413+00	2021-06-24 18:46:24.413+00
490	31	65	0.00	2021-06-24 18:46:24.415+00	2021-06-24 18:46:24.415+00
491	32	65	0.00	2021-06-24 18:46:24.416+00	2021-06-24 18:46:24.416+00
492	33	65	0.00	2021-06-24 18:46:24.418+00	2021-06-24 18:46:24.418+00
493	34	65	0.00	2021-06-24 18:46:24.419+00	2021-06-24 18:46:24.419+00
494	35	65	0.00	2021-06-24 18:46:24.421+00	2021-06-24 18:46:24.421+00
495	28	66	0.00	2021-06-24 18:47:03.603+00	2021-06-24 18:47:03.603+00
496	29	66	0.00	2021-06-24 18:47:03.604+00	2021-06-24 18:47:03.605+00
497	30	66	0.00	2021-06-24 18:47:03.606+00	2021-06-24 18:47:03.606+00
498	31	66	0.00	2021-06-24 18:47:03.608+00	2021-06-24 18:47:03.608+00
499	32	66	0.00	2021-06-24 18:47:03.609+00	2021-06-24 18:47:03.609+00
500	33	66	0.00	2021-06-24 18:47:03.611+00	2021-06-24 18:47:03.611+00
501	34	66	0.00	2021-06-24 18:47:03.612+00	2021-06-24 18:47:03.612+00
502	35	66	0.00	2021-06-24 18:47:03.614+00	2021-06-24 18:47:03.614+00
503	28	67	0.00	2021-06-24 18:47:50.366+00	2021-06-24 18:47:50.366+00
504	29	67	0.00	2021-06-24 18:47:50.367+00	2021-06-24 18:47:50.368+00
505	30	67	0.00	2021-06-24 18:47:50.369+00	2021-06-24 18:47:50.369+00
506	31	67	0.00	2021-06-24 18:47:50.37+00	2021-06-24 18:47:50.37+00
507	32	67	0.00	2021-06-24 18:47:50.372+00	2021-06-24 18:47:50.372+00
508	33	67	0.00	2021-06-24 18:47:50.382+00	2021-06-24 18:47:50.382+00
509	34	67	0.00	2021-06-24 18:47:50.384+00	2021-06-24 18:47:50.384+00
510	35	67	0.00	2021-06-24 18:47:50.385+00	2021-06-24 18:47:50.385+00
511	28	68	0.00	2021-06-24 18:48:25.328+00	2021-06-24 18:48:25.328+00
512	29	68	0.00	2021-06-24 18:48:25.33+00	2021-06-24 18:48:25.33+00
513	30	68	0.00	2021-06-24 18:48:25.331+00	2021-06-24 18:48:25.331+00
514	31	68	0.00	2021-06-24 18:48:25.333+00	2021-06-24 18:48:25.333+00
515	32	68	0.00	2021-06-24 18:48:25.334+00	2021-06-24 18:48:25.334+00
516	33	68	0.00	2021-06-24 18:48:25.336+00	2021-06-24 18:48:25.336+00
517	34	68	0.00	2021-06-24 18:48:25.337+00	2021-06-24 18:48:25.337+00
518	35	68	0.00	2021-06-24 18:48:25.339+00	2021-06-24 18:48:25.339+00
519	28	69	0.00	2021-06-24 18:49:13.749+00	2021-06-24 18:49:13.749+00
520	29	69	0.00	2021-06-24 18:49:13.751+00	2021-06-24 18:49:13.751+00
521	30	69	0.00	2021-06-24 18:49:13.752+00	2021-06-24 18:49:13.752+00
522	31	69	0.00	2021-06-24 18:49:13.754+00	2021-06-24 18:49:13.754+00
523	32	69	0.00	2021-06-24 18:49:13.755+00	2021-06-24 18:49:13.755+00
524	33	69	0.00	2021-06-24 18:49:13.756+00	2021-06-24 18:49:13.756+00
525	34	69	0.00	2021-06-24 18:49:13.758+00	2021-06-24 18:49:13.758+00
526	35	69	0.00	2021-06-24 18:49:13.759+00	2021-06-24 18:49:13.759+00
527	28	70	0.00	2021-06-24 18:50:27.388+00	2021-06-24 18:50:27.388+00
528	29	70	0.00	2021-06-24 18:50:27.39+00	2021-06-24 18:50:27.39+00
529	30	70	0.00	2021-06-24 18:50:27.392+00	2021-06-24 18:50:27.392+00
530	31	70	0.00	2021-06-24 18:50:27.393+00	2021-06-24 18:50:27.393+00
531	32	70	0.00	2021-06-24 18:50:27.395+00	2021-06-24 18:50:27.395+00
532	33	70	0.00	2021-06-24 18:50:27.401+00	2021-06-24 18:50:27.401+00
533	34	70	0.00	2021-06-24 18:50:27.403+00	2021-06-24 18:50:27.403+00
534	35	70	0.00	2021-06-24 18:50:27.404+00	2021-06-24 18:50:27.404+00
535	28	71	0.00	2021-06-24 18:51:22.264+00	2021-06-24 18:51:22.264+00
536	29	71	0.00	2021-06-24 18:51:22.265+00	2021-06-24 18:51:22.265+00
537	30	71	0.00	2021-06-24 18:51:22.267+00	2021-06-24 18:51:22.267+00
538	31	71	0.00	2021-06-24 18:51:22.268+00	2021-06-24 18:51:22.268+00
539	32	71	0.00	2021-06-24 18:51:22.27+00	2021-06-24 18:51:22.27+00
540	33	71	0.00	2021-06-24 18:51:22.272+00	2021-06-24 18:51:22.272+00
541	34	71	0.00	2021-06-24 18:51:22.274+00	2021-06-24 18:51:22.274+00
542	35	71	0.00	2021-06-24 18:51:22.275+00	2021-06-24 18:51:22.275+00
543	28	72	0.00	2021-06-24 18:51:56.015+00	2021-06-24 18:51:56.015+00
544	29	72	0.00	2021-06-24 18:51:56.016+00	2021-06-24 18:51:56.016+00
545	30	72	0.00	2021-06-24 18:51:56.018+00	2021-06-24 18:51:56.018+00
546	31	72	0.00	2021-06-24 18:51:56.019+00	2021-06-24 18:51:56.019+00
547	32	72	0.00	2021-06-24 18:51:56.021+00	2021-06-24 18:51:56.021+00
548	33	72	0.00	2021-06-24 18:51:56.022+00	2021-06-24 18:51:56.022+00
549	34	72	0.00	2021-06-24 18:51:56.024+00	2021-06-24 18:51:56.024+00
550	35	72	0.00	2021-06-24 18:51:56.026+00	2021-06-24 18:51:56.026+00
551	28	73	0.00	2021-06-24 18:52:27.851+00	2021-06-24 18:52:27.851+00
552	29	73	0.00	2021-06-24 18:52:27.853+00	2021-06-24 18:52:27.853+00
553	30	73	0.00	2021-06-24 18:52:27.855+00	2021-06-24 18:52:27.855+00
554	31	73	0.00	2021-06-24 18:52:27.861+00	2021-06-24 18:52:27.861+00
555	32	73	0.00	2021-06-24 18:52:27.863+00	2021-06-24 18:52:27.863+00
556	33	73	0.00	2021-06-24 18:52:27.864+00	2021-06-24 18:52:27.864+00
557	34	73	0.00	2021-06-24 18:52:27.866+00	2021-06-24 18:52:27.866+00
558	35	73	0.00	2021-06-24 18:52:27.867+00	2021-06-24 18:52:27.867+00
559	28	74	0.00	2021-06-24 18:53:00.778+00	2021-06-24 18:53:00.778+00
560	29	74	0.00	2021-06-24 18:53:00.78+00	2021-06-24 18:53:00.78+00
561	30	74	0.00	2021-06-24 18:53:00.781+00	2021-06-24 18:53:00.781+00
562	31	74	0.00	2021-06-24 18:53:00.783+00	2021-06-24 18:53:00.783+00
563	32	74	0.00	2021-06-24 18:53:00.784+00	2021-06-24 18:53:00.784+00
564	33	74	0.00	2021-06-24 18:53:00.786+00	2021-06-24 18:53:00.786+00
565	34	74	0.00	2021-06-24 18:53:00.787+00	2021-06-24 18:53:00.787+00
566	35	74	0.00	2021-06-24 18:53:00.789+00	2021-06-24 18:53:00.789+00
567	28	75	0.00	2021-06-24 18:53:50.228+00	2021-06-24 18:53:50.228+00
568	29	75	0.00	2021-06-24 18:53:50.231+00	2021-06-24 18:53:50.231+00
569	30	75	0.00	2021-06-24 18:53:50.232+00	2021-06-24 18:53:50.232+00
570	31	75	0.00	2021-06-24 18:53:50.233+00	2021-06-24 18:53:50.233+00
571	32	75	0.00	2021-06-24 18:53:50.242+00	2021-06-24 18:53:50.242+00
572	33	75	0.00	2021-06-24 18:53:50.244+00	2021-06-24 18:53:50.244+00
573	34	75	0.00	2021-06-24 18:53:50.245+00	2021-06-24 18:53:50.245+00
574	35	75	0.00	2021-06-24 18:53:50.247+00	2021-06-24 18:53:50.247+00
575	28	76	0.00	2021-06-24 18:54:23.764+00	2021-06-24 18:54:23.764+00
576	29	76	0.00	2021-06-24 18:54:23.766+00	2021-06-24 18:54:23.766+00
577	30	76	0.00	2021-06-24 18:54:23.768+00	2021-06-24 18:54:23.768+00
578	31	76	0.00	2021-06-24 18:54:23.769+00	2021-06-24 18:54:23.769+00
579	32	76	0.00	2021-06-24 18:54:23.771+00	2021-06-24 18:54:23.771+00
580	33	76	0.00	2021-06-24 18:54:23.772+00	2021-06-24 18:54:23.772+00
581	34	76	0.00	2021-06-24 18:54:23.773+00	2021-06-24 18:54:23.773+00
582	35	76	0.00	2021-06-24 18:54:23.775+00	2021-06-24 18:54:23.775+00
583	28	77	0.00	2021-06-24 18:54:57.032+00	2021-06-24 18:54:57.032+00
584	29	77	0.00	2021-06-24 18:54:57.034+00	2021-06-24 18:54:57.034+00
585	30	77	0.00	2021-06-24 18:54:57.035+00	2021-06-24 18:54:57.035+00
586	31	77	0.00	2021-06-24 18:54:57.037+00	2021-06-24 18:54:57.037+00
587	32	77	0.00	2021-06-24 18:54:57.039+00	2021-06-24 18:54:57.039+00
588	33	77	0.00	2021-06-24 18:54:57.04+00	2021-06-24 18:54:57.04+00
589	34	77	0.00	2021-06-24 18:54:57.042+00	2021-06-24 18:54:57.042+00
590	35	77	0.00	2021-06-24 18:54:57.043+00	2021-06-24 18:54:57.043+00
591	28	78	0.00	2021-06-24 18:55:30.753+00	2021-06-24 18:55:30.753+00
592	29	78	0.00	2021-06-24 18:55:30.755+00	2021-06-24 18:55:30.755+00
593	30	78	0.00	2021-06-24 18:55:30.757+00	2021-06-24 18:55:30.757+00
594	31	78	0.00	2021-06-24 18:55:30.758+00	2021-06-24 18:55:30.758+00
595	32	78	0.00	2021-06-24 18:55:30.766+00	2021-06-24 18:55:30.766+00
596	33	78	0.00	2021-06-24 18:55:30.768+00	2021-06-24 18:55:30.768+00
597	34	78	0.00	2021-06-24 18:55:30.769+00	2021-06-24 18:55:30.769+00
598	35	78	0.00	2021-06-24 18:55:30.771+00	2021-06-24 18:55:30.771+00
599	28	79	0.00	2021-06-24 18:56:06.474+00	2021-06-24 18:56:06.474+00
600	29	79	0.00	2021-06-24 18:56:06.476+00	2021-06-24 18:56:06.476+00
601	30	79	0.00	2021-06-24 18:56:06.478+00	2021-06-24 18:56:06.478+00
602	31	79	0.00	2021-06-24 18:56:06.479+00	2021-06-24 18:56:06.479+00
603	32	79	0.00	2021-06-24 18:56:06.481+00	2021-06-24 18:56:06.481+00
604	33	79	0.00	2021-06-24 18:56:06.482+00	2021-06-24 18:56:06.482+00
605	34	79	0.00	2021-06-24 18:56:06.484+00	2021-06-24 18:56:06.484+00
606	35	79	0.00	2021-06-24 18:56:06.485+00	2021-06-24 18:56:06.485+00
607	28	80	0.00	2021-06-24 18:56:39.01+00	2021-06-24 18:56:39.01+00
608	29	80	0.00	2021-06-24 18:56:39.012+00	2021-06-24 18:56:39.012+00
609	30	80	0.00	2021-06-24 18:56:39.013+00	2021-06-24 18:56:39.013+00
610	31	80	0.00	2021-06-24 18:56:39.015+00	2021-06-24 18:56:39.015+00
611	32	80	0.00	2021-06-24 18:56:39.017+00	2021-06-24 18:56:39.017+00
612	33	80	0.00	2021-06-24 18:56:39.018+00	2021-06-24 18:56:39.018+00
613	34	80	0.00	2021-06-24 18:56:39.02+00	2021-06-24 18:56:39.02+00
614	35	80	0.00	2021-06-24 18:56:39.021+00	2021-06-24 18:56:39.021+00
615	28	81	0.00	2021-06-24 18:57:03.859+00	2021-06-24 18:57:03.859+00
616	29	81	0.00	2021-06-24 18:57:03.86+00	2021-06-24 18:57:03.86+00
617	30	81	0.00	2021-06-24 18:57:03.862+00	2021-06-24 18:57:03.862+00
618	31	81	0.00	2021-06-24 18:57:03.863+00	2021-06-24 18:57:03.863+00
619	32	81	0.00	2021-06-24 18:57:03.864+00	2021-06-24 18:57:03.864+00
620	33	81	0.00	2021-06-24 18:57:03.866+00	2021-06-24 18:57:03.866+00
621	34	81	0.00	2021-06-24 18:57:03.867+00	2021-06-24 18:57:03.867+00
622	35	81	0.00	2021-06-24 18:57:03.869+00	2021-06-24 18:57:03.869+00
623	28	82	0.00	2021-06-24 18:57:37.392+00	2021-06-24 18:57:37.392+00
624	29	82	0.00	2021-06-24 18:57:37.394+00	2021-06-24 18:57:37.394+00
625	30	82	0.00	2021-06-24 18:57:37.395+00	2021-06-24 18:57:37.395+00
626	31	82	0.00	2021-06-24 18:57:37.397+00	2021-06-24 18:57:37.397+00
627	32	82	0.00	2021-06-24 18:57:37.398+00	2021-06-24 18:57:37.398+00
628	33	82	0.00	2021-06-24 18:57:37.399+00	2021-06-24 18:57:37.399+00
629	34	82	0.00	2021-06-24 18:57:37.401+00	2021-06-24 18:57:37.401+00
630	35	82	0.00	2021-06-24 18:57:37.402+00	2021-06-24 18:57:37.402+00
631	28	83	0.00	2021-06-24 18:58:17.808+00	2021-06-24 18:58:17.808+00
632	29	83	0.00	2021-06-24 18:58:17.809+00	2021-06-24 18:58:17.809+00
633	30	83	0.00	2021-06-24 18:58:17.811+00	2021-06-24 18:58:17.811+00
634	31	83	0.00	2021-06-24 18:58:17.812+00	2021-06-24 18:58:17.812+00
635	32	83	0.00	2021-06-24 18:58:17.813+00	2021-06-24 18:58:17.814+00
636	33	83	0.00	2021-06-24 18:58:17.815+00	2021-06-24 18:58:17.815+00
637	34	83	0.00	2021-06-24 18:58:17.816+00	2021-06-24 18:58:17.816+00
638	35	83	0.00	2021-06-24 18:58:17.818+00	2021-06-24 18:58:17.818+00
639	28	84	0.00	2021-06-24 18:58:54.918+00	2021-06-24 18:58:54.918+00
640	29	84	0.00	2021-06-24 18:58:54.919+00	2021-06-24 18:58:54.92+00
641	30	84	0.00	2021-06-24 18:58:54.921+00	2021-06-24 18:58:54.929+00
642	31	84	0.00	2021-06-24 18:58:54.932+00	2021-06-24 18:58:54.932+00
643	32	84	0.00	2021-06-24 18:58:54.934+00	2021-06-24 18:58:54.934+00
644	33	84	0.00	2021-06-24 18:58:54.935+00	2021-06-24 18:58:54.935+00
645	34	84	0.00	2021-06-24 18:58:54.937+00	2021-06-24 18:58:54.937+00
646	35	84	0.00	2021-06-24 18:58:54.938+00	2021-06-24 18:58:54.938+00
647	28	85	0.00	2021-06-24 18:59:27.232+00	2021-06-24 18:59:27.232+00
648	29	85	0.00	2021-06-24 18:59:27.234+00	2021-06-24 18:59:27.234+00
649	30	85	0.00	2021-06-24 18:59:27.236+00	2021-06-24 18:59:27.236+00
650	31	85	0.00	2021-06-24 18:59:27.238+00	2021-06-24 18:59:27.238+00
651	32	85	0.00	2021-06-24 18:59:27.239+00	2021-06-24 18:59:27.239+00
652	33	85	0.00	2021-06-24 18:59:27.241+00	2021-06-24 18:59:27.241+00
653	34	85	0.00	2021-06-24 18:59:27.243+00	2021-06-24 18:59:27.243+00
654	35	85	0.00	2021-06-24 18:59:27.245+00	2021-06-24 18:59:27.245+00
655	28	86	0.00	2021-06-24 19:00:05.891+00	2021-06-24 19:00:05.891+00
656	29	86	0.00	2021-06-24 19:00:05.893+00	2021-06-24 19:00:05.893+00
657	30	86	0.00	2021-06-24 19:00:05.894+00	2021-06-24 19:00:05.894+00
658	31	86	0.00	2021-06-24 19:00:05.896+00	2021-06-24 19:00:05.896+00
659	32	86	0.00	2021-06-24 19:00:05.897+00	2021-06-24 19:00:05.897+00
660	33	86	0.00	2021-06-24 19:00:05.899+00	2021-06-24 19:00:05.899+00
661	34	86	0.00	2021-06-24 19:00:05.9+00	2021-06-24 19:00:05.9+00
662	35	86	0.00	2021-06-24 19:00:05.902+00	2021-06-24 19:00:05.902+00
663	28	87	0.00	2021-06-24 19:00:36.851+00	2021-06-24 19:00:36.851+00
664	29	87	0.00	2021-06-24 19:00:36.853+00	2021-06-24 19:00:36.853+00
665	30	87	0.00	2021-06-24 19:00:36.854+00	2021-06-24 19:00:36.854+00
666	31	87	0.00	2021-06-24 19:00:36.856+00	2021-06-24 19:00:36.856+00
667	32	87	0.00	2021-06-24 19:00:36.857+00	2021-06-24 19:00:36.857+00
668	33	87	0.00	2021-06-24 19:00:36.858+00	2021-06-24 19:00:36.858+00
669	34	87	0.00	2021-06-24 19:00:36.86+00	2021-06-24 19:00:36.86+00
670	35	87	0.00	2021-06-24 19:00:36.861+00	2021-06-24 19:00:36.861+00
703	28	95	0.00	2021-06-28 01:39:22.363+00	2021-06-28 01:39:22.363+00
704	29	95	0.00	2021-06-28 01:39:22.365+00	2021-06-28 01:39:22.365+00
705	30	95	0.00	2021-06-28 01:39:22.366+00	2021-06-28 01:39:22.366+00
706	31	95	0.00	2021-06-28 01:39:22.367+00	2021-06-28 01:39:22.368+00
707	32	95	0.00	2021-06-28 01:39:22.37+00	2021-06-28 01:39:22.37+00
708	33	95	0.00	2021-06-28 01:39:22.372+00	2021-06-28 01:39:22.372+00
709	34	95	0.00	2021-06-28 01:39:22.374+00	2021-06-28 01:39:22.374+00
710	35	95	0.00	2021-06-28 01:39:22.375+00	2021-06-28 01:39:22.375+00
711	28	94	0.00	2021-06-28 01:39:35.293+00	2021-06-28 01:39:35.293+00
712	29	94	0.00	2021-06-28 01:39:35.295+00	2021-06-28 01:39:35.295+00
713	30	94	0.00	2021-06-28 01:39:35.296+00	2021-06-28 01:39:35.296+00
714	31	94	0.00	2021-06-28 01:39:35.297+00	2021-06-28 01:39:35.297+00
715	32	94	0.00	2021-06-28 01:39:35.299+00	2021-06-28 01:39:35.299+00
716	33	94	0.00	2021-06-28 01:39:35.3+00	2021-06-28 01:39:35.3+00
717	34	94	0.00	2021-06-28 01:39:35.301+00	2021-06-28 01:39:35.301+00
718	35	94	0.00	2021-06-28 01:39:35.302+00	2021-06-28 01:39:35.302+00
719	28	99	0.00	2021-07-01 21:12:13.394+00	2021-07-01 21:12:13.394+00
720	29	99	0.00	2021-07-01 21:12:13.396+00	2021-07-01 21:12:13.396+00
721	30	99	0.00	2021-07-01 21:12:13.398+00	2021-07-01 21:12:13.398+00
722	31	99	0.00	2021-07-01 21:12:13.399+00	2021-07-01 21:12:13.399+00
723	32	99	0.00	2021-07-01 21:12:13.4+00	2021-07-01 21:12:13.4+00
724	33	99	0.00	2021-07-01 21:12:13.402+00	2021-07-01 21:12:13.402+00
725	34	99	0.00	2021-07-01 21:12:13.404+00	2021-07-01 21:12:13.404+00
726	35	99	0.00	2021-07-01 21:12:13.405+00	2021-07-01 21:12:13.405+00
727	37	99	0.00	2021-07-01 21:12:13.406+00	2021-07-01 21:12:13.406+00
737	28	5	5.00	2021-07-01 23:01:45.581+00	2021-07-01 23:01:45.581+00
738	29	5	5.00	2021-07-01 23:01:45.582+00	2021-07-01 23:01:45.582+00
739	30	5	2.00	2021-07-01 23:01:45.583+00	2021-07-01 23:01:45.583+00
740	31	5	5.00	2021-07-01 23:01:45.585+00	2021-07-01 23:01:45.585+00
741	32	5	0.50	2021-07-01 23:01:45.586+00	2021-07-01 23:01:45.586+00
742	33	5	0.00	2021-07-01 23:01:45.587+00	2021-07-01 23:01:45.587+00
743	34	5	0.00	2021-07-01 23:01:45.589+00	2021-07-01 23:01:45.589+00
744	35	5	5.00	2021-07-01 23:01:45.59+00	2021-07-01 23:01:45.59+00
745	37	5	0.00	2021-07-01 23:01:45.592+00	2021-07-01 23:01:45.592+00
746	28	108	0.00	2021-07-11 01:10:35.036+00	2021-07-11 01:10:35.036+00
747	29	108	0.00	2021-07-11 01:10:35.038+00	2021-07-11 01:10:35.038+00
748	30	108	0.00	2021-07-11 01:10:35.04+00	2021-07-11 01:10:35.04+00
749	31	108	0.00	2021-07-11 01:10:35.042+00	2021-07-11 01:10:35.042+00
750	32	108	0.00	2021-07-11 01:10:35.043+00	2021-07-11 01:10:35.043+00
751	33	108	0.00	2021-07-11 01:10:35.045+00	2021-07-11 01:10:35.045+00
752	34	108	0.00	2021-07-11 01:10:35.046+00	2021-07-11 01:10:35.046+00
753	35	108	0.00	2021-07-11 01:10:35.047+00	2021-07-11 01:10:35.047+00
754	37	108	0.00	2021-07-11 01:10:35.049+00	2021-07-11 01:10:35.049+00
755	28	111	0.00	2021-07-11 23:26:01.333+00	2021-07-11 23:26:01.334+00
756	29	111	0.00	2021-07-11 23:26:01.335+00	2021-07-11 23:26:01.335+00
757	30	111	0.00	2021-07-11 23:26:01.337+00	2021-07-11 23:26:01.337+00
758	31	111	0.00	2021-07-11 23:26:01.338+00	2021-07-11 23:26:01.338+00
759	32	111	0.00	2021-07-11 23:26:01.34+00	2021-07-11 23:26:01.34+00
760	33	111	0.00	2021-07-11 23:26:01.342+00	2021-07-11 23:26:01.342+00
761	34	111	0.00	2021-07-11 23:26:01.344+00	2021-07-11 23:26:01.344+00
762	35	111	0.00	2021-07-11 23:26:01.345+00	2021-07-11 23:26:01.345+00
763	37	111	0.00	2021-07-11 23:26:01.347+00	2021-07-11 23:26:01.347+00
764	28	112	0.00	2021-07-11 23:27:31.321+00	2021-07-11 23:27:31.321+00
765	29	112	0.00	2021-07-11 23:27:31.322+00	2021-07-11 23:27:31.322+00
766	30	112	0.00	2021-07-11 23:27:31.331+00	2021-07-11 23:27:31.331+00
767	31	112	0.00	2021-07-11 23:27:31.345+00	2021-07-11 23:27:31.345+00
768	32	112	0.00	2021-07-11 23:27:31.347+00	2021-07-11 23:27:31.347+00
769	33	112	0.00	2021-07-11 23:27:31.348+00	2021-07-11 23:27:31.348+00
770	34	112	0.00	2021-07-11 23:27:31.349+00	2021-07-11 23:27:31.349+00
771	35	112	0.00	2021-07-11 23:27:31.351+00	2021-07-11 23:27:31.351+00
772	37	112	0.00	2021-07-11 23:27:31.354+00	2021-07-11 23:27:31.354+00
773	28	113	0.00	2021-07-11 23:29:20.217+00	2021-07-11 23:29:20.217+00
774	29	113	0.00	2021-07-11 23:29:20.219+00	2021-07-11 23:29:20.219+00
775	30	113	0.00	2021-07-11 23:29:20.22+00	2021-07-11 23:29:20.22+00
776	31	113	0.00	2021-07-11 23:29:20.222+00	2021-07-11 23:29:20.222+00
777	32	113	0.00	2021-07-11 23:29:20.223+00	2021-07-11 23:29:20.223+00
778	33	113	0.00	2021-07-11 23:29:20.224+00	2021-07-11 23:29:20.224+00
779	34	113	0.00	2021-07-11 23:29:20.226+00	2021-07-11 23:29:20.226+00
780	35	113	0.00	2021-07-11 23:29:20.227+00	2021-07-11 23:29:20.227+00
781	37	113	0.00	2021-07-11 23:29:20.228+00	2021-07-11 23:29:20.228+00
782	28	114	0.00	2021-07-11 23:32:13.639+00	2021-07-11 23:32:13.639+00
783	29	114	0.00	2021-07-11 23:32:13.641+00	2021-07-11 23:32:13.641+00
784	30	114	0.00	2021-07-11 23:32:13.643+00	2021-07-11 23:32:13.643+00
785	31	114	0.00	2021-07-11 23:32:13.645+00	2021-07-11 23:32:13.645+00
786	32	114	0.00	2021-07-11 23:32:13.647+00	2021-07-11 23:32:13.647+00
787	33	114	0.00	2021-07-11 23:32:13.648+00	2021-07-11 23:32:13.648+00
788	34	114	0.00	2021-07-11 23:32:13.65+00	2021-07-11 23:32:13.651+00
789	35	114	0.00	2021-07-11 23:32:13.652+00	2021-07-11 23:32:13.652+00
790	37	114	0.00	2021-07-11 23:32:13.654+00	2021-07-11 23:32:13.654+00
\.


--
-- Data for Name: atividade_rdo_users; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.atividade_rdo_users (id, quantidade, quantidade_inicial, quantidade_final, rdo_id, user_id, atividade_id, contrato_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: atividade_rdos; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.atividade_rdos (id, quantidade, quantidade_inicial, quantidade_final, hora_inicio, hora_fim, atividade_id, rdo_id, furo_id, created_at, updated_at) FROM stdin;
763	0.00	0.00	0.00	2021-07-12 10:00:06.159+00	2021-07-12 10:20:06.16+00	32	112	\N	2021-07-13 00:23:44.286+00	2021-07-13 00:23:44.286+00
765	0.00	0.00	0.00	2021-07-12 10:25:23.821+00	2021-07-12 13:20:23.821+00	110	112	\N	2021-07-13 00:23:44.3+00	2021-07-13 00:23:44.3+00
767	0.00	0.00	0.00	2021-07-12 14:30:46.781+00	2021-07-12 17:00:46.782+00	53	112	\N	2021-07-13 00:23:44.306+00	2021-07-13 00:23:44.306+00
770	0.00	0.00	0.00	2021-07-12 10:00:30.299+00	2021-07-12 10:20:30.299+00	32	113	\N	2021-07-13 00:34:11.338+00	2021-07-13 00:34:11.338+00
772	0.00	0.00	0.00	2021-07-12 12:00:15.434+00	2021-07-12 15:00:15.434+00	110	113	\N	2021-07-13 00:34:11.352+00	2021-07-13 00:34:11.352+00
775	0.00	0.00	0.00	2021-07-12 16:10:47.968+00	2021-07-12 16:20:47.968+00	101	113	\N	2021-07-13 00:34:11.437+00	2021-07-13 00:34:11.437+00
764	0.00	0.00	0.00	2021-07-12 10:20:26.827+00	2021-07-12 10:25:26.828+00	101	112	\N	2021-07-13 00:23:44.291+00	2021-07-13 00:23:44.291+00
766	0.00	0.00	0.00	2021-07-12 13:20:48.43+00	2021-07-12 14:00:48.43+00	105	112	\N	2021-07-13 00:23:44.303+00	2021-07-13 00:23:44.303+00
769	0.00	0.00	0.00	2021-07-12 17:00:10.746+00	2021-07-12 19:00:10.746+00	46	112	\N	2021-07-13 00:23:44.315+00	2021-07-13 00:23:44.315+00
771	0.00	0.00	0.00	2021-07-12 10:20:50.069+00	2021-07-12 12:00:50.069+00	46	113	\N	2021-07-13 00:34:11.343+00	2021-07-13 00:34:11.343+00
773	0.00	0.00	0.00	2021-07-12 15:00:44.597+00	2021-07-12 16:00:44.597+00	3	113	\N	2021-07-13 00:34:11.417+00	2021-07-13 00:34:11.417+00
768	0.00	0.00	0.00	2021-07-12 14:00:26.793+00	2021-07-12 14:30:26.793+00	3	112	\N	2021-07-13 00:23:44.308+00	2021-07-13 00:23:44.308+00
774	0.00	0.00	0.00	2021-07-12 16:00:13.643+00	2021-07-12 16:10:13.644+00	32	113	\N	2021-07-13 00:34:11.423+00	2021-07-13 00:34:11.423+00
776	0.00	0.00	0.00	2021-07-12 16:20:15.282+00	2021-07-12 17:30:15.283+00	41	113	\N	2021-07-13 00:34:11.44+00	2021-07-13 00:34:11.44+00
146	0.00	0.00	0.00	2021-06-30 09:00:13.412+00	2021-06-30 10:00:13.413+00	37	28	\N	2021-06-30 19:49:39.574+00	2021-06-30 19:49:39.574+00
147	0.00	0.00	0.00	2021-06-30 10:00:54.666+00	2021-06-30 10:35:54.666+00	90	28	\N	2021-06-30 19:49:39.578+00	2021-06-30 19:49:39.579+00
148	0.00	0.00	0.00	2021-06-30 10:35:18.998+00	2021-06-30 11:15:18.998+00	53	28	\N	2021-06-30 19:49:39.608+00	2021-06-30 19:49:39.608+00
149	0.00	0.00	0.00	2021-06-30 11:15:16.474+00	2021-06-30 11:30:16.474+00	31	28	\N	2021-06-30 19:49:39.617+00	2021-06-30 19:49:39.617+00
150	0.00	0.00	0.00	2021-06-30 11:30:41.526+00	2021-06-30 11:50:41.526+00	30	28	\N	2021-06-30 19:49:39.63+00	2021-06-30 19:49:39.63+00
151	0.00	0.00	0.00	2021-06-30 11:50:07.988+00	2021-06-30 12:15:07.989+00	30	28	\N	2021-06-30 19:49:39.634+00	2021-06-30 19:49:39.634+00
153	0.00	0.00	0.00	2021-06-30 13:15:18.871+00	2021-06-30 13:50:18.872+00	30	28	\N	2021-06-30 19:49:39.647+00	2021-06-30 19:49:39.647+00
154	0.00	0.00	0.00	2021-06-30 13:50:44.505+00	2021-06-30 14:50:44.505+00	41	28	\N	2021-06-30 19:49:39.649+00	2021-06-30 19:49:39.649+00
155	0.00	0.00	0.00	2021-06-30 14:50:39.233+00	2021-06-30 15:50:39.233+00	3	28	\N	2021-06-30 19:49:39.652+00	2021-06-30 19:49:39.652+00
156	1.00	0.00	0.00	2021-06-30 15:50:03.37+00	2021-06-30 17:00:03.371+00	95	28	15	2021-06-30 19:49:39.655+00	2021-06-30 19:49:39.668+00
152	1.00	0.00	0.00	2021-06-30 12:15:18.002+00	2021-06-30 13:25:18.002+00	27	28	15	2021-06-30 19:49:39.644+00	2021-06-30 19:49:39.671+00
777	0.00	0.00	0.00	2021-07-12 17:30:50.976+00	2021-07-12 18:10:50.977+00	50	113	\N	2021-07-13 00:34:11.445+00	2021-07-13 00:34:11.445+00
778	28.00	0.00	28.00	2021-07-12 18:10:18.457+00	2021-07-12 20:00:18.457+00	17	113	21	2021-07-13 00:34:11.454+00	2021-07-13 00:34:11.493+00
779	0.00	0.00	0.00	2021-07-12 17:00:09.21+00	2021-07-13 01:00:09.212+00	51	114	\N	2021-07-13 01:05:56.029+00	2021-07-13 01:05:56.029+00
781	0.00	0.00	0.00	2021-07-12 10:00:17.412+00	2021-07-12 10:15:17.412+00	32	115	\N	2021-07-13 11:25:18.084+00	2021-07-13 11:25:18.084+00
783	0.00	0.00	0.00	2021-07-12 10:25:22.143+00	2021-07-12 10:45:22.143+00	36	115	\N	2021-07-13 11:25:18.098+00	2021-07-13 11:25:18.098+00
788	0.00	0.00	0.00	2021-07-12 14:35:16.897+00	2021-07-12 15:35:16.897+00	3	115	\N	2021-07-13 11:25:18.124+00	2021-07-13 11:25:18.124+00
790	0.00	0.00	0.00	2021-07-12 17:00:16.88+00	2021-07-12 17:05:16.881+00	101	115	\N	2021-07-13 11:25:18.137+00	2021-07-13 11:25:18.137+00
793	0.00	0.00	0.00	2021-07-12 17:55:36.813+00	2021-07-12 18:15:36.813+00	89	115	\N	2021-07-13 11:25:18.152+00	2021-07-13 11:25:18.152+00
786	1.00	0.00	0.00	2021-07-12 13:10:36.986+00	2021-07-12 13:40:36.986+00	2	115	20	2021-07-13 11:25:18.111+00	2021-07-13 11:25:18.183+00
780	0.00	0.00	0.00	2021-07-12 09:00:50.081+00	2021-07-12 10:00:50.082+00	53	115	\N	2021-07-13 11:25:18.076+00	2021-07-13 11:25:18.076+00
782	0.00	0.00	0.00	2021-07-12 10:15:43.315+00	2021-07-12 10:25:43.315+00	101	115	\N	2021-07-13 11:25:18.093+00	2021-07-13 11:25:18.093+00
784	0.00	0.00	0.00	2021-07-12 12:45:52.755+00	2021-07-12 13:10:52.755+00	89	115	\N	2021-07-13 11:25:18.107+00	2021-07-13 11:25:18.107+00
792	0.00	0.00	0.00	2021-07-12 17:30:41.52+00	2021-07-12 17:55:41.521+00	97	115	\N	2021-07-13 11:25:18.146+00	2021-07-13 11:25:18.146+00
794	1.00	0.00	0.00	2021-07-12 18:15:59.811+00	2021-07-12 18:50:59.812+00	2	115	20	2021-07-13 11:25:18.156+00	2021-07-13 11:25:18.189+00
789	1.00	17.00	18.00	2021-07-12 15:35:51.636+00	2021-07-12 17:00:51.637+00	18	115	20	2021-07-13 11:25:18.131+00	2021-07-13 11:25:18.186+00
787	1.00	16.00	17.00	2021-07-12 13:40:15.791+00	2021-07-12 14:35:15.791+00	18	115	20	2021-07-13 11:25:18.119+00	2021-07-13 11:25:18.2+00
363	0.00	0.00	0.00	2021-07-10 10:00:40.56+00	2021-07-10 12:30:40.56+00	32	58	\N	2021-07-12 09:49:37.675+00	2021-07-12 09:49:37.676+00
364	0.00	0.00	0.00	2021-07-10 12:30:06.839+00	2021-07-10 14:00:06.839+00	92	58	\N	2021-07-12 09:49:37.677+00	2021-07-12 09:49:37.677+00
365	0.00	0.00	0.00	2021-07-10 14:00:27.658+00	2021-07-10 14:30:27.658+00	90	58	\N	2021-07-12 09:49:37.679+00	2021-07-12 09:49:37.679+00
366	0.00	0.00	0.00	2021-07-10 14:30:46.293+00	2021-07-10 16:00:46.293+00	3	58	\N	2021-07-12 09:49:37.681+00	2021-07-12 09:49:37.681+00
367	0.00	0.00	0.00	2021-07-10 16:00:14.859+00	2021-07-10 16:20:14.859+00	31	58	\N	2021-07-12 09:49:37.683+00	2021-07-12 09:49:37.683+00
369	0.00	0.00	0.00	2021-07-10 17:20:48.41+00	2021-07-10 17:50:48.41+00	30	58	\N	2021-07-12 09:49:37.686+00	2021-07-12 09:49:37.686+00
370	0.00	0.00	0.00	2021-07-10 17:50:16.478+00	2021-07-10 19:20:16.478+00	93	58	\N	2021-07-12 09:49:37.687+00	2021-07-12 09:49:37.687+00
371	0.00	0.00	0.00	2021-07-10 19:20:47.906+00	2021-07-10 20:00:47.906+00	93	58	\N	2021-07-12 09:49:37.689+00	2021-07-12 09:49:37.689+00
368	1.00	24.00	25.00	2021-07-10 16:20:38.126+00	2021-07-10 17:20:38.126+00	18	58	11	2021-07-12 09:49:37.684+00	2021-07-12 09:49:37.698+00
372	0.00	0.00	0.00	2021-07-10 09:00:53.874+00	2021-07-10 10:00:53.874+00	53	59	\N	2021-07-12 09:49:43.407+00	2021-07-12 09:49:43.407+00
373	0.00	0.00	0.00	2021-07-10 10:00:58.804+00	2021-07-10 12:00:58.805+00	101	59	\N	2021-07-12 09:49:43.408+00	2021-07-12 09:49:43.408+00
374	0.00	0.00	0.00	2021-07-10 12:00:47.069+00	2021-07-10 15:00:47.07+00	51	59	\N	2021-07-12 09:49:43.41+00	2021-07-12 09:49:43.41+00
375	0.00	0.00	0.00	2021-07-10 15:00:18.497+00	2021-07-10 16:00:18.497+00	3	59	\N	2021-07-12 09:49:43.411+00	2021-07-12 09:49:43.411+00
376	0.00	0.00	0.00	2021-07-10 16:00:54.65+00	2021-07-10 17:00:54.65+00	51	59	\N	2021-07-12 09:49:43.413+00	2021-07-12 09:49:43.413+00
377	0.00	0.00	0.00	2021-07-10 17:00:06.622+00	2021-07-10 17:20:06.622+00	53	60	\N	2021-07-12 09:49:47.227+00	2021-07-12 09:49:47.227+00
378	0.00	0.00	0.00	2021-07-10 17:20:51.415+00	2021-07-10 17:30:51.415+00	101	60	\N	2021-07-12 09:49:47.229+00	2021-07-12 09:49:47.229+00
379	0.00	0.00	0.00	2021-07-10 17:30:26.379+00	2021-07-10 17:50:26.379+00	32	60	\N	2021-07-12 09:49:47.23+00	2021-07-12 09:49:47.23+00
380	0.00	0.00	0.00	2021-07-10 17:50:37.988+00	2021-07-10 18:10:37.988+00	31	60	\N	2021-07-12 09:49:47.232+00	2021-07-12 09:49:47.232+00
383	0.00	0.00	0.00	2021-07-10 19:45:00.581+00	2021-07-11 01:00:00.581+00	39	60	\N	2021-07-12 09:49:47.237+00	2021-07-12 09:49:47.237+00
381	1.00	0.00	0.00	2021-07-10 18:10:33.608+00	2021-07-10 18:30:33.609+00	27	60	17	2021-07-12 09:49:47.234+00	2021-07-12 09:49:47.247+00
382	1.00	0.00	0.00	2021-07-10 18:30:25.629+00	2021-07-10 19:45:25.629+00	108	60	14	2021-07-12 09:49:47.236+00	2021-07-12 09:49:47.248+00
384	0.00	0.00	0.00	2021-07-10 10:00:02.403+00	2021-07-10 13:00:02.403+00	32	61	\N	2021-07-12 09:49:50.441+00	2021-07-12 09:49:50.441+00
385	0.00	0.00	0.00	2021-07-10 13:00:35.946+00	2021-07-10 13:40:35.946+00	92	61	\N	2021-07-12 09:49:50.443+00	2021-07-12 09:49:50.443+00
386	0.00	0.00	0.00	2021-07-10 14:00:02.061+00	2021-07-10 15:00:02.062+00	30	61	\N	2021-07-12 09:49:50.444+00	2021-07-12 09:49:50.444+00
387	0.00	0.00	0.00	2021-07-10 15:00:38.686+00	2021-07-10 16:00:38.686+00	3	61	\N	2021-07-12 09:49:50.446+00	2021-07-12 09:49:50.446+00
388	0.00	0.00	0.00	2021-07-10 16:00:02.984+00	2021-07-10 18:45:02.985+00	30	61	\N	2021-07-12 09:49:50.448+00	2021-07-12 09:49:50.448+00
389	0.00	0.00	0.00	2021-07-10 18:45:37.448+00	2021-07-10 19:00:37.448+00	53	61	\N	2021-07-12 09:49:50.449+00	2021-07-12 09:49:50.449+00
400	0.00	0.00	0.00	2021-07-11 10:10:52.395+00	2021-07-11 12:10:52.395+00	40	63	\N	2021-07-12 09:49:58.207+00	2021-07-12 09:49:58.207+00
785	2.55	13.45	16.00	2021-07-12 10:45:57.714+00	2021-07-12 12:45:57.714+00	18	115	20	2021-07-13 11:25:18.1+00	2021-07-13 11:25:18.193+00
399	0.00	0.00	0.00	2021-07-11 09:00:36.652+00	2021-07-11 10:00:36.652+00	90	63	\N	2021-07-12 09:49:58.203+00	2021-07-12 09:49:58.203+00
401	0.00	0.00	0.00	2021-07-11 12:10:43.842+00	2021-07-11 12:30:43.843+00	39	63	\N	2021-07-12 09:49:58.208+00	2021-07-12 09:49:58.208+00
402	0.00	0.00	0.00	2021-07-11 12:30:01.229+00	2021-07-11 16:00:01.23+00	89	63	\N	2021-07-12 09:49:58.21+00	2021-07-12 09:49:58.21+00
403	0.00	0.00	0.00	2021-07-11 15:00:40.752+00	2021-07-11 16:00:40.752+00	3	63	\N	2021-07-12 09:49:58.212+00	2021-07-12 09:49:58.212+00
404	0.00	0.00	0.00	2021-07-11 16:00:50.401+00	2021-07-11 17:00:50.401+00	89	63	\N	2021-07-12 09:49:58.213+00	2021-07-12 09:49:58.213+00
405	0.00	0.00	0.00	2021-07-11 17:00:11.037+00	2021-07-11 17:30:11.038+00	92	64	\N	2021-07-12 09:50:04.555+00	2021-07-12 09:50:04.555+00
406	0.00	0.00	0.00	2021-07-11 17:30:54.536+00	2021-07-11 18:00:54.536+00	90	64	\N	2021-07-12 09:50:04.557+00	2021-07-12 09:50:04.557+00
407	0.00	0.00	0.00	2021-07-11 18:00:36.452+00	2021-07-11 19:00:36.452+00	41	64	\N	2021-07-12 09:50:04.559+00	2021-07-12 09:50:04.559+00
408	0.00	0.00	0.00	2021-07-11 19:00:38.793+00	2021-07-12 01:00:38.793+00	89	64	\N	2021-07-12 09:50:04.568+00	2021-07-12 09:50:04.568+00
409	0.00	0.00	0.00	2021-07-10 10:00:08.487+00	2021-07-10 10:30:08.487+00	32	65	\N	2021-07-12 09:50:09.555+00	2021-07-12 09:50:09.555+00
410	0.00	0.00	0.00	2021-07-10 10:30:36.484+00	2021-07-10 11:10:36.484+00	92	65	\N	2021-07-12 09:50:09.56+00	2021-07-12 09:50:09.56+00
411	0.00	0.00	0.00	2021-07-10 11:10:12.842+00	2021-07-10 11:20:12.843+00	101	65	\N	2021-07-12 09:50:09.562+00	2021-07-12 09:50:09.562+00
412	0.00	0.00	0.00	2021-07-10 11:20:44.786+00	2021-07-10 11:25:44.787+00	36	65	\N	2021-07-12 09:50:09.563+00	2021-07-12 09:50:09.564+00
414	0.00	0.00	0.00	2021-07-10 14:00:41.936+00	2021-07-10 15:00:41.937+00	3	65	\N	2021-07-12 09:50:09.567+00	2021-07-12 09:50:09.567+00
418	20.00	0.00	20.00	2021-07-10 19:00:52.026+00	2021-07-10 20:00:52.027+00	17	65	13	2021-07-12 09:50:09.584+00	2021-07-12 09:50:09.592+00
419	0.00	0.00	0.00	2021-07-10 10:00:39.443+00	2021-07-10 11:00:39.444+00	90	66	\N	2021-07-12 09:50:11.987+00	2021-07-12 09:50:11.987+00
430	0.00	0.00	0.00	2021-07-11 11:50:29.124+00	2021-07-11 12:15:29.124+00	30	67	\N	2021-07-12 09:50:29.642+00	2021-07-12 09:50:29.642+00
432	0.00	0.00	0.00	2021-07-11 13:25:27.067+00	2021-07-11 13:50:27.067+00	30	67	\N	2021-07-12 09:50:29.646+00	2021-07-12 09:50:29.646+00
433	0.00	0.00	0.00	2021-07-11 13:50:41.799+00	2021-07-11 14:50:41.799+00	41	67	\N	2021-07-12 09:50:29.647+00	2021-07-12 09:50:29.647+00
434	0.00	0.00	0.00	2021-07-11 14:50:56.496+00	2021-07-11 15:50:56.497+00	3	67	\N	2021-07-12 09:50:29.649+00	2021-07-12 09:50:29.649+00
431	1.00	0.00	0.00	2021-07-11 12:15:50.551+00	2021-07-11 13:25:50.552+00	27	67	15	2021-07-12 09:50:29.644+00	2021-07-12 09:50:29.663+00
437	0.00	0.00	0.00	2021-07-11 17:20:04.402+00	2021-07-11 17:45:04.402+00	90	68	\N	2021-07-12 09:50:35.011+00	2021-07-12 09:50:35.011+00
439	0.00	0.00	0.00	2021-07-11 22:00:22.969+00	2021-07-11 23:00:22.969+00	34	68	\N	2021-07-12 09:50:35.02+00	2021-07-12 09:50:35.02+00
440	0.00	0.00	0.00	2021-07-11 23:00:09.139+00	2021-07-12 01:00:09.14+00	37	68	\N	2021-07-12 09:50:35.022+00	2021-07-12 09:50:35.022+00
438	0.00	0.00	0.00	2021-07-11 17:45:01.008+00	2021-07-11 22:00:01.008+00	95	68	14	2021-07-12 09:50:35.013+00	2021-07-12 09:50:35.028+00
441	0.00	0.00	0.00	2021-07-10 10:00:29.727+00	2021-07-10 10:20:29.728+00	32	69	\N	2021-07-12 09:50:43.438+00	2021-07-12 09:50:43.438+00
442	0.00	0.00	0.00	2021-07-10 10:20:52.96+00	2021-07-10 15:00:52.96+00	43	69	\N	2021-07-12 09:50:43.439+00	2021-07-12 09:50:43.439+00
443	0.00	0.00	0.00	2021-07-10 15:00:19.742+00	2021-07-10 16:00:19.743+00	3	69	\N	2021-07-12 09:50:43.441+00	2021-07-12 09:50:43.441+00
444	0.00	0.00	0.00	2021-07-10 16:00:43.252+00	2021-07-10 16:30:43.252+00	36	69	\N	2021-07-12 09:50:43.442+00	2021-07-12 09:50:43.442+00
446	0.00	0.00	0.00	2021-07-10 17:30:22.271+00	2021-07-10 20:00:22.271+00	37	69	\N	2021-07-12 09:50:43.445+00	2021-07-12 09:50:43.445+00
448	0.00	0.00	0.00	2021-07-10 11:20:44.592+00	2021-07-10 11:50:44.592+00	90	70	\N	2021-07-12 09:50:45.361+00	2021-07-12 09:50:45.361+00
449	0.00	0.00	0.00	2021-07-10 11:50:11.959+00	2021-07-10 12:20:11.959+00	97	70	\N	2021-07-12 09:50:45.362+00	2021-07-12 09:50:45.363+00
450	0.00	0.00	0.00	2021-07-10 12:20:40.248+00	2021-07-10 13:10:40.248+00	31	70	\N	2021-07-12 09:50:45.364+00	2021-07-12 09:50:45.364+00
452	0.00	0.00	0.00	2021-07-10 14:15:30.179+00	2021-07-10 15:00:30.179+00	104	70	\N	2021-07-12 09:50:45.367+00	2021-07-12 09:50:45.367+00
451	1.55	30.45	32.00	2021-07-10 13:10:13.532+00	2021-07-10 14:15:13.532+00	18	70	11	2021-07-12 09:50:45.366+00	2021-07-12 09:50:45.384+00
457	0.00	0.00	0.00	2021-07-11 09:00:44.861+00	2021-07-11 10:00:44.861+00	90	71	\N	2021-07-12 09:50:54.24+00	2021-07-12 09:50:54.24+00
462	0.00	0.00	0.00	2021-07-11 14:40:16.372+00	2021-07-11 15:40:16.373+00	3	71	\N	2021-07-12 09:50:54.249+00	2021-07-12 09:50:54.249+00
463	1.10	5.00	6.10	2021-07-11 15:40:47.554+00	2021-07-11 17:00:47.555+00	17	71	14	2021-07-12 09:50:54.25+00	2021-07-12 09:50:54.265+00
464	0.00	0.00	0.00	2021-07-11 17:00:18.71+00	2021-07-11 17:30:18.711+00	90	72	\N	2021-07-12 09:50:59.72+00	2021-07-12 09:50:59.72+00
466	0.00	0.00	0.00	2021-07-11 18:20:53.32+00	2021-07-11 19:00:53.32+00	97	72	\N	2021-07-12 09:50:59.724+00	2021-07-12 09:50:59.724+00
470	0.00	0.00	0.00	2021-07-11 22:30:14.384+00	2021-07-11 23:30:14.384+00	34	72	\N	2021-07-12 09:50:59.731+00	2021-07-12 09:50:59.731+00
471	0.00	0.00	0.00	2021-07-11 23:30:05.421+00	2021-07-11 23:45:05.421+00	92	72	\N	2021-07-12 09:50:59.736+00	2021-07-12 09:50:59.736+00
472	0.00	0.00	0.00	2021-07-11 23:45:02.346+00	2021-07-12 00:00:02.346+00	97	72	\N	2021-07-12 09:50:59.738+00	2021-07-12 09:50:59.738+00
477	0.00	0.00	0.00	2021-07-10 15:00:23.368+00	2021-07-10 16:00:23.368+00	3	73	\N	2021-07-12 09:51:04.047+00	2021-07-12 09:51:04.047+00
478	0.00	0.00	0.00	2021-07-10 16:00:46.353+00	2021-07-10 17:10:46.353+00	37	73	\N	2021-07-12 09:51:04.049+00	2021-07-12 09:51:04.049+00
479	13.00	37.00	50.00	2021-07-10 17:10:27.79+00	2021-07-10 19:00:27.79+00	17	73	13	2021-07-12 09:51:04.051+00	2021-07-12 09:51:04.062+00
480	0.00	0.00	0.00	2021-07-10 10:00:09.816+00	2021-07-10 11:00:09.816+00	90	74	\N	2021-07-12 09:51:06.626+00	2021-07-12 09:51:06.626+00
482	0.00	0.00	0.00	2021-07-10 12:00:03.266+00	2021-07-10 12:30:03.266+00	30	74	\N	2021-07-12 09:51:06.629+00	2021-07-12 09:51:06.629+00
483	0.00	0.00	0.00	2021-07-10 12:30:30.247+00	2021-07-10 13:00:30.247+00	104	74	\N	2021-07-12 09:51:06.63+00	2021-07-12 09:51:06.63+00
488	0.00	0.00	0.00	2021-07-10 16:00:17.49+00	2021-07-10 16:30:17.49+00	32	74	\N	2021-07-12 09:51:06.638+00	2021-07-12 09:51:06.638+00
489	0.00	0.00	0.00	2021-07-10 16:30:42.728+00	2021-07-10 17:20:42.728+00	30	74	\N	2021-07-12 09:51:06.64+00	2021-07-12 09:51:06.64+00
490	0.00	0.00	0.00	2021-07-10 17:20:07.81+00	2021-07-10 19:35:07.81+00	93	74	\N	2021-07-12 09:51:06.648+00	2021-07-12 09:51:06.648+00
493	0.00	0.00	0.00	2021-07-11 10:00:26.897+00	2021-07-11 12:45:26.897+00	89	75	\N	2021-07-12 09:51:19.846+00	2021-07-12 09:51:19.846+00
495	0.00	0.00	0.00	2021-07-11 15:00:16.594+00	2021-07-11 16:00:16.594+00	3	75	\N	2021-07-12 09:51:19.849+00	2021-07-12 09:51:19.849+00
494	2.00	12.00	14.00	2021-07-11 12:45:16.64+00	2021-07-11 15:00:16.64+00	17	75	14	2021-07-12 09:51:19.847+00	2021-07-12 09:51:19.856+00
497	0.00	0.00	0.00	2021-07-11 09:00:33.769+00	2021-07-11 09:30:33.769+00	90	76	\N	2021-07-12 09:51:30.552+00	2021-07-12 09:51:30.552+00
505	0.00	0.00	0.00	2021-07-11 16:00:44.792+00	2021-07-11 16:40:44.793+00	89	76	\N	2021-07-12 09:51:30.565+00	2021-07-12 09:51:30.565+00
499	1.00	0.00	0.00	2021-07-11 09:40:00.811+00	2021-07-11 10:50:00.812+00	94	76	15	2021-07-12 09:51:30.555+00	2021-07-12 09:51:30.579+00
500	9.00	0.00	9.00	2021-07-11 10:50:44.682+00	2021-07-11 12:30:44.682+00	17	76	15	2021-07-12 09:51:30.556+00	2021-07-12 09:51:30.585+00
506	1.00	0.00	0.00	2021-07-11 16:40:26.451+00	2021-07-11 17:00:26.451+00	27	76	15	2021-07-12 09:51:30.566+00	2021-07-12 09:51:30.59+00
507	0.00	0.00	0.00	2021-07-11 17:00:15.156+00	2021-07-11 17:15:15.157+00	90	77	\N	2021-07-12 09:51:36.387+00	2021-07-12 09:51:36.387+00
510	0.00	0.00	0.00	2021-07-11 18:10:50.708+00	2021-07-11 19:00:50.708+00	30	77	\N	2021-07-12 09:51:36.393+00	2021-07-12 09:51:36.393+00
511	0.00	0.00	0.00	2021-07-11 19:00:35.399+00	2021-07-12 01:00:35.4+00	53	77	\N	2021-07-12 09:51:36.394+00	2021-07-12 09:51:36.394+00
509	0.00	0.00	0.00	2021-07-11 16:50:59.542+00	2021-07-11 18:10:59.543+00	27	77	18	2021-07-12 09:51:36.391+00	2021-07-12 09:51:36.401+00
512	0.00	0.00	0.00	2021-07-10 10:00:41.706+00	2021-07-10 10:25:41.706+00	32	78	\N	2021-07-12 09:51:40.445+00	2021-07-12 09:51:40.445+00
513	0.00	0.00	0.00	2021-07-10 10:25:52.175+00	2021-07-10 12:00:52.175+00	92	78	\N	2021-07-12 09:51:40.446+00	2021-07-12 09:51:40.446+00
514	0.00	0.00	0.00	2021-07-10 12:00:47.318+00	2021-07-10 12:15:47.318+00	101	78	\N	2021-07-12 09:51:40.448+00	2021-07-12 09:51:40.448+00
516	0.00	0.00	0.00	2021-07-10 15:00:24.534+00	2021-07-10 16:00:24.534+00	3	78	\N	2021-07-12 09:51:40.45+00	2021-07-12 09:51:40.45+00
521	0.00	0.00	0.00	2021-07-10 13:50:39.127+00	2021-07-10 14:20:39.128+00	90	79	\N	2021-07-12 09:51:45.272+00	2021-07-12 09:51:45.272+00
523	0.00	0.00	0.00	2021-07-10 14:30:11.446+00	2021-07-10 16:00:11.446+00	3	79	\N	2021-07-12 09:51:45.284+00	2021-07-12 09:51:45.284+00
524	0.00	0.00	0.00	2021-07-10 16:00:13.071+00	2021-07-10 20:00:13.071+00	53	79	\N	2021-07-12 09:51:45.286+00	2021-07-12 09:51:45.286+00
525	0.00	0.00	0.00	2021-07-11 10:00:45.943+00	2021-07-11 13:00:45.944+00	32	80	\N	2021-07-12 09:51:48.879+00	2021-07-12 09:51:48.879+00
526	0.00	0.00	0.00	2021-07-11 13:00:39.756+00	2021-07-11 13:40:39.756+00	52	80	\N	2021-07-12 09:51:48.88+00	2021-07-12 09:51:48.88+00
528	0.00	0.00	0.00	2021-07-11 14:30:43.199+00	2021-07-11 15:00:43.199+00	100	80	\N	2021-07-12 09:51:48.883+00	2021-07-12 09:51:48.883+00
413	1.00	0.00	0.00	2021-07-10 11:25:09.635+00	2021-07-10 14:00:09.636+00	94	65	12	2021-07-12 09:50:09.565+00	2021-07-12 09:50:09.588+00
420	2.00	27.00	29.00	2021-07-10 11:00:18.122+00	2021-07-10 15:00:18.122+00	18	66	11	2021-07-12 09:50:11.989+00	2021-07-12 09:50:12.01+00
426	0.00	0.00	0.00	2021-07-11 10:00:51.987+00	2021-07-11 10:35:51.987+00	90	67	\N	2021-07-12 09:50:29.631+00	2021-07-12 09:50:29.631+00
456	0.00	0.00	0.00	2021-07-10 17:20:34.409+00	2021-07-10 19:00:34.409+00	104	70	\N	2021-07-12 09:50:45.374+00	2021-07-12 09:50:45.374+00
458	0.00	0.00	0.00	2021-07-11 10:00:15.678+00	2021-07-11 12:30:15.679+00	41	71	\N	2021-07-12 09:50:54.241+00	2021-07-12 09:50:54.241+00
469	0.00	0.00	0.00	2021-07-11 21:20:32.764+00	2021-07-11 22:30:32.764+00	49	72	\N	2021-07-12 09:50:59.729+00	2021-07-12 09:50:59.729+00
486	0.00	0.00	0.00	2021-07-10 14:10:43.12+00	2021-07-10 15:00:43.12+00	93	74	\N	2021-07-12 09:51:06.634+00	2021-07-12 09:51:06.634+00
502	0.00	0.00	0.00	2021-07-11 13:00:11.483+00	2021-07-11 13:20:11.483+00	97	76	\N	2021-07-12 09:51:30.559+00	2021-07-12 09:51:30.559+00
791	1.00	18.00	19.00	2021-07-12 17:05:18.781+00	2021-07-12 17:30:18.781+00	18	115	20	2021-07-13 11:25:18.142+00	2021-07-13 11:25:18.207+00
415	0.00	0.00	0.00	2021-07-10 14:00:03.955+00	2021-07-10 15:00:03.955+00	107	65	\N	2021-07-12 09:50:09.568+00	2021-07-12 09:50:09.568+00
424	0.00	0.00	0.00	2021-07-10 18:45:28.749+00	2021-07-10 20:00:28.749+00	97	66	\N	2021-07-12 09:50:11.996+00	2021-07-12 09:50:11.997+00
427	0.00	0.00	0.00	2021-07-11 10:35:48.775+00	2021-07-11 11:15:48.775+00	97	67	\N	2021-07-12 09:50:29.637+00	2021-07-12 09:50:29.637+00
455	0.00	0.00	0.00	2021-07-10 16:30:55.034+00	2021-07-10 17:20:55.035+00	30	70	\N	2021-07-12 09:50:45.373+00	2021-07-12 09:50:45.373+00
459	0.00	0.00	0.00	2021-07-11 12:30:59.224+00	2021-07-11 13:00:59.225+00	53	71	\N	2021-07-12 09:50:54.244+00	2021-07-12 09:50:54.244+00
468	1.00	12.00	13.00	2021-07-11 19:55:38.253+00	2021-07-11 21:20:38.253+00	17	72	14	2021-07-12 09:50:59.728+00	2021-07-12 09:50:59.753+00
474	0.00	0.00	0.00	2021-07-10 10:00:57.762+00	2021-07-10 10:20:57.763+00	90	73	\N	2021-07-12 09:51:04.043+00	2021-07-12 09:51:04.043+00
485	0.00	0.00	0.00	2021-07-10 13:40:56.722+00	2021-07-10 14:10:56.722+00	104	74	\N	2021-07-12 09:51:06.633+00	2021-07-12 09:51:06.633+00
503	0.00	0.00	0.00	2021-07-11 13:20:41.523+00	2021-07-11 15:00:41.523+00	89	76	\N	2021-07-12 09:51:30.56+00	2021-07-12 09:51:30.56+00
518	11.00	50.00	61.00	2021-07-10 16:10:14.604+00	2021-07-10 20:00:14.605+00	17	78	13	2021-07-12 09:51:40.453+00	2021-07-12 09:51:40.47+00
519	0.00	0.00	0.00	2021-07-10 10:00:26.605+00	2021-07-10 12:30:26.605+00	32	79	\N	2021-07-12 09:51:45.269+00	2021-07-12 09:51:45.269+00
530	0.00	0.00	0.00	2021-07-11 16:00:06.842+00	2021-07-11 17:00:06.843+00	53	80	\N	2021-07-12 09:51:48.885+00	2021-07-12 09:51:48.885+00
796	0.00	0.00	0.00	2021-07-12 19:05:25.841+00	2021-07-12 20:00:25.841+00	52	115	\N	2021-07-13 11:25:18.174+00	2021-07-13 11:25:18.174+00
416	0.00	0.00	0.00	2021-07-10 15:00:10.849+00	2021-07-10 18:35:10.849+00	53	65	\N	2021-07-12 09:50:09.57+00	2021-07-12 09:50:09.57+00
423	0.00	0.00	0.00	2021-07-10 17:40:49.16+00	2021-07-10 18:45:49.16+00	31	66	\N	2021-07-12 09:50:11.995+00	2021-07-12 09:50:11.995+00
428	0.00	0.00	0.00	2021-07-11 11:15:46.13+00	2021-07-11 11:30:46.13+00	31	67	\N	2021-07-12 09:50:29.639+00	2021-07-12 09:50:29.639+00
454	0.00	0.00	0.00	2021-07-10 16:00:28.822+00	2021-07-10 16:30:28.822+00	31	70	\N	2021-07-12 09:50:45.37+00	2021-07-12 09:50:45.37+00
460	5.00	0.00	5.00	2021-07-11 13:00:41.678+00	2021-07-11 14:00:41.679+00	17	71	14	2021-07-12 09:50:54.245+00	2021-07-12 09:50:54.261+00
465	4.90	6.10	11.00	2021-07-11 17:30:03.206+00	2021-07-11 18:20:03.206+00	17	72	14	2021-07-12 09:50:59.722+00	2021-07-12 09:50:59.751+00
475	0.00	0.00	0.00	2021-07-10 10:20:12.359+00	2021-07-10 11:30:12.359+00	37	73	\N	2021-07-12 09:51:04.045+00	2021-07-12 09:51:04.045+00
484	0.00	0.00	0.00	2021-07-10 13:00:59.826+00	2021-07-10 13:40:59.826+00	30	74	\N	2021-07-12 09:51:06.631+00	2021-07-12 09:51:06.631+00
504	0.00	0.00	0.00	2021-07-11 15:00:19.288+00	2021-07-11 16:00:19.289+00	3	76	\N	2021-07-12 09:51:30.562+00	2021-07-12 09:51:30.562+00
517	0.00	0.00	0.00	2021-07-10 16:00:02.407+00	2021-07-10 16:10:02.407+00	36	78	\N	2021-07-12 09:51:40.452+00	2021-07-12 09:51:40.452+00
520	0.00	0.00	0.00	2021-07-10 12:30:10.281+00	2021-07-10 13:50:10.281+00	92	79	\N	2021-07-12 09:51:45.271+00	2021-07-12 09:51:45.271+00
529	0.00	0.00	0.00	2021-07-11 15:00:22.377+00	2021-07-11 16:00:22.378+00	3	80	\N	2021-07-12 09:51:48.884+00	2021-07-12 09:51:48.884+00
797	0.00	0.00	0.00	2021-07-13 10:00:49.456+00	2021-07-13 10:20:49.456+00	32	116	\N	2021-07-13 23:04:07.957+00	2021-07-13 23:04:07.957+00
799	0.00	0.00	0.00	2021-07-13 10:25:43.717+00	2021-07-13 10:30:43.718+00	36	116	\N	2021-07-13 23:04:07.971+00	2021-07-13 23:04:07.971+00
806	0.00	0.00	0.00	2021-07-13 16:55:44.789+00	2021-07-13 17:15:44.789+00	30	116	\N	2021-07-13 23:04:08.016+00	2021-07-13 23:04:08.016+00
808	0.00	0.00	0.00	2021-07-13 18:00:42.589+00	2021-07-13 20:00:42.589+00	102	116	\N	2021-07-13 23:04:08.025+00	2021-07-13 23:04:08.025+00
804	15.00	38.00	53.00	2021-07-13 12:45:38.027+00	2021-07-13 14:30:38.027+00	17	116	21	2021-07-13 23:04:08.003+00	2021-07-13 23:04:08.04+00
802	10.00	28.00	38.00	2021-07-13 10:40:20.834+00	2021-07-13 12:25:20.834+00	17	116	21	2021-07-13 23:04:07.986+00	2021-07-13 23:04:08.044+00
417	0.00	0.00	0.00	2021-07-10 18:35:52.678+00	2021-07-10 19:00:52.678+00	53	65	\N	2021-07-12 09:50:09.572+00	2021-07-12 09:50:09.572+00
421	0.00	0.00	0.00	2021-07-10 15:00:33.653+00	2021-07-10 16:00:33.654+00	93	66	\N	2021-07-12 09:50:11.991+00	2021-07-12 09:50:11.991+00
422	1.45	29.00	30.45	2021-07-10 16:00:14.013+00	2021-07-10 17:40:14.015+00	18	66	11	2021-07-12 09:50:11.994+00	2021-07-12 09:50:12.011+00
425	0.00	0.00	0.00	2021-07-11 09:00:19.388+00	2021-07-11 10:00:19.388+00	37	67	\N	2021-07-12 09:50:29.628+00	2021-07-12 09:50:29.628+00
429	0.00	0.00	0.00	2021-07-11 11:30:31.304+00	2021-07-11 11:50:31.305+00	30	67	\N	2021-07-12 09:50:29.64+00	2021-07-12 09:50:29.64+00
435	1.00	0.00	0.00	2021-07-11 15:50:51.462+00	2021-07-11 17:00:51.462+00	95	67	18	2021-07-12 09:50:29.66+00	2021-07-12 09:50:29.667+00
436	0.00	0.00	0.00	2021-07-11 17:00:26.853+00	2021-07-11 17:20:26.853+00	92	68	\N	2021-07-12 09:50:35.01+00	2021-07-12 09:50:35.01+00
445	3.00	20.00	23.00	2021-07-10 16:30:25.863+00	2021-07-10 17:30:25.863+00	17	69	13	2021-07-12 09:50:43.444+00	2021-07-12 09:50:43.453+00
447	0.00	0.00	0.00	2021-07-10 10:00:02.95+00	2021-07-10 11:20:02.95+00	93	70	\N	2021-07-12 09:50:45.359+00	2021-07-12 09:50:45.36+00
453	0.00	0.00	0.00	2021-07-10 15:00:04.672+00	2021-07-10 16:00:04.672+00	3	70	\N	2021-07-12 09:50:45.369+00	2021-07-12 09:50:45.369+00
461	0.00	0.00	0.00	2021-07-11 14:00:17.519+00	2021-07-11 14:40:17.52+00	53	71	\N	2021-07-12 09:50:54.247+00	2021-07-12 09:50:54.247+00
467	1.00	11.00	12.00	2021-07-11 19:00:28.193+00	2021-07-11 19:55:28.193+00	17	72	\N	2021-07-12 09:50:59.726+00	2021-07-12 09:50:59.726+00
473	0.00	0.00	0.00	2021-07-12 00:00:29.107+00	2021-07-12 01:00:29.107+00	89	72	\N	2021-07-12 09:50:59.739+00	2021-07-12 09:50:59.739+00
476	14.00	23.00	37.00	2021-07-10 11:30:34.502+00	2021-07-10 15:00:34.502+00	17	73	13	2021-07-12 09:51:04.046+00	2021-07-12 09:51:04.06+00
481	0.00	0.00	0.00	2021-07-10 11:00:33.387+00	2021-07-10 12:00:33.387+00	30	74	\N	2021-07-12 09:51:06.627+00	2021-07-12 09:51:06.627+00
487	0.00	0.00	0.00	2021-07-10 15:00:53.012+00	2021-07-10 16:00:53.013+00	3	74	\N	2021-07-12 09:51:06.637+00	2021-07-12 09:51:06.637+00
491	0.00	0.00	0.00	2021-07-10 19:35:03.771+00	2021-07-10 20:00:03.771+00	30	74	\N	2021-07-12 09:51:06.649+00	2021-07-12 09:51:06.649+00
492	0.00	0.00	0.00	2021-07-11 09:00:45.993+00	2021-07-11 10:00:45.993+00	90	75	\N	2021-07-12 09:51:19.844+00	2021-07-12 09:51:19.844+00
496	0.00	0.00	0.00	2021-07-11 16:00:54.807+00	2021-07-11 17:00:54.808+00	30	75	\N	2021-07-12 09:51:19.85+00	2021-07-12 09:51:19.85+00
498	0.00	0.00	0.00	2021-07-11 09:30:22.734+00	2021-07-11 09:40:22.734+00	36	76	\N	2021-07-12 09:51:30.553+00	2021-07-12 09:51:30.553+00
501	1.00	9.00	10.00	2021-07-11 12:30:49.772+00	2021-07-11 13:00:49.772+00	17	76	15	2021-07-12 09:51:30.558+00	2021-07-12 09:51:30.586+00
508	0.00	0.00	0.00	2021-07-11 17:15:09.318+00	2021-07-11 17:50:09.318+00	53	77	\N	2021-07-12 09:51:36.389+00	2021-07-12 09:51:36.389+00
515	0.00	0.00	0.00	2021-07-10 12:15:58.185+00	2021-07-10 15:00:58.186+00	93	78	\N	2021-07-12 09:51:40.449+00	2021-07-12 09:51:40.449+00
522	0.00	0.00	0.00	2021-07-10 14:20:08.309+00	2021-07-10 14:30:08.31+00	53	79	\N	2021-07-12 09:51:45.283+00	2021-07-12 09:51:45.283+00
527	2.00	0.00	0.00	2021-07-11 13:40:30.776+00	2021-07-11 14:30:30.776+00	99	80	15	2021-07-12 09:51:48.881+00	2021-07-12 09:51:48.891+00
531	0.00	0.00	0.00	2021-07-11 17:00:19.633+00	2021-07-11 18:20:19.633+00	53	81	\N	2021-07-12 09:51:52.484+00	2021-07-12 09:51:52.484+00
532	0.00	0.00	0.00	2021-07-11 18:20:39.47+00	2021-07-11 18:50:39.473+00	52	81	\N	2021-07-12 09:51:52.486+00	2021-07-12 09:51:52.486+00
533	0.00	0.00	0.00	2021-07-11 18:50:32.038+00	2021-07-11 20:30:32.038+00	53	81	\N	2021-07-12 09:51:52.487+00	2021-07-12 09:51:52.487+00
534	0.00	0.00	0.00	2021-07-11 20:30:20.668+00	2021-07-12 01:00:20.668+00	53	81	\N	2021-07-12 09:51:52.488+00	2021-07-12 09:51:52.488+00
535	0.00	0.00	0.00	2021-07-10 10:00:00.211+00	2021-07-10 10:10:00.211+00	32	82	\N	2021-07-12 09:51:57.941+00	2021-07-12 09:51:57.941+00
536	0.00	0.00	0.00	2021-07-10 10:10:32.551+00	2021-07-10 13:00:32.551+00	43	82	\N	2021-07-12 09:51:57.942+00	2021-07-12 09:51:57.942+00
537	0.00	0.00	0.00	2021-07-10 13:00:24.749+00	2021-07-10 15:00:24.75+00	53	82	\N	2021-07-12 09:51:57.944+00	2021-07-12 09:51:57.944+00
538	0.00	0.00	0.00	2021-07-10 15:00:00.759+00	2021-07-10 16:00:00.759+00	3	82	\N	2021-07-12 09:51:57.945+00	2021-07-12 09:51:57.945+00
539	0.00	0.00	0.00	2021-07-10 16:00:25.022+00	2021-07-10 16:15:25.023+00	92	82	\N	2021-07-12 09:51:57.947+00	2021-07-12 09:51:57.947+00
540	0.00	0.00	0.00	2021-07-10 16:15:48.325+00	2021-07-10 16:20:48.325+00	101	82	\N	2021-07-12 09:51:57.948+00	2021-07-12 09:51:57.948+00
541	0.00	0.00	0.00	2021-07-10 16:20:18.653+00	2021-07-10 16:25:18.654+00	36	82	\N	2021-07-12 09:51:57.95+00	2021-07-12 09:51:57.95+00
542	0.00	0.00	0.00	2021-07-10 16:25:56.26+00	2021-07-10 16:40:56.261+00	107	82	\N	2021-07-12 09:51:57.951+00	2021-07-12 09:51:57.951+00
543	0.00	0.00	0.00	2021-07-10 16:40:58.167+00	2021-07-10 20:00:58.167+00	102	82	\N	2021-07-12 09:51:57.953+00	2021-07-12 09:51:57.953+00
544	0.00	0.00	0.00	2021-07-10 10:00:42.059+00	2021-07-10 10:30:42.06+00	90	83	\N	2021-07-12 09:52:04.607+00	2021-07-12 09:52:04.607+00
546	0.00	0.00	0.00	2021-07-10 14:30:53.44+00	2021-07-10 16:00:53.441+00	3	83	\N	2021-07-12 09:52:04.61+00	2021-07-12 09:52:04.61+00
547	0.00	0.00	0.00	2021-07-10 16:00:16.658+00	2021-07-10 18:00:16.658+00	41	83	\N	2021-07-12 09:52:04.611+00	2021-07-12 09:52:04.612+00
549	0.00	0.00	0.00	2021-07-11 19:00:49.301+00	2021-07-11 20:00:49.301+00	53	83	\N	2021-07-12 09:52:04.616+00	2021-07-12 09:52:04.616+00
545	1.00	0.00	0.00	2021-07-10 10:30:34.938+00	2021-07-10 14:30:34.939+00	94	83	11	2021-07-12 09:52:04.608+00	2021-07-12 09:52:04.625+00
548	27.50	0.00	27.50	2021-07-11 18:00:44.226+00	2021-07-11 19:00:44.226+00	5	83	11	2021-07-12 09:52:04.614+00	2021-07-12 09:52:04.626+00
550	0.00	0.00	0.00	2021-07-11 09:00:14.361+00	2021-07-11 09:30:14.361+00	32	84	\N	2021-07-12 09:52:08.998+00	2021-07-12 09:52:08.998+00
551	0.00	0.00	0.00	2021-07-11 09:30:25.774+00	2021-07-11 09:40:25.774+00	101	84	\N	2021-07-12 09:52:08.999+00	2021-07-12 09:52:08.999+00
552	0.00	0.00	0.00	2021-07-11 09:40:57.921+00	2021-07-11 09:50:57.922+00	36	84	\N	2021-07-12 09:52:09+00	2021-07-12 09:52:09+00
554	0.00	0.00	0.00	2021-07-11 15:00:47.322+00	2021-07-11 16:00:47.322+00	3	84	\N	2021-07-12 09:52:09.003+00	2021-07-12 09:52:09.003+00
553	1.00	0.00	0.00	2021-07-11 09:50:43.244+00	2021-07-11 15:00:43.244+00	95	84	15	2021-07-12 09:52:09.002+00	2021-07-12 09:52:09.012+00
555	0.00	0.00	0.00	2021-07-11 16:00:14.407+00	2021-07-11 17:00:14.407+00	95	84	15	2021-07-12 09:52:09.004+00	2021-07-12 09:52:09.015+00
556	0.00	0.00	0.00	2021-07-11 17:00:04.069+00	2021-07-11 17:15:04.069+00	32	85	\N	2021-07-12 09:52:12.122+00	2021-07-12 09:52:12.122+00
557	0.00	0.00	0.00	2021-07-11 17:15:12.567+00	2021-07-11 17:20:12.568+00	101	85	\N	2021-07-12 09:52:12.124+00	2021-07-12 09:52:12.124+00
558	0.00	0.00	0.00	2021-07-11 17:20:38.952+00	2021-07-11 17:30:38.952+00	36	85	\N	2021-07-12 09:52:12.127+00	2021-07-12 09:52:12.127+00
559	0.00	0.00	0.00	2021-07-11 17:30:21.718+00	2021-07-11 19:00:21.718+00	37	85	\N	2021-07-12 09:52:12.13+00	2021-07-12 09:52:12.13+00
560	0.00	0.00	0.00	2021-07-11 19:00:33.822+00	2021-07-11 19:30:33.822+00	37	85	\N	2021-07-12 09:52:12.132+00	2021-07-12 09:52:12.132+00
561	0.00	0.00	0.00	2021-07-11 19:30:16.222+00	2021-07-11 20:40:16.222+00	53	85	\N	2021-07-12 09:52:12.134+00	2021-07-12 09:52:12.134+00
562	0.00	0.00	0.00	2021-07-11 20:40:07.747+00	2021-07-12 01:00:07.747+00	53	85	\N	2021-07-12 09:52:12.136+00	2021-07-12 09:52:12.136+00
563	0.00	0.00	0.00	2021-07-10 10:00:02.3+00	2021-07-10 10:30:02.3+00	32	86	\N	2021-07-12 09:52:18.292+00	2021-07-12 09:52:18.292+00
564	0.00	0.00	0.00	2021-07-10 10:30:32.273+00	2021-07-10 10:40:32.273+00	101	86	\N	2021-07-12 09:52:18.296+00	2021-07-12 09:52:18.296+00
565	0.00	0.00	0.00	2021-07-10 10:40:56.532+00	2021-07-10 12:30:56.532+00	93	86	\N	2021-07-12 09:52:18.298+00	2021-07-12 09:52:18.298+00
566	0.00	0.00	0.00	2021-07-10 12:30:29.49+00	2021-07-10 12:40:29.491+00	53	86	\N	2021-07-12 09:52:18.3+00	2021-07-12 09:52:18.3+00
567	0.00	0.00	0.00	2021-07-10 12:40:31.248+00	2021-07-10 12:45:31.248+00	36	86	\N	2021-07-12 09:52:18.302+00	2021-07-12 09:52:18.302+00
568	0.00	0.00	0.00	2021-07-11 12:45:50.227+00	2021-07-11 15:00:50.228+00	102	86	\N	2021-07-12 09:52:18.303+00	2021-07-12 09:52:18.304+00
569	0.00	0.00	0.00	2021-07-11 15:00:13.564+00	2021-07-11 16:00:13.564+00	3	86	\N	2021-07-12 09:52:18.305+00	2021-07-12 09:52:18.305+00
570	0.00	0.00	0.00	2021-07-11 16:00:28.201+00	2021-07-11 20:00:28.202+00	93	86	\N	2021-07-12 09:52:18.307+00	2021-07-12 09:52:18.307+00
571	0.00	0.00	0.00	2021-07-11 10:00:37.804+00	2021-07-11 12:20:37.804+00	32	87	\N	2021-07-12 09:52:20.881+00	2021-07-12 09:52:20.881+00
572	0.00	0.00	0.00	2021-07-11 12:20:56.74+00	2021-07-11 13:00:56.741+00	92	87	\N	2021-07-12 09:52:20.884+00	2021-07-12 09:52:20.884+00
573	0.00	0.00	0.00	2021-07-11 13:00:18.358+00	2021-07-11 13:45:18.358+00	41	87	\N	2021-07-12 09:52:20.886+00	2021-07-12 09:52:20.886+00
574	0.00	0.00	0.00	2021-07-11 13:45:41.228+00	2021-07-11 15:00:41.228+00	93	87	\N	2021-07-12 09:52:20.888+00	2021-07-12 09:52:20.888+00
575	0.00	0.00	0.00	2021-07-11 15:00:05.359+00	2021-07-11 16:00:05.359+00	3	87	\N	2021-07-12 09:52:20.89+00	2021-07-12 09:52:20.89+00
576	0.00	0.00	0.00	2021-07-11 16:00:36.089+00	2021-07-11 17:20:36.089+00	53	87	\N	2021-07-12 09:52:20.892+00	2021-07-12 09:52:20.892+00
577	0.00	0.00	0.00	2021-07-11 17:20:02.336+00	2021-07-11 18:00:02.337+00	92	87	\N	2021-07-12 09:52:20.894+00	2021-07-12 09:52:20.894+00
578	0.00	0.00	0.00	2021-07-11 18:00:05.794+00	2021-07-11 19:00:05.794+00	93	87	\N	2021-07-12 09:52:20.895+00	2021-07-12 09:52:20.895+00
579	0.00	0.00	0.00	2021-07-11 19:00:45.225+00	2021-07-11 20:00:45.226+00	51	87	\N	2021-07-12 09:52:20.897+00	2021-07-12 09:52:20.897+00
580	0.00	0.00	0.00	2021-07-11 09:00:03.214+00	2021-07-11 12:40:03.214+00	43	88	\N	2021-07-12 09:52:24.716+00	2021-07-12 09:52:24.716+00
581	0.00	0.00	0.00	2021-07-11 12:40:34.797+00	2021-07-11 13:00:34.798+00	32	88	\N	2021-07-12 09:52:24.72+00	2021-07-12 09:52:24.72+00
582	0.00	0.00	0.00	2021-07-11 13:00:18.312+00	2021-07-11 13:15:18.312+00	36	88	\N	2021-07-12 09:52:24.73+00	2021-07-12 09:52:24.73+00
798	0.00	0.00	0.00	2021-07-13 10:20:15.421+00	2021-07-13 10:25:15.421+00	35	116	\N	2021-07-13 23:04:07.963+00	2021-07-13 23:04:07.963+00
800	0.00	0.00	0.00	2021-07-13 10:35:49.604+00	2021-07-13 10:40:49.604+00	101	116	\N	2021-07-13 23:04:07.982+00	2021-07-13 23:04:07.982+00
803	0.00	0.00	0.00	2021-07-13 12:25:10.415+00	2021-07-13 12:45:10.415+00	37	116	\N	2021-07-13 23:04:07.997+00	2021-07-13 23:04:07.997+00
805	0.00	0.00	0.00	2021-07-13 14:30:30.708+00	2021-07-13 15:30:30.708+00	3	116	\N	2021-07-13 23:04:08.009+00	2021-07-13 23:04:08.009+00
807	0.00	0.00	0.00	2021-07-13 17:35:12.361+00	2021-07-13 18:00:12.361+00	30	116	\N	2021-07-13 23:04:08.02+00	2021-07-13 23:04:08.02+00
583	5.00	0.00	5.00	2021-07-11 13:15:56.295+00	2021-07-11 13:35:56.296+00	17	88	18	2021-07-12 09:52:24.732+00	2021-07-12 09:52:24.77+00
591	0.00	0.00	0.00	2021-07-11 17:20:23.653+00	2021-07-11 17:50:23.653+00	30	89	\N	2021-07-12 09:52:30.552+00	2021-07-12 09:52:30.552+00
801	0.00	0.00	0.00	2021-07-13 10:30:09.1+00	2021-07-13 10:35:09.1+00	43	116	\N	2021-07-13 23:04:07.979+00	2021-07-13 23:04:07.979+00
584	0.00	0.00	0.00	2021-07-11 13:35:51.876+00	2021-07-11 13:50:51.876+00	97	88	\N	2021-07-12 09:52:24.734+00	2021-07-12 09:52:24.734+00
597	0.00	0.00	0.00	2021-07-11 20:30:03.176+00	2021-07-11 20:40:03.176+00	36	89	\N	2021-07-12 09:52:30.565+00	2021-07-12 09:52:30.565+00
603	0.00	0.00	0.00	2021-07-11 13:00:27.588+00	2021-07-11 13:15:27.588+00	101	90	\N	2021-07-12 09:52:33.225+00	2021-07-12 09:52:33.225+00
610	0.00	0.00	0.00	2021-07-11 13:45:16.276+00	2021-07-11 15:00:16.276+00	53	91	\N	2021-07-12 09:52:38.648+00	2021-07-12 09:52:38.648+00
617	0.00	0.00	0.00	2021-07-11 12:25:07.346+00	2021-07-11 15:00:07.346+00	41	92	\N	2021-07-12 09:52:46.462+00	2021-07-12 09:52:46.462+00
809	3.00	53.00	56.00	2021-07-13 15:30:59.184+00	2021-07-13 16:55:59.184+00	17	116	21	2021-07-13 23:04:08.026+00	2021-07-13 23:04:08.049+00
585	0.00	0.00	0.00	2021-07-11 13:50:46.654+00	2021-07-11 14:30:46.655+00	89	88	\N	2021-07-12 09:52:24.743+00	2021-07-12 09:52:24.743+00
596	0.00	0.00	0.00	2021-07-11 20:00:29.847+00	2021-07-11 20:30:29.848+00	100	89	\N	2021-07-12 09:52:30.563+00	2021-07-12 09:52:30.563+00
604	0.00	0.00	0.00	2021-07-11 13:15:26.23+00	2021-07-11 15:00:26.23+00	43	90	\N	2021-07-12 09:52:33.227+00	2021-07-12 09:52:33.227+00
609	0.00	0.00	0.00	2021-07-11 11:30:50.956+00	2021-07-11 13:45:50.957+00	93	91	\N	2021-07-12 09:52:38.646+00	2021-07-12 09:52:38.646+00
618	0.00	0.00	0.00	2021-07-11 15:00:03.885+00	2021-07-11 16:00:03.885+00	3	92	\N	2021-07-12 09:52:46.464+00	2021-07-12 09:52:46.464+00
621	0.00	0.00	0.00	2021-07-11 10:40:33.616+00	2021-07-11 11:00:33.616+00	92	93	\N	2021-07-12 09:53:24.797+00	2021-07-12 09:53:24.797+00
623	0.00	0.00	0.00	2021-07-11 11:10:14.463+00	2021-07-11 11:15:14.463+00	36	93	\N	2021-07-12 09:53:24.81+00	2021-07-12 09:53:24.81+00
810	0.00	0.00	0.00	2021-07-13 17:15:51.541+00	2021-07-13 17:35:51.541+00	107	116	\N	2021-07-13 23:04:08.033+00	2021-07-13 23:04:08.033+00
586	1.00	0.00	0.00	2021-07-11 14:30:50.721+00	2021-07-11 15:00:50.721+00	27	88	18	2021-07-12 09:52:24.746+00	2021-07-12 09:52:24.772+00
590	0.00	0.00	0.00	2021-07-11 17:00:34.589+00	2021-07-11 17:20:34.589+00	90	89	\N	2021-07-12 09:52:30.55+00	2021-07-12 09:52:30.55+00
811	0.00	0.00	0.00	2021-07-13 09:00:32.61+00	2021-07-13 10:00:32.61+00	53	117	\N	2021-07-14 00:15:58.857+00	2021-07-14 00:15:58.857+00
813	0.00	0.00	0.00	2021-07-13 11:30:20.383+00	2021-07-13 11:40:20.384+00	32	117	\N	2021-07-14 00:15:58.871+00	2021-07-14 00:15:58.871+00
814	0.00	0.00	0.00	2021-07-13 11:50:45.63+00	2021-07-13 12:00:45.631+00	36	117	\N	2021-07-14 00:15:58.876+00	2021-07-14 00:15:58.876+00
817	3.00	19.00	22.00	2021-07-13 12:20:31.4+00	2021-07-13 13:50:31.401+00	18	117	20	2021-07-14 00:15:58.887+00	2021-07-14 00:15:58.947+00
819	1.00	0.00	0.00	2021-07-13 14:00:56.27+00	2021-07-13 14:35:56.27+00	2	117	20	2021-07-14 00:15:58.898+00	2021-07-14 00:15:58.949+00
823	1.00	0.00	0.00	2021-07-13 18:50:12.226+00	2021-07-13 19:35:12.226+00	2	117	20	2021-07-14 00:15:58.915+00	2021-07-14 00:15:58.952+00
821	3.00	22.00	25.00	2021-07-13 17:35:06.772+00	2021-07-13 18:20:06.773+00	18	117	20	2021-07-14 00:15:58.906+00	2021-07-14 00:15:58.961+00
587	0.00	0.00	0.00	2021-07-11 15:00:35.733+00	2021-07-11 16:00:35.733+00	3	88	\N	2021-07-12 09:52:24.748+00	2021-07-12 09:52:24.748+00
595	0.00	0.00	0.00	2021-07-11 19:40:50.388+00	2021-07-11 20:00:50.388+00	30	89	\N	2021-07-12 09:52:30.561+00	2021-07-12 09:52:30.561+00
605	0.00	0.00	0.00	2021-07-11 15:00:52.847+00	2021-07-11 16:00:52.848+00	3	90	\N	2021-07-12 09:52:33.228+00	2021-07-12 09:52:33.228+00
608	0.00	0.00	0.00	2021-07-11 11:00:27.406+00	2021-07-11 11:30:27.406+00	90	91	\N	2021-07-12 09:52:38.644+00	2021-07-12 09:52:38.644+00
619	0.00	0.00	0.00	2021-07-11 15:00:00.115+00	2021-07-11 17:00:00.115+00	46	92	\N	2021-07-12 09:52:46.466+00	2021-07-12 09:52:46.466+00
620	0.00	0.00	0.00	2021-07-11 10:00:03.153+00	2021-07-11 10:40:03.153+00	32	93	\N	2021-07-12 09:53:24.792+00	2021-07-12 09:53:24.792+00
622	0.00	0.00	0.00	2021-07-11 11:00:02.163+00	2021-07-11 11:10:02.163+00	101	93	\N	2021-07-12 09:53:24.807+00	2021-07-12 09:53:24.807+00
624	0.00	0.00	0.00	2021-07-11 15:00:00.511+00	2021-07-11 16:00:00.511+00	3	93	\N	2021-07-12 09:53:24.817+00	2021-07-12 09:53:24.817+00
812	0.00	0.00	0.00	2021-07-13 10:00:40.238+00	2021-07-13 11:30:40.238+00	53	117	\N	2021-07-14 00:15:58.862+00	2021-07-14 00:15:58.862+00
815	0.00	0.00	0.00	2021-07-13 11:40:56.37+00	2021-07-13 11:50:56.37+00	101	117	\N	2021-07-14 00:15:58.878+00	2021-07-14 00:15:58.878+00
818	0.00	0.00	0.00	2021-07-13 13:50:22.316+00	2021-07-13 14:00:22.316+00	97	117	\N	2021-07-14 00:15:58.894+00	2021-07-14 00:15:58.894+00
820	0.00	0.00	0.00	2021-07-13 14:35:11.602+00	2021-07-13 15:35:11.603+00	3	117	\N	2021-07-14 00:15:58.901+00	2021-07-14 00:15:58.902+00
822	0.00	0.00	0.00	2021-07-13 18:20:22.465+00	2021-07-13 18:50:22.465+00	97	117	\N	2021-07-14 00:15:58.911+00	2021-07-14 00:15:58.911+00
824	0.00	0.00	0.00	2021-07-13 19:35:52.222+00	2021-07-13 20:00:52.225+00	31	117	\N	2021-07-14 00:15:58.942+00	2021-07-14 00:15:58.942+00
588	0.00	0.00	0.00	2021-07-11 16:00:08.248+00	2021-07-11 16:20:08.249+00	97	88	\N	2021-07-12 09:52:24.75+00	2021-07-12 09:52:24.75+00
594	1.00	8.00	9.00	2021-07-11 18:40:55.655+00	2021-07-11 19:40:55.655+00	17	89	18	2021-07-12 09:52:30.559+00	2021-07-12 09:52:30.583+00
600	0.00	0.00	0.00	2021-07-11 10:00:53.967+00	2021-07-11 11:00:53.968+00	32	90	\N	2021-07-12 09:52:33.217+00	2021-07-12 09:52:33.217+00
613	2.45	0.00	2.45	2021-07-11 17:00:22.068+00	2021-07-11 19:00:22.068+00	18	91	19	2021-07-12 09:52:38.654+00	2021-07-12 09:52:38.663+00
614	0.00	0.00	0.00	2021-07-11 09:00:08.774+00	2021-07-11 09:40:08.774+00	92	92	\N	2021-07-12 09:52:46.455+00	2021-07-12 09:52:46.455+00
816	0.00	0.00	0.00	2021-07-13 12:00:54.947+00	2021-07-13 12:20:54.947+00	41	117	\N	2021-07-14 00:15:58.883+00	2021-07-14 00:15:58.883+00
589	1.00	5.00	6.00	2021-07-11 16:20:09.858+00	2021-07-11 17:00:09.858+00	17	88	\N	2021-07-12 09:52:24.766+00	2021-07-12 09:52:24.766+00
592	0.00	0.00	0.00	2021-07-11 17:50:14.141+00	2021-07-11 18:00:14.142+00	36	89	\N	2021-07-12 09:52:30.554+00	2021-07-12 09:52:30.554+00
593	0.00	0.00	0.00	2021-07-11 18:00:48.948+00	2021-07-11 18:40:48.948+00	53	89	\N	2021-07-12 09:52:30.556+00	2021-07-12 09:52:30.556+00
606	0.00	0.00	0.00	2021-07-11 16:00:20.823+00	2021-07-11 20:00:20.824+00	104	90	\N	2021-07-12 09:52:33.23+00	2021-07-12 09:52:33.23+00
607	0.00	0.00	0.00	2021-07-11 10:00:51.001+00	2021-07-11 11:00:51.001+00	92	91	\N	2021-07-12 09:52:38.642+00	2021-07-12 09:52:38.642+00
598	0.00	0.00	0.00	2021-07-11 20:40:43.056+00	2021-07-11 21:30:43.056+00	41	89	\N	2021-07-12 09:52:30.568+00	2021-07-12 09:52:30.568+00
602	0.00	0.00	0.00	2021-07-11 11:30:02.677+00	2021-07-11 13:00:02.677+00	92	90	\N	2021-07-12 09:52:33.223+00	2021-07-12 09:52:33.223+00
611	0.00	0.00	0.00	2021-07-11 15:00:20.061+00	2021-07-11 16:00:20.062+00	3	91	\N	2021-07-12 09:52:38.65+00	2021-07-12 09:52:38.65+00
616	0.00	0.00	0.00	2021-07-11 11:45:34.335+00	2021-07-11 12:25:34.336+00	52	92	\N	2021-07-12 09:52:46.46+00	2021-07-12 09:52:46.46+00
599	0.00	0.00	0.00	2021-07-11 21:30:26.919+00	2021-07-12 01:00:26.919+00	53	89	\N	2021-07-12 09:52:30.57+00	2021-07-12 09:52:30.57+00
601	0.00	0.00	0.00	2021-07-11 11:00:16.868+00	2021-07-11 11:30:16.869+00	53	90	\N	2021-07-12 09:52:33.222+00	2021-07-12 09:52:33.222+00
612	0.00	0.00	0.00	2021-07-11 16:00:51.61+00	2021-07-11 17:00:51.61+00	53	91	\N	2021-07-12 09:52:38.651+00	2021-07-12 09:52:38.651+00
615	0.00	0.00	0.00	2021-07-11 09:40:27.575+00	2021-07-11 11:45:27.575+00	53	92	\N	2021-07-12 09:52:46.458+00	2021-07-12 09:52:46.458+00
625	0.00	0.00	0.00	2021-07-11 11:15:34.612+00	2021-07-11 15:00:34.612+00	109	93	\N	2021-07-12 09:53:24.824+00	2021-07-12 09:53:24.824+00
626	0.00	0.00	0.00	2021-07-11 16:00:20.915+00	2021-07-11 19:00:20.915+00	109	93	\N	2021-07-12 09:53:24.831+00	2021-07-12 09:53:24.831+00
627	0.00	0.00	0.00	2021-07-11 09:00:03.267+00	2021-07-11 15:00:03.267+00	46	94	\N	2021-07-12 09:53:43.162+00	2021-07-12 09:53:43.162+00
628	0.00	0.00	0.00	2021-07-11 15:00:37.561+00	2021-07-11 16:00:37.561+00	3	94	\N	2021-07-12 09:53:43.166+00	2021-07-12 09:53:43.166+00
629	0.00	0.00	0.00	2021-07-11 16:00:06.587+00	2021-07-11 17:00:06.588+00	46	94	\N	2021-07-12 09:53:43.184+00	2021-07-12 09:53:43.184+00
630	0.00	0.00	0.00	2021-07-11 10:00:53.931+00	2021-07-11 20:00:53.931+00	53	95	\N	2021-07-12 09:53:46.769+00	2021-07-12 09:53:46.769+00
631	0.00	0.00	0.00	2021-07-11 09:00:08.047+00	2021-07-11 13:30:08.047+00	46	96	\N	2021-07-12 09:54:07.206+00	2021-07-12 09:54:07.206+00
632	0.00	0.00	0.00	2021-07-11 13:30:16.669+00	2021-07-11 15:00:16.669+00	105	96	\N	2021-07-12 09:54:07.217+00	2021-07-12 09:54:07.218+00
633	0.00	0.00	0.00	2021-07-11 15:00:49.625+00	2021-07-11 16:00:49.625+00	3	96	\N	2021-07-12 09:54:07.22+00	2021-07-12 09:54:07.22+00
634	1.00	0.00	0.00	2021-07-11 16:00:34.876+00	2021-07-11 17:00:34.876+00	114	96	\N	2021-07-12 09:54:07.234+00	2021-07-12 09:54:07.234+00
635	0.00	0.00	0.00	2021-07-11 17:00:12.705+00	2021-07-11 17:30:12.706+00	90	97	\N	2021-07-12 09:54:10.971+00	2021-07-12 09:54:10.971+00
636	0.00	0.00	0.00	2021-07-11 17:30:11.286+00	2021-07-11 20:00:11.286+00	108	97	\N	2021-07-12 09:54:10.975+00	2021-07-12 09:54:10.975+00
637	0.00	0.00	0.00	2021-07-11 20:00:42.517+00	2021-07-11 20:40:42.517+00	53	97	\N	2021-07-12 09:54:10.978+00	2021-07-12 09:54:10.978+00
638	0.00	0.00	0.00	2021-07-11 20:40:52.216+00	2021-07-11 22:00:52.217+00	53	97	\N	2021-07-12 09:54:10.981+00	2021-07-12 09:54:10.981+00
639	0.00	0.00	0.00	2021-07-11 23:00:06.416+00	2021-07-11 23:45:06.416+00	105	97	\N	2021-07-12 09:54:10.99+00	2021-07-12 09:54:10.99+00
640	0.00	0.00	0.00	2021-07-11 23:45:48.063+00	2021-07-12 01:00:48.064+00	41	97	\N	2021-07-12 09:54:10.991+00	2021-07-12 09:54:10.991+00
641	0.00	0.00	0.00	2021-07-11 22:00:30.512+00	2021-07-11 23:00:30.512+00	34	97	\N	2021-07-12 09:54:10.992+00	2021-07-12 09:54:10.992+00
651	0.00	0.00	0.00	2021-07-11 10:00:26.764+00	2021-07-11 11:00:26.764+00	53	99	\N	2021-07-12 09:54:25.511+00	2021-07-12 09:54:25.511+00
652	0.00	0.00	0.00	2021-07-11 11:00:47.222+00	2021-07-11 11:30:47.222+00	90	99	\N	2021-07-12 09:54:25.513+00	2021-07-12 09:54:25.513+00
654	0.00	0.00	0.00	2021-07-11 14:00:56.712+00	2021-07-11 15:00:56.712+00	51	99	\N	2021-07-12 09:54:25.518+00	2021-07-12 09:54:25.518+00
655	4.00	4.45	8.45	2021-07-11 16:00:18.991+00	2021-07-11 19:10:18.991+00	18	99	\N	2021-07-12 09:54:25.522+00	2021-07-12 09:54:25.522+00
656	0.00	0.00	0.00	2021-07-11 19:10:57.413+00	2021-07-11 20:00:57.414+00	93	99	\N	2021-07-12 09:54:25.523+00	2021-07-12 09:54:25.523+00
653	2.00	2.45	4.45	2021-07-11 11:30:06.728+00	2021-07-11 14:00:06.728+00	18	99	19	2021-07-12 09:54:25.515+00	2021-07-12 09:54:25.533+00
657	0.00	0.00	0.00	2021-07-11 09:00:19.672+00	2021-07-11 09:15:19.673+00	90	100	\N	2021-07-12 09:54:31.646+00	2021-07-12 09:54:31.646+00
658	0.00	0.00	0.00	2021-07-11 09:15:01.801+00	2021-07-11 14:00:01.801+00	41	100	\N	2021-07-12 09:54:31.65+00	2021-07-12 09:54:31.65+00
659	0.00	0.00	0.00	2021-07-11 14:00:16.982+00	2021-07-11 15:00:16.982+00	51	100	\N	2021-07-12 09:54:31.651+00	2021-07-12 09:54:31.651+00
660	0.00	0.00	0.00	2021-07-11 15:00:11.798+00	2021-07-11 16:00:11.799+00	3	100	\N	2021-07-12 09:54:31.655+00	2021-07-12 09:54:31.655+00
661	0.00	0.00	0.00	2021-07-11 16:00:55.094+00	2021-07-11 17:00:55.095+00	41	100	\N	2021-07-12 09:54:31.657+00	2021-07-12 09:54:31.657+00
662	0.00	0.00	0.00	2021-07-11 17:00:03.887+00	2021-07-11 17:35:03.888+00	90	101	\N	2021-07-12 09:54:43.851+00	2021-07-12 09:54:43.851+00
663	0.00	0.00	0.00	2021-07-11 17:35:43.695+00	2021-07-11 19:00:43.695+00	53	101	\N	2021-07-12 09:54:43.852+00	2021-07-12 09:54:43.852+00
664	0.00	0.00	0.00	2021-07-11 19:00:41.932+00	2021-07-11 20:00:41.932+00	38	101	\N	2021-07-12 09:54:43.854+00	2021-07-12 09:54:43.854+00
665	0.00	0.00	0.00	2021-07-11 20:00:27.404+00	2021-07-11 20:20:27.404+00	36	101	\N	2021-07-12 09:54:43.863+00	2021-07-12 09:54:43.863+00
666	0.00	0.00	0.00	2021-07-11 20:20:05.687+00	2021-07-11 20:30:05.688+00	37	101	\N	2021-07-12 09:54:43.867+00	2021-07-12 09:54:43.867+00
668	0.00	0.00	0.00	2021-07-11 22:00:13.473+00	2021-07-11 23:00:13.473+00	34	101	\N	2021-07-12 09:54:43.87+00	2021-07-12 09:54:43.871+00
669	0.00	0.00	0.00	2021-07-11 23:00:15.262+00	2021-07-11 23:35:15.262+00	53	101	\N	2021-07-12 09:54:43.872+00	2021-07-12 09:54:43.872+00
667	0.00	0.00	0.00	2021-07-11 20:50:32.58+00	2021-07-11 22:00:32.58+00	22	101	20	2021-07-12 09:54:43.869+00	2021-07-12 09:54:43.887+00
670	0.00	0.00	0.00	2021-07-11 23:35:17.933+00	2021-07-12 01:00:17.933+00	22	101	20	2021-07-12 09:54:43.874+00	2021-07-12 09:54:43.89+00
671	0.00	0.00	0.00	2021-07-11 10:00:31.781+00	2021-07-11 10:30:31.782+00	32	102	\N	2021-07-12 09:54:51.753+00	2021-07-12 09:54:51.753+00
672	0.00	0.00	0.00	2021-07-11 10:30:01.328+00	2021-07-11 15:00:01.328+00	93	102	\N	2021-07-12 09:54:51.756+00	2021-07-12 09:54:51.756+00
673	0.00	0.00	0.00	2021-07-11 15:00:22.813+00	2021-07-11 16:00:22.813+00	3	102	\N	2021-07-12 09:54:51.758+00	2021-07-12 09:54:51.758+00
674	0.00	0.00	0.00	2021-07-11 16:00:46.03+00	2021-07-11 17:00:46.03+00	92	102	\N	2021-07-12 09:54:51.76+00	2021-07-12 09:54:51.76+00
675	0.00	0.00	0.00	2021-07-11 17:00:13.244+00	2021-07-11 17:20:13.244+00	101	102	\N	2021-07-12 09:54:51.761+00	2021-07-12 09:54:51.761+00
676	0.00	0.00	0.00	2021-07-11 17:20:39.184+00	2021-07-11 17:30:39.184+00	107	102	\N	2021-07-12 09:54:51.763+00	2021-07-12 09:54:51.763+00
677	0.00	0.00	0.00	2021-07-11 17:30:12.121+00	2021-07-11 18:30:12.121+00	30	102	\N	2021-07-12 09:54:51.765+00	2021-07-12 09:54:51.765+00
678	0.00	0.00	0.00	2021-07-11 18:30:16.607+00	2021-07-11 19:20:16.608+00	51	102	\N	2021-07-12 09:54:51.767+00	2021-07-12 09:54:51.767+00
679	0.00	0.00	0.00	2021-07-11 19:20:31.305+00	2021-07-11 20:00:31.305+00	53	102	\N	2021-07-12 09:54:51.77+00	2021-07-12 09:54:51.77+00
680	0.00	0.00	0.00	2021-07-11 10:00:03.738+00	2021-07-11 11:00:03.738+00	92	103	\N	2021-07-12 09:54:54.171+00	2021-07-12 09:54:54.171+00
681	0.00	0.00	0.00	2021-07-11 11:00:25.74+00	2021-07-11 11:30:25.74+00	90	103	\N	2021-07-12 09:54:54.173+00	2021-07-12 09:54:54.173+00
682	0.00	0.00	0.00	2021-07-11 11:30:53.353+00	2021-07-11 15:00:53.353+00	93	103	\N	2021-07-12 09:54:54.175+00	2021-07-12 09:54:54.175+00
683	0.00	0.00	0.00	2021-07-11 15:00:44.283+00	2021-07-11 16:00:44.285+00	3	103	\N	2021-07-12 09:54:54.181+00	2021-07-12 09:54:54.181+00
684	0.00	0.00	0.00	2021-07-11 16:00:00.306+00	2021-07-11 16:30:00.306+00	30	103	\N	2021-07-12 09:54:54.183+00	2021-07-12 09:54:54.183+00
685	0.00	0.00	0.00	2021-07-11 16:30:07.225+00	2021-07-11 17:40:07.225+00	97	103	\N	2021-07-12 09:54:54.186+00	2021-07-12 09:54:54.186+00
686	4.55	8.45	13.00	2021-07-11 17:40:29.843+00	2021-07-11 20:00:29.843+00	18	103	19	2021-07-12 09:54:54.187+00	2021-07-12 09:54:54.202+00
687	0.00	0.00	0.00	2021-07-11 09:00:21.133+00	2021-07-11 09:15:21.134+00	35	104	\N	2021-07-12 09:54:57.696+00	2021-07-12 09:54:57.697+00
688	0.00	0.00	0.00	2021-07-11 09:15:04.373+00	2021-07-11 09:25:04.373+00	32	104	\N	2021-07-12 09:54:57.7+00	2021-07-12 09:54:57.7+00
689	0.00	0.00	0.00	2021-07-11 09:25:33.632+00	2021-07-11 09:35:33.632+00	36	104	\N	2021-07-12 09:54:57.701+00	2021-07-12 09:54:57.701+00
690	0.00	0.00	0.00	2021-07-11 09:35:57.004+00	2021-07-11 10:40:57.004+00	89	104	\N	2021-07-12 09:54:57.703+00	2021-07-12 09:54:57.703+00
692	0.00	0.00	0.00	2021-07-11 11:00:57.252+00	2021-07-11 11:20:57.252+00	97	104	\N	2021-07-12 09:54:57.706+00	2021-07-12 09:54:57.706+00
695	1.00	4.00	5.00	2021-07-11 13:00:47.486+00	2021-07-11 13:30:47.486+00	19	104	\N	2021-07-12 09:54:57.712+00	2021-07-12 09:54:57.712+00
697	0.00	0.00	0.00	2021-07-11 14:00:23.03+00	2021-07-11 15:00:23.031+00	38	104	\N	2021-07-12 09:54:57.728+00	2021-07-12 09:54:57.728+00
698	0.00	0.00	0.00	2021-07-11 15:00:58.914+00	2021-07-11 16:00:58.914+00	3	104	\N	2021-07-12 09:54:57.73+00	2021-07-12 09:54:57.73+00
699	0.00	0.00	0.00	2021-07-11 16:00:39.94+00	2021-07-11 17:00:39.94+00	38	104	\N	2021-07-12 09:54:57.736+00	2021-07-12 09:54:57.736+00
691	1.00	3.00	4.00	2021-07-11 10:40:33.506+00	2021-07-11 11:00:33.507+00	18	104	20	2021-07-12 09:54:57.704+00	2021-07-12 09:54:57.742+00
693	1.00	0.00	0.00	2021-07-11 11:20:36.569+00	2021-07-11 12:20:36.569+00	2	104	20	2021-07-12 09:54:57.708+00	2021-07-12 09:54:57.743+00
694	0.00	0.00	0.00	2021-07-11 12:20:19.695+00	2021-07-11 13:00:19.695+00	22	104	20	2021-07-12 09:54:57.709+00	2021-07-12 09:54:57.745+00
696	1.00	5.00	6.00	2021-07-11 13:30:53.11+00	2021-07-11 14:00:53.11+00	22	104	20	2021-07-12 09:54:57.727+00	2021-07-12 09:54:57.75+00
700	0.00	0.00	0.00	2021-07-11 10:00:44.461+00	2021-07-11 10:30:44.462+00	93	105	\N	2021-07-12 09:55:22.736+00	2021-07-12 09:55:22.736+00
701	0.00	0.00	0.00	2021-07-11 10:30:10.576+00	2021-07-11 11:10:10.576+00	92	105	\N	2021-07-12 09:55:22.738+00	2021-07-12 09:55:22.738+00
702	0.00	0.00	0.00	2021-07-11 11:10:28.23+00	2021-07-11 11:30:28.23+00	90	105	\N	2021-07-12 09:55:22.74+00	2021-07-12 09:55:22.74+00
703	0.00	0.00	0.00	2021-07-11 11:30:03.333+00	2021-07-11 11:45:03.333+00	43	105	\N	2021-07-12 09:55:22.741+00	2021-07-12 09:55:22.742+00
704	0.00	0.00	0.00	2021-07-11 11:45:25.359+00	2021-07-11 12:10:25.359+00	53	105	\N	2021-07-12 09:55:22.743+00	2021-07-12 09:55:22.743+00
705	0.00	0.00	0.00	2021-07-11 12:10:11.922+00	2021-07-11 13:30:11.922+00	30	105	\N	2021-07-12 09:55:22.746+00	2021-07-12 09:55:22.746+00
706	0.00	0.00	0.00	2021-07-11 13:30:48.13+00	2021-07-11 13:50:48.13+00	39	105	\N	2021-07-12 09:55:22.748+00	2021-07-12 09:55:22.748+00
707	0.00	0.00	0.00	2021-07-11 13:30:09.331+00	2021-07-11 14:30:09.331+00	110	105	\N	2021-07-12 09:55:22.75+00	2021-07-12 09:55:22.75+00
714	0.00	0.00	0.00	2021-07-11 16:00:38.96+00	2021-07-11 17:00:38.96+00	3	106	\N	2021-07-12 09:55:39.324+00	2021-07-12 09:55:39.324+00
717	0.00	0.00	0.00	2021-07-11 09:15:18.533+00	2021-07-11 09:25:18.533+00	101	107	\N	2021-07-12 09:55:45.648+00	2021-07-12 09:55:45.648+00
727	0.55	8.45	9.00	2021-07-11 14:00:16.29+00	2021-07-12 14:20:16.291+00	22	107	20	2021-07-12 09:55:45.681+00	2021-07-12 09:55:45.721+00
736	0.00	0.00	0.00	2021-07-11 19:00:08.202+00	2021-07-12 19:40:08.203+00	38	108	\N	2021-07-12 09:55:49.918+00	2021-07-12 09:55:49.918+00
708	0.00	0.00	0.00	2021-07-11 14:30:49.888+00	2021-07-11 15:00:49.888+00	105	105	\N	2021-07-12 09:55:22.754+00	2021-07-12 09:55:22.754+00
713	0.00	0.00	0.00	2021-07-11 15:35:52.209+00	2021-07-11 16:00:52.209+00	105	106	\N	2021-07-12 09:55:39.321+00	2021-07-12 09:55:39.321+00
718	0.00	0.00	0.00	2021-07-11 09:25:04.75+00	2021-07-11 09:45:04.75+00	36	107	\N	2021-07-12 09:55:45.65+00	2021-07-12 09:55:45.65+00
728	0.55	8.45	9.00	2021-07-11 14:20:46.041+00	2021-07-12 14:40:46.041+00	18	107	20	2021-07-12 09:55:45.684+00	2021-07-12 09:55:45.722+00
735	0.00	0.00	0.00	2021-07-11 18:00:30.921+00	2021-07-12 19:00:30.921+00	97	108	\N	2021-07-12 09:55:49.916+00	2021-07-12 09:55:49.916+00
709	0.00	0.00	0.00	2021-07-11 15:00:10.538+00	2021-07-11 16:00:10.538+00	3	105	\N	2021-07-12 09:55:22.755+00	2021-07-12 09:55:22.755+00
712	0.00	0.00	0.00	2021-07-11 10:20:50.934+00	2021-07-11 15:35:50.934+00	43	106	\N	2021-07-12 09:55:39.319+00	2021-07-12 09:55:39.319+00
719	0.00	0.00	0.00	2021-07-11 09:45:56.428+00	2021-07-11 10:30:56.428+00	30	107	\N	2021-07-12 09:55:45.652+00	2021-07-12 09:55:45.652+00
729	0.00	0.00	0.00	2021-07-11 14:40:16.789+00	2021-07-12 15:00:16.789+00	97	107	\N	2021-07-12 09:55:45.686+00	2021-07-12 09:55:45.686+00
733	0.00	0.00	0.00	2021-07-11 17:00:03.591+00	2021-07-12 17:40:03.592+00	90	108	\N	2021-07-12 09:55:49.913+00	2021-07-12 09:55:49.913+00
710	0.00	0.00	0.00	2021-07-11 16:00:29.109+00	2021-07-11 20:00:29.109+00	46	105	\N	2021-07-12 09:55:22.766+00	2021-07-12 09:55:22.766+00
711	0.00	0.00	0.00	2021-07-11 10:00:30.133+00	2021-07-11 10:20:30.133+00	32	106	\N	2021-07-12 09:55:39.315+00	2021-07-12 09:55:39.315+00
730	0.00	0.00	0.00	2021-07-11 15:00:53.392+00	2021-07-12 16:00:53.392+00	3	107	\N	2021-07-12 09:55:45.688+00	2021-07-12 09:55:45.688+00
720	0.45	6.00	6.45	2021-07-11 10:30:53.068+00	2021-07-11 10:50:53.069+00	22	107	20	2021-07-12 09:55:45.654+00	2021-07-12 09:55:45.7+00
715	0.00	0.00	0.00	2021-07-11 17:00:58.86+00	2021-07-11 20:00:58.86+00	93	106	\N	2021-07-12 09:55:39.326+00	2021-07-12 09:55:39.326+00
716	0.00	0.00	0.00	2021-07-11 09:00:34.405+00	2021-07-11 09:15:34.405+00	32	107	\N	2021-07-12 09:55:45.645+00	2021-07-12 09:55:45.645+00
726	0.55	7.45	8.00	2021-07-11 13:40:15.384+00	2021-07-11 14:00:15.385+00	18	107	20	2021-07-12 09:55:45.679+00	2021-07-12 09:55:45.719+00
737	0.00	0.00	0.00	2021-07-11 19:40:14.361+00	2021-07-12 20:10:14.361+00	53	108	\N	2021-07-12 09:55:49.919+00	2021-07-12 09:55:49.919+00
731	0.00	0.00	0.00	2021-07-11 16:00:32.037+00	2021-07-12 16:20:32.037+00	30	107	\N	2021-07-12 09:55:45.69+00	2021-07-12 09:55:45.69+00
721	0.55	6.45	7.00	2021-07-11 10:50:18.832+00	2021-07-11 11:20:18.832+00	18	107	20	2021-07-12 09:55:45.656+00	2021-07-12 09:55:45.702+00
722	0.00	0.00	0.00	2021-07-11 11:20:13.841+00	2021-07-11 12:30:13.842+00	38	107	\N	2021-07-12 09:55:45.658+00	2021-07-12 09:55:45.658+00
732	0.00	0.00	0.00	2021-07-11 16:20:04.285+00	2021-07-12 17:00:04.285+00	38	107	\N	2021-07-12 09:55:45.691+00	2021-07-12 09:55:45.691+00
723	1.00	0.00	0.00	2021-07-11 12:30:56.721+00	2021-07-11 13:00:56.722+00	2	107	20	2021-07-12 09:55:45.659+00	2021-07-12 09:55:45.711+00
734	0.00	0.00	0.00	2021-07-11 17:40:51.308+00	2021-07-12 18:00:51.308+00	30	108	\N	2021-07-12 09:55:49.914+00	2021-07-12 09:55:49.914+00
724	0.00	0.00	0.00	2021-07-11 13:00:09.16+00	2021-07-11 13:10:09.16+00	32	107	\N	2021-07-12 09:55:45.663+00	2021-07-12 09:55:45.663+00
725	0.45	7.00	7.45	2021-07-11 13:10:53.84+00	2021-07-11 13:40:53.84+00	22	107	20	2021-07-12 09:55:45.664+00	2021-07-12 09:55:45.715+00
738	0.00	0.00	0.00	2021-07-11 20:10:01.413+00	2021-07-13 01:00:01.413+00	89	108	\N	2021-07-12 09:55:49.921+00	2021-07-12 09:55:49.921+00
739	0.00	0.00	0.00	2021-07-11 10:00:30.306+00	2021-07-11 10:25:30.306+00	32	109	\N	2021-07-12 09:55:54.593+00	2021-07-12 09:55:54.593+00
740	0.00	0.00	0.00	2021-07-11 10:25:55.777+00	2021-07-11 15:00:55.777+00	93	109	\N	2021-07-12 09:55:54.595+00	2021-07-12 09:55:54.595+00
741	0.00	0.00	0.00	2021-07-11 15:00:23.052+00	2021-07-11 16:00:23.052+00	3	109	\N	2021-07-12 09:55:54.596+00	2021-07-12 09:55:54.596+00
742	0.00	0.00	0.00	2021-07-11 16:00:43.89+00	2021-07-11 16:25:43.89+00	101	109	\N	2021-07-12 09:55:54.598+00	2021-07-12 09:55:54.598+00
743	0.00	0.00	0.00	2021-07-11 16:30:12.268+00	2021-07-11 16:35:12.268+00	36	109	\N	2021-07-12 09:55:54.6+00	2021-07-12 09:55:54.6+00
744	0.00	0.00	0.00	2021-07-11 16:35:00.318+00	2021-07-11 20:00:00.318+00	30	109	\N	2021-07-12 09:55:54.603+00	2021-07-12 09:55:54.603+00
752	0.00	0.00	0.00	2021-07-11 09:00:36.318+00	2021-07-12 09:15:36.318+00	32	111	\N	2021-07-12 23:34:37.46+00	2021-07-12 23:34:37.46+00
753	0.00	0.00	0.00	2021-07-11 09:15:09.148+00	2021-07-12 09:25:09.149+00	101	111	\N	2021-07-12 23:34:37.466+00	2021-07-12 23:34:37.466+00
754	0.00	0.00	0.00	2021-07-11 09:25:45.852+00	2021-07-12 09:45:45.853+00	36	111	\N	2021-07-12 23:34:37.479+00	2021-07-12 23:34:37.479+00
755	0.00	0.00	0.00	2021-07-11 09:45:45.9+00	2021-07-12 10:50:45.9+00	89	111	\N	2021-07-12 23:34:37.486+00	2021-07-12 23:34:37.486+00
758	0.00	0.00	0.00	2021-07-11 13:20:30.907+00	2021-07-12 14:20:30.908+00	3	111	\N	2021-07-12 23:34:37.505+00	2021-07-12 23:34:37.505+00
759	0.00	0.00	0.00	2021-07-11 13:00:48.556+00	2021-07-12 13:20:48.557+00	97	111	\N	2021-07-12 23:34:37.506+00	2021-07-12 23:34:37.506+00
762	0.00	0.00	0.00	2021-07-11 14:20:01.995+00	2021-07-12 17:30:01.996+00	53	111	\N	2021-07-12 23:34:37.519+00	2021-07-12 23:34:37.519+00
761	0.45	13.00	13.45	2021-07-11 18:15:07.222+00	2021-07-12 19:00:07.222+00	18	111	20	2021-07-12 23:34:37.517+00	2021-07-12 23:34:37.534+00
760	1.00	0.00	0.00	2021-07-11 17:30:50.196+00	2021-07-12 18:15:50.196+00	2	111	20	2021-07-12 23:34:37.514+00	2021-07-12 23:34:37.537+00
757	3.00	10.00	13.00	2021-07-11 11:35:13.67+00	2021-07-12 13:00:13.671+00	18	111	20	2021-07-12 23:34:37.492+00	2021-07-12 23:34:37.544+00
756	1.00	0.00	0.00	2021-07-11 10:50:19.358+00	2021-07-12 11:35:19.358+00	2	111	20	2021-07-12 23:34:37.487+00	2021-07-12 23:34:37.547+00
\.


--
-- Data for Name: atividades; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.atividades (id, descricao, tipo, unidade_medida, contrato_id, created_at, updated_at) FROM stdin;
3	Almoço	improdutiva	\N	1	2021-05-12 13:54:15.381+00	2021-05-12 13:54:15.381+00
63	Manutenção preventiva	parada	\N	2	2021-06-23 13:01:27.236+00	2021-06-23 13:01:27.236+00
61	Segurança_Fiscalização/MRN	improdutiva	\N	2	2021-06-23 13:00:09.825+00	2021-06-23 13:00:09.825+00
62	Manutenção corretiva	improdutiva	\N	2	2021-06-23 13:00:59.179+00	2021-06-23 13:00:59.179+00
64	Mobilização / Desmobilização do equipamento e equipe de ensaios de perda dágua ou fraturamento hidráulico	produtiva	unidades	1	2021-06-24 18:45:50.206+00	2021-06-24 18:45:50.206+00
6	Ensaio de Infiltração	produtiva	unidades	2	2021-06-18 16:06:15.55+00	2021-06-18 16:06:15.55+00
7	Ensaio de Dissipação	produtiva	unidades	2	2021-06-18 16:09:18.592+00	2021-06-18 16:09:18.592+00
8	CPTu	produtiva	metros	2	2021-06-18 16:52:47.269+00	2021-06-18 16:52:47.269+00
10	Aguardando frente de serviço	parada	\N	2	2021-06-20 18:13:59.421+00	2021-06-20 18:13:59.421+00
11	Aguardando a fiscalização	improdutiva	\N	2	2021-06-20 18:14:23.726+00	2021-06-20 18:14:23.726+00
12	Sondagem a trado (ST)	produtiva	metros	2	2021-06-20 18:15:54.976+00	2021-06-20 18:15:54.976+00
13	Sondagem Mista (SM)	produtiva	metros	2	2021-06-20 18:16:57.343+00	2021-06-20 18:16:57.343+00
14	Sondagem Rotativa (SR)	produtiva	metros	2	2021-06-20 18:17:34.297+00	2021-06-20 18:17:34.297+00
15	Sondagem à percussão (SPT)	produtiva	metros	2	2021-06-20 18:18:40.667+00	2021-06-20 18:18:40.667+00
16	Vane Test	produtiva	unidades	2	2021-06-20 18:20:31.433+00	2021-06-20 18:20:31.433+00
65	Mobilização / Desmobilização do equipamento e equipe de ensaios de pressiômetro ou Dilatômetro\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:46:24.407+00	2021-06-24 18:46:24.407+00
1	Sondagem Rotativa Destrutiva - Rocha	produtiva	metros	1	2021-05-12 13:47:47.502+00	2021-05-12 13:47:47.502+00
17	Sondagem Rotativa Destrutiva - Solo	produtiva	metros	1	2021-06-22 17:06:18.049+00	2021-06-22 17:06:18.049+00
18	Sondagem H - Testemunhada (Solo)	produtiva	metros	1	2021-06-22 17:17:04.128+00	2021-06-22 17:17:04.128+00
19	Sondagem H - Testemunhada (Rocha)	produtiva	metros	1	2021-06-22 17:22:59.78+00	2021-06-22 17:22:59.78+00
20	Sondagem N - Testemunhada (Solo)	produtiva	metros	1	2021-06-22 17:26:23.77+00	2021-06-22 17:26:23.77+00
21	Sondagem N - Testemunhada (Rocha)	produtiva	unidades	1	2021-06-22 17:29:50.994+00	2021-06-22 17:29:50.994+00
22	Sondagem a Percurssão	produtiva	metros	1	2021-06-22 17:33:36.01+00	2021-06-22 17:33:36.01+00
23	Sondagem a Trado	produtiva	metros	1	2021-06-22 17:36:27.794+00	2021-06-22 17:36:27.794+00
66	Mobilização / Desmobilização do equipamento e equipe de ensaio Vane Test\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:47:03.6+00	2021-06-24 18:47:03.6+00
24	Ensaio de Perda	produtiva	unidades	1	2021-06-22 17:41:24.587+00	2021-06-22 17:41:24.587+00
2	Ensaio de infiltração	produtiva	unidades	1	2021-05-12 13:52:56.124+00	2021-05-12 13:52:56.124+00
25	Coleta de Amostra - Bloco Indeformado	produtiva	unidades	1	2021-06-22 17:44:23.678+00	2021-06-22 17:44:23.678+00
26	Coleta de Amostra - Deformada	produtiva	unidades	1	2021-06-22 17:46:27.6+00	2021-06-22 17:46:27.6+00
27	Coleta de Amostra - Shelby/Denison	produtiva	unidades	1	2021-06-22 17:49:01.342+00	2021-06-22 17:49:01.342+00
46	Manutenção	improdutiva	\N	1	2021-06-22 19:05:47.74+00	2021-06-22 19:05:47.74+00
29	Piezometro - Elétrico	produtiva	unidades	1	2021-06-22 17:56:33.181+00	2021-06-22 17:56:33.181+00
30	Manobra	improdutiva	\N	1	2021-06-22 18:55:08.956+00	2021-06-22 18:55:08.957+00
31	Lavagem de furo	improdutiva	\N	1	2021-06-22 18:55:50.296+00	2021-06-22 18:55:50.296+00
32	DDS	improdutiva	\N	1	2021-06-22 18:56:23.196+00	2021-06-22 18:56:23.196+00
33	DDS coletivo	improdutiva	\N	1	2021-06-22 18:56:39.851+00	2021-06-22 18:56:39.851+00
34	Janta	improdutiva	\N	1	2021-06-22 18:57:00.175+00	2021-06-22 18:57:00.175+00
35	ART	improdutiva	\N	1	2021-06-22 18:57:21.394+00	2021-06-22 18:57:21.394+00
36	Checklist	improdutiva	\N	1	2021-06-22 18:57:47.426+00	2021-06-22 18:57:47.426+00
37	Aguardando água/diesel/transporte	improdutiva	\N	1	2021-06-22 18:58:48.921+00	2021-06-22 18:58:48.921+00
38	Falta de recursos (ferramentas e acessórios)	improdutiva	\N	1	2021-06-22 18:59:46.516+00	2021-06-22 18:59:46.516+00
41	Organização da Praça	improdutiva	\N	1	2021-06-22 19:01:14.657+00	2021-06-22 19:01:14.657+00
42	Haste espanada	improdutiva	\N	1	2021-06-22 19:02:04.427+00	2021-06-22 19:02:04.427+00
43	Adequação seg.trab./treinamento	improdutiva	\N	1	2021-06-22 19:03:41.093+00	2021-06-22 19:03:41.093+00
40	Abrindo praça	improdutiva	\N	1	2021-06-22 19:00:47.669+00	2021-06-22 19:00:47.669+00
48	Interdição de área	parada	\N	1	2021-06-22 19:06:57.625+00	2021-06-22 19:06:57.625+00
49	Indefinição de projeto	parada	\N	1	2021-06-22 19:07:27.993+00	2021-06-22 19:07:27.993+00
52	Paralisação por motivo de atendimento à política/atividade de SMS (VALE)	parada	\N	1	2021-06-22 19:10:26.074+00	2021-06-22 19:10:26.074+00
28	INA	produtiva	metros	1	2021-06-22 17:52:14.089+00	2021-06-22 17:52:14.09+00
47	Acesso desfavorável 	parada	\N	1	2021-06-22 19:06:31.381+00	2021-06-22 19:06:31.381+00
51	COVID-19	improdutiva	\N	1	2021-06-22 19:09:02.955+00	2021-06-22 19:09:02.955+00
54	Direct Push	produtiva	metros	2	2021-06-23 12:50:21.062+00	2021-06-23 12:50:21.062+00
55	Sondagem Rotativa Destrutiva	produtiva	metros	2	2021-06-23 12:53:28.575+00	2021-06-23 12:53:28.575+00
56	Instalação de Piezômetro Elétrico	produtiva	metros	2	2021-06-23 12:54:27.365+00	2021-06-23 12:54:27.365+00
57	Coleta de Amostra Indeformada - Shelby	produtiva	metros	2	2021-06-23 12:55:49.021+00	2021-06-23 12:55:49.021+00
58	Coleta de Amostra Indeformada - Denison	produtiva	metros	2	2021-06-23 12:56:41.834+00	2021-06-23 12:56:41.834+00
59	Coleta de Amostra Indeformada - Bloco	produtiva	unidades	2	2021-06-23 12:57:35.022+00	2021-06-23 12:57:35.022+00
60	Chuva	parada	\N	2	2021-06-23 12:59:30.065+00	2021-06-23 12:59:30.065+00
67	Mobilização / Desmobilização do equipamento e equipe de ensaio CPT\t\t\t\t\t\t\t\t\t\t\t	produtiva	metros	1	2021-06-24 18:47:50.363+00	2021-06-24 18:47:50.363+00
68	Ensaio Dilatômetro de Marchetti \t\t\t\t\t\t\t\t\t\t\t	produtiva	metros	1	2021-06-24 18:48:25.325+00	2021-06-24 18:48:25.325+00
69	Ensaio Pressiômetro auto-perfurante digital tipo Cambridge \t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:49:13.746+00	2021-06-24 18:49:13.746+00
70	Ensaio Pressiômetro em pré-furo tipo Ménard \t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:50:27.385+00	2021-06-24 18:50:27.385+00
71	CPTU - Deslocamento de equipamento entre furos de sondagem  \t\t\t\t\t\t\t\t\t\t\t	produtiva	metros	1	2021-06-24 18:51:22.261+00	2021-06-24 18:51:22.261+00
72	CPTU - Ensaio de Dissipação\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:51:56.012+00	2021-06-24 18:51:56.012+00
73	Ensaio Cone Penetration Test com medição da poro-pressão e perfilhamento resistivo– Cone-resistivo \t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:52:27.848+00	2021-06-24 18:52:27.848+00
74	Ensaio Cone Penetration Test com medição da poro-pressão e ensaio pressiométrico – Cone-pressiômetro \t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:53:00.775+00	2021-06-24 18:53:00.775+00
75	Ensaio Cone Penetration Test com medição da poro-pressão e leituras do módulo sísmico – Seismic CPTu \t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:53:50.225+00	2021-06-24 18:53:50.225+00
76	Ensaio Cone Penetration Test com medição da poro-pressão – CPTu \t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:54:23.761+00	2021-06-24 18:54:23.761+00
77	Ensaio de Palheta - Vane Test \t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:54:57.03+00	2021-06-24 18:54:57.03+00
78	Teste de vida em instrumentos de piezometria\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:55:30.751+00	2021-06-24 18:55:30.751+00
5	Piezometro - Casagrande	produtiva	metros	1	2021-05-28 12:27:09.5+00	2021-05-28 12:27:09.5+00
53	Outros	improdutiva	\N	1	2021-06-22 19:42:46.193+00	2021-06-22 19:42:46.193+00
45	Previsão de raios	improdutiva	\N	1	2021-06-22 19:05:21.219+00	2021-06-22 19:05:21.219+00
39	Aguardando Rollon	improdutiva	\N	1	2021-06-22 19:00:29.901+00	2021-06-22 19:00:29.901+00
79	Fornecimento e instalação de sistema de medição de deslocamento em profundidade tipo "Shape Array Accelerometer - SAA"\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:56:06.469+00	2021-06-24 18:56:06.469+00
80	Fornecimento e instalação de medidor de recalque magnético\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:56:39.007+00	2021-06-24 18:56:39.007+00
81	Fornecimento e instalação de extensômetro\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:57:03.856+00	2021-06-24 18:57:03.856+00
82	Adicional de sensor de piezometria em piezômetro multi-nível (fornecimento e instalação)\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:57:37.389+00	2021-06-24 18:57:37.389+00
83	Construção de piezômetro confinado, multi-nível com preenchimento do furo com graute (até dois sensores de piezometria).\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:58:17.805+00	2021-06-24 18:58:17.805+00
84	Fornecimento de cabo para piezômetro corda vibrante por metro (Marca DGSI, GEOKOM, RST, ROCTEST, SISGEO)\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t	produtiva	metros	1	2021-06-24 18:58:54.915+00	2021-06-24 18:58:54.915+00
85	Instalação de sensor de piezometria de corda-vibrante com protetor de surto (Marca DGSI, GEOKOM, RST, ROCTEST, SISGEO)\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 18:59:27.23+00	2021-06-24 18:59:27.23+00
86	Fornecimento de sensor de piezometria de corda-vibrante com protetor de surto (Marca DGSI, GEOKOM, RST, ROCTEST, SISGEO)\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 19:00:05.889+00	2021-06-24 19:00:05.889+00
87	Fornecimento e instalação de casing para inclinômetros\t\t\t\t\t\t\t\t\t\t\t	produtiva	unidades	1	2021-06-24 19:00:36.847+00	2021-06-24 19:00:36.847+00
50	Aguardando liberação para trabalho	parada	\N	1	2021-06-22 19:08:36.733+00	2021-06-22 19:08:36.733+00
90	DDS, Checklists, ART e PTS	improdutiva	\N	1	2021-06-27 22:57:35.297+00	2021-06-27 22:57:35.297+00
92	Trajeto Obra	improdutiva	\N	1	2021-06-27 23:10:59.994+00	2021-06-27 23:10:59.994+00
93	Aguardando Peça	improdutiva	\N	1	2021-06-27 23:14:47.785+00	2021-06-27 23:14:47.785+00
95	Mudança de Sonda (Maior que 200 m)	produtiva	unidades	1	2021-06-28 01:08:17.364+00	2021-06-28 01:08:17.364+00
94	Mudança de Sonda (Menor que 200 m)	produtiva	unidades	1	2021-06-28 01:07:53.506+00	2021-06-28 01:07:53.506+00
97	Revestimento de furo (H)	improdutiva	\N	1	2021-07-01 20:20:44.481+00	2021-07-01 20:20:44.481+00
98	Revestimento de furo (N)	improdutiva	\N	1	2021-07-01 20:21:02.454+00	2021-07-01 20:21:02.454+00
99	Tamponamento de furo	produtiva	unidades	1	2021-07-01 21:12:13.391+00	2021-07-01 21:12:13.391+00
100	Acondicionamento e transporte de amostras	improdutiva	\N	1	2021-07-01 21:17:13.226+00	2021-07-01 21:17:13.226+00
102	Recorte de furo (HW)	improdutiva	\N	1	2021-07-01 21:40:14.916+00	2021-07-01 21:40:14.916+00
103	Chuva	parada	\N	1	2021-07-01 22:03:11.01+00	2021-07-01 22:03:11.01+00
104	Preparando material para ensaio/instrumentos	improdutiva	\N	1	2021-07-01 22:04:15.331+00	2021-07-01 22:04:15.331+00
105	Deslocamento	improdutiva	\N	1	2021-07-07 21:57:36.164+00	2021-07-07 21:57:36.164+00
107	Abastecimento	improdutiva	\N	1	2021-07-08 23:01:57.212+00	2021-07-08 23:01:57.212+00
108	Desmobilização de equipamento de sondagem hidráulica	produtiva	unidades	1	2021-07-11 01:06:59.251+00	2021-07-11 01:06:59.251+00
109	Instalação de Instrumento	improdutiva	\N	1	2021-07-11 14:20:35.789+00	2021-07-11 14:20:35.789+00
110	Transporte de Sonda	improdutiva	\N	1	2021-07-11 15:37:42.459+00	2021-07-11 15:37:42.459+00
111	Mudança de sonda (Km adicional)	produtiva	unidades	1	2021-07-11 23:26:01.33+00	2021-07-11 23:26:01.33+00
112	Transporte de testemunho	produtiva	unidades	1	2021-07-11 23:27:31.318+00	2021-07-11 23:27:31.318+00
113	Mobilização de equipe de sondagem hidráulica	produtiva	unidades	1	2021-07-11 23:29:20.214+00	2021-07-11 23:29:20.214+00
114	Mudança de Sonda (Estrutura)	produtiva	unidades	1	2021-07-11 23:32:13.635+00	2021-07-11 23:32:13.635+00
101	Abertura do PTS	improdutiva	\N	1	2021-07-01 21:36:03.385+00	2021-07-01 21:36:03.385+00
89	Aguardando Fiscal	parada	\N	1	2021-06-27 22:33:49.505+00	2021-06-27 22:33:49.505+00
\.


--
-- Data for Name: cargo_permissions; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.cargo_permissions (id, cargo_id, name, can_create, can_read, can_update, can_delete, created_at, updated_at) FROM stdin;
1	2	admin.areas	t	t	t	t	2021-05-12 13:36:53.295+00	2021-05-12 13:36:53.295+00
2	2	admin.atividades	t	t	t	t	2021-05-12 13:36:53.298+00	2021-05-12 13:36:53.298+00
3	2	admin.cargos	t	t	t	t	2021-05-12 13:36:53.3+00	2021-05-12 13:36:53.3+00
4	2	admin.complexos	t	t	t	t	2021-05-12 13:36:53.302+00	2021-05-12 13:36:53.302+00
5	2	admin.configuracoes	t	t	t	t	2021-05-12 13:36:53.303+00	2021-05-12 13:36:53.303+00
6	2	admin.contratos	t	t	t	t	2021-05-12 13:36:53.307+00	2021-05-12 13:36:53.307+00
7	2	admin.dashboard	t	t	t	t	2021-05-12 13:36:53.308+00	2021-05-12 13:36:53.308+00
8	2	admin.equipamentos	t	t	t	t	2021-05-12 13:36:53.31+00	2021-05-12 13:36:53.31+00
9	2	admin.estruturas	t	t	t	t	2021-05-12 13:36:53.312+00	2021-05-12 13:36:53.312+00
10	2	admin.furos	t	t	t	t	2021-05-12 13:36:53.313+00	2021-05-12 13:36:53.313+00
11	2	admin.minas	t	t	t	t	2021-05-12 13:36:53.315+00	2021-05-12 13:36:53.315+00
12	2	admin.users	t	t	t	t	2021-05-12 13:36:53.317+00	2021-05-12 13:36:53.317+00
13	2	admin.rdos	t	t	t	t	2021-05-12 13:36:53.319+00	2021-05-12 13:36:53.319+00
14	2	admin.reports.relatorio_atividades_usuarios	t	t	t	t	2021-05-12 13:36:53.32+00	2021-05-12 13:36:53.32+00
105	9	admin.areas	t	t	t	t	2021-06-17 11:42:38.551+00	2021-06-17 11:42:38.551+00
106	9	admin.atividades	t	t	t	t	2021-06-17 11:42:38.555+00	2021-06-17 11:42:38.555+00
107	9	admin.cargos	t	t	t	t	2021-06-17 11:42:38.557+00	2021-06-17 11:42:38.557+00
108	9	admin.complexos	t	t	t	t	2021-06-17 11:42:38.559+00	2021-06-17 11:42:38.559+00
109	9	admin.configuracoes	t	t	t	t	2021-06-17 11:42:38.56+00	2021-06-17 11:42:38.56+00
110	9	admin.contratos	t	t	t	t	2021-06-17 11:42:38.562+00	2021-06-17 11:42:38.562+00
111	9	admin.dashboard	t	t	t	t	2021-06-17 11:42:38.564+00	2021-06-17 11:42:38.564+00
112	9	admin.equipamentos	t	t	t	t	2021-06-17 11:42:38.566+00	2021-06-17 11:42:38.566+00
113	9	admin.estruturas	t	t	t	t	2021-06-17 11:42:38.568+00	2021-06-17 11:42:38.568+00
114	9	admin.furos	t	t	t	t	2021-06-17 11:42:38.57+00	2021-06-17 11:42:38.57+00
115	9	admin.users	t	t	t	t	2021-06-17 11:42:38.572+00	2021-06-17 11:42:38.572+00
116	9	admin.configuracoes.logs	t	t	t	t	2021-06-17 11:42:38.574+00	2021-06-17 11:42:38.574+00
117	9	admin.minas	t	t	t	t	2021-06-17 11:42:38.576+00	2021-06-17 11:42:38.576+00
118	9	admin.rdos	t	t	t	t	2021-06-17 11:42:38.577+00	2021-06-17 11:42:38.577+00
119	9	admin.reports.atividades_usuarios	t	t	t	t	2021-06-17 11:42:38.579+00	2021-06-17 11:42:38.579+00
120	9	admin.reports.producao_usuarios	t	t	t	t	2021-06-17 11:42:38.581+00	2021-06-17 11:42:38.581+00
121	10	admin.areas	t	t	t	t	2021-06-18 11:48:40.512+00	2021-06-18 11:48:40.512+00
122	10	admin.atividades	t	t	t	t	2021-06-18 11:48:40.514+00	2021-06-18 11:48:40.514+00
123	10	admin.cargos	t	t	t	t	2021-06-18 11:48:40.516+00	2021-06-18 11:48:40.516+00
124	10	admin.complexos	t	t	t	t	2021-06-18 11:48:40.517+00	2021-06-18 11:48:40.517+00
125	10	admin.configuracoes	t	t	t	t	2021-06-18 11:48:40.532+00	2021-06-18 11:48:40.532+00
126	10	admin.contratos	t	t	t	t	2021-06-18 11:48:40.534+00	2021-06-18 11:48:40.534+00
127	10	admin.dashboard	t	t	t	t	2021-06-18 11:48:40.539+00	2021-06-18 11:48:40.539+00
128	10	admin.equipamentos	t	t	t	t	2021-06-18 11:48:40.54+00	2021-06-18 11:48:40.54+00
129	10	admin.estruturas	t	t	t	t	2021-06-18 11:48:40.542+00	2021-06-18 11:48:40.542+00
130	10	admin.furos	t	t	t	t	2021-06-18 11:48:40.543+00	2021-06-18 11:48:40.543+00
131	10	admin.users	t	t	t	t	2021-06-18 11:48:40.545+00	2021-06-18 11:48:40.545+00
132	10	admin.configuracoes.logs	t	t	t	t	2021-06-18 11:48:40.546+00	2021-06-18 11:48:40.546+00
133	10	admin.minas	t	t	t	t	2021-06-18 11:48:40.548+00	2021-06-18 11:48:40.548+00
134	10	admin.rdos	t	t	t	t	2021-06-18 11:48:40.55+00	2021-06-18 11:48:40.55+00
135	10	admin.reports.atividades_usuarios	t	t	t	t	2021-06-18 11:48:40.552+00	2021-06-18 11:48:40.552+00
136	10	admin.reports.producao_usuarios	t	t	t	t	2021-06-18 11:48:40.554+00	2021-06-18 11:48:40.554+00
137	11	admin.areas	t	t	t	t	2021-06-18 14:29:54.291+00	2021-06-18 14:29:54.291+00
138	11	admin.atividades	t	t	t	t	2021-06-18 14:29:54.293+00	2021-06-18 14:29:54.293+00
139	11	admin.cargos	t	t	t	t	2021-06-18 14:29:54.295+00	2021-06-18 14:29:54.295+00
140	11	admin.complexos	t	t	t	t	2021-06-18 14:29:54.296+00	2021-06-18 14:29:54.296+00
141	11	admin.configuracoes	t	t	t	t	2021-06-18 14:29:54.306+00	2021-06-18 14:29:54.306+00
142	11	admin.contratos	t	t	t	t	2021-06-18 14:29:54.308+00	2021-06-18 14:29:54.308+00
143	11	admin.dashboard	t	t	t	t	2021-06-18 14:29:54.31+00	2021-06-18 14:29:54.31+00
144	11	admin.equipamentos	t	t	t	t	2021-06-18 14:29:54.313+00	2021-06-18 14:29:54.313+00
145	11	admin.estruturas	t	t	t	t	2021-06-18 14:29:54.315+00	2021-06-18 14:29:54.315+00
146	11	admin.furos	t	t	t	t	2021-06-18 14:29:54.316+00	2021-06-18 14:29:54.316+00
147	11	admin.users	t	t	t	t	2021-06-18 14:29:54.317+00	2021-06-18 14:29:54.317+00
148	11	admin.configuracoes.logs	t	t	t	t	2021-06-18 14:29:54.32+00	2021-06-18 14:29:54.32+00
149	11	admin.minas	t	t	t	t	2021-06-18 14:29:54.322+00	2021-06-18 14:29:54.322+00
150	11	admin.rdos	t	t	t	t	2021-06-18 14:29:54.323+00	2021-06-18 14:29:54.323+00
151	11	admin.reports.atividades_usuarios	t	t	t	t	2021-06-18 14:29:54.325+00	2021-06-18 14:29:54.325+00
152	11	admin.reports.producao_usuarios	t	t	t	t	2021-06-18 14:29:54.326+00	2021-06-18 14:29:54.326+00
153	12	admin.areas	f	f	f	f	2021-06-18 14:33:05.253+00	2021-06-18 14:33:05.253+00
154	12	admin.atividades	f	f	f	f	2021-06-18 14:33:05.261+00	2021-06-18 14:33:05.262+00
155	12	admin.cargos	f	f	f	f	2021-06-18 14:33:05.263+00	2021-06-18 14:33:05.263+00
156	12	admin.complexos	f	f	f	f	2021-06-18 14:33:05.265+00	2021-06-18 14:33:05.265+00
157	12	admin.configuracoes	f	f	f	f	2021-06-18 14:33:05.268+00	2021-06-18 14:33:05.268+00
158	12	admin.contratos	f	f	f	f	2021-06-18 14:33:05.27+00	2021-06-18 14:33:05.27+00
159	12	admin.dashboard	f	f	f	f	2021-06-18 14:33:05.271+00	2021-06-18 14:33:05.271+00
160	12	admin.equipamentos	f	f	f	f	2021-06-18 14:33:05.273+00	2021-06-18 14:33:05.273+00
161	12	admin.estruturas	f	f	f	f	2021-06-18 14:33:05.275+00	2021-06-18 14:33:05.275+00
162	12	admin.furos	f	f	f	f	2021-06-18 14:33:05.276+00	2021-06-18 14:33:05.276+00
163	12	admin.users	f	f	f	f	2021-06-18 14:33:05.278+00	2021-06-18 14:33:05.278+00
164	12	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:33:05.28+00	2021-06-18 14:33:05.28+00
165	12	admin.minas	f	f	f	f	2021-06-18 14:33:05.281+00	2021-06-18 14:33:05.281+00
166	12	admin.rdos	f	f	f	f	2021-06-18 14:33:05.283+00	2021-06-18 14:33:05.283+00
167	12	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:33:05.285+00	2021-06-18 14:33:05.285+00
168	12	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:33:05.287+00	2021-06-18 14:33:05.287+00
169	13	admin.areas	f	f	f	f	2021-06-18 14:33:19.555+00	2021-06-18 14:33:19.555+00
170	13	admin.atividades	f	f	f	f	2021-06-18 14:33:19.557+00	2021-06-18 14:33:19.557+00
171	13	admin.cargos	f	f	f	f	2021-06-18 14:33:19.558+00	2021-06-18 14:33:19.558+00
172	13	admin.complexos	f	f	f	f	2021-06-18 14:33:19.56+00	2021-06-18 14:33:19.56+00
173	13	admin.configuracoes	f	f	f	f	2021-06-18 14:33:19.561+00	2021-06-18 14:33:19.561+00
174	13	admin.contratos	f	f	f	f	2021-06-18 14:33:19.563+00	2021-06-18 14:33:19.563+00
175	13	admin.dashboard	f	f	f	f	2021-06-18 14:33:19.564+00	2021-06-18 14:33:19.564+00
176	13	admin.equipamentos	f	f	f	f	2021-06-18 14:33:19.566+00	2021-06-18 14:33:19.566+00
177	13	admin.estruturas	f	f	f	f	2021-06-18 14:33:19.567+00	2021-06-18 14:33:19.567+00
178	13	admin.furos	f	f	f	f	2021-06-18 14:33:19.568+00	2021-06-18 14:33:19.568+00
179	13	admin.users	f	f	f	f	2021-06-18 14:33:19.57+00	2021-06-18 14:33:19.57+00
180	13	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:33:19.571+00	2021-06-18 14:33:19.571+00
181	13	admin.minas	f	f	f	f	2021-06-18 14:33:19.573+00	2021-06-18 14:33:19.573+00
182	13	admin.rdos	f	f	f	f	2021-06-18 14:33:19.574+00	2021-06-18 14:33:19.574+00
183	13	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:33:19.575+00	2021-06-18 14:33:19.575+00
184	13	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:33:19.582+00	2021-06-18 14:33:19.582+00
185	14	admin.areas	f	f	f	f	2021-06-18 14:33:42.698+00	2021-06-18 14:33:42.698+00
186	14	admin.atividades	f	f	f	f	2021-06-18 14:33:42.7+00	2021-06-18 14:33:42.7+00
187	14	admin.cargos	f	f	f	f	2021-06-18 14:33:42.701+00	2021-06-18 14:33:42.701+00
188	14	admin.complexos	f	f	f	f	2021-06-18 14:33:42.703+00	2021-06-18 14:33:42.703+00
189	14	admin.configuracoes	f	f	f	f	2021-06-18 14:33:42.704+00	2021-06-18 14:33:42.704+00
190	14	admin.contratos	f	f	f	f	2021-06-18 14:33:42.706+00	2021-06-18 14:33:42.706+00
191	14	admin.dashboard	f	f	f	f	2021-06-18 14:33:42.708+00	2021-06-18 14:33:42.708+00
192	14	admin.equipamentos	f	f	f	f	2021-06-18 14:33:42.709+00	2021-06-18 14:33:42.709+00
193	14	admin.estruturas	f	f	f	f	2021-06-18 14:33:42.71+00	2021-06-18 14:33:42.71+00
194	14	admin.furos	f	f	f	f	2021-06-18 14:33:42.712+00	2021-06-18 14:33:42.712+00
195	14	admin.users	f	f	f	f	2021-06-18 14:33:42.713+00	2021-06-18 14:33:42.713+00
196	14	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:33:42.717+00	2021-06-18 14:33:42.717+00
197	14	admin.minas	f	f	f	f	2021-06-18 14:33:42.719+00	2021-06-18 14:33:42.719+00
198	14	admin.rdos	f	f	f	f	2021-06-18 14:33:42.721+00	2021-06-18 14:33:42.721+00
199	14	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:33:42.722+00	2021-06-18 14:33:42.722+00
200	14	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:33:42.724+00	2021-06-18 14:33:42.724+00
201	15	admin.areas	f	f	f	f	2021-06-18 14:34:14.168+00	2021-06-18 14:34:14.168+00
202	15	admin.atividades	f	f	f	f	2021-06-18 14:34:14.17+00	2021-06-18 14:34:14.17+00
203	15	admin.cargos	f	f	f	f	2021-06-18 14:34:14.171+00	2021-06-18 14:34:14.171+00
204	15	admin.complexos	f	f	f	f	2021-06-18 14:34:14.172+00	2021-06-18 14:34:14.172+00
205	15	admin.configuracoes	f	f	f	f	2021-06-18 14:34:14.174+00	2021-06-18 14:34:14.174+00
206	15	admin.contratos	f	f	f	f	2021-06-18 14:34:14.175+00	2021-06-18 14:34:14.175+00
207	15	admin.dashboard	f	f	f	f	2021-06-18 14:34:14.177+00	2021-06-18 14:34:14.177+00
208	15	admin.equipamentos	f	f	f	f	2021-06-18 14:34:14.178+00	2021-06-18 14:34:14.178+00
209	15	admin.estruturas	f	f	f	f	2021-06-18 14:34:14.179+00	2021-06-18 14:34:14.179+00
210	15	admin.furos	f	f	f	f	2021-06-18 14:34:14.181+00	2021-06-18 14:34:14.181+00
211	15	admin.users	f	f	f	f	2021-06-18 14:34:14.183+00	2021-06-18 14:34:14.183+00
212	15	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:34:14.185+00	2021-06-18 14:34:14.185+00
213	15	admin.minas	f	f	f	f	2021-06-18 14:34:14.186+00	2021-06-18 14:34:14.186+00
214	15	admin.rdos	f	f	f	f	2021-06-18 14:34:14.187+00	2021-06-18 14:34:14.187+00
215	15	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:34:14.189+00	2021-06-18 14:34:14.189+00
216	15	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:34:14.19+00	2021-06-18 14:34:14.19+00
217	16	admin.areas	f	f	f	f	2021-06-18 14:34:26.206+00	2021-06-18 14:34:26.206+00
218	16	admin.atividades	f	f	f	f	2021-06-18 14:34:26.208+00	2021-06-18 14:34:26.208+00
219	16	admin.cargos	f	f	f	f	2021-06-18 14:34:26.209+00	2021-06-18 14:34:26.209+00
220	16	admin.complexos	f	f	f	f	2021-06-18 14:34:26.211+00	2021-06-18 14:34:26.211+00
221	16	admin.configuracoes	f	f	f	f	2021-06-18 14:34:26.212+00	2021-06-18 14:34:26.212+00
222	16	admin.contratos	f	f	f	f	2021-06-18 14:34:26.214+00	2021-06-18 14:34:26.214+00
223	16	admin.dashboard	f	f	f	f	2021-06-18 14:34:26.215+00	2021-06-18 14:34:26.215+00
224	16	admin.equipamentos	f	f	f	f	2021-06-18 14:34:26.217+00	2021-06-18 14:34:26.217+00
225	16	admin.estruturas	f	f	f	f	2021-06-18 14:34:26.218+00	2021-06-18 14:34:26.218+00
226	16	admin.furos	f	f	f	f	2021-06-18 14:34:26.22+00	2021-06-18 14:34:26.22+00
227	16	admin.users	f	f	f	f	2021-06-18 14:34:26.221+00	2021-06-18 14:34:26.221+00
228	16	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:34:26.223+00	2021-06-18 14:34:26.223+00
229	16	admin.minas	f	f	f	f	2021-06-18 14:34:26.225+00	2021-06-18 14:34:26.225+00
230	16	admin.rdos	f	f	f	f	2021-06-18 14:34:26.234+00	2021-06-18 14:34:26.234+00
231	16	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:34:26.237+00	2021-06-18 14:34:26.237+00
232	16	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:34:26.238+00	2021-06-18 14:34:26.238+00
233	17	admin.areas	f	f	f	f	2021-06-18 14:34:59.896+00	2021-06-18 14:34:59.896+00
234	17	admin.atividades	f	f	f	f	2021-06-18 14:34:59.897+00	2021-06-18 14:34:59.897+00
235	17	admin.cargos	f	f	f	f	2021-06-18 14:34:59.899+00	2021-06-18 14:34:59.899+00
236	17	admin.complexos	f	f	f	f	2021-06-18 14:34:59.9+00	2021-06-18 14:34:59.9+00
237	17	admin.configuracoes	f	f	f	f	2021-06-18 14:34:59.901+00	2021-06-18 14:34:59.901+00
238	17	admin.contratos	f	f	f	f	2021-06-18 14:34:59.903+00	2021-06-18 14:34:59.903+00
239	17	admin.dashboard	f	f	f	f	2021-06-18 14:34:59.904+00	2021-06-18 14:34:59.904+00
240	17	admin.equipamentos	f	f	f	f	2021-06-18 14:34:59.906+00	2021-06-18 14:34:59.906+00
241	17	admin.estruturas	f	f	f	f	2021-06-18 14:34:59.907+00	2021-06-18 14:34:59.907+00
242	17	admin.furos	f	f	f	f	2021-06-18 14:34:59.908+00	2021-06-18 14:34:59.908+00
243	17	admin.users	f	f	f	f	2021-06-18 14:34:59.91+00	2021-06-18 14:34:59.91+00
244	17	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:34:59.911+00	2021-06-18 14:34:59.911+00
245	17	admin.minas	f	f	f	f	2021-06-18 14:34:59.913+00	2021-06-18 14:34:59.913+00
246	17	admin.rdos	f	f	f	f	2021-06-18 14:34:59.914+00	2021-06-18 14:34:59.914+00
247	17	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:34:59.915+00	2021-06-18 14:34:59.915+00
248	17	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:34:59.918+00	2021-06-18 14:34:59.918+00
249	18	admin.areas	f	f	f	f	2021-06-18 14:35:23.074+00	2021-06-18 14:35:23.074+00
250	18	admin.atividades	f	f	f	f	2021-06-18 14:35:23.077+00	2021-06-18 14:35:23.077+00
251	18	admin.cargos	f	f	f	f	2021-06-18 14:35:23.078+00	2021-06-18 14:35:23.078+00
252	18	admin.complexos	f	f	f	f	2021-06-18 14:35:23.079+00	2021-06-18 14:35:23.079+00
253	18	admin.configuracoes	f	f	f	f	2021-06-18 14:35:23.081+00	2021-06-18 14:35:23.081+00
254	18	admin.contratos	f	f	f	f	2021-06-18 14:35:23.082+00	2021-06-18 14:35:23.082+00
255	18	admin.dashboard	f	f	f	f	2021-06-18 14:35:23.084+00	2021-06-18 14:35:23.084+00
256	18	admin.equipamentos	f	f	f	f	2021-06-18 14:35:23.085+00	2021-06-18 14:35:23.085+00
257	18	admin.estruturas	f	f	f	f	2021-06-18 14:35:23.088+00	2021-06-18 14:35:23.088+00
258	18	admin.furos	f	f	f	f	2021-06-18 14:35:23.09+00	2021-06-18 14:35:23.09+00
259	18	admin.users	f	f	f	f	2021-06-18 14:35:23.091+00	2021-06-18 14:35:23.091+00
260	18	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:35:23.093+00	2021-06-18 14:35:23.093+00
261	18	admin.minas	f	f	f	f	2021-06-18 14:35:23.094+00	2021-06-18 14:35:23.094+00
262	18	admin.rdos	f	f	f	f	2021-06-18 14:35:23.096+00	2021-06-18 14:35:23.096+00
263	18	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:35:23.097+00	2021-06-18 14:35:23.097+00
264	18	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:35:23.099+00	2021-06-18 14:35:23.099+00
265	19	admin.areas	f	f	f	f	2021-06-18 14:36:27.727+00	2021-06-18 14:36:27.727+00
266	19	admin.atividades	f	f	f	f	2021-06-18 14:36:27.73+00	2021-06-18 14:36:27.73+00
267	19	admin.cargos	f	f	f	f	2021-06-18 14:36:27.732+00	2021-06-18 14:36:27.732+00
268	19	admin.complexos	f	f	f	f	2021-06-18 14:36:27.735+00	2021-06-18 14:36:27.735+00
269	19	admin.configuracoes	f	f	f	f	2021-06-18 14:36:27.739+00	2021-06-18 14:36:27.739+00
270	19	admin.contratos	f	f	f	f	2021-06-18 14:36:27.74+00	2021-06-18 14:36:27.74+00
271	19	admin.dashboard	f	f	f	f	2021-06-18 14:36:27.742+00	2021-06-18 14:36:27.742+00
272	19	admin.equipamentos	f	f	f	f	2021-06-18 14:36:27.743+00	2021-06-18 14:36:27.743+00
273	19	admin.estruturas	f	f	f	f	2021-06-18 14:36:27.745+00	2021-06-18 14:36:27.745+00
274	19	admin.furos	f	f	f	f	2021-06-18 14:36:27.746+00	2021-06-18 14:36:27.746+00
275	19	admin.users	f	f	f	f	2021-06-18 14:36:27.748+00	2021-06-18 14:36:27.748+00
276	19	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:36:27.749+00	2021-06-18 14:36:27.749+00
277	19	admin.minas	f	f	f	f	2021-06-18 14:36:27.751+00	2021-06-18 14:36:27.751+00
278	19	admin.rdos	f	f	f	f	2021-06-18 14:36:27.752+00	2021-06-18 14:36:27.752+00
279	19	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:36:27.754+00	2021-06-18 14:36:27.754+00
280	19	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:36:27.755+00	2021-06-18 14:36:27.755+00
281	20	admin.areas	f	f	f	f	2021-06-18 14:36:57.699+00	2021-06-18 14:36:57.699+00
282	20	admin.atividades	f	f	f	f	2021-06-18 14:36:57.701+00	2021-06-18 14:36:57.701+00
283	20	admin.cargos	f	f	f	f	2021-06-18 14:36:57.702+00	2021-06-18 14:36:57.702+00
284	20	admin.complexos	f	f	f	f	2021-06-18 14:36:57.704+00	2021-06-18 14:36:57.704+00
285	20	admin.configuracoes	f	f	f	f	2021-06-18 14:36:57.705+00	2021-06-18 14:36:57.705+00
286	20	admin.contratos	f	f	f	f	2021-06-18 14:36:57.708+00	2021-06-18 14:36:57.708+00
287	20	admin.dashboard	f	f	f	f	2021-06-18 14:36:57.709+00	2021-06-18 14:36:57.709+00
288	20	admin.equipamentos	f	f	f	f	2021-06-18 14:36:57.711+00	2021-06-18 14:36:57.711+00
289	20	admin.estruturas	f	f	f	f	2021-06-18 14:36:57.713+00	2021-06-18 14:36:57.713+00
290	20	admin.furos	f	f	f	f	2021-06-18 14:36:57.714+00	2021-06-18 14:36:57.714+00
291	20	admin.users	f	f	f	f	2021-06-18 14:36:57.716+00	2021-06-18 14:36:57.716+00
292	20	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:36:57.717+00	2021-06-18 14:36:57.717+00
293	20	admin.minas	f	f	f	f	2021-06-18 14:36:57.719+00	2021-06-18 14:36:57.719+00
294	20	admin.rdos	f	f	f	f	2021-06-18 14:36:57.72+00	2021-06-18 14:36:57.72+00
295	20	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:36:57.722+00	2021-06-18 14:36:57.722+00
296	20	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:36:57.723+00	2021-06-18 14:36:57.723+00
297	21	admin.areas	f	f	f	f	2021-06-18 14:37:30.054+00	2021-06-18 14:37:30.054+00
298	21	admin.atividades	f	f	f	f	2021-06-18 14:37:30.056+00	2021-06-18 14:37:30.056+00
299	21	admin.cargos	f	f	f	f	2021-06-18 14:37:30.057+00	2021-06-18 14:37:30.057+00
300	21	admin.complexos	f	f	f	f	2021-06-18 14:37:30.059+00	2021-06-18 14:37:30.059+00
301	21	admin.configuracoes	f	f	f	f	2021-06-18 14:37:30.06+00	2021-06-18 14:37:30.06+00
302	21	admin.contratos	f	f	f	f	2021-06-18 14:37:30.061+00	2021-06-18 14:37:30.061+00
303	21	admin.dashboard	f	f	f	f	2021-06-18 14:37:30.063+00	2021-06-18 14:37:30.063+00
304	21	admin.equipamentos	f	f	f	f	2021-06-18 14:37:30.064+00	2021-06-18 14:37:30.064+00
305	21	admin.estruturas	f	f	f	f	2021-06-18 14:37:30.066+00	2021-06-18 14:37:30.066+00
306	21	admin.furos	f	f	f	f	2021-06-18 14:37:30.067+00	2021-06-18 14:37:30.067+00
307	21	admin.users	f	f	f	f	2021-06-18 14:37:30.068+00	2021-06-18 14:37:30.068+00
308	21	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:37:30.07+00	2021-06-18 14:37:30.07+00
309	21	admin.minas	f	f	f	f	2021-06-18 14:37:30.071+00	2021-06-18 14:37:30.071+00
310	21	admin.rdos	f	f	f	f	2021-06-18 14:37:30.072+00	2021-06-18 14:37:30.072+00
311	21	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:37:30.074+00	2021-06-18 14:37:30.074+00
312	21	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:37:30.076+00	2021-06-18 14:37:30.076+00
313	22	admin.areas	f	f	f	f	2021-06-18 14:37:41.686+00	2021-06-18 14:37:41.686+00
314	22	admin.atividades	f	f	f	f	2021-06-18 14:37:41.688+00	2021-06-18 14:37:41.688+00
315	22	admin.cargos	f	f	f	f	2021-06-18 14:37:41.689+00	2021-06-18 14:37:41.689+00
316	22	admin.complexos	f	f	f	f	2021-06-18 14:37:41.694+00	2021-06-18 14:37:41.694+00
317	22	admin.configuracoes	f	f	f	f	2021-06-18 14:37:41.695+00	2021-06-18 14:37:41.695+00
318	22	admin.contratos	f	f	f	f	2021-06-18 14:37:41.697+00	2021-06-18 14:37:41.697+00
319	22	admin.dashboard	f	f	f	f	2021-06-18 14:37:41.698+00	2021-06-18 14:37:41.698+00
320	22	admin.equipamentos	f	f	f	f	2021-06-18 14:37:41.7+00	2021-06-18 14:37:41.7+00
321	22	admin.estruturas	f	f	f	f	2021-06-18 14:37:41.701+00	2021-06-18 14:37:41.701+00
322	22	admin.furos	f	f	f	f	2021-06-18 14:37:41.703+00	2021-06-18 14:37:41.703+00
323	22	admin.users	f	f	f	f	2021-06-18 14:37:41.704+00	2021-06-18 14:37:41.704+00
324	22	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:37:41.706+00	2021-06-18 14:37:41.706+00
325	22	admin.minas	f	f	f	f	2021-06-18 14:37:41.707+00	2021-06-18 14:37:41.707+00
326	22	admin.rdos	f	f	f	f	2021-06-18 14:37:41.708+00	2021-06-18 14:37:41.708+00
327	22	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:37:41.71+00	2021-06-18 14:37:41.71+00
328	22	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:37:41.711+00	2021-06-18 14:37:41.711+00
329	23	admin.areas	f	f	f	f	2021-06-18 14:38:16.897+00	2021-06-18 14:38:16.897+00
330	23	admin.atividades	f	f	f	f	2021-06-18 14:38:16.898+00	2021-06-18 14:38:16.898+00
331	23	admin.cargos	f	f	f	f	2021-06-18 14:38:16.9+00	2021-06-18 14:38:16.9+00
332	23	admin.complexos	f	f	f	f	2021-06-18 14:38:16.908+00	2021-06-18 14:38:16.908+00
333	23	admin.configuracoes	f	f	f	f	2021-06-18 14:38:16.91+00	2021-06-18 14:38:16.91+00
334	23	admin.contratos	f	f	f	f	2021-06-18 14:38:16.911+00	2021-06-18 14:38:16.911+00
335	23	admin.dashboard	f	f	f	f	2021-06-18 14:38:16.913+00	2021-06-18 14:38:16.913+00
336	23	admin.equipamentos	f	f	f	f	2021-06-18 14:38:16.914+00	2021-06-18 14:38:16.914+00
337	23	admin.estruturas	f	f	f	f	2021-06-18 14:38:16.916+00	2021-06-18 14:38:16.916+00
338	23	admin.furos	f	f	f	f	2021-06-18 14:38:16.918+00	2021-06-18 14:38:16.918+00
339	23	admin.users	f	f	f	f	2021-06-18 14:38:16.92+00	2021-06-18 14:38:16.92+00
340	23	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:38:16.921+00	2021-06-18 14:38:16.921+00
341	23	admin.minas	f	f	f	f	2021-06-18 14:38:16.923+00	2021-06-18 14:38:16.923+00
342	23	admin.rdos	f	f	f	f	2021-06-18 14:38:16.924+00	2021-06-18 14:38:16.924+00
343	23	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:38:16.926+00	2021-06-18 14:38:16.926+00
344	23	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:38:16.927+00	2021-06-18 14:38:16.927+00
345	24	admin.areas	f	f	f	f	2021-06-18 14:38:41.158+00	2021-06-18 14:38:41.159+00
346	24	admin.atividades	f	f	f	f	2021-06-18 14:38:41.16+00	2021-06-18 14:38:41.16+00
347	24	admin.cargos	f	f	f	f	2021-06-18 14:38:41.163+00	2021-06-18 14:38:41.163+00
348	24	admin.complexos	f	f	f	f	2021-06-18 14:38:41.165+00	2021-06-18 14:38:41.165+00
349	24	admin.configuracoes	f	f	f	f	2021-06-18 14:38:41.166+00	2021-06-18 14:38:41.166+00
350	24	admin.contratos	f	f	f	f	2021-06-18 14:38:41.168+00	2021-06-18 14:38:41.168+00
351	24	admin.dashboard	f	f	f	f	2021-06-18 14:38:41.178+00	2021-06-18 14:38:41.178+00
352	24	admin.equipamentos	f	f	f	f	2021-06-18 14:38:41.179+00	2021-06-18 14:38:41.179+00
353	24	admin.estruturas	f	f	f	f	2021-06-18 14:38:41.181+00	2021-06-18 14:38:41.181+00
354	24	admin.furos	f	f	f	f	2021-06-18 14:38:41.183+00	2021-06-18 14:38:41.183+00
355	24	admin.users	f	f	f	f	2021-06-18 14:38:41.185+00	2021-06-18 14:38:41.185+00
356	24	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:38:41.186+00	2021-06-18 14:38:41.186+00
357	24	admin.minas	f	f	f	f	2021-06-18 14:38:41.188+00	2021-06-18 14:38:41.188+00
358	24	admin.rdos	f	f	f	f	2021-06-18 14:38:41.189+00	2021-06-18 14:38:41.189+00
359	24	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:38:41.19+00	2021-06-18 14:38:41.19+00
360	24	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:38:41.192+00	2021-06-18 14:38:41.192+00
361	25	admin.areas	f	f	f	f	2021-06-18 14:42:53.688+00	2021-06-18 14:42:53.688+00
362	25	admin.atividades	f	f	f	f	2021-06-18 14:42:53.689+00	2021-06-18 14:42:53.689+00
363	25	admin.cargos	f	f	f	f	2021-06-18 14:42:53.691+00	2021-06-18 14:42:53.691+00
364	25	admin.complexos	f	f	f	f	2021-06-18 14:42:53.693+00	2021-06-18 14:42:53.693+00
365	25	admin.configuracoes	f	f	f	f	2021-06-18 14:42:53.694+00	2021-06-18 14:42:53.694+00
366	25	admin.contratos	f	f	f	f	2021-06-18 14:42:53.695+00	2021-06-18 14:42:53.695+00
367	25	admin.dashboard	f	f	f	f	2021-06-18 14:42:53.697+00	2021-06-18 14:42:53.697+00
368	25	admin.equipamentos	f	f	f	f	2021-06-18 14:42:53.698+00	2021-06-18 14:42:53.698+00
369	25	admin.estruturas	f	f	f	f	2021-06-18 14:42:53.699+00	2021-06-18 14:42:53.699+00
370	25	admin.furos	f	f	f	f	2021-06-18 14:42:53.701+00	2021-06-18 14:42:53.701+00
371	25	admin.users	f	f	f	f	2021-06-18 14:42:53.702+00	2021-06-18 14:42:53.702+00
372	25	admin.configuracoes.logs	f	f	f	f	2021-06-18 14:42:53.703+00	2021-06-18 14:42:53.703+00
373	25	admin.minas	f	f	f	f	2021-06-18 14:42:53.705+00	2021-06-18 14:42:53.705+00
374	25	admin.rdos	f	f	f	f	2021-06-18 14:42:53.706+00	2021-06-18 14:42:53.706+00
375	25	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 14:42:53.708+00	2021-06-18 14:42:53.708+00
376	25	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 14:42:53.71+00	2021-06-18 14:42:53.71+00
377	26	admin.areas	f	f	f	f	2021-06-18 16:16:51.167+00	2021-06-18 16:16:51.167+00
378	26	admin.atividades	f	f	f	f	2021-06-18 16:16:51.169+00	2021-06-18 16:16:51.169+00
379	26	admin.cargos	f	f	f	f	2021-06-18 16:16:51.17+00	2021-06-18 16:16:51.17+00
380	26	admin.complexos	f	f	f	f	2021-06-18 16:16:51.172+00	2021-06-18 16:16:51.172+00
381	26	admin.configuracoes	f	f	f	f	2021-06-18 16:16:51.173+00	2021-06-18 16:16:51.173+00
382	26	admin.contratos	f	f	f	f	2021-06-18 16:16:51.174+00	2021-06-18 16:16:51.174+00
383	26	admin.dashboard	f	f	f	f	2021-06-18 16:16:51.176+00	2021-06-18 16:16:51.176+00
384	26	admin.equipamentos	f	f	f	f	2021-06-18 16:16:51.177+00	2021-06-18 16:16:51.177+00
385	26	admin.estruturas	f	f	f	f	2021-06-18 16:16:51.178+00	2021-06-18 16:16:51.178+00
386	26	admin.furos	f	f	f	f	2021-06-18 16:16:51.179+00	2021-06-18 16:16:51.179+00
387	26	admin.users	f	f	f	f	2021-06-18 16:16:51.181+00	2021-06-18 16:16:51.181+00
388	26	admin.configuracoes.logs	f	f	f	f	2021-06-18 16:16:51.182+00	2021-06-18 16:16:51.182+00
389	26	admin.minas	f	f	f	f	2021-06-18 16:16:51.183+00	2021-06-18 16:16:51.183+00
390	26	admin.rdos	f	f	f	f	2021-06-18 16:16:51.185+00	2021-06-18 16:16:51.185+00
391	26	admin.reports.atividades_usuarios	f	f	f	f	2021-06-18 16:16:51.187+00	2021-06-18 16:16:51.187+00
392	26	admin.reports.producao_usuarios	f	f	f	f	2021-06-18 16:16:51.188+00	2021-06-18 16:16:51.188+00
393	27	admin.areas	f	f	f	f	2021-06-20 17:53:56.001+00	2021-06-20 17:53:56.001+00
394	27	admin.atividades	f	f	f	f	2021-06-20 17:53:56.003+00	2021-06-20 17:53:56.003+00
395	27	admin.cargos	f	f	f	f	2021-06-20 17:53:56.005+00	2021-06-20 17:53:56.005+00
396	27	admin.complexos	f	f	f	f	2021-06-20 17:53:56.006+00	2021-06-20 17:53:56.006+00
397	27	admin.configuracoes	f	f	f	f	2021-06-20 17:53:56.009+00	2021-06-20 17:53:56.009+00
398	27	admin.contratos	f	f	f	f	2021-06-20 17:53:56.01+00	2021-06-20 17:53:56.01+00
399	27	admin.dashboard	f	f	f	f	2021-06-20 17:53:56.012+00	2021-06-20 17:53:56.012+00
400	27	admin.equipamentos	f	f	f	f	2021-06-20 17:53:56.014+00	2021-06-20 17:53:56.014+00
401	27	admin.estruturas	f	f	f	f	2021-06-20 17:53:56.015+00	2021-06-20 17:53:56.015+00
402	27	admin.furos	f	f	f	f	2021-06-20 17:53:56.017+00	2021-06-20 17:53:56.017+00
403	27	admin.users	f	f	f	f	2021-06-20 17:53:56.018+00	2021-06-20 17:53:56.018+00
404	27	admin.configuracoes.logs	f	f	f	f	2021-06-20 17:53:56.02+00	2021-06-20 17:53:56.02+00
405	27	admin.minas	f	f	f	f	2021-06-20 17:53:56.022+00	2021-06-20 17:53:56.022+00
406	27	admin.rdos	f	f	f	f	2021-06-20 17:53:56.023+00	2021-06-20 17:53:56.023+00
407	27	admin.reports.atividades_usuarios	f	f	f	f	2021-06-20 17:53:56.025+00	2021-06-20 17:53:56.025+00
408	27	admin.reports.producao_usuarios	f	f	f	f	2021-06-20 17:53:56.026+00	2021-06-20 17:53:56.026+00
409	28	admin.areas	t	t	t	t	2021-06-21 22:02:53.352+00	2021-06-21 22:02:53.352+00
410	28	admin.atividades	t	t	t	t	2021-06-21 22:02:53.354+00	2021-06-21 22:02:53.354+00
411	28	admin.cargos	t	t	t	t	2021-06-21 22:02:53.357+00	2021-06-21 22:02:53.357+00
412	28	admin.complexos	t	t	t	t	2021-06-21 22:02:53.358+00	2021-06-21 22:02:53.358+00
413	28	admin.configuracoes	t	t	t	t	2021-06-21 22:02:53.36+00	2021-06-21 22:02:53.36+00
414	28	admin.contratos	t	t	t	t	2021-06-21 22:02:53.361+00	2021-06-21 22:02:53.361+00
415	28	admin.dashboard	t	t	t	t	2021-06-21 22:02:53.363+00	2021-06-21 22:02:53.363+00
416	28	admin.equipamentos	t	t	t	t	2021-06-21 22:02:53.365+00	2021-06-21 22:02:53.365+00
417	28	admin.estruturas	t	t	t	t	2021-06-21 22:02:53.366+00	2021-06-21 22:02:53.366+00
418	28	admin.furos	t	t	t	t	2021-06-21 22:02:53.367+00	2021-06-21 22:02:53.367+00
419	28	admin.users	t	t	t	t	2021-06-21 22:02:53.373+00	2021-06-21 22:02:53.373+00
420	28	admin.configuracoes.logs	t	t	t	t	2021-06-21 22:02:53.374+00	2021-06-21 22:02:53.374+00
421	28	admin.minas	t	t	t	t	2021-06-21 22:02:53.375+00	2021-06-21 22:02:53.375+00
422	28	admin.rdos	t	t	t	t	2021-06-21 22:02:53.377+00	2021-06-21 22:02:53.377+00
423	28	admin.reports.atividades_usuarios	t	t	t	t	2021-06-21 22:02:53.378+00	2021-06-21 22:02:53.378+00
424	28	admin.reports.producao_usuarios	t	t	t	t	2021-06-21 22:02:53.379+00	2021-06-21 22:02:53.379+00
425	29	admin.areas	f	f	f	f	2021-06-21 22:08:50.905+00	2021-06-21 22:08:50.905+00
426	29	admin.atividades	f	f	f	f	2021-06-21 22:08:50.906+00	2021-06-21 22:08:50.906+00
427	29	admin.cargos	f	f	f	f	2021-06-21 22:08:50.908+00	2021-06-21 22:08:50.908+00
428	29	admin.complexos	f	f	f	f	2021-06-21 22:08:50.909+00	2021-06-21 22:08:50.909+00
429	29	admin.configuracoes	f	f	f	f	2021-06-21 22:08:50.91+00	2021-06-21 22:08:50.91+00
430	29	admin.contratos	f	f	f	f	2021-06-21 22:08:50.912+00	2021-06-21 22:08:50.912+00
431	29	admin.dashboard	f	f	f	f	2021-06-21 22:08:50.913+00	2021-06-21 22:08:50.913+00
432	29	admin.equipamentos	f	f	f	f	2021-06-21 22:08:50.914+00	2021-06-21 22:08:50.914+00
433	29	admin.estruturas	f	f	f	f	2021-06-21 22:08:50.916+00	2021-06-21 22:08:50.916+00
434	29	admin.furos	f	f	f	f	2021-06-21 22:08:50.917+00	2021-06-21 22:08:50.917+00
435	29	admin.users	f	f	f	f	2021-06-21 22:08:50.918+00	2021-06-21 22:08:50.918+00
436	29	admin.configuracoes.logs	f	f	f	f	2021-06-21 22:08:50.92+00	2021-06-21 22:08:50.92+00
437	29	admin.minas	f	f	f	f	2021-06-21 22:08:50.921+00	2021-06-21 22:08:50.921+00
438	29	admin.rdos	f	f	f	f	2021-06-21 22:08:50.922+00	2021-06-21 22:08:50.922+00
439	29	admin.reports.atividades_usuarios	f	f	f	f	2021-06-21 22:08:50.924+00	2021-06-21 22:08:50.924+00
440	29	admin.reports.producao_usuarios	f	f	f	f	2021-06-21 22:08:50.925+00	2021-06-21 22:08:50.925+00
441	30	admin.areas	f	f	f	f	2021-06-21 22:09:11.561+00	2021-06-21 22:09:11.561+00
442	30	admin.atividades	f	f	f	f	2021-06-21 22:09:11.563+00	2021-06-21 22:09:11.563+00
443	30	admin.cargos	f	f	f	f	2021-06-21 22:09:11.564+00	2021-06-21 22:09:11.564+00
444	30	admin.complexos	f	f	f	f	2021-06-21 22:09:11.566+00	2021-06-21 22:09:11.566+00
445	30	admin.configuracoes	f	f	f	f	2021-06-21 22:09:11.568+00	2021-06-21 22:09:11.568+00
446	30	admin.contratos	f	f	f	f	2021-06-21 22:09:11.569+00	2021-06-21 22:09:11.569+00
447	30	admin.dashboard	f	f	f	f	2021-06-21 22:09:11.57+00	2021-06-21 22:09:11.57+00
448	30	admin.equipamentos	f	f	f	f	2021-06-21 22:09:11.572+00	2021-06-21 22:09:11.572+00
449	30	admin.estruturas	f	f	f	f	2021-06-21 22:09:11.573+00	2021-06-21 22:09:11.573+00
450	30	admin.furos	f	f	f	f	2021-06-21 22:09:11.574+00	2021-06-21 22:09:11.574+00
451	30	admin.users	f	f	f	f	2021-06-21 22:09:11.576+00	2021-06-21 22:09:11.576+00
452	30	admin.configuracoes.logs	f	f	f	f	2021-06-21 22:09:11.577+00	2021-06-21 22:09:11.577+00
453	30	admin.minas	f	f	f	f	2021-06-21 22:09:11.578+00	2021-06-21 22:09:11.578+00
454	30	admin.rdos	f	f	f	f	2021-06-21 22:09:11.58+00	2021-06-21 22:09:11.58+00
455	30	admin.reports.atividades_usuarios	f	f	f	f	2021-06-21 22:09:11.581+00	2021-06-21 22:09:11.581+00
456	30	admin.reports.producao_usuarios	f	f	f	f	2021-06-21 22:09:11.582+00	2021-06-21 22:09:11.582+00
457	31	admin.areas	f	f	f	f	2021-06-21 22:09:29.722+00	2021-06-21 22:09:29.722+00
458	31	admin.atividades	f	f	f	f	2021-06-21 22:09:29.73+00	2021-06-21 22:09:29.73+00
459	31	admin.cargos	f	f	f	f	2021-06-21 22:09:29.731+00	2021-06-21 22:09:29.731+00
460	31	admin.complexos	f	f	f	f	2021-06-21 22:09:29.733+00	2021-06-21 22:09:29.733+00
461	31	admin.configuracoes	f	f	f	f	2021-06-21 22:09:29.735+00	2021-06-21 22:09:29.735+00
462	31	admin.contratos	f	f	f	f	2021-06-21 22:09:29.736+00	2021-06-21 22:09:29.736+00
463	31	admin.dashboard	f	f	f	f	2021-06-21 22:09:29.738+00	2021-06-21 22:09:29.738+00
464	31	admin.equipamentos	f	f	f	f	2021-06-21 22:09:29.739+00	2021-06-21 22:09:29.739+00
465	31	admin.estruturas	f	f	f	f	2021-06-21 22:09:29.742+00	2021-06-21 22:09:29.742+00
466	31	admin.furos	f	f	f	f	2021-06-21 22:09:29.743+00	2021-06-21 22:09:29.743+00
467	31	admin.users	f	f	f	f	2021-06-21 22:09:29.744+00	2021-06-21 22:09:29.744+00
468	31	admin.configuracoes.logs	f	f	f	f	2021-06-21 22:09:29.746+00	2021-06-21 22:09:29.746+00
469	31	admin.minas	f	f	f	f	2021-06-21 22:09:29.748+00	2021-06-21 22:09:29.748+00
470	31	admin.rdos	f	f	f	f	2021-06-21 22:09:29.75+00	2021-06-21 22:09:29.75+00
471	31	admin.reports.atividades_usuarios	f	f	f	f	2021-06-21 22:09:29.751+00	2021-06-21 22:09:29.751+00
472	31	admin.reports.producao_usuarios	f	f	f	f	2021-06-21 22:09:29.752+00	2021-06-21 22:09:29.752+00
473	32	admin.areas	f	f	f	f	2021-06-21 22:09:46.064+00	2021-06-21 22:09:46.064+00
474	32	admin.atividades	f	f	f	f	2021-06-21 22:09:46.065+00	2021-06-21 22:09:46.065+00
475	32	admin.cargos	f	f	f	f	2021-06-21 22:09:46.066+00	2021-06-21 22:09:46.066+00
476	32	admin.complexos	f	f	f	f	2021-06-21 22:09:46.068+00	2021-06-21 22:09:46.068+00
477	32	admin.configuracoes	f	f	f	f	2021-06-21 22:09:46.069+00	2021-06-21 22:09:46.069+00
478	32	admin.contratos	f	f	f	f	2021-06-21 22:09:46.07+00	2021-06-21 22:09:46.07+00
479	32	admin.dashboard	f	f	f	f	2021-06-21 22:09:46.072+00	2021-06-21 22:09:46.072+00
480	32	admin.equipamentos	f	f	f	f	2021-06-21 22:09:46.073+00	2021-06-21 22:09:46.073+00
481	32	admin.estruturas	f	f	f	f	2021-06-21 22:09:46.074+00	2021-06-21 22:09:46.074+00
482	32	admin.furos	f	f	f	f	2021-06-21 22:09:46.076+00	2021-06-21 22:09:46.076+00
483	32	admin.users	f	f	f	f	2021-06-21 22:09:46.077+00	2021-06-21 22:09:46.077+00
484	32	admin.configuracoes.logs	f	f	f	f	2021-06-21 22:09:46.079+00	2021-06-21 22:09:46.079+00
485	32	admin.minas	f	f	f	f	2021-06-21 22:09:46.08+00	2021-06-21 22:09:46.08+00
486	32	admin.rdos	f	f	f	f	2021-06-21 22:09:46.082+00	2021-06-21 22:09:46.082+00
487	32	admin.reports.atividades_usuarios	f	f	f	f	2021-06-21 22:09:46.083+00	2021-06-21 22:09:46.083+00
488	32	admin.reports.producao_usuarios	f	f	f	f	2021-06-21 22:09:46.084+00	2021-06-21 22:09:46.084+00
489	33	admin.areas	f	f	f	f	2021-06-21 22:10:01.356+00	2021-06-21 22:10:01.356+00
490	33	admin.atividades	f	f	f	f	2021-06-21 22:10:01.358+00	2021-06-21 22:10:01.358+00
491	33	admin.cargos	f	f	f	f	2021-06-21 22:10:01.359+00	2021-06-21 22:10:01.359+00
492	33	admin.complexos	f	f	f	f	2021-06-21 22:10:01.36+00	2021-06-21 22:10:01.36+00
493	33	admin.configuracoes	f	f	f	f	2021-06-21 22:10:01.362+00	2021-06-21 22:10:01.362+00
494	33	admin.contratos	f	f	f	f	2021-06-21 22:10:01.364+00	2021-06-21 22:10:01.364+00
495	33	admin.dashboard	f	f	f	f	2021-06-21 22:10:01.365+00	2021-06-21 22:10:01.365+00
496	33	admin.equipamentos	f	f	f	f	2021-06-21 22:10:01.366+00	2021-06-21 22:10:01.366+00
497	33	admin.estruturas	f	f	f	f	2021-06-21 22:10:01.368+00	2021-06-21 22:10:01.368+00
498	33	admin.furos	f	f	f	f	2021-06-21 22:10:01.369+00	2021-06-21 22:10:01.369+00
499	33	admin.users	f	f	f	f	2021-06-21 22:10:01.37+00	2021-06-21 22:10:01.37+00
500	33	admin.configuracoes.logs	f	f	f	f	2021-06-21 22:10:01.371+00	2021-06-21 22:10:01.371+00
501	33	admin.minas	f	f	f	f	2021-06-21 22:10:01.373+00	2021-06-21 22:10:01.373+00
502	33	admin.rdos	f	f	f	f	2021-06-21 22:10:01.374+00	2021-06-21 22:10:01.374+00
503	33	admin.reports.atividades_usuarios	f	f	f	f	2021-06-21 22:10:01.375+00	2021-06-21 22:10:01.375+00
504	33	admin.reports.producao_usuarios	f	f	f	f	2021-06-21 22:10:01.377+00	2021-06-21 22:10:01.377+00
505	34	admin.areas	t	t	t	t	2021-06-22 01:52:19.573+00	2021-06-22 01:52:19.573+00
506	34	admin.atividades	t	t	t	t	2021-06-22 01:52:19.575+00	2021-06-22 01:52:19.575+00
507	34	admin.cargos	t	t	t	t	2021-06-22 01:52:19.577+00	2021-06-22 01:52:19.577+00
508	34	admin.complexos	t	t	t	t	2021-06-22 01:52:19.579+00	2021-06-22 01:52:19.579+00
509	34	admin.configuracoes	t	t	t	t	2021-06-22 01:52:19.58+00	2021-06-22 01:52:19.58+00
510	34	admin.contratos	t	t	t	t	2021-06-22 01:52:19.581+00	2021-06-22 01:52:19.581+00
511	34	admin.dashboard	t	t	t	t	2021-06-22 01:52:19.583+00	2021-06-22 01:52:19.583+00
512	34	admin.equipamentos	t	t	t	t	2021-06-22 01:52:19.586+00	2021-06-22 01:52:19.586+00
513	34	admin.estruturas	t	t	t	t	2021-06-22 01:52:19.587+00	2021-06-22 01:52:19.587+00
514	34	admin.furos	t	t	t	t	2021-06-22 01:52:19.589+00	2021-06-22 01:52:19.589+00
515	34	admin.users	t	t	t	t	2021-06-22 01:52:19.591+00	2021-06-22 01:52:19.591+00
516	34	admin.configuracoes.logs	t	t	t	t	2021-06-22 01:52:19.593+00	2021-06-22 01:52:19.593+00
517	34	admin.minas	t	t	t	t	2021-06-22 01:52:19.594+00	2021-06-22 01:52:19.594+00
518	34	admin.rdos	t	t	t	t	2021-06-22 01:52:19.596+00	2021-06-22 01:52:19.596+00
519	34	admin.reports.atividades_usuarios	t	t	t	t	2021-06-22 01:52:19.597+00	2021-06-22 01:52:19.597+00
520	34	admin.reports.producao_usuarios	t	t	t	t	2021-06-22 01:52:19.599+00	2021-06-22 01:52:19.599+00
521	35	admin.areas	f	f	f	f	2021-06-22 13:30:36.806+00	2021-06-22 13:30:36.806+00
522	35	admin.atividades	f	f	f	f	2021-06-22 13:30:36.808+00	2021-06-22 13:30:36.808+00
523	35	admin.cargos	f	f	f	f	2021-06-22 13:30:36.809+00	2021-06-22 13:30:36.809+00
524	35	admin.complexos	f	f	f	f	2021-06-22 13:30:36.81+00	2021-06-22 13:30:36.81+00
525	35	admin.configuracoes	f	f	f	f	2021-06-22 13:30:36.812+00	2021-06-22 13:30:36.812+00
526	35	admin.contratos	f	f	f	f	2021-06-22 13:30:36.814+00	2021-06-22 13:30:36.814+00
527	35	admin.dashboard	f	f	f	f	2021-06-22 13:30:36.815+00	2021-06-22 13:30:36.815+00
528	35	admin.equipamentos	f	f	f	f	2021-06-22 13:30:36.817+00	2021-06-22 13:30:36.817+00
529	35	admin.estruturas	f	f	f	f	2021-06-22 13:30:36.818+00	2021-06-22 13:30:36.818+00
530	35	admin.furos	f	f	f	f	2021-06-22 13:30:36.819+00	2021-06-22 13:30:36.819+00
531	35	admin.users	f	f	f	f	2021-06-22 13:30:36.826+00	2021-06-22 13:30:36.826+00
532	35	admin.configuracoes.logs	f	f	f	f	2021-06-22 13:30:36.831+00	2021-06-22 13:30:36.831+00
533	35	admin.minas	f	f	f	f	2021-06-22 13:30:36.832+00	2021-06-22 13:30:36.832+00
534	35	admin.rdos	f	f	f	f	2021-06-22 13:30:36.834+00	2021-06-22 13:30:36.834+00
535	35	admin.reports.atividades_usuarios	f	f	f	f	2021-06-22 13:30:36.839+00	2021-06-22 13:30:36.839+00
536	35	admin.reports.producao_usuarios	f	f	f	f	2021-06-22 13:30:36.84+00	2021-06-22 13:30:36.84+00
553	37	admin.areas	f	f	f	f	2021-07-01 19:53:02.386+00	2021-07-01 19:53:02.386+00
554	37	admin.atividades	f	f	f	f	2021-07-01 19:53:02.387+00	2021-07-01 19:53:02.387+00
555	37	admin.cargos	f	f	f	f	2021-07-01 19:53:02.39+00	2021-07-01 19:53:02.39+00
556	37	admin.complexos	f	f	f	f	2021-07-01 19:53:02.391+00	2021-07-01 19:53:02.391+00
557	37	admin.configuracoes	f	f	f	f	2021-07-01 19:53:02.392+00	2021-07-01 19:53:02.392+00
558	37	admin.contratos	f	f	f	f	2021-07-01 19:53:02.394+00	2021-07-01 19:53:02.394+00
559	37	admin.dashboard	f	f	f	f	2021-07-01 19:53:02.395+00	2021-07-01 19:53:02.395+00
560	37	admin.equipamentos	f	f	f	f	2021-07-01 19:53:02.396+00	2021-07-01 19:53:02.396+00
561	37	admin.estruturas	f	f	f	f	2021-07-01 19:53:02.398+00	2021-07-01 19:53:02.398+00
562	37	admin.furos	f	f	f	f	2021-07-01 19:53:02.399+00	2021-07-01 19:53:02.399+00
563	37	admin.users	f	f	f	f	2021-07-01 19:53:02.4+00	2021-07-01 19:53:02.4+00
564	37	admin.configuracoes.logs	f	f	f	f	2021-07-01 19:53:02.401+00	2021-07-01 19:53:02.401+00
565	37	admin.minas	f	f	f	f	2021-07-01 19:53:02.403+00	2021-07-01 19:53:02.403+00
566	37	admin.rdos	f	f	f	f	2021-07-01 19:53:02.404+00	2021-07-01 19:53:02.404+00
567	37	admin.reports.atividades_usuarios	f	f	f	f	2021-07-01 19:53:02.405+00	2021-07-01 19:53:02.405+00
568	37	admin.reports.producao_usuarios	f	f	f	f	2021-07-01 19:53:02.407+00	2021-07-01 19:53:02.407+00
569	38	admin.areas	t	t	t	t	2021-07-01 23:39:04.887+00	2021-07-01 23:39:04.887+00
570	38	admin.atividades	t	t	t	t	2021-07-01 23:39:04.89+00	2021-07-01 23:39:04.89+00
571	38	admin.cargos	t	t	t	t	2021-07-01 23:39:04.891+00	2021-07-01 23:39:04.891+00
572	38	admin.complexos	t	t	t	t	2021-07-01 23:39:04.893+00	2021-07-01 23:39:04.893+00
573	38	admin.configuracoes	t	t	t	t	2021-07-01 23:39:04.895+00	2021-07-01 23:39:04.895+00
574	38	admin.contratos	t	t	t	t	2021-07-01 23:39:04.896+00	2021-07-01 23:39:04.896+00
575	38	admin.dashboard	t	t	t	t	2021-07-01 23:39:04.898+00	2021-07-01 23:39:04.898+00
576	38	admin.equipamentos	t	t	t	t	2021-07-01 23:39:04.899+00	2021-07-01 23:39:04.899+00
577	38	admin.estruturas	t	t	t	t	2021-07-01 23:39:04.9+00	2021-07-01 23:39:04.9+00
578	38	admin.furos	t	t	t	t	2021-07-01 23:39:04.909+00	2021-07-01 23:39:04.909+00
579	38	admin.users	t	t	t	t	2021-07-01 23:39:04.911+00	2021-07-01 23:39:04.911+00
580	38	admin.configuracoes.logs	t	t	t	t	2021-07-01 23:39:04.913+00	2021-07-01 23:39:04.913+00
581	38	admin.minas	t	t	t	t	2021-07-01 23:39:04.914+00	2021-07-01 23:39:04.914+00
582	38	admin.rdos	t	t	t	t	2021-07-01 23:39:04.916+00	2021-07-01 23:39:04.916+00
583	38	admin.reports.atividades_usuarios	t	t	t	t	2021-07-01 23:39:04.917+00	2021-07-01 23:39:04.917+00
584	38	admin.reports.producao_usuarios	t	t	t	t	2021-07-01 23:39:04.919+00	2021-07-01 23:39:04.919+00
585	39	admin.areas	t	t	t	t	2021-07-11 17:16:50.287+00	2021-07-11 17:16:50.287+00
586	39	admin.atividades	t	t	t	t	2021-07-11 17:16:50.288+00	2021-07-11 17:16:50.288+00
587	39	admin.cargos	t	t	t	t	2021-07-11 17:16:50.291+00	2021-07-11 17:16:50.291+00
588	39	admin.complexos	t	t	t	t	2021-07-11 17:16:50.292+00	2021-07-11 17:16:50.292+00
589	39	admin.configuracoes	t	t	t	t	2021-07-11 17:16:50.293+00	2021-07-11 17:16:50.293+00
590	39	admin.contratos	t	t	t	t	2021-07-11 17:16:50.294+00	2021-07-11 17:16:50.294+00
591	39	admin.dashboard	t	t	t	t	2021-07-11 17:16:50.296+00	2021-07-11 17:16:50.296+00
592	39	admin.equipamentos	t	t	t	t	2021-07-11 17:16:50.298+00	2021-07-11 17:16:50.298+00
593	39	admin.estruturas	t	t	t	t	2021-07-11 17:16:50.299+00	2021-07-11 17:16:50.299+00
594	39	admin.furos	t	t	t	t	2021-07-11 17:16:50.3+00	2021-07-11 17:16:50.3+00
595	39	admin.users	t	t	t	t	2021-07-11 17:16:50.301+00	2021-07-11 17:16:50.301+00
596	39	admin.configuracoes.logs	t	t	t	t	2021-07-11 17:16:50.303+00	2021-07-11 17:16:50.303+00
597	39	admin.minas	t	t	t	t	2021-07-11 17:16:50.304+00	2021-07-11 17:16:50.304+00
598	39	admin.rdos	t	t	t	t	2021-07-11 17:16:50.305+00	2021-07-11 17:16:50.305+00
599	39	admin.reports.atividades_usuarios	t	t	t	t	2021-07-11 17:16:50.306+00	2021-07-11 17:16:50.306+00
600	39	admin.reports.producao_usuarios	t	t	t	t	2021-07-11 17:16:50.308+00	2021-07-11 17:16:50.308+00
601	40	admin.areas	f	f	f	f	2021-07-11 17:16:58.745+00	2021-07-11 17:16:58.745+00
602	40	admin.atividades	f	f	f	f	2021-07-11 17:16:58.747+00	2021-07-11 17:16:58.747+00
603	40	admin.cargos	f	f	f	f	2021-07-11 17:16:58.748+00	2021-07-11 17:16:58.748+00
604	40	admin.complexos	f	f	f	f	2021-07-11 17:16:58.749+00	2021-07-11 17:16:58.749+00
605	40	admin.configuracoes	f	f	f	f	2021-07-11 17:16:58.751+00	2021-07-11 17:16:58.751+00
606	40	admin.contratos	f	f	f	f	2021-07-11 17:16:58.752+00	2021-07-11 17:16:58.752+00
607	40	admin.dashboard	f	f	f	f	2021-07-11 17:16:58.753+00	2021-07-11 17:16:58.753+00
608	40	admin.equipamentos	f	f	f	f	2021-07-11 17:16:58.754+00	2021-07-11 17:16:58.754+00
609	40	admin.estruturas	f	f	f	f	2021-07-11 17:16:58.756+00	2021-07-11 17:16:58.756+00
610	40	admin.furos	f	f	f	f	2021-07-11 17:16:58.757+00	2021-07-11 17:16:58.757+00
611	40	admin.users	f	f	f	f	2021-07-11 17:16:58.758+00	2021-07-11 17:16:58.758+00
612	40	admin.configuracoes.logs	f	f	f	f	2021-07-11 17:16:58.76+00	2021-07-11 17:16:58.76+00
613	40	admin.minas	f	f	f	f	2021-07-11 17:16:58.761+00	2021-07-11 17:16:58.761+00
614	40	admin.rdos	f	f	f	f	2021-07-11 17:16:58.763+00	2021-07-11 17:16:58.763+00
615	40	admin.reports.atividades_usuarios	f	f	f	f	2021-07-11 17:16:58.764+00	2021-07-11 17:16:58.764+00
616	40	admin.reports.producao_usuarios	f	f	f	f	2021-07-11 17:16:58.766+00	2021-07-11 17:16:58.766+00
617	41	admin.areas	f	f	f	f	2021-07-11 17:17:08.528+00	2021-07-11 17:17:08.528+00
618	41	admin.atividades	f	f	f	f	2021-07-11 17:17:08.53+00	2021-07-11 17:17:08.53+00
619	41	admin.cargos	f	f	f	f	2021-07-11 17:17:08.532+00	2021-07-11 17:17:08.532+00
620	41	admin.complexos	f	f	f	f	2021-07-11 17:17:08.533+00	2021-07-11 17:17:08.533+00
621	41	admin.configuracoes	f	f	f	f	2021-07-11 17:17:08.535+00	2021-07-11 17:17:08.535+00
622	41	admin.contratos	f	f	f	f	2021-07-11 17:17:08.536+00	2021-07-11 17:17:08.536+00
623	41	admin.dashboard	f	f	f	f	2021-07-11 17:17:08.537+00	2021-07-11 17:17:08.537+00
624	41	admin.equipamentos	f	f	f	f	2021-07-11 17:17:08.547+00	2021-07-11 17:17:08.547+00
625	41	admin.estruturas	f	f	f	f	2021-07-11 17:17:08.548+00	2021-07-11 17:17:08.548+00
626	41	admin.furos	f	f	f	f	2021-07-11 17:17:08.549+00	2021-07-11 17:17:08.549+00
627	41	admin.users	f	f	f	f	2021-07-11 17:17:08.552+00	2021-07-11 17:17:08.552+00
628	41	admin.configuracoes.logs	f	f	f	f	2021-07-11 17:17:08.553+00	2021-07-11 17:17:08.553+00
629	41	admin.minas	f	f	f	f	2021-07-11 17:17:08.555+00	2021-07-11 17:17:08.555+00
630	41	admin.rdos	f	f	f	f	2021-07-11 17:17:08.556+00	2021-07-11 17:17:08.556+00
631	41	admin.reports.atividades_usuarios	f	f	f	f	2021-07-11 17:17:08.557+00	2021-07-11 17:17:08.557+00
632	41	admin.reports.producao_usuarios	f	f	f	f	2021-07-11 17:17:08.558+00	2021-07-11 17:17:08.558+00
633	42	admin.areas	f	f	f	f	2021-07-11 17:17:19.434+00	2021-07-11 17:17:19.434+00
634	42	admin.atividades	f	f	f	f	2021-07-11 17:17:19.435+00	2021-07-11 17:17:19.435+00
635	42	admin.cargos	f	f	f	f	2021-07-11 17:17:19.437+00	2021-07-11 17:17:19.437+00
636	42	admin.complexos	f	f	f	f	2021-07-11 17:17:19.438+00	2021-07-11 17:17:19.438+00
637	42	admin.configuracoes	f	f	f	f	2021-07-11 17:17:19.439+00	2021-07-11 17:17:19.439+00
638	42	admin.contratos	f	f	f	f	2021-07-11 17:17:19.441+00	2021-07-11 17:17:19.441+00
639	42	admin.dashboard	f	f	f	f	2021-07-11 17:17:19.442+00	2021-07-11 17:17:19.442+00
640	42	admin.equipamentos	f	f	f	f	2021-07-11 17:17:19.444+00	2021-07-11 17:17:19.444+00
641	42	admin.estruturas	f	f	f	f	2021-07-11 17:17:19.445+00	2021-07-11 17:17:19.445+00
642	42	admin.furos	f	f	f	f	2021-07-11 17:17:19.446+00	2021-07-11 17:17:19.446+00
643	42	admin.users	f	f	f	f	2021-07-11 17:17:19.447+00	2021-07-11 17:17:19.447+00
644	42	admin.configuracoes.logs	f	f	f	f	2021-07-11 17:17:19.449+00	2021-07-11 17:17:19.449+00
645	42	admin.minas	f	f	f	f	2021-07-11 17:17:19.45+00	2021-07-11 17:17:19.45+00
646	42	admin.rdos	f	f	f	f	2021-07-11 17:17:19.451+00	2021-07-11 17:17:19.451+00
647	42	admin.reports.atividades_usuarios	f	f	f	f	2021-07-11 17:17:19.453+00	2021-07-11 17:17:19.453+00
648	42	admin.reports.producao_usuarios	f	f	f	f	2021-07-11 17:17:19.462+00	2021-07-11 17:17:19.462+00
649	43	admin.areas	f	f	f	f	2021-07-11 17:17:27.131+00	2021-07-11 17:17:27.131+00
650	43	admin.atividades	f	f	f	f	2021-07-11 17:17:27.132+00	2021-07-11 17:17:27.132+00
651	43	admin.cargos	f	f	f	f	2021-07-11 17:17:27.134+00	2021-07-11 17:17:27.134+00
652	43	admin.complexos	f	f	f	f	2021-07-11 17:17:27.135+00	2021-07-11 17:17:27.135+00
653	43	admin.configuracoes	f	f	f	f	2021-07-11 17:17:27.136+00	2021-07-11 17:17:27.136+00
654	43	admin.contratos	f	f	f	f	2021-07-11 17:17:27.137+00	2021-07-11 17:17:27.137+00
655	43	admin.dashboard	f	f	f	f	2021-07-11 17:17:27.139+00	2021-07-11 17:17:27.139+00
656	43	admin.equipamentos	f	f	f	f	2021-07-11 17:17:27.14+00	2021-07-11 17:17:27.14+00
657	43	admin.estruturas	f	f	f	f	2021-07-11 17:17:27.141+00	2021-07-11 17:17:27.141+00
658	43	admin.furos	f	f	f	f	2021-07-11 17:17:27.142+00	2021-07-11 17:17:27.142+00
659	43	admin.users	f	f	f	f	2021-07-11 17:17:27.144+00	2021-07-11 17:17:27.144+00
660	43	admin.configuracoes.logs	f	f	f	f	2021-07-11 17:17:27.145+00	2021-07-11 17:17:27.145+00
661	43	admin.minas	f	f	f	f	2021-07-11 17:17:27.147+00	2021-07-11 17:17:27.147+00
662	43	admin.rdos	f	f	f	f	2021-07-11 17:17:27.148+00	2021-07-11 17:17:27.148+00
663	43	admin.reports.atividades_usuarios	f	f	f	f	2021-07-11 17:17:27.156+00	2021-07-11 17:17:27.156+00
664	43	admin.reports.producao_usuarios	f	f	f	f	2021-07-11 17:17:27.157+00	2021-07-11 17:17:27.157+00
665	44	admin.areas	f	f	f	f	2021-07-11 17:17:43.15+00	2021-07-11 17:17:43.15+00
666	44	admin.atividades	f	f	f	f	2021-07-11 17:17:43.151+00	2021-07-11 17:17:43.151+00
667	44	admin.cargos	f	f	f	f	2021-07-11 17:17:43.152+00	2021-07-11 17:17:43.152+00
668	44	admin.complexos	f	f	f	f	2021-07-11 17:17:43.154+00	2021-07-11 17:17:43.154+00
669	44	admin.configuracoes	f	f	f	f	2021-07-11 17:17:43.155+00	2021-07-11 17:17:43.155+00
670	44	admin.contratos	f	f	f	f	2021-07-11 17:17:43.156+00	2021-07-11 17:17:43.156+00
671	44	admin.dashboard	f	f	f	f	2021-07-11 17:17:43.157+00	2021-07-11 17:17:43.157+00
672	44	admin.equipamentos	f	f	f	f	2021-07-11 17:17:43.159+00	2021-07-11 17:17:43.159+00
673	44	admin.estruturas	f	f	f	f	2021-07-11 17:17:43.16+00	2021-07-11 17:17:43.16+00
674	44	admin.furos	f	f	f	f	2021-07-11 17:17:43.161+00	2021-07-11 17:17:43.161+00
675	44	admin.users	f	f	f	f	2021-07-11 17:17:43.163+00	2021-07-11 17:17:43.163+00
676	44	admin.configuracoes.logs	f	f	f	f	2021-07-11 17:17:43.164+00	2021-07-11 17:17:43.164+00
677	44	admin.minas	f	f	f	f	2021-07-11 17:17:43.165+00	2021-07-11 17:17:43.165+00
678	44	admin.rdos	f	f	f	f	2021-07-11 17:17:43.167+00	2021-07-11 17:17:43.167+00
679	44	admin.reports.atividades_usuarios	f	f	f	f	2021-07-11 17:17:43.168+00	2021-07-11 17:17:43.168+00
680	44	admin.reports.producao_usuarios	f	f	f	f	2021-07-11 17:17:43.169+00	2021-07-11 17:17:43.169+00
681	45	admin.areas	f	f	f	f	2021-07-11 17:17:58.548+00	2021-07-11 17:17:58.548+00
682	45	admin.atividades	f	f	f	f	2021-07-11 17:17:58.549+00	2021-07-11 17:17:58.549+00
683	45	admin.cargos	f	f	f	f	2021-07-11 17:17:58.551+00	2021-07-11 17:17:58.551+00
684	45	admin.complexos	f	f	f	f	2021-07-11 17:17:58.553+00	2021-07-11 17:17:58.553+00
685	45	admin.configuracoes	f	f	f	f	2021-07-11 17:17:58.554+00	2021-07-11 17:17:58.554+00
686	45	admin.contratos	f	f	f	f	2021-07-11 17:17:58.555+00	2021-07-11 17:17:58.555+00
687	45	admin.dashboard	f	f	f	f	2021-07-11 17:17:58.556+00	2021-07-11 17:17:58.556+00
688	45	admin.equipamentos	f	f	f	f	2021-07-11 17:17:58.558+00	2021-07-11 17:17:58.558+00
689	45	admin.estruturas	f	f	f	f	2021-07-11 17:17:58.559+00	2021-07-11 17:17:58.559+00
690	45	admin.furos	f	f	f	f	2021-07-11 17:17:58.56+00	2021-07-11 17:17:58.56+00
691	45	admin.users	f	f	f	f	2021-07-11 17:17:58.562+00	2021-07-11 17:17:58.562+00
692	45	admin.configuracoes.logs	f	f	f	f	2021-07-11 17:17:58.563+00	2021-07-11 17:17:58.563+00
693	45	admin.minas	f	f	f	f	2021-07-11 17:17:58.564+00	2021-07-11 17:17:58.564+00
694	45	admin.rdos	f	f	f	f	2021-07-11 17:17:58.565+00	2021-07-11 17:17:58.565+00
695	45	admin.reports.atividades_usuarios	f	f	f	f	2021-07-11 17:17:58.567+00	2021-07-11 17:17:58.567+00
696	45	admin.reports.producao_usuarios	f	f	f	f	2021-07-11 17:17:58.568+00	2021-07-11 17:17:58.568+00
697	46	admin.areas	t	t	t	t	2021-07-12 20:05:31.015+00	2021-07-12 20:05:31.015+00
698	46	admin.atividades	t	t	t	t	2021-07-12 20:05:31.018+00	2021-07-12 20:05:31.018+00
699	46	admin.cargos	t	t	t	t	2021-07-12 20:05:31.02+00	2021-07-12 20:05:31.02+00
700	46	admin.complexos	t	t	t	t	2021-07-12 20:05:31.021+00	2021-07-12 20:05:31.021+00
701	46	admin.configuracoes	t	t	t	t	2021-07-12 20:05:31.023+00	2021-07-12 20:05:31.023+00
702	46	admin.contratos	t	t	t	t	2021-07-12 20:05:31.026+00	2021-07-12 20:05:31.026+00
703	46	admin.dashboard	t	t	t	t	2021-07-12 20:05:31.027+00	2021-07-12 20:05:31.027+00
704	46	admin.equipamentos	t	t	t	t	2021-07-12 20:05:31.029+00	2021-07-12 20:05:31.029+00
705	46	admin.estruturas	t	t	t	t	2021-07-12 20:05:31.031+00	2021-07-12 20:05:31.031+00
706	46	admin.furos	t	t	t	t	2021-07-12 20:05:31.033+00	2021-07-12 20:05:31.033+00
707	46	admin.users	t	t	t	t	2021-07-12 20:05:31.034+00	2021-07-12 20:05:31.034+00
708	46	admin.configuracoes.logs	t	t	t	t	2021-07-12 20:05:31.036+00	2021-07-12 20:05:31.036+00
709	46	admin.minas	t	t	t	t	2021-07-12 20:05:31.038+00	2021-07-12 20:05:31.038+00
710	46	admin.rdos	t	t	t	t	2021-07-12 20:05:31.04+00	2021-07-12 20:05:31.04+00
711	46	admin.reports.atividades_usuarios	t	t	t	t	2021-07-12 20:05:31.042+00	2021-07-12 20:05:31.042+00
712	46	admin.reports.producao_usuarios	t	t	t	t	2021-07-12 20:05:31.043+00	2021-07-12 20:05:31.043+00
\.


--
-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.cargos (id, titulo, contrato_id, created_at, updated_at) FROM stdin;
2	Admin	\N	2021-05-12 13:36:53.288+00	2021-05-12 13:36:53.288+00
9	Analista de Geologia	\N	2021-06-17 11:42:38.54+00	2021-06-17 11:42:38.54+00
10	Geólogo	\N	2021-06-18 11:48:40.508+00	2021-06-18 11:48:40.508+00
11	Geólogo	2	2021-06-18 14:29:54.288+00	2021-06-18 14:29:54.288+00
12	Auxiliar de Sondagem I	2	2021-06-18 14:33:05.249+00	2021-06-18 14:33:05.25+00
13	Auxiliar de Sondagem II	2	2021-06-18 14:33:19.552+00	2021-06-18 14:33:19.552+00
14	Auxiliar de Sondagem III	2	2021-06-18 14:33:42.695+00	2021-06-18 14:33:42.696+00
15	Sondador I	2	2021-06-18 14:34:14.166+00	2021-06-18 14:34:14.166+00
16	Sondador II	2	2021-06-18 14:34:26.203+00	2021-06-18 14:34:26.203+00
17	Sondador III	2	2021-06-18 14:34:59.893+00	2021-06-18 14:34:59.893+00
18	Encarregado de Sondagem	2	2021-06-18 14:35:23.072+00	2021-06-18 14:35:23.072+00
19	Auxiliar de Instrumentação	2	2021-06-18 14:36:27.723+00	2021-06-18 14:36:27.723+00
20	Técnico em Instrumentação	2	2021-06-18 14:36:57.696+00	2021-06-18 14:36:57.696+00
21	Topógrafo	2	2021-06-18 14:37:30.052+00	2021-06-18 14:37:30.052+00
22	Auxiliar de Topografia	2	2021-06-18 14:37:41.683+00	2021-06-18 14:37:41.683+00
23	Assistente de Geologia	2	2021-06-18 14:38:16.894+00	2021-06-18 14:38:16.894+00
24	Analista de Geologia	2	2021-06-18 14:38:41.156+00	2021-06-18 14:38:41.156+00
25	Motorista Operador	2	2021-06-18 14:42:53.685+00	2021-06-18 14:42:53.685+00
26	Mecânico	2	2021-06-18 16:16:51.164+00	2021-06-18 16:16:51.165+00
27	Operador Técnico de Ensaios Especiais	2	2021-06-20 17:53:55.997+00	2021-06-20 17:53:55.997+00
28	Assistente de Geologia	1	2021-06-21 22:02:53.344+00	2021-06-21 22:02:53.344+00
29	Sondador	1	2021-06-21 22:08:50.902+00	2021-06-21 22:08:50.902+00
30	Auxiliar de Sondagem	1	2021-06-21 22:09:11.559+00	2021-06-21 22:09:11.559+00
31	Encarregado de Sondagem	1	2021-06-21 22:09:29.719+00	2021-06-21 22:09:29.719+00
32	Motorista	1	2021-06-21 22:09:46.061+00	2021-06-21 22:09:46.061+00
33	Mecânico	1	2021-06-21 22:10:01.354+00	2021-06-21 22:10:01.354+00
34	Geólogo	1	2021-06-22 01:52:19.57+00	2021-06-22 01:52:19.57+00
35	Técnico de Mineração	1	2021-06-22 13:30:36.802+00	2021-06-22 13:30:36.802+00
37	Técnico de Segurança	1	2021-07-01 19:53:02.382+00	2021-07-01 19:53:02.382+00
38	Admin	2	2021-07-01 23:39:04.881+00	2021-07-01 23:39:04.881+00
39	Assistente de Geologia	3	2021-07-11 17:16:50.284+00	2021-07-11 17:16:50.284+00
40	Sondador	3	2021-07-11 17:16:58.742+00	2021-07-11 17:16:58.742+00
41	Encarregado de Sondagem	3	2021-07-11 17:17:08.526+00	2021-07-11 17:17:08.526+00
42	Auxiliar de Sondagem	3	2021-07-11 17:17:19.431+00	2021-07-11 17:17:19.431+00
43	Mecânico	3	2021-07-11 17:17:27.128+00	2021-07-11 17:17:27.128+00
44	Técnico de Segurança	3	2021-07-11 17:17:43.147+00	2021-07-11 17:17:43.147+00
45	Motorista	3	2021-07-11 17:17:58.546+00	2021-07-11 17:17:58.546+00
46	Projetista	1	2021-07-12 20:05:31.007+00	2021-07-12 20:05:31.007+00
\.


--
-- Data for Name: complexos; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.complexos (id, nome, contrato_id, created_at, updated_at) FROM stdin;
1	Brucutu	1	2021-05-13 22:22:13.62+00	2021-05-13 22:22:13.62+00
3	Brucutu	\N	2021-06-18 11:46:13.199+00	2021-06-18 11:46:13.199+00
4	Porto Trombetas	2	2021-06-20 18:29:21.534+00	2021-06-20 18:29:21.534+00
5	Vargem Grande	3	2021-07-11 17:18:21.911+00	2021-07-11 17:18:21.911+00
\.


--
-- Data for Name: contratos; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.contratos (id, centro_custo, descricao, numero, created_at, updated_at) FROM stdin;
1	264	Projel MG	264_GEOT_VALE_QUADRILATERO_MG - 5500069097	2021-05-12 13:39:12.724+00	2021-06-01 18:47:24.632+00
2	224	Projel PTR	3089/2019	2021-05-28 12:42:17.618+00	2021-06-17 11:33:56.887+00
3	283	Projel MG	283_PROJEL MARAVILHAS III - INVESTIGAÇÕES GEOTÉCNICAS	2021-07-11 17:15:50.181+00	2021-07-11 17:16:15.604+00
\.


--
-- Data for Name: equipamento_rdos; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.equipamento_rdos (id, quantidade, rdo_id, equipamento_id, created_at, updated_at) FROM stdin;
890	1.00	112	39	2021-07-13 00:23:44.263+00	2021-07-13 00:23:44.264+00
891	3.00	112	1	2021-07-13 00:23:44.265+00	2021-07-13 00:23:44.265+00
892	1.00	112	32	2021-07-13 00:23:44.271+00	2021-07-13 00:23:44.271+00
893	1.00	112	33	2021-07-13 00:23:44.272+00	2021-07-13 00:23:44.272+00
894	1.00	112	30	2021-07-13 00:23:44.274+00	2021-07-13 00:23:44.274+00
895	1.00	112	28	2021-07-13 00:23:44.275+00	2021-07-13 00:23:44.275+00
896	2.00	112	27	2021-07-13 00:23:44.277+00	2021-07-13 00:23:44.277+00
897	1.00	112	29	2021-07-13 00:23:44.278+00	2021-07-13 00:23:44.278+00
898	1.00	112	31	2021-07-13 00:23:44.28+00	2021-07-13 00:23:44.28+00
899	1.00	112	41	2021-07-13 00:23:44.281+00	2021-07-13 00:23:44.281+00
910	1.00	114	4	2021-07-13 01:05:56.011+00	2021-07-13 01:05:56.011+00
911	3.00	114	1	2021-07-13 01:05:56.012+00	2021-07-13 01:05:56.013+00
912	1.00	114	32	2021-07-13 01:05:56.014+00	2021-07-13 01:05:56.014+00
913	1.00	114	33	2021-07-13 01:05:56.016+00	2021-07-13 01:05:56.016+00
914	1.00	114	30	2021-07-13 01:05:56.017+00	2021-07-13 01:05:56.017+00
915	1.00	114	28	2021-07-13 01:05:56.019+00	2021-07-13 01:05:56.019+00
916	2.00	114	27	2021-07-13 01:05:56.022+00	2021-07-13 01:05:56.022+00
917	1.00	114	29	2021-07-13 01:05:56.023+00	2021-07-13 01:05:56.023+00
918	1.00	114	31	2021-07-13 01:05:56.024+00	2021-07-13 01:05:56.024+00
919	1.00	114	41	2021-07-13 01:05:56.026+00	2021-07-13 01:05:56.026+00
920	1.00	115	4	2021-07-13 11:25:18.053+00	2021-07-13 11:25:18.053+00
921	1.00	115	31	2021-07-13 11:25:18.055+00	2021-07-13 11:25:18.055+00
922	2.00	115	27	2021-07-13 11:25:18.057+00	2021-07-13 11:25:18.057+00
923	3.00	115	1	2021-07-13 11:25:18.059+00	2021-07-13 11:25:18.059+00
924	1.00	115	32	2021-07-13 11:25:18.061+00	2021-07-13 11:25:18.061+00
925	1.00	115	33	2021-07-13 11:25:18.062+00	2021-07-13 11:25:18.062+00
158	1.00	28	4	2021-06-30 19:49:39.554+00	2021-06-30 19:49:39.554+00
159	3.00	28	1	2021-06-30 19:49:39.556+00	2021-06-30 19:49:39.556+00
160	1.00	28	32	2021-06-30 19:49:39.557+00	2021-06-30 19:49:39.557+00
161	1.00	28	33	2021-06-30 19:49:39.558+00	2021-06-30 19:49:39.558+00
162	2.00	28	27	2021-06-30 19:49:39.56+00	2021-06-30 19:49:39.56+00
163	1.00	28	29	2021-06-30 19:49:39.561+00	2021-06-30 19:49:39.561+00
164	1.00	28	31	2021-06-30 19:49:39.562+00	2021-06-30 19:49:39.562+00
165	1.00	28	28	2021-06-30 19:49:39.564+00	2021-06-30 19:49:39.564+00
926	1.00	115	28	2021-07-13 11:25:18.064+00	2021-07-13 11:25:18.064+00
927	1.00	115	43	2021-07-13 11:25:18.065+00	2021-07-13 11:25:18.066+00
928	1.00	115	30	2021-07-13 11:25:18.067+00	2021-07-13 11:25:18.067+00
900	1.00	113	39	2021-07-13 00:34:11.32+00	2021-07-13 00:34:11.32+00
901	3.00	113	1	2021-07-13 00:34:11.322+00	2021-07-13 00:34:11.322+00
902	1.00	113	32	2021-07-13 00:34:11.324+00	2021-07-13 00:34:11.324+00
903	1.00	113	33	2021-07-13 00:34:11.325+00	2021-07-13 00:34:11.325+00
904	1.00	113	30	2021-07-13 00:34:11.326+00	2021-07-13 00:34:11.326+00
905	1.00	113	28	2021-07-13 00:34:11.328+00	2021-07-13 00:34:11.328+00
906	2.00	113	27	2021-07-13 00:34:11.329+00	2021-07-13 00:34:11.329+00
907	1.00	113	29	2021-07-13 00:34:11.33+00	2021-07-13 00:34:11.33+00
908	1.00	113	31	2021-07-13 00:34:11.332+00	2021-07-13 00:34:11.332+00
909	1.00	113	41	2021-07-13 00:34:11.333+00	2021-07-13 00:34:11.333+00
929	1.00	116	39	2021-07-13 23:04:07.936+00	2021-07-13 23:04:07.936+00
930	3.00	116	1	2021-07-13 23:04:07.938+00	2021-07-13 23:04:07.938+00
931	1.00	116	32	2021-07-13 23:04:07.94+00	2021-07-13 23:04:07.94+00
932	1.00	116	33	2021-07-13 23:04:07.942+00	2021-07-13 23:04:07.942+00
933	1.00	116	30	2021-07-13 23:04:07.943+00	2021-07-13 23:04:07.943+00
934	1.00	116	28	2021-07-13 23:04:07.945+00	2021-07-13 23:04:07.945+00
935	2.00	116	27	2021-07-13 23:04:07.946+00	2021-07-13 23:04:07.946+00
936	1.00	116	29	2021-07-13 23:04:07.948+00	2021-07-13 23:04:07.948+00
937	1.00	116	31	2021-07-13 23:04:07.949+00	2021-07-13 23:04:07.949+00
938	1.00	116	41	2021-07-13 23:04:07.95+00	2021-07-13 23:04:07.95+00
939	1.00	117	31	2021-07-14 00:15:58.838+00	2021-07-14 00:15:58.838+00
940	2.00	117	27	2021-07-14 00:15:58.84+00	2021-07-14 00:15:58.84+00
941	1.00	117	32	2021-07-14 00:15:58.841+00	2021-07-14 00:15:58.841+00
942	3.00	117	1	2021-07-14 00:15:58.843+00	2021-07-14 00:15:58.843+00
943	1.00	117	29	2021-07-14 00:15:58.844+00	2021-07-14 00:15:58.844+00
944	1.00	117	30	2021-07-14 00:15:58.846+00	2021-07-14 00:15:58.846+00
945	1.00	117	28	2021-07-14 00:15:58.847+00	2021-07-14 00:15:58.847+00
414	1.00	58	40	2021-07-12 09:49:37.663+00	2021-07-12 09:49:37.663+00
415	1.00	58	31	2021-07-12 09:49:37.665+00	2021-07-12 09:49:37.665+00
416	2.00	58	27	2021-07-12 09:49:37.666+00	2021-07-12 09:49:37.666+00
417	1.00	58	32	2021-07-12 09:49:37.667+00	2021-07-12 09:49:37.667+00
418	1.00	58	33	2021-07-12 09:49:37.669+00	2021-07-12 09:49:37.669+00
419	2.00	58	1	2021-07-12 09:49:37.67+00	2021-07-12 09:49:37.67+00
420	1.00	58	30	2021-07-12 09:49:37.671+00	2021-07-12 09:49:37.671+00
421	1.00	59	4	2021-07-12 09:49:43.394+00	2021-07-12 09:49:43.394+00
422	1.00	59	31	2021-07-12 09:49:43.396+00	2021-07-12 09:49:43.396+00
423	2.00	59	27	2021-07-12 09:49:43.397+00	2021-07-12 09:49:43.397+00
424	3.00	59	1	2021-07-12 09:49:43.398+00	2021-07-12 09:49:43.398+00
425	1.00	59	32	2021-07-12 09:49:43.399+00	2021-07-12 09:49:43.399+00
426	1.00	59	33	2021-07-12 09:49:43.4+00	2021-07-12 09:49:43.401+00
427	1.00	59	29	2021-07-12 09:49:43.402+00	2021-07-12 09:49:43.402+00
428	1.00	59	28	2021-07-12 09:49:43.403+00	2021-07-12 09:49:43.403+00
429	1.00	60	4	2021-07-12 09:49:47.209+00	2021-07-12 09:49:47.209+00
430	3.00	60	1	2021-07-12 09:49:47.211+00	2021-07-12 09:49:47.211+00
431	1.00	60	32	2021-07-12 09:49:47.215+00	2021-07-12 09:49:47.215+00
432	1.00	60	33	2021-07-12 09:49:47.216+00	2021-07-12 09:49:47.216+00
433	1.00	60	30	2021-07-12 09:49:47.218+00	2021-07-12 09:49:47.218+00
434	2.00	60	27	2021-07-12 09:49:47.219+00	2021-07-12 09:49:47.219+00
435	1.00	60	29	2021-07-12 09:49:47.22+00	2021-07-12 09:49:47.22+00
436	1.00	60	31	2021-07-12 09:49:47.221+00	2021-07-12 09:49:47.221+00
437	1.00	60	28	2021-07-12 09:49:47.223+00	2021-07-12 09:49:47.223+00
438	1.00	60	41	2021-07-12 09:49:47.224+00	2021-07-12 09:49:47.224+00
439	1.00	61	39	2021-07-12 09:49:50.425+00	2021-07-12 09:49:50.425+00
440	3.00	61	1	2021-07-12 09:49:50.427+00	2021-07-12 09:49:50.427+00
441	1.00	61	32	2021-07-12 09:49:50.428+00	2021-07-12 09:49:50.428+00
442	1.00	61	33	2021-07-12 09:49:50.43+00	2021-07-12 09:49:50.43+00
443	1.00	61	30	2021-07-12 09:49:50.431+00	2021-07-12 09:49:50.431+00
444	1.00	61	28	2021-07-12 09:49:50.432+00	2021-07-12 09:49:50.432+00
445	2.00	61	27	2021-07-12 09:49:50.434+00	2021-07-12 09:49:50.434+00
446	1.00	61	29	2021-07-12 09:49:50.435+00	2021-07-12 09:49:50.435+00
447	1.00	61	31	2021-07-12 09:49:50.436+00	2021-07-12 09:49:50.436+00
448	1.00	61	41	2021-07-12 09:49:50.437+00	2021-07-12 09:49:50.437+00
457	1.00	63	4	2021-07-12 09:49:58.173+00	2021-07-12 09:49:58.173+00
458	3.00	63	1	2021-07-12 09:49:58.183+00	2021-07-12 09:49:58.183+00
459	1.00	63	33	2021-07-12 09:49:58.184+00	2021-07-12 09:49:58.184+00
460	1.00	63	32	2021-07-12 09:49:58.186+00	2021-07-12 09:49:58.186+00
461	1.00	63	41	2021-07-12 09:49:58.194+00	2021-07-12 09:49:58.194+00
462	2.00	63	27	2021-07-12 09:49:58.195+00	2021-07-12 09:49:58.195+00
463	1.00	63	29	2021-07-12 09:49:58.197+00	2021-07-12 09:49:58.197+00
464	1.00	63	31	2021-07-12 09:49:58.198+00	2021-07-12 09:49:58.198+00
465	1.00	63	28	2021-07-12 09:49:58.199+00	2021-07-12 09:49:58.199+00
466	1.00	64	4	2021-07-12 09:50:04.539+00	2021-07-12 09:50:04.539+00
467	3.00	64	1	2021-07-12 09:50:04.54+00	2021-07-12 09:50:04.54+00
468	1.00	64	32	2021-07-12 09:50:04.542+00	2021-07-12 09:50:04.542+00
469	1.00	64	33	2021-07-12 09:50:04.544+00	2021-07-12 09:50:04.544+00
470	1.00	64	30	2021-07-12 09:50:04.545+00	2021-07-12 09:50:04.545+00
471	2.00	64	27	2021-07-12 09:50:04.547+00	2021-07-12 09:50:04.547+00
472	1.00	64	29	2021-07-12 09:50:04.548+00	2021-07-12 09:50:04.549+00
473	1.00	64	31	2021-07-12 09:50:04.55+00	2021-07-12 09:50:04.55+00
474	1.00	64	28	2021-07-12 09:50:04.552+00	2021-07-12 09:50:04.552+00
475	1.00	65	39	2021-07-12 09:50:09.532+00	2021-07-12 09:50:09.532+00
476	2.00	65	1	2021-07-12 09:50:09.533+00	2021-07-12 09:50:09.533+00
477	1.00	65	32	2021-07-12 09:50:09.534+00	2021-07-12 09:50:09.534+00
478	1.00	65	33	2021-07-12 09:50:09.536+00	2021-07-12 09:50:09.536+00
479	1.00	65	28	2021-07-12 09:50:09.537+00	2021-07-12 09:50:09.537+00
480	2.00	65	27	2021-07-12 09:50:09.538+00	2021-07-12 09:50:09.538+00
481	1.00	65	31	2021-07-12 09:50:09.54+00	2021-07-12 09:50:09.54+00
482	1.00	65	41	2021-07-12 09:50:09.541+00	2021-07-12 09:50:09.541+00
483	1.00	66	40	2021-07-12 09:50:11.976+00	2021-07-12 09:50:11.976+00
484	2.00	66	1	2021-07-12 09:50:11.977+00	2021-07-12 09:50:11.977+00
485	1.00	66	32	2021-07-12 09:50:11.978+00	2021-07-12 09:50:11.978+00
486	1.00	66	33	2021-07-12 09:50:11.98+00	2021-07-12 09:50:11.98+00
487	1.00	66	30	2021-07-12 09:50:11.982+00	2021-07-12 09:50:11.982+00
488	2.00	66	27	2021-07-12 09:50:11.983+00	2021-07-12 09:50:11.983+00
489	1.00	66	31	2021-07-12 09:50:11.984+00	2021-07-12 09:50:11.984+00
490	1.00	67	4	2021-07-12 09:50:29.61+00	2021-07-12 09:50:29.61+00
491	3.00	67	1	2021-07-12 09:50:29.611+00	2021-07-12 09:50:29.611+00
492	1.00	67	32	2021-07-12 09:50:29.613+00	2021-07-12 09:50:29.613+00
493	1.00	67	33	2021-07-12 09:50:29.615+00	2021-07-12 09:50:29.615+00
494	1.00	67	30	2021-07-12 09:50:29.616+00	2021-07-12 09:50:29.616+00
495	1.00	67	28	2021-07-12 09:50:29.617+00	2021-07-12 09:50:29.617+00
496	2.00	67	27	2021-07-12 09:50:29.619+00	2021-07-12 09:50:29.619+00
497	1.00	67	29	2021-07-12 09:50:29.62+00	2021-07-12 09:50:29.62+00
498	1.00	67	31	2021-07-12 09:50:29.622+00	2021-07-12 09:50:29.622+00
499	1.00	67	41	2021-07-12 09:50:29.623+00	2021-07-12 09:50:29.623+00
500	1.00	68	4	2021-07-12 09:50:34.994+00	2021-07-12 09:50:34.994+00
501	3.00	68	1	2021-07-12 09:50:34.996+00	2021-07-12 09:50:34.996+00
502	1.00	68	32	2021-07-12 09:50:34.997+00	2021-07-12 09:50:34.997+00
503	1.00	68	33	2021-07-12 09:50:34.998+00	2021-07-12 09:50:34.998+00
504	1.00	68	30	2021-07-12 09:50:35+00	2021-07-12 09:50:35+00
505	1.00	68	28	2021-07-12 09:50:35.001+00	2021-07-12 09:50:35.001+00
506	2.00	68	27	2021-07-12 09:50:35.002+00	2021-07-12 09:50:35.002+00
507	1.00	68	31	2021-07-12 09:50:35.004+00	2021-07-12 09:50:35.004+00
508	1.00	68	29	2021-07-12 09:50:35.005+00	2021-07-12 09:50:35.005+00
509	1.00	69	40	2021-07-12 09:50:43.423+00	2021-07-12 09:50:43.423+00
510	2.00	69	1	2021-07-12 09:50:43.425+00	2021-07-12 09:50:43.425+00
511	1.00	69	32	2021-07-12 09:50:43.426+00	2021-07-12 09:50:43.426+00
512	1.00	69	33	2021-07-12 09:50:43.427+00	2021-07-12 09:50:43.427+00
513	1.00	69	30	2021-07-12 09:50:43.428+00	2021-07-12 09:50:43.428+00
514	1.00	69	31	2021-07-12 09:50:43.43+00	2021-07-12 09:50:43.43+00
515	2.00	69	27	2021-07-12 09:50:43.432+00	2021-07-12 09:50:43.432+00
516	1.00	69	29	2021-07-12 09:50:43.433+00	2021-07-12 09:50:43.433+00
517	1.00	69	28	2021-07-12 09:50:43.434+00	2021-07-12 09:50:43.434+00
518	1.00	70	40	2021-07-12 09:50:45.345+00	2021-07-12 09:50:45.345+00
519	2.00	70	1	2021-07-12 09:50:45.346+00	2021-07-12 09:50:45.346+00
520	1.00	70	32	2021-07-12 09:50:45.347+00	2021-07-12 09:50:45.347+00
521	1.00	70	33	2021-07-12 09:50:45.349+00	2021-07-12 09:50:45.349+00
522	1.00	70	30	2021-07-12 09:50:45.35+00	2021-07-12 09:50:45.35+00
523	2.00	70	27	2021-07-12 09:50:45.352+00	2021-07-12 09:50:45.352+00
524	1.00	70	31	2021-07-12 09:50:45.354+00	2021-07-12 09:50:45.354+00
525	1.00	71	4	2021-07-12 09:50:54.224+00	2021-07-12 09:50:54.224+00
526	3.00	71	1	2021-07-12 09:50:54.225+00	2021-07-12 09:50:54.225+00
527	1.00	71	32	2021-07-12 09:50:54.227+00	2021-07-12 09:50:54.227+00
528	1.00	71	33	2021-07-12 09:50:54.228+00	2021-07-12 09:50:54.228+00
529	1.00	71	30	2021-07-12 09:50:54.229+00	2021-07-12 09:50:54.229+00
530	1.00	71	28	2021-07-12 09:50:54.231+00	2021-07-12 09:50:54.231+00
531	2.00	71	27	2021-07-12 09:50:54.232+00	2021-07-12 09:50:54.232+00
532	1.00	71	29	2021-07-12 09:50:54.233+00	2021-07-12 09:50:54.233+00
533	1.00	71	31	2021-07-12 09:50:54.234+00	2021-07-12 09:50:54.234+00
534	1.00	71	42	2021-07-12 09:50:54.236+00	2021-07-12 09:50:54.236+00
535	1.00	72	4	2021-07-12 09:50:59.705+00	2021-07-12 09:50:59.705+00
536	1.00	72	32	2021-07-12 09:50:59.706+00	2021-07-12 09:50:59.706+00
537	3.00	72	1	2021-07-12 09:50:59.708+00	2021-07-12 09:50:59.708+00
538	1.00	72	33	2021-07-12 09:50:59.709+00	2021-07-12 09:50:59.709+00
539	1.00	72	30	2021-07-12 09:50:59.71+00	2021-07-12 09:50:59.71+00
540	1.00	72	28	2021-07-12 09:50:59.711+00	2021-07-12 09:50:59.711+00
541	2.00	72	27	2021-07-12 09:50:59.712+00	2021-07-12 09:50:59.712+00
542	1.00	72	31	2021-07-12 09:50:59.714+00	2021-07-12 09:50:59.714+00
543	1.00	72	29	2021-07-12 09:50:59.715+00	2021-07-12 09:50:59.715+00
544	1.00	72	41	2021-07-12 09:50:59.716+00	2021-07-12 09:50:59.716+00
545	1.00	73	39	2021-07-12 09:51:04.029+00	2021-07-12 09:51:04.029+00
546	3.00	73	1	2021-07-12 09:51:04.03+00	2021-07-12 09:51:04.03+00
547	1.00	73	32	2021-07-12 09:51:04.032+00	2021-07-12 09:51:04.032+00
548	1.00	73	33	2021-07-12 09:51:04.033+00	2021-07-12 09:51:04.033+00
549	1.00	73	30	2021-07-12 09:51:04.034+00	2021-07-12 09:51:04.034+00
550	1.00	73	28	2021-07-12 09:51:04.035+00	2021-07-12 09:51:04.035+00
551	2.00	73	27	2021-07-12 09:51:04.037+00	2021-07-12 09:51:04.037+00
552	1.00	73	29	2021-07-12 09:51:04.038+00	2021-07-12 09:51:04.038+00
553	1.00	73	31	2021-07-12 09:51:04.039+00	2021-07-12 09:51:04.039+00
554	1.00	73	41	2021-07-12 09:51:04.04+00	2021-07-12 09:51:04.04+00
555	1.00	74	40	2021-07-12 09:51:06.615+00	2021-07-12 09:51:06.615+00
556	3.00	74	1	2021-07-12 09:51:06.616+00	2021-07-12 09:51:06.616+00
557	1.00	74	32	2021-07-12 09:51:06.617+00	2021-07-12 09:51:06.617+00
558	1.00	74	33	2021-07-12 09:51:06.618+00	2021-07-12 09:51:06.619+00
559	1.00	74	30	2021-07-12 09:51:06.62+00	2021-07-12 09:51:06.62+00
560	2.00	74	27	2021-07-12 09:51:06.621+00	2021-07-12 09:51:06.621+00
561	1.00	74	31	2021-07-12 09:51:06.622+00	2021-07-12 09:51:06.622+00
562	1.00	75	4	2021-07-12 09:51:19.822+00	2021-07-12 09:51:19.822+00
563	3.00	75	1	2021-07-12 09:51:19.823+00	2021-07-12 09:51:19.823+00
564	1.00	75	32	2021-07-12 09:51:19.824+00	2021-07-12 09:51:19.824+00
565	1.00	75	33	2021-07-12 09:51:19.826+00	2021-07-12 09:51:19.826+00
566	1.00	75	30	2021-07-12 09:51:19.827+00	2021-07-12 09:51:19.827+00
567	1.00	75	28	2021-07-12 09:51:19.828+00	2021-07-12 09:51:19.828+00
568	2.00	75	27	2021-07-12 09:51:19.835+00	2021-07-12 09:51:19.835+00
569	1.00	75	29	2021-07-12 09:51:19.838+00	2021-07-12 09:51:19.838+00
570	1.00	75	31	2021-07-12 09:51:19.839+00	2021-07-12 09:51:19.839+00
571	1.00	75	42	2021-07-12 09:51:19.841+00	2021-07-12 09:51:19.841+00
572	1.00	76	4	2021-07-12 09:51:30.537+00	2021-07-12 09:51:30.537+00
573	3.00	76	1	2021-07-12 09:51:30.538+00	2021-07-12 09:51:30.538+00
574	1.00	76	32	2021-07-12 09:51:30.54+00	2021-07-12 09:51:30.54+00
575	1.00	76	33	2021-07-12 09:51:30.541+00	2021-07-12 09:51:30.541+00
576	1.00	76	30	2021-07-12 09:51:30.542+00	2021-07-12 09:51:30.542+00
577	1.00	76	28	2021-07-12 09:51:30.543+00	2021-07-12 09:51:30.543+00
578	2.00	76	27	2021-07-12 09:51:30.544+00	2021-07-12 09:51:30.544+00
579	1.00	76	29	2021-07-12 09:51:30.546+00	2021-07-12 09:51:30.546+00
580	1.00	76	31	2021-07-12 09:51:30.547+00	2021-07-12 09:51:30.547+00
581	1.00	77	4	2021-07-12 09:51:36.372+00	2021-07-12 09:51:36.372+00
582	3.00	77	1	2021-07-12 09:51:36.374+00	2021-07-12 09:51:36.374+00
583	1.00	77	32	2021-07-12 09:51:36.375+00	2021-07-12 09:51:36.375+00
584	1.00	77	33	2021-07-12 09:51:36.377+00	2021-07-12 09:51:36.377+00
585	1.00	77	30	2021-07-12 09:51:36.378+00	2021-07-12 09:51:36.378+00
586	1.00	77	28	2021-07-12 09:51:36.379+00	2021-07-12 09:51:36.379+00
587	2.00	77	27	2021-07-12 09:51:36.38+00	2021-07-12 09:51:36.38+00
588	1.00	77	29	2021-07-12 09:51:36.381+00	2021-07-12 09:51:36.381+00
589	1.00	77	31	2021-07-12 09:51:36.383+00	2021-07-12 09:51:36.383+00
590	1.00	77	41	2021-07-12 09:51:36.384+00	2021-07-12 09:51:36.384+00
591	1.00	78	39	2021-07-12 09:51:40.434+00	2021-07-12 09:51:40.434+00
592	2.00	78	1	2021-07-12 09:51:40.435+00	2021-07-12 09:51:40.435+00
593	1.00	78	32	2021-07-12 09:51:40.436+00	2021-07-12 09:51:40.436+00
594	1.00	78	33	2021-07-12 09:51:40.437+00	2021-07-12 09:51:40.437+00
595	1.00	78	28	2021-07-12 09:51:40.438+00	2021-07-12 09:51:40.438+00
596	2.00	78	27	2021-07-12 09:51:40.439+00	2021-07-12 09:51:40.439+00
597	1.00	78	31	2021-07-12 09:51:40.44+00	2021-07-12 09:51:40.44+00
598	1.00	78	41	2021-07-12 09:51:40.442+00	2021-07-12 09:51:40.442+00
599	1.00	79	40	2021-07-12 09:51:45.255+00	2021-07-12 09:51:45.255+00
600	3.00	79	1	2021-07-12 09:51:45.256+00	2021-07-12 09:51:45.256+00
601	1.00	79	32	2021-07-12 09:51:45.258+00	2021-07-12 09:51:45.258+00
602	1.00	79	33	2021-07-12 09:51:45.259+00	2021-07-12 09:51:45.259+00
603	1.00	79	30	2021-07-12 09:51:45.261+00	2021-07-12 09:51:45.261+00
604	2.00	79	27	2021-07-12 09:51:45.262+00	2021-07-12 09:51:45.262+00
605	1.00	79	31	2021-07-12 09:51:45.264+00	2021-07-12 09:51:45.264+00
606	1.00	80	4	2021-07-12 09:51:48.866+00	2021-07-12 09:51:48.866+00
607	3.00	80	1	2021-07-12 09:51:48.867+00	2021-07-12 09:51:48.867+00
608	1.00	80	32	2021-07-12 09:51:48.868+00	2021-07-12 09:51:48.868+00
609	1.00	80	33	2021-07-12 09:51:48.869+00	2021-07-12 09:51:48.869+00
610	1.00	80	30	2021-07-12 09:51:48.87+00	2021-07-12 09:51:48.87+00
611	1.00	80	28	2021-07-12 09:51:48.871+00	2021-07-12 09:51:48.871+00
612	2.00	80	27	2021-07-12 09:51:48.872+00	2021-07-12 09:51:48.872+00
613	1.00	80	31	2021-07-12 09:51:48.874+00	2021-07-12 09:51:48.874+00
614	1.00	80	29	2021-07-12 09:51:48.875+00	2021-07-12 09:51:48.875+00
615	1.00	80	41	2021-07-12 09:51:48.876+00	2021-07-12 09:51:48.876+00
616	1.00	81	4	2021-07-12 09:51:52.47+00	2021-07-12 09:51:52.47+00
617	3.00	81	1	2021-07-12 09:51:52.471+00	2021-07-12 09:51:52.471+00
618	1.00	81	32	2021-07-12 09:51:52.472+00	2021-07-12 09:51:52.472+00
619	1.00	81	33	2021-07-12 09:51:52.473+00	2021-07-12 09:51:52.473+00
620	1.00	81	30	2021-07-12 09:51:52.474+00	2021-07-12 09:51:52.474+00
621	1.00	81	28	2021-07-12 09:51:52.475+00	2021-07-12 09:51:52.475+00
622	1.00	81	31	2021-07-12 09:51:52.477+00	2021-07-12 09:51:52.477+00
623	2.00	81	27	2021-07-12 09:51:52.479+00	2021-07-12 09:51:52.479+00
624	1.00	81	29	2021-07-12 09:51:52.48+00	2021-07-12 09:51:52.48+00
625	1.00	81	41	2021-07-12 09:51:52.481+00	2021-07-12 09:51:52.481+00
626	1.00	82	39	2021-07-12 09:51:57.91+00	2021-07-12 09:51:57.91+00
627	2.00	82	1	2021-07-12 09:51:57.911+00	2021-07-12 09:51:57.911+00
628	1.00	82	32	2021-07-12 09:51:57.912+00	2021-07-12 09:51:57.912+00
629	1.00	82	33	2021-07-12 09:51:57.913+00	2021-07-12 09:51:57.913+00
630	1.00	82	28	2021-07-12 09:51:57.915+00	2021-07-12 09:51:57.915+00
631	2.00	82	27	2021-07-12 09:51:57.921+00	2021-07-12 09:51:57.921+00
632	1.00	82	31	2021-07-12 09:51:57.928+00	2021-07-12 09:51:57.928+00
633	1.00	82	41	2021-07-12 09:51:57.93+00	2021-07-12 09:51:57.93+00
634	1.00	83	40	2021-07-12 09:52:04.59+00	2021-07-12 09:52:04.59+00
635	3.00	83	1	2021-07-12 09:52:04.592+00	2021-07-12 09:52:04.592+00
636	1.00	83	32	2021-07-12 09:52:04.593+00	2021-07-12 09:52:04.593+00
637	1.00	83	33	2021-07-12 09:52:04.595+00	2021-07-12 09:52:04.595+00
638	1.00	83	30	2021-07-12 09:52:04.596+00	2021-07-12 09:52:04.596+00
639	2.00	83	27	2021-07-12 09:52:04.601+00	2021-07-12 09:52:04.601+00
640	1.00	83	31	2021-07-12 09:52:04.603+00	2021-07-12 09:52:04.603+00
641	1.00	84	4	2021-07-12 09:52:08.979+00	2021-07-12 09:52:08.979+00
642	3.00	84	1	2021-07-12 09:52:08.981+00	2021-07-12 09:52:08.981+00
643	1.00	84	32	2021-07-12 09:52:08.982+00	2021-07-12 09:52:08.982+00
644	1.00	84	33	2021-07-12 09:52:08.988+00	2021-07-12 09:52:08.988+00
645	1.00	84	30	2021-07-12 09:52:08.989+00	2021-07-12 09:52:08.989+00
646	1.00	84	31	2021-07-12 09:52:08.991+00	2021-07-12 09:52:08.991+00
647	2.00	84	27	2021-07-12 09:52:08.992+00	2021-07-12 09:52:08.992+00
648	1.00	84	28	2021-07-12 09:52:08.993+00	2021-07-12 09:52:08.993+00
649	1.00	84	29	2021-07-12 09:52:08.994+00	2021-07-12 09:52:08.994+00
650	1.00	85	4	2021-07-12 09:52:12.101+00	2021-07-12 09:52:12.101+00
651	1.00	85	31	2021-07-12 09:52:12.103+00	2021-07-12 09:52:12.103+00
652	2.00	85	27	2021-07-12 09:52:12.105+00	2021-07-12 09:52:12.105+00
653	3.00	85	1	2021-07-12 09:52:12.107+00	2021-07-12 09:52:12.107+00
654	1.00	85	32	2021-07-12 09:52:12.109+00	2021-07-12 09:52:12.109+00
655	1.00	85	33	2021-07-12 09:52:12.111+00	2021-07-12 09:52:12.111+00
656	1.00	85	30	2021-07-12 09:52:12.113+00	2021-07-12 09:52:12.113+00
657	1.00	85	28	2021-07-12 09:52:12.114+00	2021-07-12 09:52:12.115+00
658	1.00	85	29	2021-07-12 09:52:12.116+00	2021-07-12 09:52:12.116+00
659	1.00	86	39	2021-07-12 09:52:18.274+00	2021-07-12 09:52:18.274+00
660	2.00	86	1	2021-07-12 09:52:18.275+00	2021-07-12 09:52:18.275+00
661	1.00	86	32	2021-07-12 09:52:18.277+00	2021-07-12 09:52:18.277+00
662	1.00	86	33	2021-07-12 09:52:18.278+00	2021-07-12 09:52:18.278+00
663	1.00	86	28	2021-07-12 09:52:18.28+00	2021-07-12 09:52:18.28+00
664	2.00	86	27	2021-07-12 09:52:18.281+00	2021-07-12 09:52:18.281+00
665	1.00	86	29	2021-07-12 09:52:18.283+00	2021-07-12 09:52:18.283+00
666	1.00	86	31	2021-07-12 09:52:18.284+00	2021-07-12 09:52:18.284+00
667	1.00	86	41	2021-07-12 09:52:18.286+00	2021-07-12 09:52:18.286+00
668	1.00	87	40	2021-07-12 09:52:20.851+00	2021-07-12 09:52:20.851+00
669	3.00	87	1	2021-07-12 09:52:20.853+00	2021-07-12 09:52:20.853+00
670	1.00	87	32	2021-07-12 09:52:20.854+00	2021-07-12 09:52:20.854+00
671	1.00	87	33	2021-07-12 09:52:20.856+00	2021-07-12 09:52:20.856+00
672	1.00	87	30	2021-07-12 09:52:20.859+00	2021-07-12 09:52:20.859+00
673	2.00	87	27	2021-07-12 09:52:20.874+00	2021-07-12 09:52:20.874+00
674	1.00	87	31	2021-07-12 09:52:20.875+00	2021-07-12 09:52:20.875+00
695	1.00	90	39	2021-07-12 09:52:33.192+00	2021-07-12 09:52:33.192+00
696	2.00	90	1	2021-07-12 09:52:33.202+00	2021-07-12 09:52:33.202+00
697	1.00	90	32	2021-07-12 09:52:33.203+00	2021-07-12 09:52:33.204+00
698	1.00	90	33	2021-07-12 09:52:33.205+00	2021-07-12 09:52:33.205+00
699	1.00	90	28	2021-07-12 09:52:33.208+00	2021-07-12 09:52:33.208+00
700	2.00	90	27	2021-07-12 09:52:33.21+00	2021-07-12 09:52:33.21+00
701	1.00	90	31	2021-07-12 09:52:33.211+00	2021-07-12 09:52:33.211+00
702	1.00	90	41	2021-07-12 09:52:33.212+00	2021-07-12 09:52:33.213+00
711	1.00	92	4	2021-07-12 09:52:46.434+00	2021-07-12 09:52:46.434+00
712	3.00	92	1	2021-07-12 09:52:46.436+00	2021-07-12 09:52:46.436+00
713	1.00	92	32	2021-07-12 09:52:46.437+00	2021-07-12 09:52:46.437+00
714	1.00	92	33	2021-07-12 09:52:46.439+00	2021-07-12 09:52:46.439+00
715	1.00	92	30	2021-07-12 09:52:46.44+00	2021-07-12 09:52:46.44+00
716	1.00	92	28	2021-07-12 09:52:46.443+00	2021-07-12 09:52:46.443+00
717	2.00	92	27	2021-07-12 09:52:46.445+00	2021-07-12 09:52:46.445+00
718	1.00	92	29	2021-07-12 09:52:46.446+00	2021-07-12 09:52:46.446+00
719	1.00	92	31	2021-07-12 09:52:46.448+00	2021-07-12 09:52:46.448+00
675	1.00	88	4	2021-07-12 09:52:24.696+00	2021-07-12 09:52:24.696+00
676	3.00	88	1	2021-07-12 09:52:24.698+00	2021-07-12 09:52:24.698+00
677	1.00	88	32	2021-07-12 09:52:24.7+00	2021-07-12 09:52:24.7+00
678	1.00	88	33	2021-07-12 09:52:24.701+00	2021-07-12 09:52:24.701+00
679	1.00	88	30	2021-07-12 09:52:24.703+00	2021-07-12 09:52:24.703+00
680	1.00	88	28	2021-07-12 09:52:24.704+00	2021-07-12 09:52:24.704+00
681	2.00	88	27	2021-07-12 09:52:24.706+00	2021-07-12 09:52:24.706+00
682	1.00	88	29	2021-07-12 09:52:24.707+00	2021-07-12 09:52:24.707+00
683	1.00	88	31	2021-07-12 09:52:24.709+00	2021-07-12 09:52:24.709+00
684	1.00	88	41	2021-07-12 09:52:24.71+00	2021-07-12 09:52:24.71+00
685	1.00	89	4	2021-07-12 09:52:30.528+00	2021-07-12 09:52:30.528+00
686	3.00	89	1	2021-07-12 09:52:30.53+00	2021-07-12 09:52:30.53+00
687	1.00	89	32	2021-07-12 09:52:30.532+00	2021-07-12 09:52:30.532+00
688	1.00	89	33	2021-07-12 09:52:30.533+00	2021-07-12 09:52:30.533+00
689	1.00	89	30	2021-07-12 09:52:30.535+00	2021-07-12 09:52:30.535+00
690	1.00	89	28	2021-07-12 09:52:30.536+00	2021-07-12 09:52:30.537+00
691	2.00	89	27	2021-07-12 09:52:30.538+00	2021-07-12 09:52:30.538+00
692	1.00	89	29	2021-07-12 09:52:30.54+00	2021-07-12 09:52:30.54+00
693	1.00	89	31	2021-07-12 09:52:30.541+00	2021-07-12 09:52:30.541+00
694	1.00	89	41	2021-07-12 09:52:30.544+00	2021-07-12 09:52:30.544+00
703	1.00	91	40	2021-07-12 09:52:38.627+00	2021-07-12 09:52:38.627+00
704	3.00	91	1	2021-07-12 09:52:38.629+00	2021-07-12 09:52:38.629+00
705	1.00	91	32	2021-07-12 09:52:38.63+00	2021-07-12 09:52:38.63+00
706	1.00	91	33	2021-07-12 09:52:38.632+00	2021-07-12 09:52:38.632+00
707	1.00	91	30	2021-07-12 09:52:38.633+00	2021-07-12 09:52:38.633+00
708	1.00	91	28	2021-07-12 09:52:38.635+00	2021-07-12 09:52:38.635+00
709	2.00	91	27	2021-07-12 09:52:38.636+00	2021-07-12 09:52:38.637+00
710	1.00	91	31	2021-07-12 09:52:38.638+00	2021-07-12 09:52:38.638+00
720	1.00	93	4	2021-07-12 09:53:24.776+00	2021-07-12 09:53:24.776+00
721	2.00	93	1	2021-07-12 09:53:24.778+00	2021-07-12 09:53:24.778+00
722	1.00	93	32	2021-07-12 09:53:24.779+00	2021-07-12 09:53:24.779+00
723	1.00	93	33	2021-07-12 09:53:24.781+00	2021-07-12 09:53:24.781+00
724	1.00	93	28	2021-07-12 09:53:24.782+00	2021-07-12 09:53:24.782+00
725	2.00	93	27	2021-07-12 09:53:24.784+00	2021-07-12 09:53:24.784+00
726	1.00	93	31	2021-07-12 09:53:24.785+00	2021-07-12 09:53:24.785+00
727	1.00	93	41	2021-07-12 09:53:24.787+00	2021-07-12 09:53:24.787+00
728	1.00	94	31	2021-07-12 09:53:43.139+00	2021-07-12 09:53:43.139+00
729	1.00	94	4	2021-07-12 09:53:43.142+00	2021-07-12 09:53:43.142+00
730	3.00	94	1	2021-07-12 09:53:43.144+00	2021-07-12 09:53:43.144+00
731	1.00	94	32	2021-07-12 09:53:43.146+00	2021-07-12 09:53:43.146+00
732	1.00	94	33	2021-07-12 09:53:43.148+00	2021-07-12 09:53:43.148+00
733	1.00	94	30	2021-07-12 09:53:43.15+00	2021-07-12 09:53:43.15+00
734	1.00	94	28	2021-07-12 09:53:43.152+00	2021-07-12 09:53:43.152+00
735	2.00	94	27	2021-07-12 09:53:43.154+00	2021-07-12 09:53:43.154+00
736	1.00	94	29	2021-07-12 09:53:43.156+00	2021-07-12 09:53:43.156+00
737	1.00	94	41	2021-07-12 09:53:43.158+00	2021-07-12 09:53:43.158+00
738	1.00	95	40	2021-07-12 09:53:46.757+00	2021-07-12 09:53:46.757+00
739	3.00	95	1	2021-07-12 09:53:46.76+00	2021-07-12 09:53:46.76+00
740	1.00	95	32	2021-07-12 09:53:46.762+00	2021-07-12 09:53:46.762+00
741	1.00	95	33	2021-07-12 09:53:46.763+00	2021-07-12 09:53:46.763+00
742	1.00	95	30	2021-07-12 09:53:46.765+00	2021-07-12 09:53:46.765+00
743	2.00	95	27	2021-07-12 09:53:46.766+00	2021-07-12 09:53:46.766+00
744	1.00	96	4	2021-07-12 09:54:07.186+00	2021-07-12 09:54:07.186+00
745	3.00	96	1	2021-07-12 09:54:07.187+00	2021-07-12 09:54:07.187+00
746	1.00	96	32	2021-07-12 09:54:07.189+00	2021-07-12 09:54:07.189+00
747	1.00	96	33	2021-07-12 09:54:07.19+00	2021-07-12 09:54:07.19+00
748	1.00	96	30	2021-07-12 09:54:07.193+00	2021-07-12 09:54:07.193+00
749	1.00	96	28	2021-07-12 09:54:07.195+00	2021-07-12 09:54:07.195+00
750	2.00	96	27	2021-07-12 09:54:07.198+00	2021-07-12 09:54:07.198+00
751	1.00	96	29	2021-07-12 09:54:07.199+00	2021-07-12 09:54:07.199+00
752	1.00	96	31	2021-07-12 09:54:07.201+00	2021-07-12 09:54:07.201+00
753	1.00	97	4	2021-07-12 09:54:10.937+00	2021-07-12 09:54:10.937+00
754	3.00	97	1	2021-07-12 09:54:10.938+00	2021-07-12 09:54:10.938+00
755	1.00	97	32	2021-07-12 09:54:10.946+00	2021-07-12 09:54:10.946+00
756	1.00	97	33	2021-07-12 09:54:10.948+00	2021-07-12 09:54:10.948+00
757	1.00	97	30	2021-07-12 09:54:10.954+00	2021-07-12 09:54:10.954+00
758	1.00	97	28	2021-07-12 09:54:10.955+00	2021-07-12 09:54:10.955+00
759	1.00	97	29	2021-07-12 09:54:10.962+00	2021-07-12 09:54:10.962+00
760	2.00	97	27	2021-07-12 09:54:10.964+00	2021-07-12 09:54:10.964+00
761	1.00	97	31	2021-07-12 09:54:10.966+00	2021-07-12 09:54:10.966+00
771	1.00	99	40	2021-07-12 09:54:25.495+00	2021-07-12 09:54:25.495+00
772	3.00	99	1	2021-07-12 09:54:25.497+00	2021-07-12 09:54:25.497+00
773	1.00	99	32	2021-07-12 09:54:25.498+00	2021-07-12 09:54:25.498+00
774	1.00	99	33	2021-07-12 09:54:25.501+00	2021-07-12 09:54:25.501+00
775	1.00	99	30	2021-07-12 09:54:25.503+00	2021-07-12 09:54:25.503+00
776	2.00	99	27	2021-07-12 09:54:25.504+00	2021-07-12 09:54:25.504+00
777	1.00	99	31	2021-07-12 09:54:25.507+00	2021-07-12 09:54:25.507+00
778	1.00	100	4	2021-07-12 09:54:31.629+00	2021-07-12 09:54:31.629+00
779	3.00	100	1	2021-07-12 09:54:31.631+00	2021-07-12 09:54:31.631+00
780	1.00	100	32	2021-07-12 09:54:31.633+00	2021-07-12 09:54:31.633+00
781	1.00	100	33	2021-07-12 09:54:31.635+00	2021-07-12 09:54:31.635+00
782	1.00	100	30	2021-07-12 09:54:31.636+00	2021-07-12 09:54:31.636+00
783	1.00	100	28	2021-07-12 09:54:31.638+00	2021-07-12 09:54:31.638+00
784	2.00	100	27	2021-07-12 09:54:31.639+00	2021-07-12 09:54:31.639+00
785	1.00	100	29	2021-07-12 09:54:31.641+00	2021-07-12 09:54:31.641+00
786	1.00	100	31	2021-07-12 09:54:31.642+00	2021-07-12 09:54:31.642+00
787	1.00	101	4	2021-07-12 09:54:43.826+00	2021-07-12 09:54:43.826+00
788	3.00	101	1	2021-07-12 09:54:43.828+00	2021-07-12 09:54:43.828+00
789	1.00	101	32	2021-07-12 09:54:43.829+00	2021-07-12 09:54:43.829+00
790	1.00	101	33	2021-07-12 09:54:43.83+00	2021-07-12 09:54:43.83+00
791	1.00	101	30	2021-07-12 09:54:43.832+00	2021-07-12 09:54:43.832+00
792	1.00	101	28	2021-07-12 09:54:43.833+00	2021-07-12 09:54:43.833+00
793	2.00	101	27	2021-07-12 09:54:43.835+00	2021-07-12 09:54:43.835+00
794	1.00	101	29	2021-07-12 09:54:43.836+00	2021-07-12 09:54:43.836+00
795	1.00	101	31	2021-07-12 09:54:43.844+00	2021-07-12 09:54:43.845+00
796	1.00	102	39	2021-07-12 09:54:51.728+00	2021-07-12 09:54:51.728+00
797	3.00	102	1	2021-07-12 09:54:51.729+00	2021-07-12 09:54:51.729+00
798	1.00	102	32	2021-07-12 09:54:51.73+00	2021-07-12 09:54:51.73+00
799	1.00	102	33	2021-07-12 09:54:51.732+00	2021-07-12 09:54:51.732+00
800	1.00	102	30	2021-07-12 09:54:51.733+00	2021-07-12 09:54:51.733+00
801	1.00	102	28	2021-07-12 09:54:51.735+00	2021-07-12 09:54:51.735+00
802	2.00	102	27	2021-07-12 09:54:51.736+00	2021-07-12 09:54:51.736+00
803	1.00	102	29	2021-07-12 09:54:51.737+00	2021-07-12 09:54:51.737+00
804	1.00	102	31	2021-07-12 09:54:51.739+00	2021-07-12 09:54:51.739+00
805	1.00	102	41	2021-07-12 09:54:51.741+00	2021-07-12 09:54:51.741+00
806	1.00	103	40	2021-07-12 09:54:54.157+00	2021-07-12 09:54:54.157+00
807	3.00	103	1	2021-07-12 09:54:54.159+00	2021-07-12 09:54:54.159+00
808	1.00	103	32	2021-07-12 09:54:54.16+00	2021-07-12 09:54:54.16+00
809	1.00	103	33	2021-07-12 09:54:54.162+00	2021-07-12 09:54:54.162+00
810	1.00	103	30	2021-07-12 09:54:54.163+00	2021-07-12 09:54:54.163+00
811	2.00	103	27	2021-07-12 09:54:54.164+00	2021-07-12 09:54:54.164+00
812	1.00	103	31	2021-07-12 09:54:54.166+00	2021-07-12 09:54:54.166+00
813	1.00	103	41	2021-07-12 09:54:54.167+00	2021-07-12 09:54:54.167+00
814	1.00	104	4	2021-07-12 09:54:57.673+00	2021-07-12 09:54:57.673+00
815	3.00	104	1	2021-07-12 09:54:57.675+00	2021-07-12 09:54:57.675+00
816	1.00	104	32	2021-07-12 09:54:57.676+00	2021-07-12 09:54:57.676+00
817	1.00	104	33	2021-07-12 09:54:57.678+00	2021-07-12 09:54:57.678+00
818	1.00	104	30	2021-07-12 09:54:57.679+00	2021-07-12 09:54:57.679+00
819	1.00	104	28	2021-07-12 09:54:57.68+00	2021-07-12 09:54:57.68+00
820	2.00	104	27	2021-07-12 09:54:57.682+00	2021-07-12 09:54:57.682+00
821	1.00	104	31	2021-07-12 09:54:57.683+00	2021-07-12 09:54:57.683+00
822	1.00	104	29	2021-07-12 09:54:57.686+00	2021-07-12 09:54:57.686+00
823	1.00	104	43	2021-07-12 09:54:57.687+00	2021-07-12 09:54:57.687+00
824	1.00	105	40	2021-07-12 09:55:22.721+00	2021-07-12 09:55:22.721+00
825	3.00	105	1	2021-07-12 09:55:22.723+00	2021-07-12 09:55:22.723+00
826	1.00	105	32	2021-07-12 09:55:22.725+00	2021-07-12 09:55:22.725+00
827	1.00	105	33	2021-07-12 09:55:22.726+00	2021-07-12 09:55:22.726+00
828	1.00	105	30	2021-07-12 09:55:22.728+00	2021-07-12 09:55:22.728+00
829	2.00	105	27	2021-07-12 09:55:22.729+00	2021-07-12 09:55:22.729+00
830	1.00	105	31	2021-07-12 09:55:22.731+00	2021-07-12 09:55:22.731+00
831	1.00	106	39	2021-07-12 09:55:39.287+00	2021-07-12 09:55:39.287+00
832	3.00	106	1	2021-07-12 09:55:39.289+00	2021-07-12 09:55:39.289+00
833	1.00	106	32	2021-07-12 09:55:39.29+00	2021-07-12 09:55:39.29+00
834	1.00	106	33	2021-07-12 09:55:39.291+00	2021-07-12 09:55:39.291+00
835	1.00	106	30	2021-07-12 09:55:39.293+00	2021-07-12 09:55:39.293+00
836	1.00	106	28	2021-07-12 09:55:39.301+00	2021-07-12 09:55:39.301+00
837	2.00	106	27	2021-07-12 09:55:39.303+00	2021-07-12 09:55:39.303+00
838	1.00	106	29	2021-07-12 09:55:39.304+00	2021-07-12 09:55:39.304+00
839	1.00	106	31	2021-07-12 09:55:39.31+00	2021-07-12 09:55:39.31+00
840	1.00	106	41	2021-07-12 09:55:39.311+00	2021-07-12 09:55:39.311+00
841	1.00	107	4	2021-07-12 09:55:45.6+00	2021-07-12 09:55:45.6+00
842	2.00	107	27	2021-07-12 09:55:45.601+00	2021-07-12 09:55:45.601+00
843	3.00	107	1	2021-07-12 09:55:45.606+00	2021-07-12 09:55:45.606+00
844	1.00	107	32	2021-07-12 09:55:45.608+00	2021-07-12 09:55:45.608+00
845	1.00	107	33	2021-07-12 09:55:45.621+00	2021-07-12 09:55:45.621+00
846	1.00	107	28	2021-07-12 09:55:45.625+00	2021-07-12 09:55:45.625+00
847	2.00	107	27	2021-07-12 09:55:45.627+00	2021-07-12 09:55:45.627+00
848	1.00	107	29	2021-07-12 09:55:45.628+00	2021-07-12 09:55:45.628+00
849	1.00	107	31	2021-07-12 09:55:45.63+00	2021-07-12 09:55:45.63+00
850	1.00	107	43	2021-07-12 09:55:45.632+00	2021-07-12 09:55:45.632+00
851	1.00	108	4	2021-07-12 09:55:49.896+00	2021-07-12 09:55:49.896+00
852	3.00	108	1	2021-07-12 09:55:49.9+00	2021-07-12 09:55:49.9+00
853	1.00	108	32	2021-07-12 09:55:49.901+00	2021-07-12 09:55:49.901+00
854	1.00	108	33	2021-07-12 09:55:49.903+00	2021-07-12 09:55:49.903+00
855	1.00	108	30	2021-07-12 09:55:49.904+00	2021-07-12 09:55:49.904+00
856	1.00	108	28	2021-07-12 09:55:49.906+00	2021-07-12 09:55:49.906+00
857	2.00	108	27	2021-07-12 09:55:49.907+00	2021-07-12 09:55:49.907+00
858	1.00	108	29	2021-07-12 09:55:49.908+00	2021-07-12 09:55:49.908+00
859	1.00	108	31	2021-07-12 09:55:49.909+00	2021-07-12 09:55:49.909+00
860	1.00	109	39	2021-07-12 09:55:54.568+00	2021-07-12 09:55:54.568+00
861	3.00	109	1	2021-07-12 09:55:54.57+00	2021-07-12 09:55:54.57+00
862	1.00	109	32	2021-07-12 09:55:54.571+00	2021-07-12 09:55:54.571+00
863	1.00	109	33	2021-07-12 09:55:54.572+00	2021-07-12 09:55:54.572+00
864	1.00	109	30	2021-07-12 09:55:54.573+00	2021-07-12 09:55:54.573+00
865	1.00	109	28	2021-07-12 09:55:54.575+00	2021-07-12 09:55:54.575+00
866	2.00	109	27	2021-07-12 09:55:54.576+00	2021-07-12 09:55:54.576+00
867	1.00	109	29	2021-07-12 09:55:54.577+00	2021-07-12 09:55:54.577+00
868	1.00	109	31	2021-07-12 09:55:54.579+00	2021-07-12 09:55:54.579+00
869	1.00	109	41	2021-07-12 09:55:54.58+00	2021-07-12 09:55:54.58+00
880	1.00	111	4	2021-07-12 23:34:37.42+00	2021-07-12 23:34:37.42+00
881	1.00	111	31	2021-07-12 23:34:37.422+00	2021-07-12 23:34:37.423+00
882	2.00	111	27	2021-07-12 23:34:37.434+00	2021-07-12 23:34:37.434+00
883	3.00	111	1	2021-07-12 23:34:37.435+00	2021-07-12 23:34:37.435+00
884	1.00	111	32	2021-07-12 23:34:37.437+00	2021-07-12 23:34:37.437+00
885	1.00	111	33	2021-07-12 23:34:37.441+00	2021-07-12 23:34:37.441+00
886	1.00	111	30	2021-07-12 23:34:37.443+00	2021-07-12 23:34:37.443+00
887	1.00	111	28	2021-07-12 23:34:37.444+00	2021-07-12 23:34:37.444+00
888	1.00	111	29	2021-07-12 23:34:37.447+00	2021-07-12 23:34:37.447+00
889	1.00	111	43	2021-07-12 23:34:37.448+00	2021-07-12 23:34:37.448+00
\.


--
-- Data for Name: equipamentos; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.equipamentos (id, tag, descricao, sonda, contrato_id, created_at, updated_at) FROM stdin;
5	PJL 29	Caminhonete	f	2	2021-06-18 15:47:24.813+00	2021-06-18 15:47:24.813+00
6	PJL 43	Caminhonete	f	2	2021-06-18 15:47:48.625+00	2021-06-18 15:47:48.625+00
7	PJL 45	Caminhonete	f	2	2021-06-18 15:48:18.079+00	2021-06-18 15:48:18.079+00
9	PJL 55	Caminhonete	f	2	2021-06-18 15:48:52.11+00	2021-06-18 15:48:52.11+00
10	PJL 82	Caminhonete	f	2	2021-06-18 15:49:11.056+00	2021-06-18 15:49:11.056+00
11	PJL 83	Caminhonete	f	2	2021-06-18 15:49:23.146+00	2021-06-18 15:49:23.146+00
12	PJL 85	Caminhonete	f	2	2021-06-18 15:49:51.671+00	2021-06-18 15:49:51.671+00
13	PJL 91	Caminhonete	f	2	2021-06-18 15:50:06.479+00	2021-06-18 15:50:06.479+00
14	PJL 92	Caminhonete	f	2	2021-06-18 15:50:21.042+00	2021-06-18 15:50:21.042+00
15	PJL 97	Caminhonete	f	2	2021-06-18 15:50:58.446+00	2021-06-18 15:50:58.446+00
16	PJL 08	Caminhonete	f	2	2021-06-18 15:51:14.2+00	2021-06-18 15:51:14.2+00
17	PJL 53	Caminhonete	f	2	2021-06-18 15:51:30.418+00	2021-06-18 15:51:30.418+00
8	PJL 14	Caminhonete	f	2	2021-06-18 15:48:33.885+00	2021-06-18 15:48:33.885+00
19	PJL 13	Sonda MACH 700	t	2	2021-06-18 15:55:43.106+00	2021-06-18 15:55:43.106+00
18	PJL 17	Sonda LX-6	t	2	2021-06-18 15:54:40.803+00	2021-06-18 15:54:40.803+00
20	PJL 71	Penetrômetro Pagani  TG 73-200	t	2	2021-06-18 15:56:43.699+00	2021-06-18 15:56:43.699+00
21	PJL 77	Penetrômetro Pagani  TG 73-200	t	2	2021-06-18 15:56:55.375+00	2021-06-18 15:56:55.376+00
22	PJL 01	Tripé 01	f	2	2021-06-18 15:58:47.927+00	2021-06-18 15:58:47.927+00
23	PJL 02	Tripé 02	f	2	2021-06-18 15:59:09.331+00	2021-06-18 15:59:09.331+00
24	PJL 21	Caminhão Rollon Off	f	2	2021-06-18 16:00:31.856+00	2021-06-18 16:00:31.856+00
25	PJL 18	Caminhão Baú	f	2	2021-06-18 16:00:53.001+00	2021-06-18 16:00:53.001+00
26	PJL 12	Caminhão Pipa	f	2	2021-06-18 16:01:19.636+00	2021-06-18 16:01:19.636+00
31	Área Vivência	Área de vivência	f	1	2021-06-22 18:05:52.773+00	2021-06-22 18:05:52.773+00
29	Container	Container	f	1	2021-06-22 18:04:20.241+00	2021-06-22 18:04:20.241+00
35	Caminhão Munch	Caminhão Munch	f	1	2021-06-22 18:12:41.718+00	2021-06-22 18:12:41.718+00
28	Torre de iluminação	Torre de iluminação	f	1	2021-06-22 18:02:41.29+00	2021-06-22 18:02:41.29+00
27	Banheiro Químico	Banheiro Químico	f	1	2021-06-22 18:01:53.771+00	2021-06-22 18:01:53.771+00
32	Caminhão Pipa	Caminhão Pipa	f	1	2021-06-22 18:08:50.808+00	2021-06-22 18:08:50.808+00
33	Caminhão Rollon	Caminhão Rollon	f	1	2021-06-22 18:09:18.519+00	2021-06-22 18:09:18.519+00
1	Caminhonete	Caminhonete	f	1	2021-05-12 13:53:09.849+00	2021-05-12 13:53:09.849+00
39	PJL-002	SDH-400	t	1	2021-06-27 22:28:00.807+00	2021-06-27 22:28:00.807+00
40	PJL-016	DB525	t	1	2021-06-27 22:28:21.984+00	2021-06-27 22:28:21.984+00
4	PJL-001	SDH-400	t	1	2021-06-01 18:56:35.818+00	2021-06-01 18:56:35.818+00
30	Retroescavadeira	Retroescavadeira	f	1	2021-06-22 18:05:02.945+00	2021-06-22 18:05:02.945+00
42	Mangueira plástica - 40 m	Mangueira plástica 	f	1	2021-07-11 14:56:09.185+00	2021-07-11 14:56:09.185+00
41	Mangueira plástica - 60 m	Mangueira plástica 	f	1	2021-07-01 20:59:44.192+00	2021-07-01 20:59:44.192+00
43	Mangueira plástica - 30 m	Mangueira plástica 	f	1	2021-07-11 14:57:30.589+00	2021-07-11 14:57:30.589+00
44	PJL-104	SDH-400	t	3	2021-07-11 17:20:22.108+00	2021-07-11 17:20:22.108+00
45	PJL-41	SDH-400	t	3	2021-07-11 17:20:33.855+00	2021-07-11 17:20:33.855+00
\.


--
-- Data for Name: estruturas; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.estruturas (id, nome, contrato_id, mina_id, created_at, updated_at) FROM stdin;
1	PDE São João	1	1	2021-05-13 22:22:33.162+00	2021-05-13 22:22:33.162+00
3	PDE São João	\N	3	2021-06-18 11:46:36.87+00	2021-06-18 11:46:36.87+00
4	PDE Sul	\N	3	2021-06-18 11:46:47.235+00	2021-06-18 11:46:47.235+00
5	Barragem Sul	\N	3	2021-06-18 11:46:56.117+00	2021-06-18 11:46:56.117+00
6	PDR CMD	\N	3	2021-06-18 11:47:05.476+00	2021-06-18 11:47:05.476+00
7	SP-1	2	4	2021-06-20 18:33:37.99+00	2021-06-20 18:33:37.99+00
8	SP-2/3 SUL	2	4	2021-06-20 18:34:10.694+00	2021-06-20 18:34:10.694+00
9	SP-2/3 NORTE	2	4	2021-06-20 18:34:36.601+00	2021-06-20 18:34:36.601+00
10	TP-1	2	4	2021-06-20 18:35:08.154+00	2021-06-20 18:35:08.154+00
11	TP-2	2	4	2021-06-20 18:35:19.296+00	2021-06-20 18:35:19.296+00
12	SP-4 NORTE	2	4	2021-06-20 18:36:04.336+00	2021-06-20 18:36:04.336+00
13	SP-4 SUL	2	4	2021-06-20 18:36:18.657+00	2021-06-20 18:36:18.657+00
14	SP-4 LESTE	2	4	2021-06-20 18:36:56.752+00	2021-06-20 18:36:56.752+00
15	TP-3	2	4	2021-06-20 18:37:05.977+00	2021-06-20 18:37:05.977+00
16	SP-5 LESTE	2	4	2021-06-20 18:37:34.208+00	2021-06-20 18:37:34.208+00
17	SP-5 OESTE	2	4	2021-06-20 18:37:57.239+00	2021-06-20 18:37:57.239+00
18	SP-6	2	4	2021-06-20 18:38:24.56+00	2021-06-20 18:38:24.56+00
19	SP-7A	2	4	2021-06-20 18:38:43.872+00	2021-06-20 18:38:43.872+00
20	SP-7B	2	4	2021-06-20 18:38:54.941+00	2021-06-20 18:38:54.941+00
21	SP-7C	2	4	2021-06-20 18:39:04.973+00	2021-06-20 18:39:04.973+00
22	SP-8	2	4	2021-06-20 18:39:19.679+00	2021-06-20 18:39:19.679+00
23	SP-9	2	4	2021-06-20 18:39:26.718+00	2021-06-20 18:39:26.718+00
24	SP-9A	2	4	2021-06-20 18:39:38.642+00	2021-06-20 18:39:38.642+00
25	SP-10	2	4	2021-06-20 18:39:52.072+00	2021-06-20 18:39:52.072+00
26	SP-11	2	4	2021-06-20 18:40:00.143+00	2021-06-20 18:40:00.143+00
27	SP-12	2	4	2021-06-20 18:40:12.389+00	2021-06-20 18:40:12.39+00
28	SP-13	2	4	2021-06-20 18:40:22.15+00	2021-06-20 18:40:22.15+00
29	SP-14	2	4	2021-06-20 18:41:02.631+00	2021-06-20 18:41:02.631+00
30	SP-15	2	4	2021-06-20 18:41:22.114+00	2021-06-20 18:41:22.114+00
31	SP-16	2	4	2021-06-20 18:41:33.869+00	2021-06-20 18:41:33.869+00
32	SP-19	2	4	2021-06-20 18:42:00.991+00	2021-06-20 18:42:00.991+00
33	SP-25	2	4	2021-06-20 18:43:35.298+00	2021-06-20 18:43:35.298+00
34	Área da Geologia	2	5	2021-06-20 18:50:02.99+00	2021-06-20 18:50:02.99+00
35	PDE SUL	1	1	2021-06-21 22:00:14.374+00	2021-06-21 22:00:14.374+00
36	Barragem Sul	1	1	2021-06-21 22:00:27.459+00	2021-06-21 22:00:27.459+00
37	Barragem Maravilhas III	3	6	2021-07-11 17:18:54.769+00	2021-07-11 17:18:54.769+00
\.


--
-- Data for Name: furos; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.furos (id, nome, contrato_id, estrutura_id, created_at, updated_at) FROM stdin;
4	SM-SJ-01	\N	3	2021-06-18 11:47:17.721+00	2021-06-18 11:47:17.721+00
5	 SP4S-CPTu-03	2	13	2021-06-20 18:46:07.611+00	2021-06-20 18:46:07.611+00
6	UP09-SPT-01	2	34	2021-06-20 18:50:38.006+00	2021-06-20 18:50:38.006+00
7	UP09-SPT-02	2	34	2021-06-20 18:50:46.487+00	2021-06-20 18:50:46.487+00
8	UP09-SPT-03	2	34	2021-06-20 18:50:53.697+00	2021-06-20 18:50:53.697+00
9	UP09-SPT-04	2	34	2021-06-20 18:51:00.661+00	2021-06-20 18:51:00.661+00
10	UP09-SPT-05	2	34	2021-06-20 18:51:08.488+00	2021-06-20 18:51:08.488+00
1	SM-SJ-17G1	1	1	2021-05-13 22:22:42.372+00	2021-05-13 22:22:42.372+00
11	GST-SM-01	1	36	2021-06-27 23:02:17.062+00	2021-06-27 23:02:17.062+00
12	SM-03	1	35	2021-06-28 01:16:15.399+00	2021-06-28 01:16:15.399+00
13	SM-03A	1	35	2021-06-28 01:16:23.966+00	2021-06-28 01:16:23.966+00
14	SM-SJ-07G3	1	1	2021-06-28 18:36:36.636+00	2021-06-28 18:36:36.636+00
15	SM-SJ-07G4	1	1	2021-06-28 18:36:47.588+00	2021-06-28 18:36:47.588+00
16	SM-SJ-17G2	1	1	2021-06-28 20:24:08.786+00	2021-06-28 20:24:08.787+00
17	SM-SJ-17G3	1	1	2021-06-28 20:31:14.716+00	2021-06-28 20:31:14.717+00
18	SM-SJ-17G4	1	1	2021-06-30 19:42:54.813+00	2021-06-30 19:42:54.813+00
19	GST-SM-03	1	36	2021-07-10 22:21:06.304+00	2021-07-10 22:21:06.304+00
20	SM-01	1	35	2021-07-12 01:07:31.833+00	2021-07-12 01:07:31.833+00
21	SM-03B	1	35	2021-07-13 00:32:59.962+00	2021-07-13 00:32:59.962+00
\.


--
-- Data for Name: minas; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.minas (id, nome, contrato_id, complexo_id, created_at, updated_at) FROM stdin;
1	Mina de Brucutu	1	1	2021-05-13 22:22:23.536+00	2021-05-13 22:22:23.536+00
3	Brucutu	\N	3	2021-06-18 11:46:26.504+00	2021-06-18 11:46:26.504+00
4	Barragem	2	4	2021-06-20 18:29:39.311+00	2021-06-20 18:29:39.311+00
5	Saracá	2	4	2021-06-20 18:49:31.983+00	2021-06-20 18:49:31.983+00
6	Mina do Pico	3	5	2021-07-11 17:18:41.82+00	2021-07-11 17:18:41.82+00
\.


--
-- Data for Name: rdo_users; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.rdo_users (id, rdo_id, user_id, created_at, updated_at) FROM stdin;
837	112	68	2021-07-13 00:23:44.247+00	2021-07-13 00:23:44.247+00
838	112	51	2021-07-13 00:23:44.249+00	2021-07-13 00:23:44.249+00
839	112	55	2021-07-13 00:23:44.25+00	2021-07-13 00:23:44.25+00
840	112	44	2021-07-13 00:23:44.251+00	2021-07-13 00:23:44.251+00
841	112	71	2021-07-13 00:23:44.253+00	2021-07-13 00:23:44.253+00
842	112	72	2021-07-13 00:23:44.255+00	2021-07-13 00:23:44.255+00
843	112	67	2021-07-13 00:23:44.257+00	2021-07-13 00:23:44.257+00
844	112	43	2021-07-13 00:23:44.258+00	2021-07-13 00:23:44.258+00
845	112	59	2021-07-13 00:23:44.259+00	2021-07-13 00:23:44.259+00
846	112	69	2021-07-13 00:23:44.261+00	2021-07-13 00:23:44.261+00
858	114	68	2021-07-13 01:05:55.992+00	2021-07-13 01:05:55.992+00
859	114	65	2021-07-13 01:05:55.994+00	2021-07-13 01:05:55.994+00
860	114	61	2021-07-13 01:05:55.995+00	2021-07-13 01:05:55.995+00
861	114	41	2021-07-13 01:05:55.997+00	2021-07-13 01:05:55.997+00
862	114	72	2021-07-13 01:05:55.998+00	2021-07-13 01:05:55.998+00
863	114	33	2021-07-13 01:05:56+00	2021-07-13 01:05:56+00
864	114	43	2021-07-13 01:05:56.002+00	2021-07-13 01:05:56.002+00
865	114	59	2021-07-13 01:05:56.003+00	2021-07-13 01:05:56.003+00
866	114	38	2021-07-13 01:05:56.004+00	2021-07-13 01:05:56.004+00
867	114	56	2021-07-13 01:05:56.006+00	2021-07-13 01:05:56.006+00
868	114	69	2021-07-13 01:05:56.007+00	2021-07-13 01:05:56.007+00
869	115	68	2021-07-13 11:25:18.041+00	2021-07-13 11:25:18.041+00
870	115	62	2021-07-13 11:25:18.045+00	2021-07-13 11:25:18.045+00
871	115	33	2021-07-13 11:25:18.046+00	2021-07-13 11:25:18.046+00
872	115	35	2021-07-13 11:25:18.048+00	2021-07-13 11:25:18.048+00
873	115	44	2021-07-13 11:25:18.05+00	2021-07-13 11:25:18.05+00
142	28	68	2021-06-30 19:49:39.543+00	2021-06-30 19:49:39.543+00
143	28	46	2021-06-30 19:49:39.544+00	2021-06-30 19:49:39.544+00
144	28	61	2021-06-30 19:49:39.546+00	2021-06-30 19:49:39.546+00
145	28	41	2021-06-30 19:49:39.547+00	2021-06-30 19:49:39.547+00
146	28	66	2021-06-30 19:49:39.549+00	2021-06-30 19:49:39.549+00
147	28	38	2021-06-30 19:49:39.55+00	2021-06-30 19:49:39.55+00
148	28	59	2021-06-30 19:49:39.551+00	2021-06-30 19:49:39.551+00
847	113	74	2021-07-13 00:34:11.301+00	2021-07-13 00:34:11.301+00
848	113	51	2021-07-13 00:34:11.302+00	2021-07-13 00:34:11.302+00
849	113	55	2021-07-13 00:34:11.304+00	2021-07-13 00:34:11.304+00
850	113	48	2021-07-13 00:34:11.305+00	2021-07-13 00:34:11.305+00
851	113	71	2021-07-13 00:34:11.307+00	2021-07-13 00:34:11.307+00
852	113	67	2021-07-13 00:34:11.308+00	2021-07-13 00:34:11.308+00
853	113	43	2021-07-13 00:34:11.31+00	2021-07-13 00:34:11.31+00
854	113	38	2021-07-13 00:34:11.311+00	2021-07-13 00:34:11.311+00
855	113	69	2021-07-13 00:34:11.312+00	2021-07-13 00:34:11.312+00
856	113	59	2021-07-13 00:34:11.316+00	2021-07-13 00:34:11.316+00
857	113	56	2021-07-13 00:34:11.317+00	2021-07-13 00:34:11.317+00
874	116	74	2021-07-13 23:04:07.92+00	2021-07-13 23:04:07.92+00
875	116	51	2021-07-13 23:04:07.922+00	2021-07-13 23:04:07.922+00
876	116	55	2021-07-13 23:04:07.923+00	2021-07-13 23:04:07.923+00
877	116	48	2021-07-13 23:04:07.925+00	2021-07-13 23:04:07.925+00
878	116	71	2021-07-13 23:04:07.926+00	2021-07-13 23:04:07.926+00
879	116	67	2021-07-13 23:04:07.928+00	2021-07-13 23:04:07.928+00
880	116	43	2021-07-13 23:04:07.929+00	2021-07-13 23:04:07.929+00
881	116	38	2021-07-13 23:04:07.93+00	2021-07-13 23:04:07.93+00
882	116	69	2021-07-13 23:04:07.932+00	2021-07-13 23:04:07.932+00
883	116	59	2021-07-13 23:04:07.933+00	2021-07-13 23:04:07.933+00
388	58	68	2021-07-12 09:49:37.647+00	2021-07-12 09:49:37.647+00
389	58	47	2021-07-12 09:49:37.65+00	2021-07-12 09:49:37.65+00
390	58	58	2021-07-12 09:49:37.651+00	2021-07-12 09:49:37.651+00
391	58	40	2021-07-12 09:49:37.652+00	2021-07-12 09:49:37.652+00
392	58	71	2021-07-12 09:49:37.654+00	2021-07-12 09:49:37.654+00
393	58	66	2021-07-12 09:49:37.655+00	2021-07-12 09:49:37.655+00
394	58	38	2021-07-12 09:49:37.656+00	2021-07-12 09:49:37.656+00
395	58	43	2021-07-12 09:49:37.658+00	2021-07-12 09:49:37.658+00
396	58	59	2021-07-12 09:49:37.659+00	2021-07-12 09:49:37.659+00
397	58	69	2021-07-12 09:49:37.66+00	2021-07-12 09:49:37.66+00
398	59	68	2021-07-12 09:49:43.384+00	2021-07-12 09:49:43.384+00
399	59	46	2021-07-12 09:49:43.385+00	2021-07-12 09:49:43.385+00
400	59	61	2021-07-12 09:49:43.386+00	2021-07-12 09:49:43.386+00
401	59	41	2021-07-12 09:49:43.388+00	2021-07-12 09:49:43.388+00
402	59	66	2021-07-12 09:49:43.389+00	2021-07-12 09:49:43.389+00
403	59	43	2021-07-12 09:49:43.39+00	2021-07-12 09:49:43.39+00
404	59	59	2021-07-12 09:49:43.391+00	2021-07-12 09:49:43.391+00
405	60	68	2021-07-12 09:49:47.187+00	2021-07-12 09:49:47.187+00
406	60	62	2021-07-12 09:49:47.189+00	2021-07-12 09:49:47.189+00
407	60	35	2021-07-12 09:49:47.19+00	2021-07-12 09:49:47.19+00
408	60	66	2021-07-12 09:49:47.192+00	2021-07-12 09:49:47.192+00
409	60	43	2021-07-12 09:49:47.193+00	2021-07-12 09:49:47.193+00
410	60	59	2021-07-12 09:49:47.195+00	2021-07-12 09:49:47.195+00
411	60	44	2021-07-12 09:49:47.201+00	2021-07-12 09:49:47.201+00
412	60	72	2021-07-12 09:49:47.206+00	2021-07-12 09:49:47.206+00
413	61	68	2021-07-12 09:49:50.407+00	2021-07-12 09:49:50.407+00
414	61	51	2021-07-12 09:49:50.409+00	2021-07-12 09:49:50.409+00
415	61	55	2021-07-12 09:49:50.411+00	2021-07-12 09:49:50.411+00
416	61	48	2021-07-12 09:49:50.412+00	2021-07-12 09:49:50.412+00
417	61	71	2021-07-12 09:49:50.414+00	2021-07-12 09:49:50.414+00
418	61	72	2021-07-12 09:49:50.415+00	2021-07-12 09:49:50.415+00
419	61	67	2021-07-12 09:49:50.417+00	2021-07-12 09:49:50.417+00
420	61	38	2021-07-12 09:49:50.418+00	2021-07-12 09:49:50.418+00
421	61	43	2021-07-12 09:49:50.419+00	2021-07-12 09:49:50.419+00
422	61	59	2021-07-12 09:49:50.42+00	2021-07-12 09:49:50.42+00
423	61	69	2021-07-12 09:49:50.423+00	2021-07-12 09:49:50.423+00
884	117	69	2021-07-14 00:15:58.823+00	2021-07-14 00:15:58.823+00
885	117	68	2021-07-14 00:15:58.825+00	2021-07-14 00:15:58.825+00
886	117	33	2021-07-14 00:15:58.826+00	2021-07-14 00:15:58.826+00
887	117	62	2021-07-14 00:15:58.829+00	2021-07-14 00:15:58.829+00
888	117	59	2021-07-14 00:15:58.83+00	2021-07-14 00:15:58.83+00
889	117	44	2021-07-14 00:15:58.831+00	2021-07-14 00:15:58.831+00
890	117	71	2021-07-14 00:15:58.833+00	2021-07-14 00:15:58.833+00
891	117	43	2021-07-14 00:15:58.834+00	2021-07-14 00:15:58.834+00
892	117	35	2021-07-14 00:15:58.835+00	2021-07-14 00:15:58.835+00
434	63	68	2021-07-12 09:49:58.161+00	2021-07-12 09:49:58.161+00
435	63	46	2021-07-12 09:49:58.162+00	2021-07-12 09:49:58.162+00
436	63	41	2021-07-12 09:49:58.163+00	2021-07-12 09:49:58.163+00
437	63	61	2021-07-12 09:49:58.165+00	2021-07-12 09:49:58.165+00
438	63	71	2021-07-12 09:49:58.166+00	2021-07-12 09:49:58.166+00
439	63	66	2021-07-12 09:49:58.167+00	2021-07-12 09:49:58.167+00
440	63	43	2021-07-12 09:49:58.168+00	2021-07-12 09:49:58.168+00
441	63	59	2021-07-12 09:49:58.169+00	2021-07-12 09:49:58.169+00
442	64	68	2021-07-12 09:50:04.521+00	2021-07-12 09:50:04.521+00
443	64	62	2021-07-12 09:50:04.523+00	2021-07-12 09:50:04.523+00
444	64	59	2021-07-12 09:50:04.525+00	2021-07-12 09:50:04.525+00
445	64	44	2021-07-12 09:50:04.528+00	2021-07-12 09:50:04.528+00
446	64	35	2021-07-12 09:50:04.529+00	2021-07-12 09:50:04.529+00
447	64	66	2021-07-12 09:50:04.531+00	2021-07-12 09:50:04.531+00
448	64	43	2021-07-12 09:50:04.532+00	2021-07-12 09:50:04.532+00
449	64	38	2021-07-12 09:50:04.534+00	2021-07-12 09:50:04.534+00
450	65	68	2021-07-12 09:50:09.519+00	2021-07-12 09:50:09.519+00
451	65	51	2021-07-12 09:50:09.522+00	2021-07-12 09:50:09.522+00
452	65	55	2021-07-12 09:50:09.523+00	2021-07-12 09:50:09.523+00
453	65	48	2021-07-12 09:50:09.524+00	2021-07-12 09:50:09.524+00
454	65	71	2021-07-12 09:50:09.526+00	2021-07-12 09:50:09.526+00
455	65	66	2021-07-12 09:50:09.527+00	2021-07-12 09:50:09.527+00
456	65	38	2021-07-12 09:50:09.528+00	2021-07-12 09:50:09.528+00
457	66	68	2021-07-12 09:50:11.962+00	2021-07-12 09:50:11.962+00
458	66	47	2021-07-12 09:50:11.964+00	2021-07-12 09:50:11.964+00
459	66	58	2021-07-12 09:50:11.965+00	2021-07-12 09:50:11.965+00
460	66	70	2021-07-12 09:50:11.966+00	2021-07-12 09:50:11.966+00
461	66	72	2021-07-12 09:50:11.967+00	2021-07-12 09:50:11.967+00
462	66	71	2021-07-12 09:50:11.968+00	2021-07-12 09:50:11.968+00
463	66	66	2021-07-12 09:50:11.97+00	2021-07-12 09:50:11.97+00
464	66	38	2021-07-12 09:50:11.971+00	2021-07-12 09:50:11.971+00
465	66	43	2021-07-12 09:50:11.972+00	2021-07-12 09:50:11.972+00
466	66	59	2021-07-12 09:50:11.973+00	2021-07-12 09:50:11.973+00
467	67	68	2021-07-12 09:50:29.59+00	2021-07-12 09:50:29.59+00
468	67	35	2021-07-12 09:50:29.591+00	2021-07-12 09:50:29.591+00
469	67	61	2021-07-12 09:50:29.592+00	2021-07-12 09:50:29.592+00
470	67	41	2021-07-12 09:50:29.594+00	2021-07-12 09:50:29.594+00
471	67	72	2021-07-12 09:50:29.599+00	2021-07-12 09:50:29.599+00
472	67	66	2021-07-12 09:50:29.6+00	2021-07-12 09:50:29.6+00
473	67	38	2021-07-12 09:50:29.606+00	2021-07-12 09:50:29.606+00
474	67	59	2021-07-12 09:50:29.607+00	2021-07-12 09:50:29.607+00
475	68	68	2021-07-12 09:50:34.978+00	2021-07-12 09:50:34.978+00
476	68	62	2021-07-12 09:50:34.98+00	2021-07-12 09:50:34.98+00
477	68	44	2021-07-12 09:50:34.985+00	2021-07-12 09:50:34.985+00
478	68	72	2021-07-12 09:50:34.986+00	2021-07-12 09:50:34.986+00
479	68	66	2021-07-12 09:50:34.988+00	2021-07-12 09:50:34.988+00
480	68	38	2021-07-12 09:50:34.989+00	2021-07-12 09:50:34.989+00
481	68	59	2021-07-12 09:50:34.99+00	2021-07-12 09:50:34.99+00
482	68	52	2021-07-12 09:50:34.992+00	2021-07-12 09:50:34.992+00
483	69	68	2021-07-12 09:50:43.41+00	2021-07-12 09:50:43.41+00
484	69	51	2021-07-12 09:50:43.412+00	2021-07-12 09:50:43.412+00
485	69	55	2021-07-12 09:50:43.413+00	2021-07-12 09:50:43.413+00
486	69	48	2021-07-12 09:50:43.414+00	2021-07-12 09:50:43.414+00
487	69	71	2021-07-12 09:50:43.415+00	2021-07-12 09:50:43.415+00
488	69	72	2021-07-12 09:50:43.416+00	2021-07-12 09:50:43.416+00
489	69	67	2021-07-12 09:50:43.417+00	2021-07-12 09:50:43.417+00
490	69	38	2021-07-12 09:50:43.419+00	2021-07-12 09:50:43.419+00
491	69	43	2021-07-12 09:50:43.42+00	2021-07-12 09:50:43.42+00
492	69	59	2021-07-12 09:50:43.421+00	2021-07-12 09:50:43.421+00
493	70	68	2021-07-12 09:50:45.332+00	2021-07-12 09:50:45.333+00
494	70	47	2021-07-12 09:50:45.334+00	2021-07-12 09:50:45.334+00
495	70	58	2021-07-12 09:50:45.335+00	2021-07-12 09:50:45.335+00
496	70	70	2021-07-12 09:50:45.336+00	2021-07-12 09:50:45.336+00
497	70	72	2021-07-12 09:50:45.337+00	2021-07-12 09:50:45.337+00
498	70	71	2021-07-12 09:50:45.338+00	2021-07-12 09:50:45.338+00
499	70	66	2021-07-12 09:50:45.339+00	2021-07-12 09:50:45.339+00
500	70	43	2021-07-12 09:50:45.34+00	2021-07-12 09:50:45.34+00
501	70	59	2021-07-12 09:50:45.341+00	2021-07-12 09:50:45.341+00
502	70	69	2021-07-12 09:50:45.342+00	2021-07-12 09:50:45.342+00
503	71	68	2021-07-12 09:50:54.212+00	2021-07-12 09:50:54.212+00
504	71	46	2021-07-12 09:50:54.213+00	2021-07-12 09:50:54.213+00
505	71	61	2021-07-12 09:50:54.215+00	2021-07-12 09:50:54.215+00
506	71	41	2021-07-12 09:50:54.216+00	2021-07-12 09:50:54.216+00
507	71	71	2021-07-12 09:50:54.217+00	2021-07-12 09:50:54.217+00
508	71	66	2021-07-12 09:50:54.219+00	2021-07-12 09:50:54.219+00
509	71	43	2021-07-12 09:50:54.22+00	2021-07-12 09:50:54.22+00
510	71	59	2021-07-12 09:50:54.222+00	2021-07-12 09:50:54.222+00
511	72	68	2021-07-12 09:50:59.69+00	2021-07-12 09:50:59.69+00
512	72	62	2021-07-12 09:50:59.691+00	2021-07-12 09:50:59.691+00
513	72	44	2021-07-12 09:50:59.695+00	2021-07-12 09:50:59.695+00
514	72	72	2021-07-12 09:50:59.696+00	2021-07-12 09:50:59.696+00
515	72	66	2021-07-12 09:50:59.697+00	2021-07-12 09:50:59.697+00
516	72	43	2021-07-12 09:50:59.699+00	2021-07-12 09:50:59.699+00
517	72	39	2021-07-12 09:50:59.7+00	2021-07-12 09:50:59.7+00
518	72	52	2021-07-12 09:50:59.701+00	2021-07-12 09:50:59.701+00
519	73	68	2021-07-12 09:51:04.017+00	2021-07-12 09:51:04.017+00
520	73	51	2021-07-12 09:51:04.019+00	2021-07-12 09:51:04.019+00
521	73	55	2021-07-12 09:51:04.02+00	2021-07-12 09:51:04.02+00
522	73	48	2021-07-12 09:51:04.021+00	2021-07-12 09:51:04.021+00
523	73	71	2021-07-12 09:51:04.022+00	2021-07-12 09:51:04.022+00
524	73	67	2021-07-12 09:51:04.023+00	2021-07-12 09:51:04.023+00
525	73	43	2021-07-12 09:51:04.025+00	2021-07-12 09:51:04.025+00
526	73	59	2021-07-12 09:51:04.026+00	2021-07-12 09:51:04.026+00
527	74	68	2021-07-12 09:51:06.603+00	2021-07-12 09:51:06.603+00
528	74	47	2021-07-12 09:51:06.604+00	2021-07-12 09:51:06.604+00
529	74	58	2021-07-12 09:51:06.605+00	2021-07-12 09:51:06.605+00
530	74	70	2021-07-12 09:51:06.606+00	2021-07-12 09:51:06.606+00
531	74	72	2021-07-12 09:51:06.607+00	2021-07-12 09:51:06.607+00
532	74	71	2021-07-12 09:51:06.608+00	2021-07-12 09:51:06.608+00
533	74	66	2021-07-12 09:51:06.61+00	2021-07-12 09:51:06.61+00
534	74	38	2021-07-12 09:51:06.611+00	2021-07-12 09:51:06.611+00
535	74	59	2021-07-12 09:51:06.612+00	2021-07-12 09:51:06.612+00
536	74	69	2021-07-12 09:51:06.613+00	2021-07-12 09:51:06.613+00
537	75	68	2021-07-12 09:51:19.81+00	2021-07-12 09:51:19.81+00
538	75	46	2021-07-12 09:51:19.811+00	2021-07-12 09:51:19.811+00
539	75	58	2021-07-12 09:51:19.813+00	2021-07-12 09:51:19.813+00
540	75	61	2021-07-12 09:51:19.814+00	2021-07-12 09:51:19.814+00
541	75	71	2021-07-12 09:51:19.815+00	2021-07-12 09:51:19.815+00
542	75	66	2021-07-12 09:51:19.816+00	2021-07-12 09:51:19.816+00
543	75	43	2021-07-12 09:51:19.817+00	2021-07-12 09:51:19.817+00
544	75	59	2021-07-12 09:51:19.818+00	2021-07-12 09:51:19.818+00
545	75	69	2021-07-12 09:51:19.82+00	2021-07-12 09:51:19.82+00
546	76	68	2021-07-12 09:51:30.527+00	2021-07-12 09:51:30.527+00
547	76	62	2021-07-12 09:51:30.528+00	2021-07-12 09:51:30.528+00
548	76	44	2021-07-12 09:51:30.529+00	2021-07-12 09:51:30.529+00
549	76	52	2021-07-12 09:51:30.53+00	2021-07-12 09:51:30.53+00
550	76	72	2021-07-12 09:51:30.531+00	2021-07-12 09:51:30.531+00
551	76	66	2021-07-12 09:51:30.533+00	2021-07-12 09:51:30.533+00
552	76	43	2021-07-12 09:51:30.534+00	2021-07-12 09:51:30.534+00
553	76	59	2021-07-12 09:51:30.535+00	2021-07-12 09:51:30.535+00
554	77	68	2021-07-12 09:51:36.351+00	2021-07-12 09:51:36.351+00
555	77	62	2021-07-12 09:51:36.352+00	2021-07-12 09:51:36.352+00
556	77	44	2021-07-12 09:51:36.353+00	2021-07-12 09:51:36.353+00
557	77	72	2021-07-12 09:51:36.354+00	2021-07-12 09:51:36.361+00
558	77	66	2021-07-12 09:51:36.362+00	2021-07-12 09:51:36.362+00
559	77	43	2021-07-12 09:51:36.364+00	2021-07-12 09:51:36.364+00
560	77	52	2021-07-12 09:51:36.365+00	2021-07-12 09:51:36.365+00
561	77	59	2021-07-12 09:51:36.37+00	2021-07-12 09:51:36.37+00
592	82	68	2021-07-12 09:51:57.9+00	2021-07-12 09:51:57.9+00
593	82	51	2021-07-12 09:51:57.901+00	2021-07-12 09:51:57.901+00
594	82	48	2021-07-12 09:51:57.902+00	2021-07-12 09:51:57.902+00
595	82	71	2021-07-12 09:51:57.903+00	2021-07-12 09:51:57.903+00
596	82	67	2021-07-12 09:51:57.905+00	2021-07-12 09:51:57.905+00
597	82	38	2021-07-12 09:51:57.906+00	2021-07-12 09:51:57.906+00
639	88	68	2021-07-12 09:52:24.685+00	2021-07-12 09:52:24.685+00
640	88	62	2021-07-12 09:52:24.687+00	2021-07-12 09:52:24.687+00
641	88	44	2021-07-12 09:52:24.688+00	2021-07-12 09:52:24.688+00
642	88	72	2021-07-12 09:52:24.69+00	2021-07-12 09:52:24.69+00
643	88	66	2021-07-12 09:52:24.691+00	2021-07-12 09:52:24.691+00
644	88	43	2021-07-12 09:52:24.692+00	2021-07-12 09:52:24.692+00
645	88	59	2021-07-12 09:52:24.694+00	2021-07-12 09:52:24.694+00
562	78	68	2021-07-12 09:51:40.426+00	2021-07-12 09:51:40.426+00
563	78	51	2021-07-12 09:51:40.427+00	2021-07-12 09:51:40.427+00
564	78	55	2021-07-12 09:51:40.428+00	2021-07-12 09:51:40.428+00
565	78	71	2021-07-12 09:51:40.429+00	2021-07-12 09:51:40.429+00
566	78	67	2021-07-12 09:51:40.43+00	2021-07-12 09:51:40.43+00
567	78	38	2021-07-12 09:51:40.432+00	2021-07-12 09:51:40.432+00
568	79	68	2021-07-12 09:51:45.242+00	2021-07-12 09:51:45.242+00
569	79	47	2021-07-12 09:51:45.244+00	2021-07-12 09:51:45.244+00
570	79	58	2021-07-12 09:51:45.245+00	2021-07-12 09:51:45.245+00
571	79	70	2021-07-12 09:51:45.246+00	2021-07-12 09:51:45.246+00
572	79	72	2021-07-12 09:51:45.247+00	2021-07-12 09:51:45.247+00
573	79	66	2021-07-12 09:51:45.249+00	2021-07-12 09:51:45.249+00
574	79	38	2021-07-12 09:51:45.25+00	2021-07-12 09:51:45.25+00
575	79	59	2021-07-12 09:51:45.251+00	2021-07-12 09:51:45.251+00
576	79	69	2021-07-12 09:51:45.252+00	2021-07-12 09:51:45.252+00
577	80	68	2021-07-12 09:51:48.856+00	2021-07-12 09:51:48.856+00
578	80	62	2021-07-12 09:51:48.857+00	2021-07-12 09:51:48.857+00
579	80	44	2021-07-12 09:51:48.859+00	2021-07-12 09:51:48.859+00
580	80	72	2021-07-12 09:51:48.86+00	2021-07-12 09:51:48.86+00
581	80	66	2021-07-12 09:51:48.862+00	2021-07-12 09:51:48.862+00
582	80	38	2021-07-12 09:51:48.863+00	2021-07-12 09:51:48.863+00
583	80	59	2021-07-12 09:51:48.864+00	2021-07-12 09:51:48.864+00
622	86	68	2021-07-12 09:52:18.26+00	2021-07-12 09:52:18.26+00
623	86	51	2021-07-12 09:52:18.262+00	2021-07-12 09:52:18.262+00
624	86	48	2021-07-12 09:52:18.264+00	2021-07-12 09:52:18.264+00
625	86	55	2021-07-12 09:52:18.265+00	2021-07-12 09:52:18.265+00
626	86	71	2021-07-12 09:52:18.267+00	2021-07-12 09:52:18.267+00
627	86	67	2021-07-12 09:52:18.269+00	2021-07-12 09:52:18.269+00
628	86	38	2021-07-12 09:52:18.271+00	2021-07-12 09:52:18.271+00
646	89	68	2021-07-12 09:52:30.514+00	2021-07-12 09:52:30.514+00
647	89	65	2021-07-12 09:52:30.516+00	2021-07-12 09:52:30.516+00
648	89	41	2021-07-12 09:52:30.517+00	2021-07-12 09:52:30.517+00
649	89	61	2021-07-12 09:52:30.519+00	2021-07-12 09:52:30.519+00
650	89	72	2021-07-12 09:52:30.52+00	2021-07-12 09:52:30.52+00
651	89	66	2021-07-12 09:52:30.522+00	2021-07-12 09:52:30.522+00
652	89	43	2021-07-12 09:52:30.524+00	2021-07-12 09:52:30.524+00
653	89	59	2021-07-12 09:52:30.525+00	2021-07-12 09:52:30.525+00
584	81	68	2021-07-12 09:51:52.459+00	2021-07-12 09:51:52.459+00
585	81	65	2021-07-12 09:51:52.46+00	2021-07-12 09:51:52.46+00
586	81	61	2021-07-12 09:51:52.462+00	2021-07-12 09:51:52.462+00
587	81	41	2021-07-12 09:51:52.463+00	2021-07-12 09:51:52.463+00
588	81	72	2021-07-12 09:51:52.464+00	2021-07-12 09:51:52.464+00
589	81	66	2021-07-12 09:51:52.465+00	2021-07-12 09:51:52.465+00
590	81	38	2021-07-12 09:51:52.466+00	2021-07-12 09:51:52.466+00
591	81	59	2021-07-12 09:51:52.467+00	2021-07-12 09:51:52.467+00
598	83	68	2021-07-12 09:52:04.576+00	2021-07-12 09:52:04.576+00
599	83	47	2021-07-12 09:52:04.577+00	2021-07-12 09:52:04.577+00
600	83	58	2021-07-12 09:52:04.579+00	2021-07-12 09:52:04.579+00
601	83	70	2021-07-12 09:52:04.58+00	2021-07-12 09:52:04.58+00
602	83	72	2021-07-12 09:52:04.581+00	2021-07-12 09:52:04.581+00
603	83	66	2021-07-12 09:52:04.582+00	2021-07-12 09:52:04.582+00
604	83	38	2021-07-12 09:52:04.584+00	2021-07-12 09:52:04.584+00
605	83	59	2021-07-12 09:52:04.586+00	2021-07-12 09:52:04.586+00
606	83	69	2021-07-12 09:52:04.587+00	2021-07-12 09:52:04.587+00
607	84	68	2021-07-12 09:52:08.952+00	2021-07-12 09:52:08.952+00
608	84	62	2021-07-12 09:52:08.954+00	2021-07-12 09:52:08.954+00
609	84	52	2021-07-12 09:52:08.955+00	2021-07-12 09:52:08.955+00
610	84	44	2021-07-12 09:52:08.956+00	2021-07-12 09:52:08.956+00
611	84	66	2021-07-12 09:52:08.966+00	2021-07-12 09:52:08.966+00
612	84	43	2021-07-12 09:52:08.97+00	2021-07-12 09:52:08.97+00
613	84	38	2021-07-12 09:52:08.973+00	2021-07-12 09:52:08.973+00
614	84	59	2021-07-12 09:52:08.976+00	2021-07-12 09:52:08.976+00
615	85	68	2021-07-12 09:52:12.086+00	2021-07-12 09:52:12.086+00
616	85	65	2021-07-12 09:52:12.088+00	2021-07-12 09:52:12.088+00
617	85	41	2021-07-12 09:52:12.09+00	2021-07-12 09:52:12.09+00
618	85	66	2021-07-12 09:52:12.092+00	2021-07-12 09:52:12.092+00
619	85	43	2021-07-12 09:52:12.093+00	2021-07-12 09:52:12.093+00
620	85	38	2021-07-12 09:52:12.096+00	2021-07-12 09:52:12.096+00
621	85	59	2021-07-12 09:52:12.098+00	2021-07-12 09:52:12.098+00
629	87	68	2021-07-12 09:52:20.833+00	2021-07-12 09:52:20.833+00
630	87	47	2021-07-12 09:52:20.835+00	2021-07-12 09:52:20.835+00
631	87	58	2021-07-12 09:52:20.837+00	2021-07-12 09:52:20.837+00
632	87	70	2021-07-12 09:52:20.839+00	2021-07-12 09:52:20.839+00
633	87	71	2021-07-12 09:52:20.84+00	2021-07-12 09:52:20.84+00
634	87	72	2021-07-12 09:52:20.842+00	2021-07-12 09:52:20.842+00
635	87	66	2021-07-12 09:52:20.844+00	2021-07-12 09:52:20.844+00
636	87	38	2021-07-12 09:52:20.845+00	2021-07-12 09:52:20.845+00
637	87	59	2021-07-12 09:52:20.847+00	2021-07-12 09:52:20.847+00
638	87	69	2021-07-12 09:52:20.848+00	2021-07-12 09:52:20.848+00
654	90	68	2021-07-12 09:52:33.179+00	2021-07-12 09:52:33.179+00
655	90	51	2021-07-12 09:52:33.18+00	2021-07-12 09:52:33.18+00
656	90	48	2021-07-12 09:52:33.181+00	2021-07-12 09:52:33.181+00
657	90	44	2021-07-12 09:52:33.183+00	2021-07-12 09:52:33.183+00
658	90	71	2021-07-12 09:52:33.184+00	2021-07-12 09:52:33.184+00
659	90	55	2021-07-12 09:52:33.186+00	2021-07-12 09:52:33.186+00
660	90	67	2021-07-12 09:52:33.187+00	2021-07-12 09:52:33.187+00
661	90	38	2021-07-12 09:52:33.188+00	2021-07-12 09:52:33.188+00
662	91	68	2021-07-12 09:52:38.611+00	2021-07-12 09:52:38.611+00
663	91	47	2021-07-12 09:52:38.613+00	2021-07-12 09:52:38.613+00
664	91	58	2021-07-12 09:52:38.615+00	2021-07-12 09:52:38.615+00
665	91	70	2021-07-12 09:52:38.616+00	2021-07-12 09:52:38.616+00
666	91	66	2021-07-12 09:52:38.618+00	2021-07-12 09:52:38.618+00
667	91	43	2021-07-12 09:52:38.619+00	2021-07-12 09:52:38.619+00
668	91	38	2021-07-12 09:52:38.621+00	2021-07-12 09:52:38.621+00
669	91	59	2021-07-12 09:52:38.623+00	2021-07-12 09:52:38.623+00
670	91	69	2021-07-12 09:52:38.624+00	2021-07-12 09:52:38.624+00
671	92	68	2021-07-12 09:52:46.42+00	2021-07-12 09:52:46.42+00
672	92	62	2021-07-12 09:52:46.421+00	2021-07-12 09:52:46.421+00
673	92	44	2021-07-12 09:52:46.423+00	2021-07-12 09:52:46.423+00
674	92	52	2021-07-12 09:52:46.424+00	2021-07-12 09:52:46.424+00
675	92	71	2021-07-12 09:52:46.425+00	2021-07-12 09:52:46.425+00
676	92	66	2021-07-12 09:52:46.427+00	2021-07-12 09:52:46.427+00
677	92	43	2021-07-12 09:52:46.428+00	2021-07-12 09:52:46.428+00
678	92	38	2021-07-12 09:52:46.43+00	2021-07-12 09:52:46.43+00
679	92	59	2021-07-12 09:52:46.431+00	2021-07-12 09:52:46.431+00
680	93	68	2021-07-12 09:53:24.757+00	2021-07-12 09:53:24.757+00
681	93	51	2021-07-12 09:53:24.759+00	2021-07-12 09:53:24.759+00
682	93	48	2021-07-12 09:53:24.76+00	2021-07-12 09:53:24.76+00
683	93	55	2021-07-12 09:53:24.762+00	2021-07-12 09:53:24.762+00
684	93	71	2021-07-12 09:53:24.763+00	2021-07-12 09:53:24.763+00
685	93	67	2021-07-12 09:53:24.765+00	2021-07-12 09:53:24.765+00
686	93	38	2021-07-12 09:53:24.77+00	2021-07-12 09:53:24.77+00
687	94	68	2021-07-12 09:53:43.125+00	2021-07-12 09:53:43.125+00
688	94	62	2021-07-12 09:53:43.128+00	2021-07-12 09:53:43.128+00
689	94	44	2021-07-12 09:53:43.13+00	2021-07-12 09:53:43.13+00
690	94	72	2021-07-12 09:53:43.131+00	2021-07-12 09:53:43.132+00
691	94	66	2021-07-12 09:53:43.133+00	2021-07-12 09:53:43.133+00
692	94	43	2021-07-12 09:53:43.135+00	2021-07-12 09:53:43.135+00
693	94	59	2021-07-12 09:53:43.136+00	2021-07-12 09:53:43.136+00
694	95	68	2021-07-12 09:53:46.743+00	2021-07-12 09:53:46.744+00
695	95	47	2021-07-12 09:53:46.745+00	2021-07-12 09:53:46.745+00
696	95	70	2021-07-12 09:53:46.748+00	2021-07-12 09:53:46.748+00
697	95	72	2021-07-12 09:53:46.749+00	2021-07-12 09:53:46.749+00
698	95	66	2021-07-12 09:53:46.751+00	2021-07-12 09:53:46.751+00
699	95	38	2021-07-12 09:53:46.752+00	2021-07-12 09:53:46.752+00
700	95	59	2021-07-12 09:53:46.754+00	2021-07-12 09:53:46.754+00
701	96	68	2021-07-12 09:54:07.173+00	2021-07-12 09:54:07.173+00
702	96	59	2021-07-12 09:54:07.175+00	2021-07-12 09:54:07.175+00
703	96	62	2021-07-12 09:54:07.176+00	2021-07-12 09:54:07.176+00
704	96	44	2021-07-12 09:54:07.177+00	2021-07-12 09:54:07.177+00
705	96	72	2021-07-12 09:54:07.179+00	2021-07-12 09:54:07.179+00
706	96	66	2021-07-12 09:54:07.182+00	2021-07-12 09:54:07.182+00
707	96	43	2021-07-12 09:54:07.183+00	2021-07-12 09:54:07.183+00
708	97	68	2021-07-12 09:54:10.92+00	2021-07-12 09:54:10.92+00
709	97	46	2021-07-12 09:54:10.926+00	2021-07-12 09:54:10.926+00
710	97	75	2021-07-12 09:54:10.927+00	2021-07-12 09:54:10.927+00
711	97	76	2021-07-12 09:54:10.928+00	2021-07-12 09:54:10.928+00
712	97	72	2021-07-12 09:54:10.93+00	2021-07-12 09:54:10.93+00
713	97	66	2021-07-12 09:54:10.931+00	2021-07-12 09:54:10.931+00
714	97	43	2021-07-12 09:54:10.932+00	2021-07-12 09:54:10.932+00
715	97	59	2021-07-12 09:54:10.934+00	2021-07-12 09:54:10.934+00
722	99	68	2021-07-12 09:54:25.473+00	2021-07-12 09:54:25.473+00
723	99	47	2021-07-12 09:54:25.475+00	2021-07-12 09:54:25.475+00
724	99	48	2021-07-12 09:54:25.476+00	2021-07-12 09:54:25.476+00
725	99	70	2021-07-12 09:54:25.478+00	2021-07-12 09:54:25.478+00
726	99	71	2021-07-12 09:54:25.479+00	2021-07-12 09:54:25.479+00
727	99	72	2021-07-12 09:54:25.484+00	2021-07-12 09:54:25.484+00
728	99	66	2021-07-12 09:54:25.486+00	2021-07-12 09:54:25.487+00
729	99	38	2021-07-12 09:54:25.488+00	2021-07-12 09:54:25.488+00
730	99	43	2021-07-12 09:54:25.489+00	2021-07-12 09:54:25.489+00
731	99	59	2021-07-12 09:54:25.491+00	2021-07-12 09:54:25.491+00
732	99	69	2021-07-12 09:54:25.492+00	2021-07-12 09:54:25.492+00
733	100	68	2021-07-12 09:54:31.615+00	2021-07-12 09:54:31.615+00
734	100	62	2021-07-12 09:54:31.617+00	2021-07-12 09:54:31.617+00
735	100	44	2021-07-12 09:54:31.618+00	2021-07-12 09:54:31.618+00
736	100	72	2021-07-12 09:54:31.62+00	2021-07-12 09:54:31.62+00
737	100	66	2021-07-12 09:54:31.621+00	2021-07-12 09:54:31.621+00
738	100	43	2021-07-12 09:54:31.623+00	2021-07-12 09:54:31.623+00
739	100	59	2021-07-12 09:54:31.624+00	2021-07-12 09:54:31.624+00
740	100	52	2021-07-12 09:54:31.627+00	2021-07-12 09:54:31.627+00
741	101	68	2021-07-12 09:54:43.809+00	2021-07-12 09:54:43.809+00
742	101	46	2021-07-12 09:54:43.811+00	2021-07-12 09:54:43.811+00
743	101	76	2021-07-12 09:54:43.812+00	2021-07-12 09:54:43.812+00
744	101	75	2021-07-12 09:54:43.814+00	2021-07-12 09:54:43.814+00
745	101	72	2021-07-12 09:54:43.815+00	2021-07-12 09:54:43.815+00
746	101	66	2021-07-12 09:54:43.817+00	2021-07-12 09:54:43.817+00
747	101	43	2021-07-12 09:54:43.818+00	2021-07-12 09:54:43.818+00
748	101	59	2021-07-12 09:54:43.823+00	2021-07-12 09:54:43.823+00
757	103	68	2021-07-12 09:54:54.146+00	2021-07-12 09:54:54.146+00
758	103	47	2021-07-12 09:54:54.147+00	2021-07-12 09:54:54.147+00
759	103	58	2021-07-12 09:54:54.148+00	2021-07-12 09:54:54.148+00
760	103	70	2021-07-12 09:54:54.149+00	2021-07-12 09:54:54.149+00
761	103	72	2021-07-12 09:54:54.151+00	2021-07-12 09:54:54.151+00
762	103	66	2021-07-12 09:54:54.152+00	2021-07-12 09:54:54.152+00
763	103	43	2021-07-12 09:54:54.153+00	2021-07-12 09:54:54.153+00
764	103	59	2021-07-12 09:54:54.155+00	2021-07-12 09:54:54.155+00
749	102	68	2021-07-12 09:54:51.711+00	2021-07-12 09:54:51.711+00
750	102	74	2021-07-12 09:54:51.717+00	2021-07-12 09:54:51.717+00
751	102	51	2021-07-12 09:54:51.718+00	2021-07-12 09:54:51.718+00
752	102	48	2021-07-12 09:54:51.719+00	2021-07-12 09:54:51.719+00
753	102	55	2021-07-12 09:54:51.721+00	2021-07-12 09:54:51.721+00
754	102	72	2021-07-12 09:54:51.722+00	2021-07-12 09:54:51.722+00
755	102	67	2021-07-12 09:54:51.723+00	2021-07-12 09:54:51.723+00
756	102	38	2021-07-12 09:54:51.725+00	2021-07-12 09:54:51.725+00
765	104	68	2021-07-12 09:54:57.662+00	2021-07-12 09:54:57.662+00
766	104	62	2021-07-12 09:54:57.664+00	2021-07-12 09:54:57.664+00
767	104	44	2021-07-12 09:54:57.665+00	2021-07-12 09:54:57.665+00
768	104	72	2021-07-12 09:54:57.667+00	2021-07-12 09:54:57.667+00
769	104	66	2021-07-12 09:54:57.668+00	2021-07-12 09:54:57.668+00
770	104	43	2021-07-12 09:54:57.669+00	2021-07-12 09:54:57.669+00
771	104	59	2021-07-12 09:54:57.671+00	2021-07-12 09:54:57.671+00
772	105	68	2021-07-12 09:55:22.703+00	2021-07-12 09:55:22.703+00
773	105	47	2021-07-12 09:55:22.704+00	2021-07-12 09:55:22.704+00
774	105	58	2021-07-12 09:55:22.705+00	2021-07-12 09:55:22.705+00
775	105	70	2021-07-12 09:55:22.707+00	2021-07-12 09:55:22.707+00
776	105	71	2021-07-12 09:55:22.709+00	2021-07-12 09:55:22.709+00
777	105	72	2021-07-12 09:55:22.71+00	2021-07-12 09:55:22.71+00
778	105	66	2021-07-12 09:55:22.712+00	2021-07-12 09:55:22.712+00
779	105	43	2021-07-12 09:55:22.714+00	2021-07-12 09:55:22.714+00
780	105	38	2021-07-12 09:55:22.715+00	2021-07-12 09:55:22.715+00
781	105	59	2021-07-12 09:55:22.716+00	2021-07-12 09:55:22.716+00
782	105	69	2021-07-12 09:55:22.718+00	2021-07-12 09:55:22.718+00
783	106	68	2021-07-12 09:55:39.271+00	2021-07-12 09:55:39.271+00
784	106	51	2021-07-12 09:55:39.272+00	2021-07-12 09:55:39.272+00
785	106	74	2021-07-12 09:55:39.273+00	2021-07-12 09:55:39.273+00
786	106	55	2021-07-12 09:55:39.275+00	2021-07-12 09:55:39.275+00
787	106	48	2021-07-12 09:55:39.276+00	2021-07-12 09:55:39.276+00
788	106	71	2021-07-12 09:55:39.277+00	2021-07-12 09:55:39.277+00
789	106	72	2021-07-12 09:55:39.278+00	2021-07-12 09:55:39.278+00
790	106	67	2021-07-12 09:55:39.28+00	2021-07-12 09:55:39.28+00
791	106	43	2021-07-12 09:55:39.281+00	2021-07-12 09:55:39.281+00
792	106	38	2021-07-12 09:55:39.282+00	2021-07-12 09:55:39.282+00
793	106	59	2021-07-12 09:55:39.285+00	2021-07-12 09:55:39.285+00
794	107	68	2021-07-12 09:55:45.575+00	2021-07-12 09:55:45.575+00
795	107	62	2021-07-12 09:55:45.578+00	2021-07-12 09:55:45.578+00
796	107	44	2021-07-12 09:55:45.58+00	2021-07-12 09:55:45.58+00
797	107	52	2021-07-12 09:55:45.581+00	2021-07-12 09:55:45.581+00
798	107	72	2021-07-12 09:55:45.583+00	2021-07-12 09:55:45.583+00
799	107	66	2021-07-12 09:55:45.585+00	2021-07-12 09:55:45.585+00
800	107	43	2021-07-12 09:55:45.586+00	2021-07-12 09:55:45.586+00
801	107	59	2021-07-12 09:55:45.587+00	2021-07-12 09:55:45.588+00
802	108	68	2021-07-12 09:55:49.884+00	2021-07-12 09:55:49.884+00
803	108	46	2021-07-12 09:55:49.886+00	2021-07-12 09:55:49.886+00
804	108	76	2021-07-12 09:55:49.887+00	2021-07-12 09:55:49.887+00
805	108	75	2021-07-12 09:55:49.888+00	2021-07-12 09:55:49.888+00
806	108	71	2021-07-12 09:55:49.89+00	2021-07-12 09:55:49.89+00
807	108	33	2021-07-12 09:55:49.891+00	2021-07-12 09:55:49.891+00
808	108	43	2021-07-12 09:55:49.892+00	2021-07-12 09:55:49.892+00
809	108	59	2021-07-12 09:55:49.893+00	2021-07-12 09:55:49.893+00
810	109	68	2021-07-12 09:55:54.556+00	2021-07-12 09:55:54.556+00
811	109	74	2021-07-12 09:55:54.558+00	2021-07-12 09:55:54.558+00
812	109	51	2021-07-12 09:55:54.559+00	2021-07-12 09:55:54.559+00
813	109	55	2021-07-12 09:55:54.56+00	2021-07-12 09:55:54.56+00
814	109	48	2021-07-12 09:55:54.562+00	2021-07-12 09:55:54.562+00
815	109	71	2021-07-12 09:55:54.563+00	2021-07-12 09:55:54.563+00
816	109	67	2021-07-12 09:55:54.564+00	2021-07-12 09:55:54.564+00
817	109	38	2021-07-12 09:55:54.565+00	2021-07-12 09:55:54.566+00
829	111	68	2021-07-12 23:34:37.401+00	2021-07-12 23:34:37.401+00
830	111	62	2021-07-12 23:34:37.404+00	2021-07-12 23:34:37.404+00
831	111	44	2021-07-12 23:34:37.405+00	2021-07-12 23:34:37.405+00
832	111	52	2021-07-12 23:34:37.407+00	2021-07-12 23:34:37.407+00
833	111	72	2021-07-12 23:34:37.409+00	2021-07-12 23:34:37.409+00
834	111	33	2021-07-12 23:34:37.412+00	2021-07-12 23:34:37.412+00
835	111	43	2021-07-12 23:34:37.414+00	2021-07-12 23:34:37.414+00
836	111	59	2021-07-12 23:34:37.415+00	2021-07-12 23:34:37.415+00
\.


--
-- Data for Name: rdos; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.rdos (id, nome, data, status, condicoes_tempo, pluviometria, user_id, equipamento_id, estrutura_id, contrato_id, created_at, updated_at) FROM stdin;
28	PDE São João - 24.06.21 - 1° Turno	2021-06-24	andamento	bom	0.00	33	4	1	1	2021-06-30 19:49:39.539+00	2021-06-30 19:49:39.539+00
58	Barragem Sul - 22.06.2021	2021-06-22	andamento	bom	0.00	67	40	36	1	2021-07-12 09:49:37.643+00	2021-07-12 09:49:37.643+00
59	PDE São João - 22.06.2021 - 1° Turno	2021-06-22	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:49:43.379+00	2021-07-12 09:49:43.379+00
60	PDE São João - 22.06.2021 - 2° Turno	2021-06-23	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:49:47.181+00	2021-07-12 09:49:47.181+00
61	PDE SUL - 22.06.2021	2021-06-22	finalizado	bom	0.00	67	39	35	1	2021-07-12 09:49:50.403+00	2021-07-12 09:49:50.403+00
63	PDE São João - 23.06.2021 - 1° Turno	2021-06-24	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:49:58.158+00	2021-07-12 09:49:58.158+00
64	PDE São João - 23.06.2021 - 2° Turno	2021-06-23	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:50:04.517+00	2021-07-12 09:50:04.517+00
65	PDE SUL - 23.06.2021	2021-06-23	andamento	bom	0.00	67	39	35	1	2021-07-12 09:50:09.514+00	2021-07-12 09:50:09.514+00
66	Barragem Sul - 24.06.2021	2021-06-24	andamento	bom	0.00	67	40	36	1	2021-07-12 09:50:11.96+00	2021-07-12 09:50:11.96+00
67	PDE São João - 24.06.2021 - 1° Turno	2021-07-11	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:50:29.579+00	2021-07-12 09:50:29.579+00
68	PDE São João - 24.06.2021 - 2° Turno	2021-06-24	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:50:34.975+00	2021-07-12 09:50:34.975+00
69	PDE SUL - 24.06.2021	2021-06-24	andamento	bom	0.00	67	39	35	1	2021-07-12 09:50:43.407+00	2021-07-12 09:50:43.407+00
70	Barragem Sul - 25.06.2021	2021-06-25	andamento	bom	0.00	67	40	36	1	2021-07-12 09:50:45.33+00	2021-07-12 09:50:45.33+00
71	PDE São João - 25.06.2021 - 1° Turno	2021-06-25	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:50:54.208+00	2021-07-12 09:50:54.209+00
72	PDE São João - 25.06.2021 - 2° Turno 	2021-06-25	andamento	bom	0.00	33	4	1	1	2021-07-12 09:50:59.68+00	2021-07-12 09:50:59.68+00
73	PDE SUL - 25.06.2021	2021-06-25	andamento	bom	0.00	67	39	35	1	2021-07-12 09:51:04.013+00	2021-07-12 09:51:04.013+00
74	Barragem Sul - 28.06.2021	2021-06-28	andamento	bom	0.00	67	40	36	1	2021-07-12 09:51:06.6+00	2021-07-12 09:51:06.6+00
75	PDE São João - 26.06.2021 - Sábado 	2021-06-26	andamento	bom	0.00	33	4	1	1	2021-07-12 09:51:19.806+00	2021-07-12 09:51:19.806+00
76	PDE São João - 28.06.2021 - 1° Turno	2021-06-28	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:51:30.523+00	2021-07-12 09:51:30.523+00
77	PDE São João - 28.06.2021 - 2° Turno	2021-06-28	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:51:36.348+00	2021-07-12 09:51:36.348+00
78	PDE SUL - 28.06.2021	2021-07-10	andamento	bom	0.00	67	39	35	1	2021-07-12 09:51:40.423+00	2021-07-12 09:51:40.423+00
79	Barragem Sul - 29.06.2021	2021-06-29	andamento	bom	0.00	67	40	36	1	2021-07-12 09:51:45.239+00	2021-07-12 09:51:45.239+00
80	PDE São João - 29.06.2021 - 1° Turno	2021-06-29	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:51:48.853+00	2021-07-12 09:51:48.853+00
89	PDE São João - 01.07.2021 - 2° Turno	2021-07-01	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:52:30.509+00	2021-07-12 09:52:30.509+00
81	PDE São João - 29.06.2021 - 2° Turno	2021-06-29	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:51:52.457+00	2021-07-12 09:51:52.457+00
82	PDE SUL - 29.06.2021	2021-07-10	andamento	bom	0.00	67	39	35	1	2021-07-12 09:51:57.891+00	2021-07-12 09:51:57.891+00
83	Barragem Sul - 30.06.2021	2021-06-30	andamento	bom	0.00	67	40	36	1	2021-07-12 09:52:04.572+00	2021-07-12 09:52:04.572+00
85	PDE São João - 30.06.2021 - 2° Turno	2021-06-30	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:52:12.082+00	2021-07-12 09:52:12.082+00
88	PDE São João - 01.07.2021 - 1° Turno	2021-07-01	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:52:24.682+00	2021-07-12 09:52:24.682+00
84	PDE São João - 30.06.2021 - 1° Turno	2021-06-30	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:52:08.949+00	2021-07-12 09:52:08.949+00
86	PDE SUL - 30.06.2021	2021-06-30	andamento	bom	0.00	67	39	35	1	2021-07-12 09:52:18.256+00	2021-07-12 09:52:18.256+00
87	Barragem Sul - 01.07.2021	2021-07-01	andamento	bom	0.00	67	40	36	1	2021-07-12 09:52:20.828+00	2021-07-12 09:52:20.829+00
90	PDE SUL - 01.07.2021	2021-07-01	andamento	bom	0.00	67	39	35	1	2021-07-12 09:52:33.175+00	2021-07-12 09:52:33.175+00
91	Barragem Sul - 02.07.2021	2021-07-02	andamento	bom	0.00	67	40	36	1	2021-07-12 09:52:38.607+00	2021-07-12 09:52:38.607+00
92	PDE São João - 02.07.2021 - 1° Turno	2021-07-02	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:52:46.416+00	2021-07-12 09:52:46.416+00
93	PDE SUL - 02.07.2021	2021-07-02	andamento	bom	0.00	67	39	35	1	2021-07-12 09:53:24.753+00	2021-07-12 09:53:24.753+00
95	Barragem Sul - 05.07.2021	2021-07-05	andamento	bom	0.00	67	40	36	1	2021-07-12 09:53:46.739+00	2021-07-12 09:53:46.739+00
96	PDE Sul - PJL-001 - 05.07.2021 - 1° Turno	2021-07-05	andamento	bom	0.00	33	4	35	1	2021-07-12 09:54:07.17+00	2021-07-12 09:54:07.17+00
97	PDE Sul - PJL-001 - 05.07.2021 - 2° Turno	2021-07-06	finalizado	bom	0.00	33	4	35	1	2021-07-12 09:54:10.909+00	2021-07-12 09:54:10.909+00
99	Barragem Sul - 06.07.2021	2021-07-06	andamento	bom	0.00	67	40	36	1	2021-07-12 09:54:25.469+00	2021-07-12 09:54:25.469+00
100	PDE Sul - PJL-001 - 06.07.2021 - 1° Turno	2021-07-07	finalizado	bom	0.00	33	4	35	1	2021-07-12 09:54:31.611+00	2021-07-12 09:54:31.611+00
101	PDE Sul - PJL-001 - 06.07.2021 - 2° Turno	2021-07-07	andamento	bom	0.00	33	4	35	1	2021-07-12 09:54:43.805+00	2021-07-12 09:54:43.805+00
102	PDE SUL - 002 - 06.07.2021	2021-07-06	andamento	bom	0.00	67	39	35	1	2021-07-12 09:54:51.706+00	2021-07-12 09:54:51.706+00
103	Barragem Sul - 07.07.2021	2021-07-07	andamento	bom	0.00	67	40	36	1	2021-07-12 09:54:54.142+00	2021-07-12 09:54:54.142+00
105	Barragem Sul - 08.07.2021	2021-07-08	andamento	bom	0.00	67	40	36	1	2021-07-12 09:55:22.699+00	2021-07-12 09:55:22.699+00
106	PDE SUL - 002 - 07.07.2021	2021-07-07	andamento	bom	0.00	67	39	35	1	2021-07-12 09:55:39.267+00	2021-07-12 09:55:39.267+00
107	PDE Sul - PJL-001 - 08.07.2021 - 1° Turno	2021-07-09	andamento	bom	0.00	33	4	35	1	2021-07-12 09:55:45.572+00	2021-07-12 09:55:45.572+00
108	PDE Sul - PJL-001 - 08.07.2021 - 2° Turno	2021-07-09	finalizado	bom	0.00	33	4	35	1	2021-07-12 09:55:49.88+00	2021-07-12 09:55:49.88+00
109	PDE SUL - 002 - 08.07.2021	2021-07-08	andamento	bom	0.00	67	39	35	1	2021-07-12 09:55:54.553+00	2021-07-12 09:55:54.553+00
111	PDE Sul - PJL-001 - 09.07.2021 - 1° Turno	2021-07-10	andamento	bom	0.00	33	4	35	1	2021-07-12 23:34:37.39+00	2021-07-12 23:34:37.39+00
112	PDE SUL - 002 - 09.07.2021	2021-07-10	andamento	bom	0.00	67	39	35	1	2021-07-13 00:23:44.242+00	2021-07-13 00:23:44.242+00
113	PDE SUL - 002 - 12.07.2021	2021-07-13	andamento	bom	0.00	67	39	35	1	2021-07-13 00:34:11.297+00	2021-07-13 00:34:11.297+00
94	PDE São João - 03.07.2021 - 1° Turno  - Sabádo	2021-07-03	finalizado	bom	0.00	33	4	1	1	2021-07-12 09:53:43.121+00	2021-07-13 00:43:59.995+00
104	PDE Sul - PJL-001 - 07.07.2021 - 1° Turno	2021-07-07	andamento	bom	0.00	33	4	35	1	2021-07-12 09:54:57.658+00	2021-07-13 00:49:39.337+00
114	PDE São João - 02.07.2021 - 2° Turno	2021-07-02	finalizado	bom	0.00	33	4	1	1	2021-07-13 01:05:55.986+00	2021-07-13 01:05:55.986+00
115	PDE SUL - PJL-001 - 12.07.2021 - 1° Turno	2021-07-12	andamento	bom	0.00	33	4	35	1	2021-07-13 11:25:18.035+00	2021-07-13 11:25:18.035+00
116	PDE SUL - 002 - 13.07.21 - 01	2021-07-13	andamento	bom	0.00	67	39	35	1	2021-07-13 23:04:07.909+00	2021-07-13 23:04:07.909+00
117	PDE SUL - PJL-001 - 13.07.2021 - 1° Turno 	2021-07-13	andamento	bom	0.00	33	4	35	1	2021-07-14 00:15:58.818+00	2021-07-14 00:15:58.819+00
\.


--
-- Data for Name: user_logs; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.user_logs (id, ip, route, url, method, user_id, created_at, updated_at) FROM stdin;
1	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 05:17:51.406+00	2021-05-28 05:17:51.428+00
2	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 05:17:58.813+00	2021-05-28 05:17:58.813+00
12	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 05:36:37.906+00	2021-05-28 05:36:37.906+00
13	127.0.0.1	sessions.store	/sessions	POST	1	2021-05-28 05:36:55.68+00	2021-05-28 05:36:55.68+00
14	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-05-28 05:36:56.412+00	2021-05-28 05:36:56.412+00
15	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 05:37:01.724+00	2021-05-28 05:37:01.724+00
16	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 05:40:57.071+00	2021-05-28 05:40:57.071+00
17	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 10:21:32.201+00	2021-05-28 10:21:32.201+00
18	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 10:21:32.317+00	2021-05-28 10:21:32.317+00
19	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 10:49:38.417+00	2021-05-28 10:49:38.417+00
20	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 10:49:38.515+00	2021-05-28 10:49:38.515+00
21	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 11:17:00.687+00	2021-05-28 11:17:00.687+00
22	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 11:17:01.96+00	2021-05-28 11:17:01.96+00
23	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 11:17:03.405+00	2021-05-28 11:17:03.405+00
24	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-05-28 11:26:27.89+00	2021-05-28 11:26:27.89+00
25	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-05-28 11:26:28.312+00	2021-05-28 11:26:28.312+00
26	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-05-28 11:28:41.761+00	2021-05-28 11:28:41.761+00
27	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-05-28 11:29:21.024+00	2021-05-28 11:29:21.024+00
28	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-05-28 11:29:32.508+00	2021-05-28 11:29:32.508+00
29	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 11:29:49.699+00	2021-05-28 11:29:49.699+00
30	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-05-28 11:30:02.887+00	2021-05-28 11:30:02.887+00
31	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-05-28 11:30:08.407+00	2021-05-28 11:30:08.407+00
32	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-05-28 11:30:14.56+00	2021-05-28 11:30:14.56+00
33	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-05-28 11:30:20.511+00	2021-05-28 11:30:20.511+00
34	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 11:30:20.698+00	2021-05-28 11:30:20.698+00
43	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 11:31:50.318+00	2021-05-28 11:31:50.318+00
44	127.0.0.1	sessions.store	/sessions	POST	1	2021-05-28 11:32:00.185+00	2021-05-28 11:32:00.185+00
45	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-05-28 11:32:00.466+00	2021-05-28 11:32:00.466+00
46	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 11:32:27.773+00	2021-05-28 11:32:27.773+00
47	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-05-28 11:32:30.885+00	2021-05-28 11:32:30.885+00
48	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 11:32:31.084+00	2021-05-28 11:32:31.084+00
49	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-05-28 11:32:39.281+00	2021-05-28 11:32:39.281+00
50	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:32:42.018+00	2021-05-28 11:32:42.018+00
51	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-05-28 11:32:43.053+00	2021-05-28 11:32:43.053+00
52	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:32:47.576+00	2021-05-28 11:32:47.576+00
53	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-05-28 11:32:54.022+00	2021-05-28 11:32:54.022+00
54	127.0.0.1	admin.cargos.edit	/admin/cargos/4/edit	GET	1	2021-05-28 11:33:03.216+00	2021-05-28 11:33:03.216+00
55	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:33:30.836+00	2021-05-28 11:33:30.836+00
56	127.0.0.1	admin.cargos.edit	/admin/cargos/5/edit	GET	1	2021-05-28 11:33:32.89+00	2021-05-28 11:33:32.89+00
61	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 11:39:03.267+00	2021-05-28 11:39:03.267+00
62	127.0.0.1	sessions.store	/sessions	POST	1	2021-05-28 11:39:16.721+00	2021-05-28 11:39:16.721+00
63	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-05-28 11:39:16.903+00	2021-05-28 11:39:16.903+00
64	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 11:39:24.05+00	2021-05-28 11:39:24.05+00
65	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-05-28 11:39:27.46+00	2021-05-28 11:39:27.46+00
66	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 11:39:27.728+00	2021-05-28 11:39:27.728+00
67	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:39:29.178+00	2021-05-28 11:39:29.178+00
68	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-05-28 11:39:31.434+00	2021-05-28 11:39:31.434+00
69	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-05-28 11:39:42.159+00	2021-05-28 11:39:42.159+00
70	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:39:42.395+00	2021-05-28 11:39:42.395+00
71	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-05-28 11:39:45.251+00	2021-05-28 11:39:45.251+00
72	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-05-28 11:39:56.807+00	2021-05-28 11:39:56.807+00
73	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:39:57.027+00	2021-05-28 11:39:57.027+00
74	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-05-28 11:40:08.067+00	2021-05-28 11:40:08.067+00
75	127.0.0.1	admin.users.edit	/admin/users/2/edit	GET	1	2021-05-28 11:40:10.579+00	2021-05-28 11:40:10.579+00
76	127.0.0.1	admin.users.update	/admin/users/2	PUT	1	2021-05-28 11:40:17.368+00	2021-05-28 11:40:17.368+00
77	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-05-28 11:40:17.576+00	2021-05-28 11:40:17.576+00
78	127.0.0.1	admin.users.edit	/admin/users/3/edit	GET	1	2021-05-28 11:40:20.051+00	2021-05-28 11:40:20.051+00
79	127.0.0.1	admin.users.update	/admin/users/3	PUT	1	2021-05-28 11:40:36.646+00	2021-05-28 11:40:36.646+00
80	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-05-28 11:40:36.886+00	2021-05-28 11:40:36.886+00
81	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:40:46.787+00	2021-05-28 11:40:46.787+00
82	127.0.0.1	admin.cargos.destroy	/admin/cargos/5	DELETE	1	2021-05-28 11:40:50.34+00	2021-05-28 11:40:50.34+00
83	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:40:50.583+00	2021-05-28 11:40:50.583+00
84	127.0.0.1	admin.cargos.destroy	/admin/cargos/4	DELETE	1	2021-05-28 11:40:54.481+00	2021-05-28 11:40:54.481+00
85	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:40:54.705+00	2021-05-28 11:40:54.705+00
86	127.0.0.1	admin.cargos.edit	/admin/cargos/6/edit	GET	1	2021-05-28 11:40:56.734+00	2021-05-28 11:40:56.734+00
87	127.0.0.1	admin.cargos.update	/admin/cargos/6	PUT	1	2021-05-28 11:41:01.24+00	2021-05-28 11:41:01.24+00
88	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:41:01.451+00	2021-05-28 11:41:01.451+00
89	127.0.0.1	admin.cargos.edit	/admin/cargos/7/edit	GET	1	2021-05-28 11:41:03.284+00	2021-05-28 11:41:03.284+00
90	127.0.0.1	admin.cargos.update	/admin/cargos/7	PUT	1	2021-05-28 11:41:08.096+00	2021-05-28 11:41:08.096+00
91	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 11:41:08.311+00	2021-05-28 11:41:08.311+00
92	127.0.0.1	admin.cargos.edit	/admin/cargos/6/edit	GET	1	2021-05-28 11:41:14.842+00	2021-05-28 11:41:14.842+00
93	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-05-28 11:41:25.126+00	2021-05-28 11:41:25.126+00
94	127.0.0.1	admin.atividades.edit	/admin/atividades/2/edit	GET	1	2021-05-28 11:43:31.562+00	2021-05-28 11:43:31.562+00
95	127.0.0.1	admin.atividades.update	/admin/atividades/2	PUT	1	2021-05-28 11:43:42.513+00	2021-05-28 11:43:42.513+00
96	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-05-28 11:43:42.731+00	2021-05-28 11:43:42.731+00
97	127.0.0.1	admin.atividades.edit	/admin/atividades/1/edit	GET	1	2021-05-28 11:43:46.451+00	2021-05-28 11:43:46.451+00
98	127.0.0.1	admin.atividades.update	/admin/atividades/1	PUT	1	2021-05-28 11:44:07.786+00	2021-05-28 11:44:07.786+00
99	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-05-28 11:44:07.997+00	2021-05-28 11:44:07.997+00
100	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-05-28 11:44:26.752+00	2021-05-28 11:44:26.752+00
101	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-05-28 11:44:35.479+00	2021-05-28 11:44:35.479+00
102	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-05-28 11:44:36.688+00	2021-05-28 11:44:36.688+00
103	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-05-28 11:44:46.926+00	2021-05-28 11:44:46.926+00
104	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-05-28 11:45:00.958+00	2021-05-28 11:45:00.958+00
105	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-05-28 11:45:04.829+00	2021-05-28 11:45:04.829+00
106	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 11:45:06.062+00	2021-05-28 11:45:06.062+00
107	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 11:45:06.473+00	2021-05-28 11:45:06.473+00
108	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 11:45:16.871+00	2021-05-28 11:45:16.871+00
109	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-05-28 11:45:34.119+00	2021-05-28 11:45:34.119+00
110	127.0.0.1	admin.rdos.show	/admin/rdos/1	GET	1	2021-05-28 11:45:36.821+00	2021-05-28 11:45:36.821+00
111	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/1/atividades	POST	1	2021-05-28 11:46:50.317+00	2021-05-28 11:46:50.317+00
112	127.0.0.1	admin.rdos.show	/admin/rdos/1	GET	1	2021-05-28 11:46:50.53+00	2021-05-28 11:46:50.53+00
113	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/1/atividades/3	DELETE	1	2021-05-28 11:47:06.185+00	2021-05-28 11:47:06.185+00
114	127.0.0.1	admin.rdos.show	/admin/rdos/1	GET	1	2021-05-28 11:47:06.403+00	2021-05-28 11:47:06.403+00
115	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-05-28 11:47:17.013+00	2021-05-28 11:47:17.013+00
116	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 11:47:18.672+00	2021-05-28 11:47:18.672+00
117	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 11:47:27.585+00	2021-05-28 11:47:27.585+00
118	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 12:03:09.922+00	2021-05-28 12:03:09.922+00
119	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 12:03:16.012+00	2021-05-28 12:03:16.012+00
120	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 12:03:37.536+00	2021-05-28 12:03:37.536+00
121	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-05-28 12:07:22.123+00	2021-05-28 12:07:22.123+00
122	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-05-28 12:08:10.278+00	2021-05-28 12:08:10.278+00
123	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-05-28 12:08:13.064+00	2021-05-28 12:08:13.064+00
124	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-05-28 12:08:24.017+00	2021-05-28 12:08:24.017+00
125	127.0.0.1	admin.rdos.show	/admin/rdos/1	GET	1	2021-05-28 12:08:26.098+00	2021-05-28 12:08:26.098+00
126	127.0.0.1	admin.rdos.show	/admin/rdos/1	GET	1	2021-05-28 12:16:41.701+00	2021-05-28 12:16:41.701+00
127	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/1/atividades/4	DELETE	1	2021-05-28 12:17:13.297+00	2021-05-28 12:17:13.297+00
128	127.0.0.1	admin.rdos.show	/admin/rdos/1	GET	1	2021-05-28 12:17:13.489+00	2021-05-28 12:17:13.489+00
129	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:21:18.515+00	2021-05-28 12:21:18.515+00
130	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:21:47.537+00	2021-05-28 12:21:47.537+00
131	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:21:48.076+00	2021-05-28 12:21:48.076+00
132	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:22:16.558+00	2021-05-28 12:22:16.558+00
138	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:23:09.182+00	2021-05-28 12:23:09.182+00
154	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:24:38.19+00	2021-05-28 12:24:38.19+00
155	127.0.0.1	sessions.store	/sessions	POST	1	2021-05-28 12:24:45.281+00	2021-05-28 12:24:45.281+00
156	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-05-28 12:24:45.487+00	2021-05-28 12:24:45.487+00
157	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-05-28 12:24:52.827+00	2021-05-28 12:24:52.827+00
159	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 12:25:00.407+00	2021-05-28 12:25:00.407+00
160	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-05-28 12:25:04.173+00	2021-05-28 12:25:04.173+00
162	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-05-28 12:25:05.02+00	2021-05-28 12:25:05.02+00
163	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-05-28 12:25:07.688+00	2021-05-28 12:25:07.688+00
164	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-05-28 12:25:12.601+00	2021-05-28 12:25:12.601+00
165	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:25:12.797+00	2021-05-28 12:25:12.797+00
223	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:38:43.706+00	2021-05-28 12:38:43.706+00
237	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 12:40:58.496+00	2021-05-28 12:40:58.496+00
279	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 15:20:15.748+00	2021-05-28 15:20:15.748+00
280	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 20:36:36.883+00	2021-05-28 20:36:36.883+00
281	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-28 20:37:12.88+00	2021-05-28 20:37:12.881+00
282	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 00:37:26.885+00	2021-05-29 00:37:26.885+00
283	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 00:37:28.358+00	2021-05-29 00:37:28.358+00
284	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 02:11:57.943+00	2021-05-29 02:11:57.943+00
285	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 02:17:36.851+00	2021-05-29 02:17:36.851+00
286	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 07:59:53.149+00	2021-05-29 07:59:53.149+00
287	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 08:17:21.221+00	2021-05-29 08:17:21.221+00
288	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 08:17:21.447+00	2021-05-29 08:17:21.447+00
289	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 08:17:24.721+00	2021-05-29 08:17:24.721+00
290	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 08:23:22.455+00	2021-05-29 08:23:22.455+00
291	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 08:58:06.484+00	2021-05-29 08:58:06.484+00
292	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 08:58:07.987+00	2021-05-29 08:58:07.987+00
293	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 12:19:25.348+00	2021-05-29 12:19:25.348+00
294	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 13:36:44.97+00	2021-05-29 13:36:44.97+00
295	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 14:48:13.075+00	2021-05-29 14:48:13.075+00
296	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 20:37:45.221+00	2021-05-29 20:37:45.221+00
297	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 21:47:56.031+00	2021-05-29 21:47:56.031+00
298	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-29 21:47:56.865+00	2021-05-29 21:47:56.865+00
299	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 00:18:08.078+00	2021-05-30 00:18:08.078+00
300	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 00:49:28.776+00	2021-05-30 00:49:28.776+00
301	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-05-30 03:10:35.601+00	2021-05-30 03:10:35.601+00
302	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-05-30 03:10:35.835+00	2021-05-30 03:10:35.835+00
303	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-05-30 03:10:42.424+00	2021-05-30 03:10:42.424+00
304	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 05:22:59.164+00	2021-05-30 05:22:59.164+00
305	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 05:23:01.861+00	2021-05-30 05:23:01.861+00
306	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-05-30 05:23:02.617+00	2021-05-30 05:23:02.618+00
307	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 05:23:05.96+00	2021-05-30 05:23:05.96+00
308	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 07:49:26.685+00	2021-05-30 07:49:26.685+00
309	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 14:41:11.583+00	2021-05-30 14:41:11.583+00
310	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 14:50:37.155+00	2021-05-30 14:50:37.155+00
311	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 15:08:38.545+00	2021-05-30 15:08:38.545+00
312	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 15:39:11.605+00	2021-05-30 15:39:11.605+00
313	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 16:27:19.913+00	2021-05-30 16:27:19.913+00
314	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 17:19:40.345+00	2021-05-30 17:19:40.345+00
315	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 19:53:26.084+00	2021-05-30 19:53:26.084+00
316	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 22:16:50.043+00	2021-05-30 22:16:50.043+00
317	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 22:16:50.208+00	2021-05-30 22:16:50.208+00
318	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-30 23:03:45.322+00	2021-05-30 23:03:45.322+00
319	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 00:11:19.583+00	2021-05-31 00:11:19.583+00
320	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 01:28:57.802+00	2021-05-31 01:28:57.802+00
321	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 02:58:08.969+00	2021-05-31 02:58:08.969+00
322	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 07:48:36.049+00	2021-05-31 07:48:36.049+00
323	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 10:22:05.738+00	2021-05-31 10:22:05.738+00
324	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 12:07:39.579+00	2021-05-31 12:07:39.579+00
325	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 12:07:40.385+00	2021-05-31 12:07:40.385+00
326	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 14:23:20.207+00	2021-05-31 14:23:20.207+00
327	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 17:19:04.598+00	2021-05-31 17:19:04.598+00
328	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 17:22:51.637+00	2021-05-31 17:22:51.637+00
329	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 19:06:58.402+00	2021-05-31 19:06:58.402+00
330	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 19:07:00.69+00	2021-05-31 19:07:00.69+00
331	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 22:02:27.547+00	2021-05-31 22:02:27.547+00
332	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 22:10:54.256+00	2021-05-31 22:10:54.256+00
333	127.0.0.1	sessions.index	/sessions	GET	\N	2021-05-31 23:20:07.37+00	2021-05-31 23:20:07.37+00
334	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 00:36:51.921+00	2021-06-01 00:36:51.921+00
335	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 00:36:51.956+00	2021-06-01 00:36:51.956+00
336	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 02:36:43.496+00	2021-06-01 02:36:43.496+00
349	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 04:11:34.064+00	2021-06-01 04:11:34.064+00
350	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 06:32:33.442+00	2021-06-01 06:32:33.442+00
351	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 07:56:10.651+00	2021-06-01 07:56:10.651+00
352	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 07:56:11.65+00	2021-06-01 07:56:11.65+00
353	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 13:29:19.195+00	2021-06-01 13:29:19.195+00
365	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 13:55:17.959+00	2021-06-01 13:55:17.96+00
393	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 17:34:35.376+00	2021-06-01 17:34:35.376+00
394	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 17:34:35.504+00	2021-06-01 17:34:35.505+00
395	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-06-01 18:29:28.007+00	2021-06-01 18:29:28.007+00
396	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-01 18:29:28.506+00	2021-06-01 18:29:28.506+00
397	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-06-01 18:29:46.237+00	2021-06-01 18:29:46.237+00
398	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-01 18:29:46.697+00	2021-06-01 18:29:46.697+00
399	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-01 18:29:57.743+00	2021-06-01 18:29:57.743+00
400	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-06-01 18:40:30.323+00	2021-06-01 18:40:30.323+00
401	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-01 18:40:30.626+00	2021-06-01 18:40:30.626+00
406	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 18:41:31.419+00	2021-06-01 18:41:31.419+00
407	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-01 18:41:36.756+00	2021-06-01 18:41:36.756+00
408	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:41:36.97+00	2021-06-01 18:41:36.97+00
409	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 18:41:40.441+00	2021-06-01 18:41:40.441+00
410	127.0.0.1	admin.users.edit	/admin/users/1/edit	GET	1	2021-06-01 18:41:43.681+00	2021-06-01 18:41:43.682+00
411	127.0.0.1	admin.users.update	/admin/users/1	PUT	1	2021-06-01 18:41:53.651+00	2021-06-01 18:41:53.651+00
412	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 18:41:53.872+00	2021-06-01 18:41:53.872+00
413	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-01 18:42:00.192+00	2021-06-01 18:42:00.192+00
414	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 18:42:00.6+00	2021-06-01 18:42:00.6+00
415	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-01 18:42:07.643+00	2021-06-01 18:42:07.643+00
416	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:42:07.829+00	2021-06-01 18:42:07.829+00
417	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:42:27.681+00	2021-06-01 18:42:27.681+00
418	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-06-01 18:42:32.259+00	2021-06-01 18:42:32.259+00
419	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-01 18:42:32.836+00	2021-06-01 18:42:32.836+00
420	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 18:42:46.179+00	2021-06-01 18:42:46.179+00
421	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-01 18:43:10.053+00	2021-06-01 18:43:10.053+00
422	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:43:10.244+00	2021-06-01 18:43:10.244+00
423	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:43:49.739+00	2021-06-01 18:43:49.739+00
424	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 18:46:13.196+00	2021-06-01 18:46:13.196+00
425	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-01 18:46:24.739+00	2021-06-01 18:46:24.739+00
426	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:46:24.914+00	2021-06-01 18:46:24.914+00
427	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:46:28.695+00	2021-06-01 18:46:28.695+00
428	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	1	2021-06-01 18:46:32.7+00	2021-06-01 18:46:32.7+00
429	127.0.0.1	admin.contratos.update	/admin/contratos/1	PUT	1	2021-06-01 18:47:24.625+00	2021-06-01 18:47:24.625+00
430	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:47:24.785+00	2021-06-01 18:47:24.785+00
431	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:47:31.146+00	2021-06-01 18:47:31.146+00
432	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 18:47:37.965+00	2021-06-01 18:47:37.965+00
433	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-01 18:47:40.645+00	2021-06-01 18:47:40.645+00
434	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 18:47:42.389+00	2021-06-01 18:47:42.39+00
435	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 18:47:43.6+00	2021-06-01 18:47:43.6+00
436	127.0.0.1	admin.areas.complexos.create	/admin/areas/complexos/create	GET	1	2021-06-01 18:47:45.441+00	2021-06-01 18:47:45.441+00
437	127.0.0.1	admin.areas.complexos.store	/admin/areas/complexos	POST	1	2021-06-01 18:47:57.992+00	2021-06-01 18:47:57.992+00
438	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 18:47:58.145+00	2021-06-01 18:47:58.146+00
439	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 18:48:01.19+00	2021-06-01 18:48:01.19+00
440	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 18:48:03.734+00	2021-06-01 18:48:03.734+00
441	127.0.0.1	admin.areas.complexos.edit	/admin/areas/complexos/2/edit	GET	1	2021-06-01 18:48:06.767+00	2021-06-01 18:48:06.767+00
442	127.0.0.1	admin.areas.complexos.update	/admin/areas/complexos/2	PUT	1	2021-06-01 18:48:10.55+00	2021-06-01 18:48:10.55+00
443	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 18:48:10.699+00	2021-06-01 18:48:10.699+00
444	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 18:48:11.77+00	2021-06-01 18:48:11.77+00
445	127.0.0.1	admin.areas.minas.create	/admin/areas/minas/create	GET	1	2021-06-01 18:48:14.841+00	2021-06-01 18:48:14.841+00
446	127.0.0.1	admin.areas.minas.store	/admin/areas/minas	POST	1	2021-06-01 18:48:25.351+00	2021-06-01 18:48:25.351+00
447	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 18:48:25.507+00	2021-06-01 18:48:25.507+00
448	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-01 18:48:26.986+00	2021-06-01 18:48:26.986+00
449	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	1	2021-06-01 18:48:29.628+00	2021-06-01 18:48:29.628+00
450	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	1	2021-06-01 18:48:38.387+00	2021-06-01 18:48:38.387+00
451	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-01 18:48:38.555+00	2021-06-01 18:48:38.555+00
452	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 18:48:40.95+00	2021-06-01 18:48:40.95+00
453	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	1	2021-06-01 18:48:42.962+00	2021-06-01 18:48:42.963+00
454	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	1	2021-06-01 18:48:51.48+00	2021-06-01 18:48:51.48+00
455	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 18:48:51.638+00	2021-06-01 18:48:51.638+00
456	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-01 18:49:27.702+00	2021-06-01 18:49:27.702+00
457	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-01 18:49:27.978+00	2021-06-01 18:49:27.978+00
458	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:49:34.128+00	2021-06-01 18:49:34.128+00
459	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:49:36.358+00	2021-06-01 18:49:36.358+00
460	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	1	2021-06-01 18:49:53.586+00	2021-06-01 18:49:53.586+00
461	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:49:53.748+00	2021-06-01 18:49:53.748+00
462	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:50:06.329+00	2021-06-01 18:50:06.329+00
463	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:50:09.148+00	2021-06-01 18:50:09.148+00
464	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	1	2021-06-01 18:50:13.43+00	2021-06-01 18:50:13.43+00
465	127.0.0.1	admin.contratos.update	/admin/contratos/1	PUT	1	2021-06-01 18:50:15.666+00	2021-06-01 18:50:15.666+00
466	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:50:15.819+00	2021-06-01 18:50:15.819+00
467	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:50:17.719+00	2021-06-01 18:50:17.719+00
468	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:50:19.651+00	2021-06-01 18:50:19.651+00
469	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	1	2021-06-01 18:50:24.481+00	2021-06-01 18:50:24.481+00
470	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:50:24.631+00	2021-06-01 18:50:24.631+00
471	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 18:50:30.103+00	2021-06-01 18:50:30.103+00
472	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-01 18:50:35.382+00	2021-06-01 18:50:35.382+00
473	127.0.0.1	admin.rdos.show	/admin/rdos/1	GET	1	2021-06-01 18:50:38.284+00	2021-06-01 18:50:38.284+00
474	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:50:48.12+00	2021-06-01 18:50:48.12+00
475	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 18:50:49.73+00	2021-06-01 18:50:49.73+00
476	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:50:50.879+00	2021-06-01 18:50:50.879+00
477	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:50:51.561+00	2021-06-01 18:50:51.561+00
478	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:50:52.84+00	2021-06-01 18:50:52.84+00
479	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:50:53.935+00	2021-06-01 18:50:53.935+00
480	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 18:50:56.178+00	2021-06-01 18:50:56.178+00
481	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:51:02.544+00	2021-06-01 18:51:02.544+00
482	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:51:04.857+00	2021-06-01 18:51:04.857+00
483	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	1	2021-06-01 18:51:10.251+00	2021-06-01 18:51:10.251+00
484	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:51:10.418+00	2021-06-01 18:51:10.418+00
485	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	1	2021-06-01 18:52:01.141+00	2021-06-01 18:52:01.141+00
486	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:52:01.292+00	2021-06-01 18:52:01.292+00
487	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:52:30.801+00	2021-06-01 18:52:30.801+00
488	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:52:34.212+00	2021-06-01 18:52:34.212+00
489	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 18:52:35.833+00	2021-06-01 18:52:35.833+00
490	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 18:52:38.478+00	2021-06-01 18:52:38.479+00
491	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-01 18:52:40.764+00	2021-06-01 18:52:40.764+00
492	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 18:52:42.966+00	2021-06-01 18:52:42.966+00
493	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:52:46.058+00	2021-06-01 18:52:46.058+00
494	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-01 18:52:47.59+00	2021-06-01 18:52:47.59+00
495	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-01 18:52:47.802+00	2021-06-01 18:52:47.802+00
496	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:52:53.097+00	2021-06-01 18:52:53.097+00
497	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:52:54.63+00	2021-06-01 18:52:54.63+00
498	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:52:55.871+00	2021-06-01 18:52:55.871+00
499	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:52:58.634+00	2021-06-01 18:52:58.634+00
500	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 18:52:58.807+00	2021-06-01 18:52:58.807+00
501	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-01 18:53:01.5+00	2021-06-01 18:53:01.5+00
502	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:53:03.319+00	2021-06-01 18:53:03.32+00
503	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 18:53:04.953+00	2021-06-01 18:53:04.953+00
504	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-01 18:53:07.36+00	2021-06-01 18:53:07.36+00
505	127.0.0.1	admin.rdos.show	/admin/rdos/1	GET	1	2021-06-01 18:53:12.047+00	2021-06-01 18:53:12.047+00
506	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:53:13.902+00	2021-06-01 18:53:13.902+00
507	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:53:23.229+00	2021-06-01 18:53:23.229+00
508	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:53:31.475+00	2021-06-01 18:53:31.475+00
509	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-01 18:53:32.291+00	2021-06-01 18:53:32.291+00
510	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 18:53:35.352+00	2021-06-01 18:53:35.352+00
511	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-01 18:54:40.423+00	2021-06-01 18:54:40.423+00
512	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:54:40.625+00	2021-06-01 18:54:40.625+00
513	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:54:43.495+00	2021-06-01 18:54:43.495+00
514	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 18:54:45.104+00	2021-06-01 18:54:45.104+00
515	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 18:54:46.526+00	2021-06-01 18:54:46.526+00
516	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-01 18:54:47.989+00	2021-06-01 18:54:47.989+00
517	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 18:54:49.638+00	2021-06-01 18:54:49.638+00
518	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 18:54:58.048+00	2021-06-01 18:54:58.048+00
519	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:55:03.659+00	2021-06-01 18:55:03.659+00
520	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 18:55:06.538+00	2021-06-01 18:55:06.538+00
521	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:55:13.123+00	2021-06-01 18:55:13.123+00
522	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 18:55:29.983+00	2021-06-01 18:55:29.983+00
523	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-01 18:55:35.891+00	2021-06-01 18:55:35.891+00
524	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:55:38.171+00	2021-06-01 18:55:38.171+00
525	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 18:55:40.829+00	2021-06-01 18:55:40.829+00
526	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:55:42.545+00	2021-06-01 18:55:42.545+00
527	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:55:44.003+00	2021-06-01 18:55:44.003+00
528	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:55:45.446+00	2021-06-01 18:55:45.446+00
529	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:56:00.829+00	2021-06-01 18:56:00.829+00
530	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 18:56:03.303+00	2021-06-01 18:56:03.303+00
531	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 18:56:05.202+00	2021-06-01 18:56:05.202+00
532	127.0.0.1	admin.areas.complexos.edit	/admin/areas/complexos/1/edit	GET	1	2021-06-01 18:56:07.265+00	2021-06-01 18:56:07.265+00
533	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-01 18:56:12.782+00	2021-06-01 18:56:12.782+00
534	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:56:15.269+00	2021-06-01 18:56:15.269+00
535	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:56:21.189+00	2021-06-01 18:56:21.189+00
536	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-01 18:56:24.891+00	2021-06-01 18:56:24.891+00
537	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:56:25.034+00	2021-06-01 18:56:25.034+00
538	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:56:27.807+00	2021-06-01 18:56:27.807+00
539	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-06-01 18:56:32.015+00	2021-06-01 18:56:32.015+00
540	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	1	2021-06-01 18:56:35.808+00	2021-06-01 18:56:35.808+00
541	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:56:35.975+00	2021-06-01 18:56:35.975+00
542	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/1/edit	GET	1	2021-06-01 18:56:42.472+00	2021-06-01 18:56:42.472+00
543	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/1	PUT	1	2021-06-01 18:56:52.991+00	2021-06-01 18:56:52.991+00
544	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:56:53.16+00	2021-06-01 18:56:53.16+00
545	127.0.0.1	admin.equipamentos.destroy	/admin/equipamentos/3	DELETE	1	2021-06-01 18:56:59.995+00	2021-06-01 18:56:59.995+00
546	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:57:00.136+00	2021-06-01 18:57:00.136+00
547	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/2/edit	GET	1	2021-06-01 18:57:05.444+00	2021-06-01 18:57:05.444+00
548	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/2	PUT	1	2021-06-01 18:57:20.118+00	2021-06-01 18:57:20.118+00
549	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 18:57:20.273+00	2021-06-01 18:57:20.273+00
550	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-01 18:58:05.65+00	2021-06-01 18:58:05.65+00
551	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-01 18:58:05.872+00	2021-06-01 18:58:05.872+00
552	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-01 18:58:17.826+00	2021-06-01 18:58:17.826+00
553	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 18:58:31.053+00	2021-06-01 18:58:31.053+00
554	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-01 18:58:35.368+00	2021-06-01 18:58:35.368+00
555	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-01 18:59:23.054+00	2021-06-01 18:59:23.054+00
556	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-01 18:59:23.219+00	2021-06-01 18:59:23.219+00
557	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-01 18:59:44.096+00	2021-06-01 18:59:44.096+00
558	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-01 18:59:44.257+00	2021-06-01 18:59:44.257+00
559	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-01 18:59:52.21+00	2021-06-01 18:59:52.21+00
560	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 18:59:52.376+00	2021-06-01 18:59:52.376+00
561	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:59:58.374+00	2021-06-01 18:59:58.374+00
562	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-01 18:59:59.322+00	2021-06-01 18:59:59.322+00
563	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 18:59:59.544+00	2021-06-01 18:59:59.544+00
564	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-01 19:00:03.016+00	2021-06-01 19:00:03.016+00
565	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 19:00:03.208+00	2021-06-01 19:00:03.208+00
566	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 19:00:05.04+00	2021-06-01 19:00:05.04+00
567	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 19:00:06.905+00	2021-06-01 19:00:06.905+00
568	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-01 19:00:08.656+00	2021-06-01 19:00:08.656+00
569	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-01 19:00:08.861+00	2021-06-01 19:00:08.861+00
570	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 19:00:09.447+00	2021-06-01 19:00:09.447+00
571	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 19:00:10.652+00	2021-06-01 19:00:10.652+00
572	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-01 19:00:13.471+00	2021-06-01 19:00:13.471+00
573	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-01 19:00:13.949+00	2021-06-01 19:00:13.949+00
574	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 19:00:14.181+00	2021-06-01 19:00:14.181+00
575	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-01 19:00:25.66+00	2021-06-01 19:00:25.66+00
576	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 19:00:25.857+00	2021-06-01 19:00:25.857+00
577	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 19:00:30.623+00	2021-06-01 19:00:30.623+00
578	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 19:00:31.856+00	2021-06-01 19:00:31.856+00
579	127.0.0.1	admin.areas.complexos.destroy	/admin/areas/complexos/2	DELETE	1	2021-06-01 19:00:36.572+00	2021-06-01 19:00:36.572+00
580	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 19:00:36.787+00	2021-06-01 19:00:36.787+00
581	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 19:00:38.006+00	2021-06-01 19:00:38.006+00
582	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-01 19:00:45.066+00	2021-06-01 19:00:45.066+00
583	127.0.0.1	admin.cargos.edit	/admin/cargos/7/edit	GET	1	2021-06-01 19:00:48.848+00	2021-06-01 19:00:48.848+00
584	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 19:00:55.415+00	2021-06-01 19:00:55.415+00
585	127.0.0.1	admin.users.edit	/admin/users/5/edit	GET	1	2021-06-01 19:00:58.958+00	2021-06-01 19:00:58.958+00
586	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 19:01:34.051+00	2021-06-01 19:01:34.051+00
587	127.0.0.1	admin.users.update	/admin/users/5	PUT	1	2021-06-01 19:01:41.548+00	2021-06-01 19:01:41.548+00
588	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 19:01:41.728+00	2021-06-01 19:01:41.728+00
589	127.0.0.1	admin.users.edit	/admin/users/5/edit	GET	1	2021-06-01 19:01:52.31+00	2021-06-01 19:01:52.31+00
590	127.0.0.1	admin.users.update	/admin/users/5	PUT	1	2021-06-01 19:01:58.567+00	2021-06-01 19:01:58.567+00
591	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 19:01:58.742+00	2021-06-01 19:01:58.742+00
594	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 19:02:39.393+00	2021-06-01 19:02:39.393+00
595	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 19:02:41.072+00	2021-06-01 19:02:41.072+00
596	127.0.0.1	admin.areas.complexos.edit	/admin/areas/complexos/1/edit	GET	1	2021-06-01 19:02:43.928+00	2021-06-01 19:02:43.928+00
597	127.0.0.1	admin.areas.complexos.update	/admin/areas/complexos/1	PUT	1	2021-06-01 19:02:50.688+00	2021-06-01 19:02:50.688+00
598	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 19:02:50.847+00	2021-06-01 19:02:50.847+00
599	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 19:02:52.223+00	2021-06-01 19:02:52.223+00
600	127.0.0.1	admin.areas.minas.edit	/admin/areas/minas/1/edit	GET	1	2021-06-01 19:02:55.15+00	2021-06-01 19:02:55.15+00
601	127.0.0.1	admin.areas.minas.update	/admin/areas/minas/1	PUT	1	2021-06-01 19:03:09.557+00	2021-06-01 19:03:09.557+00
602	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 19:03:09.716+00	2021-06-01 19:03:09.716+00
603	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-01 19:03:11.605+00	2021-06-01 19:03:11.605+00
604	127.0.0.1	admin.areas.estruturas.edit	/admin/areas/estruturas/1/edit	GET	1	2021-06-01 19:03:13.842+00	2021-06-01 19:03:13.842+00
605	127.0.0.1	admin.areas.estruturas.update	/admin/areas/estruturas/1	PUT	1	2021-06-01 19:03:19.327+00	2021-06-01 19:03:19.327+00
606	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-01 19:03:19.471+00	2021-06-01 19:03:19.471+00
607	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 19:03:20.493+00	2021-06-01 19:03:20.493+00
608	127.0.0.1	admin.areas.furos.destroy	/admin/areas/furos/2	DELETE	1	2021-06-01 19:03:23.835+00	2021-06-01 19:03:23.835+00
609	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 19:03:23.984+00	2021-06-01 19:03:23.984+00
610	127.0.0.1	admin.areas.furos.edit	/admin/areas/furos/1/edit	GET	1	2021-06-01 19:03:24.799+00	2021-06-01 19:03:24.799+00
611	127.0.0.1	admin.areas.furos.update	/admin/areas/furos/1	PUT	1	2021-06-01 19:03:34.001+00	2021-06-01 19:03:34.001+00
612	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 19:03:34.158+00	2021-06-01 19:03:34.158+00
616	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 19:04:35.143+00	2021-06-01 19:04:35.143+00
617	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:04:37.083+00	2021-06-01 19:04:37.083+00
618	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-01 19:04:39.993+00	2021-06-01 19:04:39.993+00
619	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-01 19:04:53.177+00	2021-06-01 19:04:53.177+00
620	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-01 19:05:27.873+00	2021-06-01 19:05:27.873+00
621	127.0.0.1	admin.rdos.show	/admin/rdos/2	GET	1	2021-06-01 19:06:25.958+00	2021-06-01 19:06:25.958+00
622	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-01 19:06:31.068+00	2021-06-01 19:06:31.068+00
623	127.0.0.1	admin.rdos.destroy	/admin/rdos/2	DELETE	1	2021-06-01 19:06:44.16+00	2021-06-01 19:06:44.16+00
624	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-01 19:06:44.316+00	2021-06-01 19:06:44.316+00
625	127.0.0.1	admin.rdos.destroy	/admin/rdos/1	DELETE	1	2021-06-01 19:06:46.436+00	2021-06-01 19:06:46.436+00
626	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-01 19:06:46.589+00	2021-06-01 19:06:46.589+00
629	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 19:06:54.358+00	2021-06-01 19:06:54.358+00
630	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-01 19:06:58.783+00	2021-06-01 19:06:58.783+00
631	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-01 19:06:58.988+00	2021-06-01 19:06:58.988+00
632	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 19:07:21.951+00	2021-06-01 19:07:21.951+00
633	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-01 19:07:23.617+00	2021-06-01 19:07:23.617+00
634	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-01 19:07:25.876+00	2021-06-01 19:07:25.876+00
635	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-01 19:07:27.221+00	2021-06-01 19:07:27.222+00
636	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-01 19:07:28.498+00	2021-06-01 19:07:28.498+00
637	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-01 19:07:30.189+00	2021-06-01 19:07:30.189+00
638	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-01 19:07:34.557+00	2021-06-01 19:07:34.557+00
639	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 19:07:42.316+00	2021-06-01 19:07:42.316+00
640	127.0.0.1	admin.atividades.edit	/admin/atividades/2/edit	GET	1	2021-06-01 19:07:48.919+00	2021-06-01 19:07:48.919+00
641	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	1	2021-06-01 19:07:55.885+00	2021-06-01 19:07:55.885+00
642	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	1	2021-06-01 19:07:56.289+00	2021-06-01 19:07:56.289+00
644	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-01 19:08:03.259+00	2021-06-01 19:08:03.259+00
645	127.0.0.1	admin.rdos.show	/admin/rdos/3	GET	1	2021-06-01 19:08:07.415+00	2021-06-01 19:08:07.415+00
646	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 19:11:24.957+00	2021-06-01 19:11:24.957+00
647	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:11:26.681+00	2021-06-01 19:11:26.681+00
648	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:11:34.594+00	2021-06-01 19:11:34.594+00
649	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:11:40+00	2021-06-01 19:11:40+00
650	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 19:11:59.506+00	2021-06-01 19:11:59.506+00
651	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	1	2021-06-01 19:12:03.195+00	2021-06-01 19:12:03.195+00
654	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-01 19:13:24.73+00	2021-06-01 19:13:24.73+00
655	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 19:13:28.065+00	2021-06-01 19:13:28.065+00
656	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:13:30.136+00	2021-06-01 19:13:30.136+00
657	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:13:40.955+00	2021-06-01 19:13:40.955+00
659	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:16:02.362+00	2021-06-01 19:16:02.362+00
660	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-01 19:16:04.165+00	2021-06-01 19:16:04.165+00
661	127.0.0.1	admin.rdos.show	/admin/rdos/4	GET	1	2021-06-01 19:16:07.228+00	2021-06-01 19:16:07.228+00
662	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 19:16:19.77+00	2021-06-01 19:16:19.77+00
663	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-01 19:16:21.606+00	2021-06-01 19:16:21.606+00
664	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 19:16:25.457+00	2021-06-01 19:16:25.457+00
665	127.0.0.1	admin.atividades.edit	/admin/atividades/2/edit	GET	1	2021-06-01 19:16:28.366+00	2021-06-01 19:16:28.366+00
666	127.0.0.1	admin.atividades.update	/admin/atividades/2	PUT	1	2021-06-01 19:16:39.481+00	2021-06-01 19:16:39.481+00
667	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 19:16:39.655+00	2021-06-01 19:16:39.655+00
668	127.0.0.1	admin.atividades.edit	/admin/atividades/2/edit	GET	1	2021-06-01 19:16:42.825+00	2021-06-01 19:16:42.825+00
669	127.0.0.1	admin.atividades.update	/admin/atividades/2	PUT	1	2021-06-01 19:16:48.511+00	2021-06-01 19:16:48.511+00
670	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 19:16:48.686+00	2021-06-01 19:16:48.686+00
671	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	1	2021-06-01 19:16:51.746+00	2021-06-01 19:16:51.746+00
672	127.0.0.1	admin.atividades.update	/admin/atividades/5	PUT	1	2021-06-01 19:16:59.597+00	2021-06-01 19:16:59.597+00
673	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 19:16:59.772+00	2021-06-01 19:16:59.772+00
674	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	1	2021-06-01 19:17:03.475+00	2021-06-01 19:17:03.475+00
675	127.0.0.1	admin.atividades.update	/admin/atividades/5	PUT	1	2021-06-01 19:17:06.215+00	2021-06-01 19:17:06.215+00
676	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-01 19:17:06.394+00	2021-06-01 19:17:06.394+00
677	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-01 19:17:09.062+00	2021-06-01 19:17:09.062+00
678	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-01 19:17:10.74+00	2021-06-01 19:17:10.74+00
679	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:17:12.424+00	2021-06-01 19:17:12.424+00
680	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-01 19:17:18.919+00	2021-06-01 19:17:18.919+00
685	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-01 23:08:58.609+00	2021-06-01 23:08:58.609+00
686	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 01:56:03.859+00	2021-06-02 01:56:03.859+00
687	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 02:56:41.559+00	2021-06-02 02:56:41.559+00
688	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 03:34:10.593+00	2021-06-02 03:34:10.593+00
689	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 04:10:44.382+00	2021-06-02 04:10:44.383+00
690	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 07:23:54.35+00	2021-06-02 07:23:54.35+00
691	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 08:10:53.72+00	2021-06-02 08:10:53.72+00
692	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 08:47:11.295+00	2021-06-02 08:47:11.295+00
693	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 08:47:11.548+00	2021-06-02 08:47:11.548+00
694	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 09:15:59.341+00	2021-06-02 09:15:59.341+00
695	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-02 10:29:06.026+00	2021-06-02 10:29:06.026+00
696	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 11:08:56.898+00	2021-06-02 11:08:56.898+00
697	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 13:25:52.247+00	2021-06-02 13:25:52.247+00
698	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 15:03:17.567+00	2021-06-02 15:03:17.567+00
699	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 15:03:17.773+00	2021-06-02 15:03:17.773+00
700	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 17:41:58.353+00	2021-06-02 17:41:58.353+00
701	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 18:46:04.259+00	2021-06-02 18:46:04.259+00
702	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 19:27:46.342+00	2021-06-02 19:27:46.342+00
703	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 22:38:39.256+00	2021-06-02 22:38:39.256+00
704	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-02 22:49:37.372+00	2021-06-02 22:49:37.372+00
705	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 05:28:25.22+00	2021-06-03 05:28:25.22+00
706	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 06:10:17.094+00	2021-06-03 06:10:17.094+00
707	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 06:47:38.701+00	2021-06-03 06:47:38.701+00
708	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 06:47:40.862+00	2021-06-03 06:47:40.862+00
709	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 09:20:24.646+00	2021-06-03 09:20:24.646+00
710	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 12:24:15.207+00	2021-06-03 12:24:15.207+00
711	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 12:24:16.278+00	2021-06-03 12:24:16.278+00
712	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 13:45:30.932+00	2021-06-03 13:45:30.932+00
713	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 14:40:27.258+00	2021-06-03 14:40:27.258+00
714	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 17:42:57.338+00	2021-06-03 17:42:57.338+00
715	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 18:39:02.389+00	2021-06-03 18:39:02.389+00
716	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 22:06:00.708+00	2021-06-03 22:06:00.708+00
717	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-03 22:24:24.024+00	2021-06-03 22:24:24.024+00
718	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-03 22:51:50.62+00	2021-06-03 22:51:50.62+00
719	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 01:10:42.562+00	2021-06-04 01:10:42.562+00
720	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 03:12:56.189+00	2021-06-04 03:12:56.189+00
721	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 06:15:10.875+00	2021-06-04 06:15:10.875+00
722	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-04 06:18:09.426+00	2021-06-04 06:18:09.426+00
723	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 06:18:13.685+00	2021-06-04 06:18:13.685+00
724	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 07:38:18.942+00	2021-06-04 07:38:18.942+00
725	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 10:40:32.25+00	2021-06-04 10:40:32.25+00
726	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 10:40:32.59+00	2021-06-04 10:40:32.59+00
727	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 11:02:14.447+00	2021-06-04 11:02:14.447+00
728	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 11:10:53.296+00	2021-06-04 11:10:53.296+00
729	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 11:27:15.931+00	2021-06-04 11:27:15.931+00
730	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 13:35:53.011+00	2021-06-04 13:35:53.011+00
731	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 13:39:06.885+00	2021-06-04 13:39:06.885+00
732	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 14:29:24.113+00	2021-06-04 14:29:24.113+00
733	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 15:13:25.285+00	2021-06-04 15:13:25.285+00
734	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 15:19:56.077+00	2021-06-04 15:19:56.077+00
735	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 15:19:57.815+00	2021-06-04 15:19:57.815+00
736	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 17:08:47.096+00	2021-06-04 17:08:47.096+00
737	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 18:09:18.076+00	2021-06-04 18:09:18.076+00
738	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 18:23:10.819+00	2021-06-04 18:23:10.819+00
739	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-04 18:23:22.421+00	2021-06-04 18:23:22.421+00
740	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-04 18:23:22.657+00	2021-06-04 18:23:22.657+00
741	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-04 18:23:26.631+00	2021-06-04 18:23:26.631+00
742	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-04 18:23:29.335+00	2021-06-04 18:23:29.335+00
743	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-04 18:23:33.156+00	2021-06-04 18:23:33.156+00
744	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-04 18:23:33.324+00	2021-06-04 18:23:33.324+00
745	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-04 18:23:39.139+00	2021-06-04 18:23:39.139+00
746	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-04 18:23:39.358+00	2021-06-04 18:23:39.358+00
747	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-04 18:23:41.921+00	2021-06-04 18:23:41.921+00
748	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-04 18:23:45.503+00	2021-06-04 18:23:45.503+00
749	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-04 18:23:50.312+00	2021-06-04 18:23:50.312+00
750	127.0.0.1	admin.rdos.show	/admin/rdos/3	GET	1	2021-06-04 18:23:54.971+00	2021-06-04 18:23:54.971+00
751	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-04 20:51:17.719+00	2021-06-04 20:51:17.719+00
752	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 20:51:18.04+00	2021-06-04 20:51:18.04+00
753	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-04 21:33:06.915+00	2021-06-04 21:33:06.915+00
754	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 00:19:15.707+00	2021-06-05 00:19:15.707+00
755	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 00:19:15.933+00	2021-06-05 00:19:15.933+00
756	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 01:01:37.65+00	2021-06-05 01:01:37.651+00
757	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 08:22:55.574+00	2021-06-05 08:22:55.575+00
758	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 09:45:23.439+00	2021-06-05 09:45:23.439+00
759	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 10:01:29.91+00	2021-06-05 10:01:29.91+00
760	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 14:11:59.102+00	2021-06-05 14:11:59.103+00
761	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 14:12:05.683+00	2021-06-05 14:12:05.683+00
762	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 15:11:04.001+00	2021-06-05 15:11:04.001+00
763	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 15:11:04.185+00	2021-06-05 15:11:04.185+00
764	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 15:12:27.885+00	2021-06-05 15:12:27.885+00
765	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-05 15:12:41.826+00	2021-06-05 15:12:41.826+00
766	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-05 15:12:42.036+00	2021-06-05 15:12:42.036+00
767	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 15:15:59.319+00	2021-06-05 15:15:59.319+00
768	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-05 15:22:03.377+00	2021-06-05 15:22:03.377+00
769	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 15:22:03.675+00	2021-06-05 15:22:03.675+00
770	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 16:46:50.877+00	2021-06-05 16:46:50.877+00
771	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-05 20:48:43.546+00	2021-06-05 20:48:43.546+00
772	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 22:22:21.837+00	2021-06-05 22:22:21.837+00
773	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-05 22:53:55.667+00	2021-06-05 22:53:55.668+00
774	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-05 22:54:06.467+00	2021-06-05 22:54:06.467+00
775	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 00:05:59.138+00	2021-06-06 00:05:59.138+00
776	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 04:15:20.677+00	2021-06-06 04:15:20.677+00
777	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 05:13:54.218+00	2021-06-06 05:13:54.218+00
778	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 05:31:53.138+00	2021-06-06 05:31:53.139+00
779	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 05:46:00.587+00	2021-06-06 05:46:00.587+00
780	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 05:46:02.163+00	2021-06-06 05:46:02.163+00
781	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 06:57:59.483+00	2021-06-06 06:57:59.483+00
782	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 08:27:03.807+00	2021-06-06 08:27:03.807+00
783	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 08:27:03.999+00	2021-06-06 08:27:03.999+00
784	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 12:29:10.776+00	2021-06-06 12:29:10.776+00
785	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 14:44:31.698+00	2021-06-06 14:44:31.698+00
786	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 14:46:11.619+00	2021-06-06 14:46:11.62+00
787	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 14:46:12.784+00	2021-06-06 14:46:12.784+00
788	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-06 22:17:34.288+00	2021-06-06 22:17:34.289+00
789	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 00:54:58.612+00	2021-06-07 00:54:58.612+00
790	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 00:54:59.848+00	2021-06-07 00:54:59.848+00
791	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 01:46:54.892+00	2021-06-07 01:46:54.892+00
792	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 03:15:26.512+00	2021-06-07 03:15:26.512+00
793	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 05:16:36.484+00	2021-06-07 05:16:36.484+00
794	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 10:39:25.713+00	2021-06-07 10:39:25.713+00
795	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 11:04:45.75+00	2021-06-07 11:04:45.751+00
796	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 11:30:03.609+00	2021-06-07 11:30:03.609+00
797	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 13:01:55.981+00	2021-06-07 13:01:55.981+00
798	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 17:27:22.758+00	2021-06-07 17:27:22.758+00
799	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 17:27:22.963+00	2021-06-07 17:27:22.963+00
800	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 19:37:12.911+00	2021-06-07 19:37:12.911+00
801	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 19:50:26.792+00	2021-06-07 19:50:26.792+00
802	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 20:14:42.083+00	2021-06-07 20:14:42.083+00
803	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 20:14:58.918+00	2021-06-07 20:14:58.918+00
810	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-07 22:30:39.65+00	2021-06-07 22:30:39.65+00
818	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 00:45:45.016+00	2021-06-08 00:45:45.016+00
834	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 01:45:08.755+00	2021-06-08 01:45:08.755+00
835	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 02:28:59.615+00	2021-06-08 02:28:59.615+00
836	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 09:55:14.952+00	2021-06-08 09:55:14.952+00
837	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 11:34:13.92+00	2021-06-08 11:34:13.92+00
838	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 13:13:36.607+00	2021-06-08 13:13:36.607+00
839	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 13:13:37.5+00	2021-06-08 13:13:37.5+00
840	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 14:04:20.714+00	2021-06-08 14:04:20.714+00
841	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 14:52:43.296+00	2021-06-08 14:52:43.296+00
842	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 19:06:31.218+00	2021-06-08 19:06:31.218+00
843	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-08 19:22:01.073+00	2021-06-08 19:22:01.073+00
844	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-08 23:06:16.468+00	2021-06-08 23:06:16.468+00
845	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 01:47:25.146+00	2021-06-09 01:47:25.146+00
846	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 01:47:25.305+00	2021-06-09 01:47:25.306+00
847	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 03:26:25.341+00	2021-06-09 03:26:25.341+00
848	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 06:59:35.182+00	2021-06-09 06:59:35.182+00
849	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 10:55:28.862+00	2021-06-09 10:55:28.863+00
850	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 13:25:02.776+00	2021-06-09 13:25:02.776+00
851	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 14:52:47.249+00	2021-06-09 14:52:47.272+00
855	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 15:08:54.204+00	2021-06-09 15:08:54.204+00
856	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 15:26:14.118+00	2021-06-09 15:26:14.118+00
857	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-09 16:12:39.554+00	2021-06-09 16:12:39.554+00
858	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 18:24:19.665+00	2021-06-09 18:24:19.665+00
859	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 20:06:19.282+00	2021-06-09 20:06:19.282+00
860	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 20:06:19.472+00	2021-06-09 20:06:19.472+00
861	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-09 21:22:32.449+00	2021-06-09 21:22:32.449+00
862	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-10 13:12:24.164+00	2021-06-10 13:12:24.165+00
863	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-10 14:22:24.637+00	2021-06-10 14:22:24.637+00
864	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-10 14:45:38.446+00	2021-06-10 14:45:38.446+00
865	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-10 14:45:38.46+00	2021-06-10 14:45:38.46+00
866	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-10 17:31:03.024+00	2021-06-10 17:31:03.024+00
867	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-10 20:19:40.541+00	2021-06-10 20:19:40.541+00
868	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-10 20:32:50.142+00	2021-06-10 20:32:50.142+00
869	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-10 20:50:32.936+00	2021-06-10 20:50:32.936+00
870	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 01:26:38.103+00	2021-06-11 01:26:38.103+00
871	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 02:42:37.833+00	2021-06-11 02:42:37.833+00
872	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 03:54:53.9+00	2021-06-11 03:54:53.9+00
873	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 04:13:25.096+00	2021-06-11 04:13:25.096+00
874	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 04:13:39.643+00	2021-06-11 04:13:39.643+00
875	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 04:42:44.651+00	2021-06-11 04:42:44.651+00
876	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 04:56:23.222+00	2021-06-11 04:56:23.222+00
877	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 05:04:04.843+00	2021-06-11 05:04:04.843+00
878	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 05:27:49.505+00	2021-06-11 05:27:49.505+00
879	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 08:11:13.063+00	2021-06-11 08:11:13.064+00
880	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 08:16:47.781+00	2021-06-11 08:16:47.781+00
881	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 08:16:48.046+00	2021-06-11 08:16:48.046+00
882	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 08:30:17.121+00	2021-06-11 08:30:17.121+00
883	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 10:14:50.252+00	2021-06-11 10:14:50.252+00
884	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 10:46:33.684+00	2021-06-11 10:46:33.684+00
885	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 12:09:01.755+00	2021-06-11 12:09:01.755+00
886	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 12:16:06.593+00	2021-06-11 12:16:06.593+00
887	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 12:42:14.752+00	2021-06-11 12:42:14.752+00
888	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 16:09:25.017+00	2021-06-11 16:09:25.017+00
889	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 16:17:50.167+00	2021-06-11 16:17:50.167+00
890	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 16:22:44.056+00	2021-06-11 16:22:44.056+00
891	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 16:29:59.87+00	2021-06-11 16:29:59.87+00
892	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 16:57:05.706+00	2021-06-11 16:57:05.706+00
893	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 20:09:20.084+00	2021-06-11 20:09:20.084+00
894	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 20:26:26.216+00	2021-06-11 20:26:26.216+00
895	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-11 22:04:30.977+00	2021-06-11 22:04:30.977+00
896	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 00:01:23.802+00	2021-06-12 00:01:23.802+00
897	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 00:01:23.857+00	2021-06-12 00:01:23.857+00
898	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 02:16:38.407+00	2021-06-12 02:16:38.407+00
899	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 03:29:54.188+00	2021-06-12 03:29:54.188+00
900	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 08:21:28.949+00	2021-06-12 08:21:28.949+00
901	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 08:29:58.736+00	2021-06-12 08:29:58.736+00
902	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 08:46:56.182+00	2021-06-12 08:46:56.182+00
903	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 11:37:06.835+00	2021-06-12 11:37:06.835+00
904	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 11:52:15.257+00	2021-06-12 11:52:15.257+00
905	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 12:39:07.905+00	2021-06-12 12:39:07.905+00
906	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 13:54:43+00	2021-06-12 13:54:43.001+00
907	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 15:01:39.22+00	2021-06-12 15:01:39.221+00
908	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 17:19:31.941+00	2021-06-12 17:19:31.941+00
909	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 17:50:39.002+00	2021-06-12 17:50:39.002+00
910	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 17:50:39.816+00	2021-06-12 17:50:39.816+00
911	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 19:35:23.225+00	2021-06-12 19:35:23.225+00
912	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 19:41:39.473+00	2021-06-12 19:41:39.473+00
913	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 19:41:40.478+00	2021-06-12 19:41:40.478+00
914	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 20:46:28.102+00	2021-06-12 20:46:28.102+00
915	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 20:46:34.917+00	2021-06-12 20:46:34.917+00
916	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-12 21:30:26.311+00	2021-06-12 21:30:26.311+00
917	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 02:01:25.079+00	2021-06-13 02:01:25.079+00
918	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 02:26:24.094+00	2021-06-13 02:26:24.094+00
919	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 05:32:37.619+00	2021-06-13 05:32:37.619+00
920	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 06:12:26.833+00	2021-06-13 06:12:26.833+00
921	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 06:55:46.732+00	2021-06-13 06:55:46.732+00
922	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 09:58:46.31+00	2021-06-13 09:58:46.31+00
923	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 09:58:46.37+00	2021-06-13 09:58:46.37+00
924	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 11:35:15.573+00	2021-06-13 11:35:15.573+00
925	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 12:27:04.377+00	2021-06-13 12:27:04.378+00
926	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-13 17:07:19.377+00	2021-06-13 17:07:19.377+00
927	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 00:12:06.122+00	2021-06-14 00:12:06.122+00
928	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 03:30:43.346+00	2021-06-14 03:30:43.346+00
929	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 03:30:43.4+00	2021-06-14 03:30:43.4+00
930	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 04:33:08.511+00	2021-06-14 04:33:08.511+00
931	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 10:47:29.921+00	2021-06-14 10:47:29.921+00
932	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 12:21:18.857+00	2021-06-14 12:21:18.857+00
933	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 12:32:03.259+00	2021-06-14 12:32:03.26+00
934	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 15:55:22.754+00	2021-06-14 15:55:22.754+00
935	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 23:00:30.625+00	2021-06-14 23:00:30.625+00
936	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 23:02:35.588+00	2021-06-14 23:02:35.588+00
937	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 23:58:31.331+00	2021-06-14 23:58:31.331+00
938	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-14 23:58:31.472+00	2021-06-14 23:58:31.472+00
939	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 08:49:52.824+00	2021-06-15 08:49:52.825+00
940	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 12:10:43.621+00	2021-06-15 12:10:43.621+00
941	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 12:10:43.79+00	2021-06-15 12:10:43.79+00
942	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 16:07:19.578+00	2021-06-15 16:07:19.578+00
943	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 16:07:19.797+00	2021-06-15 16:07:19.797+00
944	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 16:45:14.703+00	2021-06-15 16:45:14.703+00
945	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 17:03:15.969+00	2021-06-15 17:03:15.969+00
946	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 19:02:00.966+00	2021-06-15 19:02:00.966+00
947	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 19:02:09.598+00	2021-06-15 19:02:09.598+00
948	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-15 19:02:16.156+00	2021-06-15 19:02:16.156+00
949	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-15 19:02:16.383+00	2021-06-15 19:02:16.383+00
950	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-15 19:02:23.792+00	2021-06-15 19:02:23.792+00
951	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-15 19:02:28.489+00	2021-06-15 19:02:28.489+00
952	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-15 19:02:33.412+00	2021-06-15 19:02:33.412+00
953	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-15 19:02:33.599+00	2021-06-15 19:02:33.6+00
954	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-15 19:02:37.721+00	2021-06-15 19:02:37.721+00
955	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 19:37:11.853+00	2021-06-15 19:37:11.853+00
956	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 22:30:26.314+00	2021-06-15 22:30:26.314+00
957	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-15 22:43:43.674+00	2021-06-15 22:43:43.675+00
958	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-16 01:51:11.59+00	2021-06-16 01:51:11.59+00
959	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-16 03:21:24.2+00	2021-06-16 03:21:24.2+00
960	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-16 09:30:32.657+00	2021-06-16 09:30:32.657+00
961	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-16 09:30:32.774+00	2021-06-16 09:30:32.774+00
962	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-16 11:58:17.438+00	2021-06-16 11:58:17.438+00
963	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-16 18:54:31.662+00	2021-06-16 18:54:31.663+00
964	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-16 20:02:47.461+00	2021-06-16 20:02:47.461+00
965	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-16 22:16:49.513+00	2021-06-16 22:16:49.513+00
966	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 00:31:55.475+00	2021-06-17 00:31:55.475+00
967	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 02:16:17.776+00	2021-06-17 02:16:17.776+00
968	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 04:15:51.366+00	2021-06-17 04:15:51.366+00
969	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 04:15:51.431+00	2021-06-17 04:15:51.431+00
970	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 04:50:23.525+00	2021-06-17 04:50:23.525+00
971	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 05:02:47.05+00	2021-06-17 05:02:47.05+00
972	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 06:13:57.789+00	2021-06-17 06:13:57.789+00
973	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 10:54:20.293+00	2021-06-17 10:54:20.293+00
974	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 11:23:17.826+00	2021-06-17 11:23:17.826+00
975	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 11:23:29.539+00	2021-06-17 11:23:29.539+00
976	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-17 11:24:14.589+00	2021-06-17 11:24:14.589+00
977	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-17 11:24:14.829+00	2021-06-17 11:24:14.829+00
978	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-17 11:24:35.183+00	2021-06-17 11:24:35.183+00
979	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-06-17 11:30:01.099+00	2021-06-17 11:30:01.099+00
980	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-17 11:30:01.679+00	2021-06-17 11:30:01.679+00
981	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-17 11:31:21.148+00	2021-06-17 11:31:21.148+00
982	127.0.0.1	admin.contratos.edit	/admin/contratos/2/edit	GET	1	2021-06-17 11:31:32.218+00	2021-06-17 11:31:32.218+00
983	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-17 11:31:41.046+00	2021-06-17 11:31:41.046+00
984	127.0.0.1	admin.contratos.edit	/admin/contratos/2/edit	GET	1	2021-06-17 11:31:48.37+00	2021-06-17 11:31:48.37+00
985	127.0.0.1	admin.contratos.update	/admin/contratos/2	PUT	1	2021-06-17 11:33:56.876+00	2021-06-17 11:33:56.876+00
986	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-17 11:33:57.778+00	2021-06-17 11:33:57.778+00
987	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-17 11:34:25.519+00	2021-06-17 11:34:25.519+00
988	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-17 11:35:13.119+00	2021-06-17 11:35:13.119+00
989	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-17 11:35:23.249+00	2021-06-17 11:35:23.249+00
990	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-17 11:35:30.987+00	2021-06-17 11:35:30.987+00
991	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-17 11:35:50.414+00	2021-06-17 11:35:50.414+00
992	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-17 11:37:38.165+00	2021-06-17 11:37:38.165+00
993	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-17 11:37:58.609+00	2021-06-17 11:37:58.609+00
994	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-17 11:39:06.094+00	2021-06-17 11:39:06.094+00
995	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-17 11:39:10.812+00	2021-06-17 11:39:10.812+00
996	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-17 11:39:16.643+00	2021-06-17 11:39:16.643+00
997	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-17 11:41:07.728+00	2021-06-17 11:41:07.728+00
998	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-17 11:41:14.063+00	2021-06-17 11:41:14.063+00
999	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-17 11:41:38.337+00	2021-06-17 11:41:38.337+00
1000	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-17 11:41:41.368+00	2021-06-17 11:41:41.368+00
1001	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-17 11:42:38.525+00	2021-06-17 11:42:38.525+00
1002	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-17 11:42:39.008+00	2021-06-17 11:42:39.008+00
1003	127.0.0.1	admin.cargos.edit	/admin/cargos/2/edit	GET	1	2021-06-17 11:42:49.905+00	2021-06-17 11:42:49.905+00
1004	127.0.0.1	admin.cargos.update	/admin/cargos/2	PUT	1	2021-06-17 11:42:55.445+00	2021-06-17 11:42:55.445+00
1005	127.0.0.1	admin.cargos.edit	/admin/cargos/2/edit	GET	1	2021-06-17 11:42:55.788+00	2021-06-17 11:42:55.788+00
1006	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-17 11:43:01.717+00	2021-06-17 11:43:01.717+00
1007	127.0.0.1	admin.cargos.edit	/admin/cargos/9/edit	GET	1	2021-06-17 11:43:07.155+00	2021-06-17 11:43:07.155+00
1008	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-17 11:43:10.281+00	2021-06-17 11:43:10.281+00
1009	127.0.0.1	admin.cargos.edit	/admin/cargos/2/edit	GET	1	2021-06-17 11:43:12.144+00	2021-06-17 11:43:12.144+00
1010	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-17 11:43:14.838+00	2021-06-17 11:43:14.838+00
1011	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-17 11:44:32.45+00	2021-06-17 11:44:32.45+00
1012	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-17 11:44:36.647+00	2021-06-17 11:44:36.647+00
1013	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-17 11:45:13.02+00	2021-06-17 11:45:13.02+00
1014	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-17 11:45:13.235+00	2021-06-17 11:45:13.235+00
1015	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-17 11:45:30.281+00	2021-06-17 11:45:30.281+00
1016	127.0.0.1	admin.rdos.show	/admin/rdos/3	GET	1	2021-06-17 11:45:33.35+00	2021-06-17 11:45:33.35+00
1017	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-17 11:45:48.866+00	2021-06-17 11:45:48.866+00
1018	127.0.0.1	admin.rdos.show	/admin/rdos/4	GET	1	2021-06-17 11:45:52.244+00	2021-06-17 11:45:52.244+00
1019	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-17 11:46:12.162+00	2021-06-17 11:46:12.163+00
1020	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-17 11:46:14.368+00	2021-06-17 11:46:14.368+00
1021	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-17 11:46:15.765+00	2021-06-17 11:46:15.765+00
1022	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-17 11:46:17.423+00	2021-06-17 11:46:17.423+00
1023	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 11:47:20.829+00	2021-06-17 11:47:20.829+00
1024	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 11:47:51.067+00	2021-06-17 11:47:51.067+00
1025	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-17 11:48:06.354+00	2021-06-17 11:48:06.354+00
1026	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-17 11:48:06.554+00	2021-06-17 11:48:06.554+00
1027	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-17 11:48:13.074+00	2021-06-17 11:48:13.074+00
1028	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-17 11:51:18.831+00	2021-06-17 11:51:18.831+00
1029	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 14:01:29.017+00	2021-06-17 14:01:29.017+00
1030	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 18:17:52.737+00	2021-06-17 18:17:52.737+00
1031	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 20:01:21.322+00	2021-06-17 20:01:21.322+00
1032	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 20:52:49.596+00	2021-06-17 20:52:49.596+00
1033	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 20:52:50.256+00	2021-06-17 20:52:50.256+00
1034	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-17 23:10:43.58+00	2021-06-17 23:10:43.58+00
1035	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 01:55:38.687+00	2021-06-18 01:55:38.687+00
1036	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 02:34:00.034+00	2021-06-18 02:34:00.034+00
1037	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 02:35:27.98+00	2021-06-18 02:35:27.98+00
1038	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 03:03:32.809+00	2021-06-18 03:03:32.809+00
1039	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 09:49:01.794+00	2021-06-18 09:49:01.794+00
1040	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 11:28:43.61+00	2021-06-18 11:28:43.61+00
1041	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-18 11:29:07.281+00	2021-06-18 11:29:07.281+00
1042	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 11:29:07.444+00	2021-06-18 11:29:07.444+00
1043	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-18 11:30:34.945+00	2021-06-18 11:30:34.945+00
1044	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-18 11:30:50.852+00	2021-06-18 11:30:50.852+00
1045	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-18 11:32:08.299+00	2021-06-18 11:32:08.299+00
1046	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 11:32:20.385+00	2021-06-18 11:32:20.385+00
1047	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 11:32:22.706+00	2021-06-18 11:32:22.706+00
1048	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-18 11:32:45.626+00	2021-06-18 11:32:45.626+00
1049	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-18 11:32:47.635+00	2021-06-18 11:32:47.636+00
1050	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-18 11:32:49.554+00	2021-06-18 11:32:49.554+00
1051	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-18 11:32:50.541+00	2021-06-18 11:32:50.541+00
1052	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-18 11:32:51.951+00	2021-06-18 11:32:51.951+00
1053	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 11:42:47.04+00	2021-06-18 11:42:47.04+00
1054	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 11:43:54.456+00	2021-06-18 11:43:54.456+00
1055	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-18 11:44:56.183+00	2021-06-18 11:44:56.183+00
1056	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 11:44:56.339+00	2021-06-18 11:44:56.339+00
1057	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 11:45:00.179+00	2021-06-18 11:45:00.179+00
1058	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	1	2021-06-18 11:45:06.328+00	2021-06-18 11:45:06.328+00
1059	127.0.0.1	admin.contratos.update	/admin/contratos/1	PUT	1	2021-06-18 11:45:13.883+00	2021-06-18 11:45:13.883+00
1060	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 11:45:14.042+00	2021-06-18 11:45:14.042+00
1061	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 11:45:21.682+00	2021-06-18 11:45:21.682+00
1062	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 11:45:26.541+00	2021-06-18 11:45:26.541+00
1063	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 11:45:32.523+00	2021-06-18 11:45:32.523+00
1064	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 11:45:34.479+00	2021-06-18 11:45:34.479+00
1065	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 11:45:37.054+00	2021-06-18 11:45:37.054+00
1066	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	1	2021-06-18 11:45:46.117+00	2021-06-18 11:45:46.117+00
1067	127.0.0.1	admin.contratos.update	/admin/contratos/1	PUT	1	2021-06-18 11:45:50.042+00	2021-06-18 11:45:50.042+00
1068	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 11:45:50.201+00	2021-06-18 11:45:50.201+00
1069	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-18 11:45:53.204+00	2021-06-18 11:45:53.204+00
1070	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-18 11:45:54.953+00	2021-06-18 11:45:54.953+00
1071	127.0.0.1	admin.areas.complexos.create	/admin/areas/complexos/create	GET	1	2021-06-18 11:45:57.402+00	2021-06-18 11:45:57.402+00
1072	127.0.0.1	admin.areas.complexos.store	/admin/areas/complexos	POST	1	2021-06-18 11:46:13.189+00	2021-06-18 11:46:13.189+00
1073	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-18 11:46:13.347+00	2021-06-18 11:46:13.347+00
1074	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-18 11:46:14.821+00	2021-06-18 11:46:14.821+00
1075	127.0.0.1	admin.areas.minas.create	/admin/areas/minas/create	GET	1	2021-06-18 11:46:17.446+00	2021-06-18 11:46:17.446+00
1076	127.0.0.1	admin.areas.minas.store	/admin/areas/minas	POST	1	2021-06-18 11:46:26.496+00	2021-06-18 11:46:26.496+00
1077	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-18 11:46:26.669+00	2021-06-18 11:46:26.669+00
1078	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-18 11:46:28.112+00	2021-06-18 11:46:28.112+00
1079	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	1	2021-06-18 11:46:30.119+00	2021-06-18 11:46:30.119+00
1080	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	1	2021-06-18 11:46:36.862+00	2021-06-18 11:46:36.862+00
1081	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-18 11:46:37.031+00	2021-06-18 11:46:37.031+00
1082	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	1	2021-06-18 11:46:39.037+00	2021-06-18 11:46:39.037+00
1083	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	1	2021-06-18 11:46:47.231+00	2021-06-18 11:46:47.231+00
1084	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-18 11:46:47.397+00	2021-06-18 11:46:47.397+00
1085	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	1	2021-06-18 11:46:49.435+00	2021-06-18 11:46:49.435+00
1086	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	1	2021-06-18 11:46:56.113+00	2021-06-18 11:46:56.113+00
1087	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-18 11:46:56.278+00	2021-06-18 11:46:56.278+00
1088	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	1	2021-06-18 11:46:58.421+00	2021-06-18 11:46:58.421+00
1089	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	1	2021-06-18 11:47:05.472+00	2021-06-18 11:47:05.472+00
1090	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-18 11:47:05.646+00	2021-06-18 11:47:05.646+00
1091	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-18 11:47:08.459+00	2021-06-18 11:47:08.459+00
1092	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	1	2021-06-18 11:47:10.369+00	2021-06-18 11:47:10.369+00
1093	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	1	2021-06-18 11:47:17.715+00	2021-06-18 11:47:17.715+00
1094	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-18 11:47:17.875+00	2021-06-18 11:47:17.875+00
1095	127.0.0.1	admin.areas.furos.edit	/admin/areas/furos/4/edit	GET	1	2021-06-18 11:47:25.528+00	2021-06-18 11:47:25.528+00
1096	127.0.0.1	admin.areas.furos.update	/admin/areas/furos/4	PUT	1	2021-06-18 11:47:29.801+00	2021-06-18 11:47:29.801+00
1097	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-18 11:47:29.99+00	2021-06-18 11:47:29.99+00
1098	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 11:47:34.931+00	2021-06-18 11:47:34.931+00
1099	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 11:47:44.054+00	2021-06-18 11:47:44.054+00
1100	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-18 11:47:45.519+00	2021-06-18 11:47:45.519+00
1101	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 11:47:48.524+00	2021-06-18 11:47:48.524+00
1102	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 11:47:49.957+00	2021-06-18 11:47:49.957+00
1103	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 11:47:55.429+00	2021-06-18 11:47:55.429+00
1104	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 11:48:40.501+00	2021-06-18 11:48:40.501+00
1105	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 11:48:40.729+00	2021-06-18 11:48:40.729+00
1106	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 11:48:48.424+00	2021-06-18 11:48:48.424+00
1107	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 11:48:50.658+00	2021-06-18 11:48:50.658+00
1108	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-18 11:49:21.966+00	2021-06-18 11:49:21.966+00
1109	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 11:49:22.118+00	2021-06-18 11:49:22.118+00
1110	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 11:49:26.328+00	2021-06-18 11:49:26.328+00
1111	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-18 11:49:33.093+00	2021-06-18 11:49:33.093+00
1112	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 11:49:33.258+00	2021-06-18 11:49:33.258+00
1113	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-18 11:49:43.926+00	2021-06-18 11:49:43.926+00
1114	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 11:49:44.085+00	2021-06-18 11:49:44.085+00
1115	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 11:49:54.746+00	2021-06-18 11:49:54.746+00
1116	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 11:50:09.228+00	2021-06-18 11:50:09.228+00
1117	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 11:50:22.404+00	2021-06-18 11:50:22.404+00
1118	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 11:50:33.881+00	2021-06-18 11:50:33.881+00
1119	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 13:33:27.948+00	2021-06-18 13:33:27.948+00
1120	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-18 13:33:34.945+00	2021-06-18 13:33:34.945+00
1121	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 13:33:35.321+00	2021-06-18 13:33:35.321+00
1122	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 13:34:10.551+00	2021-06-18 13:34:10.552+00
1123	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 13:34:22.093+00	2021-06-18 13:34:22.093+00
1124	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-18 13:34:26.441+00	2021-06-18 13:34:26.441+00
1125	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 13:34:26.728+00	2021-06-18 13:34:26.728+00
1126	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 13:34:30.307+00	2021-06-18 13:34:30.307+00
1127	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 13:47:15.733+00	2021-06-18 13:47:15.733+00
1128	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 13:56:06.47+00	2021-06-18 13:56:06.47+00
1129	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 13:58:36.309+00	2021-06-18 13:58:36.309+00
1130	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 13:59:04.945+00	2021-06-18 13:59:04.945+00
1131	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 13:59:31.696+00	2021-06-18 13:59:31.696+00
1132	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-06-18 14:01:19.844+00	2021-06-18 14:01:19.844+00
1133	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-06-18 14:01:20.18+00	2021-06-18 14:01:20.18+00
1134	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-18 14:01:20.802+00	2021-06-18 14:01:20.802+00
1135	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-18 14:01:20.832+00	2021-06-18 14:01:20.832+00
1136	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:01:23.935+00	2021-06-18 14:01:23.935+00
1137	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-18 14:01:55.206+00	2021-06-18 14:01:55.206+00
1138	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-18 14:01:58.969+00	2021-06-18 14:01:58.969+00
1139	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:06:04.159+00	2021-06-18 14:06:04.159+00
1140	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:07:13.559+00	2021-06-18 14:07:13.559+00
1141	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-18 14:07:33.592+00	2021-06-18 14:07:33.592+00
1142	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 14:07:34.161+00	2021-06-18 14:07:34.161+00
1143	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-18 14:07:37.943+00	2021-06-18 14:07:37.943+00
1144	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-18 14:07:45.222+00	2021-06-18 14:07:45.222+00
1145	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:08:07.404+00	2021-06-18 14:08:07.404+00
1146	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:08:11.157+00	2021-06-18 14:08:11.157+00
1147	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:09:06.904+00	2021-06-18 14:09:06.904+00
1148	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:09:55.767+00	2021-06-18 14:09:55.767+00
1149	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-18 14:10:10.579+00	2021-06-18 14:10:10.579+00
1150	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 14:10:50.927+00	2021-06-18 14:10:50.927+00
1151	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 14:11:30.466+00	2021-06-18 14:11:30.466+00
1152	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:18:31.92+00	2021-06-18 14:18:31.92+00
1153	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:18:34.803+00	2021-06-18 14:18:34.803+00
1154	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:20:02.109+00	2021-06-18 14:20:02.109+00
1155	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:20:02.26+00	2021-06-18 14:20:02.26+00
1156	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-18 14:21:38.525+00	2021-06-18 14:21:38.525+00
1157	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:27:23.39+00	2021-06-18 14:27:23.39+00
1158	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-18 14:27:40.212+00	2021-06-18 14:27:40.212+00
1159	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 14:27:40.406+00	2021-06-18 14:27:40.406+00
1160	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:27:48.165+00	2021-06-18 14:27:48.165+00
1161	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-18 14:27:56.964+00	2021-06-18 14:27:56.964+00
1162	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:27:57.221+00	2021-06-18 14:27:57.221+00
1163	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:28:06.746+00	2021-06-18 14:28:06.746+00
1164	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:28:10.607+00	2021-06-18 14:28:10.607+00
1165	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-18 14:28:14.386+00	2021-06-18 14:28:14.386+00
1166	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:28:30.194+00	2021-06-18 14:28:30.194+00
1167	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:28:41.864+00	2021-06-18 14:28:41.864+00
1168	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:29:54.281+00	2021-06-18 14:29:54.281+00
1169	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:29:55.018+00	2021-06-18 14:29:55.018+00
1170	127.0.0.1	admin.cargos.edit	/admin/cargos/11/edit	GET	1	2021-06-18 14:30:15.683+00	2021-06-18 14:30:15.683+00
1171	127.0.0.1	admin.cargos.update	/admin/cargos/11	PUT	1	2021-06-18 14:30:22.014+00	2021-06-18 14:30:22.014+00
1172	127.0.0.1	admin.cargos.edit	/admin/cargos/11/edit	GET	1	2021-06-18 14:30:22.541+00	2021-06-18 14:30:22.541+00
1173	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:30:27.877+00	2021-06-18 14:30:27.877+00
1174	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 14:31:01.722+00	2021-06-18 14:31:01.722+00
1175	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:31:41.495+00	2021-06-18 14:31:41.495+00
1176	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:31:53.747+00	2021-06-18 14:31:53.747+00
1177	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:31:57.297+00	2021-06-18 14:31:57.297+00
1178	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:33:05.238+00	2021-06-18 14:33:05.238+00
1179	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:33:05.506+00	2021-06-18 14:33:05.506+00
1180	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:33:08.458+00	2021-06-18 14:33:08.458+00
1181	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:33:19.547+00	2021-06-18 14:33:19.547+00
1182	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:33:19.962+00	2021-06-18 14:33:19.962+00
1183	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:33:23.344+00	2021-06-18 14:33:23.344+00
1184	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:33:42.691+00	2021-06-18 14:33:42.691+00
1185	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:33:42.907+00	2021-06-18 14:33:42.907+00
1186	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:33:46.217+00	2021-06-18 14:33:46.217+00
1187	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:34:14.161+00	2021-06-18 14:34:14.161+00
1188	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:34:14.376+00	2021-06-18 14:34:14.376+00
1189	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:34:18.478+00	2021-06-18 14:34:18.478+00
1190	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:34:26.198+00	2021-06-18 14:34:26.198+00
1191	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:34:26.843+00	2021-06-18 14:34:26.843+00
1192	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:34:30.506+00	2021-06-18 14:34:30.506+00
1193	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:34:59.888+00	2021-06-18 14:34:59.888+00
1194	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:35:00.235+00	2021-06-18 14:35:00.235+00
1195	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:35:03.902+00	2021-06-18 14:35:03.902+00
1196	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:35:23.067+00	2021-06-18 14:35:23.067+00
1197	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:35:23.475+00	2021-06-18 14:35:23.475+00
1198	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:35:27.326+00	2021-06-18 14:35:27.326+00
1199	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:36:27.714+00	2021-06-18 14:36:27.714+00
1200	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:36:28.045+00	2021-06-18 14:36:28.045+00
1201	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:36:32.989+00	2021-06-18 14:36:32.989+00
1202	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:36:57.691+00	2021-06-18 14:36:57.691+00
1203	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:36:58.029+00	2021-06-18 14:36:58.029+00
1204	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:37:18.074+00	2021-06-18 14:37:18.074+00
1205	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:37:30.044+00	2021-06-18 14:37:30.044+00
1206	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:37:30.355+00	2021-06-18 14:37:30.355+00
1207	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:37:32.526+00	2021-06-18 14:37:32.526+00
1208	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:37:41.665+00	2021-06-18 14:37:41.665+00
1209	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:37:42.077+00	2021-06-18 14:37:42.077+00
1210	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:37:47.315+00	2021-06-18 14:37:47.315+00
1211	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:38:16.889+00	2021-06-18 14:38:16.889+00
1212	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:38:18.092+00	2021-06-18 14:38:18.092+00
1213	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:38:21.529+00	2021-06-18 14:38:21.529+00
1214	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:38:41.152+00	2021-06-18 14:38:41.152+00
1215	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:38:46.307+00	2021-06-18 14:38:46.307+00
1216	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:39:11.789+00	2021-06-18 14:39:11.789+00
1217	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 14:39:14.621+00	2021-06-18 14:39:14.621+00
1218	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-18 14:41:15.694+00	2021-06-18 14:41:15.694+00
1219	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:42:37.305+00	2021-06-18 14:42:37.305+00
1220	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-18 14:42:41.355+00	2021-06-18 14:42:41.355+00
1221	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-18 14:42:53.678+00	2021-06-18 14:42:53.678+00
1222	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:42:54.102+00	2021-06-18 14:42:54.102+00
1223	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:43:00.583+00	2021-06-18 14:43:00.583+00
1224	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 14:43:13.329+00	2021-06-18 14:43:13.329+00
1225	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-18 14:43:45.722+00	2021-06-18 14:43:45.722+00
1226	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 14:43:45.944+00	2021-06-18 14:43:45.944+00
1227	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-18 14:44:26.031+00	2021-06-18 14:44:26.031+00
1228	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 14:44:27.116+00	2021-06-18 14:44:27.116+00
1229	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-18 14:44:54.054+00	2021-06-18 14:44:54.054+00
1230	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 14:44:54.468+00	2021-06-18 14:44:54.468+00
1231	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:44:58.793+00	2021-06-18 14:44:58.793+00
1232	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-18 14:46:42.086+00	2021-06-18 14:46:42.086+00
1233	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:46:42.304+00	2021-06-18 14:46:42.304+00
1234	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-18 14:46:50.215+00	2021-06-18 14:46:50.215+00
1235	127.0.0.1	admin.rdos.show	/admin/rdos/3	GET	1	2021-06-18 14:46:55.891+00	2021-06-18 14:46:55.891+00
1236	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:47:11.172+00	2021-06-18 14:47:11.172+00
1237	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-18 14:47:13.337+00	2021-06-18 14:47:13.337+00
1238	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:47:13.905+00	2021-06-18 14:47:13.905+00
1239	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-18 14:47:16.099+00	2021-06-18 14:47:16.099+00
1240	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:47:17.354+00	2021-06-18 14:47:17.354+00
1241	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 14:47:18.671+00	2021-06-18 14:47:18.671+00
1242	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-18 14:47:20.297+00	2021-06-18 14:47:20.297+00
1243	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-18 14:47:22.436+00	2021-06-18 14:47:22.436+00
1244	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 14:47:27.311+00	2021-06-18 14:47:27.311+00
1245	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 14:47:28.74+00	2021-06-18 14:47:28.74+00
1246	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-18 14:47:31.624+00	2021-06-18 14:47:31.624+00
1247	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 14:48:02.577+00	2021-06-18 14:48:02.577+00
1248	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-18 14:48:20.281+00	2021-06-18 14:48:20.281+00
1249	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:48:21.389+00	2021-06-18 14:48:21.389+00
1250	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-18 14:48:23.338+00	2021-06-18 14:48:23.338+00
1251	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-18 14:48:30.614+00	2021-06-18 14:48:30.614+00
1252	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:48:34.8+00	2021-06-18 14:48:34.8+00
1253	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:48:55.986+00	2021-06-18 14:48:55.986+00
1254	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:50:08.76+00	2021-06-18 14:50:08.76+00
1255	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:50:25.426+00	2021-06-18 14:50:25.426+00
1256	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:50:54.288+00	2021-06-18 14:50:54.288+00
1257	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-18 14:51:08.715+00	2021-06-18 14:51:08.715+00
1258	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 14:51:08.94+00	2021-06-18 14:51:08.94+00
1259	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:51:16.496+00	2021-06-18 14:51:16.496+00
1260	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:51:39.668+00	2021-06-18 14:51:39.668+00
1261	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-18 14:51:43.091+00	2021-06-18 14:51:43.091+00
1262	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:51:43.266+00	2021-06-18 14:51:43.266+00
1263	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:51:46.385+00	2021-06-18 14:51:46.385+00
1264	127.0.0.1	admin.users.edit	/admin/users/6/edit	GET	1	2021-06-18 14:51:48.995+00	2021-06-18 14:51:48.995+00
1265	127.0.0.1	admin.users.update	/admin/users/6	PUT	1	2021-06-18 14:52:10.971+00	2021-06-18 14:52:10.971+00
1266	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:52:11.182+00	2021-06-18 14:52:11.182+00
1267	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-18 14:52:17.765+00	2021-06-18 14:52:17.765+00
1268	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:52:17.949+00	2021-06-18 14:52:17.949+00
1269	127.0.0.1	sessions.store	/sessions	POST	6	2021-06-18 14:52:22.453+00	2021-06-18 14:52:22.453+00
1270	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-18 14:52:22.678+00	2021-06-18 14:52:22.678+00
1271	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	6	2021-06-18 14:54:01.546+00	2021-06-18 14:54:01.546+00
1272	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:54:02.11+00	2021-06-18 14:54:02.11+00
1273	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:54:57.688+00	2021-06-18 14:54:57.688+00
1274	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:55:08.312+00	2021-06-18 14:55:08.312+00
1275	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 14:55:17.245+00	2021-06-18 14:55:17.245+00
1276	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-18 14:55:21.15+00	2021-06-18 14:55:21.15+00
1277	127.0.0.1	admin.cargos.edit	/admin/cargos/14/edit	GET	1	2021-06-18 14:55:27.08+00	2021-06-18 14:55:27.08+00
1278	127.0.0.1	admin.cargos.edit	/admin/cargos/11/edit	GET	1	2021-06-18 14:55:37.358+00	2021-06-18 14:55:37.358+00
1279	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 14:55:46.842+00	2021-06-18 14:55:46.842+00
1280	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 14:55:47.86+00	2021-06-18 14:55:47.86+00
1281	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 14:55:49.915+00	2021-06-18 14:55:49.915+00
1282	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 15:05:54.839+00	2021-06-18 15:05:54.839+00
1283	127.0.0.1	sessions.store	/sessions	POST	6	2021-06-18 15:27:42.591+00	2021-06-18 15:27:42.591+00
1284	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-18 15:27:42.77+00	2021-06-18 15:27:42.77+00
1285	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 15:27:46.009+00	2021-06-18 15:27:46.009+00
1286	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 15:28:44.742+00	2021-06-18 15:28:44.742+00
1287	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 15:28:47.633+00	2021-06-18 15:28:47.633+00
1288	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 15:35:36.297+00	2021-06-18 15:35:36.297+00
1289	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 15:35:36.717+00	2021-06-18 15:35:36.717+00
1290	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 15:35:41.857+00	2021-06-18 15:35:41.857+00
1291	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 15:44:05.953+00	2021-06-18 15:44:05.953+00
1292	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 15:44:06.179+00	2021-06-18 15:44:06.179+00
1293	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 15:44:24.962+00	2021-06-18 15:44:24.962+00
1294	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 15:44:28.935+00	2021-06-18 15:44:28.935+00
1295	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 15:44:36.402+00	2021-06-18 15:44:36.402+00
1296	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-18 15:44:38.057+00	2021-06-18 15:44:38.057+00
1297	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 15:44:42.09+00	2021-06-18 15:44:42.09+00
1298	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 15:44:48.077+00	2021-06-18 15:44:48.077+00
1299	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 15:44:48.398+00	2021-06-18 15:44:48.398+00
1300	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 15:44:51.37+00	2021-06-18 15:44:51.37+00
1301	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 15:44:58.77+00	2021-06-18 15:44:58.77+00
1302	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:45:03.275+00	2021-06-18 15:45:03.275+00
1303	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 15:45:17.806+00	2021-06-18 15:45:17.806+00
1304	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-18 15:45:28.863+00	2021-06-18 15:45:28.863+00
1305	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-18 15:45:39.405+00	2021-06-18 15:45:39.405+00
1306	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 15:45:44.842+00	2021-06-18 15:45:44.842+00
1307	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 15:45:49.052+00	2021-06-18 15:45:49.052+00
1308	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 15:45:49.322+00	2021-06-18 15:45:49.322+00
1309	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 15:46:26.737+00	2021-06-18 15:46:26.737+00
1310	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:46:46.769+00	2021-06-18 15:46:46.769+00
1311	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:46:52.536+00	2021-06-18 15:46:52.536+00
1312	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:47:24.806+00	2021-06-18 15:47:24.806+00
1313	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:47:26.216+00	2021-06-18 15:47:26.216+00
1314	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:47:29.691+00	2021-06-18 15:47:29.691+00
1315	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:47:48.62+00	2021-06-18 15:47:48.62+00
1316	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:47:48.962+00	2021-06-18 15:47:48.962+00
1317	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:47:51.364+00	2021-06-18 15:47:51.364+00
1318	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:48:18.073+00	2021-06-18 15:48:18.073+00
1319	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:48:19.628+00	2021-06-18 15:48:19.628+00
1320	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:48:24.63+00	2021-06-18 15:48:24.63+00
1321	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:48:33.88+00	2021-06-18 15:48:33.88+00
1322	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:48:34.464+00	2021-06-18 15:48:34.464+00
1323	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:48:43.344+00	2021-06-18 15:48:43.344+00
1324	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:48:52.105+00	2021-06-18 15:48:52.105+00
1325	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:48:52.419+00	2021-06-18 15:48:52.419+00
1326	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:48:55.693+00	2021-06-18 15:48:55.693+00
1327	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:49:11.051+00	2021-06-18 15:49:11.051+00
1328	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:49:11.272+00	2021-06-18 15:49:11.272+00
1329	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:49:15.033+00	2021-06-18 15:49:15.033+00
1330	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:49:23.121+00	2021-06-18 15:49:23.121+00
1331	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:49:23.142+00	2021-06-18 15:49:23.142+00
1332	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:49:23.377+00	2021-06-18 15:49:23.377+00
1333	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:49:36.167+00	2021-06-18 15:49:36.167+00
1334	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:49:51.667+00	2021-06-18 15:49:51.667+00
1335	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:49:52.807+00	2021-06-18 15:49:52.807+00
1336	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:49:56.451+00	2021-06-18 15:49:56.451+00
1337	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:50:06.474+00	2021-06-18 15:50:06.474+00
1338	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:50:07.12+00	2021-06-18 15:50:07.12+00
1339	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:50:13.029+00	2021-06-18 15:50:13.029+00
1340	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:50:21.038+00	2021-06-18 15:50:21.038+00
1341	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:50:21.805+00	2021-06-18 15:50:21.805+00
1342	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:50:46.07+00	2021-06-18 15:50:46.07+00
1343	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:50:58.441+00	2021-06-18 15:50:58.441+00
1344	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:50:59.008+00	2021-06-18 15:50:59.008+00
1345	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:51:04.981+00	2021-06-18 15:51:04.981+00
1346	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:51:14.196+00	2021-06-18 15:51:14.196+00
1347	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:51:15.205+00	2021-06-18 15:51:15.205+00
1348	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:51:20.011+00	2021-06-18 15:51:20.011+00
1349	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:51:30.414+00	2021-06-18 15:51:30.414+00
1350	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:51:30.83+00	2021-06-18 15:51:30.83+00
1351	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/8/edit	GET	6	2021-06-18 15:52:15.333+00	2021-06-18 15:52:15.333+00
1352	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/8	PUT	6	2021-06-18 15:52:20.771+00	2021-06-18 15:52:20.771+00
1353	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:52:21.634+00	2021-06-18 15:52:21.634+00
1354	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:52:35.705+00	2021-06-18 15:52:35.705+00
1355	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:54:40.798+00	2021-06-18 15:54:40.798+00
1356	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:54:41.034+00	2021-06-18 15:54:41.034+00
1357	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:54:46.6+00	2021-06-18 15:54:46.6+00
1358	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:55:43.102+00	2021-06-18 15:55:43.102+00
1359	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:55:43.611+00	2021-06-18 15:55:43.611+00
1360	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/18/edit	GET	6	2021-06-18 15:55:47.718+00	2021-06-18 15:55:47.718+00
1361	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/18	PUT	6	2021-06-18 15:55:53.798+00	2021-06-18 15:55:53.798+00
1362	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:55:54.229+00	2021-06-18 15:55:54.229+00
1363	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:55:58.895+00	2021-06-18 15:55:58.895+00
1364	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:56:43.695+00	2021-06-18 15:56:43.695+00
1365	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:56:44.308+00	2021-06-18 15:56:44.308+00
1366	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:56:47.337+00	2021-06-18 15:56:47.337+00
1367	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:56:55.367+00	2021-06-18 15:56:55.367+00
1368	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:57:06.768+00	2021-06-18 15:57:06.768+00
1369	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:57:56.983+00	2021-06-18 15:57:56.983+00
1370	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:58:47.92+00	2021-06-18 15:58:47.92+00
1371	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:58:48.485+00	2021-06-18 15:58:48.485+00
1372	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:58:51.487+00	2021-06-18 15:58:51.487+00
1373	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 15:59:09.326+00	2021-06-18 15:59:09.326+00
1374	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 15:59:10.168+00	2021-06-18 15:59:10.168+00
1375	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 15:59:28.206+00	2021-06-18 15:59:28.206+00
1376	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 16:00:31.852+00	2021-06-18 16:00:31.852+00
1377	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 16:00:32.148+00	2021-06-18 16:00:32.148+00
1378	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 16:00:35.37+00	2021-06-18 16:00:35.371+00
1379	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 16:00:52.991+00	2021-06-18 16:00:52.991+00
1380	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 16:00:53.396+00	2021-06-18 16:00:53.396+00
1381	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	6	2021-06-18 16:00:56.016+00	2021-06-18 16:00:56.016+00
1382	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	6	2021-06-18 16:01:19.63+00	2021-06-18 16:01:19.63+00
1383	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 16:01:20.081+00	2021-06-18 16:01:20.081+00
1384	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 16:01:37.282+00	2021-06-18 16:01:37.282+00
1385	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 16:01:40.596+00	2021-06-18 16:01:40.596+00
1386	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:01:42.245+00	2021-06-18 16:01:42.245+00
1387	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:01:44.698+00	2021-06-18 16:01:44.698+00
1388	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 16:02:04.401+00	2021-06-18 16:02:04.401+00
1389	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 16:02:09.095+00	2021-06-18 16:02:09.095+00
1390	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 16:02:12.081+00	2021-06-18 16:02:12.081+00
1391	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:02:27.205+00	2021-06-18 16:02:27.205+00
1392	127.0.0.1	admin.atividades.edit	/admin/atividades/1/edit	GET	6	2021-06-18 16:02:45.166+00	2021-06-18 16:02:45.166+00
1393	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 16:03:15.879+00	2021-06-18 16:03:15.879+00
1394	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 16:03:22.006+00	2021-06-18 16:03:22.006+00
1395	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 16:03:22.471+00	2021-06-18 16:03:22.471+00
1396	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:03:31.575+00	2021-06-18 16:03:31.575+00
1397	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:03:34.673+00	2021-06-18 16:03:34.673+00
1398	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-18 16:06:15.543+00	2021-06-18 16:06:15.543+00
1399	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:06:16.012+00	2021-06-18 16:06:16.012+00
1400	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:06:23.179+00	2021-06-18 16:06:23.179+00
1401	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-18 16:09:18.585+00	2021-06-18 16:09:18.585+00
1402	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:09:18.856+00	2021-06-18 16:09:18.856+00
1403	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:09:31.325+00	2021-06-18 16:09:31.325+00
1404	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:12:41.16+00	2021-06-18 16:12:41.16+00
1405	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:13:38.679+00	2021-06-18 16:13:38.679+00
1406	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:14:40.1+00	2021-06-18 16:14:40.1+00
1407	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:16:17.098+00	2021-06-18 16:16:17.098+00
1408	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 16:16:35.865+00	2021-06-18 16:16:35.865+00
1409	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	6	2021-06-18 16:16:39.327+00	2021-06-18 16:16:39.327+00
1410	127.0.0.1	admin.cargos.store	/admin/cargos	POST	6	2021-06-18 16:16:51.157+00	2021-06-18 16:16:51.157+00
1411	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 16:16:51.492+00	2021-06-18 16:16:51.492+00
1412	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:16:59.058+00	2021-06-18 16:16:59.058+00
1413	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:17:35.897+00	2021-06-18 16:17:35.897+00
1414	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 16:17:36.903+00	2021-06-18 16:17:36.903+00
1415	127.0.0.1	api.auth.store	/api/auth	POST	6	2021-06-18 16:21:19.743+00	2021-06-18 16:21:19.743+00
1416	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-18 16:21:20.195+00	2021-06-18 16:21:20.195+00
1417	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 16:34:17.096+00	2021-06-18 16:34:17.096+00
1418	127.0.0.1	admin.atividades.edit	/admin/atividades/7/edit	GET	1	2021-06-18 16:34:29.662+00	2021-06-18 16:34:29.662+00
1419	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	1	2021-06-18 16:34:44.223+00	2021-06-18 16:34:44.223+00
1420	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:36:04.607+00	2021-06-18 16:36:04.607+00
1421	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:36:07.482+00	2021-06-18 16:36:07.482+00
1422	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-18 16:37:17.398+00	2021-06-18 16:37:17.398+00
1423	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:37:23.824+00	2021-06-18 16:37:23.824+00
1424	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:38:08.532+00	2021-06-18 16:38:08.532+00
1425	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 16:39:10.371+00	2021-06-18 16:39:10.371+00
1426	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-18 16:39:10.779+00	2021-06-18 16:39:10.779+00
1427	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 16:39:15.66+00	2021-06-18 16:39:15.66+00
1428	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 16:39:19.93+00	2021-06-18 16:39:19.93+00
1429	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 16:39:20.171+00	2021-06-18 16:39:20.171+00
1430	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-18 16:39:31.514+00	2021-06-18 16:39:31.514+00
1431	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-18 16:39:40.152+00	2021-06-18 16:39:40.152+00
1432	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	6	2021-06-18 16:40:10.062+00	2021-06-18 16:40:10.062+00
1433	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	6	2021-06-18 16:40:20.531+00	2021-06-18 16:40:20.531+00
1434	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-18 16:40:24.692+00	2021-06-18 16:40:24.692+00
1435	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-18 16:40:33.498+00	2021-06-18 16:40:33.498+00
1436	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-18 16:44:05.74+00	2021-06-18 16:44:05.74+00
1437	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-18 16:44:32.594+00	2021-06-18 16:44:32.594+00
1438	127.0.0.1	admin.contratos.edit	/admin/contratos/2/edit	GET	6	2021-06-18 16:44:47.282+00	2021-06-18 16:44:47.282+00
1439	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-18 16:45:27.099+00	2021-06-18 16:45:27.099+00
1440	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	6	2021-06-18 16:45:44.971+00	2021-06-18 16:45:44.971+00
1441	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	6	2021-06-18 16:46:01.178+00	2021-06-18 16:46:01.178+00
1442	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-18 16:46:46.012+00	2021-06-18 16:46:46.012+00
1443	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 16:48:51.118+00	2021-06-18 16:48:51.118+00
1444	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-18 16:48:56.967+00	2021-06-18 16:48:56.967+00
1445	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:49:28.021+00	2021-06-18 16:49:28.021+00
1674	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:48:35.44+00	2021-06-20 17:48:35.44+00
1446	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 16:49:34.755+00	2021-06-18 16:49:34.755+00
1447	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 16:49:43.923+00	2021-06-18 16:49:43.923+00
1448	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 16:49:48.975+00	2021-06-18 16:49:48.975+00
1449	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:49:52.543+00	2021-06-18 16:49:52.543+00
1450	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-18 16:49:55.211+00	2021-06-18 16:49:55.211+00
1451	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-18 16:52:47.26+00	2021-06-18 16:52:47.26+00
1452	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 16:52:48.786+00	2021-06-18 16:52:48.786+00
1453	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 16:56:14.677+00	2021-06-18 16:56:14.677+00
1454	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	1	2021-06-18 16:59:20.766+00	2021-06-18 16:59:20.766+00
1455	127.0.0.1	admin.atividades.store	/admin/atividades	POST	1	2021-06-18 16:59:24.105+00	2021-06-18 16:59:24.105+00
1456	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	1	2021-06-18 16:59:24.471+00	2021-06-18 16:59:24.471+00
1457	127.0.0.1	admin.atividades.store	/admin/atividades	POST	1	2021-06-18 16:59:45.222+00	2021-06-18 16:59:45.222+00
1458	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 16:59:45.629+00	2021-06-18 16:59:45.629+00
1459	127.0.0.1	admin.atividades.edit	/admin/atividades/9/edit	GET	1	2021-06-18 16:59:48.366+00	2021-06-18 16:59:48.366+00
1460	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 16:59:54.34+00	2021-06-18 16:59:54.34+00
1461	127.0.0.1	admin.atividades.destroy	/admin/atividades/9	DELETE	1	2021-06-18 16:59:58.222+00	2021-06-18 16:59:58.222+00
1462	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 16:59:58.468+00	2021-06-18 16:59:58.468+00
1463	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 17:56:39.044+00	2021-06-18 17:56:39.044+00
1464	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-18 17:56:39.3+00	2021-06-18 17:56:39.3+00
1465	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 17:56:45.33+00	2021-06-18 17:56:45.33+00
1466	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 17:56:52.719+00	2021-06-18 17:56:52.719+00
1467	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	6	2021-06-18 17:56:57.481+00	2021-06-18 17:56:57.481+00
1468	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	6	2021-06-18 17:57:40.396+00	2021-06-18 17:57:40.396+00
1469	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 17:57:41.494+00	2021-06-18 17:57:41.494+00
1470	127.0.0.1	sessions.store	/sessions	POST	6	2021-06-18 17:57:45.154+00	2021-06-18 17:57:45.154+00
1471	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-18 17:57:45.531+00	2021-06-18 17:57:45.531+00
1472	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 17:57:48.636+00	2021-06-18 17:57:48.636+00
1473	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 17:57:56.881+00	2021-06-18 17:57:56.881+00
1474	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	6	2021-06-18 17:58:01.405+00	2021-06-18 17:58:01.405+00
1475	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 17:58:20.892+00	2021-06-18 17:58:20.892+00
1476	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 17:58:41.077+00	2021-06-18 17:58:41.077+00
1477	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 17:58:44.668+00	2021-06-18 17:58:44.668+00
1478	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 17:58:45.013+00	2021-06-18 17:58:45.013+00
1479	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 17:58:48.154+00	2021-06-18 17:58:48.154+00
1480	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 17:58:49.891+00	2021-06-18 17:58:49.891+00
1481	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-18 17:58:56.482+00	2021-06-18 17:58:56.482+00
1482	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 17:59:01.742+00	2021-06-18 17:59:01.742+00
1483	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 17:59:18.317+00	2021-06-18 17:59:18.317+00
1484	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 17:59:34.999+00	2021-06-18 17:59:34.999+00
1485	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 17:59:35.406+00	2021-06-18 17:59:35.406+00
1486	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 17:59:38.857+00	2021-06-18 17:59:38.857+00
1487	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	6	2021-06-18 17:59:44.287+00	2021-06-18 17:59:44.287+00
1488	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 18:00:09.505+00	2021-06-18 18:00:09.505+00
1489	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 18:00:13.495+00	2021-06-18 18:00:13.495+00
1490	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 18:00:14.46+00	2021-06-18 18:00:14.46+00
1491	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 18:00:20.18+00	2021-06-18 18:00:20.18+00
1492	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 18:00:22.845+00	2021-06-18 18:00:22.845+00
1493	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 18:00:32.955+00	2021-06-18 18:00:32.956+00
1494	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-18 18:00:38.542+00	2021-06-18 18:00:38.542+00
1495	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-18 18:00:41.422+00	2021-06-18 18:00:41.422+00
1496	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 18:00:49.805+00	2021-06-18 18:00:49.805+00
1497	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 18:00:51.739+00	2021-06-18 18:00:51.739+00
1498	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-18 18:01:29.647+00	2021-06-18 18:01:29.647+00
1499	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 18:01:31.622+00	2021-06-18 18:01:31.622+00
1500	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	6	2021-06-18 18:01:35.825+00	2021-06-18 18:01:35.825+00
1501	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-18 18:04:03.538+00	2021-06-18 18:04:03.538+00
1502	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 18:04:09.681+00	2021-06-18 18:04:09.681+00
1503	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	6	2021-06-18 18:04:16.089+00	2021-06-18 18:04:16.089+00
1504	127.0.0.1	admin.atividades.update	/admin/atividades/8	PUT	6	2021-06-18 18:04:21.019+00	2021-06-18 18:04:21.019+00
1505	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	6	2021-06-18 18:04:21.989+00	2021-06-18 18:04:21.989+00
1506	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 18:17:57.829+00	2021-06-18 18:17:57.829+00
1507	127.0.0.1	admin.users.edit	/admin/users/6/edit	GET	6	2021-06-18 18:18:08.805+00	2021-06-18 18:18:08.805+00
1508	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 18:52:39.441+00	2021-06-18 18:52:39.441+00
1509	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 18:52:43.375+00	2021-06-18 18:52:43.376+00
1510	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	1	2021-06-18 18:52:46.505+00	2021-06-18 18:52:46.505+00
1511	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	1	2021-06-18 18:59:10.312+00	2021-06-18 18:59:10.312+00
1512	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 18:59:21.271+00	2021-06-18 18:59:21.271+00
1513	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 18:59:26.185+00	2021-06-18 18:59:26.185+00
1514	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 18:59:35.115+00	2021-06-18 18:59:35.115+00
1515	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-18 18:59:42.838+00	2021-06-18 18:59:42.838+00
1516	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	1	2021-06-18 18:59:50.211+00	2021-06-18 18:59:50.211+00
1517	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 19:07:52.092+00	2021-06-18 19:07:52.092+00
1518	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-18 19:07:52.268+00	2021-06-18 19:07:52.268+00
1519	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 19:07:54.404+00	2021-06-18 19:07:54.404+00
1520	127.0.0.1	admin.atividades.edit	/admin/atividades/8/edit	GET	6	2021-06-18 19:07:57.052+00	2021-06-18 19:07:57.052+00
1521	127.0.0.1	admin.atividades.update	/admin/atividades/8	PUT	6	2021-06-18 19:08:20.898+00	2021-06-18 19:08:20.898+00
1522	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 19:08:21.138+00	2021-06-18 19:08:21.139+00
1523	127.0.0.1	admin.atividades.edit	/admin/atividades/7/edit	GET	6	2021-06-18 19:08:26.992+00	2021-06-18 19:08:26.992+00
1524	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-18 19:08:37.9+00	2021-06-18 19:08:37.9+00
1525	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:08:40.916+00	2021-06-18 19:08:40.916+00
1526	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:08:44.914+00	2021-06-18 19:08:44.914+00
1527	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-18 19:09:19.97+00	2021-06-18 19:09:19.97+00
1528	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-18 19:09:22.926+00	2021-06-18 19:09:22.926+00
1529	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-18 19:09:28.54+00	2021-06-18 19:09:28.54+00
1530	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-18 19:09:36.73+00	2021-06-18 19:09:36.73+00
1531	127.0.0.1	admin.areas.minas.create	/admin/areas/minas/create	GET	6	2021-06-18 19:09:38.296+00	2021-06-18 19:09:38.296+00
1532	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-18 19:09:46.772+00	2021-06-18 19:09:46.772+00
1533	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-18 19:09:48.67+00	2021-06-18 19:09:48.67+00
1534	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-18 19:09:53.363+00	2021-06-18 19:09:53.363+00
1535	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-18 19:09:56.767+00	2021-06-18 19:09:56.767+00
1536	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-18 19:10:12.583+00	2021-06-18 19:10:12.583+00
1537	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-18 19:10:12.799+00	2021-06-18 19:10:12.799+00
1538	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-18 19:10:15.348+00	2021-06-18 19:10:15.348+00
1539	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-18 19:10:17.673+00	2021-06-18 19:10:17.673+00
1540	127.0.0.1	admin.areas.minas.create	/admin/areas/minas/create	GET	6	2021-06-18 19:10:19.972+00	2021-06-18 19:10:19.972+00
1541	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-18 19:10:28.86+00	2021-06-18 19:10:28.86+00
1542	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	6	2021-06-18 19:10:30.524+00	2021-06-18 19:10:30.524+00
1543	127.0.0.1	admin.areas.complexos.create	/admin/areas/complexos/create	GET	6	2021-06-18 19:10:32.647+00	2021-06-18 19:10:32.647+00
1544	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-18 19:10:36.27+00	2021-06-18 19:10:36.27+00
1545	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-18 19:10:40.396+00	2021-06-18 19:10:40.396+00
1546	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:10:46.392+00	2021-06-18 19:10:46.392+00
1547	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:10:51.829+00	2021-06-18 19:10:51.829+00
1548	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 19:16:09.611+00	2021-06-18 19:16:09.611+00
1549	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:16:09.832+00	2021-06-18 19:16:09.832+00
1550	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 19:16:40.34+00	2021-06-18 19:16:40.34+00
1551	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:16:40.676+00	2021-06-18 19:16:40.676+00
1552	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:16:53.129+00	2021-06-18 19:16:53.129+00
1553	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 19:18:24.046+00	2021-06-18 19:18:24.046+00
1554	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:18:24.265+00	2021-06-18 19:18:24.265+00
1555	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:18:26.245+00	2021-06-18 19:18:26.245+00
1556	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:19:50.89+00	2021-06-18 19:19:50.89+00
1557	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:19:54.299+00	2021-06-18 19:19:54.299+00
1558	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 19:21:17.575+00	2021-06-18 19:21:17.575+00
1559	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:21:17.807+00	2021-06-18 19:21:17.807+00
1560	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-18 19:21:41.909+00	2021-06-18 19:21:41.909+00
1561	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-18 19:21:42.116+00	2021-06-18 19:21:42.116+00
1562	127.0.0.1	admin.users.edit	/admin/users/11/edit	GET	6	2021-06-18 19:21:58.419+00	2021-06-18 19:21:58.42+00
1563	127.0.0.1	admin.users.update	/admin/users/11	PUT	6	2021-06-18 19:22:37.823+00	2021-06-18 19:22:37.823+00
1564	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:22:38.041+00	2021-06-18 19:22:38.041+00
1565	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:22:39.811+00	2021-06-18 19:22:39.811+00
1566	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 19:25:00.934+00	2021-06-18 19:25:00.934+00
1567	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:25:01.155+00	2021-06-18 19:25:01.155+00
1568	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:25:06.598+00	2021-06-18 19:25:06.598+00
1569	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 19:27:08.336+00	2021-06-18 19:27:08.336+00
1570	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:27:08.554+00	2021-06-18 19:27:08.554+00
1571	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:27:10.925+00	2021-06-18 19:27:10.925+00
1572	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-18 19:28:58.499+00	2021-06-18 19:28:58.499+00
1573	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-18 19:28:58.787+00	2021-06-18 19:28:58.787+00
1574	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-18 19:29:18.39+00	2021-06-18 19:29:18.39+00
1575	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 19:33:21.962+00	2021-06-18 19:33:21.962+00
1576	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 19:35:02.272+00	2021-06-18 19:35:02.272+00
1577	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 19:35:52.469+00	2021-06-18 19:35:52.469+00
1578	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 19:36:16.349+00	2021-06-18 19:36:16.349+00
1579	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-18 19:36:24.04+00	2021-06-18 19:36:24.04+00
1580	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 19:36:24.307+00	2021-06-18 19:36:24.307+00
1581	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 19:37:51.797+00	2021-06-18 19:37:51.797+00
1582	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 19:37:57.182+00	2021-06-18 19:37:57.182+00
1583	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 19:54:37.246+00	2021-06-18 19:54:37.246+00
1584	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 19:54:40.735+00	2021-06-18 19:54:40.735+00
1585	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-18 19:54:46.368+00	2021-06-18 19:54:46.368+00
1586	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-18 19:55:18.838+00	2021-06-18 19:55:18.838+00
1587	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 19:55:19.254+00	2021-06-18 19:55:19.254+00
1588	127.0.0.1	admin.users.edit	/admin/users/15/edit	GET	1	2021-06-18 19:55:27.522+00	2021-06-18 19:55:27.522+00
1589	127.0.0.1	admin.users.destroy	/admin/users/15	DELETE	1	2021-06-18 19:55:41.255+00	2021-06-18 19:55:41.255+00
1590	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 19:55:41.669+00	2021-06-18 19:55:41.669+00
1591	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-18 20:08:48.86+00	2021-06-18 20:08:48.86+00
1592	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-18 20:08:52.729+00	2021-06-18 20:08:52.729+00
1593	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 20:08:52.979+00	2021-06-18 20:08:52.979+00
1594	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-18 20:09:00.681+00	2021-06-18 20:09:00.681+00
1595	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-18 20:09:00.951+00	2021-06-18 20:09:00.952+00
1596	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-18 20:09:08.749+00	2021-06-18 20:09:08.75+00
1597	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-18 20:12:12.749+00	2021-06-18 20:12:12.749+00
1598	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 20:12:12.97+00	2021-06-18 20:12:12.97+00
1599	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-18 21:09:35.355+00	2021-06-18 21:09:35.355+00
1600	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-18 21:09:35.598+00	2021-06-18 21:09:35.598+00
1601	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-18 21:13:24.791+00	2021-06-18 21:13:24.791+00
1602	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-18 22:25:57.312+00	2021-06-18 22:25:57.312+00
1603	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 06:35:40.126+00	2021-06-19 06:35:40.126+00
1604	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 07:34:19.676+00	2021-06-19 07:34:19.676+00
1605	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 08:48:23.917+00	2021-06-19 08:48:23.917+00
1606	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 10:49:24.631+00	2021-06-19 10:49:24.631+00
1607	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 10:49:24.848+00	2021-06-19 10:49:24.849+00
1608	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-19 12:25:24.802+00	2021-06-19 12:25:24.802+00
1609	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 12:47:28.312+00	2021-06-19 12:47:28.312+00
1610	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 16:23:33.813+00	2021-06-19 16:23:33.813+00
1611	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 16:36:05.887+00	2021-06-19 16:36:05.887+00
1612	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 21:57:31.763+00	2021-06-19 21:57:31.763+00
1613	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 22:31:54.23+00	2021-06-19 22:31:54.23+00
1614	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-19 23:52:15.66+00	2021-06-19 23:52:15.66+00
1615	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 02:27:15.945+00	2021-06-20 02:27:15.945+00
1616	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 02:39:05.023+00	2021-06-20 02:39:05.023+00
1617	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 02:39:05.844+00	2021-06-20 02:39:05.844+00
1618	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 03:45:38.003+00	2021-06-20 03:45:38.003+00
1619	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 04:21:27.774+00	2021-06-20 04:21:27.774+00
1620	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 04:52:33.098+00	2021-06-20 04:52:33.098+00
1621	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 05:18:09.503+00	2021-06-20 05:18:09.503+00
1622	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 09:32:53.569+00	2021-06-20 09:32:53.57+00
1623	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 09:32:54.873+00	2021-06-20 09:32:54.873+00
1624	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 09:32:55.873+00	2021-06-20 09:32:55.873+00
1625	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 13:45:50.82+00	2021-06-20 13:45:50.82+00
1626	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 14:47:36.451+00	2021-06-20 14:47:36.451+00
1627	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 15:09:19.862+00	2021-06-20 15:09:19.862+00
1628	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 15:34:05.633+00	2021-06-20 15:34:05.633+00
1629	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 15:56:05.384+00	2021-06-20 15:56:05.384+00
1630	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 16:34:08.148+00	2021-06-20 16:34:08.148+00
1631	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 17:20:30.403+00	2021-06-20 17:20:30.403+00
1632	127.0.0.1	sessions.store	/sessions	POST	6	2021-06-20 17:20:37.281+00	2021-06-20 17:20:37.281+00
1633	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 17:20:37.551+00	2021-06-20 17:20:37.551+00
1634	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-20 17:20:41.073+00	2021-06-20 17:20:41.073+00
1635	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-20 17:20:49.376+00	2021-06-20 17:20:49.376+00
1636	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-20 17:20:58.458+00	2021-06-20 17:20:58.458+00
1637	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-20 17:21:00.008+00	2021-06-20 17:21:00.008+00
1638	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:21:03.127+00	2021-06-20 17:21:03.127+00
1639	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 17:21:07.742+00	2021-06-20 17:21:07.742+00
1640	127.0.0.1	admin.rdos.show	/admin/rdos/3	GET	6	2021-06-20 17:21:10.81+00	2021-06-20 17:21:10.81+00
1641	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 17:21:28.542+00	2021-06-20 17:21:28.542+00
1642	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	6	2021-06-20 17:21:31.58+00	2021-06-20 17:21:31.58+00
1643	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 17:21:36.887+00	2021-06-20 17:21:36.887+00
1644	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-20 17:21:38.464+00	2021-06-20 17:21:38.464+00
1645	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-20 17:21:45.516+00	2021-06-20 17:21:45.516+00
1646	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-20 17:21:50.372+00	2021-06-20 17:21:50.372+00
1647	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-20 17:21:50.561+00	2021-06-20 17:21:50.561+00
1648	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:21:54.895+00	2021-06-20 17:21:54.895+00
1649	127.0.0.1	admin.users.edit	/admin/users/9/edit	GET	6	2021-06-20 17:27:43.838+00	2021-06-20 17:27:43.838+00
1650	127.0.0.1	admin.users.edit	/admin/users/9/edit	GET	6	2021-06-20 17:28:13.25+00	2021-06-20 17:28:13.251+00
1651	127.0.0.1	admin.users.update	/admin/users/9	PUT	6	2021-06-20 17:28:41.401+00	2021-06-20 17:28:41.401+00
1652	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:28:41.617+00	2021-06-20 17:28:41.617+00
1653	127.0.0.1	admin.users.edit	/admin/users/9/edit	GET	6	2021-06-20 17:28:47.917+00	2021-06-20 17:28:47.917+00
1654	127.0.0.1	admin.users.update	/admin/users/9	PUT	6	2021-06-20 17:29:03.616+00	2021-06-20 17:29:03.616+00
1655	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:29:03.834+00	2021-06-20 17:29:03.834+00
1656	127.0.0.1	admin.users.edit	/admin/users/9/edit	GET	6	2021-06-20 17:29:09.466+00	2021-06-20 17:29:09.466+00
1657	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:36:06.367+00	2021-06-20 17:36:06.367+00
1658	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 17:43:41.959+00	2021-06-20 17:43:41.959+00
1659	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:44:25.402+00	2021-06-20 17:44:25.402+00
1660	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:44:25.603+00	2021-06-20 17:44:25.603+00
1661	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:44:32.997+00	2021-06-20 17:44:32.997+00
1662	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:45:46.454+00	2021-06-20 17:45:46.454+00
1663	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:45:46.653+00	2021-06-20 17:45:46.653+00
1664	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:45:48.597+00	2021-06-20 17:45:48.597+00
1665	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:46:54.469+00	2021-06-20 17:46:54.469+00
1666	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:46:54.679+00	2021-06-20 17:46:54.679+00
1667	127.0.0.1	admin.users.edit	/admin/users/17/edit	GET	6	2021-06-20 17:46:59.103+00	2021-06-20 17:46:59.103+00
1668	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:47:05.961+00	2021-06-20 17:47:05.961+00
1669	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:48:15.691+00	2021-06-20 17:48:15.691+00
1670	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:48:15.901+00	2021-06-20 17:48:15.901+00
1671	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:48:17.799+00	2021-06-20 17:48:17.799+00
1672	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:48:29.03+00	2021-06-20 17:48:29.03+00
1673	127.0.0.1	admin.users.edit	/admin/users/19/edit	GET	6	2021-06-20 17:48:31.776+00	2021-06-20 17:48:31.776+00
1675	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:48:36.603+00	2021-06-20 17:48:36.603+00
1676	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:50:01.484+00	2021-06-20 17:50:01.484+00
1677	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:50:01.686+00	2021-06-20 17:50:01.686+00
1678	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:50:03.211+00	2021-06-20 17:50:03.211+00
1679	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:53:12.22+00	2021-06-20 17:53:12.22+00
1680	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:53:12.44+00	2021-06-20 17:53:12.44+00
1681	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-20 17:53:19.271+00	2021-06-20 17:53:19.271+00
1682	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	6	2021-06-20 17:53:20.819+00	2021-06-20 17:53:20.819+00
1683	127.0.0.1	admin.cargos.store	/admin/cargos	POST	6	2021-06-20 17:53:55.99+00	2021-06-20 17:53:55.99+00
1684	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-20 17:53:56.216+00	2021-06-20 17:53:56.216+00
1685	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:54:00.797+00	2021-06-20 17:54:00.797+00
1686	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:54:03.64+00	2021-06-20 17:54:03.64+00
1687	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:55:32.569+00	2021-06-20 17:55:32.569+00
1688	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:55:32.808+00	2021-06-20 17:55:32.808+00
1689	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:55:34.922+00	2021-06-20 17:55:34.922+00
1690	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:57:07.398+00	2021-06-20 17:57:07.398+00
1691	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:57:07.601+00	2021-06-20 17:57:07.601+00
1692	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:57:09.628+00	2021-06-20 17:57:09.628+00
1693	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:58:28.655+00	2021-06-20 17:58:28.655+00
1694	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:58:28.853+00	2021-06-20 17:58:28.853+00
1695	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:58:32.326+00	2021-06-20 17:58:32.326+00
1696	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 17:59:44.075+00	2021-06-20 17:59:44.075+00
1697	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 17:59:44.289+00	2021-06-20 17:59:44.289+00
1698	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 17:59:46.509+00	2021-06-20 17:59:46.509+00
1699	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 18:00:59.345+00	2021-06-20 18:00:59.345+00
1700	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:00:59.549+00	2021-06-20 18:00:59.549+00
1701	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 18:01:03.302+00	2021-06-20 18:01:03.302+00
1702	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 18:02:26.272+00	2021-06-20 18:02:26.272+00
1703	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:02:26.474+00	2021-06-20 18:02:26.474+00
1704	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 18:02:29.936+00	2021-06-20 18:02:29.936+00
1705	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 18:05:00.636+00	2021-06-20 18:05:00.636+00
1706	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:05:00.842+00	2021-06-20 18:05:00.842+00
1707	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 18:05:02.288+00	2021-06-20 18:05:02.288+00
1708	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 18:06:03.129+00	2021-06-20 18:06:03.129+00
1709	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:06:03.833+00	2021-06-20 18:06:03.833+00
1710	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 18:06:05.823+00	2021-06-20 18:06:05.823+00
1711	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 18:07:16.202+00	2021-06-20 18:07:16.202+00
1712	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:07:16.404+00	2021-06-20 18:07:16.404+00
1713	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 18:07:18.214+00	2021-06-20 18:07:18.214+00
1714	127.0.0.1	admin.users.store	/admin/users	POST	6	2021-06-20 18:08:19.26+00	2021-06-20 18:08:19.26+00
1715	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:08:19.465+00	2021-06-20 18:08:19.465+00
1716	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 18:08:21.433+00	2021-06-20 18:08:21.433+00
1717	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:08:43.848+00	2021-06-20 18:08:43.848+00
1718	127.0.0.1	admin.users.create	/admin/users/create	GET	6	2021-06-20 18:08:48.192+00	2021-06-20 18:08:48.192+00
1719	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-20 18:10:30.531+00	2021-06-20 18:10:30.531+00
1720	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:10:32.53+00	2021-06-20 18:10:32.53+00
1721	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:10:33.588+00	2021-06-20 18:10:33.588+00
1722	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:10:37.175+00	2021-06-20 18:10:37.175+00
1723	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 18:10:44.554+00	2021-06-20 18:10:44.554+00
1724	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:10:45.61+00	2021-06-20 18:10:45.61+00
1725	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 18:10:46.662+00	2021-06-20 18:10:46.662+00
1726	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	6	2021-06-20 18:10:48.614+00	2021-06-20 18:10:48.614+00
1727	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 18:11:16.738+00	2021-06-20 18:11:16.738+00
1728	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	6	2021-06-20 18:11:18.85+00	2021-06-20 18:11:18.85+00
1729	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 18:11:44.317+00	2021-06-20 18:11:44.317+00
1730	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-20 18:11:47.564+00	2021-06-20 18:11:47.564+00
1731	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-20 18:12:07.706+00	2021-06-20 18:12:07.706+00
1732	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-20 18:12:11.23+00	2021-06-20 18:12:11.23+00
1733	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:12:16.062+00	2021-06-20 18:12:16.062+00
1734	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:12:27.481+00	2021-06-20 18:12:27.481+00
1735	127.0.0.1	admin.rdos.show	/admin/rdos/4	GET	6	2021-06-20 18:12:31.301+00	2021-06-20 18:12:31.301+00
1736	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:12:43.927+00	2021-06-20 18:12:43.927+00
1737	127.0.0.1	admin.atividades.edit	/admin/atividades/7/edit	GET	6	2021-06-20 18:12:48.169+00	2021-06-20 18:12:48.169+00
1738	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:12:52.007+00	2021-06-20 18:12:52.007+00
1739	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-20 18:13:06.457+00	2021-06-20 18:13:06.457+00
1740	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-20 18:13:59.41+00	2021-06-20 18:13:59.41+00
1741	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:13:59.611+00	2021-06-20 18:13:59.611+00
1742	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-20 18:14:03.39+00	2021-06-20 18:14:03.39+00
1743	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-20 18:14:23.721+00	2021-06-20 18:14:23.721+00
1744	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:14:23.95+00	2021-06-20 18:14:23.95+00
1745	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-20 18:14:26.396+00	2021-06-20 18:14:26.396+00
1746	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-20 18:15:54.971+00	2021-06-20 18:15:54.971+00
1747	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:15:55.198+00	2021-06-20 18:15:55.198+00
1748	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-20 18:16:38.684+00	2021-06-20 18:16:38.684+00
1749	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-20 18:16:57.338+00	2021-06-20 18:16:57.338+00
1750	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:16:57.568+00	2021-06-20 18:16:57.568+00
1751	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-20 18:17:01.558+00	2021-06-20 18:17:01.558+00
1752	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-20 18:17:34.293+00	2021-06-20 18:17:34.293+00
1753	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:17:34.525+00	2021-06-20 18:17:34.525+00
1754	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-20 18:18:11.765+00	2021-06-20 18:18:11.765+00
1755	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-20 18:18:40.662+00	2021-06-20 18:18:40.662+00
1756	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:18:40.911+00	2021-06-20 18:18:40.911+00
1757	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-20 18:19:43.484+00	2021-06-20 18:19:43.484+00
1758	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-20 18:20:31.429+00	2021-06-20 18:20:31.429+00
1759	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:20:31.664+00	2021-06-20 18:20:31.664+00
1760	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-20 18:20:54.087+00	2021-06-20 18:20:54.087+00
1761	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-20 18:20:55.601+00	2021-06-20 18:20:55.601+00
1762	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:20:56.996+00	2021-06-20 18:20:56.996+00
1763	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:20:57.905+00	2021-06-20 18:20:57.905+00
1764	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:21:01.055+00	2021-06-20 18:21:01.055+00
1765	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:21:02.808+00	2021-06-20 18:21:02.808+00
1766	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	6	2021-06-20 18:21:06.217+00	2021-06-20 18:21:06.217+00
1767	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 18:22:35.091+00	2021-06-20 18:22:35.091+00
1768	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	6	2021-06-20 18:22:39.823+00	2021-06-20 18:22:39.823+00
1769	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-20 18:27:22.624+00	2021-06-20 18:27:22.624+00
1770	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:27:24.478+00	2021-06-20 18:27:24.478+00
1771	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	6	2021-06-20 18:27:25.812+00	2021-06-20 18:27:25.812+00
1772	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:27:27.157+00	2021-06-20 18:27:27.157+00
1773	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:27:29.481+00	2021-06-20 18:27:29.481+00
1774	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:27:35.304+00	2021-06-20 18:27:35.304+00
1775	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:27:36.879+00	2021-06-20 18:27:36.879+00
1776	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:27:38.821+00	2021-06-20 18:27:38.821+00
1777	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:27:46.827+00	2021-06-20 18:27:46.827+00
1778	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-20 18:27:49.018+00	2021-06-20 18:27:49.018+00
1779	127.0.0.1	admin.areas.minas.create	/admin/areas/minas/create	GET	6	2021-06-20 18:27:50.889+00	2021-06-20 18:27:50.889+00
1780	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	6	2021-06-20 18:29:11.261+00	2021-06-20 18:29:11.261+00
1781	127.0.0.1	admin.areas.complexos.create	/admin/areas/complexos/create	GET	6	2021-06-20 18:29:13.46+00	2021-06-20 18:29:13.46+00
1782	127.0.0.1	admin.areas.complexos.store	/admin/areas/complexos	POST	6	2021-06-20 18:29:21.53+00	2021-06-20 18:29:21.53+00
1783	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	6	2021-06-20 18:29:21.709+00	2021-06-20 18:29:21.709+00
1784	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-20 18:29:24.61+00	2021-06-20 18:29:24.61+00
1785	127.0.0.1	admin.areas.minas.create	/admin/areas/minas/create	GET	6	2021-06-20 18:29:29.525+00	2021-06-20 18:29:29.525+00
1786	127.0.0.1	admin.areas.minas.store	/admin/areas/minas	POST	6	2021-06-20 18:29:39.307+00	2021-06-20 18:29:39.307+00
1787	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-20 18:29:39.486+00	2021-06-20 18:29:39.486+00
1788	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:29:41.418+00	2021-06-20 18:29:41.418+00
1789	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:29:43.526+00	2021-06-20 18:29:43.526+00
1790	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:33:37.985+00	2021-06-20 18:33:37.985+00
1791	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:33:38.162+00	2021-06-20 18:33:38.162+00
1792	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:33:41.134+00	2021-06-20 18:33:41.134+00
1793	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:34:10.689+00	2021-06-20 18:34:10.689+00
1794	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:34:10.881+00	2021-06-20 18:34:10.881+00
1795	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:34:15.179+00	2021-06-20 18:34:15.179+00
1796	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:34:36.597+00	2021-06-20 18:34:36.597+00
1797	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:34:36.774+00	2021-06-20 18:34:36.774+00
1798	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:34:39.249+00	2021-06-20 18:34:39.249+00
1799	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:35:08.147+00	2021-06-20 18:35:08.147+00
1800	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:35:08.338+00	2021-06-20 18:35:08.338+00
1801	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:35:14.072+00	2021-06-20 18:35:14.072+00
1802	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:35:19.283+00	2021-06-20 18:35:19.283+00
1803	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:35:19.479+00	2021-06-20 18:35:19.48+00
1804	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:35:21.583+00	2021-06-20 18:35:21.583+00
1805	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:35:37.674+00	2021-06-20 18:35:37.674+00
1806	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:35:37.934+00	2021-06-20 18:35:37.934+00
1807	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:36:04.332+00	2021-06-20 18:36:04.332+00
1808	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:36:04.521+00	2021-06-20 18:36:04.521+00
1809	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:36:07.924+00	2021-06-20 18:36:07.924+00
1810	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:36:18.653+00	2021-06-20 18:36:18.653+00
1811	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:36:18.84+00	2021-06-20 18:36:18.84+00
1812	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:36:20.347+00	2021-06-20 18:36:20.347+00
1813	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:36:56.747+00	2021-06-20 18:36:56.747+00
1814	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:36:56.965+00	2021-06-20 18:36:56.965+00
1815	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:36:59.758+00	2021-06-20 18:36:59.758+00
1816	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:37:05.974+00	2021-06-20 18:37:05.974+00
1817	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:37:06.16+00	2021-06-20 18:37:06.16+00
1818	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:37:17.876+00	2021-06-20 18:37:17.876+00
1819	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:37:34.204+00	2021-06-20 18:37:34.204+00
1820	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:37:34.403+00	2021-06-20 18:37:34.403+00
1821	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:37:37.476+00	2021-06-20 18:37:37.476+00
1822	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:37:52.242+00	2021-06-20 18:37:52.242+00
1823	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:37:52.433+00	2021-06-20 18:37:52.433+00
1824	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:37:57.235+00	2021-06-20 18:37:57.235+00
1825	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:37:57.424+00	2021-06-20 18:37:57.424+00
1826	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:38:08.152+00	2021-06-20 18:38:08.152+00
1827	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:38:24.555+00	2021-06-20 18:38:24.555+00
1828	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:38:24.743+00	2021-06-20 18:38:24.743+00
1829	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:38:26.325+00	2021-06-20 18:38:26.325+00
1830	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:38:43.868+00	2021-06-20 18:38:43.868+00
1831	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:38:44.058+00	2021-06-20 18:38:44.058+00
1832	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:38:47.245+00	2021-06-20 18:38:47.245+00
1833	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:38:54.937+00	2021-06-20 18:38:54.937+00
1834	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:38:55.129+00	2021-06-20 18:38:55.129+00
1835	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:38:56.822+00	2021-06-20 18:38:56.822+00
1836	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:39:04.969+00	2021-06-20 18:39:04.969+00
1837	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:39:05.159+00	2021-06-20 18:39:05.159+00
1838	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:39:08.051+00	2021-06-20 18:39:08.051+00
1839	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:39:19.676+00	2021-06-20 18:39:19.676+00
1840	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:39:19.862+00	2021-06-20 18:39:19.862+00
1841	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:39:21.367+00	2021-06-20 18:39:21.367+00
1842	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:39:26.713+00	2021-06-20 18:39:26.713+00
1843	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:39:26.902+00	2021-06-20 18:39:26.902+00
1844	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:39:29.138+00	2021-06-20 18:39:29.138+00
1845	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:39:38.634+00	2021-06-20 18:39:38.634+00
1846	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:39:38.833+00	2021-06-20 18:39:38.833+00
1847	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:39:40.404+00	2021-06-20 18:39:40.404+00
1848	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:39:52.068+00	2021-06-20 18:39:52.068+00
1849	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:39:52.257+00	2021-06-20 18:39:52.257+00
1850	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:39:55.292+00	2021-06-20 18:39:55.292+00
1851	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:40:00.14+00	2021-06-20 18:40:00.14+00
1852	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:40:00.342+00	2021-06-20 18:40:00.342+00
1853	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:40:07.257+00	2021-06-20 18:40:07.257+00
1854	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:40:12.385+00	2021-06-20 18:40:12.385+00
1855	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:40:12.563+00	2021-06-20 18:40:12.563+00
1856	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:40:16.164+00	2021-06-20 18:40:16.164+00
1857	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:40:22.146+00	2021-06-20 18:40:22.146+00
1858	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:40:22.332+00	2021-06-20 18:40:22.332+00
1859	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:40:35.974+00	2021-06-20 18:40:35.974+00
1860	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:40:46.157+00	2021-06-20 18:40:46.157+00
1861	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:40:46.355+00	2021-06-20 18:40:46.355+00
1862	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:40:52.642+00	2021-06-20 18:40:52.642+00
1863	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:40:52.817+00	2021-06-20 18:40:52.817+00
1864	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:41:02.627+00	2021-06-20 18:41:02.627+00
1865	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:41:02.803+00	2021-06-20 18:41:02.803+00
1866	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:41:16.477+00	2021-06-20 18:41:16.477+00
1867	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:41:22.11+00	2021-06-20 18:41:22.11+00
1868	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:41:22.306+00	2021-06-20 18:41:22.306+00
1869	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:41:28.164+00	2021-06-20 18:41:28.164+00
1870	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:41:33.864+00	2021-06-20 18:41:33.864+00
1871	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:41:34.04+00	2021-06-20 18:41:34.04+00
1872	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:41:54.959+00	2021-06-20 18:41:54.959+00
1873	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:42:00.987+00	2021-06-20 18:42:00.987+00
1874	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:42:01.194+00	2021-06-20 18:42:01.194+00
1875	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:42:04.951+00	2021-06-20 18:42:04.951+00
1876	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:42:29.722+00	2021-06-20 18:42:29.722+00
1877	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:42:31+00	2021-06-20 18:42:31+00
1878	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:42:32.382+00	2021-06-20 18:42:32.382+00
1879	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:42:38.86+00	2021-06-20 18:42:38.86+00
1880	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:42:41.627+00	2021-06-20 18:42:41.627+00
1881	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:43:07.829+00	2021-06-20 18:43:07.829+00
1882	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:43:09.231+00	2021-06-20 18:43:09.231+00
1883	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:43:10.895+00	2021-06-20 18:43:10.895+00
1884	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:43:22.616+00	2021-06-20 18:43:22.616+00
1885	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:43:24.231+00	2021-06-20 18:43:24.231+00
1886	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:43:26.9+00	2021-06-20 18:43:26.9+00
1887	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:43:29.522+00	2021-06-20 18:43:29.522+00
1888	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:43:35.295+00	2021-06-20 18:43:35.295+00
1889	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:43:35.488+00	2021-06-20 18:43:35.488+00
1890	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:43:41.279+00	2021-06-20 18:43:41.279+00
1891	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:43:43.025+00	2021-06-20 18:43:43.025+00
1892	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	6	2021-06-20 18:46:07.601+00	2021-06-20 18:46:07.601+00
1893	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:46:07.808+00	2021-06-20 18:46:07.808+00
1894	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	6	2021-06-20 18:49:05.172+00	2021-06-20 18:49:05.172+00
1895	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-20 18:49:08.431+00	2021-06-20 18:49:08.431+00
1896	127.0.0.1	admin.areas.minas.create	/admin/areas/minas/create	GET	6	2021-06-20 18:49:12.477+00	2021-06-20 18:49:12.477+00
1897	127.0.0.1	admin.areas.minas.store	/admin/areas/minas	POST	6	2021-06-20 18:49:31.978+00	2021-06-20 18:49:31.978+00
1898	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	6	2021-06-20 18:49:32.173+00	2021-06-20 18:49:32.173+00
1899	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:49:33.55+00	2021-06-20 18:49:33.55+00
1900	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	6	2021-06-20 18:49:37.318+00	2021-06-20 18:49:37.318+00
1901	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	6	2021-06-20 18:50:02.986+00	2021-06-20 18:50:02.986+00
1902	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	6	2021-06-20 18:50:03.161+00	2021-06-20 18:50:03.161+00
1903	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:50:06.443+00	2021-06-20 18:50:06.443+00
1904	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:50:09.798+00	2021-06-20 18:50:09.798+00
1905	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	6	2021-06-20 18:50:38.001+00	2021-06-20 18:50:38.001+00
1906	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:50:38.184+00	2021-06-20 18:50:38.184+00
1907	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:50:40.046+00	2021-06-20 18:50:40.046+00
1908	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	6	2021-06-20 18:50:46.483+00	2021-06-20 18:50:46.483+00
1909	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:50:46.665+00	2021-06-20 18:50:46.665+00
1910	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:50:48.25+00	2021-06-20 18:50:48.25+00
1911	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	6	2021-06-20 18:50:53.69+00	2021-06-20 18:50:53.69+00
1912	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:50:53.876+00	2021-06-20 18:50:53.876+00
1913	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:50:55.455+00	2021-06-20 18:50:55.456+00
1914	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	6	2021-06-20 18:51:00.657+00	2021-06-20 18:51:00.657+00
1915	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:51:00.84+00	2021-06-20 18:51:00.84+00
1916	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	6	2021-06-20 18:51:02.285+00	2021-06-20 18:51:02.285+00
1917	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	6	2021-06-20 18:51:08.485+00	2021-06-20 18:51:08.485+00
1918	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:51:08.681+00	2021-06-20 18:51:08.681+00
1919	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:51:15.616+00	2021-06-20 18:51:15.616+00
1920	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:51:20.222+00	2021-06-20 18:51:20.222+00
1921	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:51:21.033+00	2021-06-20 18:51:21.033+00
1922	127.0.0.1	admin.users.edit	/admin/users/14/edit	GET	6	2021-06-20 18:51:24.801+00	2021-06-20 18:51:24.801+00
1923	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-20 18:51:33.344+00	2021-06-20 18:51:33.344+00
1924	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-20 18:51:33.582+00	2021-06-20 18:51:33.582+00
1925	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	6	2021-06-20 18:51:46.023+00	2021-06-20 18:51:46.023+00
1926	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:53:09.011+00	2021-06-20 18:53:09.011+00
1927	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:53:09.752+00	2021-06-20 18:53:09.752+00
1928	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	6	2021-06-20 18:53:11.128+00	2021-06-20 18:53:11.128+00
1929	127.0.0.1	api.rdos.store	/api/rdos	POST	6	2021-06-20 18:54:13.78+00	2021-06-20 18:54:13.78+00
1930	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:54:21.856+00	2021-06-20 18:54:21.856+00
1931	127.0.0.1	admin.rdos.show	/admin/rdos/5	GET	6	2021-06-20 18:54:30.087+00	2021-06-20 18:54:30.087+00
1932	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-20 18:54:40.224+00	2021-06-20 18:54:40.224+00
1933	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 18:55:09.085+00	2021-06-20 18:55:09.085+00
1934	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:55:39.064+00	2021-06-20 18:55:39.064+00
1935	127.0.0.1	admin.rdos.show	/admin/rdos/5	GET	6	2021-06-20 18:55:43.693+00	2021-06-20 18:55:43.693+00
1936	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-20 18:55:59.291+00	2021-06-20 18:55:59.291+00
1937	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:56:00.28+00	2021-06-20 18:56:00.28+00
1938	127.0.0.1	admin.rdos.show	/admin/rdos/5	GET	6	2021-06-20 18:56:03.45+00	2021-06-20 18:56:03.45+00
1939	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-20 18:56:09.7+00	2021-06-20 18:56:09.7+00
1940	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:57:19.249+00	2021-06-20 18:57:19.249+00
1941	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:57:22.933+00	2021-06-20 18:57:22.933+00
1942	127.0.0.1	admin.rdos.show	/admin/rdos/5	GET	6	2021-06-20 18:57:27.362+00	2021-06-20 18:57:27.363+00
1943	127.0.0.1	admin.rdos.edit	/admin/rdos/5/edit	GET	6	2021-06-20 18:57:33.269+00	2021-06-20 18:57:33.269+00
1944	127.0.0.1	admin.rdos.update	/admin/rdos/5	PUT	6	2021-06-20 18:57:41.595+00	2021-06-20 18:57:41.595+00
1945	127.0.0.1	admin.rdos.show	/admin/rdos/5	GET	6	2021-06-20 18:57:41.822+00	2021-06-20 18:57:41.822+00
1946	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:57:44.276+00	2021-06-20 18:57:44.276+00
1947	127.0.0.1	admin.rdos.destroy	/admin/rdos/5	DELETE	6	2021-06-20 18:57:48.835+00	2021-06-20 18:57:48.835+00
1948	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:57:49.009+00	2021-06-20 18:57:49.009+00
1949	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 18:57:50.816+00	2021-06-20 18:57:50.816+00
1950	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:57:52.418+00	2021-06-20 18:57:52.418+00
1951	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-20 18:58:23.381+00	2021-06-20 18:58:23.381+00
1952	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-20 18:58:23.562+00	2021-06-20 18:58:23.562+00
1953	127.0.0.1	api.rdos.store	/api/rdos	POST	6	2021-06-20 18:58:31.199+00	2021-06-20 18:58:31.199+00
1954	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:58:32.904+00	2021-06-20 18:58:32.904+00
1955	127.0.0.1	admin.rdos.show	/admin/rdos/6	GET	6	2021-06-20 18:58:39.212+00	2021-06-20 18:58:39.212+00
2034	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:13.039+00	2021-06-21 19:57:13.039+00
1956	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-20 18:58:43.905+00	2021-06-20 18:58:43.905+00
1957	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 18:58:45.282+00	2021-06-20 18:58:45.282+00
1958	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-20 18:58:46.605+00	2021-06-20 18:58:46.605+00
1959	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-20 18:58:50.434+00	2021-06-20 18:58:50.434+00
1960	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-20 18:58:56.664+00	2021-06-20 18:58:56.664+00
1961	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:59:05.201+00	2021-06-20 18:59:05.201+00
1962	127.0.0.1	admin.rdos.destroy	/admin/rdos/6	DELETE	6	2021-06-20 18:59:10.386+00	2021-06-20 18:59:10.386+00
1963	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-20 18:59:10.56+00	2021-06-20 18:59:10.56+00
1964	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-20 18:59:12.302+00	2021-06-20 18:59:12.302+00
1965	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 18:59:13.602+00	2021-06-20 18:59:13.602+00
1966	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	6	2021-06-20 18:59:14.892+00	2021-06-20 18:59:14.892+00
1967	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:59:17.428+00	2021-06-20 18:59:17.428+00
1968	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-20 18:59:18.832+00	2021-06-20 18:59:18.832+00
1969	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-20 18:59:20.022+00	2021-06-20 18:59:20.022+00
1970	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-20 19:33:51.524+00	2021-06-20 19:33:51.524+00
1971	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-20 19:33:51.709+00	2021-06-20 19:33:51.709+00
1972	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-20 19:34:00.632+00	2021-06-20 19:34:00.632+00
1973	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 21:02:57.582+00	2021-06-20 21:02:57.582+00
1974	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 21:02:57.777+00	2021-06-20 21:02:57.777+00
1975	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 21:03:03.83+00	2021-06-20 21:03:03.83+00
1976	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 21:05:10.379+00	2021-06-20 21:05:10.379+00
1977	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-20 21:05:10.559+00	2021-06-20 21:05:10.559+00
1978	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-20 21:05:14.266+00	2021-06-20 21:05:14.266+00
1979	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-20 22:40:43.814+00	2021-06-20 22:40:43.814+00
1980	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 01:32:34.947+00	2021-06-21 01:32:34.947+00
1981	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 04:20:37.333+00	2021-06-21 04:20:37.333+00
1982	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 04:32:22.477+00	2021-06-21 04:32:22.477+00
1983	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 06:10:43.14+00	2021-06-21 06:10:43.14+00
1984	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 07:50:17.093+00	2021-06-21 07:50:17.093+00
1985	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 10:17:40.687+00	2021-06-21 10:17:40.688+00
1986	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-21 10:55:13.693+00	2021-06-21 10:55:13.693+00
1987	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 14:53:38.509+00	2021-06-21 14:53:38.509+00
1988	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 14:53:38.689+00	2021-06-21 14:53:38.689+00
1989	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-21 16:59:51.937+00	2021-06-21 16:59:51.937+00
1990	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 17:30:41.559+00	2021-06-21 17:30:41.559+00
1991	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 17:30:43.938+00	2021-06-21 17:30:43.938+00
1992	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 17:47:24.352+00	2021-06-21 17:47:24.352+00
1993	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:08:41.948+00	2021-06-21 19:08:41.948+00
1994	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-06-21 19:51:41.096+00	2021-06-21 19:51:41.096+00
1995	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-06-21 19:51:41.434+00	2021-06-21 19:51:41.434+00
1996	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:53:19.367+00	2021-06-21 19:53:19.367+00
1997	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-21 19:53:25.229+00	2021-06-21 19:53:25.229+00
1998	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-21 19:53:25.468+00	2021-06-21 19:53:25.469+00
1999	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-21 19:53:31.256+00	2021-06-21 19:53:31.256+00
2000	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-21 19:53:36.453+00	2021-06-21 19:53:36.453+00
2001	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-21 19:53:42.667+00	2021-06-21 19:53:42.667+00
2002	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-21 19:53:42.851+00	2021-06-21 19:53:42.851+00
2003	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-21 19:53:45.656+00	2021-06-21 19:53:45.656+00
2004	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-21 19:53:47.988+00	2021-06-21 19:53:47.988+00
2005	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-21 19:53:50.309+00	2021-06-21 19:53:50.309+00
2006	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-21 19:53:53.408+00	2021-06-21 19:53:53.408+00
2007	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	1	2021-06-21 19:53:59.191+00	2021-06-21 19:53:59.191+00
2008	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-21 19:54:08.383+00	2021-06-21 19:54:08.383+00
2009	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-21 19:54:17.989+00	2021-06-21 19:54:17.989+00
2010	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-06-21 19:54:29.038+00	2021-06-21 19:54:29.038+00
2011	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 19:54:36.562+00	2021-06-21 19:54:36.562+00
2012	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-21 19:54:47.489+00	2021-06-21 19:54:47.489+00
2013	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-21 19:56:44.18+00	2021-06-21 19:56:44.18+00
2014	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 19:56:44.381+00	2021-06-21 19:56:44.381+00
2015	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-21 19:56:49.576+00	2021-06-21 19:56:49.576+00
2016	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-21 19:57:00.95+00	2021-06-21 19:57:00.95+00
2017	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:01.143+00	2021-06-21 19:57:01.143+00
2018	127.0.0.1	sessions.store	/sessions	POST	32	2021-06-21 19:57:05.465+00	2021-06-21 19:57:05.465+00
2019	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:05.858+00	2021-06-21 19:57:05.858+00
2020	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:06.254+00	2021-06-21 19:57:06.254+00
2021	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:06.66+00	2021-06-21 19:57:06.66+00
2022	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:07.066+00	2021-06-21 19:57:07.066+00
2023	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:07.484+00	2021-06-21 19:57:07.484+00
2024	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:07.885+00	2021-06-21 19:57:07.885+00
2025	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:08.278+00	2021-06-21 19:57:08.278+00
2026	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:08.669+00	2021-06-21 19:57:08.669+00
2027	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:09.059+00	2021-06-21 19:57:09.059+00
2028	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:10.691+00	2021-06-21 19:57:10.691+00
2029	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:11.083+00	2021-06-21 19:57:11.083+00
2030	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:11.477+00	2021-06-21 19:57:11.477+00
2031	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:11.867+00	2021-06-21 19:57:11.867+00
2032	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:12.259+00	2021-06-21 19:57:12.259+00
2033	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:12.648+00	2021-06-21 19:57:12.648+00
2035	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:13.432+00	2021-06-21 19:57:13.432+00
2036	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:13.828+00	2021-06-21 19:57:13.828+00
2037	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:14.221+00	2021-06-21 19:57:14.221+00
2038	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:17.612+00	2021-06-21 19:57:17.612+00
2039	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:18.063+00	2021-06-21 19:57:18.063+00
2040	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:18.461+00	2021-06-21 19:57:18.461+00
2041	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:18.849+00	2021-06-21 19:57:18.849+00
2042	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:19.238+00	2021-06-21 19:57:19.238+00
2043	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:19.627+00	2021-06-21 19:57:19.627+00
2044	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:20.017+00	2021-06-21 19:57:20.017+00
2045	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:20.405+00	2021-06-21 19:57:20.405+00
2046	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:20.795+00	2021-06-21 19:57:20.795+00
2047	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:21.198+00	2021-06-21 19:57:21.198+00
2048	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:26.814+00	2021-06-21 19:57:26.814+00
2049	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:27.203+00	2021-06-21 19:57:27.203+00
2050	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:27.608+00	2021-06-21 19:57:27.608+00
2051	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:28.015+00	2021-06-21 19:57:28.015+00
2052	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:28.42+00	2021-06-21 19:57:28.42+00
2053	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:28.82+00	2021-06-21 19:57:28.82+00
2054	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:29.217+00	2021-06-21 19:57:29.217+00
2055	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:29.611+00	2021-06-21 19:57:29.611+00
2056	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:30.014+00	2021-06-21 19:57:30.014+00
2057	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:57:30.404+00	2021-06-21 19:57:30.404+00
2058	127.0.0.1	api.auth.store	/api/auth	POST	32	2021-06-21 19:58:22.25+00	2021-06-21 19:58:22.25+00
2059	127.0.0.1	api.sync_data.index	/api/sync-data	GET	32	2021-06-21 19:58:22.83+00	2021-06-21 19:58:22.831+00
2060	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:03.207+00	2021-06-21 19:59:03.207+00
2061	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:25.003+00	2021-06-21 19:59:25.003+00
2062	127.0.0.1	sessions.store	/sessions	POST	32	2021-06-21 19:59:42.953+00	2021-06-21 19:59:42.953+00
2063	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:43.279+00	2021-06-21 19:59:43.28+00
2064	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:43.614+00	2021-06-21 19:59:43.614+00
2065	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:43.946+00	2021-06-21 19:59:43.946+00
2066	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:44.284+00	2021-06-21 19:59:44.284+00
2067	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:44.655+00	2021-06-21 19:59:44.655+00
2068	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:44.985+00	2021-06-21 19:59:44.985+00
2069	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:45.321+00	2021-06-21 19:59:45.321+00
2070	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:45.652+00	2021-06-21 19:59:45.652+00
2071	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:45.991+00	2021-06-21 19:59:45.991+00
2072	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:47.547+00	2021-06-21 19:59:47.547+00
2073	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:47.876+00	2021-06-21 19:59:47.876+00
2074	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:48.208+00	2021-06-21 19:59:48.208+00
2075	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:48.537+00	2021-06-21 19:59:48.537+00
2076	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:48.869+00	2021-06-21 19:59:48.869+00
2077	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:49.204+00	2021-06-21 19:59:49.204+00
2078	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:49.535+00	2021-06-21 19:59:49.535+00
2079	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:49.866+00	2021-06-21 19:59:49.866+00
2080	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:50.196+00	2021-06-21 19:59:50.197+00
2081	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:50.527+00	2021-06-21 19:59:50.527+00
2082	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:55.73+00	2021-06-21 19:59:55.73+00
2083	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:56.068+00	2021-06-21 19:59:56.068+00
2084	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:56.399+00	2021-06-21 19:59:56.399+00
2085	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:56.738+00	2021-06-21 19:59:56.738+00
2086	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:57.078+00	2021-06-21 19:59:57.078+00
2087	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:57.415+00	2021-06-21 19:59:57.415+00
2088	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:57.746+00	2021-06-21 19:59:57.746+00
2089	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:58.077+00	2021-06-21 19:59:58.077+00
2090	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:58.415+00	2021-06-21 19:59:58.415+00
2091	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 19:59:58.753+00	2021-06-21 19:59:58.753+00
2092	127.0.0.1	sessions.store	/sessions	POST	6	2021-06-21 20:00:13.293+00	2021-06-21 20:00:13.293+00
2093	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-21 20:00:13.49+00	2021-06-21 20:00:13.49+00
2094	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:29.293+00	2021-06-21 20:00:29.293+00
2095	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:29.629+00	2021-06-21 20:00:29.629+00
2096	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:29.964+00	2021-06-21 20:00:29.964+00
2097	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:30.305+00	2021-06-21 20:00:30.305+00
2098	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:30.667+00	2021-06-21 20:00:30.667+00
2099	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:31.01+00	2021-06-21 20:00:31.01+00
2100	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:31.34+00	2021-06-21 20:00:31.34+00
2101	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:31.675+00	2021-06-21 20:00:31.675+00
2102	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:32.011+00	2021-06-21 20:00:32.011+00
2103	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:00:32.341+00	2021-06-21 20:00:32.341+00
2104	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 20:26:58.635+00	2021-06-21 20:26:58.635+00
2105	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 21:55:15.691+00	2021-06-21 21:55:15.691+00
2106	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 21:55:25.901+00	2021-06-21 21:55:25.901+00
2107	127.0.0.1	sessions.store	/sessions	POST	1	2021-06-21 21:56:00+00	2021-06-21 21:56:00+00
2108	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-21 21:56:00.184+00	2021-06-21 21:56:00.184+00
2109	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-21 21:56:27.076+00	2021-06-21 21:56:27.076+00
2110	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-21 21:57:19.392+00	2021-06-21 21:57:19.392+00
2111	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-21 21:57:40.804+00	2021-06-21 21:57:40.804+00
2112	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	1	2021-06-21 21:57:58.146+00	2021-06-21 21:57:58.146+00
2113	127.0.0.1	admin.contratos.update	/admin/contratos/1	PUT	1	2021-06-21 21:58:16.347+00	2021-06-21 21:58:16.347+00
2114	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-21 21:58:16.567+00	2021-06-21 21:58:16.567+00
2115	127.0.0.1	admin.contratos.edit	/admin/contratos/2/edit	GET	1	2021-06-21 21:58:22.157+00	2021-06-21 21:58:22.157+00
2116	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-21 21:58:33.626+00	2021-06-21 21:58:33.626+00
2117	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-06-21 21:58:57.588+00	2021-06-21 21:58:57.588+00
2118	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-21 21:58:57.798+00	2021-06-21 21:58:57.798+00
2119	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 21:59:15.958+00	2021-06-21 21:59:15.958+00
2120	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-21 21:59:18.234+00	2021-06-21 21:59:18.234+00
2121	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 21:59:23.661+00	2021-06-21 21:59:23.661+00
2122	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-21 21:59:27.242+00	2021-06-21 21:59:27.242+00
2123	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-06-21 21:59:48.364+00	2021-06-21 21:59:48.364+00
2124	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-06-21 21:59:50.912+00	2021-06-21 21:59:50.912+00
2125	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-06-21 21:59:52.954+00	2021-06-21 21:59:52.954+00
2126	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-06-21 21:59:58.856+00	2021-06-21 21:59:58.856+00
2127	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-21 22:00:01.408+00	2021-06-21 22:00:01.408+00
2128	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	1	2021-06-21 22:00:04.527+00	2021-06-21 22:00:04.527+00
2129	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	1	2021-06-21 22:00:14.37+00	2021-06-21 22:00:14.37+00
2130	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-21 22:00:14.552+00	2021-06-21 22:00:14.552+00
2131	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	1	2021-06-21 22:00:16.98+00	2021-06-21 22:00:16.98+00
2132	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	1	2021-06-21 22:00:27.455+00	2021-06-21 22:00:27.455+00
2133	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-06-21 22:00:27.646+00	2021-06-21 22:00:27.646+00
2134	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-06-21 22:02:07.706+00	2021-06-21 22:02:07.706+00
2135	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-21 22:02:20.427+00	2021-06-21 22:02:20.427+00
2136	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-21 22:02:23.497+00	2021-06-21 22:02:23.497+00
2137	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-21 22:02:53.317+00	2021-06-21 22:02:53.317+00
2138	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-21 22:02:53.557+00	2021-06-21 22:02:53.558+00
2139	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 22:03:03.057+00	2021-06-21 22:03:03.057+00
2140	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-21 22:03:06.098+00	2021-06-21 22:03:06.098+00
2141	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-21 22:05:08.486+00	2021-06-21 22:05:08.486+00
2142	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 22:05:08.694+00	2021-06-21 22:05:08.694+00
2143	127.0.0.1	admin.users.destroy	/admin/users/5	DELETE	1	2021-06-21 22:05:14.956+00	2021-06-21 22:05:14.956+00
2144	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 22:05:15.138+00	2021-06-21 22:05:15.138+00
2145	127.0.0.1	admin.users.destroy	/admin/users/4	DELETE	1	2021-06-21 22:05:18.588+00	2021-06-21 22:05:18.588+00
2146	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 22:05:18.785+00	2021-06-21 22:05:18.785+00
2147	127.0.0.1	admin.users.destroy	/admin/users/3	DELETE	1	2021-06-21 22:05:23.323+00	2021-06-21 22:05:23.323+00
2148	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 22:05:23.524+00	2021-06-21 22:05:23.524+00
2149	127.0.0.1	admin.users.destroy	/admin/users/2	DELETE	1	2021-06-21 22:05:26.513+00	2021-06-21 22:05:26.513+00
2150	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-21 22:05:26.71+00	2021-06-21 22:05:26.71+00
2151	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-21 22:05:32.925+00	2021-06-21 22:05:32.925+00
2152	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 22:06:30.17+00	2021-06-21 22:06:30.17+00
2153	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 22:06:31.79+00	2021-06-21 22:06:31.79+00
2154	127.0.0.1	sessions.store	/sessions	POST	33	2021-06-21 22:07:14.975+00	2021-06-21 22:07:14.975+00
2155	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-21 22:07:15.31+00	2021-06-21 22:07:15.31+00
2156	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	33	2021-06-21 22:07:36.473+00	2021-06-21 22:07:36.473+00
2157	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:07:53.389+00	2021-06-21 22:07:53.389+00
2158	127.0.0.1	admin.cargos.destroy	/admin/cargos/6	DELETE	33	2021-06-21 22:08:09.831+00	2021-06-21 22:08:09.831+00
2159	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:08:09.991+00	2021-06-21 22:08:09.991+00
2160	127.0.0.1	admin.cargos.destroy	/admin/cargos/7	DELETE	33	2021-06-21 22:08:14.281+00	2021-06-21 22:08:14.281+00
2161	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:08:14.437+00	2021-06-21 22:08:14.438+00
2162	127.0.0.1	admin.cargos.destroy	/admin/cargos/8	DELETE	33	2021-06-21 22:08:18.855+00	2021-06-21 22:08:18.855+00
2163	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:08:19.011+00	2021-06-21 22:08:19.011+00
2164	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-06-21 22:08:24.09+00	2021-06-21 22:08:24.09+00
2165	127.0.0.1	admin.cargos.store	/admin/cargos	POST	33	2021-06-21 22:08:50.891+00	2021-06-21 22:08:50.891+00
2166	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:08:51.076+00	2021-06-21 22:08:51.076+00
2167	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-06-21 22:08:56.591+00	2021-06-21 22:08:56.591+00
2168	127.0.0.1	admin.cargos.store	/admin/cargos	POST	33	2021-06-21 22:09:11.553+00	2021-06-21 22:09:11.553+00
2169	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:09:11.729+00	2021-06-21 22:09:11.729+00
2170	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-06-21 22:09:15.194+00	2021-06-21 22:09:15.194+00
2171	127.0.0.1	admin.cargos.store	/admin/cargos	POST	33	2021-06-21 22:09:29.715+00	2021-06-21 22:09:29.715+00
2172	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:09:29.888+00	2021-06-21 22:09:29.888+00
2173	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-06-21 22:09:33.365+00	2021-06-21 22:09:33.365+00
2174	127.0.0.1	admin.cargos.store	/admin/cargos	POST	33	2021-06-21 22:09:46.057+00	2021-06-21 22:09:46.057+00
2175	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:09:46.219+00	2021-06-21 22:09:46.219+00
2176	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-06-21 22:09:49.772+00	2021-06-21 22:09:49.772+00
2177	127.0.0.1	admin.cargos.store	/admin/cargos	POST	33	2021-06-21 22:10:01.349+00	2021-06-21 22:10:01.349+00
2178	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-21 22:10:01.525+00	2021-06-21 22:10:01.525+00
2179	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-21 22:11:17.152+00	2021-06-21 22:11:17.152+00
2180	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-21 22:11:44.718+00	2021-06-21 22:11:44.718+00
2181	127.0.0.1	admin.atividades.edit	/admin/atividades/2/edit	GET	33	2021-06-21 22:12:12.12+00	2021-06-21 22:12:12.12+00
2182	127.0.0.1	admin.atividades.edit	/admin/atividades/2/edit	GET	33	2021-06-21 22:12:17.101+00	2021-06-21 22:12:17.101+00
2183	127.0.0.1	admin.atividades.update	/admin/atividades/2	PUT	33	2021-06-21 22:13:39.734+00	2021-06-21 22:13:39.734+00
2184	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-21 22:13:39.984+00	2021-06-21 22:13:39.984+00
2185	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-21 22:16:32.406+00	2021-06-21 22:16:32.406+00
2186	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-21 22:16:32.595+00	2021-06-21 22:16:32.595+00
2187	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-21 22:17:40.535+00	2021-06-21 22:17:40.535+00
2188	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-21 22:17:53.7+00	2021-06-21 22:17:53.7+00
2189	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-21 22:17:59.739+00	2021-06-21 22:17:59.739+00
2190	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-21 22:18:01.772+00	2021-06-21 22:18:01.772+00
2191	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-21 22:18:04.388+00	2021-06-21 22:18:04.388+00
2192	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-21 22:18:16.383+00	2021-06-21 22:18:16.383+00
2193	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-21 22:18:24.17+00	2021-06-21 22:18:24.17+00
2194	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-21 22:21:02.219+00	2021-06-21 22:21:02.219+00
2195	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-21 22:52:32.949+00	2021-06-21 22:52:32.949+00
2196	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-21 22:52:33.188+00	2021-06-21 22:52:33.188+00
2197	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-22 00:11:31.304+00	2021-06-22 00:11:31.304+00
2198	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 00:11:53.289+00	2021-06-22 00:11:53.289+00
2199	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-22 00:18:05.724+00	2021-06-22 00:18:05.724+00
2200	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	33	2021-06-22 00:18:08.525+00	2021-06-22 00:18:08.525+00
2201	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	33	2021-06-22 00:18:10.583+00	2021-06-22 00:18:10.583+00
2202	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	33	2021-06-22 00:18:12.443+00	2021-06-22 00:18:12.443+00
2203	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	33	2021-06-22 00:18:17.037+00	2021-06-22 00:18:17.037+00
2204	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	33	2021-06-22 00:18:19.616+00	2021-06-22 00:18:19.616+00
2205	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-06-22 00:18:33.506+00	2021-06-22 00:18:33.506+00
2206	127.0.0.1	admin.areas.furos.edit	/admin/areas/furos/1/edit	GET	33	2021-06-22 00:18:40.473+00	2021-06-22 00:18:40.473+00
2207	127.0.0.1	admin.areas.furos.update	/admin/areas/furos/1	PUT	33	2021-06-22 00:18:46.103+00	2021-06-22 00:18:46.103+00
2208	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-06-22 00:18:46.254+00	2021-06-22 00:18:46.254+00
2209	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 00:18:50.338+00	2021-06-22 00:18:50.338+00
2210	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 00:18:59.359+00	2021-06-22 00:18:59.359+00
2211	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	33	2021-06-22 00:19:13.425+00	2021-06-22 00:19:13.425+00
2212	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-22 00:19:54.051+00	2021-06-22 00:19:54.051+00
2213	127.0.0.1	admin.contratos.index	/admin/contratos	GET	33	2021-06-22 00:19:56.519+00	2021-06-22 00:19:56.519+00
2214	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-22 00:20:00.299+00	2021-06-22 00:20:00.299+00
2215	127.0.0.1	admin.contratos.index	/admin/contratos	GET	33	2021-06-22 00:20:02.293+00	2021-06-22 00:20:02.293+00
2216	127.0.0.1	admin.contratos.edit	/admin/contratos/2/edit	GET	33	2021-06-22 00:20:08.321+00	2021-06-22 00:20:08.321+00
2217	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 00:20:16.627+00	2021-06-22 00:20:16.627+00
2218	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 00:20:20.232+00	2021-06-22 00:20:20.232+00
2219	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-22 00:20:24.787+00	2021-06-22 00:20:24.787+00
2220	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	33	2021-06-22 00:20:27.555+00	2021-06-22 00:20:27.555+00
2221	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-22 00:20:39.62+00	2021-06-22 00:20:39.62+00
2222	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	33	2021-06-22 00:20:43.717+00	2021-06-22 00:20:43.717+00
2223	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-22 00:20:48.048+00	2021-06-22 00:20:48.048+00
2224	127.0.0.1	admin.contratos.index	/admin/contratos	GET	33	2021-06-22 00:20:50.472+00	2021-06-22 00:20:50.472+00
2225	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 00:20:56.524+00	2021-06-22 00:20:56.524+00
2226	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 00:20:59.069+00	2021-06-22 00:20:59.069+00
2227	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 00:21:03.433+00	2021-06-22 00:21:03.433+00
2228	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 01:51:14.04+00	2021-06-22 01:51:14.04+00
2229	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-22 01:51:16.99+00	2021-06-22 01:51:16.99+00
2230	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-22 01:51:23.272+00	2021-06-22 01:51:23.272+00
2231	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-22 01:51:28.376+00	2021-06-22 01:51:28.376+00
2232	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-22 01:51:36.921+00	2021-06-22 01:51:36.921+00
2233	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-22 01:51:46.425+00	2021-06-22 01:51:46.425+00
2234	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-22 01:51:50.552+00	2021-06-22 01:51:50.552+00
2235	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-22 01:51:52.646+00	2021-06-22 01:51:52.646+00
2236	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-22 01:52:03.613+00	2021-06-22 01:52:03.613+00
2237	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-06-22 01:52:06.367+00	2021-06-22 01:52:06.367+00
2238	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-06-22 01:52:19.563+00	2021-06-22 01:52:19.563+00
2239	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-06-22 01:52:20.122+00	2021-06-22 01:52:20.122+00
2240	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-22 01:52:22.474+00	2021-06-22 01:52:22.474+00
2241	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-22 01:52:24.264+00	2021-06-22 01:52:24.264+00
2242	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-22 01:52:45.68+00	2021-06-22 01:52:45.68+00
2243	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-22 01:52:45.945+00	2021-06-22 01:52:45.945+00
2244	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-22 01:53:10.99+00	2021-06-22 01:53:10.99+00
2245	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-06-22 01:53:11.243+00	2021-06-22 01:53:11.243+00
2246	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-06-22 01:53:24.623+00	2021-06-22 01:53:24.623+00
2247	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-06-22 01:53:24.908+00	2021-06-22 01:53:24.908+00
2248	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-22 01:53:27.732+00	2021-06-22 01:53:27.732+00
2249	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-06-22 01:53:29.936+00	2021-06-22 01:53:29.936+00
2250	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-22 01:53:33.671+00	2021-06-22 01:53:33.671+00
2251	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-06-22 01:53:35.696+00	2021-06-22 01:53:35.696+00
2252	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-06-22 01:53:39.639+00	2021-06-22 01:53:39.639+00
2253	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-06-22 01:53:42.559+00	2021-06-22 01:53:42.559+00
2254	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-06-22 01:53:45.582+00	2021-06-22 01:53:45.582+00
2255	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-06-22 01:53:48.883+00	2021-06-22 01:53:48.883+00
2256	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 01:53:49.118+00	2021-06-22 01:53:49.118+00
2257	127.0.0.1	sessions.store	/sessions	POST	34	2021-06-22 01:53:59.018+00	2021-06-22 01:53:59.018+00
2258	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-22 01:53:59.222+00	2021-06-22 01:53:59.222+00
2259	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-22 01:54:02.63+00	2021-06-22 01:54:02.63+00
2260	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-22 01:54:05.73+00	2021-06-22 01:54:05.73+00
2261	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-06-22 01:54:09.984+00	2021-06-22 01:54:09.984+00
2262	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-22 01:54:13.235+00	2021-06-22 01:54:13.235+00
2263	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-22 01:54:18.105+00	2021-06-22 01:54:18.105+00
2264	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-06-22 01:54:24.277+00	2021-06-22 01:54:24.277+00
2265	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-22 01:54:24.512+00	2021-06-22 01:54:24.512+00
2266	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-22 01:54:30.648+00	2021-06-22 01:54:30.648+00
2267	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-06-22 01:54:32.748+00	2021-06-22 01:54:32.748+00
2268	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-22 01:54:46.268+00	2021-06-22 01:54:46.268+00
2269	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-06-22 01:54:51.264+00	2021-06-22 01:54:51.264+00
2270	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-22 01:54:51.457+00	2021-06-22 01:54:51.457+00
2271	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-22 01:54:56.009+00	2021-06-22 01:54:56.009+00
2272	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-22 01:54:58.26+00	2021-06-22 01:54:58.26+00
2273	127.0.0.1	admin.areas.index	/admin/areas	GET	34	2021-06-22 01:54:59.401+00	2021-06-22 01:54:59.401+00
2274	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 04:03:31.275+00	2021-06-22 04:03:31.275+00
2275	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-22 04:54:50.045+00	2021-06-22 04:54:50.045+00
2276	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 04:58:53.364+00	2021-06-22 04:58:53.364+00
2277	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 06:22:47.484+00	2021-06-22 06:22:47.484+00
2278	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 06:31:04.63+00	2021-06-22 06:31:04.63+00
2279	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 06:44:15.967+00	2021-06-22 06:44:15.967+00
2280	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 09:14:39.502+00	2021-06-22 09:14:39.502+00
2281	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 10:23:49.105+00	2021-06-22 10:23:49.105+00
2282	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 10:23:49.319+00	2021-06-22 10:23:49.319+00
2283	127.0.0.1	sessions.store	/sessions	POST	33	2021-06-22 12:15:09.881+00	2021-06-22 12:15:09.881+00
2284	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-22 12:15:10.057+00	2021-06-22 12:15:10.057+00
2285	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 12:15:24.484+00	2021-06-22 12:15:24.484+00
2286	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 12:15:29.711+00	2021-06-22 12:15:29.711+00
2287	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 12:16:40.209+00	2021-06-22 12:16:40.209+00
2288	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 12:16:58.779+00	2021-06-22 12:16:58.779+00
2289	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 12:16:58.943+00	2021-06-22 12:16:58.943+00
2290	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:17:20.374+00	2021-06-22 12:17:20.374+00
2291	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:17:27.597+00	2021-06-22 12:17:27.597+00
2292	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:21:11.956+00	2021-06-22 12:21:11.956+00
2293	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:21:24.32+00	2021-06-22 12:21:24.32+00
2294	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:21:42.87+00	2021-06-22 12:21:42.87+00
2295	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:21:43.038+00	2021-06-22 12:21:43.038+00
2296	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:22:03.673+00	2021-06-22 12:22:03.673+00
2297	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:24:23.633+00	2021-06-22 12:24:23.633+00
2298	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:24:23.799+00	2021-06-22 12:24:23.799+00
2299	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:24:51.307+00	2021-06-22 12:24:51.307+00
2300	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:27:36.188+00	2021-06-22 12:27:36.188+00
2301	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:27:36.366+00	2021-06-22 12:27:36.366+00
2302	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:28:04.933+00	2021-06-22 12:28:04.933+00
2303	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:29:48.138+00	2021-06-22 12:29:48.138+00
2304	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:29:48.309+00	2021-06-22 12:29:48.309+00
2305	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:30:11.449+00	2021-06-22 12:30:11.449+00
2306	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:31:59.17+00	2021-06-22 12:31:59.17+00
2307	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:31:59.339+00	2021-06-22 12:31:59.339+00
2308	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:32:20.428+00	2021-06-22 12:32:20.428+00
2309	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 12:33:23.767+00	2021-06-22 12:33:23.767+00
2310	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:34:33.692+00	2021-06-22 12:34:33.692+00
2311	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:34:33.86+00	2021-06-22 12:34:33.86+00
2312	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:34:55.461+00	2021-06-22 12:34:55.461+00
2313	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:37:16.77+00	2021-06-22 12:37:16.77+00
2314	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:37:16.941+00	2021-06-22 12:37:16.941+00
2315	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:37:38.857+00	2021-06-22 12:37:38.857+00
2316	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:39:29.096+00	2021-06-22 12:39:29.096+00
2317	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:39:29.26+00	2021-06-22 12:39:29.26+00
2318	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:39:41.33+00	2021-06-22 12:39:41.33+00
2319	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:45:12.266+00	2021-06-22 12:45:12.266+00
2320	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:45:12.431+00	2021-06-22 12:45:12.431+00
2321	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:51:47.097+00	2021-06-22 12:51:47.097+00
2322	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:53:58.386+00	2021-06-22 12:53:58.386+00
2323	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:53:58.556+00	2021-06-22 12:53:58.556+00
2324	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:54:13.019+00	2021-06-22 12:54:13.019+00
2325	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:54:32.197+00	2021-06-22 12:54:32.197+00
2326	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:54:32.354+00	2021-06-22 12:54:32.354+00
2327	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:56:18.073+00	2021-06-22 12:56:18.073+00
2328	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:56:18.223+00	2021-06-22 12:56:18.223+00
2329	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:57:17.853+00	2021-06-22 12:57:17.853+00
2330	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:57:18.008+00	2021-06-22 12:57:18.008+00
2331	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 12:57:34.489+00	2021-06-22 12:57:34.489+00
2332	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 12:57:34.656+00	2021-06-22 12:57:34.656+00
2333	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 12:58:52.982+00	2021-06-22 12:58:52.982+00
2334	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:00:46.947+00	2021-06-22 13:00:46.947+00
2335	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:00:47.113+00	2021-06-22 13:00:47.113+00
2336	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:02:08.386+00	2021-06-22 13:02:08.386+00
2337	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:04:22.424+00	2021-06-22 13:04:22.424+00
2338	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:04:22.594+00	2021-06-22 13:04:22.594+00
2339	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:05:08.146+00	2021-06-22 13:05:08.146+00
2340	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:07:08.814+00	2021-06-22 13:07:08.814+00
2341	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:07:08.981+00	2021-06-22 13:07:08.981+00
2342	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:07:36.831+00	2021-06-22 13:07:36.831+00
2343	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:09:53.223+00	2021-06-22 13:09:53.223+00
2344	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:09:53.389+00	2021-06-22 13:09:53.389+00
2345	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:10:31.692+00	2021-06-22 13:10:31.692+00
2346	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:12:57.505+00	2021-06-22 13:12:57.505+00
2347	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:12:57.67+00	2021-06-22 13:12:57.67+00
2348	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:13:28.242+00	2021-06-22 13:13:28.242+00
2349	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:19:06.464+00	2021-06-22 13:19:06.464+00
2350	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:19:06.632+00	2021-06-22 13:19:06.632+00
2351	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:19:13.859+00	2021-06-22 13:19:13.859+00
2352	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:20:52.544+00	2021-06-22 13:20:52.544+00
2353	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:20:52.713+00	2021-06-22 13:20:52.713+00
2354	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:21:11.662+00	2021-06-22 13:21:11.662+00
2355	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:22:33.825+00	2021-06-22 13:22:33.825+00
2356	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:22:34.005+00	2021-06-22 13:22:34.005+00
2357	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 13:22:37.16+00	2021-06-22 13:22:37.16+00
2358	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:23:03.371+00	2021-06-22 13:23:03.371+00
2359	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:24:28.798+00	2021-06-22 13:24:28.798+00
2360	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:24:28.965+00	2021-06-22 13:24:28.965+00
2361	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:24:51.207+00	2021-06-22 13:24:51.207+00
2362	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 13:25:19.894+00	2021-06-22 13:25:19.894+00
2363	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 13:28:29.229+00	2021-06-22 13:28:29.229+00
2364	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:28:29.393+00	2021-06-22 13:28:29.393+00
2365	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:29:17.909+00	2021-06-22 13:29:17.909+00
2366	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 13:30:04.06+00	2021-06-22 13:30:04.06+00
2367	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-06-22 13:30:09.342+00	2021-06-22 13:30:09.342+00
2368	127.0.0.1	admin.cargos.store	/admin/cargos	POST	33	2021-06-22 13:30:36.796+00	2021-06-22 13:30:36.796+00
2369	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 13:30:36.987+00	2021-06-22 13:30:36.987+00
2370	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-06-22 13:30:40.686+00	2021-06-22 13:30:40.686+00
2371	127.0.0.1	admin.cargos.store	/admin/cargos	POST	33	2021-06-22 13:30:52.896+00	2021-06-22 13:30:52.896+00
2372	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 13:30:53.069+00	2021-06-22 13:30:53.069+00
2373	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 13:31:06.491+00	2021-06-22 13:31:06.491+00
2374	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 13:31:28.377+00	2021-06-22 13:31:28.377+00
2375	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 16:01:48.865+00	2021-06-22 16:01:48.865+00
2376	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:39:44.078+00	2021-06-22 16:39:44.078+00
2377	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:39:44.247+00	2021-06-22 16:39:44.247+00
2378	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:40:22.964+00	2021-06-22 16:40:22.964+00
2379	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:42:14.085+00	2021-06-22 16:42:14.085+00
2380	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:42:14.27+00	2021-06-22 16:42:14.27+00
2381	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:42:52.566+00	2021-06-22 16:42:52.566+00
2382	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:44:34.5+00	2021-06-22 16:44:34.5+00
2383	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:44:34.668+00	2021-06-22 16:44:34.668+00
2384	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:45:07.595+00	2021-06-22 16:45:07.595+00
2385	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:47:05.955+00	2021-06-22 16:47:05.956+00
2386	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:47:06.123+00	2021-06-22 16:47:06.123+00
2387	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:47:30.555+00	2021-06-22 16:47:30.555+00
2388	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:49:35.362+00	2021-06-22 16:49:35.362+00
2389	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:49:35.536+00	2021-06-22 16:49:35.536+00
2390	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:50:38.68+00	2021-06-22 16:50:38.68+00
2391	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:52:01.959+00	2021-06-22 16:52:01.959+00
2392	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:52:02.133+00	2021-06-22 16:52:02.133+00
2393	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:52:18.569+00	2021-06-22 16:52:18.569+00
2394	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:54:30.112+00	2021-06-22 16:54:30.112+00
2395	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:54:30.309+00	2021-06-22 16:54:30.309+00
2396	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:54:43.973+00	2021-06-22 16:54:43.973+00
2397	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:56:23.808+00	2021-06-22 16:56:23.808+00
2398	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:56:23.975+00	2021-06-22 16:56:23.975+00
2399	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:56:45.096+00	2021-06-22 16:56:45.096+00
2400	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:56:50.655+00	2021-06-22 16:56:50.655+00
2401	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 16:58:36.273+00	2021-06-22 16:58:36.273+00
2402	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 16:58:36.434+00	2021-06-22 16:58:36.434+00
2403	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-22 16:58:48.964+00	2021-06-22 16:58:48.964+00
2404	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-22 17:00:14.172+00	2021-06-22 17:00:14.172+00
2405	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 17:00:14.348+00	2021-06-22 17:00:14.348+00
2406	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 17:00:26.04+00	2021-06-22 17:00:26.04+00
2407	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 17:00:50.483+00	2021-06-22 17:00:50.483+00
2408	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:00:53.827+00	2021-06-22 17:00:53.827+00
2409	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 17:01:11.288+00	2021-06-22 17:01:11.288+00
2410	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 17:01:16.204+00	2021-06-22 17:01:16.204+00
2411	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 17:01:23.972+00	2021-06-22 17:01:23.972+00
2412	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-22 17:01:27.449+00	2021-06-22 17:01:27.449+00
2413	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	33	2021-06-22 17:01:30.827+00	2021-06-22 17:01:30.827+00
2414	127.0.0.1	admin.contratos.index	/admin/contratos	GET	33	2021-06-22 17:01:38.514+00	2021-06-22 17:01:38.514+00
2415	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-22 17:01:48.853+00	2021-06-22 17:01:48.853+00
2416	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:01:51.246+00	2021-06-22 17:01:51.246+00
2417	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:03:34.891+00	2021-06-22 17:03:34.891+00
2418	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:06:18.041+00	2021-06-22 17:06:18.041+00
2419	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:06:19.381+00	2021-06-22 17:06:19.381+00
2420	127.0.0.1	admin.atividades.edit	/admin/atividades/1/edit	GET	33	2021-06-22 17:06:29.919+00	2021-06-22 17:06:29.919+00
2421	127.0.0.1	admin.atividades.update	/admin/atividades/1	PUT	33	2021-06-22 17:12:52.83+00	2021-06-22 17:12:52.83+00
2422	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:12:52.998+00	2021-06-22 17:12:52.998+00
2423	127.0.0.1	admin.atividades.edit	/admin/atividades/17/edit	GET	33	2021-06-22 17:13:06.37+00	2021-06-22 17:13:06.37+00
2424	127.0.0.1	admin.atividades.update	/admin/atividades/17	PUT	33	2021-06-22 17:15:37.182+00	2021-06-22 17:15:37.182+00
2425	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:15:37.346+00	2021-06-22 17:15:37.346+00
2426	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:16:19.629+00	2021-06-22 17:16:19.629+00
2427	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:17:04.124+00	2021-06-22 17:17:04.124+00
2428	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:17:09.232+00	2021-06-22 17:17:09.232+00
2429	127.0.0.1	admin.atividades.edit	/admin/atividades/18/edit	GET	33	2021-06-22 17:17:17.551+00	2021-06-22 17:17:17.551+00
2430	127.0.0.1	admin.atividades.update	/admin/atividades/18	PUT	33	2021-06-22 17:19:58.4+00	2021-06-22 17:19:58.4+00
2431	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:19:58.567+00	2021-06-22 17:19:58.567+00
2432	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:20:33.955+00	2021-06-22 17:20:33.955+00
2433	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:22:59.776+00	2021-06-22 17:22:59.776+00
2434	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:22:59.94+00	2021-06-22 17:22:59.94+00
2435	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:23:52.564+00	2021-06-22 17:23:52.564+00
2436	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:26:23.766+00	2021-06-22 17:26:23.766+00
2437	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:26:23.936+00	2021-06-22 17:26:23.936+00
2438	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 17:26:36.759+00	2021-06-22 17:26:36.759+00
2439	127.0.0.1	admin.cargos.destroy	/admin/cargos/36	DELETE	33	2021-06-22 17:26:44.329+00	2021-06-22 17:26:44.329+00
2440	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 17:26:44.479+00	2021-06-22 17:26:44.479+00
2441	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:26:51.037+00	2021-06-22 17:26:51.037+00
2442	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:27:15.336+00	2021-06-22 17:27:15.336+00
2443	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:29:50.991+00	2021-06-22 17:29:50.991+00
2444	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:29:51.156+00	2021-06-22 17:29:51.156+00
2445	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:30:57.531+00	2021-06-22 17:30:57.531+00
2446	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:33:36.007+00	2021-06-22 17:33:36.007+00
2447	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:33:36.165+00	2021-06-22 17:33:36.165+00
2448	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:34:37.138+00	2021-06-22 17:34:37.138+00
2449	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:34:48.11+00	2021-06-22 17:34:48.11+00
2450	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:34:48.286+00	2021-06-22 17:34:48.286+00
2451	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:36:27.791+00	2021-06-22 17:36:27.791+00
2452	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:36:27.949+00	2021-06-22 17:36:27.949+00
2453	127.0.0.1	admin.atividades.edit	/admin/atividades/2/edit	GET	33	2021-06-22 17:36:53.379+00	2021-06-22 17:36:53.379+00
2454	127.0.0.1	admin.atividades.update	/admin/atividades/2	PUT	33	2021-06-22 17:38:18.672+00	2021-06-22 17:38:18.672+00
2455	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:38:18.838+00	2021-06-22 17:38:18.838+00
2456	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:38:36.431+00	2021-06-22 17:38:36.431+00
2457	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:38:45.222+00	2021-06-22 17:38:45.222+00
2458	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:39:36.545+00	2021-06-22 17:39:36.545+00
2459	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 17:41:15.865+00	2021-06-22 17:41:15.865+00
2460	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:41:24.582+00	2021-06-22 17:41:24.583+00
2461	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:41:24.749+00	2021-06-22 17:41:24.749+00
2462	127.0.0.1	admin.atividades.edit	/admin/atividades/2/edit	GET	33	2021-06-22 17:41:30.69+00	2021-06-22 17:41:30.69+00
2463	127.0.0.1	admin.atividades.update	/admin/atividades/2	PUT	33	2021-06-22 17:41:35.064+00	2021-06-22 17:41:35.064+00
2464	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:41:35.225+00	2021-06-22 17:41:35.225+00
2465	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:41:57.455+00	2021-06-22 17:41:57.455+00
2466	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:44:23.674+00	2021-06-22 17:44:23.674+00
2467	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:44:23.85+00	2021-06-22 17:44:23.85+00
2468	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:44:32.139+00	2021-06-22 17:44:32.139+00
2469	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:46:27.596+00	2021-06-22 17:46:27.596+00
2470	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:46:27.766+00	2021-06-22 17:46:27.767+00
2471	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:47:06.677+00	2021-06-22 17:47:06.677+00
2472	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:49:01.336+00	2021-06-22 17:49:01.336+00
2473	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:49:01.525+00	2021-06-22 17:49:01.525+00
2474	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:50:23.172+00	2021-06-22 17:50:23.172+00
2475	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:52:14.085+00	2021-06-22 17:52:14.085+00
2476	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:52:14.247+00	2021-06-22 17:52:14.247+00
2477	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	33	2021-06-22 17:52:37.454+00	2021-06-22 17:52:37.454+00
2478	127.0.0.1	admin.atividades.update	/admin/atividades/5	PUT	33	2021-06-22 17:54:14.655+00	2021-06-22 17:54:14.655+00
2479	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:54:14.821+00	2021-06-22 17:54:14.821+00
2480	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 17:54:27.805+00	2021-06-22 17:54:27.805+00
2481	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 17:56:33.177+00	2021-06-22 17:56:33.177+00
2482	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:56:33.341+00	2021-06-22 17:56:33.341+00
2483	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-22 17:57:00.083+00	2021-06-22 17:57:00.083+00
2484	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 17:57:07.354+00	2021-06-22 17:57:07.354+00
2485	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-22 17:57:13.6+00	2021-06-22 17:57:13.6+00
2486	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	33	2021-06-22 17:57:15.682+00	2021-06-22 17:57:15.682+00
2487	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-22 17:57:23.693+00	2021-06-22 17:57:23.693+00
2488	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 17:57:30.786+00	2021-06-22 17:57:30.786+00
2489	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 17:57:36.946+00	2021-06-22 17:57:36.946+00
2490	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:01:31.425+00	2021-06-22 18:01:31.425+00
2491	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:01:53.764+00	2021-06-22 18:01:53.764+00
2492	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:01:53.923+00	2021-06-22 18:01:53.923+00
2493	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:02:17.318+00	2021-06-22 18:02:17.318+00
2494	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:02:29.694+00	2021-06-22 18:02:29.694+00
2495	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:02:29.847+00	2021-06-22 18:02:29.847+00
2496	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:02:41.286+00	2021-06-22 18:02:41.286+00
2497	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:02:41.434+00	2021-06-22 18:02:41.434+00
2498	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:04:03.162+00	2021-06-22 18:04:03.162+00
2499	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:04:20.237+00	2021-06-22 18:04:20.237+00
2500	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:04:20.386+00	2021-06-22 18:04:20.386+00
2501	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:04:31.963+00	2021-06-22 18:04:31.963+00
2502	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:05:02.94+00	2021-06-22 18:05:02.94+00
2503	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:05:03.089+00	2021-06-22 18:05:03.089+00
2504	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:05:23.887+00	2021-06-22 18:05:23.887+00
2505	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:05:52.769+00	2021-06-22 18:05:52.769+00
2506	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:05:52.922+00	2021-06-22 18:05:52.922+00
2507	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/27/edit	GET	33	2021-06-22 18:06:03.317+00	2021-06-22 18:06:03.317+00
2508	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/27	PUT	33	2021-06-22 18:06:08.105+00	2021-06-22 18:06:08.105+00
2509	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:06:08.256+00	2021-06-22 18:06:08.256+00
2510	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/28/edit	GET	33	2021-06-22 18:06:12.147+00	2021-06-22 18:06:12.147+00
2511	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/28	PUT	33	2021-06-22 18:06:18.815+00	2021-06-22 18:06:18.815+00
2512	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:06:18.963+00	2021-06-22 18:06:18.963+00
2513	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/28/edit	GET	33	2021-06-22 18:06:58.677+00	2021-06-22 18:06:58.677+00
2514	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/28	PUT	33	2021-06-22 18:07:05.052+00	2021-06-22 18:07:05.052+00
2515	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/28/edit	GET	33	2021-06-22 18:07:05.205+00	2021-06-22 18:07:05.205+00
2516	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/28	PUT	33	2021-06-22 18:07:10.399+00	2021-06-22 18:07:10.399+00
2517	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:07:10.554+00	2021-06-22 18:07:10.554+00
2518	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/27/edit	GET	33	2021-06-22 18:07:20.646+00	2021-06-22 18:07:20.646+00
2519	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/27	PUT	33	2021-06-22 18:07:25.669+00	2021-06-22 18:07:25.673+00
2520	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:07:25.828+00	2021-06-22 18:07:25.828+00
2521	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:08:14.411+00	2021-06-22 18:08:14.411+00
2522	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:08:42.919+00	2021-06-22 18:08:42.919+00
2523	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:08:43.089+00	2021-06-22 18:08:43.089+00
2524	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:08:50.798+00	2021-06-22 18:08:50.798+00
2525	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:08:50.954+00	2021-06-22 18:08:50.954+00
2526	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:08:57.605+00	2021-06-22 18:08:57.605+00
2527	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:09:18.513+00	2021-06-22 18:09:18.513+00
2528	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:09:37.8+00	2021-06-22 18:09:37.8+00
2529	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:09:42.799+00	2021-06-22 18:09:42.799+00
2530	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:09:59.962+00	2021-06-22 18:09:59.962+00
2531	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:10:00.112+00	2021-06-22 18:10:00.112+00
2532	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:10:03.384+00	2021-06-22 18:10:03.384+00
2533	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:10:52.859+00	2021-06-22 18:10:52.86+00
2534	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:10:53.01+00	2021-06-22 18:10:53.01+00
2535	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:10:58.949+00	2021-06-22 18:10:58.949+00
2536	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:10:59.097+00	2021-06-22 18:10:59.098+00
2537	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:11:07.669+00	2021-06-22 18:11:07.669+00
2538	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-06-22 18:11:07.826+00	2021-06-22 18:11:07.826+00
2539	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-06-22 18:12:41.714+00	2021-06-22 18:12:41.714+00
2540	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:12:41.868+00	2021-06-22 18:12:41.868+00
2541	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-22 18:12:58.881+00	2021-06-22 18:12:58.881+00
2542	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-22 18:13:01.338+00	2021-06-22 18:13:01.338+00
2543	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:13:04.043+00	2021-06-22 18:13:04.043+00
2544	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-22 18:13:11.773+00	2021-06-22 18:13:11.773+00
2545	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:13:13.973+00	2021-06-22 18:13:13.973+00
2546	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-22 18:15:43.957+00	2021-06-22 18:15:43.957+00
2547	127.0.0.1	admin.contratos.index	/admin/contratos	GET	33	2021-06-22 18:15:48.137+00	2021-06-22 18:15:48.137+00
2548	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-22 18:15:50.669+00	2021-06-22 18:15:50.669+00
2549	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:15:52.963+00	2021-06-22 18:15:52.963+00
2550	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-22 18:15:58.028+00	2021-06-22 18:15:58.028+00
2551	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-06-22 18:16:02.809+00	2021-06-22 18:16:02.809+00
2552	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-22 18:16:13.88+00	2021-06-22 18:16:13.88+00
2553	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-22 18:16:24.287+00	2021-06-22 18:16:24.287+00
2554	127.0.0.1	admin.contratos.index	/admin/contratos	GET	33	2021-06-22 18:16:28.595+00	2021-06-22 18:16:28.595+00
2555	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-22 18:16:30.069+00	2021-06-22 18:16:30.069+00
2556	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:54:26.283+00	2021-06-22 18:54:26.283+00
2557	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:54:33.586+00	2021-06-22 18:54:33.586+00
2558	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:55:08.952+00	2021-06-22 18:55:08.953+00
2559	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:55:09.103+00	2021-06-22 18:55:09.103+00
2560	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:55:32.275+00	2021-06-22 18:55:32.275+00
2561	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:55:50.292+00	2021-06-22 18:55:50.292+00
2562	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:55:50.446+00	2021-06-22 18:55:50.446+00
2563	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:56:04.674+00	2021-06-22 18:56:04.674+00
2564	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:56:23.192+00	2021-06-22 18:56:23.192+00
2565	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:56:23.342+00	2021-06-22 18:56:23.342+00
2566	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:56:26.563+00	2021-06-22 18:56:26.563+00
2567	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:56:39.838+00	2021-06-22 18:56:39.838+00
2568	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:56:39.997+00	2021-06-22 18:56:39.997+00
2569	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:56:51.895+00	2021-06-22 18:56:51.895+00
2570	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:57:00.171+00	2021-06-22 18:57:00.171+00
2571	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:57:00.318+00	2021-06-22 18:57:00.318+00
2572	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:57:15.048+00	2021-06-22 18:57:15.048+00
2573	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:57:21.39+00	2021-06-22 18:57:21.39+00
2574	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:57:21.54+00	2021-06-22 18:57:21.54+00
2575	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:57:23.551+00	2021-06-22 18:57:23.551+00
2576	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:57:47.422+00	2021-06-22 18:57:47.422+00
2577	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:57:47.57+00	2021-06-22 18:57:47.57+00
2578	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:58:02.586+00	2021-06-22 18:58:02.586+00
2579	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:58:48.917+00	2021-06-22 18:58:48.917+00
2580	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:58:49.068+00	2021-06-22 18:58:49.068+00
2581	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 18:59:18.185+00	2021-06-22 18:59:18.186+00
2582	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 18:59:46.512+00	2021-06-22 18:59:46.512+00
2583	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 18:59:46.669+00	2021-06-22 18:59:46.669+00
2584	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:00:12.674+00	2021-06-22 19:00:12.674+00
2585	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:00:29.898+00	2021-06-22 19:00:29.898+00
2586	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:00:30.051+00	2021-06-22 19:00:30.051+00
2587	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:00:36.684+00	2021-06-22 19:00:36.684+00
2588	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:00:47.665+00	2021-06-22 19:00:47.665+00
2589	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:00:47.813+00	2021-06-22 19:00:47.813+00
2590	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:00:59.888+00	2021-06-22 19:00:59.888+00
2591	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:01:14.654+00	2021-06-22 19:01:14.654+00
2592	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:01:14.804+00	2021-06-22 19:01:14.804+00
2593	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:01:42.126+00	2021-06-22 19:01:42.126+00
2594	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:02:04.416+00	2021-06-22 19:02:04.416+00
2595	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:02:04.576+00	2021-06-22 19:02:04.576+00
2596	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:02:24.505+00	2021-06-22 19:02:24.505+00
2597	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:03:41.082+00	2021-06-22 19:03:41.082+00
2598	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:03:41.238+00	2021-06-22 19:03:41.238+00
2599	127.0.0.1	admin.atividades.edit	/admin/atividades/40/edit	GET	33	2021-06-22 19:03:47.276+00	2021-06-22 19:03:47.276+00
2600	127.0.0.1	admin.atividades.update	/admin/atividades/40	PUT	33	2021-06-22 19:03:52.193+00	2021-06-22 19:03:52.193+00
2601	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:03:52.356+00	2021-06-22 19:03:52.356+00
2602	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:04:34.305+00	2021-06-22 19:04:34.305+00
2603	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:04:56.098+00	2021-06-22 19:04:56.098+00
2604	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:04:56.251+00	2021-06-22 19:04:56.251+00
2605	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:05:08.814+00	2021-06-22 19:05:08.814+00
2606	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:05:21.216+00	2021-06-22 19:05:21.216+00
2607	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:05:21.366+00	2021-06-22 19:05:21.366+00
2608	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:05:38.399+00	2021-06-22 19:05:38.399+00
2609	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:05:47.737+00	2021-06-22 19:05:47.737+00
2610	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:05:47.882+00	2021-06-22 19:05:47.882+00
2611	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:06:02.319+00	2021-06-22 19:06:02.319+00
2612	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:06:31.378+00	2021-06-22 19:06:31.378+00
2613	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:06:31.525+00	2021-06-22 19:06:31.525+00
2614	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:06:44.169+00	2021-06-22 19:06:44.169+00
2615	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:06:57.622+00	2021-06-22 19:06:57.622+00
2616	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:06:57.776+00	2021-06-22 19:06:57.776+00
2617	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 19:07:00.581+00	2021-06-22 19:07:00.581+00
2618	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:07:13.575+00	2021-06-22 19:07:13.575+00
2619	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:07:27.989+00	2021-06-22 19:07:27.989+00
2620	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:07:28.137+00	2021-06-22 19:07:28.137+00
2621	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:07:55.457+00	2021-06-22 19:07:55.457+00
2622	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:08:36.73+00	2021-06-22 19:08:36.73+00
2623	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:08:36.88+00	2021-06-22 19:08:36.88+00
2624	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:08:50.35+00	2021-06-22 19:08:50.35+00
2625	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:09:02.948+00	2021-06-22 19:09:02.948+00
2626	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:09:03.098+00	2021-06-22 19:09:03.098+00
2627	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:09:29.27+00	2021-06-22 19:09:29.27+00
2628	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:10:26.069+00	2021-06-22 19:10:26.069+00
2629	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:10:26.218+00	2021-06-22 19:10:26.218+00
2630	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:10:43.909+00	2021-06-22 19:10:43.909+00
2631	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:11:09.999+00	2021-06-22 19:11:09.999+00
2632	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 19:19:31.896+00	2021-06-22 19:19:31.896+00
2633	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-22 19:42:35.901+00	2021-06-22 19:42:35.901+00
2634	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-22 19:42:46.189+00	2021-06-22 19:42:46.189+00
2635	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:42:46.336+00	2021-06-22 19:42:46.336+00
2636	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-22 19:47:50.202+00	2021-06-22 19:47:50.202+00
2637	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 20:58:13.985+00	2021-06-22 20:58:13.986+00
2638	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 21:49:06.071+00	2021-06-22 21:49:06.071+00
2639	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-22 21:49:06.244+00	2021-06-22 21:49:06.244+00
2640	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-22 21:49:08.67+00	2021-06-22 21:49:08.67+00
2641	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-22 21:49:11.759+00	2021-06-22 21:49:11.759+00
2642	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-22 21:49:16.008+00	2021-06-22 21:49:16.008+00
2643	127.0.0.1	admin.atividades.edit	/admin/atividades/28/edit	GET	34	2021-06-22 21:49:21.358+00	2021-06-22 21:49:21.358+00
2644	127.0.0.1	admin.atividades.update	/admin/atividades/28	PUT	34	2021-06-22 21:49:31.224+00	2021-06-22 21:49:31.224+00
2645	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-22 21:49:31.423+00	2021-06-22 21:49:31.423+00
2646	127.0.0.1	admin.atividades.edit	/admin/atividades/47/edit	GET	34	2021-06-22 21:49:35.876+00	2021-06-22 21:49:35.876+00
2647	127.0.0.1	admin.atividades.update	/admin/atividades/47	PUT	34	2021-06-22 21:49:41.067+00	2021-06-22 21:49:41.067+00
2648	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-22 21:49:41.245+00	2021-06-22 21:49:41.245+00
2649	127.0.0.1	admin.atividades.edit	/admin/atividades/51/edit	GET	34	2021-06-22 21:49:54.445+00	2021-06-22 21:49:54.445+00
2650	127.0.0.1	admin.atividades.update	/admin/atividades/51	PUT	34	2021-06-22 21:49:58.027+00	2021-06-22 21:49:58.027+00
2651	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-22 21:49:58.21+00	2021-06-22 21:49:58.21+00
2652	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-22 22:05:18.091+00	2021-06-22 22:05:18.091+00
2653	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-22 22:05:18.318+00	2021-06-22 22:05:18.318+00
2654	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-22 22:23:47.496+00	2021-06-22 22:23:47.496+00
2655	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-22 22:23:47.671+00	2021-06-22 22:23:47.671+00
2656	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-23 00:09:54.47+00	2021-06-23 00:09:54.47+00
2657	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-23 00:10:25.059+00	2021-06-23 00:10:25.059+00
2658	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-23 00:10:47.179+00	2021-06-23 00:10:47.179+00
2659	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 00:52:53.858+00	2021-06-23 00:52:53.858+00
2660	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 04:03:20.539+00	2021-06-23 04:03:20.539+00
2661	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 04:03:20.621+00	2021-06-23 04:03:20.621+00
2662	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 04:58:16.709+00	2021-06-23 04:58:16.709+00
2663	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 05:52:08.899+00	2021-06-23 05:52:08.899+00
2664	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 07:35:45.644+00	2021-06-23 07:35:45.644+00
2665	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 09:17:42.342+00	2021-06-23 09:17:42.342+00
2666	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 10:54:21.695+00	2021-06-23 10:54:21.695+00
2667	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 11:59:33.163+00	2021-06-23 11:59:33.163+00
2668	127.0.0.1	sessions.store	/sessions	POST	6	2021-06-23 11:59:55.36+00	2021-06-23 11:59:55.36+00
2669	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-23 11:59:55.588+00	2021-06-23 11:59:55.588+00
2670	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:00:06.971+00	2021-06-23 12:00:06.971+00
2671	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:00:13.689+00	2021-06-23 12:00:13.689+00
2672	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:00:17.634+00	2021-06-23 12:00:17.634+00
2673	127.0.0.1	admin.users.edit	/admin/users/32/edit	GET	6	2021-06-23 12:00:23.006+00	2021-06-23 12:00:23.006+00
2674	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:00:36.577+00	2021-06-23 12:00:36.577+00
2675	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:07:06.143+00	2021-06-23 12:07:06.143+00
2676	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-23 12:07:28.5+00	2021-06-23 12:07:28.5+00
2677	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-23 12:09:30.045+00	2021-06-23 12:09:30.045+00
2678	127.0.0.1	api.rdos.store	/api/rdos	POST	6	2021-06-23 12:14:13.554+00	2021-06-23 12:14:13.554+00
2679	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-23 12:14:19.592+00	2021-06-23 12:14:19.592+00
2680	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:14:28.855+00	2021-06-23 12:14:28.855+00
2681	127.0.0.1	admin.areas.index	/admin/areas	GET	6	2021-06-23 12:14:48.037+00	2021-06-23 12:14:48.037+00
2682	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-23 12:15:07.313+00	2021-06-23 12:15:07.313+00
2683	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:16:08.313+00	2021-06-23 12:16:08.313+00
2684	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:16:11.998+00	2021-06-23 12:16:11.998+00
2685	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-23 12:16:14.958+00	2021-06-23 12:16:14.958+00
2686	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	6	2021-06-23 12:16:18.637+00	2021-06-23 12:16:18.637+00
2687	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-23 12:16:22.539+00	2021-06-23 12:16:22.539+00
2688	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-23 12:16:24.525+00	2021-06-23 12:16:24.525+00
2689	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-23 12:16:34.495+00	2021-06-23 12:16:34.495+00
2690	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:17:00.51+00	2021-06-23 12:17:00.51+00
2691	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-23 12:17:09.348+00	2021-06-23 12:17:09.348+00
2692	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-23 12:17:20.998+00	2021-06-23 12:17:20.998+00
2693	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:19:23.302+00	2021-06-23 12:19:23.302+00
2694	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:19:28.158+00	2021-06-23 12:19:28.158+00
2695	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-23 12:19:31.657+00	2021-06-23 12:19:31.657+00
2696	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:20:38.123+00	2021-06-23 12:20:38.123+00
2697	127.0.0.1	api.rdos.store	/api/rdos	POST	6	2021-06-23 12:20:52.395+00	2021-06-23 12:20:52.395+00
2698	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:20:52.444+00	2021-06-23 12:20:52.444+00
2699	127.0.0.1	admin.rdos.show	/admin/rdos/8	GET	6	2021-06-23 12:20:55.975+00	2021-06-23 12:20:55.976+00
2700	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-23 12:21:17.671+00	2021-06-23 12:21:17.671+00
2701	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-23 12:21:20.234+00	2021-06-23 12:21:20.234+00
2702	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-23 12:21:23.957+00	2021-06-23 12:21:23.957+00
2703	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	6	2021-06-23 12:21:27.393+00	2021-06-23 12:21:27.393+00
2704	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-23 12:21:59.992+00	2021-06-23 12:21:59.992+00
2705	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:22:04.869+00	2021-06-23 12:22:04.869+00
2706	127.0.0.1	admin.rdos.destroy	/admin/rdos/7	DELETE	6	2021-06-23 12:22:09.748+00	2021-06-23 12:22:09.748+00
2707	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:22:09.997+00	2021-06-23 12:22:09.997+00
2708	127.0.0.1	admin.rdos.destroy	/admin/rdos/8	DELETE	6	2021-06-23 12:22:14.733+00	2021-06-23 12:22:14.733+00
2709	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:22:14.969+00	2021-06-23 12:22:14.969+00
2710	127.0.0.1	admin.contratos.index	/admin/contratos	GET	6	2021-06-23 12:22:18.252+00	2021-06-23 12:22:18.252+00
2711	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-23 12:43:35.254+00	2021-06-23 12:43:35.254+00
2712	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:43:36.555+00	2021-06-23 12:43:36.555+00
2713	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:43:39.193+00	2021-06-23 12:43:39.193+00
2714	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-23 12:43:44.721+00	2021-06-23 12:43:44.721+00
2715	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:43:44.913+00	2021-06-23 12:43:44.913+00
2716	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-23 12:43:47.979+00	2021-06-23 12:43:47.979+00
2717	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:43:54.383+00	2021-06-23 12:43:54.383+00
2718	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:44:17.369+00	2021-06-23 12:44:17.369+00
2719	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:44:37.36+00	2021-06-23 12:44:37.36+00
2720	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:44:40.611+00	2021-06-23 12:44:40.611+00
2721	127.0.0.1	admin.users.edit	/admin/users/64/edit	GET	6	2021-06-23 12:45:02.539+00	2021-06-23 12:45:02.539+00
2722	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:45:12.364+00	2021-06-23 12:45:12.364+00
2723	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:45:40.314+00	2021-06-23 12:45:40.314+00
2724	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 12:45:52.276+00	2021-06-23 12:45:52.276+00
2725	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-23 12:46:10.821+00	2021-06-23 12:46:10.821+00
2726	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-23 12:46:34.296+00	2021-06-23 12:46:34.296+00
2727	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:46:40.036+00	2021-06-23 12:46:40.036+00
2728	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:46:47.644+00	2021-06-23 12:46:47.644+00
2729	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	6	2021-06-23 12:46:55.362+00	2021-06-23 12:46:55.362+00
2730	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:46:59.211+00	2021-06-23 12:46:59.211+00
2731	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	6	2021-06-23 12:47:01.736+00	2021-06-23 12:47:01.736+00
2732	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:47:07.007+00	2021-06-23 12:47:07.007+00
2733	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-23 12:47:53.722+00	2021-06-23 12:47:53.722+00
2734	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:47:55.215+00	2021-06-23 12:47:55.215+00
2735	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:48:16.037+00	2021-06-23 12:48:16.037+00
2736	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:49:03.12+00	2021-06-23 12:49:03.12+00
2737	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:49:05.98+00	2021-06-23 12:49:05.98+00
2738	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:49:12.02+00	2021-06-23 12:49:12.02+00
2739	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:49:18.64+00	2021-06-23 12:49:18.64+00
2740	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-23 12:49:23.065+00	2021-06-23 12:49:23.065+00
2741	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:49:23.258+00	2021-06-23 12:49:23.258+00
2742	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:49:26.754+00	2021-06-23 12:49:26.754+00
2743	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 12:49:48.908+00	2021-06-23 12:49:48.908+00
2744	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 12:50:21.056+00	2021-06-23 12:50:21.056+00
2745	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:50:21.346+00	2021-06-23 12:50:21.346+00
2746	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:50:40.718+00	2021-06-23 12:50:40.718+00
2747	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-23 12:50:45.426+00	2021-06-23 12:50:45.426+00
2748	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:50:45.954+00	2021-06-23 12:50:45.954+00
2749	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:50:51.893+00	2021-06-23 12:50:51.893+00
2750	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:51:24.851+00	2021-06-23 12:51:24.851+00
2751	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:51:43.198+00	2021-06-23 12:51:43.198+00
2752	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:51:49.621+00	2021-06-23 12:51:49.621+00
2753	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-23 12:51:54.2+00	2021-06-23 12:51:54.2+00
2754	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 12:51:54.391+00	2021-06-23 12:51:54.391+00
2755	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:51:55.391+00	2021-06-23 12:51:55.392+00
2756	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 12:52:31.567+00	2021-06-23 12:52:31.567+00
2757	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 12:53:28.57+00	2021-06-23 12:53:28.57+00
2758	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:53:28.799+00	2021-06-23 12:53:28.799+00
2759	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 12:53:39.304+00	2021-06-23 12:53:39.304+00
2760	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 12:54:27.361+00	2021-06-23 12:54:27.361+00
2761	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:54:27.584+00	2021-06-23 12:54:27.584+00
2762	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 12:54:34.954+00	2021-06-23 12:54:34.954+00
2763	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 12:55:49.015+00	2021-06-23 12:55:49.015+00
2764	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:55:49.318+00	2021-06-23 12:55:49.318+00
2765	127.0.0.1	admin.atividades.edit	/admin/atividades/57/edit	GET	6	2021-06-23 12:55:57.031+00	2021-06-23 12:55:57.031+00
2766	127.0.0.1	admin.atividades.update	/admin/atividades/57	PUT	6	2021-06-23 12:56:17.599+00	2021-06-23 12:56:17.599+00
2767	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:56:17.83+00	2021-06-23 12:56:17.83+00
2768	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 12:56:23.723+00	2021-06-23 12:56:23.723+00
2769	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 12:56:41.83+00	2021-06-23 12:56:41.83+00
2770	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:56:42.211+00	2021-06-23 12:56:42.211+00
2771	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 12:57:05.248+00	2021-06-23 12:57:05.248+00
2772	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 12:57:35.017+00	2021-06-23 12:57:35.017+00
2773	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:57:35.281+00	2021-06-23 12:57:35.281+00
2774	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 12:59:22.328+00	2021-06-23 12:59:22.328+00
2775	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 12:59:30.053+00	2021-06-23 12:59:30.053+00
2776	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 12:59:30.262+00	2021-06-23 12:59:30.262+00
2777	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 12:59:44.275+00	2021-06-23 12:59:44.275+00
2778	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 13:00:09.821+00	2021-06-23 13:00:09.821+00
2779	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:00:10.03+00	2021-06-23 13:00:10.03+00
2780	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 13:00:26.289+00	2021-06-23 13:00:26.289+00
2781	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 13:00:59.173+00	2021-06-23 13:00:59.173+00
2782	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:00:59.648+00	2021-06-23 13:00:59.648+00
2783	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	6	2021-06-23 13:01:06.578+00	2021-06-23 13:01:06.578+00
2784	127.0.0.1	admin.atividades.store	/admin/atividades	POST	6	2021-06-23 13:01:27.23+00	2021-06-23 13:01:27.23+00
2785	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:01:27.487+00	2021-06-23 13:01:27.487+00
2786	127.0.0.1	admin.atividades.edit	/admin/atividades/61/edit	GET	6	2021-06-23 13:02:22.676+00	2021-06-23 13:02:22.676+00
2787	127.0.0.1	admin.atividades.update	/admin/atividades/61	PUT	6	2021-06-23 13:02:26.084+00	2021-06-23 13:02:26.084+00
2788	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:02:26.526+00	2021-06-23 13:02:26.526+00
2789	127.0.0.1	admin.atividades.edit	/admin/atividades/62/edit	GET	6	2021-06-23 13:02:35.682+00	2021-06-23 13:02:35.682+00
2790	127.0.0.1	admin.atividades.update	/admin/atividades/62	PUT	6	2021-06-23 13:02:39.27+00	2021-06-23 13:02:39.27+00
2791	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:02:39.474+00	2021-06-23 13:02:39.474+00
2792	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:03:32.259+00	2021-06-23 13:03:32.259+00
2793	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-23 13:03:33.276+00	2021-06-23 13:03:33.276+00
2794	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-23 13:03:35.836+00	2021-06-23 13:03:35.836+00
2795	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:03:37.082+00	2021-06-23 13:03:37.082+00
2796	127.0.0.1	admin.cargos.index	/admin/cargos	GET	6	2021-06-23 13:03:38.575+00	2021-06-23 13:03:38.575+00
2797	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	6	2021-06-23 13:03:39.268+00	2021-06-23 13:03:39.269+00
2798	127.0.0.1	admin.users.index	/admin/users	GET	6	2021-06-23 13:03:44.436+00	2021-06-23 13:03:44.436+00
2799	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:03:49.776+00	2021-06-23 13:03:49.776+00
2800	127.0.0.1	admin.atividades.index	/admin/atividades	GET	6	2021-06-23 13:05:00.771+00	2021-06-23 13:05:00.771+00
2801	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 15:07:28.055+00	2021-06-23 15:07:28.055+00
2802	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-23 15:07:28.217+00	2021-06-23 15:07:28.217+00
2803	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-23 15:07:32.012+00	2021-06-23 15:07:32.012+00
2804	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 16:12:34.789+00	2021-06-23 16:12:34.789+00
2805	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 17:34:57.324+00	2021-06-23 17:34:57.324+00
2806	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 18:26:15.649+00	2021-06-23 18:26:15.649+00
2807	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 18:26:16.138+00	2021-06-23 18:26:16.138+00
2808	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 19:36:12.272+00	2021-06-23 19:36:12.272+00
2809	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 20:37:45.651+00	2021-06-23 20:37:45.651+00
2810	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 20:44:48.689+00	2021-06-23 20:44:48.689+00
2811	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 22:05:09.546+00	2021-06-23 22:05:09.546+00
2812	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-23 22:22:27.93+00	2021-06-23 22:22:27.93+00
2813	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 03:23:40.586+00	2021-06-24 03:23:40.586+00
2814	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 09:22:55.356+00	2021-06-24 09:22:55.357+00
2815	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-24 12:31:14.625+00	2021-06-24 12:31:14.625+00
2816	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-24 12:31:15.805+00	2021-06-24 12:31:15.805+00
2817	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 12:40:03.8+00	2021-06-24 12:40:03.8+00
2818	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 12:40:08.81+00	2021-06-24 12:40:08.81+00
2819	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 12:40:13.719+00	2021-06-24 12:40:13.719+00
2820	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 13:16:06.112+00	2021-06-24 13:16:06.112+00
2821	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 13:16:17.832+00	2021-06-24 13:16:17.832+00
2822	127.0.0.1	sessions.store	/sessions	POST	34	2021-06-24 13:16:40.201+00	2021-06-24 13:16:40.201+00
2823	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-24 13:16:40.362+00	2021-06-24 13:16:40.362+00
2824	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-24 13:16:44.259+00	2021-06-24 13:16:44.259+00
2825	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 14:47:34.517+00	2021-06-24 14:47:34.517+00
2826	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 14:47:35.828+00	2021-06-24 14:47:35.828+00
2827	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 16:33:46.275+00	2021-06-24 16:33:46.275+00
2828	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 18:28:38.979+00	2021-06-24 18:28:38.979+00
2829	127.0.0.1	sessions.store	/sessions	POST	33	2021-06-24 18:28:44.309+00	2021-06-24 18:28:44.309+00
2830	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-24 18:28:44.566+00	2021-06-24 18:28:44.566+00
2831	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-24 18:28:49.038+00	2021-06-24 18:28:49.038+00
2832	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-24 18:28:54.255+00	2021-06-24 18:28:54.255+00
2833	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:29:19.105+00	2021-06-24 18:29:19.105+00
2834	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:42:11.919+00	2021-06-24 18:42:11.919+00
2835	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:43:41.082+00	2021-06-24 18:43:41.082+00
2836	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:45:23.517+00	2021-06-24 18:45:23.517+00
2837	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:45:44.017+00	2021-06-24 18:45:44.017+00
2838	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:45:44.194+00	2021-06-24 18:45:44.194+00
2839	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:45:50.201+00	2021-06-24 18:45:50.201+00
2840	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:45:50.375+00	2021-06-24 18:45:50.375+00
2841	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:46:12.54+00	2021-06-24 18:46:12.54+00
2842	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:46:24.403+00	2021-06-24 18:46:24.403+00
2843	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:46:24.572+00	2021-06-24 18:46:24.572+00
2844	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:46:50.99+00	2021-06-24 18:46:50.99+00
2845	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:47:03.595+00	2021-06-24 18:47:03.595+00
2846	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:47:03.765+00	2021-06-24 18:47:03.765+00
2847	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:47:37.398+00	2021-06-24 18:47:37.398+00
2848	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:47:50.359+00	2021-06-24 18:47:50.359+00
2849	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:47:50.539+00	2021-06-24 18:47:50.539+00
2850	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:48:14.155+00	2021-06-24 18:48:14.155+00
2851	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:48:25.32+00	2021-06-24 18:48:25.32+00
2852	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:48:25.487+00	2021-06-24 18:48:25.488+00
2853	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:48:48.875+00	2021-06-24 18:48:48.875+00
2854	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:49:13.742+00	2021-06-24 18:49:13.742+00
2855	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:49:13.909+00	2021-06-24 18:49:13.909+00
2856	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:49:45.811+00	2021-06-24 18:49:45.811+00
2857	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:50:27.381+00	2021-06-24 18:50:27.381+00
2858	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:50:27.551+00	2021-06-24 18:50:27.551+00
2859	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:50:53.257+00	2021-06-24 18:50:53.257+00
2860	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:51:22.257+00	2021-06-24 18:51:22.257+00
2861	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:51:22.421+00	2021-06-24 18:51:22.421+00
2862	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:51:42.486+00	2021-06-24 18:51:42.486+00
2863	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:51:56.008+00	2021-06-24 18:51:56.008+00
2864	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:51:56.176+00	2021-06-24 18:51:56.176+00
2865	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:52:16.953+00	2021-06-24 18:52:16.954+00
2866	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:52:27.844+00	2021-06-24 18:52:27.844+00
2867	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:52:28.014+00	2021-06-24 18:52:28.014+00
2868	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:52:50.361+00	2021-06-24 18:52:50.361+00
2869	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:53:00.77+00	2021-06-24 18:53:00.77+00
2870	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:53:00.934+00	2021-06-24 18:53:00.934+00
2871	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:53:36.772+00	2021-06-24 18:53:36.772+00
2872	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:53:50.213+00	2021-06-24 18:53:50.214+00
2873	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:53:50.393+00	2021-06-24 18:53:50.393+00
2874	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:54:12.811+00	2021-06-24 18:54:12.811+00
2875	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:54:23.757+00	2021-06-24 18:54:23.757+00
2876	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:54:23.929+00	2021-06-24 18:54:23.929+00
2877	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:54:47.203+00	2021-06-24 18:54:47.203+00
2878	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:54:57.026+00	2021-06-24 18:54:57.026+00
2879	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:54:57.188+00	2021-06-24 18:54:57.188+00
2880	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:55:17.58+00	2021-06-24 18:55:17.58+00
2881	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:55:30.746+00	2021-06-24 18:55:30.746+00
2882	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:55:30.916+00	2021-06-24 18:55:30.916+00
2883	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:55:46.387+00	2021-06-24 18:55:46.387+00
2884	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:56:06.465+00	2021-06-24 18:56:06.465+00
2885	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:56:06.635+00	2021-06-24 18:56:06.635+00
2886	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:56:24.455+00	2021-06-24 18:56:24.455+00
2887	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:56:39.002+00	2021-06-24 18:56:39.002+00
2888	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:56:39.171+00	2021-06-24 18:56:39.171+00
2889	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:56:55.213+00	2021-06-24 18:56:55.213+00
2890	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:57:03.851+00	2021-06-24 18:57:03.851+00
2891	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:57:04.011+00	2021-06-24 18:57:04.011+00
2892	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:57:26.226+00	2021-06-24 18:57:26.226+00
2893	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:57:37.383+00	2021-06-24 18:57:37.383+00
2894	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:57:37.548+00	2021-06-24 18:57:37.548+00
2895	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:58:08.543+00	2021-06-24 18:58:08.543+00
2896	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:58:17.798+00	2021-06-24 18:58:17.798+00
2897	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:58:17.9+00	2021-06-24 18:58:17.9+00
2898	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:58:18.054+00	2021-06-24 18:58:18.054+00
2899	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:58:54.91+00	2021-06-24 18:58:54.91+00
2900	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:58:55.091+00	2021-06-24 18:58:55.091+00
2901	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:59:13.87+00	2021-06-24 18:59:13.87+00
2902	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 18:59:27.224+00	2021-06-24 18:59:27.224+00
2903	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 18:59:27.388+00	2021-06-24 18:59:27.388+00
2904	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 18:59:48.535+00	2021-06-24 18:59:48.535+00
2905	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 19:00:05.884+00	2021-06-24 19:00:05.884+00
2906	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 19:00:06.054+00	2021-06-24 19:00:06.054+00
2907	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-06-24 19:00:24.385+00	2021-06-24 19:00:24.385+00
2908	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-06-24 19:00:36.841+00	2021-06-24 19:00:36.841+00
2909	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 19:00:37.012+00	2021-06-24 19:00:37.012+00
2910	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 19:02:47.012+00	2021-06-24 19:02:47.013+00
2911	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 19:03:14.226+00	2021-06-24 19:03:14.226+00
2912	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 19:03:27.662+00	2021-06-24 19:03:27.662+00
2913	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-24 19:03:52.324+00	2021-06-24 19:03:52.324+00
2914	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-24 23:15:49.248+00	2021-06-24 23:15:49.248+00
2915	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	6	2021-06-24 23:45:33.415+00	2021-06-24 23:45:33.415+00
2916	127.0.0.1	api.sync_data.index	/api/sync-data	GET	6	2021-06-24 23:45:33.628+00	2021-06-24 23:45:33.628+00
2917	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 00:25:53.997+00	2021-06-25 00:25:53.997+00
2918	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 06:06:58.29+00	2021-06-25 06:06:58.29+00
2919	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 06:06:58.542+00	2021-06-25 06:06:58.542+00
2920	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 06:26:53.45+00	2021-06-25 06:26:53.45+00
2921	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 07:38:02.016+00	2021-06-25 07:38:02.016+00
2922	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 10:15:45.514+00	2021-06-25 10:15:45.514+00
2923	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 15:26:34.597+00	2021-06-25 15:26:34.597+00
2924	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 17:26:24.34+00	2021-06-25 17:26:24.34+00
2925	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 19:18:29.125+00	2021-06-25 19:18:29.125+00
2926	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 20:56:55.507+00	2021-06-25 20:56:55.507+00
2927	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 21:05:08.218+00	2021-06-25 21:05:08.218+00
2928	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 21:43:28.078+00	2021-06-25 21:43:28.078+00
2929	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 23:07:34.376+00	2021-06-25 23:07:34.376+00
2930	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-25 23:09:14.847+00	2021-06-25 23:09:14.847+00
2931	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 01:08:02.182+00	2021-06-26 01:08:02.182+00
2932	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 02:38:51.889+00	2021-06-26 02:38:51.889+00
2933	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 02:38:52.1+00	2021-06-26 02:38:52.1+00
2934	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 03:53:14.838+00	2021-06-26 03:53:14.838+00
2935	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 07:06:12.044+00	2021-06-26 07:06:12.044+00
2936	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 11:23:06.711+00	2021-06-26 11:23:06.711+00
2937	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 13:26:11.545+00	2021-06-26 13:26:11.545+00
2938	127.0.0.1	sessions.store	/sessions	POST	34	2021-06-26 13:26:24.618+00	2021-06-26 13:26:24.618+00
2939	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 13:26:24.8+00	2021-06-26 13:26:24.8+00
2940	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 13:26:26.294+00	2021-06-26 13:26:26.294+00
2941	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-26 13:26:28.828+00	2021-06-26 13:26:28.828+00
2942	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-26 13:26:32.79+00	2021-06-26 13:26:32.79+00
2943	127.0.0.1	admin.areas.index	/admin/areas	GET	34	2021-06-26 13:26:40.254+00	2021-06-26 13:26:40.254+00
2944	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	34	2021-06-26 13:26:42.818+00	2021-06-26 13:26:42.818+00
2945	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-26 13:26:46.012+00	2021-06-26 13:26:46.012+00
2946	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	34	2021-06-26 13:26:48.671+00	2021-06-26 13:26:48.671+00
2947	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-26 13:38:06.089+00	2021-06-26 13:38:06.089+00
2948	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 13:38:50.543+00	2021-06-26 13:38:50.543+00
2949	127.0.0.1	admin.users.destroy	/admin/users/50	DELETE	34	2021-06-26 13:38:57.886+00	2021-06-26 13:38:57.886+00
2950	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 13:38:58.076+00	2021-06-26 13:38:58.076+00
2951	127.0.0.1	api.auth.store	/api/auth	POST	34	2021-06-26 13:39:18.957+00	2021-06-26 13:39:18.957+00
2952	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-26 13:39:19.392+00	2021-06-26 13:39:19.392+00
2953	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-26 13:39:31.465+00	2021-06-26 13:39:31.465+00
2954	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-26 13:40:19.351+00	2021-06-26 13:40:19.351+00
2955	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 13:47:31.427+00	2021-06-26 13:47:31.427+00
2956	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-26 13:52:02.68+00	2021-06-26 13:52:02.68+00
2957	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-26 13:52:12.32+00	2021-06-26 13:52:12.32+00
2958	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-26 13:52:15.129+00	2021-06-26 13:52:15.129+00
2959	127.0.0.1	admin.rdos.show	/admin/rdos/9	GET	34	2021-06-26 13:52:17.871+00	2021-06-26 13:52:17.871+00
2960	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 13:53:01.681+00	2021-06-26 13:53:01.681+00
2961	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 13:53:03.891+00	2021-06-26 13:53:03.891+00
2962	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 13:53:20.219+00	2021-06-26 13:53:20.219+00
2963	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 13:53:27.343+00	2021-06-26 13:53:27.343+00
2964	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 13:53:30.551+00	2021-06-26 13:53:30.551+00
2965	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 13:53:42.108+00	2021-06-26 13:53:42.108+00
2966	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 13:54:05.909+00	2021-06-26 13:54:05.909+00
2967	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 13:54:25.598+00	2021-06-26 13:54:25.598+00
2968	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 13:54:38.068+00	2021-06-26 13:54:38.068+00
2969	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 13:57:54.611+00	2021-06-26 13:57:54.611+00
2970	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 13:57:57.005+00	2021-06-26 13:57:57.005+00
2971	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 13:58:03.283+00	2021-06-26 13:58:03.283+00
2972	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 13:58:33.701+00	2021-06-26 13:58:33.701+00
2973	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 14:01:06.728+00	2021-06-26 14:01:06.728+00
2974	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 14:01:19.962+00	2021-06-26 14:01:19.962+00
2975	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 14:01:50.022+00	2021-06-26 14:01:50.022+00
2976	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 14:02:06.107+00	2021-06-26 14:02:06.107+00
2977	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 14:02:33.6+00	2021-06-26 14:02:33.6+00
2978	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 14:02:35.53+00	2021-06-26 14:02:35.53+00
2979	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 14:02:42.171+00	2021-06-26 14:02:42.171+00
2980	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-26 14:03:04.262+00	2021-06-26 14:03:04.262+00
2981	127.0.0.1	admin.rdos.show	/admin/rdos/9	GET	34	2021-06-26 14:03:06.745+00	2021-06-26 14:03:06.745+00
2982	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 14:03:45.629+00	2021-06-26 14:03:45.629+00
2983	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 14:06:07.004+00	2021-06-26 14:06:07.004+00
2984	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-26 14:08:34.835+00	2021-06-26 14:08:34.835+00
2985	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-26 14:08:40.247+00	2021-06-26 14:08:40.247+00
2986	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-06-26 14:08:43.657+00	2021-06-26 14:08:43.657+00
2987	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-26 14:08:43.831+00	2021-06-26 14:08:43.831+00
2988	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-26 14:08:45.477+00	2021-06-26 14:08:45.477+00
2989	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 14:08:46.414+00	2021-06-26 14:08:46.414+00
2990	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 14:08:47.78+00	2021-06-26 14:08:47.78+00
2991	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 14:08:51.882+00	2021-06-26 14:08:51.882+00
2992	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 14:08:53.158+00	2021-06-26 14:08:53.158+00
2993	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 14:09:03.63+00	2021-06-26 14:09:03.63+00
2994	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 14:09:11.423+00	2021-06-26 14:09:11.423+00
2995	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 14:09:14.254+00	2021-06-26 14:09:14.254+00
2996	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-06-26 14:09:15.383+00	2021-06-26 14:09:15.383+00
2997	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 14:09:17.477+00	2021-06-26 14:09:17.477+00
2998	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-26 14:09:20.522+00	2021-06-26 14:09:20.522+00
2999	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-26 14:09:24.88+00	2021-06-26 14:09:24.88+00
3000	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-26 14:09:30.402+00	2021-06-26 14:09:30.402+00
3001	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-26 14:09:37.049+00	2021-06-26 14:09:37.049+00
3002	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-06-26 14:09:40.957+00	2021-06-26 14:09:40.957+00
3003	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-06-26 14:09:41.128+00	2021-06-26 14:09:41.128+00
3004	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 14:09:47.292+00	2021-06-26 14:09:47.292+00
3005	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 14:32:54.687+00	2021-06-26 14:32:54.687+00
3006	127.0.0.1	sessions.store	/sessions	POST	33	2021-06-26 14:32:59.168+00	2021-06-26 14:32:59.168+00
3007	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-26 14:32:59.322+00	2021-06-26 14:32:59.322+00
3008	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-26 14:33:09.259+00	2021-06-26 14:33:09.259+00
3009	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-26 14:33:18.298+00	2021-06-26 14:33:18.298+00
3010	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	33	2021-06-26 14:33:26.209+00	2021-06-26 14:33:26.209+00
3011	127.0.0.1	admin.atividades.update	/admin/atividades/5	PUT	33	2021-06-26 14:33:58.749+00	2021-06-26 14:33:58.749+00
3012	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-26 14:33:58.927+00	2021-06-26 14:33:58.927+00
3013	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 15:05:00.682+00	2021-06-26 15:05:00.682+00
3014	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 15:32:57.033+00	2021-06-26 15:32:57.033+00
3015	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 17:34:55.248+00	2021-06-26 17:34:55.248+00
3016	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 18:40:59.648+00	2021-06-26 18:40:59.648+00
3017	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 20:15:06.626+00	2021-06-26 20:15:06.626+00
3018	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 20:15:07.306+00	2021-06-26 20:15:07.306+00
3019	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 22:11:33.789+00	2021-06-26 22:11:33.789+00
3020	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:11:33.979+00	2021-06-26 22:11:33.979+00
3021	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:11:39.391+00	2021-06-26 22:11:39.391+00
3022	127.0.0.1	admin.users.destroy	/admin/users/49	DELETE	34	2021-06-26 22:11:44.621+00	2021-06-26 22:11:44.621+00
3023	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:11:45.379+00	2021-06-26 22:11:45.379+00
3024	127.0.0.1	admin.users.edit	/admin/users/33/edit	GET	34	2021-06-26 22:11:55.859+00	2021-06-26 22:11:55.859+00
3025	127.0.0.1	admin.users.edit	/admin/users/61/edit	GET	34	2021-06-26 22:12:08.951+00	2021-06-26 22:12:08.951+00
3026	127.0.0.1	admin.users.update	/admin/users/61	PUT	34	2021-06-26 22:12:14.711+00	2021-06-26 22:12:14.711+00
3027	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:12:14.892+00	2021-06-26 22:12:14.892+00
3028	127.0.0.1	admin.users.destroy	/admin/users/57	DELETE	34	2021-06-26 22:12:24.495+00	2021-06-26 22:12:24.495+00
3029	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:12:24.671+00	2021-06-26 22:12:24.671+00
3030	127.0.0.1	admin.users.destroy	/admin/users/60	DELETE	34	2021-06-26 22:12:32.546+00	2021-06-26 22:12:32.546+00
3031	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:12:32.736+00	2021-06-26 22:12:32.736+00
3032	127.0.0.1	admin.users.destroy	/admin/users/63	DELETE	34	2021-06-26 22:12:40.969+00	2021-06-26 22:12:40.969+00
3033	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:12:41.145+00	2021-06-26 22:12:41.145+00
3034	127.0.0.1	admin.users.destroy	/admin/users/54	DELETE	34	2021-06-26 22:12:52.014+00	2021-06-26 22:12:52.014+00
3035	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:12:52.204+00	2021-06-26 22:12:52.204+00
3036	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:13:08.676+00	2021-06-26 22:13:08.676+00
3037	127.0.0.1	admin.users.destroy	/admin/users/42	DELETE	34	2021-06-26 22:13:12.748+00	2021-06-26 22:13:12.748+00
3038	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:13:12.925+00	2021-06-26 22:13:12.925+00
3039	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:13:16.355+00	2021-06-26 22:13:16.355+00
3040	127.0.0.1	admin.users.destroy	/admin/users/64	DELETE	34	2021-06-26 22:13:27.171+00	2021-06-26 22:13:27.171+00
3041	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:13:27.35+00	2021-06-26 22:13:27.35+00
3042	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:13:30.408+00	2021-06-26 22:13:30.408+00
3043	127.0.0.1	admin.users.destroy	/admin/users/45	DELETE	34	2021-06-26 22:13:34.228+00	2021-06-26 22:13:34.228+00
3044	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-26 22:13:34.414+00	2021-06-26 22:13:34.414+00
3045	127.0.0.1	admin.users.edit	/admin/users/33/edit	GET	34	2021-06-26 22:14:13.646+00	2021-06-26 22:14:13.646+00
3046	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:20:33.645+00	2021-06-26 22:20:33.645+00
3047	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-26 22:20:34.459+00	2021-06-26 22:20:34.459+00
3048	127.0.0.1	admin.areas.index	/admin/areas	GET	34	2021-06-26 22:20:35.5+00	2021-06-26 22:20:35.5+00
3049	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:22:33.508+00	2021-06-26 22:22:33.508+00
3050	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 22:22:42.655+00	2021-06-26 22:22:42.655+00
3051	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 22:23:38.156+00	2021-06-26 22:23:38.156+00
3052	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 22:25:57.758+00	2021-06-26 22:25:57.758+00
3053	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 22:26:46.081+00	2021-06-26 22:26:46.081+00
3057	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:27:01.406+00	2021-06-26 22:27:01.406+00
3058	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 22:27:02.49+00	2021-06-26 22:27:02.49+00
3059	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 22:27:16.863+00	2021-06-26 22:27:16.863+00
3063	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:32:31.756+00	2021-06-26 22:32:31.756+00
3064	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 22:35:03.259+00	2021-06-26 22:35:03.259+00
3065	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 22:36:21.099+00	2021-06-26 22:36:21.099+00
3069	127.0.0.1	admin.rdos.show	/admin/rdos/9	GET	34	2021-06-26 22:38:34.323+00	2021-06-26 22:38:34.323+00
3054	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:26:51.741+00	2021-06-26 22:26:51.741+00
3055	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 22:26:52.954+00	2021-06-26 22:26:52.954+00
3056	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 22:26:58.938+00	2021-06-26 22:26:58.938+00
3060	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:29:11.203+00	2021-06-26 22:29:11.203+00
3061	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 22:29:14.208+00	2021-06-26 22:29:14.208+00
3062	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-26 22:29:23.64+00	2021-06-26 22:29:23.64+00
3066	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-26 22:37:59.422+00	2021-06-26 22:37:59.422+00
3067	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-26 22:37:59.701+00	2021-06-26 22:37:59.701+00
3068	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-26 22:38:10.29+00	2021-06-26 22:38:10.29+00
3070	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-26 22:42:57.278+00	2021-06-26 22:42:57.278+00
3071	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:43:01.839+00	2021-06-26 22:43:01.839+00
3072	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-26 22:43:04.814+00	2021-06-26 22:43:04.814+00
3073	127.0.0.1	admin.rdos.show	/admin/rdos/9	GET	34	2021-06-26 22:43:14.822+00	2021-06-26 22:43:14.822+00
3074	127.0.0.1	admin.rdos.show	/admin/rdos/10	GET	34	2021-06-26 22:43:25.792+00	2021-06-26 22:43:25.792+00
3075	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-26 22:43:41.615+00	2021-06-26 22:43:41.615+00
3076	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 22:43:43.086+00	2021-06-26 22:43:43.086+00
3077	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-26 22:43:55.022+00	2021-06-26 22:43:55.022+00
3078	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-26 23:36:57.575+00	2021-06-26 23:36:57.575+00
3079	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 00:15:50.346+00	2021-06-27 00:15:50.346+00
3080	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 01:49:58.83+00	2021-06-27 01:49:58.83+00
3081	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 02:43:24.561+00	2021-06-27 02:43:24.561+00
3082	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 10:13:47.587+00	2021-06-27 10:13:47.587+00
3083	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 11:34:49.354+00	2021-06-27 11:34:49.354+00
3084	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 11:34:49.554+00	2021-06-27 11:34:49.554+00
3085	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-27 11:37:39.204+00	2021-06-27 11:37:39.204+00
3086	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 11:43:03.318+00	2021-06-27 11:43:03.318+00
3087	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-27 11:44:28.323+00	2021-06-27 11:44:28.323+00
3088	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 11:51:29.186+00	2021-06-27 11:51:29.186+00
3089	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-27 11:51:30.671+00	2021-06-27 11:51:30.671+00
3090	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 13:37:18.735+00	2021-06-27 13:37:18.735+00
3091	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 13:37:18.804+00	2021-06-27 13:37:18.804+00
3092	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 14:32:30.12+00	2021-06-27 14:32:30.12+00
3093	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 16:13:59.688+00	2021-06-27 16:13:59.688+00
3094	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 18:00:01.801+00	2021-06-27 18:00:01.801+00
3095	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 22:03:41.217+00	2021-06-27 22:03:41.217+00
3096	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 22:03:41.399+00	2021-06-27 22:03:41.399+00
3097	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 22:03:44.825+00	2021-06-27 22:03:44.825+00
3098	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 22:03:57.02+00	2021-06-27 22:03:57.02+00
3099	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-27 22:03:59.213+00	2021-06-27 22:03:59.213+00
3100	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-27 22:04:11.336+00	2021-06-27 22:04:11.336+00
3101	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 22:04:11.51+00	2021-06-27 22:04:11.51+00
3102	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-27 22:04:16.272+00	2021-06-27 22:04:16.272+00
3103	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-27 22:06:16.214+00	2021-06-27 22:06:16.214+00
3104	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-27 22:06:23.319+00	2021-06-27 22:06:23.319+00
3105	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-27 22:07:38.86+00	2021-06-27 22:07:38.86+00
3106	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-27 22:07:43.903+00	2021-06-27 22:07:43.903+00
3107	127.0.0.1	admin.users.create	/admin/users/create	GET	34	2021-06-27 22:16:12.346+00	2021-06-27 22:16:12.346+00
3108	127.0.0.1	admin.users.store	/admin/users	POST	34	2021-06-27 22:17:19.691+00	2021-06-27 22:17:19.691+00
3109	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-27 22:17:19.92+00	2021-06-27 22:17:19.92+00
3110	127.0.0.1	admin.users.create	/admin/users/create	GET	34	2021-06-27 22:17:22.354+00	2021-06-27 22:17:22.354+00
3111	127.0.0.1	admin.users.store	/admin/users	POST	34	2021-06-27 22:18:04.882+00	2021-06-27 22:18:04.882+00
3112	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-27 22:18:05.083+00	2021-06-27 22:18:05.083+00
3113	127.0.0.1	admin.users.create	/admin/users/create	GET	34	2021-06-27 22:18:07.103+00	2021-06-27 22:18:07.103+00
3114	127.0.0.1	admin.users.edit	/admin/users/33/edit	GET	34	2021-06-27 22:18:17.97+00	2021-06-27 22:18:17.97+00
3115	127.0.0.1	admin.users.create	/admin/users/create	GET	34	2021-06-27 22:18:24.765+00	2021-06-27 22:18:24.765+00
3116	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-27 22:20:25.992+00	2021-06-27 22:20:25.992+00
3117	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-27 22:20:26.266+00	2021-06-27 22:20:26.266+00
3118	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-27 22:20:34.707+00	2021-06-27 22:20:34.707+00
3119	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:21:02.269+00	2021-06-27 22:21:02.269+00
3120	127.0.0.1	admin.equipamentos.destroy	/admin/equipamentos/2	DELETE	34	2021-06-27 22:21:28+00	2021-06-27 22:21:28+00
3121	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:21:28.183+00	2021-06-27 22:21:28.183+00
3122	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/29/edit	GET	34	2021-06-27 22:21:32.651+00	2021-06-27 22:21:32.652+00
3123	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/29	PUT	34	2021-06-27 22:21:48.443+00	2021-06-27 22:21:48.443+00
3124	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:21:48.629+00	2021-06-27 22:21:48.629+00
3125	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	34	2021-06-27 22:21:56.94+00	2021-06-27 22:21:56.94+00
3126	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	34	2021-06-27 22:22:08.899+00	2021-06-27 22:22:08.899+00
3127	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:22:09.078+00	2021-06-27 22:22:09.078+00
3128	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/30/edit	GET	34	2021-06-27 22:23:04.795+00	2021-06-27 22:23:04.796+00
3129	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/30	PUT	34	2021-06-27 22:23:08.887+00	2021-06-27 22:23:08.887+00
3130	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:23:09.075+00	2021-06-27 22:23:09.075+00
3131	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/31/edit	GET	34	2021-06-27 22:23:13.432+00	2021-06-27 22:23:13.432+00
3132	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/31	PUT	34	2021-06-27 22:23:23.716+00	2021-06-27 22:23:23.716+00
3133	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:23:23.898+00	2021-06-27 22:23:23.898+00
3134	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	34	2021-06-27 22:23:27.284+00	2021-06-27 22:23:27.284+00
3135	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	34	2021-06-27 22:23:43.268+00	2021-06-27 22:23:43.268+00
3136	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:23:43.447+00	2021-06-27 22:23:43.447+00
3137	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/37/edit	GET	34	2021-06-27 22:23:47.733+00	2021-06-27 22:23:47.733+00
3138	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/37	PUT	34	2021-06-27 22:23:52.267+00	2021-06-27 22:23:52.267+00
3139	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:23:52.443+00	2021-06-27 22:23:52.443+00
3140	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	34	2021-06-27 22:24:06.606+00	2021-06-27 22:24:06.606+00
3141	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	34	2021-06-27 22:24:18.124+00	2021-06-27 22:24:18.124+00
3142	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:24:18.299+00	2021-06-27 22:24:18.299+00
3143	127.0.0.1	admin.equipamentos.destroy	/admin/equipamentos/38	DELETE	34	2021-06-27 22:24:31.427+00	2021-06-27 22:24:31.427+00
3144	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:24:31.604+00	2021-06-27 22:24:31.604+00
3145	127.0.0.1	admin.equipamentos.destroy	/admin/equipamentos/37	DELETE	34	2021-06-27 22:24:36.055+00	2021-06-27 22:24:36.055+00
3146	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:24:36.242+00	2021-06-27 22:24:36.242+00
3147	127.0.0.1	admin.equipamentos.destroy	/admin/equipamentos/36	DELETE	34	2021-06-27 22:24:40.432+00	2021-06-27 22:24:40.432+00
3148	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:24:40.619+00	2021-06-27 22:24:40.619+00
3149	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/31/edit	GET	34	2021-06-27 22:24:43.95+00	2021-06-27 22:24:43.95+00
3150	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/31	PUT	34	2021-06-27 22:24:51.54+00	2021-06-27 22:24:51.54+00
3151	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:24:51.73+00	2021-06-27 22:24:51.73+00
3152	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/31/edit	GET	34	2021-06-27 22:24:59.113+00	2021-06-27 22:24:59.113+00
3153	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/31	PUT	34	2021-06-27 22:25:09.48+00	2021-06-27 22:25:09.48+00
3154	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:25:09.664+00	2021-06-27 22:25:09.664+00
3155	127.0.0.1	admin.equipamentos.destroy	/admin/equipamentos/34	DELETE	34	2021-06-27 22:25:15.772+00	2021-06-27 22:25:15.772+00
3156	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:25:15.947+00	2021-06-27 22:25:15.947+00
3157	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/29/edit	GET	34	2021-06-27 22:25:53.192+00	2021-06-27 22:25:53.192+00
3158	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/29	PUT	34	2021-06-27 22:25:57.81+00	2021-06-27 22:25:57.81+00
3159	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:25:57.99+00	2021-06-27 22:25:57.99+00
3160	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/35/edit	GET	34	2021-06-27 22:26:13.411+00	2021-06-27 22:26:13.411+00
3161	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/35	PUT	34	2021-06-27 22:26:19.121+00	2021-06-27 22:26:19.121+00
3162	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:26:19.308+00	2021-06-27 22:26:19.308+00
3163	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/28/edit	GET	34	2021-06-27 22:26:34.658+00	2021-06-27 22:26:34.658+00
3164	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/28/edit	GET	34	2021-06-27 22:26:42.178+00	2021-06-27 22:26:42.178+00
3165	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/28	PUT	34	2021-06-27 22:26:47.893+00	2021-06-27 22:26:47.893+00
3166	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/28/edit	GET	34	2021-06-27 22:26:48.096+00	2021-06-27 22:26:48.096+00
3167	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/28	PUT	34	2021-06-27 22:26:50.468+00	2021-06-27 22:26:50.468+00
3168	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:26:50.647+00	2021-06-27 22:26:50.647+00
3169	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/27/edit	GET	34	2021-06-27 22:26:56.519+00	2021-06-27 22:26:56.519+00
3170	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/27	PUT	34	2021-06-27 22:27:05.329+00	2021-06-27 22:27:05.329+00
3171	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:27:05.507+00	2021-06-27 22:27:05.507+00
3172	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/32/edit	GET	34	2021-06-27 22:27:18.094+00	2021-06-27 22:27:18.094+00
3173	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/32	PUT	34	2021-06-27 22:27:22.007+00	2021-06-27 22:27:22.007+00
3174	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:27:22.185+00	2021-06-27 22:27:22.185+00
3175	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/33/edit	GET	34	2021-06-27 22:27:25.943+00	2021-06-27 22:27:25.943+00
3176	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/33	PUT	34	2021-06-27 22:27:29.567+00	2021-06-27 22:27:29.567+00
3177	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:27:29.745+00	2021-06-27 22:27:29.745+00
3178	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/1/edit	GET	34	2021-06-27 22:27:39.135+00	2021-06-27 22:27:39.135+00
3179	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/1	PUT	34	2021-06-27 22:27:43.62+00	2021-06-27 22:27:43.62+00
3180	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:27:43.797+00	2021-06-27 22:27:43.797+00
3181	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	34	2021-06-27 22:27:50.576+00	2021-06-27 22:27:50.576+00
3182	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	34	2021-06-27 22:28:00.803+00	2021-06-27 22:28:00.803+00
3183	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:28:00.983+00	2021-06-27 22:28:00.983+00
3184	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/39/edit	GET	34	2021-06-27 22:28:05.416+00	2021-06-27 22:28:05.416+00
3185	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/39	PUT	34	2021-06-27 22:28:07.632+00	2021-06-27 22:28:07.632+00
3186	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:28:07.815+00	2021-06-27 22:28:07.815+00
3187	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	34	2021-06-27 22:28:09.493+00	2021-06-27 22:28:09.493+00
3188	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	34	2021-06-27 22:28:21.98+00	2021-06-27 22:28:21.98+00
3189	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:28:22.155+00	2021-06-27 22:28:22.155+00
3190	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/4/edit	GET	34	2021-06-27 22:28:27.91+00	2021-06-27 22:28:27.91+00
3191	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/4	PUT	34	2021-06-27 22:28:34.451+00	2021-06-27 22:28:34.452+00
3192	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:28:34.628+00	2021-06-27 22:28:34.628+00
3193	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/30/edit	GET	34	2021-06-27 22:28:52.502+00	2021-06-27 22:28:52.502+00
3194	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/30	PUT	34	2021-06-27 22:28:56.661+00	2021-06-27 22:28:56.661+00
3195	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-27 22:28:56.841+00	2021-06-27 22:28:56.841+00
3196	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-27 22:29:03.517+00	2021-06-27 22:29:03.517+00
3197	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:29:07.113+00	2021-06-27 22:29:07.113+00
3198	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:29:14.284+00	2021-06-27 22:29:14.284+00
3199	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:29:19.374+00	2021-06-27 22:29:19.374+00
3200	127.0.0.1	admin.atividades.edit	/admin/atividades/53/edit	GET	34	2021-06-27 22:29:26.553+00	2021-06-27 22:29:26.553+00
3201	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:29:30.66+00	2021-06-27 22:29:30.66+00
3202	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:29:34.696+00	2021-06-27 22:29:34.696+00
3203	127.0.0.1	admin.atividades.edit	/admin/atividades/50/edit	GET	34	2021-06-27 22:29:48.087+00	2021-06-27 22:29:48.087+00
3204	127.0.0.1	admin.atividades.update	/admin/atividades/50	PUT	34	2021-06-27 22:29:51.138+00	2021-06-27 22:29:51.138+00
3205	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:29:51.33+00	2021-06-27 22:29:51.33+00
3206	127.0.0.1	admin.atividades.edit	/admin/atividades/50/edit	GET	34	2021-06-27 22:29:57.744+00	2021-06-27 22:29:57.744+00
3207	127.0.0.1	admin.atividades.update	/admin/atividades/50	PUT	34	2021-06-27 22:30:01.16+00	2021-06-27 22:30:01.16+00
3208	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:30:01.338+00	2021-06-27 22:30:01.338+00
3209	127.0.0.1	admin.atividades.edit	/admin/atividades/44/edit	GET	34	2021-06-27 22:30:23.728+00	2021-06-27 22:30:23.728+00
3210	127.0.0.1	admin.atividades.update	/admin/atividades/44	PUT	34	2021-06-27 22:30:26.562+00	2021-06-27 22:30:26.562+00
3211	127.0.0.1	admin.atividades.edit	/admin/atividades/44/edit	GET	34	2021-06-27 22:30:26.742+00	2021-06-27 22:30:26.742+00
3212	127.0.0.1	admin.atividades.update	/admin/atividades/44	PUT	34	2021-06-27 22:30:31.202+00	2021-06-27 22:30:31.202+00
3213	127.0.0.1	admin.atividades.edit	/admin/atividades/44/edit	GET	34	2021-06-27 22:30:31.394+00	2021-06-27 22:30:31.394+00
3214	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:30:38.276+00	2021-06-27 22:30:38.276+00
3215	127.0.0.1	admin.atividades.edit	/admin/atividades/44/edit	GET	34	2021-06-27 22:30:43.179+00	2021-06-27 22:30:43.179+00
3216	127.0.0.1	admin.atividades.update	/admin/atividades/44	PUT	34	2021-06-27 22:30:45.966+00	2021-06-27 22:30:45.966+00
3217	127.0.0.1	admin.atividades.edit	/admin/atividades/44/edit	GET	34	2021-06-27 22:30:46.145+00	2021-06-27 22:30:46.145+00
3218	127.0.0.1	admin.atividades.destroy	/admin/atividades/44	DELETE	34	2021-06-27 22:30:59.278+00	2021-06-27 22:30:59.278+00
3219	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:30:59.457+00	2021-06-27 22:30:59.457+00
3220	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-27 22:31:01.159+00	2021-06-27 22:31:01.159+00
3221	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-27 22:31:06.885+00	2021-06-27 22:31:06.885+00
3222	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:31:07.071+00	2021-06-27 22:31:07.071+00
3223	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:31:18.647+00	2021-06-27 22:31:18.647+00
3224	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:31:54.146+00	2021-06-27 22:31:54.146+00
3225	127.0.0.1	admin.atividades.edit	/admin/atividades/46/edit	GET	34	2021-06-27 22:32:17.225+00	2021-06-27 22:32:17.225+00
3226	127.0.0.1	admin.atividades.update	/admin/atividades/46	PUT	34	2021-06-27 22:32:19.82+00	2021-06-27 22:32:19.82+00
3227	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:32:19.999+00	2021-06-27 22:32:19.999+00
3228	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:32:23.56+00	2021-06-27 22:32:23.56+00
3229	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:32:30.888+00	2021-06-27 22:32:30.888+00
3230	127.0.0.1	admin.atividades.edit	/admin/atividades/53/edit	GET	34	2021-06-27 22:32:42.142+00	2021-06-27 22:32:42.142+00
3231	127.0.0.1	admin.atividades.update	/admin/atividades/53	PUT	34	2021-06-27 22:32:44.595+00	2021-06-27 22:32:44.595+00
3232	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:32:44.775+00	2021-06-27 22:32:44.775+00
3233	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:32:47.013+00	2021-06-27 22:32:47.013+00
3234	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:32:49.269+00	2021-06-27 22:32:49.269+00
3235	127.0.0.1	admin.atividades.edit	/admin/atividades/45/edit	GET	34	2021-06-27 22:32:59.338+00	2021-06-27 22:32:59.338+00
3236	127.0.0.1	admin.atividades.update	/admin/atividades/45	PUT	34	2021-06-27 22:33:04.677+00	2021-06-27 22:33:04.677+00
3237	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:33:04.865+00	2021-06-27 22:33:04.865+00
3238	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:33:07.324+00	2021-06-27 22:33:07.324+00
3239	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:33:09.436+00	2021-06-27 22:33:09.436+00
3240	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:33:17.283+00	2021-06-27 22:33:17.283+00
3241	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:33:30.703+00	2021-06-27 22:33:30.703+00
3242	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-27 22:33:39.989+00	2021-06-27 22:33:39.989+00
3243	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-27 22:33:49.5+00	2021-06-27 22:33:49.5+00
3244	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:33:49.687+00	2021-06-27 22:33:49.687+00
3245	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 22:34:10.753+00	2021-06-27 22:34:10.753+00
3248	127.0.0.1	admin.rdos.destroy	/admin/rdos/9	DELETE	34	2021-06-27 22:34:17.35+00	2021-06-27 22:34:17.35+00
3249	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 22:34:17.527+00	2021-06-27 22:34:17.527+00
3250	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-27 22:35:05.376+00	2021-06-27 22:35:05.376+00
3251	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-27 22:35:05.585+00	2021-06-27 22:35:05.585+00
3252	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:57:15.599+00	2021-06-27 22:57:15.599+00
3253	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-27 22:57:17.155+00	2021-06-27 22:57:17.155+00
3254	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-27 22:57:35.292+00	2021-06-27 22:57:35.292+00
3255	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:57:35.482+00	2021-06-27 22:57:35.482+00
3256	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-27 22:57:36.791+00	2021-06-27 22:57:36.791+00
3257	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-27 22:57:51.936+00	2021-06-27 22:57:51.936+00
3258	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-27 22:57:52.142+00	2021-06-27 22:57:52.142+00
3259	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-27 22:59:09.631+00	2021-06-27 22:59:09.631+00
3260	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:59:09.81+00	2021-06-27 22:59:09.81+00
3261	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:59:13.81+00	2021-06-27 22:59:13.81+00
3262	127.0.0.1	admin.atividades.destroy	/admin/atividades/91	DELETE	34	2021-06-27 22:59:20.289+00	2021-06-27 22:59:20.289+00
3263	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 22:59:20.488+00	2021-06-27 22:59:20.488+00
3264	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-27 23:01:13.304+00	2021-06-27 23:01:13.304+00
3265	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	34	2021-06-27 23:01:16.67+00	2021-06-27 23:01:16.67+00
3266	127.0.0.1	admin.contratos.update	/admin/contratos/1	PUT	34	2021-06-27 23:01:19.067+00	2021-06-27 23:01:19.067+00
3267	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-27 23:01:19.249+00	2021-06-27 23:01:19.249+00
3268	127.0.0.1	admin.areas.index	/admin/areas	GET	34	2021-06-27 23:01:22.155+00	2021-06-27 23:01:22.155+00
3269	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	34	2021-06-27 23:01:24.012+00	2021-06-27 23:01:24.012+00
3270	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-27 23:01:27.3+00	2021-06-27 23:01:27.3+00
3271	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	34	2021-06-27 23:01:28.952+00	2021-06-27 23:01:28.952+00
3272	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-27 23:01:30.091+00	2021-06-27 23:01:30.091+00
3273	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	34	2021-06-27 23:01:31.082+00	2021-06-27 23:01:31.082+00
3274	127.0.0.1	admin.areas.estruturas.edit	/admin/areas/estruturas/36/edit	GET	34	2021-06-27 23:01:34.102+00	2021-06-27 23:01:34.102+00
3275	127.0.0.1	admin.areas.estruturas.update	/admin/areas/estruturas/36	PUT	34	2021-06-27 23:01:40.371+00	2021-06-27 23:01:40.371+00
3276	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	34	2021-06-27 23:01:40.55+00	2021-06-27 23:01:40.55+00
3246	127.0.0.1	admin.rdos.destroy	/admin/rdos/10	DELETE	34	2021-06-27 22:34:15.068+00	2021-06-27 22:34:15.068+00
3247	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 22:34:15.245+00	2021-06-27 22:34:15.245+00
3277	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-27 23:01:42.188+00	2021-06-27 23:01:42.188+00
3278	127.0.0.1	admin.areas.furos.edit	/admin/areas/furos/1/edit	GET	34	2021-06-27 23:01:44.544+00	2021-06-27 23:01:44.544+00
3279	127.0.0.1	admin.areas.furos.update	/admin/areas/furos/1	PUT	34	2021-06-27 23:01:53.726+00	2021-06-27 23:01:53.726+00
3280	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-27 23:01:53.899+00	2021-06-27 23:01:53.899+00
3281	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	34	2021-06-27 23:01:56.798+00	2021-06-27 23:01:56.798+00
3282	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	34	2021-06-27 23:02:08.017+00	2021-06-27 23:02:08.017+00
3283	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	34	2021-06-27 23:02:17.056+00	2021-06-27 23:02:17.056+00
3284	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-27 23:02:17.239+00	2021-06-27 23:02:17.239+00
3285	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-27 23:02:28.949+00	2021-06-27 23:02:28.949+00
3286	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-27 23:02:29.163+00	2021-06-27 23:02:29.163+00
3287	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-27 23:06:22.772+00	2021-06-27 23:06:22.772+00
3288	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 23:06:27.826+00	2021-06-27 23:06:27.826+00
3289	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-06-27 23:06:31.113+00	2021-06-27 23:06:31.113+00
3290	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 23:10:49.316+00	2021-06-27 23:10:49.316+00
3291	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-27 23:10:50.779+00	2021-06-27 23:10:50.779+00
3292	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-27 23:10:59.99+00	2021-06-27 23:10:59.99+00
3293	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 23:11:00.17+00	2021-06-27 23:11:00.17+00
3294	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-27 23:11:05+00	2021-06-27 23:11:05+00
3295	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-27 23:11:05.204+00	2021-06-27 23:11:05.204+00
3296	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-27 23:14:39.345+00	2021-06-27 23:14:39.345+00
3297	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-27 23:14:47.78+00	2021-06-27 23:14:47.78+00
3298	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-27 23:14:47.961+00	2021-06-27 23:14:47.961+00
3299	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-27 23:14:53.871+00	2021-06-27 23:14:53.871+00
3300	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-27 23:14:54.074+00	2021-06-27 23:14:54.074+00
3301	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-27 23:16:15.69+00	2021-06-27 23:16:15.69+00
3302	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 23:16:20.839+00	2021-06-27 23:16:20.839+00
3303	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:16:25.927+00	2021-06-27 23:16:25.927+00
3304	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 23:16:34.762+00	2021-06-27 23:16:34.762+00
3305	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-27 23:16:36.38+00	2021-06-27 23:16:36.38+00
3306	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-27 23:16:49.295+00	2021-06-27 23:16:49.295+00
3307	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 23:17:06.773+00	2021-06-27 23:17:06.773+00
3308	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-27 23:17:08.365+00	2021-06-27 23:17:08.365+00
3309	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-27 23:17:27.207+00	2021-06-27 23:17:27.207+00
3310	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 23:23:01.087+00	2021-06-27 23:23:01.087+00
3311	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:23:04.541+00	2021-06-27 23:23:04.541+00
3312	127.0.0.1	admin.rdos.edit	/admin/rdos/12/edit	GET	34	2021-06-27 23:23:25.619+00	2021-06-27 23:23:25.619+00
3313	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/12/atividades	POST	34	2021-06-27 23:24:29.101+00	2021-06-27 23:24:29.101+00
3314	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:24:29.312+00	2021-06-27 23:24:29.312+00
3315	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/12/atividades/32	DELETE	34	2021-06-27 23:24:40.675+00	2021-06-27 23:24:40.675+00
3316	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:24:40.939+00	2021-06-27 23:24:40.939+00
3317	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/12/atividades/33	DELETE	34	2021-06-27 23:24:45.211+00	2021-06-27 23:24:45.211+00
3318	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:24:45.397+00	2021-06-27 23:24:45.397+00
3319	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/12/atividades/34	DELETE	34	2021-06-27 23:24:48.604+00	2021-06-27 23:24:48.604+00
3320	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:24:48.786+00	2021-06-27 23:24:48.786+00
3321	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/12/atividades/35	DELETE	34	2021-06-27 23:24:51.85+00	2021-06-27 23:24:51.85+00
3322	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:24:52.08+00	2021-06-27 23:24:52.08+00
3323	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/12/atividades/36	DELETE	34	2021-06-27 23:24:55.27+00	2021-06-27 23:24:55.27+00
3324	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:24:55.447+00	2021-06-27 23:24:55.447+00
3325	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/12/atividades/37	DELETE	34	2021-06-27 23:25:02.24+00	2021-06-27 23:25:02.24+00
3326	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:25:02.419+00	2021-06-27 23:25:02.419+00
3327	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/12/atividades/38	DELETE	34	2021-06-27 23:25:06.019+00	2021-06-27 23:25:06.019+00
3328	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:25:06.199+00	2021-06-27 23:25:06.199+00
3329	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/12/atividades/39	DELETE	34	2021-06-27 23:25:11.442+00	2021-06-27 23:25:11.442+00
3330	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:25:11.62+00	2021-06-27 23:25:11.62+00
3331	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/12/atividades	POST	34	2021-06-27 23:25:31.456+00	2021-06-27 23:25:31.456+00
3332	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:25:31.642+00	2021-06-27 23:25:31.642+00
3333	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/12/atividades	POST	34	2021-06-27 23:25:46.99+00	2021-06-27 23:25:46.99+00
3334	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:25:47.172+00	2021-06-27 23:25:47.172+00
3335	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-27 23:25:51.557+00	2021-06-27 23:25:51.557+00
3336	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 23:25:52.974+00	2021-06-27 23:25:52.974+00
3337	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:25:56.354+00	2021-06-27 23:25:56.354+00
3338	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-27 23:56:57.041+00	2021-06-27 23:56:57.041+00
3339	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-27 23:57:16.797+00	2021-06-27 23:57:16.797+00
3340	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-27 23:57:18.643+00	2021-06-27 23:57:18.643+00
3341	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-27 23:57:20.313+00	2021-06-27 23:57:20.313+00
3342	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:57:26.903+00	2021-06-27 23:57:26.903+00
3343	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 23:57:29.02+00	2021-06-27 23:57:29.02+00
3344	127.0.0.1	admin.rdos.show	/admin/rdos/12	GET	34	2021-06-27 23:57:44.668+00	2021-06-27 23:57:44.668+00
3345	127.0.0.1	admin.rdos.destroy	/admin/rdos/12	DELETE	34	2021-06-27 23:57:56.408+00	2021-06-27 23:57:56.408+00
3346	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-27 23:57:56.592+00	2021-06-27 23:57:56.592+00
3347	127.0.0.1	admin.rdos.show	/admin/rdos/15	GET	34	2021-06-27 23:57:59.919+00	2021-06-27 23:57:59.919+00
3348	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-27 23:58:06.549+00	2021-06-27 23:58:06.549+00
3351	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 00:01:04.475+00	2021-06-28 00:01:04.475+00
3349	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-27 23:58:07.602+00	2021-06-27 23:58:07.602+00
3350	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-27 23:58:18.617+00	2021-06-27 23:58:18.617+00
3352	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 00:01:07.81+00	2021-06-28 00:01:07.81+00
3353	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 00:01:15.361+00	2021-06-28 00:01:15.361+00
3354	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 00:02:38.989+00	2021-06-28 00:02:38.989+00
3355	127.0.0.1	admin.atividades.edit	/admin/atividades/47/edit	GET	34	2021-06-28 00:02:42.558+00	2021-06-28 00:02:42.558+00
3356	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-28 00:02:47.754+00	2021-06-28 00:02:47.754+00
3357	127.0.0.1	admin.users.edit	/admin/users/66/edit	GET	34	2021-06-28 00:02:51.479+00	2021-06-28 00:02:51.479+00
3358	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-06-28 00:02:55.773+00	2021-06-28 00:02:55.773+00
3359	127.0.0.1	admin.cargos.edit	/admin/cargos/28/edit	GET	34	2021-06-28 00:02:58.502+00	2021-06-28 00:02:58.502+00
3360	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-28 00:03:06.157+00	2021-06-28 00:03:06.157+00
3361	127.0.0.1	admin.users.edit	/admin/users/66/edit	GET	34	2021-06-28 00:03:08.599+00	2021-06-28 00:03:08.599+00
3362	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-06-28 00:03:12.077+00	2021-06-28 00:03:12.077+00
3363	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-06-28 00:03:14.559+00	2021-06-28 00:03:14.559+00
3364	127.0.0.1	admin.cargos.edit	/admin/cargos/28/edit	GET	34	2021-06-28 00:03:16.826+00	2021-06-28 00:03:16.826+00
3365	127.0.0.1	admin.cargos.update	/admin/cargos/28	PUT	34	2021-06-28 00:03:34.595+00	2021-06-28 00:03:34.595+00
3366	127.0.0.1	admin.cargos.edit	/admin/cargos/28/edit	GET	34	2021-06-28 00:03:34.79+00	2021-06-28 00:03:34.79+00
3367	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 00:03:38.023+00	2021-06-28 00:03:38.023+00
3368	127.0.0.1	admin.atividades.edit	/admin/atividades/82/edit	GET	34	2021-06-28 00:03:42.919+00	2021-06-28 00:03:42.919+00
3369	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 00:03:58.117+00	2021-06-28 00:03:58.117+00
3370	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 00:04:09.384+00	2021-06-28 00:04:09.384+00
3371	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 00:04:14.613+00	2021-06-28 00:04:14.613+00
3372	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 00:04:17.222+00	2021-06-28 00:04:17.222+00
3373	127.0.0.1	admin.atividades.edit	/admin/atividades/18/edit	GET	34	2021-06-28 00:04:25.101+00	2021-06-28 00:04:25.101+00
3374	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 00:19:16.254+00	2021-06-28 00:19:16.254+00
3375	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 00:19:18.511+00	2021-06-28 00:19:18.511+00
3376	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 00:19:26.564+00	2021-06-28 00:19:26.564+00
3377	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 00:19:49.148+00	2021-06-28 00:19:49.148+00
3378	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 00:19:58.71+00	2021-06-28 00:19:58.71+00
3379	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 00:20:00.063+00	2021-06-28 00:20:00.063+00
3380	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 00:20:17.423+00	2021-06-28 00:20:17.423+00
3381	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 00:31:54.481+00	2021-06-28 00:31:54.481+00
3382	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 00:31:54.792+00	2021-06-28 00:31:54.792+00
3383	127.0.0.1	api.auth.store	/api/auth	POST	34	2021-06-28 00:49:46.963+00	2021-06-28 00:49:46.963+00
3384	127.0.0.1	api.auth.store	/api/auth	POST	34	2021-06-28 00:49:46.966+00	2021-06-28 00:49:46.966+00
3385	127.0.0.1	api.auth.store	/api/auth	POST	34	2021-06-28 00:49:46.969+00	2021-06-28 00:49:46.97+00
3386	127.0.0.1	api.auth.store	/api/auth	POST	34	2021-06-28 00:49:46.979+00	2021-06-28 00:49:46.979+00
3387	127.0.0.1	api.auth.store	/api/auth	POST	34	2021-06-28 00:49:47.203+00	2021-06-28 00:49:47.203+00
3388	127.0.0.1	api.auth.store	/api/auth	POST	34	2021-06-28 00:49:47.281+00	2021-06-28 00:49:47.281+00
3389	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 00:49:47.986+00	2021-06-28 00:49:47.986+00
3390	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 00:49:48.043+00	2021-06-28 00:49:48.043+00
3391	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 00:49:48.052+00	2021-06-28 00:49:48.052+00
3392	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 00:49:48.08+00	2021-06-28 00:49:48.08+00
3393	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 00:49:48.116+00	2021-06-28 00:49:48.116+00
3394	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 00:49:48.232+00	2021-06-28 00:49:48.232+00
3395	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 00:49:51.898+00	2021-06-28 00:49:51.898+00
3396	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:07:11.713+00	2021-06-28 01:07:11.713+00
3397	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-28 01:07:14.709+00	2021-06-28 01:07:14.709+00
3398	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-28 01:07:53.501+00	2021-06-28 01:07:53.501+00
3399	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:07:53.708+00	2021-06-28 01:07:53.708+00
3400	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-28 01:07:56.633+00	2021-06-28 01:07:56.633+00
3401	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-28 01:08:17.36+00	2021-06-28 01:08:17.36+00
3402	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:08:17.565+00	2021-06-28 01:08:17.565+00
3403	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 01:10:48.467+00	2021-06-28 01:10:48.467+00
3404	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 01:10:48.7+00	2021-06-28 01:10:48.7+00
3405	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-06-28 01:11:10.509+00	2021-06-28 01:11:10.509+00
3406	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-06-28 01:14:44.296+00	2021-06-28 01:14:44.296+00
3407	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:14:44.498+00	2021-06-28 01:14:44.498+00
3408	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 01:14:46.604+00	2021-06-28 01:14:46.604+00
3409	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 01:14:46.854+00	2021-06-28 01:14:46.854+00
3410	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:15:14.475+00	2021-06-28 01:15:14.475+00
3411	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:15:20.656+00	2021-06-28 01:15:20.656+00
3412	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 01:15:33.057+00	2021-06-28 01:15:33.057+00
3413	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 01:15:35.598+00	2021-06-28 01:15:35.598+00
3414	127.0.0.1	admin.atividades.destroy	/admin/atividades/96	DELETE	34	2021-06-28 01:15:55.236+00	2021-06-28 01:15:55.236+00
3415	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:15:55.414+00	2021-06-28 01:15:55.414+00
3416	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-28 01:15:56.79+00	2021-06-28 01:15:56.79+00
3417	127.0.0.1	admin.areas.index	/admin/areas	GET	34	2021-06-28 01:15:57.767+00	2021-06-28 01:15:57.767+00
3418	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-28 01:15:59.481+00	2021-06-28 01:15:59.481+00
3419	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	34	2021-06-28 01:16:06.987+00	2021-06-28 01:16:06.987+00
3420	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	34	2021-06-28 01:16:15.395+00	2021-06-28 01:16:15.395+00
3421	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-28 01:16:15.741+00	2021-06-28 01:16:15.741+00
3422	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	34	2021-06-28 01:16:17.414+00	2021-06-28 01:16:17.414+00
3423	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	34	2021-06-28 01:16:23.962+00	2021-06-28 01:16:23.962+00
3424	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-28 01:16:24.146+00	2021-06-28 01:16:24.146+00
3425	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 01:16:32.103+00	2021-06-28 01:16:32.103+00
3426	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 01:16:32.346+00	2021-06-28 01:16:32.346+00
3427	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-28 01:38:23.516+00	2021-06-28 01:38:23.516+00
3428	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-28 01:38:26.908+00	2021-06-28 01:38:26.908+00
3429	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-28 01:38:29.011+00	2021-06-28 01:38:29.011+00
3430	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-28 01:38:30.83+00	2021-06-28 01:38:30.83+00
3431	127.0.0.1	api.rdos.store	/api/rdos	POST	34	2021-06-28 01:38:32.451+00	2021-06-28 01:38:32.451+00
3432	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 01:38:39.049+00	2021-06-28 01:38:39.049+00
3433	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:38:40.468+00	2021-06-28 01:38:40.468+00
3434	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:38:49.962+00	2021-06-28 01:38:49.962+00
3435	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:39:10.834+00	2021-06-28 01:39:10.834+00
3436	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:39:15.952+00	2021-06-28 01:39:15.952+00
3437	127.0.0.1	admin.atividades.edit	/admin/atividades/95/edit	GET	34	2021-06-28 01:39:18.11+00	2021-06-28 01:39:18.11+00
3438	127.0.0.1	admin.atividades.update	/admin/atividades/95	PUT	34	2021-06-28 01:39:22.351+00	2021-06-28 01:39:22.351+00
3439	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:39:22.574+00	2021-06-28 01:39:22.574+00
3440	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:39:27.232+00	2021-06-28 01:39:27.232+00
3441	127.0.0.1	admin.atividades.edit	/admin/atividades/94/edit	GET	34	2021-06-28 01:39:31.088+00	2021-06-28 01:39:31.088+00
3442	127.0.0.1	admin.atividades.update	/admin/atividades/94	PUT	34	2021-06-28 01:39:35.283+00	2021-06-28 01:39:35.283+00
3443	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-06-28 01:39:35.53+00	2021-06-28 01:39:35.53+00
3444	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 01:39:40.781+00	2021-06-28 01:39:40.781+00
3445	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 01:39:44.463+00	2021-06-28 01:39:44.463+00
3446	127.0.0.1	admin.rdos.show	/admin/rdos/13	GET	34	2021-06-28 01:39:51.959+00	2021-06-28 01:39:51.959+00
3447	127.0.0.1	admin.rdos.show	/admin/rdos/18	GET	34	2021-06-28 01:40:08.032+00	2021-06-28 01:40:08.032+00
3448	127.0.0.1	admin.rdos.show	/admin/rdos/19	GET	34	2021-06-28 01:40:17.936+00	2021-06-28 01:40:17.936+00
3449	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 01:40:44.242+00	2021-06-28 01:40:44.242+00
3450	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:40:46.187+00	2021-06-28 01:40:46.187+00
3451	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:40:55.98+00	2021-06-28 01:40:55.98+00
3452	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 01:44:09.221+00	2021-06-28 01:44:09.221+00
3453	127.0.0.1	admin.rdos.show	/admin/rdos/19	GET	34	2021-06-28 01:44:13.16+00	2021-06-28 01:44:13.16+00
3454	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 01:44:29.167+00	2021-06-28 01:44:29.167+00
3455	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:44:30.265+00	2021-06-28 01:44:30.265+00
3456	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:44:40.622+00	2021-06-28 01:44:40.622+00
3457	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:45:05.516+00	2021-06-28 01:45:05.516+00
3458	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:45:10.428+00	2021-06-28 01:45:10.428+00
3459	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:45:54.35+00	2021-06-28 01:45:54.35+00
3460	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:46:06.025+00	2021-06-28 01:46:06.025+00
3461	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:46:18.338+00	2021-06-28 01:46:18.338+00
3462	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 01:46:27.546+00	2021-06-28 01:46:27.547+00
3463	127.0.0.1	admin.rdos.show	/admin/rdos/17	GET	34	2021-06-28 01:46:34.2+00	2021-06-28 01:46:34.2+00
3464	127.0.0.1	admin.rdos.edit	/admin/rdos/17/edit	GET	34	2021-06-28 01:46:38.821+00	2021-06-28 01:46:38.821+00
3465	127.0.0.1	admin.rdos.update	/admin/rdos/17	PUT	34	2021-06-28 01:46:45.801+00	2021-06-28 01:46:45.801+00
3466	127.0.0.1	admin.rdos.show	/admin/rdos/17	GET	34	2021-06-28 01:46:46.006+00	2021-06-28 01:46:46.006+00
3467	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 01:46:48.303+00	2021-06-28 01:46:48.303+00
3468	127.0.0.1	admin.rdos.show	/admin/rdos/18	GET	34	2021-06-28 01:46:53.111+00	2021-06-28 01:46:53.111+00
3469	127.0.0.1	admin.rdos.edit	/admin/rdos/18/edit	GET	34	2021-06-28 01:46:56.048+00	2021-06-28 01:46:56.048+00
3470	127.0.0.1	admin.rdos.update	/admin/rdos/18	PUT	34	2021-06-28 01:47:01.169+00	2021-06-28 01:47:01.169+00
3471	127.0.0.1	admin.rdos.show	/admin/rdos/18	GET	34	2021-06-28 01:47:01.363+00	2021-06-28 01:47:01.363+00
3472	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 01:47:03.895+00	2021-06-28 01:47:03.895+00
3473	127.0.0.1	admin.rdos.show	/admin/rdos/19	GET	34	2021-06-28 01:47:10.142+00	2021-06-28 01:47:10.142+00
3474	127.0.0.1	admin.rdos.edit	/admin/rdos/19/edit	GET	34	2021-06-28 01:47:12.66+00	2021-06-28 01:47:12.66+00
3475	127.0.0.1	admin.rdos.update	/admin/rdos/19	PUT	34	2021-06-28 01:47:16.775+00	2021-06-28 01:47:16.775+00
3476	127.0.0.1	admin.rdos.show	/admin/rdos/19	GET	34	2021-06-28 01:47:16.958+00	2021-06-28 01:47:16.958+00
3477	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 01:47:19.18+00	2021-06-28 01:47:19.18+00
3478	127.0.0.1	admin.rdos.show	/admin/rdos/20	GET	34	2021-06-28 01:47:22.347+00	2021-06-28 01:47:22.347+00
3479	127.0.0.1	admin.rdos.edit	/admin/rdos/20/edit	GET	34	2021-06-28 01:47:24.173+00	2021-06-28 01:47:24.173+00
3480	127.0.0.1	admin.rdos.update	/admin/rdos/20	PUT	34	2021-06-28 01:47:29.047+00	2021-06-28 01:47:29.047+00
3481	127.0.0.1	admin.rdos.show	/admin/rdos/20	GET	34	2021-06-28 01:47:29.226+00	2021-06-28 01:47:29.226+00
3482	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 01:47:30.5+00	2021-06-28 01:47:30.5+00
3483	127.0.0.1	admin.rdos.show	/admin/rdos/21	GET	34	2021-06-28 01:47:33.642+00	2021-06-28 01:47:33.642+00
3484	127.0.0.1	admin.rdos.edit	/admin/rdos/21/edit	GET	34	2021-06-28 01:47:35.77+00	2021-06-28 01:47:35.77+00
3485	127.0.0.1	admin.rdos.update	/admin/rdos/21	PUT	34	2021-06-28 01:47:40.937+00	2021-06-28 01:47:40.937+00
3486	127.0.0.1	admin.rdos.show	/admin/rdos/21	GET	34	2021-06-28 01:47:41.15+00	2021-06-28 01:47:41.15+00
3487	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 01:47:42.432+00	2021-06-28 01:47:42.432+00
3488	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-06-28 01:47:46.456+00	2021-06-28 01:47:46.456+00
3489	127.0.0.1	admin.rdos.show	/admin/rdos/13	GET	34	2021-06-28 01:47:50.851+00	2021-06-28 01:47:50.851+00
3490	127.0.0.1	admin.rdos.show	/admin/rdos/14	GET	34	2021-06-28 01:47:55.58+00	2021-06-28 01:47:55.58+00
3491	127.0.0.1	admin.rdos.show	/admin/rdos/15	GET	34	2021-06-28 01:47:59.675+00	2021-06-28 01:47:59.675+00
3492	127.0.0.1	admin.rdos.show	/admin/rdos/16	GET	34	2021-06-28 01:48:03.963+00	2021-06-28 01:48:03.963+00
3493	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 01:48:08.618+00	2021-06-28 01:48:08.618+00
3494	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:48:09.318+00	2021-06-28 01:48:09.318+00
3495	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:48:20.477+00	2021-06-28 01:48:20.477+00
3565	127.0.0.1	admin.rdos.show	/admin/rdos/22	GET	33	2021-06-28 17:03:20.815+00	2021-06-28 17:03:20.815+00
3496	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:49:10.32+00	2021-06-28 01:49:10.32+00
3497	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:49:16.184+00	2021-06-28 01:49:16.184+00
3498	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 01:50:38.16+00	2021-06-28 01:50:38.16+00
3499	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 01:57:21.127+00	2021-06-28 01:57:21.127+00
3500	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 01:57:21.39+00	2021-06-28 01:57:21.39+00
3501	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 02:17:46.74+00	2021-06-28 02:17:46.74+00
3502	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 05:03:34.179+00	2021-06-28 05:03:34.179+00
3503	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 06:25:17.315+00	2021-06-28 06:25:17.315+00
3504	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 06:25:18.5+00	2021-06-28 06:25:18.5+00
3505	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 10:22:22.587+00	2021-06-28 10:22:22.587+00
3506	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 10:22:24.036+00	2021-06-28 10:22:24.036+00
3507	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 10:22:34.204+00	2021-06-28 10:22:34.204+00
3508	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 10:22:49.248+00	2021-06-28 10:22:49.248+00
3509	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 11:30:23.62+00	2021-06-28 11:30:23.62+00
3510	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:30:24.223+00	2021-06-28 11:30:24.223+00
3511	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:30:45.7+00	2021-06-28 11:30:45.7+00
3512	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:30:53.391+00	2021-06-28 11:30:53.391+00
3513	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 11:30:55.123+00	2021-06-28 11:30:55.123+00
3514	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 11:31:01.719+00	2021-06-28 11:31:01.719+00
3515	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 11:31:16.669+00	2021-06-28 11:31:16.669+00
3516	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 11:31:24.972+00	2021-06-28 11:31:24.972+00
3517	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 11:31:50.123+00	2021-06-28 11:31:50.123+00
3518	127.0.0.1	admin.rdos.show	/admin/rdos/17	GET	34	2021-06-28 11:31:56.862+00	2021-06-28 11:31:56.862+00
3519	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-28 11:32:11.092+00	2021-06-28 11:32:11.092+00
3520	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	34	2021-06-28 11:32:54.064+00	2021-06-28 11:32:54.064+00
3521	127.0.0.1	api.sync_data.index	/api/sync-data	GET	34	2021-06-28 11:32:54.351+00	2021-06-28 11:32:54.351+00
3522	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:33:12.865+00	2021-06-28 11:33:12.865+00
3523	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:33:14.608+00	2021-06-28 11:33:14.608+00
3524	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:33:46.497+00	2021-06-28 11:33:46.497+00
3525	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:33:53.662+00	2021-06-28 11:33:53.662+00
3526	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-06-28 11:33:58.052+00	2021-06-28 11:33:58.052+00
3527	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:33:58.789+00	2021-06-28 11:33:58.789+00
3528	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 11:34:00.568+00	2021-06-28 11:34:00.568+00
3529	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:34:36.831+00	2021-06-28 11:34:36.831+00
3530	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 11:34:49.933+00	2021-06-28 11:34:49.933+00
3531	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 11:34:58.186+00	2021-06-28 11:34:58.186+00
3532	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:35:17.337+00	2021-06-28 11:35:17.337+00
3533	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:35:18.965+00	2021-06-28 11:35:18.965+00
3534	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:35:31.451+00	2021-06-28 11:35:31.451+00
3535	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:35:40.444+00	2021-06-28 11:35:40.444+00
3536	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 11:35:41.617+00	2021-06-28 11:35:41.617+00
3537	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:35:49.392+00	2021-06-28 11:35:49.392+00
3538	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:35:53.27+00	2021-06-28 11:35:53.27+00
3539	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:36:05.254+00	2021-06-28 11:36:05.254+00
3540	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:37:09.206+00	2021-06-28 11:37:09.206+00
3541	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 11:40:00.951+00	2021-06-28 11:40:00.951+00
3542	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 11:48:44.504+00	2021-06-28 11:48:44.504+00
3543	127.0.0.1	api.auth.store	/api/auth	POST	33	2021-06-28 15:22:22.3+00	2021-06-28 15:22:22.3+00
3544	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-06-28 15:22:22.871+00	2021-06-28 15:22:22.871+00
3545	127.0.0.1	api.auth.store	/api/auth	POST	33	2021-06-28 15:25:18.417+00	2021-06-28 15:25:18.417+00
3546	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-06-28 15:25:18.936+00	2021-06-28 15:25:18.936+00
3547	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-06-28 15:25:28.833+00	2021-06-28 15:25:28.833+00
3548	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 15:28:00.174+00	2021-06-28 15:28:00.174+00
3549	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 15:28:39.413+00	2021-06-28 15:28:39.413+00
3550	127.0.0.1	sessions.store	/sessions	POST	33	2021-06-28 15:28:46.806+00	2021-06-28 15:28:46.806+00
3551	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-28 15:28:46.966+00	2021-06-28 15:28:46.966+00
3552	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-28 15:28:56.322+00	2021-06-28 15:28:56.322+00
3553	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-28 15:28:58.469+00	2021-06-28 15:28:58.469+00
3554	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	33	2021-06-28 15:29:22.938+00	2021-06-28 15:29:22.938+00
3555	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-28 15:32:30.251+00	2021-06-28 15:32:30.251+00
3556	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-06-28 15:53:28.246+00	2021-06-28 15:53:28.246+00
3557	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-28 15:53:31.241+00	2021-06-28 15:53:31.241+00
3558	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-28 15:56:00.891+00	2021-06-28 15:56:00.891+00
3559	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-28 15:57:10+00	2021-06-28 15:57:10+00
3560	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-28 15:57:10.174+00	2021-06-28 15:57:10.174+00
3561	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-06-28 16:00:06.225+00	2021-06-28 16:00:06.225+00
3562	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-28 16:06:07.198+00	2021-06-28 16:06:07.198+00
3563	127.0.0.1	admin.rdos.show	/admin/rdos/22	GET	33	2021-06-28 16:06:16.336+00	2021-06-28 16:06:16.336+00
3564	127.0.0.1	admin.rdos.show	/admin/rdos/22	GET	33	2021-06-28 17:03:02.786+00	2021-06-28 17:03:02.786+00
3566	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-28 17:03:28.026+00	2021-06-28 17:03:28.026+00
3567	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-06-28 17:03:30.864+00	2021-06-28 17:03:30.864+00
3568	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-28 17:03:37.471+00	2021-06-28 17:03:37.471+00
3569	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-28 17:03:43.849+00	2021-06-28 17:03:43.849+00
3570	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-28 17:05:28.656+00	2021-06-28 17:05:28.656+00
3571	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-28 17:05:28.826+00	2021-06-28 17:05:28.826+00
3572	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-28 17:05:42.254+00	2021-06-28 17:05:42.254+00
3573	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-28 17:08:07.59+00	2021-06-28 17:08:07.59+00
3574	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-28 17:08:07.758+00	2021-06-28 17:08:07.758+00
3575	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-06-28 17:08:13.724+00	2021-06-28 17:08:13.724+00
3576	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-06-28 17:11:49.061+00	2021-06-28 17:11:49.061+00
3577	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-28 17:11:49.293+00	2021-06-28 17:11:49.293+00
3578	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-28 17:12:06.575+00	2021-06-28 17:12:06.575+00
3579	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-06-28 17:12:43.128+00	2021-06-28 17:12:43.128+00
3580	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-06-28 17:12:43.356+00	2021-06-28 17:12:43.357+00
3581	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 17:22:13.166+00	2021-06-28 17:22:13.166+00
3582	127.0.0.1	sessions.store	/sessions	POST	6	2021-06-28 17:22:16.769+00	2021-06-28 17:22:16.769+00
3583	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	6	2021-06-28 17:22:16.953+00	2021-06-28 17:22:16.953+00
3584	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-28 17:22:19.655+00	2021-06-28 17:22:19.655+00
3585	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-28 17:22:24.041+00	2021-06-28 17:22:24.041+00
3586	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-28 17:22:24.225+00	2021-06-28 17:22:24.225+00
3587	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-28 17:22:26.388+00	2021-06-28 17:22:26.388+00
3588	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	6	2021-06-28 17:22:38.789+00	2021-06-28 17:22:38.789+00
3589	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-28 17:23:14.143+00	2021-06-28 17:23:14.143+00
3590	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-28 17:23:14.332+00	2021-06-28 17:23:14.332+00
3591	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-28 17:23:16.348+00	2021-06-28 17:23:16.348+00
3592	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-28 17:23:18.718+00	2021-06-28 17:23:18.718+00
3593	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	6	2021-06-28 17:23:22.612+00	2021-06-28 17:23:22.612+00
3594	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	6	2021-06-28 17:23:22.805+00	2021-06-28 17:23:22.805+00
3595	127.0.0.1	admin.rdos.index	/admin/rdos	GET	6	2021-06-28 17:23:24.862+00	2021-06-28 17:23:24.862+00
3596	177.130.48.103	sessions.index	/sessions	GET	\N	2021-06-28 17:35:20.789+00	2021-06-28 17:35:20.789+00
3597	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 18:26:04.285+00	2021-06-28 18:26:04.285+00
3598	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 18:26:04.449+00	2021-06-28 18:26:04.449+00
3599	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 18:26:07.138+00	2021-06-28 18:26:07.138+00
3600	127.0.0.1	admin.rdos.show	/admin/rdos/22	GET	34	2021-06-28 18:26:15.052+00	2021-06-28 18:26:15.052+00
3601	127.0.0.1	admin.rdo_users.destroy	/admin/rdos/22/users/95	DELETE	34	2021-06-28 18:26:49.16+00	2021-06-28 18:26:49.16+00
3602	127.0.0.1	admin.rdos.show	/admin/rdos/22	GET	34	2021-06-28 18:26:49.329+00	2021-06-28 18:26:49.329+00
3603	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 18:28:49.787+00	2021-06-28 18:28:49.787+00
3604	127.0.0.1	admin.rdos.show	/admin/rdos/21	GET	34	2021-06-28 18:28:52.724+00	2021-06-28 18:28:52.724+00
3605	127.0.0.1	admin.rdo_users.store	/admin/rdos/21/users	POST	34	2021-06-28 18:29:05.713+00	2021-06-28 18:29:05.713+00
3606	127.0.0.1	admin.rdos.show	/admin/rdos/21	GET	34	2021-06-28 18:29:05.876+00	2021-06-28 18:29:05.876+00
3607	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 18:29:15.374+00	2021-06-28 18:29:15.374+00
3608	127.0.0.1	admin.rdos.show	/admin/rdos/21	GET	34	2021-06-28 18:29:17.462+00	2021-06-28 18:29:17.462+00
3609	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 18:29:36.961+00	2021-06-28 18:29:36.961+00
3610	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 18:29:40.538+00	2021-06-28 18:29:40.538+00
3611	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 18:29:42.311+00	2021-06-28 18:29:42.311+00
3612	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 18:29:47.865+00	2021-06-28 18:29:47.865+00
3613	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 18:30:43.612+00	2021-06-28 18:30:43.612+00
3614	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-06-28 18:30:46.252+00	2021-06-28 18:30:46.252+00
3615	127.0.0.1	admin.rdo_users.store	/admin/rdos/11/users	POST	34	2021-06-28 18:30:52.842+00	2021-06-28 18:30:52.842+00
3616	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-06-28 18:30:53.007+00	2021-06-28 18:30:53.007+00
3617	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 18:31:44.461+00	2021-06-28 18:31:44.462+00
3618	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-06-28 18:31:46.576+00	2021-06-28 18:31:46.576+00
3619	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 18:31:54.505+00	2021-06-28 18:31:54.505+00
3620	127.0.0.1	admin.rdos.show	/admin/rdos/13	GET	34	2021-06-28 18:31:56.168+00	2021-06-28 18:31:56.168+00
3621	127.0.0.1	admin.rdo_users.store	/admin/rdos/13/users	POST	34	2021-06-28 18:32:02.147+00	2021-06-28 18:32:02.147+00
3622	127.0.0.1	admin.rdos.show	/admin/rdos/13	GET	34	2021-06-28 18:32:02.313+00	2021-06-28 18:32:02.313+00
3623	127.0.0.1	admin.rdo_users.store	/admin/rdos/13/users	POST	34	2021-06-28 18:32:41.218+00	2021-06-28 18:32:41.218+00
3624	127.0.0.1	admin.rdos.show	/admin/rdos/13	GET	34	2021-06-28 18:32:41.39+00	2021-06-28 18:32:41.39+00
3625	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 18:33:28.309+00	2021-06-28 18:33:28.309+00
3626	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-06-28 18:33:30.329+00	2021-06-28 18:33:30.329+00
3627	127.0.0.1	admin.rdo_users.store	/admin/rdos/11/users	POST	34	2021-06-28 18:33:39.483+00	2021-06-28 18:33:39.483+00
3628	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-06-28 18:33:39.741+00	2021-06-28 18:33:39.741+00
3629	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 18:33:48.595+00	2021-06-28 18:33:48.595+00
3630	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 18:33:49.973+00	2021-06-28 18:33:49.973+00
3631	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 18:34:01.566+00	2021-06-28 18:34:01.566+00
3632	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 18:34:11.931+00	2021-06-28 18:34:11.931+00
3633	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-06-28 18:34:13.072+00	2021-06-28 18:34:13.072+00
3634	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 18:34:24.208+00	2021-06-28 18:34:24.208+00
3635	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 18:34:26.865+00	2021-06-28 18:34:26.865+00
3636	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-06-28 18:34:32.486+00	2021-06-28 18:34:32.486+00
3637	127.0.0.1	admin.areas.index	/admin/areas	GET	34	2021-06-28 18:36:18.089+00	2021-06-28 18:36:18.089+00
3638	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-28 18:36:19.587+00	2021-06-28 18:36:19.587+00
3639	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	34	2021-06-28 18:36:25.543+00	2021-06-28 18:36:25.543+00
3640	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	34	2021-06-28 18:36:36.631+00	2021-06-28 18:36:36.631+00
3641	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-28 18:36:36.794+00	2021-06-28 18:36:36.794+00
3642	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	34	2021-06-28 18:36:38.153+00	2021-06-28 18:36:38.153+00
3643	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	34	2021-06-28 18:36:47.584+00	2021-06-28 18:36:47.584+00
3644	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	34	2021-06-28 18:36:47.753+00	2021-06-28 18:36:47.753+00
3645	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 19:29:25.167+00	2021-06-28 19:29:25.168+00
3646	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-06-28 19:29:25.309+00	2021-06-28 19:29:25.309+00
3647	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-06-28 19:29:37.756+00	2021-06-28 19:29:37.756+00
3648	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-06-28 19:29:39.261+00	2021-06-28 19:29:39.261+00
3649	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 19:34:42.53+00	2021-06-28 19:34:42.53+00
3650	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-06-28 20:16:56.218+00	2021-06-28 20:16:56.218+00
3651	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-06-28 20:17:29.625+00	2021-06-28 20:17:29.625+00
3652	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-06-28 20:17:29.909+00	2021-06-28 20:17:29.909+00
3653	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-28 20:23:38.756+00	2021-06-28 20:23:38.756+00
3654	127.0.0.1	admin.contratos.index	/admin/contratos	GET	33	2021-06-28 20:23:40.768+00	2021-06-28 20:23:40.768+00
3655	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-28 20:23:42.6+00	2021-06-28 20:23:42.6+00
3656	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-06-28 20:23:45.608+00	2021-06-28 20:23:45.608+00
3657	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	33	2021-06-28 20:23:49.573+00	2021-06-28 20:23:49.573+00
3658	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	33	2021-06-28 20:24:08.782+00	2021-06-28 20:24:08.782+00
3659	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-06-28 20:24:08.939+00	2021-06-28 20:24:08.939+00
3660	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-06-28 20:24:23.028+00	2021-06-28 20:24:23.028+00
3661	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-06-28 20:24:23.245+00	2021-06-28 20:24:23.245+00
3662	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	33	2021-06-28 20:31:00.722+00	2021-06-28 20:31:00.722+00
3663	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	33	2021-06-28 20:31:14.711+00	2021-06-28 20:31:14.711+00
3664	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-06-28 20:31:14.868+00	2021-06-28 20:31:14.868+00
3665	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-06-28 20:31:27.658+00	2021-06-28 20:31:27.658+00
3666	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-06-28 20:31:27.906+00	2021-06-28 20:31:27.906+00
3667	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 20:58:47.8+00	2021-06-28 20:58:47.8+00
3668	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 21:07:02.839+00	2021-06-28 21:07:02.839+00
3669	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-28 23:36:18.951+00	2021-06-28 23:36:18.951+00
3670	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 01:33:55.332+00	2021-06-29 01:33:55.332+00
3671	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 01:33:55.396+00	2021-06-29 01:33:55.396+00
3672	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 04:45:47.289+00	2021-06-29 04:45:47.289+00
3673	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 05:39:57.659+00	2021-06-29 05:39:57.659+00
3674	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 05:43:53.412+00	2021-06-29 05:43:53.412+00
3675	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 05:45:47.068+00	2021-06-29 05:45:47.068+00
3676	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 08:23:27.453+00	2021-06-29 08:23:27.453+00
3677	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-29 10:05:36.587+00	2021-06-29 10:05:36.587+00
3678	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-06-29 10:09:18.903+00	2021-06-29 10:09:18.903+00
3679	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-06-29 10:10:15.754+00	2021-06-29 10:10:15.754+00
3680	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 16:36:09.972+00	2021-06-29 16:36:09.972+00
3681	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 16:36:10.186+00	2021-06-29 16:36:10.186+00
3682	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 19:25:27.032+00	2021-06-29 19:25:27.032+00
3683	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-29 20:33:33.608+00	2021-06-29 20:33:33.608+00
3684	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-06-30 00:12:02.551+00	2021-06-30 00:12:02.551+00
3685	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-30 00:12:10.726+00	2021-06-30 00:12:10.726+00
3686	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-30 05:06:39.912+00	2021-06-30 05:06:39.912+00
3687	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-30 11:17:10.302+00	2021-06-30 11:17:10.302+00
3688	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-30 11:17:10.351+00	2021-06-30 11:17:10.351+00
3689	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-30 16:54:26.738+00	2021-06-30 16:54:26.738+00
3690	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-30 18:48:09.509+00	2021-06-30 18:48:09.509+00
3691	127.0.0.1	sessions.store	/sessions	POST	33	2021-06-30 18:48:14.738+00	2021-06-30 18:48:14.738+00
3692	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-06-30 18:48:14.905+00	2021-06-30 18:48:14.905+00
3693	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-30 18:48:23.026+00	2021-06-30 18:48:23.026+00
3694	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	33	2021-06-30 18:48:39.351+00	2021-06-30 18:48:39.351+00
3695	127.0.0.1	admin.rdos.edit	/admin/rdos/23/edit	GET	33	2021-06-30 18:48:45.376+00	2021-06-30 18:48:45.376+00
3696	127.0.0.1	admin.rdos.update	/admin/rdos/23	PUT	33	2021-06-30 18:49:00.997+00	2021-06-30 18:49:00.997+00
3697	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	33	2021-06-30 18:49:01.157+00	2021-06-30 18:49:01.157+00
3698	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-30 18:49:09.84+00	2021-06-30 18:49:09.84+00
3699	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	33	2021-06-30 18:49:23.574+00	2021-06-30 18:49:23.574+00
3700	127.0.0.1	admin.rdos.edit	/admin/rdos/23/edit	GET	33	2021-06-30 18:49:25.512+00	2021-06-30 18:49:25.512+00
3701	127.0.0.1	admin.rdos.update	/admin/rdos/23	PUT	33	2021-06-30 18:49:47.687+00	2021-06-30 18:49:47.687+00
3702	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	33	2021-06-30 18:49:47.849+00	2021-06-30 18:49:47.849+00
3703	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-30 18:50:57.77+00	2021-06-30 18:50:57.77+00
3704	127.0.0.1	admin.rdos.show	/admin/rdos/22	GET	33	2021-06-30 18:51:02.234+00	2021-06-30 18:51:02.234+00
3705	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-30 18:51:13.98+00	2021-06-30 18:51:13.98+00
3706	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-30 18:51:24.54+00	2021-06-30 18:51:24.54+00
3707	127.0.0.1	admin.rdos.show	/admin/rdos/18	GET	33	2021-06-30 18:51:28.666+00	2021-06-30 18:51:28.666+00
3708	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-30 18:51:40.572+00	2021-06-30 18:51:40.572+00
3709	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	33	2021-06-30 18:51:48.408+00	2021-06-30 18:51:48.408+00
3710	127.0.0.1	admin.rdos.edit	/admin/rdos/23/edit	GET	33	2021-06-30 18:51:51.047+00	2021-06-30 18:51:51.047+00
3711	127.0.0.1	admin.rdos.update	/admin/rdos/23	PUT	33	2021-06-30 18:51:58.135+00	2021-06-30 18:51:58.135+00
3712	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	33	2021-06-30 18:51:58.294+00	2021-06-30 18:51:58.294+00
3713	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-06-30 18:52:02.625+00	2021-06-30 18:52:02.625+00
3714	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-06-30 18:52:25.061+00	2021-06-30 18:52:25.061+00
3715	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-06-30 18:52:25.334+00	2021-06-30 18:52:25.334+00
3716	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-06-30 19:02:29.321+00	2021-06-30 19:02:29.321+00
3717	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-06-30 19:17:44.469+00	2021-06-30 19:17:44.469+00
3718	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-06-30 19:25:47.691+00	2021-06-30 19:25:47.691+00
3719	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-06-30 19:31:41.268+00	2021-06-30 19:31:41.268+00
3720	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-06-30 19:42:26.853+00	2021-06-30 19:42:26.853+00
3721	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-06-30 19:42:29.376+00	2021-06-30 19:42:29.376+00
3722	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	33	2021-06-30 19:42:33.673+00	2021-06-30 19:42:33.673+00
3723	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	33	2021-06-30 19:42:54.809+00	2021-06-30 19:42:54.809+00
3724	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-06-30 19:42:55.004+00	2021-06-30 19:42:55.004+00
3725	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-06-30 19:43:11.902+00	2021-06-30 19:43:11.902+00
3726	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-06-30 19:43:12.396+00	2021-06-30 19:43:12.396+00
3727	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-06-30 19:49:39.531+00	2021-06-30 19:49:39.531+00
3728	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-06-30 19:58:11.229+00	2021-06-30 19:58:11.229+00
3729	127.0.0.1	sessions.index	/sessions	GET	\N	2021-06-30 21:33:18.219+00	2021-06-30 21:33:18.219+00
3730	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 02:12:28.119+00	2021-07-01 02:12:28.119+00
3731	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 06:44:44.548+00	2021-07-01 06:44:44.548+00
3732	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 07:39:58.464+00	2021-07-01 07:39:58.465+00
3733	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 11:19:53.872+00	2021-07-01 11:19:53.872+00
3734	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 11:56:58.596+00	2021-07-01 11:56:58.596+00
3735	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-07-01 12:49:02.005+00	2021-07-01 12:49:02.005+00
3736	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-07-01 12:49:02.289+00	2021-07-01 12:49:02.289+00
3737	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 12:49:16.368+00	2021-07-01 12:49:16.368+00
3738	127.0.0.1	sessions.store	/sessions	POST	1	2021-07-01 12:49:49.018+00	2021-07-01 12:49:49.018+00
3739	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 12:49:49.413+00	2021-07-01 12:49:49.413+00
3740	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 12:50:00.004+00	2021-07-01 12:50:00.004+00
3741	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-01 12:50:06.5+00	2021-07-01 12:50:06.5+00
3742	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 12:50:06.723+00	2021-07-01 12:50:06.723+00
3743	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 12:50:14.091+00	2021-07-01 12:50:14.091+00
3748	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 12:51:45.995+00	2021-07-01 12:51:45.995+00
3744	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 12:50:58.216+00	2021-07-01 12:50:58.216+00
3745	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 12:51:00.892+00	2021-07-01 12:51:00.892+00
3746	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 12:51:03.506+00	2021-07-01 12:51:03.506+00
3747	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 12:51:23.753+00	2021-07-01 12:51:23.753+00
3749	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	1	2021-07-01 12:51:50.54+00	2021-07-01 12:51:50.54+00
3750	127.0.0.1	admin.rdos.show	/admin/rdos/13	GET	1	2021-07-01 12:53:06.587+00	2021-07-01 12:53:06.587+00
3751	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 12:53:22.6+00	2021-07-01 12:53:22.6+00
3752	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	1	2021-07-01 12:53:25.93+00	2021-07-01 12:53:25.93+00
3753	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	1	2021-07-01 12:53:37.222+00	2021-07-01 12:53:37.222+00
3754	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 13:00:04.536+00	2021-07-01 13:00:04.536+00
3755	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 13:00:07.956+00	2021-07-01 13:00:07.956+00
3756	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	1	2021-07-01 13:00:23.825+00	2021-07-01 13:00:23.825+00
3757	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 13:00:35.746+00	2021-07-01 13:00:35.746+00
3758	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 13:00:50.339+00	2021-07-01 13:00:50.339+00
3759	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-01 13:00:54.766+00	2021-07-01 13:00:54.766+00
3760	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 13:00:55.603+00	2021-07-01 13:00:55.603+00
3761	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 13:00:59.455+00	2021-07-01 13:00:59.455+00
3762	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	1	2021-07-01 13:01:07.449+00	2021-07-01 13:01:07.449+00
3763	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 13:01:19.832+00	2021-07-01 13:01:19.832+00
3764	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 13:01:25.273+00	2021-07-01 13:01:25.273+00
3765	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 13:01:33.556+00	2021-07-01 13:01:33.556+00
3766	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 13:02:17.796+00	2021-07-01 13:02:17.796+00
3767	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 13:02:28.706+00	2021-07-01 13:02:28.706+00
3768	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 13:03:26.015+00	2021-07-01 13:03:26.015+00
3769	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 13:03:32.08+00	2021-07-01 13:03:32.08+00
3770	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 13:03:46.787+00	2021-07-01 13:03:46.787+00
3771	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 13:09:01.461+00	2021-07-01 13:09:01.461+00
3772	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 13:09:22.507+00	2021-07-01 13:09:22.507+00
3773	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 13:09:35.473+00	2021-07-01 13:09:35.473+00
3774	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-01 13:09:38.692+00	2021-07-01 13:09:38.692+00
3775	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 13:09:38.9+00	2021-07-01 13:09:38.9+00
3776	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 13:09:42.464+00	2021-07-01 13:09:42.464+00
3777	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 13:09:44.783+00	2021-07-01 13:09:44.783+00
3778	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 14:02:17.322+00	2021-07-01 14:02:17.322+00
3779	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 17:37:35.161+00	2021-07-01 17:37:35.161+00
3780	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 17:45:39.729+00	2021-07-01 17:45:39.729+00
3781	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 18:52:42.1+00	2021-07-01 18:52:42.1+00
3782	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 19:19:55.049+00	2021-07-01 19:19:55.049+00
3783	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 19:19:55.309+00	2021-07-01 19:19:55.309+00
3784	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 19:49:35.431+00	2021-07-01 19:49:35.431+00
3785	127.0.0.1	sessions.store	/sessions	POST	33	2021-07-01 19:49:44.471+00	2021-07-01 19:49:44.471+00
3786	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-01 19:49:44.626+00	2021-07-01 19:49:44.626+00
3787	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 19:49:49.079+00	2021-07-01 19:49:49.079+00
3788	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 19:50:10.706+00	2021-07-01 19:50:10.706+00
3789	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 19:50:13.174+00	2021-07-01 19:50:13.174+00
3790	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-07-01 19:50:40.045+00	2021-07-01 19:50:40.045+00
3791	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 19:51:52.331+00	2021-07-01 19:51:52.331+00
3792	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-07-01 19:52:24.022+00	2021-07-01 19:52:24.022+00
3793	127.0.0.1	admin.cargos.store	/admin/cargos	POST	33	2021-07-01 19:53:02.376+00	2021-07-01 19:53:02.376+00
3794	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 19:53:02.558+00	2021-07-01 19:53:02.558+00
3795	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 19:53:09.106+00	2021-07-01 19:53:09.106+00
3796	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-07-01 19:53:12.888+00	2021-07-01 19:53:12.888+00
3797	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-07-01 19:54:57.118+00	2021-07-01 19:54:57.118+00
3798	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 19:54:57.296+00	2021-07-01 19:54:57.296+00
3799	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-07-01 19:55:10.549+00	2021-07-01 19:55:10.549+00
3800	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 19:57:28.589+00	2021-07-01 19:57:28.589+00
3801	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 19:58:03.798+00	2021-07-01 19:58:03.798+00
3802	127.0.0.1	sessions.store	/sessions	POST	33	2021-07-01 19:58:14.999+00	2021-07-01 19:58:14.999+00
3803	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-01 19:58:15.18+00	2021-07-01 19:58:15.18+00
3804	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 19:58:24.343+00	2021-07-01 19:58:24.343+00
3805	127.0.0.1	admin.rdos.show	/admin/rdos/29	GET	33	2021-07-01 19:58:30.377+00	2021-07-01 19:58:30.377+00
3806	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-07-01 19:59:01.188+00	2021-07-01 19:59:01.188+00
3807	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 19:59:01.383+00	2021-07-01 19:59:01.383+00
3808	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 19:59:59.127+00	2021-07-01 19:59:59.127+00
3809	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	33	2021-07-01 20:00:09.819+00	2021-07-01 20:00:09.819+00
3810	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 20:03:41.466+00	2021-07-01 20:03:41.466+00
3811	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 20:03:52.555+00	2021-07-01 20:03:52.555+00
3812	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 20:03:52.866+00	2021-07-01 20:03:52.866+00
3813	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 20:04:54.491+00	2021-07-01 20:04:54.491+00
3814	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 20:04:54.751+00	2021-07-01 20:04:54.751+00
3815	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 20:12:10.256+00	2021-07-01 20:12:10.256+00
3816	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 20:13:57.313+00	2021-07-01 20:13:57.313+00
3817	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 20:19:51.247+00	2021-07-01 20:19:51.247+00
3818	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-01 20:20:12.37+00	2021-07-01 20:20:12.37+00
3819	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-01 20:20:44.475+00	2021-07-01 20:20:44.475+00
3820	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 20:20:44.715+00	2021-07-01 20:20:44.715+00
4041	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 23:35:07.832+00	2021-07-01 23:35:07.832+00
3821	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-01 20:20:47.103+00	2021-07-01 20:20:47.103+00
3822	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-01 20:21:02.449+00	2021-07-01 20:21:02.449+00
3823	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 20:21:02.605+00	2021-07-01 20:21:02.605+00
3824	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 20:22:29.92+00	2021-07-01 20:22:29.92+00
3825	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 20:22:30.275+00	2021-07-01 20:22:30.275+00
3826	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 20:25:58.622+00	2021-07-01 20:25:58.622+00
3827	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-01 20:26:08.097+00	2021-07-01 20:26:08.097+00
3828	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 20:26:13.256+00	2021-07-01 20:26:13.256+00
3829	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 20:26:19.188+00	2021-07-01 20:26:19.188+00
3830	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 20:26:22.709+00	2021-07-01 20:26:22.709+00
3831	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 20:33:33.152+00	2021-07-01 20:33:33.152+00
3832	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 20:35:08.392+00	2021-07-01 20:35:08.392+00
3833	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 20:45:34.491+00	2021-07-01 20:45:34.491+00
3834	127.0.0.1	admin.rdos.destroy	/admin/rdos/30	DELETE	33	2021-07-01 20:47:02.964+00	2021-07-01 20:47:02.964+00
3835	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 20:47:03.135+00	2021-07-01 20:47:03.135+00
3836	127.0.0.1	admin.rdos.show	/admin/rdos/15	GET	33	2021-07-01 20:47:19.113+00	2021-07-01 20:47:19.113+00
3837	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 20:47:43.79+00	2021-07-01 20:47:43.79+00
3838	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 20:50:36.332+00	2021-07-01 20:50:36.332+00
3839	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 20:52:30.017+00	2021-07-01 20:52:30.017+00
3840	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-07-01 20:59:06.313+00	2021-07-01 20:59:06.313+00
3841	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-07-01 20:59:16.758+00	2021-07-01 20:59:16.758+00
3842	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-07-01 20:59:44.181+00	2021-07-01 20:59:44.181+00
3843	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-07-01 20:59:44.346+00	2021-07-01 20:59:44.346+00
3844	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 21:01:16.737+00	2021-07-01 21:01:16.737+00
3845	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 21:08:36.844+00	2021-07-01 21:08:36.844+00
3846	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 21:08:37.096+00	2021-07-01 21:08:37.096+00
3847	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 21:10:30.002+00	2021-07-01 21:10:30.002+00
3848	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 21:11:13.02+00	2021-07-01 21:11:13.02+00
3849	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-01 21:11:45.729+00	2021-07-01 21:11:45.729+00
3850	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-01 21:12:13.384+00	2021-07-01 21:12:13.384+00
3851	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 21:12:13.561+00	2021-07-01 21:12:13.561+00
3852	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 21:14:39.233+00	2021-07-01 21:14:39.233+00
3853	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 21:14:39.474+00	2021-07-01 21:14:39.474+00
3854	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 21:15:55.802+00	2021-07-01 21:15:55.802+00
3855	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 21:15:56.241+00	2021-07-01 21:15:56.241+00
3856	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-01 21:16:41.715+00	2021-07-01 21:16:41.715+00
3857	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-01 21:17:13.222+00	2021-07-01 21:17:13.222+00
3858	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 21:17:13.379+00	2021-07-01 21:17:13.379+00
3859	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 21:18:24.821+00	2021-07-01 21:18:24.821+00
3860	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 21:18:25.064+00	2021-07-01 21:18:25.064+00
3861	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 21:18:53.905+00	2021-07-01 21:18:53.905+00
3862	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 21:20:08.041+00	2021-07-01 21:20:08.041+00
3863	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-01 21:23:06.925+00	2021-07-01 21:23:06.925+00
3864	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:23:11.097+00	2021-07-01 21:23:11.098+00
3865	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 21:23:17.555+00	2021-07-01 21:23:17.555+00
3866	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 21:23:19.654+00	2021-07-01 21:23:19.654+00
3867	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:23:35.157+00	2021-07-01 21:23:35.157+00
3868	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:23:40.751+00	2021-07-01 21:23:40.751+00
3869	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:23:43.419+00	2021-07-01 21:23:43.419+00
3870	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:23:49.664+00	2021-07-01 21:23:49.664+00
3871	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 21:23:49.761+00	2021-07-01 21:23:49.761+00
3872	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 21:23:54.941+00	2021-07-01 21:23:54.941+00
3873	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 21:23:57.625+00	2021-07-01 21:23:57.625+00
3874	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 21:24:05.495+00	2021-07-01 21:24:05.495+00
3875	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-01 21:24:05.868+00	2021-07-01 21:24:05.868+00
3876	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-01 21:24:07.274+00	2021-07-01 21:24:07.274+00
3877	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	33	2021-07-01 21:24:08.078+00	2021-07-01 21:24:08.078+00
3878	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:24:09.731+00	2021-07-01 21:24:09.731+00
3879	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:24:25.573+00	2021-07-01 21:24:25.573+00
3880	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:24:53.67+00	2021-07-01 21:24:53.67+00
3881	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	33	2021-07-01 21:24:53.749+00	2021-07-01 21:24:53.749+00
3882	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-01 21:25:15.932+00	2021-07-01 21:25:15.932+00
3883	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-01 21:25:17.14+00	2021-07-01 21:25:17.14+00
3884	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	33	2021-07-01 21:25:18.98+00	2021-07-01 21:25:18.98+00
3885	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:25:21.845+00	2021-07-01 21:25:21.845+00
3886	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-01 21:25:46.52+00	2021-07-01 21:25:46.52+00
3887	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 21:29:12.293+00	2021-07-01 21:29:12.293+00
3888	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 21:35:45.274+00	2021-07-01 21:35:45.274+00
3889	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-01 21:35:48.667+00	2021-07-01 21:35:48.667+00
3890	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-01 21:36:03.381+00	2021-07-01 21:36:03.381+00
3891	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 21:36:03.54+00	2021-07-01 21:36:03.54+00
3892	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 21:36:33.618+00	2021-07-01 21:36:33.618+00
3893	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 21:36:33.801+00	2021-07-01 21:36:33.801+00
3894	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 21:38:24.014+00	2021-07-01 21:38:24.014+00
3895	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 21:38:24.257+00	2021-07-01 21:38:24.257+00
3896	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-01 21:39:53.708+00	2021-07-01 21:39:53.708+00
3897	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-01 21:40:14.912+00	2021-07-01 21:40:14.912+00
3898	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 21:40:15.068+00	2021-07-01 21:40:15.068+00
3899	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 21:40:52.472+00	2021-07-01 21:40:52.472+00
3900	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 21:40:52.666+00	2021-07-01 21:40:52.666+00
3901	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 21:42:27.324+00	2021-07-01 21:42:27.324+00
3902	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 21:43:05.616+00	2021-07-01 21:43:05.616+00
3903	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 21:51:45.803+00	2021-07-01 21:51:45.803+00
3904	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 21:59:14.308+00	2021-07-01 21:59:14.308+00
3905	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 21:59:14.545+00	2021-07-01 21:59:14.545+00
3906	127.0.0.1	admin.atividades.edit	/admin/atividades/88/edit	GET	33	2021-07-01 22:02:21.757+00	2021-07-01 22:02:21.757+00
3907	127.0.0.1	admin.atividades.update	/admin/atividades/88	PUT	33	2021-07-01 22:02:27.171+00	2021-07-01 22:02:27.171+00
3908	127.0.0.1	admin.atividades.edit	/admin/atividades/88/edit	GET	33	2021-07-01 22:02:27.337+00	2021-07-01 22:02:27.337+00
3909	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:02:43.765+00	2021-07-01 22:02:43.765+00
3910	127.0.0.1	admin.atividades.destroy	/admin/atividades/88	DELETE	33	2021-07-01 22:02:59.626+00	2021-07-01 22:02:59.626+00
3911	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:02:59.784+00	2021-07-01 22:02:59.784+00
3912	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-01 22:03:02.265+00	2021-07-01 22:03:02.265+00
3913	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-01 22:03:11.007+00	2021-07-01 22:03:11.007+00
3914	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:03:11.171+00	2021-07-01 22:03:11.171+00
3915	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-01 22:03:28.693+00	2021-07-01 22:03:28.693+00
3916	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-01 22:04:15.321+00	2021-07-01 22:04:15.321+00
3917	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:04:15.5+00	2021-07-01 22:04:15.5+00
3918	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-01 22:04:48.233+00	2021-07-01 22:04:48.233+00
3919	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-01 22:04:48.512+00	2021-07-01 22:04:48.512+00
3920	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 22:05:08.083+00	2021-07-01 22:05:08.083+00
3921	127.0.0.1	admin.cargos.edit	/admin/cargos/28/edit	GET	33	2021-07-01 22:05:41.775+00	2021-07-01 22:05:41.775+00
3922	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 22:05:54.684+00	2021-07-01 22:05:54.684+00
3923	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 22:06:25.634+00	2021-07-01 22:06:25.634+00
3924	127.0.0.1	admin.cargos.edit	/admin/cargos/34/edit	GET	33	2021-07-01 22:06:30.349+00	2021-07-01 22:06:30.349+00
3925	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 22:06:42.264+00	2021-07-01 22:06:42.264+00
3926	127.0.0.1	admin.users.edit	/admin/users/33/edit	GET	33	2021-07-01 22:06:52.914+00	2021-07-01 22:06:52.914+00
3927	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 22:07:05.46+00	2021-07-01 22:07:05.46+00
3928	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 22:07:11.23+00	2021-07-01 22:07:11.23+00
3929	127.0.0.1	admin.users.edit	/admin/users/33/edit	GET	33	2021-07-01 22:07:18.109+00	2021-07-01 22:07:18.109+00
3930	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 22:07:24.078+00	2021-07-01 22:07:24.078+00
3931	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	33	2021-07-01 22:07:29.576+00	2021-07-01 22:07:29.576+00
3932	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 22:07:42.622+00	2021-07-01 22:07:42.623+00
3933	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 22:07:55.629+00	2021-07-01 22:07:55.629+00
3934	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 22:08:01.157+00	2021-07-01 22:08:01.157+00
3935	127.0.0.1	admin.users.edit	/admin/users/67/edit	GET	33	2021-07-01 22:08:08.05+00	2021-07-01 22:08:08.05+00
3936	127.0.0.1	admin.users.update	/admin/users/67	PUT	33	2021-07-01 22:08:36.347+00	2021-07-01 22:08:36.347+00
3937	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-01 22:08:36.562+00	2021-07-01 22:08:36.562+00
3938	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 22:08:46.838+00	2021-07-01 22:08:46.838+00
3939	127.0.0.1	admin.cargos.edit	/admin/cargos/28/edit	GET	33	2021-07-01 22:08:49.38+00	2021-07-01 22:08:49.38+00
3940	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-01 22:09:06.08+00	2021-07-01 22:09:06.08+00
3941	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	33	2021-07-01 22:09:09.614+00	2021-07-01 22:09:09.614+00
3942	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 22:09:09.791+00	2021-07-01 22:09:09.791+00
3943	127.0.0.1	sessions.store	/sessions	POST	67	2021-07-01 22:09:17.652+00	2021-07-01 22:09:17.652+00
3944	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-01 22:09:17.844+00	2021-07-01 22:09:17.844+00
3945	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 22:09:30.934+00	2021-07-01 22:09:30.934+00
3946	127.0.0.1	admin.rdos.show	/admin/rdos/20	GET	67	2021-07-01 22:09:41.816+00	2021-07-01 22:09:41.816+00
3947	127.0.0.1	admin.rdos.edit	/admin/rdos/20/edit	GET	67	2021-07-01 22:09:46.154+00	2021-07-01 22:09:46.154+00
3948	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-01 22:09:52.045+00	2021-07-01 22:09:52.045+00
3949	127.0.0.1	api.auth.store	/api/auth	POST	67	2021-07-01 22:10:06.613+00	2021-07-01 22:10:06.613+00
3950	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-01 22:10:06.955+00	2021-07-01 22:10:06.955+00
3951	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 22:10:23.097+00	2021-07-01 22:10:23.097+00
3952	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 22:10:32.539+00	2021-07-01 22:10:32.539+00
3953	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 22:10:39.431+00	2021-07-01 22:10:39.431+00
3954	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 22:10:47.718+00	2021-07-01 22:10:47.718+00
3955	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-01 22:24:13.225+00	2021-07-01 22:24:13.225+00
3956	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 22:29:50.979+00	2021-07-01 22:29:50.979+00
3957	127.0.0.1	admin.rdos.show	/admin/rdos/43	GET	67	2021-07-01 22:29:56.266+00	2021-07-01 22:29:56.266+00
3958	127.0.0.1	admin.rdo_equipamentos.destroy	/admin/rdos/43/equipamentos/289	DELETE	67	2021-07-01 22:30:04.698+00	2021-07-01 22:30:04.698+00
3959	127.0.0.1	admin.rdos.show	/admin/rdos/43	GET	67	2021-07-01 22:30:04.887+00	2021-07-01 22:30:04.887+00
3960	127.0.0.1	admin.rdo_equipamentos.store	/admin/rdos/43/equipamentos	POST	67	2021-07-01 22:30:21.284+00	2021-07-01 22:30:21.284+00
3961	127.0.0.1	admin.rdos.show	/admin/rdos/43	GET	67	2021-07-01 22:30:21.475+00	2021-07-01 22:30:21.475+00
3962	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 22:35:05.779+00	2021-07-01 22:35:05.779+00
3963	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:39:38.997+00	2021-07-01 22:39:38.997+00
3964	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:39:47.857+00	2021-07-01 22:39:47.857+00
3965	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:40:02.136+00	2021-07-01 22:40:02.136+00
3966	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:40:11.463+00	2021-07-01 22:40:11.463+00
3967	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:40:29.972+00	2021-07-01 22:40:29.972+00
3968	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:40:45.004+00	2021-07-01 22:40:45.004+00
3969	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	33	2021-07-01 22:40:51.782+00	2021-07-01 22:40:51.782+00
3970	127.0.0.1	admin.atividades.update	/admin/atividades/5	PUT	33	2021-07-01 22:41:01.284+00	2021-07-01 22:41:01.284+00
3971	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 22:41:01.478+00	2021-07-01 22:41:01.478+00
3972	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 23:01:15.565+00	2021-07-01 23:01:15.565+00
3973	127.0.0.1	admin.atividades.edit	/admin/atividades/5/edit	GET	33	2021-07-01 23:01:27.052+00	2021-07-01 23:01:27.052+00
3974	127.0.0.1	admin.atividades.update	/admin/atividades/5	PUT	33	2021-07-01 23:01:45.57+00	2021-07-01 23:01:45.57+00
3975	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-01 23:01:45.76+00	2021-07-01 23:01:45.76+00
3976	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-01 23:03:21.439+00	2021-07-01 23:03:21.439+00
3977	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-01 23:03:21.727+00	2021-07-01 23:03:21.727+00
3978	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-01 23:04:35.588+00	2021-07-01 23:04:35.588+00
3979	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 23:15:36.209+00	2021-07-01 23:15:36.21+00
3980	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 23:16:25.464+00	2021-07-01 23:16:25.464+00
3981	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 23:16:29.518+00	2021-07-01 23:16:29.518+00
3982	127.0.0.1	admin.rdos.show	/admin/rdos/45	GET	67	2021-07-01 23:16:49.037+00	2021-07-01 23:16:49.037+00
3983	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/45/atividades/275	DELETE	67	2021-07-01 23:18:25.052+00	2021-07-01 23:18:25.052+00
3984	127.0.0.1	admin.rdos.show	/admin/rdos/45	GET	67	2021-07-01 23:18:25.234+00	2021-07-01 23:18:25.234+00
3985	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-01 23:18:56.822+00	2021-07-01 23:18:56.822+00
3986	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/45/atividades	POST	67	2021-07-01 23:19:18.904+00	2021-07-01 23:19:18.904+00
3987	127.0.0.1	admin.rdos.show	/admin/rdos/45	GET	67	2021-07-01 23:19:19.101+00	2021-07-01 23:19:19.101+00
3988	127.0.0.1	admin.rdos.show	/admin/rdos/45	GET	67	2021-07-01 23:19:28.07+00	2021-07-01 23:19:28.07+00
3989	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/45/atividades	POST	67	2021-07-01 23:20:29.997+00	2021-07-01 23:20:29.997+00
3990	127.0.0.1	admin.rdos.show	/admin/rdos/45	GET	67	2021-07-01 23:20:30.178+00	2021-07-01 23:20:30.178+00
3991	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 23:20:48.048+00	2021-07-01 23:20:48.048+00
3992	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-01 23:21:01.695+00	2021-07-01 23:21:01.695+00
3993	127.0.0.1	admin.rdos.show	/admin/rdos/45	GET	33	2021-07-01 23:21:13.267+00	2021-07-01 23:21:13.268+00
3994	127.0.0.1	admin.rdos.edit	/admin/rdos/45/edit	GET	33	2021-07-01 23:21:18.074+00	2021-07-01 23:21:18.074+00
3995	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/45/atividades	POST	33	2021-07-01 23:22:15.569+00	2021-07-01 23:22:15.569+00
3996	127.0.0.1	admin.rdos.show	/admin/rdos/45	GET	33	2021-07-01 23:22:15.731+00	2021-07-01 23:22:15.731+00
3997	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 23:24:34.847+00	2021-07-01 23:24:34.847+00
3998	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 23:24:38.285+00	2021-07-01 23:24:38.285+00
3999	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	1	2021-07-01 23:24:44.515+00	2021-07-01 23:24:44.515+00
4000	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-07-01 23:24:44.837+00	2021-07-01 23:24:44.837+00
4001	127.0.0.1	admin.rdos.destroy	/admin/rdos/45	DELETE	67	2021-07-01 23:24:47.141+00	2021-07-01 23:24:47.141+00
4002	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-01 23:24:47.323+00	2021-07-01 23:24:47.323+00
4003	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-01 23:25:16.213+00	2021-07-01 23:25:16.213+00
4004	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-01 23:25:16.417+00	2021-07-01 23:25:16.417+00
4005	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 23:25:28.707+00	2021-07-01 23:25:28.707+00
4006	127.0.0.1	sessions.store	/sessions	POST	1	2021-07-01 23:25:38.837+00	2021-07-01 23:25:38.837+00
4007	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 23:25:39.054+00	2021-07-01 23:25:39.054+00
4008	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:25:43.525+00	2021-07-01 23:25:43.525+00
4009	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 23:26:02.239+00	2021-07-01 23:26:02.239+00
4010	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:26:05.851+00	2021-07-01 23:26:05.851+00
4011	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-01 23:26:10.074+00	2021-07-01 23:26:10.074+00
4012	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:26:10.276+00	2021-07-01 23:26:10.276+00
4013	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 23:26:15.133+00	2021-07-01 23:26:15.133+00
4014	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-07-01 23:26:25.245+00	2021-07-01 23:26:25.245+00
4015	127.0.0.1	api.auth.store	/api/auth	POST	1	2021-07-01 23:27:19.93+00	2021-07-01 23:27:19.93+00
4016	127.0.0.1	api.sync_data.index	/api/sync-data	GET	1	2021-07-01 23:27:20.338+00	2021-07-01 23:27:20.338+00
4017	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-01 23:28:59.344+00	2021-07-01 23:28:59.344+00
4018	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	1	2021-07-01 23:29:02.862+00	2021-07-01 23:29:02.862+00
4019	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	1	2021-07-01 23:29:23.541+00	2021-07-01 23:29:23.541+00
4020	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-01 23:30:32.049+00	2021-07-01 23:30:32.049+00
4021	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 23:33:04.61+00	2021-07-01 23:33:04.61+00
4022	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:33:06.962+00	2021-07-01 23:33:06.962+00
4023	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:33:28.208+00	2021-07-01 23:33:28.208+00
4024	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:33:31.395+00	2021-07-01 23:33:31.395+00
4025	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-01 23:33:35.439+00	2021-07-01 23:33:35.439+00
4026	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:33:35.669+00	2021-07-01 23:33:35.669+00
4027	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 23:33:37.91+00	2021-07-01 23:33:37.91+00
4028	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:33:40.635+00	2021-07-01 23:33:40.635+00
4029	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:33:59.48+00	2021-07-01 23:33:59.48+00
4030	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:34:06.543+00	2021-07-01 23:34:06.543+00
4031	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:34:16.112+00	2021-07-01 23:34:16.112+00
4032	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:34:30.05+00	2021-07-01 23:34:30.05+00
4033	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:34:33.472+00	2021-07-01 23:34:33.472+00
4034	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-01 23:34:40.514+00	2021-07-01 23:34:40.514+00
4035	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:34:41.492+00	2021-07-01 23:34:41.492+00
4036	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-01 23:34:44.53+00	2021-07-01 23:34:44.53+00
4037	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:34:44.75+00	2021-07-01 23:34:44.75+00
4038	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 23:34:46.747+00	2021-07-01 23:34:46.747+00
4039	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:34:49.43+00	2021-07-01 23:34:49.43+00
4040	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:35:02.335+00	2021-07-01 23:35:02.335+00
4042	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:35:14.187+00	2021-07-01 23:35:14.187+00
4043	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 23:35:17.61+00	2021-07-01 23:35:17.61+00
4044	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-07-01 23:35:18.676+00	2021-07-01 23:35:18.676+00
4045	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 23:35:24.051+00	2021-07-01 23:35:24.051+00
4046	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:35:26.08+00	2021-07-01 23:35:26.08+00
4047	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:35:37.877+00	2021-07-01 23:35:37.877+00
4049	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 23:37:26.281+00	2021-07-01 23:37:26.281+00
4050	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:37:36.607+00	2021-07-01 23:37:36.607+00
4051	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-01 23:37:43.795+00	2021-07-01 23:37:43.795+00
4052	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-01 23:37:44.437+00	2021-07-01 23:37:44.437+00
4053	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-01 23:37:46.089+00	2021-07-01 23:37:46.089+00
4054	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:37:47.448+00	2021-07-01 23:37:47.448+00
4055	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:38:00.638+00	2021-07-01 23:38:00.638+00
4073	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-01 23:49:37.701+00	2021-07-01 23:49:37.701+00
4074	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	73	2021-07-01 23:49:45.984+00	2021-07-01 23:49:45.984+00
4075	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-01 23:49:46.231+00	2021-07-01 23:49:46.231+00
4076	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-01 23:49:48.466+00	2021-07-01 23:49:48.466+00
4077	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	73	2021-07-01 23:49:50.125+00	2021-07-01 23:49:50.125+00
4078	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	73	2021-07-01 23:49:59.026+00	2021-07-01 23:49:59.026+00
4079	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 00:04:23.337+00	2021-07-02 00:04:23.337+00
4080	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 00:05:41.671+00	2021-07-02 00:05:41.671+00
4081	127.0.0.1	sessions.store	/sessions	POST	73	2021-07-02 00:08:16.694+00	2021-07-02 00:08:16.694+00
4082	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-02 00:08:17.083+00	2021-07-02 00:08:17.083+00
4083	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	73	2021-07-02 00:08:19.312+00	2021-07-02 00:08:19.312+00
4084	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 02:32:40.218+00	2021-07-02 02:32:40.219+00
4085	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 03:20:42.768+00	2021-07-02 03:20:42.768+00
4086	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 05:46:44.383+00	2021-07-02 05:46:44.383+00
4087	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 06:46:28.395+00	2021-07-02 06:46:28.395+00
4088	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 06:46:53.544+00	2021-07-02 06:46:53.544+00
4089	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-07-02 08:51:36.502+00	2021-07-02 08:51:36.502+00
4090	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 10:49:08.365+00	2021-07-02 10:49:08.365+00
4091	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 11:46:56.387+00	2021-07-02 11:46:56.387+00
4092	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-02 13:32:52.569+00	2021-07-02 13:32:52.569+00
4093	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-02 13:32:52.787+00	2021-07-02 13:32:52.787+00
4094	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 15:12:23.387+00	2021-07-02 15:12:23.387+00
4095	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 16:08:27.737+00	2021-07-02 16:08:27.737+00
4096	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 16:08:27.797+00	2021-07-02 16:08:27.797+00
4097	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 17:54:12.947+00	2021-07-02 17:54:12.947+00
4098	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-02 18:56:32.024+00	2021-07-02 18:56:32.024+00
4099	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-07-02 20:02:41.25+00	2021-07-02 20:02:41.25+00
4100	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-02 22:42:45.143+00	2021-07-02 22:42:45.143+00
4101	127.0.0.1	admin.atividades.index	/admin/atividades	GET	73	2021-07-02 22:42:50.431+00	2021-07-02 22:42:50.431+00
4102	127.0.0.1	admin.atividades.edit	/admin/atividades/35/edit	GET	73	2021-07-02 22:43:02.381+00	2021-07-02 22:43:02.381+00
4103	127.0.0.1	admin.atividades.index	/admin/atividades	GET	73	2021-07-02 22:43:11.214+00	2021-07-02 22:43:11.214+00
4104	127.0.0.1	admin.atividades.edit	/admin/atividades/82/edit	GET	73	2021-07-02 22:43:19.838+00	2021-07-02 22:43:19.838+00
4105	127.0.0.1	admin.atividades.edit	/admin/atividades/71/edit	GET	73	2021-07-02 22:43:30.984+00	2021-07-02 22:43:30.984+00
4106	127.0.0.1	admin.atividades.edit	/admin/atividades/82/edit	GET	73	2021-07-02 22:50:35.394+00	2021-07-02 22:50:35.394+00
4107	127.0.0.1	admin.atividades.edit	/admin/atividades/3/edit	GET	73	2021-07-02 22:50:41.09+00	2021-07-02 22:50:41.09+00
4108	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-02 23:10:26.542+00	2021-07-02 23:10:26.542+00
4109	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	73	2021-07-02 23:10:28.612+00	2021-07-02 23:10:28.612+00
4110	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	73	2021-07-02 23:55:54.009+00	2021-07-02 23:55:54.009+00
4111	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	73	2021-07-02 23:56:35.346+00	2021-07-02 23:56:35.346+00
4112	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 03:10:48.903+00	2021-07-03 03:10:48.903+00
4113	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 06:26:07.223+00	2021-07-03 06:26:07.223+00
4114	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 11:15:01.72+00	2021-07-03 11:15:01.72+00
4115	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 11:15:02.015+00	2021-07-03 11:15:02.015+00
4116	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 12:26:06.414+00	2021-07-03 12:26:06.414+00
4117	127.0.0.1	sessions.store	/sessions	POST	34	2021-07-03 12:26:19.293+00	2021-07-03 12:26:19.293+00
4118	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-03 12:26:19.476+00	2021-07-03 12:26:19.476+00
4119	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-03 12:26:22.956+00	2021-07-03 12:26:22.956+00
4120	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-03 12:26:42.778+00	2021-07-03 12:26:42.778+00
4152	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-05 13:24:10.791+00	2021-07-05 13:24:10.791+00
4154	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-05 13:24:22.823+00	2021-07-05 13:24:22.823+00
4048	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-01 23:35:41.198+00	2021-07-01 23:35:41.198+00
4056	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 23:38:12.771+00	2021-07-01 23:38:12.771+00
4057	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-07-01 23:38:26.822+00	2021-07-01 23:38:26.822+00
4058	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 23:38:47.418+00	2021-07-01 23:38:47.418+00
4059	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-01 23:38:49.793+00	2021-07-01 23:38:49.793+00
4060	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-07-01 23:38:54.137+00	2021-07-01 23:38:54.137+00
4061	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-07-01 23:39:04.87+00	2021-07-01 23:39:04.87+00
4062	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-01 23:39:05.278+00	2021-07-01 23:39:05.278+00
4063	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 23:39:11.092+00	2021-07-01 23:39:11.092+00
4064	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-07-01 23:39:13.372+00	2021-07-01 23:39:13.372+00
4065	127.0.0.1	admin.users.store	/admin/users	POST	1	2021-07-01 23:48:21.064+00	2021-07-01 23:48:21.064+00
4066	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-01 23:48:21.3+00	2021-07-01 23:48:21.3+00
4067	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	1	2021-07-01 23:48:41.116+00	2021-07-01 23:48:41.116+00
4068	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-01 23:48:41.332+00	2021-07-01 23:48:41.332+00
4069	127.0.0.1	sessions.store	/sessions	POST	73	2021-07-01 23:48:47.688+00	2021-07-01 23:48:47.688+00
4070	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-01 23:48:48.062+00	2021-07-01 23:48:48.062+00
4071	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	73	2021-07-01 23:48:50.026+00	2021-07-01 23:48:50.026+00
4072	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	73	2021-07-01 23:48:57.008+00	2021-07-01 23:48:57.008+00
4121	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-03 12:27:43.348+00	2021-07-03 12:27:43.348+00
4122	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-03 12:27:44.885+00	2021-07-03 12:27:44.885+00
4123	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-03 12:27:53.59+00	2021-07-03 12:27:53.59+00
4124	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-03 12:27:57.227+00	2021-07-03 12:27:57.227+00
4125	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-03 12:27:59.619+00	2021-07-03 12:27:59.619+00
4126	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 13:52:06.667+00	2021-07-03 13:52:06.667+00
4127	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 15:06:28.137+00	2021-07-03 15:06:28.137+00
4128	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 16:40:38.539+00	2021-07-03 16:40:38.539+00
4129	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-03 19:45:28.399+00	2021-07-03 19:45:28.399+00
4130	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 01:53:25.555+00	2021-07-04 01:53:25.555+00
4131	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 04:07:44.159+00	2021-07-04 04:07:44.159+00
4132	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 04:33:28.061+00	2021-07-04 04:33:28.061+00
4133	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 05:01:34.287+00	2021-07-04 05:01:34.287+00
4134	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 05:01:34.499+00	2021-07-04 05:01:34.499+00
4135	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 05:48:19.091+00	2021-07-04 05:48:19.091+00
4136	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 08:29:44.11+00	2021-07-04 08:29:44.11+00
4137	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 19:06:43.171+00	2021-07-04 19:06:43.171+00
4138	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 19:37:09.003+00	2021-07-04 19:37:09.003+00
4139	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 19:37:09.207+00	2021-07-04 19:37:09.207+00
4140	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 20:51:40.601+00	2021-07-04 20:51:40.601+00
4141	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 23:19:26.494+00	2021-07-04 23:19:26.494+00
4142	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-04 23:35:40.957+00	2021-07-04 23:35:40.957+00
4143	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 00:19:53.518+00	2021-07-05 00:19:53.518+00
4144	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 04:39:53.264+00	2021-07-05 04:39:53.264+00
4145	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 11:31:00.363+00	2021-07-05 11:31:00.363+00
4146	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 13:11:39.26+00	2021-07-05 13:11:39.26+00
4147	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 13:23:50.537+00	2021-07-05 13:23:50.537+00
4148	127.0.0.1	sessions.store	/sessions	POST	34	2021-07-05 13:24:04.077+00	2021-07-05 13:24:04.077+00
4149	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-05 13:24:04.246+00	2021-07-05 13:24:04.246+00
4150	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 13:24:05.586+00	2021-07-05 13:24:05.586+00
4151	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-05 13:24:06.832+00	2021-07-05 13:24:06.832+00
4153	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-05 13:24:18.618+00	2021-07-05 13:24:18.618+00
4155	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 14:07:08.152+00	2021-07-05 14:07:08.152+00
4156	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 14:55:18.176+00	2021-07-05 14:55:18.176+00
4157	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 15:29:20.718+00	2021-07-05 15:29:20.718+00
4158	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 15:38:00.161+00	2021-07-05 15:38:00.161+00
4159	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 15:38:01.077+00	2021-07-05 15:38:01.077+00
4160	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 15:46:42.073+00	2021-07-05 15:46:42.073+00
4161	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 16:20:42.127+00	2021-07-05 16:20:42.127+00
4162	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 16:38:37.724+00	2021-07-05 16:38:37.724+00
4163	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 17:29:01.949+00	2021-07-05 17:29:01.949+00
4164	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 19:44:12.95+00	2021-07-05 19:44:12.951+00
4165	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-05 22:07:26.236+00	2021-07-05 22:07:26.236+00
4166	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 00:04:36.333+00	2021-07-06 00:04:36.333+00
4167	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 00:37:11.593+00	2021-07-06 00:37:11.593+00
4168	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 01:31:04.819+00	2021-07-06 01:31:04.819+00
4169	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 03:19:57.308+00	2021-07-06 03:19:57.308+00
4170	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 03:21:03.051+00	2021-07-06 03:21:03.051+00
4171	127.0.0.1	sessions.store	/sessions	POST	73	2021-07-06 03:21:09.925+00	2021-07-06 03:21:09.925+00
4172	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-06 03:21:10.139+00	2021-07-06 03:21:10.139+00
4173	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-06 03:21:15.43+00	2021-07-06 03:21:15.43+00
4174	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-06 03:28:21.14+00	2021-07-06 03:28:21.14+00
4175	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	73	2021-07-06 03:50:46.964+00	2021-07-06 03:50:46.964+00
4176	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-06 03:50:51.311+00	2021-07-06 03:50:51.311+00
4177	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	73	2021-07-06 03:50:53.358+00	2021-07-06 03:50:53.358+00
4178	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	73	2021-07-06 03:52:34.346+00	2021-07-06 03:52:34.346+00
4179	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	73	2021-07-06 03:52:52.786+00	2021-07-06 03:52:52.786+00
4180	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-06 03:53:06.348+00	2021-07-06 03:53:06.348+00
4181	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	73	2021-07-06 03:53:09.627+00	2021-07-06 03:53:09.627+00
4182	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-06 03:53:09.902+00	2021-07-06 03:53:09.902+00
4183	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-06 03:53:11.319+00	2021-07-06 03:53:11.319+00
4184	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	73	2021-07-06 03:53:12.981+00	2021-07-06 03:53:12.981+00
4185	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	73	2021-07-06 03:53:35.634+00	2021-07-06 03:53:35.634+00
4186	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 04:08:52.289+00	2021-07-06 04:08:52.289+00
4187	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 05:33:52.657+00	2021-07-06 05:33:52.657+00
4188	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 07:11:22.17+00	2021-07-06 07:11:22.17+00
4189	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 07:31:47.484+00	2021-07-06 07:31:47.484+00
4190	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 07:41:31.744+00	2021-07-06 07:41:31.744+00
4191	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 07:41:31.918+00	2021-07-06 07:41:31.918+00
4192	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 07:55:58.773+00	2021-07-06 07:55:58.773+00
4193	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 10:18:27.42+00	2021-07-06 10:18:27.42+00
4194	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 16:44:33.957+00	2021-07-06 16:44:33.957+00
4195	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 17:15:42.635+00	2021-07-06 17:15:42.635+00
4196	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 17:59:04.106+00	2021-07-06 17:59:04.106+00
4197	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 18:11:21.059+00	2021-07-06 18:11:21.059+00
4198	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 20:36:09.961+00	2021-07-06 20:36:09.961+00
4199	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 22:22:31.679+00	2021-07-06 22:22:31.679+00
4200	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-06 23:04:10.124+00	2021-07-06 23:04:10.124+00
4201	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 00:24:01.749+00	2021-07-07 00:24:01.749+00
4202	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 00:24:01.958+00	2021-07-07 00:24:01.958+00
4203	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 01:44:44.684+00	2021-07-07 01:44:44.684+00
4204	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 04:27:41.965+00	2021-07-07 04:27:41.965+00
4205	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 06:39:30.299+00	2021-07-07 06:39:30.299+00
4206	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 09:47:11.893+00	2021-07-07 09:47:11.893+00
4207	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 12:21:35.723+00	2021-07-07 12:21:35.723+00
4208	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 15:12:36.212+00	2021-07-07 15:12:36.212+00
4209	127.0.0.1	sessions.store	/sessions	POST	34	2021-07-07 15:12:49.854+00	2021-07-07 15:12:49.854+00
4210	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-07 15:12:50.068+00	2021-07-07 15:12:50.068+00
4211	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-07 15:12:52.06+00	2021-07-07 15:12:52.06+00
4212	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-07 15:12:53.938+00	2021-07-07 15:12:53.938+00
4213	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-07 15:12:55.017+00	2021-07-07 15:12:55.017+00
4214	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-07 15:13:04.573+00	2021-07-07 15:13:04.573+00
4215	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 15:25:33.391+00	2021-07-07 15:25:33.391+00
4216	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 15:25:34.184+00	2021-07-07 15:25:34.184+00
4217	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 18:31:34.709+00	2021-07-07 18:31:34.709+00
4218	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 18:57:16.082+00	2021-07-07 18:57:16.082+00
4219	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 19:06:48.761+00	2021-07-07 19:06:48.761+00
4220	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 19:38:48.844+00	2021-07-07 19:38:48.844+00
4221	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-07 19:38:49.024+00	2021-07-07 19:38:49.024+00
4222	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-07 19:38:50.875+00	2021-07-07 19:38:50.875+00
4223	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-07 19:39:08.528+00	2021-07-07 19:39:08.528+00
4224	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 19:40:50.845+00	2021-07-07 19:40:50.845+00
4225	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-07 19:49:49.635+00	2021-07-07 19:49:49.635+00
4226	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-07 19:50:34.739+00	2021-07-07 19:50:34.739+00
4227	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-07 19:52:10.643+00	2021-07-07 19:52:10.643+00
4228	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-07 19:52:15.38+00	2021-07-07 19:52:15.38+00
4229	127.0.0.1	admin.rdos.show	/admin/rdos/33	GET	34	2021-07-07 19:52:53.801+00	2021-07-07 19:52:53.801+00
4230	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-07 19:56:32.379+00	2021-07-07 19:56:32.379+00
4231	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-07-07 19:56:57.991+00	2021-07-07 19:56:57.991+00
4232	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 20:00:06.684+00	2021-07-07 20:00:06.684+00
4233	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 20:12:22.045+00	2021-07-07 20:12:22.045+00
4234	127.0.0.1	sessions.store	/sessions	POST	67	2021-07-07 20:12:32.133+00	2021-07-07 20:12:32.133+00
4235	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-07 20:12:32.314+00	2021-07-07 20:12:32.314+00
4236	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-07 20:12:36.454+00	2021-07-07 20:12:36.454+00
4237	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-07 20:12:45.147+00	2021-07-07 20:12:45.147+00
4238	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 21:11:36.635+00	2021-07-07 21:11:36.635+00
4239	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-07 21:41:39.62+00	2021-07-07 21:41:39.62+00
4240	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-07 21:41:39.883+00	2021-07-07 21:41:39.883+00
4241	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-07 21:42:42.068+00	2021-07-07 21:42:42.068+00
4242	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-07 21:42:55.304+00	2021-07-07 21:42:55.304+00
4243	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 21:48:42.747+00	2021-07-07 21:48:42.747+00
4244	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 21:48:42.992+00	2021-07-07 21:48:42.992+00
4245	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-07 21:57:12.787+00	2021-07-07 21:57:12.787+00
4246	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	67	2021-07-07 21:57:19.519+00	2021-07-07 21:57:19.519+00
4247	127.0.0.1	admin.atividades.store	/admin/atividades	POST	67	2021-07-07 21:57:36.156+00	2021-07-07 21:57:36.156+00
4248	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-07 21:57:36.502+00	2021-07-07 21:57:36.502+00
4249	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-07 21:58:03.172+00	2021-07-07 21:58:03.172+00
4250	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-07 21:58:03.598+00	2021-07-07 21:58:03.598+00
4251	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-07 21:58:11.048+00	2021-07-07 21:58:11.048+00
4252	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-07 22:01:21.786+00	2021-07-07 22:01:21.786+00
4253	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-07 22:21:04.094+00	2021-07-07 22:21:04.094+00
4254	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-07-07 22:32:17.593+00	2021-07-07 22:32:17.593+00
4255	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-07 22:57:55.596+00	2021-07-07 22:57:55.596+00
4256	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-07 23:02:50.716+00	2021-07-07 23:02:50.716+00
4257	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-07 23:29:54.861+00	2021-07-07 23:29:54.861+00
4258	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 00:31:33.289+00	2021-07-08 00:31:33.289+00
4259	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 02:48:18.55+00	2021-07-08 02:48:18.55+00
4260	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 05:38:01.46+00	2021-07-08 05:38:01.46+00
4261	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 06:19:20.924+00	2021-07-08 06:19:20.924+00
4262	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 10:59:17.874+00	2021-07-08 10:59:17.874+00
4263	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 13:01:31.376+00	2021-07-08 13:01:31.376+00
4264	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 13:01:32.61+00	2021-07-08 13:01:32.61+00
4265	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-08 17:35:35.543+00	2021-07-08 17:35:35.543+00
4266	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-08 17:35:35.772+00	2021-07-08 17:35:35.772+00
4267	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 20:22:26.186+00	2021-07-08 20:22:26.186+00
4268	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 20:22:31.624+00	2021-07-08 20:22:31.624+00
4269	127.0.0.1	sessions.store	/sessions	POST	73	2021-07-08 20:22:37.51+00	2021-07-08 20:22:37.51+00
4270	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-08 20:22:37.731+00	2021-07-08 20:22:37.731+00
4271	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-08 20:22:41.828+00	2021-07-08 20:22:41.828+00
4272	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	73	2021-07-08 20:22:45.646+00	2021-07-08 20:22:45.646+00
4273	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-08 20:22:45.865+00	2021-07-08 20:22:45.865+00
4274	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-08 20:22:47.353+00	2021-07-08 20:22:47.353+00
4276	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-08 20:23:08.354+00	2021-07-08 20:23:08.354+00
4280	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-08 22:23:48.692+00	2021-07-08 22:23:48.692+00
4275	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-08 20:22:48.187+00	2021-07-08 20:22:48.187+00
4277	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-08 21:35:59.201+00	2021-07-08 21:35:59.201+00
4278	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-08 22:23:21.988+00	2021-07-08 22:23:21.988+00
4279	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-08 22:23:42.584+00	2021-07-08 22:23:42.584+00
4281	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-08 22:37:12.483+00	2021-07-08 22:37:12.483+00
4282	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-08 22:37:12.685+00	2021-07-08 22:37:12.685+00
4283	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-08 22:39:58.394+00	2021-07-08 22:39:58.394+00
4284	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-08 22:40:09.38+00	2021-07-08 22:40:09.38+00
4285	127.0.0.1	admin.users.create	/admin/users/create	GET	67	2021-07-08 22:40:19.783+00	2021-07-08 22:40:19.783+00
4286	127.0.0.1	admin.users.store	/admin/users	POST	67	2021-07-08 22:41:14.475+00	2021-07-08 22:41:14.475+00
4287	127.0.0.1	admin.users.create	/admin/users/create	GET	67	2021-07-08 22:41:14.691+00	2021-07-08 22:41:14.691+00
4288	127.0.0.1	admin.users.store	/admin/users	POST	67	2021-07-08 22:41:32.504+00	2021-07-08 22:41:32.504+00
4289	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-08 22:41:32.896+00	2021-07-08 22:41:32.896+00
4290	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-08 22:43:58.942+00	2021-07-08 22:43:58.942+00
4291	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-08 22:44:15.972+00	2021-07-08 22:44:15.972+00
4292	127.0.0.1	admin.users.edit	/admin/users/74/edit	GET	67	2021-07-08 22:44:22.726+00	2021-07-08 22:44:22.726+00
4293	127.0.0.1	admin.users.update	/admin/users/74	PUT	67	2021-07-08 22:44:55.131+00	2021-07-08 22:44:55.131+00
4294	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-08 22:44:55.347+00	2021-07-08 22:44:55.347+00
4295	127.0.0.1	admin.users.create	/admin/users/create	GET	67	2021-07-08 22:44:59.948+00	2021-07-08 22:44:59.948+00
4296	127.0.0.1	admin.users.store	/admin/users	POST	67	2021-07-08 22:46:08.277+00	2021-07-08 22:46:08.277+00
4297	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-08 22:46:08.782+00	2021-07-08 22:46:08.782+00
4298	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-08 22:46:43.617+00	2021-07-08 22:46:43.617+00
4299	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-08 22:46:44.121+00	2021-07-08 22:46:44.121+00
4300	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-08 22:51:28.413+00	2021-07-08 22:51:28.413+00
4301	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	67	2021-07-08 22:51:34.785+00	2021-07-08 22:51:34.785+00
4302	127.0.0.1	admin.atividades.store	/admin/atividades	POST	67	2021-07-08 22:52:11.182+00	2021-07-08 22:52:11.182+00
4303	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-08 22:52:11.693+00	2021-07-08 22:52:11.693+00
4304	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-08 22:52:24.506+00	2021-07-08 22:52:24.506+00
4305	127.0.0.1	admin.atividades.edit	/admin/atividades/50/edit	GET	67	2021-07-08 22:53:02.61+00	2021-07-08 22:53:02.61+00
4306	127.0.0.1	admin.atividades.edit	/admin/atividades/106/edit	GET	67	2021-07-08 22:53:24.524+00	2021-07-08 22:53:24.524+00
4307	127.0.0.1	admin.atividades.update	/admin/atividades/106	PUT	67	2021-07-08 22:57:31.603+00	2021-07-08 22:57:31.603+00
4308	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-08 22:57:32.503+00	2021-07-08 22:57:32.503+00
4309	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-08 22:58:56.162+00	2021-07-08 22:58:56.162+00
4310	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-08 22:58:56.371+00	2021-07-08 22:58:56.371+00
4311	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	67	2021-07-08 23:01:40.552+00	2021-07-08 23:01:40.552+00
4312	127.0.0.1	admin.atividades.store	/admin/atividades	POST	67	2021-07-08 23:01:57.208+00	2021-07-08 23:01:57.208+00
4313	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-08 23:01:57.421+00	2021-07-08 23:01:57.421+00
4314	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-08 23:02:15.865+00	2021-07-08 23:02:15.865+00
4315	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-08 23:02:16.151+00	2021-07-08 23:02:16.152+00
4316	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-08 23:04:35.949+00	2021-07-08 23:04:35.949+00
4317	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-08 23:12:11.384+00	2021-07-08 23:12:11.384+00
4318	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-08 23:18:50.629+00	2021-07-08 23:18:50.629+00
4319	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 00:51:51.969+00	2021-07-09 00:51:51.969+00
4320	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 01:03:37.566+00	2021-07-09 01:03:37.566+00
4321	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 03:09:12.759+00	2021-07-09 03:09:12.759+00
4322	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 06:28:37.327+00	2021-07-09 06:28:37.327+00
4323	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 06:28:37.484+00	2021-07-09 06:28:37.484+00
4324	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 07:36:29.966+00	2021-07-09 07:36:29.966+00
4325	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 07:37:44.996+00	2021-07-09 07:37:44.996+00
4326	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 11:22:29.967+00	2021-07-09 11:22:29.967+00
4327	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-09 11:56:54.346+00	2021-07-09 11:56:54.346+00
4328	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-09 11:56:54.596+00	2021-07-09 11:56:54.596+00
4329	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-09 13:20:42.442+00	2021-07-09 13:20:42.442+00
4330	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-09 13:22:25.717+00	2021-07-09 13:22:25.717+00
4331	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-09 14:01:34.364+00	2021-07-09 14:01:34.364+00
4332	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 14:29:25.247+00	2021-07-09 14:29:25.247+00
4333	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 14:30:23.078+00	2021-07-09 14:30:23.078+00
4334	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 14:50:44.905+00	2021-07-09 14:50:44.905+00
4335	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 15:46:51.355+00	2021-07-09 15:46:51.355+00
4336	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 16:53:00.722+00	2021-07-09 16:53:00.722+00
4337	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 19:35:07.822+00	2021-07-09 19:35:07.822+00
4338	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 21:49:39.737+00	2021-07-09 21:49:39.737+00
4339	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 23:50:26.024+00	2021-07-09 23:50:26.024+00
4340	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-09 23:50:26.237+00	2021-07-09 23:50:26.237+00
4341	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 01:49:20.768+00	2021-07-10 01:49:20.768+00
4342	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 01:55:02.511+00	2021-07-10 01:55:02.511+00
4343	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 07:06:15.348+00	2021-07-10 07:06:15.348+00
4344	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 07:40:10.059+00	2021-07-10 07:40:10.059+00
4345	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 09:33:23.856+00	2021-07-10 09:33:23.856+00
4346	2804:7f2:2a8c:1497:75f1:c701:cda4:c21c	sessions.index	/sessions	GET	\N	2021-07-10 09:46:19.938+00	2021-07-10 09:46:19.938+00
4347	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 09:56:49.189+00	2021-07-10 09:56:49.189+00
4348	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 11:01:56.571+00	2021-07-10 11:01:56.571+00
4349	127.0.0.1	sessions.store	/sessions	POST	34	2021-07-10 11:02:06.285+00	2021-07-10 11:02:06.286+00
4350	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:02:06.478+00	2021-07-10 11:02:06.478+00
4351	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-10 11:02:09.036+00	2021-07-10 11:02:09.036+00
4352	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-10 11:02:17.17+00	2021-07-10 11:02:17.17+00
4353	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 11:02:21.548+00	2021-07-10 11:02:21.548+00
4354	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:02:21.736+00	2021-07-10 11:02:21.736+00
4355	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:02:23.342+00	2021-07-10 11:02:23.342+00
4356	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:02:37.715+00	2021-07-10 11:02:37.715+00
4357	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:02:55.918+00	2021-07-10 11:02:55.918+00
4358	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 11:03:25.218+00	2021-07-10 11:03:25.218+00
4359	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 11:03:29.605+00	2021-07-10 11:03:29.605+00
4360	127.0.0.1	admin.rdos.show	/admin/rdos/53	GET	34	2021-07-10 11:03:53.921+00	2021-07-10 11:03:53.921+00
4361	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:04:30.645+00	2021-07-10 11:04:30.645+00
4362	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:04:31.752+00	2021-07-10 11:04:31.752+00
4363	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:04:49.235+00	2021-07-10 11:04:49.235+00
4364	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:08:23.272+00	2021-07-10 11:08:23.272+00
4365	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-10 11:21:49.522+00	2021-07-10 11:21:49.522+00
4366	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-10 11:21:57.078+00	2021-07-10 11:21:57.078+00
4367	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 11:21:59.119+00	2021-07-10 11:21:59.119+00
4368	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 11:22:02.491+00	2021-07-10 11:22:02.491+00
4369	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:24:16.755+00	2021-07-10 11:24:16.755+00
4370	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 11:24:19.018+00	2021-07-10 11:24:19.018+00
4371	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:24:21.669+00	2021-07-10 11:24:21.669+00
4372	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:24:27.999+00	2021-07-10 11:24:27.999+00
4373	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:33:04.627+00	2021-07-10 11:33:04.627+00
4374	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:33:29.253+00	2021-07-10 11:33:29.253+00
4375	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:35:33.914+00	2021-07-10 11:35:33.914+00
4376	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 11:36:45.631+00	2021-07-10 11:36:45.631+00
4377	127.0.0.1	admin.rdos.show	/admin/rdos/18	GET	34	2021-07-10 11:36:58.598+00	2021-07-10 11:36:58.598+00
4378	127.0.0.1	admin.rdos.show	/admin/rdos/19	GET	34	2021-07-10 11:37:12.661+00	2021-07-10 11:37:12.661+00
4379	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:39:37.62+00	2021-07-10 11:39:37.62+00
4380	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:39:38.935+00	2021-07-10 11:39:38.935+00
4381	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:39:50.338+00	2021-07-10 11:39:50.339+00
4382	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-10 11:42:46.662+00	2021-07-10 11:42:46.662+00
4383	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-10 11:43:02.499+00	2021-07-10 11:43:02.499+00
4384	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-10 11:43:02.71+00	2021-07-10 11:43:02.71+00
4385	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:43:04.75+00	2021-07-10 11:43:04.75+00
4386	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 11:43:06.652+00	2021-07-10 11:43:06.652+00
4387	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:43:11.298+00	2021-07-10 11:43:11.298+00
4388	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-10 11:43:12.757+00	2021-07-10 11:43:12.757+00
4389	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-10 11:43:21.476+00	2021-07-10 11:43:21.476+00
4390	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-10 11:43:30.258+00	2021-07-10 11:43:30.258+00
4391	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-10 11:43:35.816+00	2021-07-10 11:43:35.816+00
4392	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-10 11:43:36.005+00	2021-07-10 11:43:36.005+00
4393	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 11:43:37.619+00	2021-07-10 11:43:37.619+00
4394	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 11:44:07.353+00	2021-07-10 11:44:07.353+00
4395	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	34	2021-07-10 11:44:44.658+00	2021-07-10 11:44:44.658+00
4396	127.0.0.1	admin.rdos.edit	/admin/rdos/11/edit	GET	34	2021-07-10 11:44:59.391+00	2021-07-10 11:44:59.391+00
4397	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-10 12:13:04.732+00	2021-07-10 12:13:04.732+00
4398	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 12:13:06.219+00	2021-07-10 12:13:06.219+00
4399	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 12:13:17.145+00	2021-07-10 12:13:17.145+00
4400	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 12:13:37.538+00	2021-07-10 12:13:37.538+00
4401	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 12:15:03.868+00	2021-07-10 12:15:03.868+00
4402	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-10 12:15:32.864+00	2021-07-10 12:15:32.864+00
4403	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 12:15:51.019+00	2021-07-10 12:15:51.019+00
4404	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 12:16:30.588+00	2021-07-10 12:16:30.588+00
4405	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-10 12:16:41.781+00	2021-07-10 12:16:41.781+00
4406	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 12:48:25.485+00	2021-07-10 12:48:25.485+00
4407	127.0.0.1	sessions.store	/sessions	POST	67	2021-07-10 12:48:45.246+00	2021-07-10 12:48:45.247+00
4408	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-10 12:48:45.767+00	2021-07-10 12:48:45.767+00
4409	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 12:48:49.585+00	2021-07-10 12:48:49.585+00
4410	127.0.0.1	admin.rdos.show	/admin/rdos/17	GET	67	2021-07-10 13:00:43.73+00	2021-07-10 13:00:43.73+00
4411	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	67	2021-07-10 13:01:35.219+00	2021-07-10 13:01:35.219+00
4412	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	67	2021-07-10 13:14:08.922+00	2021-07-10 13:14:08.922+00
4413	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 13:17:37.898+00	2021-07-10 13:17:37.898+00
4414	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 13:31:14.339+00	2021-07-10 13:31:14.339+00
4415	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 13:31:19.895+00	2021-07-10 13:31:19.895+00
4416	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 13:31:27.256+00	2021-07-10 13:31:27.256+00
4417	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 13:31:36.358+00	2021-07-10 13:31:36.358+00
4418	127.0.0.1	admin.rdos.show	/admin/rdos/17	GET	67	2021-07-10 13:31:56.285+00	2021-07-10 13:31:56.285+00
4419	127.0.0.1	admin.rdos.show	/admin/rdos/18	GET	67	2021-07-10 14:09:16.543+00	2021-07-10 14:09:16.543+00
4420	127.0.0.1	admin.rdos.show	/admin/rdos/15	GET	67	2021-07-10 15:05:39.295+00	2021-07-10 15:05:39.295+00
4421	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	67	2021-07-10 15:06:23.354+00	2021-07-10 15:06:23.354+00
4422	127.0.0.1	admin.rdos.show	/admin/rdos/17	GET	67	2021-07-10 15:07:12.227+00	2021-07-10 15:07:12.227+00
4423	127.0.0.1	admin.rdos.show	/admin/rdos/15	GET	67	2021-07-10 15:07:58.132+00	2021-07-10 15:07:58.132+00
4424	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 16:00:00.967+00	2021-07-10 16:00:00.967+00
4425	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 17:34:05.607+00	2021-07-10 17:34:05.607+00
4426	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 17:34:06.08+00	2021-07-10 17:34:06.08+00
4427	127.0.0.1	admin.rdos.show	/admin/rdos/18	GET	67	2021-07-10 17:44:15.352+00	2021-07-10 17:44:15.352+00
4428	127.0.0.1	admin.rdos.show	/admin/rdos/14	GET	67	2021-07-10 17:52:42.166+00	2021-07-10 17:52:42.166+00
4429	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-10 18:02:04.965+00	2021-07-10 18:02:04.965+00
4430	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	67	2021-07-10 18:02:10.11+00	2021-07-10 18:02:10.11+00
4431	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 18:04:29.829+00	2021-07-10 18:04:29.829+00
4432	127.0.0.1	admin.rdos.show	/admin/rdos/14	GET	67	2021-07-10 18:04:36.749+00	2021-07-10 18:04:36.749+00
4433	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-10 18:07:27.41+00	2021-07-10 18:07:27.41+00
4434	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-10 18:07:39.102+00	2021-07-10 18:07:39.102+00
4435	127.0.0.1	admin.atividades.edit	/admin/atividades/106/edit	GET	67	2021-07-10 18:07:52.076+00	2021-07-10 18:07:52.076+00
4436	127.0.0.1	admin.atividades.destroy	/admin/atividades/106	DELETE	67	2021-07-10 18:08:01.561+00	2021-07-10 18:08:01.561+00
4437	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-10 18:08:01.746+00	2021-07-10 18:08:01.746+00
4438	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-10 18:10:56.393+00	2021-07-10 18:10:56.393+00
4439	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-10 18:10:56.631+00	2021-07-10 18:10:56.631+00
4440	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-10 18:11:38.946+00	2021-07-10 18:11:38.946+00
4441	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 18:11:56.094+00	2021-07-10 18:11:56.094+00
4442	127.0.0.1	admin.rdos.show	/admin/rdos/14	GET	67	2021-07-10 18:12:11.949+00	2021-07-10 18:12:11.949+00
4443	127.0.0.1	admin.rdos.show	/admin/rdos/19	GET	67	2021-07-10 18:15:24.584+00	2021-07-10 18:15:24.584+00
4444	127.0.0.1	admin.rdos.show	/admin/rdos/16	GET	67	2021-07-10 18:47:00.696+00	2021-07-10 18:47:00.696+00
4445	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 19:11:17.653+00	2021-07-10 19:11:17.653+00
4446	127.0.0.1	admin.rdos.show	/admin/rdos/20	GET	67	2021-07-10 19:39:40.891+00	2021-07-10 19:39:40.891+00
4447	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 20:12:50.493+00	2021-07-10 20:12:50.493+00
4448	127.0.0.1	admin.rdos.show	/admin/rdos/43	GET	67	2021-07-10 20:13:04.259+00	2021-07-10 20:13:04.259+00
4449	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 20:57:56.491+00	2021-07-10 20:57:56.491+00
4450	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 22:19:46.022+00	2021-07-10 22:19:46.022+00
4451	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 22:19:54.816+00	2021-07-10 22:19:54.816+00
4452	127.0.0.1	admin.rdos.show	/admin/rdos/46	GET	67	2021-07-10 22:20:06.763+00	2021-07-10 22:20:06.763+00
4453	127.0.0.1	admin.areas.index	/admin/areas	GET	67	2021-07-10 22:20:35.466+00	2021-07-10 22:20:35.466+00
4454	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	67	2021-07-10 22:20:37.775+00	2021-07-10 22:20:37.775+00
4455	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	67	2021-07-10 22:20:48.525+00	2021-07-10 22:20:48.525+00
4456	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	67	2021-07-10 22:21:06.299+00	2021-07-10 22:21:06.299+00
4457	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	67	2021-07-10 22:21:06.495+00	2021-07-10 22:21:06.495+00
4458	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 22:24:48.125+00	2021-07-10 22:24:48.125+00
4459	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-10 22:24:52.533+00	2021-07-10 22:24:52.533+00
4460	127.0.0.1	admin.rdos.show	/admin/rdos/46	GET	67	2021-07-10 22:25:08.615+00	2021-07-10 22:25:08.615+00
4461	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 22:46:27.459+00	2021-07-10 22:46:27.459+00
4462	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 23:31:22.88+00	2021-07-10 23:31:22.88+00
4463	127.0.0.1	sessions.store	/sessions	POST	33	2021-07-10 23:31:32.564+00	2021-07-10 23:31:32.564+00
4464	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-10 23:31:33.055+00	2021-07-10 23:31:33.055+00
4465	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-10 23:31:37.599+00	2021-07-10 23:31:37.599+00
4466	127.0.0.1	admin.rdos.show	/admin/rdos/22	GET	33	2021-07-10 23:31:53.978+00	2021-07-10 23:31:53.978+00
4467	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-10 23:32:11.034+00	2021-07-10 23:32:11.034+00
4468	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-10 23:32:11.294+00	2021-07-10 23:32:11.294+00
4469	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	33	2021-07-10 23:53:52.13+00	2021-07-10 23:53:52.13+00
4470	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-10 23:55:14.73+00	2021-07-10 23:55:14.73+00
4471	127.0.0.1	admin.rdos.show	/admin/rdos/24	GET	33	2021-07-11 00:37:12.71+00	2021-07-11 00:37:12.71+00
4472	127.0.0.1	admin.rdos.show	/admin/rdos/25	GET	33	2021-07-11 00:48:21.132+00	2021-07-11 00:48:21.132+00
4473	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 00:53:37.525+00	2021-07-11 00:53:37.525+00
4474	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-11 00:53:37.729+00	2021-07-11 00:53:37.729+00
4475	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-11 00:53:41.076+00	2021-07-11 00:53:41.076+00
4476	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-11 01:06:41.113+00	2021-07-11 01:06:41.113+00
4477	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 01:06:46.49+00	2021-07-11 01:06:46.49+00
4478	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-11 01:06:49.87+00	2021-07-11 01:06:49.87+00
4479	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-11 01:06:59.245+00	2021-07-11 01:06:59.245+00
4480	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 01:06:59.426+00	2021-07-11 01:06:59.426+00
4481	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-11 01:07:20.394+00	2021-07-11 01:07:20.394+00
4482	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-11 01:07:20.639+00	2021-07-11 01:07:20.639+00
4483	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-11 01:08:57.38+00	2021-07-11 01:08:57.38+00
4484	127.0.0.1	admin.rdos.show	/admin/rdos/25	GET	33	2021-07-11 01:09:15.188+00	2021-07-11 01:09:15.188+00
4485	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 01:09:43.695+00	2021-07-11 01:09:43.695+00
4486	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 01:10:02.677+00	2021-07-11 01:10:02.677+00
4487	127.0.0.1	admin.atividades.edit	/admin/atividades/108/edit	GET	33	2021-07-11 01:10:15.008+00	2021-07-11 01:10:15.008+00
4488	127.0.0.1	admin.atividades.update	/admin/atividades/108	PUT	33	2021-07-11 01:10:35.02+00	2021-07-11 01:10:35.02+00
4489	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 01:10:35.216+00	2021-07-11 01:10:35.216+00
4490	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-11 01:11:14.514+00	2021-07-11 01:11:14.514+00
4491	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-11 01:11:14.7+00	2021-07-11 01:11:14.7+00
4492	127.0.0.1	sessions.index	/sessions	HEAD	\N	2021-07-11 01:49:23.999+00	2021-07-11 01:49:23.999+00
4493	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 08:28:12.786+00	2021-07-11 08:28:12.786+00
4494	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-11 12:25:39.394+00	2021-07-11 12:25:39.394+00
4495	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-11 12:25:39.646+00	2021-07-11 12:25:39.646+00
4496	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-11 13:21:29.632+00	2021-07-11 13:21:29.632+00
4497	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-11 13:50:29.347+00	2021-07-11 13:50:29.347+00
4498	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-11 13:52:52.928+00	2021-07-11 13:52:52.928+00
4499	127.0.0.1	admin.rdos.show	/admin/rdos/26	GET	33	2021-07-11 13:53:16.008+00	2021-07-11 13:53:16.008+00
4500	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 14:02:24.118+00	2021-07-11 14:02:24.118+00
4501	127.0.0.1	admin.rdos.show	/admin/rdos/27	GET	33	2021-07-11 14:03:42.496+00	2021-07-11 14:03:42.496+00
4502	127.0.0.1	admin.rdos.show	/admin/rdos/28	GET	33	2021-07-11 14:15:23.493+00	2021-07-11 14:15:23.493+00
4503	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-11 14:20:06.097+00	2021-07-11 14:20:06.097+00
4504	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 14:20:17.449+00	2021-07-11 14:20:17.449+00
4505	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	67	2021-07-11 14:20:20.52+00	2021-07-11 14:20:20.52+00
4506	127.0.0.1	admin.atividades.store	/admin/atividades	POST	67	2021-07-11 14:20:35.784+00	2021-07-11 14:20:35.784+00
4507	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 14:20:36.181+00	2021-07-11 14:20:36.181+00
4508	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 14:20:44.626+00	2021-07-11 14:20:44.627+00
4509	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 14:20:57.232+00	2021-07-11 14:20:57.232+00
4510	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 14:21:07.192+00	2021-07-11 14:21:07.192+00
4511	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 14:21:22.122+00	2021-07-11 14:21:22.122+00
4512	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-11 14:21:51.886+00	2021-07-11 14:21:51.886+00
4513	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-11 14:21:52.115+00	2021-07-11 14:21:52.115+00
4514	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-11 14:35:28.073+00	2021-07-11 14:35:28.073+00
4515	127.0.0.1	admin.rdos.show	/admin/rdos/29	GET	33	2021-07-11 14:44:54.164+00	2021-07-11 14:44:54.164+00
4516	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 14:46:43.176+00	2021-07-11 14:46:43.176+00
4517	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 14:46:43.199+00	2021-07-11 14:46:43.199+00
4518	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-07-11 14:54:59.775+00	2021-07-11 14:54:59.775+00
4519	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 14:55:02.475+00	2021-07-11 14:55:02.475+00
4520	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-11 14:55:04.845+00	2021-07-11 14:55:04.845+00
4521	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-07-11 14:55:06.029+00	2021-07-11 14:55:06.029+00
4522	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-07-11 14:55:08.86+00	2021-07-11 14:55:08.86+00
4523	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-07-11 14:56:09.179+00	2021-07-11 14:56:09.179+00
4524	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-07-11 14:56:09.362+00	2021-07-11 14:56:09.362+00
4525	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/42/edit	GET	33	2021-07-11 14:56:19.281+00	2021-07-11 14:56:19.281+00
4526	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/42	PUT	33	2021-07-11 14:56:37.307+00	2021-07-11 14:56:37.307+00
4527	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/42/edit	GET	33	2021-07-11 14:56:37.996+00	2021-07-11 14:56:37.996+00
4528	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/42	PUT	33	2021-07-11 14:56:50.082+00	2021-07-11 14:56:50.082+00
4529	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-07-11 14:56:50.314+00	2021-07-11 14:56:50.314+00
4530	127.0.0.1	admin.equipamentos.edit	/admin/equipamentos/41/edit	GET	33	2021-07-11 14:56:57.941+00	2021-07-11 14:56:57.941+00
4531	127.0.0.1	admin.equipamentos.update	/admin/equipamentos/41	PUT	33	2021-07-11 14:57:14.282+00	2021-07-11 14:57:14.282+00
4532	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-07-11 14:57:15.143+00	2021-07-11 14:57:15.143+00
4533	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	33	2021-07-11 14:57:18.544+00	2021-07-11 14:57:18.544+00
4534	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	33	2021-07-11 14:57:30.585+00	2021-07-11 14:57:30.585+00
4535	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	33	2021-07-11 14:57:30.8+00	2021-07-11 14:57:30.8+00
4536	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-11 14:57:50.831+00	2021-07-11 14:57:50.831+00
4537	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-11 14:57:51.97+00	2021-07-11 14:57:51.97+00
4538	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-11 15:00:03.385+00	2021-07-11 15:00:03.385+00
4539	127.0.0.1	admin.rdos.show	/admin/rdos/31	GET	33	2021-07-11 15:00:18+00	2021-07-11 15:00:18+00
4540	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-11 15:13:27.402+00	2021-07-11 15:13:27.402+00
4541	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	33	2021-07-11 15:13:46.724+00	2021-07-11 15:13:46.724+00
4542	127.0.0.1	admin.rdos.show	/admin/rdos/32	GET	33	2021-07-11 15:14:30.069+00	2021-07-11 15:14:30.069+00
4543	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 15:30:13.831+00	2021-07-11 15:30:13.831+00
4544	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 15:30:14.104+00	2021-07-11 15:30:14.104+00
4545	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-11 15:33:30.289+00	2021-07-11 15:33:30.289+00
4546	127.0.0.1	admin.rdos.show	/admin/rdos/33	GET	33	2021-07-11 15:33:37.947+00	2021-07-11 15:33:37.947+00
4547	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-11 15:36:45.676+00	2021-07-11 15:36:45.676+00
4548	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	67	2021-07-11 15:37:27.764+00	2021-07-11 15:37:27.764+00
4549	127.0.0.1	admin.atividades.store	/admin/atividades	POST	67	2021-07-11 15:37:42.455+00	2021-07-11 15:37:42.455+00
4550	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 15:37:42.761+00	2021-07-11 15:37:42.761+00
4551	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-11 15:37:58.026+00	2021-07-11 15:37:58.026+00
4552	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-11 15:37:58.291+00	2021-07-11 15:37:58.291+00
4553	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 15:39:06.608+00	2021-07-11 15:39:06.608+00
4554	127.0.0.1	admin.atividades.edit	/admin/atividades/39/edit	GET	67	2021-07-11 15:39:11.127+00	2021-07-11 15:39:11.128+00
4555	127.0.0.1	admin.atividades.update	/admin/atividades/39	PUT	67	2021-07-11 15:39:19.808+00	2021-07-11 15:39:19.808+00
4556	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-11 15:39:20.127+00	2021-07-11 15:39:20.127+00
4557	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-11 15:39:31.108+00	2021-07-11 15:39:31.108+00
4558	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-11 15:39:31.459+00	2021-07-11 15:39:31.459+00
4559	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-11 15:43:12.778+00	2021-07-11 15:43:12.778+00
4560	127.0.0.1	admin.rdos.show	/admin/rdos/34	GET	33	2021-07-11 15:43:19.349+00	2021-07-11 15:43:19.349+00
4561	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 17:06:35.186+00	2021-07-11 17:06:35.186+00
4562	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-11 17:06:35.375+00	2021-07-11 17:06:35.375+00
4563	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-11 17:06:45.126+00	2021-07-11 17:06:45.126+00
4564	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-11 17:06:47.056+00	2021-07-11 17:06:47.056+00
4565	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-11 17:06:54.868+00	2021-07-11 17:06:54.868+00
4566	127.0.0.1	admin.sessions.destroy	/sessions	DELETE	34	2021-07-11 17:06:59.015+00	2021-07-11 17:06:59.015+00
4567	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 17:06:59.189+00	2021-07-11 17:06:59.189+00
4568	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 17:07:08.521+00	2021-07-11 17:07:08.521+00
4569	127.0.0.1	sessions.store	/sessions	POST	1	2021-07-11 17:07:18.569+00	2021-07-11 17:07:18.569+00
4570	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-11 17:07:18.744+00	2021-07-11 17:07:18.744+00
4571	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-11 17:07:20.85+00	2021-07-11 17:07:20.85+00
4572	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-11 17:07:28.668+00	2021-07-11 17:07:28.668+00
4573	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:07:35.492+00	2021-07-11 17:07:35.492+00
4574	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-11 17:07:38.871+00	2021-07-11 17:07:38.871+00
4575	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:07:40.199+00	2021-07-11 17:07:40.199+00
4576	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-11 17:07:44.331+00	2021-07-11 17:07:44.331+00
4577	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:07:44.507+00	2021-07-11 17:07:44.507+00
4578	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	1	2021-07-11 17:07:45.937+00	2021-07-11 17:07:45.937+00
4579	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-11 17:07:47.388+00	2021-07-11 17:07:47.388+00
4580	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	1	2021-07-11 17:07:54.698+00	2021-07-11 17:07:54.698+00
4581	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:07:59.39+00	2021-07-11 17:07:59.39+00
4582	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-07-11 17:08:01.884+00	2021-07-11 17:08:01.884+00
4583	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:08:03.091+00	2021-07-11 17:08:03.091+00
4584	127.0.0.1	admin.cargos.edit	/admin/cargos/34/edit	GET	1	2021-07-11 17:08:06.217+00	2021-07-11 17:08:06.217+00
4585	127.0.0.1	admin.cargos.edit	/admin/cargos/37/edit	GET	1	2021-07-11 17:08:10.95+00	2021-07-11 17:08:10.95+00
4586	127.0.0.1	admin.cargos.edit	/admin/cargos/35/edit	GET	1	2021-07-11 17:08:16.196+00	2021-07-11 17:08:16.196+00
4587	127.0.0.1	admin.cargos.edit	/admin/cargos/29/edit	GET	1	2021-07-11 17:08:21.568+00	2021-07-11 17:08:21.568+00
4588	127.0.0.1	admin.cargos.edit	/admin/cargos/32/edit	GET	1	2021-07-11 17:08:25.967+00	2021-07-11 17:08:25.967+00
4589	127.0.0.1	admin.cargos.edit	/admin/cargos/34/edit	GET	1	2021-07-11 17:08:31.652+00	2021-07-11 17:08:31.652+00
4590	127.0.0.1	admin.cargos.update	/admin/cargos/34	PUT	1	2021-07-11 17:08:44.104+00	2021-07-11 17:08:44.104+00
4591	127.0.0.1	admin.cargos.edit	/admin/cargos/34/edit	GET	1	2021-07-11 17:08:44.29+00	2021-07-11 17:08:44.29+00
4592	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:08:48.315+00	2021-07-11 17:08:48.315+00
4593	127.0.0.1	admin.cargos.edit	/admin/cargos/31/edit	GET	1	2021-07-11 17:08:50.624+00	2021-07-11 17:08:50.624+00
4594	127.0.0.1	admin.cargos.edit	/admin/cargos/30/edit	GET	1	2021-07-11 17:08:56.176+00	2021-07-11 17:08:56.176+00
4595	127.0.0.1	admin.cargos.edit	/admin/cargos/28/edit	GET	1	2021-07-11 17:09:00.53+00	2021-07-11 17:09:00.53+00
4596	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:09:09.917+00	2021-07-11 17:09:09.917+00
4597	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-11 17:09:14.694+00	2021-07-11 17:09:14.694+00
4598	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-11 17:09:33.807+00	2021-07-11 17:09:33.807+00
4599	127.0.0.1	admin.users.edit	/admin/users/34/edit	GET	1	2021-07-11 17:10:15.181+00	2021-07-11 17:10:15.181+00
4600	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:10:20.531+00	2021-07-11 17:10:20.531+00
4601	127.0.0.1	admin.cargos.edit	/admin/cargos/37/edit	GET	1	2021-07-11 17:10:23.008+00	2021-07-11 17:10:23.008+00
4602	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-07-11 17:10:28.056+00	2021-07-11 17:10:28.056+00
4603	127.0.0.1	admin.atividades.edit	/admin/atividades/26/edit	GET	1	2021-07-11 17:10:38.407+00	2021-07-11 17:10:38.407+00
4604	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-11 17:12:09.255+00	2021-07-11 17:12:09.255+00
4605	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-11 17:13:05.346+00	2021-07-11 17:13:05.346+00
4606	127.0.0.1	admin.users.edit	/admin/users/71/edit	GET	1	2021-07-11 17:14:47.456+00	2021-07-11 17:14:47.456+00
4607	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-07-11 17:15:00.278+00	2021-07-11 17:15:00.278+00
4608	127.0.0.1	admin.contratos.edit	/admin/contratos/1/edit	GET	1	2021-07-11 17:15:02.938+00	2021-07-11 17:15:02.938+00
4609	127.0.0.1	admin.contratos.create	/admin/contratos/create	GET	1	2021-07-11 17:15:19.468+00	2021-07-11 17:15:19.468+00
4610	127.0.0.1	admin.contratos.create	/admin/contratos/create	GET	1	2021-07-11 17:15:32.256+00	2021-07-11 17:15:32.256+00
4611	127.0.0.1	admin.contratos.store	/admin/contratos	POST	1	2021-07-11 17:15:50.176+00	2021-07-11 17:15:50.176+00
4612	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-07-11 17:15:50.358+00	2021-07-11 17:15:50.358+00
4613	127.0.0.1	admin.contratos.edit	/admin/contratos/3/edit	GET	1	2021-07-11 17:16:08.557+00	2021-07-11 17:16:08.557+00
4614	127.0.0.1	admin.contratos.update	/admin/contratos/3	PUT	1	2021-07-11 17:16:15.599+00	2021-07-11 17:16:15.599+00
4615	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-07-11 17:16:15.777+00	2021-07-11 17:16:15.777+00
4616	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:16:26.697+00	2021-07-11 17:16:26.697+00
4617	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-11 17:16:31.927+00	2021-07-11 17:16:31.927+00
4618	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:16:32.101+00	2021-07-11 17:16:32.101+00
4619	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-11 17:16:34.678+00	2021-07-11 17:16:34.678+00
4620	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:16:34.854+00	2021-07-11 17:16:34.854+00
4621	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:16:37.902+00	2021-07-11 17:16:37.902+00
4622	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-07-11 17:16:40.145+00	2021-07-11 17:16:40.145+00
4623	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-07-11 17:16:50.278+00	2021-07-11 17:16:50.278+00
4624	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:16:50.487+00	2021-07-11 17:16:50.487+00
4625	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-07-11 17:16:53.001+00	2021-07-11 17:16:53.001+00
4626	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-07-11 17:16:58.723+00	2021-07-11 17:16:58.723+00
4627	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:16:58.944+00	2021-07-11 17:16:58.944+00
4628	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-07-11 17:17:00.613+00	2021-07-11 17:17:00.613+00
4629	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-07-11 17:17:08.518+00	2021-07-11 17:17:08.518+00
4630	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:17:08.741+00	2021-07-11 17:17:08.741+00
4631	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-07-11 17:17:10.019+00	2021-07-11 17:17:10.019+00
4632	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-07-11 17:17:19.427+00	2021-07-11 17:17:19.427+00
4633	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:17:19.635+00	2021-07-11 17:17:19.635+00
4634	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-07-11 17:17:21.2+00	2021-07-11 17:17:21.2+00
4635	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-07-11 17:17:27.124+00	2021-07-11 17:17:27.124+00
4636	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:17:27.332+00	2021-07-11 17:17:27.332+00
4637	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-07-11 17:17:30.924+00	2021-07-11 17:17:30.924+00
4638	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-07-11 17:17:43.143+00	2021-07-11 17:17:43.143+00
4639	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:17:43.345+00	2021-07-11 17:17:43.345+00
4640	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	1	2021-07-11 17:17:46.903+00	2021-07-11 17:17:46.903+00
4641	127.0.0.1	admin.cargos.store	/admin/cargos	POST	1	2021-07-11 17:17:58.542+00	2021-07-11 17:17:58.542+00
4642	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:17:58.742+00	2021-07-11 17:17:58.742+00
4643	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-07-11 17:18:09.32+00	2021-07-11 17:18:09.32+00
4644	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-07-11 17:18:11.363+00	2021-07-11 17:18:11.363+00
4645	127.0.0.1	admin.areas.complexos.create	/admin/areas/complexos/create	GET	1	2021-07-11 17:18:14.481+00	2021-07-11 17:18:14.481+00
4646	127.0.0.1	admin.areas.complexos.store	/admin/areas/complexos	POST	1	2021-07-11 17:18:21.907+00	2021-07-11 17:18:21.907+00
4647	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-07-11 17:18:22.085+00	2021-07-11 17:18:22.085+00
4648	127.0.0.1	admin.cargos.index	/admin/cargos	GET	1	2021-07-11 17:18:23.735+00	2021-07-11 17:18:23.735+00
4649	127.0.0.1	admin.areas.index	/admin/areas	GET	1	2021-07-11 17:18:27.958+00	2021-07-11 17:18:27.958+00
4650	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	1	2021-07-11 17:18:29.313+00	2021-07-11 17:18:29.313+00
4651	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-07-11 17:18:31.137+00	2021-07-11 17:18:31.137+00
4652	127.0.0.1	admin.areas.minas.create	/admin/areas/minas/create	GET	1	2021-07-11 17:18:33.09+00	2021-07-11 17:18:33.09+00
4653	127.0.0.1	admin.areas.minas.store	/admin/areas/minas	POST	1	2021-07-11 17:18:41.815+00	2021-07-11 17:18:41.815+00
4654	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	1	2021-07-11 17:18:41.998+00	2021-07-11 17:18:41.998+00
4655	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-07-11 17:18:43.106+00	2021-07-11 17:18:43.106+00
4656	127.0.0.1	admin.areas.estruturas.create	/admin/areas/estruturas/create	GET	1	2021-07-11 17:18:45.007+00	2021-07-11 17:18:45.007+00
4657	127.0.0.1	admin.areas.estruturas.store	/admin/areas/estruturas	POST	1	2021-07-11 17:18:54.757+00	2021-07-11 17:18:54.757+00
4658	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	1	2021-07-11 17:18:54.946+00	2021-07-11 17:18:54.946+00
4659	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-07-11 17:19:03.79+00	2021-07-11 17:19:03.79+00
4660	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:19:17.104+00	2021-07-11 17:19:17.104+00
4661	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-11 17:19:21.256+00	2021-07-11 17:19:21.256+00
4662	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:19:21.433+00	2021-07-11 17:19:21.433+00
4663	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-07-11 17:19:23.046+00	2021-07-11 17:19:23.046+00
4664	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:19:26.697+00	2021-07-11 17:19:26.697+00
4665	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	1	2021-07-11 17:19:30.393+00	2021-07-11 17:19:30.393+00
4666	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:19:30.563+00	2021-07-11 17:19:30.563+00
4667	127.0.0.1	admin.atividades.index	/admin/atividades	GET	1	2021-07-11 17:19:32.346+00	2021-07-11 17:19:32.346+00
4668	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-07-11 17:19:43.343+00	2021-07-11 17:19:43.343+00
4669	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-07-11 17:20:01.427+00	2021-07-11 17:20:01.427+00
4670	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-07-11 17:20:02.861+00	2021-07-11 17:20:02.861+00
4671	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	1	2021-07-11 17:20:22.104+00	2021-07-11 17:20:22.104+00
4672	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-07-11 17:20:22.281+00	2021-07-11 17:20:22.281+00
4673	127.0.0.1	admin.equipamentos.create	/admin/equipamentos/create	GET	1	2021-07-11 17:20:24.284+00	2021-07-11 17:20:24.284+00
4674	127.0.0.1	admin.equipamentos.store	/admin/equipamentos	POST	1	2021-07-11 17:20:33.85+00	2021-07-11 17:20:33.85+00
4675	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	1	2021-07-11 17:20:34.032+00	2021-07-11 17:20:34.032+00
4676	127.0.0.1	admin.users.index	/admin/users	GET	1	2021-07-11 17:20:39.347+00	2021-07-11 17:20:39.347+00
4677	127.0.0.1	admin.users.create	/admin/users/create	GET	1	2021-07-11 17:20:41.354+00	2021-07-11 17:20:41.354+00
4678	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-11 17:20:55.96+00	2021-07-11 17:20:55.96+00
4679	127.0.0.1	admin.rdos.show	/admin/rdos/23	GET	1	2021-07-11 17:21:09.747+00	2021-07-11 17:21:09.747+00
4680	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	1	2021-07-11 17:21:29.458+00	2021-07-11 17:21:29.458+00
4681	127.0.0.1	admin.rdos.index	/admin/rdos	GET	1	2021-07-11 17:21:36.779+00	2021-07-11 17:21:36.779+00
4682	127.0.0.1	admin.contratos.index	/admin/contratos	GET	1	2021-07-11 17:21:41.332+00	2021-07-11 17:21:41.332+00
4683	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 18:11:31.719+00	2021-07-11 18:11:31.719+00
4684	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-11 20:49:59.697+00	2021-07-11 20:49:59.697+00
4685	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-11 20:49:59.894+00	2021-07-11 20:49:59.894+00
4686	127.0.0.1	admin.rdos.show	/admin/rdos/35	GET	33	2021-07-11 21:00:05.29+00	2021-07-11 21:00:05.29+00
4687	127.0.0.1	admin.rdos.show	/admin/rdos/37	GET	33	2021-07-11 21:11:42.92+00	2021-07-11 21:11:42.92+00
4688	127.0.0.1	admin.rdos.show	/admin/rdos/38	GET	33	2021-07-11 21:17:07.798+00	2021-07-11 21:17:07.798+00
4689	127.0.0.1	admin.rdos.show	/admin/rdos/40	GET	33	2021-07-11 21:27:10.947+00	2021-07-11 21:27:10.947+00
4690	127.0.0.1	admin.rdos.show	/admin/rdos/41	GET	33	2021-07-11 21:48:15.548+00	2021-07-11 21:48:15.548+00
4691	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-11 22:02:57.828+00	2021-07-11 22:02:57.828+00
4692	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 22:16:12.442+00	2021-07-11 22:16:12.442+00
4693	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 22:30:19.377+00	2021-07-11 22:30:19.377+00
4694	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 22:40:32.704+00	2021-07-11 22:40:32.704+00
4695	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 22:42:34.928+00	2021-07-11 22:42:34.928+00
4696	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 23:05:47.487+00	2021-07-11 23:05:47.487+00
4697	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 23:20:47.117+00	2021-07-11 23:20:47.117+00
4698	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 23:25:30.282+00	2021-07-11 23:25:30.282+00
4699	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-11 23:25:33.743+00	2021-07-11 23:25:33.743+00
4700	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-11 23:26:01.325+00	2021-07-11 23:26:01.325+00
4701	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 23:26:01.515+00	2021-07-11 23:26:01.515+00
4702	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-11 23:27:11.094+00	2021-07-11 23:27:11.094+00
4703	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-11 23:27:31.313+00	2021-07-11 23:27:31.313+00
4704	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 23:27:31.52+00	2021-07-11 23:27:31.52+00
4705	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-11 23:29:06.959+00	2021-07-11 23:29:06.959+00
4706	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-11 23:29:20.21+00	2021-07-11 23:29:20.21+00
4707	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 23:29:20.401+00	2021-07-11 23:29:20.401+00
4708	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 23:30:39.291+00	2021-07-11 23:30:39.291+00
4709	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-11 23:31:00.463+00	2021-07-11 23:31:00.463+00
4710	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-11 23:31:00.652+00	2021-07-11 23:31:00.652+00
4711	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	33	2021-07-11 23:31:33.074+00	2021-07-11 23:31:33.074+00
4712	127.0.0.1	admin.atividades.store	/admin/atividades	POST	33	2021-07-11 23:32:13.628+00	2021-07-11 23:32:13.628+00
4713	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-11 23:32:13.828+00	2021-07-11 23:32:13.828+00
4714	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-11 23:38:28.665+00	2021-07-11 23:38:28.665+00
4715	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 00:16:11.431+00	2021-07-12 00:16:11.431+00
4716	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-12 00:16:11.713+00	2021-07-12 00:16:11.713+00
4717	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-12 00:21:14.657+00	2021-07-12 00:21:14.657+00
4718	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-12 00:21:18.985+00	2021-07-12 00:21:18.985+00
4719	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-07-12 00:21:22.137+00	2021-07-12 00:21:22.137+00
4720	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 00:21:43.195+00	2021-07-12 00:21:43.195+00
4721	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-12 00:21:44.233+00	2021-07-12 00:21:44.233+00
4722	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-12 00:21:49.8+00	2021-07-12 00:21:49.8+00
4723	127.0.0.1	admin.users.create	/admin/users/create	GET	33	2021-07-12 00:21:52.57+00	2021-07-12 00:21:52.57+00
4724	127.0.0.1	admin.users.store	/admin/users	POST	33	2021-07-12 00:22:52.33+00	2021-07-12 00:22:52.33+00
4725	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-12 00:22:52.514+00	2021-07-12 00:22:52.514+00
4726	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 00:23:23.137+00	2021-07-12 00:23:23.137+00
4727	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-12 00:23:23.366+00	2021-07-12 00:23:23.366+00
4728	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 00:23:37.429+00	2021-07-12 00:23:37.429+00
4729	127.0.0.1	admin.users.edit	/admin/users/72/edit	GET	33	2021-07-12 00:24:36.32+00	2021-07-12 00:24:36.32+00
4730	127.0.0.1	admin.users.update	/admin/users/72	PUT	33	2021-07-12 00:24:54.553+00	2021-07-12 00:24:54.553+00
4731	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-12 00:24:54.97+00	2021-07-12 00:24:54.97+00
4732	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 00:41:41.623+00	2021-07-12 00:41:41.623+00
4733	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-12 00:41:41.944+00	2021-07-12 00:41:41.944+00
4734	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 00:49:00.714+00	2021-07-12 00:49:00.714+00
4735	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 00:51:23.825+00	2021-07-12 00:51:23.825+00
4736	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-07-12 01:07:10.506+00	2021-07-12 01:07:10.506+00
4737	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-07-12 01:07:14.052+00	2021-07-12 01:07:14.052+00
4738	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	33	2021-07-12 01:07:20.375+00	2021-07-12 01:07:20.375+00
4739	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	33	2021-07-12 01:07:31.829+00	2021-07-12 01:07:31.829+00
4740	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-07-12 01:07:32.184+00	2021-07-12 01:07:32.184+00
4741	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 01:09:40.29+00	2021-07-12 01:09:40.29+00
4742	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-12 01:09:40.662+00	2021-07-12 01:09:40.662+00
4743	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 04:33:17.401+00	2021-07-12 04:33:17.401+00
4744	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 04:41:22.555+00	2021-07-12 04:41:22.555+00
4745	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 05:59:19.59+00	2021-07-12 05:59:19.59+00
4746	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 05:59:19.798+00	2021-07-12 05:59:19.798+00
4747	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-12 09:35:34.51+00	2021-07-12 09:35:34.51+00
4748	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-12 09:35:34.755+00	2021-07-12 09:35:34.755+00
4749	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:48:49.045+00	2021-07-12 09:48:49.045+00
4750	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 09:49:09.517+00	2021-07-12 09:49:09.517+00
4751	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:49:19.218+00	2021-07-12 09:49:19.218+00
4752	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:49:25.679+00	2021-07-12 09:49:25.679+00
4753	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:49:34.996+00	2021-07-12 09:49:34.996+00
4754	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:49:37.636+00	2021-07-12 09:49:37.636+00
4755	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:49:43.373+00	2021-07-12 09:49:43.373+00
4756	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:49:47.176+00	2021-07-12 09:49:47.176+00
4757	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:49:50.396+00	2021-07-12 09:49:50.396+00
4759	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:49:58.152+00	2021-07-12 09:49:58.152+00
4760	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:50:04.506+00	2021-07-12 09:50:04.506+00
4767	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:50:54.202+00	2021-07-12 09:50:54.202+00
4768	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:50:59.673+00	2021-07-12 09:50:59.673+00
4770	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:51:06.583+00	2021-07-12 09:51:06.583+00
4772	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:51:30.518+00	2021-07-12 09:51:30.518+00
4773	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:51:36.343+00	2021-07-12 09:51:36.343+00
4774	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:51:40.418+00	2021-07-12 09:51:40.418+00
4778	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:51:57.876+00	2021-07-12 09:51:57.876+00
4784	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:52:24.673+00	2021-07-12 09:52:24.673+00
4758	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:49:53.145+00	2021-07-12 09:49:53.145+00
4763	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:50:29.565+00	2021-07-12 09:50:29.565+00
4764	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:50:34.949+00	2021-07-12 09:50:34.949+00
4766	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:50:45.323+00	2021-07-12 09:50:45.323+00
4771	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:51:19.8+00	2021-07-12 09:51:19.8+00
4777	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:51:52.452+00	2021-07-12 09:51:52.452+00
4761	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:50:09.501+00	2021-07-12 09:50:09.501+00
4762	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:50:11.955+00	2021-07-12 09:50:11.955+00
4776	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:51:48.849+00	2021-07-12 09:51:48.849+00
4785	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:52:30.503+00	2021-07-12 09:52:30.503+00
4765	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:50:43.399+00	2021-07-12 09:50:43.399+00
4769	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:51:04.008+00	2021-07-12 09:51:04.008+00
4775	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:51:45.234+00	2021-07-12 09:51:45.234+00
4779	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:52:04.564+00	2021-07-12 09:52:04.564+00
4780	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:52:08.944+00	2021-07-12 09:52:08.944+00
4781	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:52:12.065+00	2021-07-12 09:52:12.065+00
4782	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:52:18.248+00	2021-07-12 09:52:18.248+00
4783	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:52:20.822+00	2021-07-12 09:52:20.822+00
4786	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:52:33.168+00	2021-07-12 09:52:33.168+00
4787	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:52:38.601+00	2021-07-12 09:52:38.601+00
4788	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:52:46.402+00	2021-07-12 09:52:46.402+00
4789	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:53:24.745+00	2021-07-12 09:53:24.745+00
4790	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:53:43.114+00	2021-07-12 09:53:43.115+00
4791	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:53:46.734+00	2021-07-12 09:53:46.734+00
4792	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:54:07.163+00	2021-07-12 09:54:07.163+00
4793	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:54:10.903+00	2021-07-12 09:54:10.903+00
4794	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:54:18.713+00	2021-07-12 09:54:18.713+00
4795	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:54:25.46+00	2021-07-12 09:54:25.46+00
4796	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:54:31.604+00	2021-07-12 09:54:31.604+00
4797	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:54:43.8+00	2021-07-12 09:54:43.8+00
4798	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:54:51.693+00	2021-07-12 09:54:51.693+00
4799	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:54:54.136+00	2021-07-12 09:54:54.136+00
4800	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:54:57.651+00	2021-07-12 09:54:57.651+00
4801	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:55:22.691+00	2021-07-12 09:55:22.691+00
4802	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:55:39.26+00	2021-07-12 09:55:39.26+00
4803	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:55:45.564+00	2021-07-12 09:55:45.564+00
4804	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 09:55:49.873+00	2021-07-12 09:55:49.873+00
4805	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 09:55:54.545+00	2021-07-12 09:55:54.545+00
4806	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-12 09:57:25.421+00	2021-07-12 09:57:25.421+00
4807	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-12 09:57:31.895+00	2021-07-12 09:57:31.895+00
4808	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 11:02:19.555+00	2021-07-12 11:02:19.555+00
4809	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 11:04:17.625+00	2021-07-12 11:04:17.625+00
4810	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 11:54:23.782+00	2021-07-12 11:54:23.783+00
4811	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 13:01:53.102+00	2021-07-12 13:01:53.102+00
4812	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 14:11:39.766+00	2021-07-12 14:11:39.766+00
4813	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 14:26:00.808+00	2021-07-12 14:26:00.808+00
4814	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 14:30:44.392+00	2021-07-12 14:30:44.392+00
4815	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 16:02:20.939+00	2021-07-12 16:02:20.939+00
4816	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-12 16:35:05.271+00	2021-07-12 16:35:05.271+00
4817	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-12 17:01:08.201+00	2021-07-12 17:01:08.201+00
4818	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 17:18:56.759+00	2021-07-12 17:18:56.759+00
4819	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 17:42:09.215+00	2021-07-12 17:42:09.215+00
4820	127.0.0.1	sessions.store	/sessions	POST	73	2021-07-12 17:42:17.878+00	2021-07-12 17:42:17.878+00
4821	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-12 17:42:18.25+00	2021-07-12 17:42:18.25+00
4822	127.0.0.1	sessions.store	/sessions	POST	73	2021-07-12 17:42:19.571+00	2021-07-12 17:42:19.571+00
4823	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-12 17:42:19.905+00	2021-07-12 17:42:19.905+00
4824	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:42:22.569+00	2021-07-12 17:42:22.569+00
4825	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	73	2021-07-12 17:42:27.988+00	2021-07-12 17:42:27.988+00
4826	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:42:28.193+00	2021-07-12 17:42:28.193+00
4827	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:42:32.942+00	2021-07-12 17:42:32.942+00
4828	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:42:36.36+00	2021-07-12 17:42:36.36+00
4829	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:42:39.445+00	2021-07-12 17:42:39.445+00
4830	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:42:41.887+00	2021-07-12 17:42:41.887+00
4831	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:42:45.393+00	2021-07-12 17:42:45.393+00
4832	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:47:07.911+00	2021-07-12 17:47:07.911+00
4833	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	73	2021-07-12 17:47:12.241+00	2021-07-12 17:47:12.241+00
4834	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:47:12.482+00	2021-07-12 17:47:12.482+00
4835	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:47:13.802+00	2021-07-12 17:47:13.802+00
4836	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:47:19.405+00	2021-07-12 17:47:19.405+00
4837	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:47:22.548+00	2021-07-12 17:47:22.548+00
4838	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:47:25.439+00	2021-07-12 17:47:25.439+00
4839	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:47:27.718+00	2021-07-12 17:47:27.718+00
4840	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	73	2021-07-12 17:47:32.847+00	2021-07-12 17:47:32.847+00
4841	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:47:33.069+00	2021-07-12 17:47:33.069+00
4842	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:47:34.486+00	2021-07-12 17:47:34.486+00
4843	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:47:43.972+00	2021-07-12 17:47:43.972+00
4844	127.0.0.1	admin.contratos.index	/admin/contratos	GET	73	2021-07-12 17:47:50.933+00	2021-07-12 17:47:50.933+00
4845	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:48:01.288+00	2021-07-12 17:48:01.288+00
4846	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:48:03.918+00	2021-07-12 17:48:03.918+00
4847	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:48:18.962+00	2021-07-12 17:48:18.962+00
4848	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	73	2021-07-12 17:48:23.357+00	2021-07-12 17:48:23.357+00
4849	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:48:24.038+00	2021-07-12 17:48:24.038+00
4850	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 17:48:26.775+00	2021-07-12 17:48:26.775+00
4851	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 17:48:29.582+00	2021-07-12 17:48:29.582+00
4852	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-12 18:44:21.241+00	2021-07-12 18:44:21.241+00
4853	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 19:09:36.54+00	2021-07-12 19:09:36.54+00
4854	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 19:11:50.823+00	2021-07-12 19:11:50.823+00
4855	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 19:11:58.003+00	2021-07-12 19:11:58.003+00
4856	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	73	2021-07-12 19:12:04.135+00	2021-07-12 19:12:04.135+00
4857	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-12 19:12:04.367+00	2021-07-12 19:12:04.367+00
4858	127.0.0.1	admin.rdos.index	/admin/rdos	GET	73	2021-07-12 19:12:07.811+00	2021-07-12 19:12:07.811+00
4859	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-12 19:12:10.561+00	2021-07-12 19:12:10.561+00
4860	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	73	2021-07-12 19:12:12.633+00	2021-07-12 19:12:12.633+00
4861	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	73	2021-07-12 19:12:46.04+00	2021-07-12 19:12:46.04+00
4862	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	73	2021-07-12 19:16:11.276+00	2021-07-12 19:16:11.276+00
4863	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-12 19:16:53.234+00	2021-07-12 19:16:53.234+00
4864	127.0.0.1	admin.ajuda.index	/admin/ajuda	GET	73	2021-07-12 19:17:13.357+00	2021-07-12 19:17:13.357+00
4865	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	73	2021-07-12 19:17:37.315+00	2021-07-12 19:17:37.315+00
4866	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 19:21:59.448+00	2021-07-12 19:21:59.448+00
4867	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 19:22:11.136+00	2021-07-12 19:22:11.136+00
4868	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 19:22:30.538+00	2021-07-12 19:22:30.538+00
4869	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 19:22:32.04+00	2021-07-12 19:22:32.04+00
4870	127.0.0.1	sessions.store	/sessions	POST	34	2021-07-12 19:22:45.954+00	2021-07-12 19:22:45.954+00
4871	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 19:22:46.116+00	2021-07-12 19:22:46.116+00
4872	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:22:48.402+00	2021-07-12 19:22:48.402+00
4873	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:22:56.489+00	2021-07-12 19:22:56.489+00
4874	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:23:03.604+00	2021-07-12 19:23:03.605+00
4875	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:23:10.827+00	2021-07-12 19:23:10.827+00
4876	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:26:52.138+00	2021-07-12 19:26:52.138+00
4877	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:28:13.684+00	2021-07-12 19:28:13.684+00
4878	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-12 19:29:08.954+00	2021-07-12 19:29:08.954+00
4879	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-12 19:29:13.479+00	2021-07-12 19:29:13.479+00
4880	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-12 19:29:15.867+00	2021-07-12 19:29:15.867+00
4881	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-12 19:29:18.229+00	2021-07-12 19:29:18.229+00
4882	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-12 19:29:20.336+00	2021-07-12 19:29:20.336+00
4883	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-07-12 19:29:24.38+00	2021-07-12 19:29:24.38+00
4884	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 19:29:26.028+00	2021-07-12 19:29:26.028+00
4885	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:29:27.718+00	2021-07-12 19:29:27.718+00
4886	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:29:37.446+00	2021-07-12 19:29:37.446+00
4887	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:29:55.805+00	2021-07-12 19:29:55.805+00
4888	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:30:04.316+00	2021-07-12 19:30:04.316+00
4889	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:30:28.351+00	2021-07-12 19:30:28.351+00
4890	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:30:43.487+00	2021-07-12 19:30:43.487+00
4891	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:30:58.079+00	2021-07-12 19:30:58.079+00
4892	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 19:31:16.454+00	2021-07-12 19:31:16.454+00
4893	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:31:18.23+00	2021-07-12 19:31:18.23+00
4894	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:31:35.398+00	2021-07-12 19:31:35.398+00
4895	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:31:57.06+00	2021-07-12 19:31:57.06+00
4896	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:32:23.195+00	2021-07-12 19:32:23.195+00
4897	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-12 19:33:18.609+00	2021-07-12 19:33:18.609+00
4898	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-07-12 19:33:25.561+00	2021-07-12 19:33:25.561+00
4899	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-12 19:33:28.532+00	2021-07-12 19:33:28.532+00
4900	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 19:33:33.32+00	2021-07-12 19:33:33.32+00
4901	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:33:55.374+00	2021-07-12 19:33:55.374+00
4902	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:34:08.26+00	2021-07-12 19:34:08.26+00
4903	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 19:34:13.537+00	2021-07-12 19:34:13.537+00
4904	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-12 19:34:17.691+00	2021-07-12 19:34:17.691+00
4905	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-12 19:34:38.922+00	2021-07-12 19:34:38.922+00
4906	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 19:34:54.971+00	2021-07-12 19:34:54.971+00
4907	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:34:57.304+00	2021-07-12 19:34:57.304+00
4908	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 19:35:06.345+00	2021-07-12 19:35:06.345+00
4909	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-12 19:36:13.176+00	2021-07-12 19:36:13.176+00
4910	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-12 19:36:15.862+00	2021-07-12 19:36:15.862+00
4911	127.0.0.1	admin.users.edit	/admin/users/76/edit	GET	34	2021-07-12 19:36:18.925+00	2021-07-12 19:36:18.925+00
4912	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 19:36:29.017+00	2021-07-12 19:36:29.017+00
4913	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:36:30.779+00	2021-07-12 19:36:30.779+00
4914	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 19:36:39.038+00	2021-07-12 19:36:39.038+00
4915	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-07-12 20:04:41.188+00	2021-07-12 20:04:41.188+00
4916	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 20:04:50.793+00	2021-07-12 20:04:50.793+00
4917	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 20:04:52.168+00	2021-07-12 20:04:52.168+00
4918	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-07-12 20:05:18.326+00	2021-07-12 20:05:18.326+00
4919	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	34	2021-07-12 20:05:20.533+00	2021-07-12 20:05:20.533+00
4920	127.0.0.1	admin.cargos.store	/admin/cargos	POST	34	2021-07-12 20:05:30.995+00	2021-07-12 20:05:30.995+00
4921	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-07-12 20:05:31.197+00	2021-07-12 20:05:31.197+00
4922	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-12 20:05:33.775+00	2021-07-12 20:05:33.775+00
4923	127.0.0.1	admin.users.create	/admin/users/create	GET	34	2021-07-12 20:05:34.807+00	2021-07-12 20:05:34.807+00
4924	127.0.0.1	admin.users.store	/admin/users	POST	34	2021-07-12 20:06:39.659+00	2021-07-12 20:06:39.659+00
4925	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-12 20:06:39.841+00	2021-07-12 20:06:39.841+00
4926	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 20:06:45.262+00	2021-07-12 20:06:45.262+00
4927	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-12 20:06:47.663+00	2021-07-12 20:06:47.664+00
4928	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 20:06:49.596+00	2021-07-12 20:06:49.596+00
4929	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-12 20:06:50.878+00	2021-07-12 20:06:50.878+00
4930	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-12 20:06:53.649+00	2021-07-12 20:06:53.649+00
4931	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-12 20:06:53.802+00	2021-07-12 20:06:53.802+00
4932	127.0.0.1	sessions.store	/sessions	POST	77	2021-07-12 20:06:54.542+00	2021-07-12 20:06:54.542+00
4933	127.0.0.1	admin.contratos.index	/admin/contratos	GET	34	2021-07-12 20:06:54.553+00	2021-07-12 20:06:54.553+00
4934	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	77	2021-07-12 20:06:54.733+00	2021-07-12 20:06:54.733+00
4935	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 20:06:58.43+00	2021-07-12 20:06:58.43+00
4936	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	77	2021-07-12 20:07:06.075+00	2021-07-12 20:07:06.075+00
4937	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	77	2021-07-12 20:07:06.927+00	2021-07-12 20:07:06.927+00
4938	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	77	2021-07-12 20:08:28.986+00	2021-07-12 20:08:28.986+00
4939	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 20:10:30.103+00	2021-07-12 20:10:30.103+00
4940	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 20:10:37.051+00	2021-07-12 20:10:37.051+00
4941	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 20:10:44.45+00	2021-07-12 20:10:44.45+00
4942	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 20:10:46.093+00	2021-07-12 20:10:46.093+00
4943	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 20:10:52.579+00	2021-07-12 20:10:52.579+00
4944	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 20:11:16.669+00	2021-07-12 20:11:16.669+00
4945	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 20:11:24.596+00	2021-07-12 20:11:24.596+00
4946	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 20:11:30.025+00	2021-07-12 20:11:30.025+00
4947	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 20:11:32.318+00	2021-07-12 20:11:32.318+00
4948	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 20:11:34.755+00	2021-07-12 20:11:34.755+00
4949	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 20:11:45.784+00	2021-07-12 20:11:45.784+00
4950	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 20:12:26.728+00	2021-07-12 20:12:26.728+00
4951	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 21:23:57.988+00	2021-07-12 21:23:57.988+00
4952	127.0.0.1	sessions.store	/sessions	POST	34	2021-07-12 21:24:18.253+00	2021-07-12 21:24:18.253+00
4953	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 21:24:18.563+00	2021-07-12 21:24:18.563+00
4954	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 21:24:25.575+00	2021-07-12 21:24:25.575+00
4955	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 21:24:47.978+00	2021-07-12 21:24:47.978+00
4956	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 21:29:03.982+00	2021-07-12 21:29:03.982+00
4957	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 21:29:30.396+00	2021-07-12 21:29:30.396+00
4958	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 21:29:33.36+00	2021-07-12 21:29:33.36+00
4959	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-12 21:29:46.961+00	2021-07-12 21:29:46.961+00
4960	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 21:31:01.419+00	2021-07-12 21:31:01.419+00
4961	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-12 21:31:04.655+00	2021-07-12 21:31:04.655+00
4962	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-12 21:31:23.814+00	2021-07-12 21:31:23.814+00
4963	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-12 21:38:45.355+00	2021-07-12 21:38:45.355+00
4964	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-12 21:38:45.629+00	2021-07-12 21:38:45.629+00
4965	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-12 21:52:23.013+00	2021-07-12 21:52:23.013+00
4966	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 21:52:34.497+00	2021-07-12 21:52:34.497+00
4967	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 21:52:36.858+00	2021-07-12 21:52:36.858+00
4968	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-12 21:52:56.728+00	2021-07-12 21:52:56.728+00
4969	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-12 21:59:04.38+00	2021-07-12 21:59:04.38+00
4970	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 23:01:00.488+00	2021-07-12 23:01:00.488+00
4971	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-12 23:01:00.774+00	2021-07-12 23:01:00.774+00
4972	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 23:04:11.473+00	2021-07-12 23:04:11.473+00
4973	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-12 23:05:23.967+00	2021-07-12 23:05:23.967+00
4974	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-07-12 23:25:20.645+00	2021-07-12 23:25:20.645+00
4975	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-12 23:25:49.311+00	2021-07-12 23:25:49.311+00
4976	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-12 23:26:00.434+00	2021-07-12 23:26:00.434+00
4977	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-07-12 23:26:09.605+00	2021-07-12 23:26:09.605+00
4978	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-12 23:26:13.132+00	2021-07-12 23:26:13.132+00
4979	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-12 23:26:18.439+00	2021-07-12 23:26:18.439+00
4980	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-12 23:26:21.453+00	2021-07-12 23:26:21.453+00
4981	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-12 23:26:24.054+00	2021-07-12 23:26:24.054+00
4982	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-12 23:26:27.463+00	2021-07-12 23:26:27.463+00
4983	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-12 23:27:03.14+00	2021-07-12 23:27:03.14+00
4984	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-12 23:28:00.846+00	2021-07-12 23:28:00.846+00
4985	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-12 23:28:17.507+00	2021-07-12 23:28:17.507+00
4986	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-12 23:29:36.731+00	2021-07-12 23:29:36.731+00
4987	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-12 23:29:58.242+00	2021-07-12 23:29:58.242+00
4988	127.0.0.1	admin.cargos.index	/admin/cargos	GET	33	2021-07-12 23:30:01.653+00	2021-07-12 23:30:01.653+00
4989	127.0.0.1	admin.atividades.index	/admin/atividades	GET	33	2021-07-12 23:30:16.655+00	2021-07-12 23:30:16.655+00
4990	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:32:18.401+00	2021-07-12 23:32:18.401+00
4991	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-12 23:34:23.098+00	2021-07-12 23:34:23.098+00
4992	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-12 23:34:37.357+00	2021-07-12 23:34:37.357+00
4993	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:35:19.233+00	2021-07-12 23:35:19.233+00
4994	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:35:24.724+00	2021-07-12 23:35:24.724+00
4995	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:35:29.762+00	2021-07-12 23:35:29.763+00
4996	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:35:35.107+00	2021-07-12 23:35:35.107+00
4997	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	33	2021-07-12 23:35:43.722+00	2021-07-12 23:35:43.722+00
4998	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:36:16.816+00	2021-07-12 23:36:16.816+00
4999	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:36:27.057+00	2021-07-12 23:36:27.057+00
5000	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:36:39.322+00	2021-07-12 23:36:39.322+00
5001	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:36:51.626+00	2021-07-12 23:36:51.626+00
5002	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:37:07.608+00	2021-07-12 23:37:07.608+00
5003	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:37:18.465+00	2021-07-12 23:37:18.465+00
5004	127.0.0.1	admin.rdos.show	/admin/rdos/55	GET	33	2021-07-12 23:38:08.495+00	2021-07-12 23:38:08.495+00
5005	127.0.0.1	admin.rdos.show	/admin/rdos/22	GET	33	2021-07-12 23:38:51.937+00	2021-07-12 23:38:51.937+00
5006	127.0.0.1	admin.rdos.show	/admin/rdos/58	GET	33	2021-07-12 23:39:13.1+00	2021-07-12 23:39:13.1+00
5007	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:39:52.312+00	2021-07-12 23:39:52.312+00
5008	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:39:58.777+00	2021-07-12 23:39:58.777+00
5009	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:40:05.598+00	2021-07-12 23:40:05.598+00
5010	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:40:11.851+00	2021-07-12 23:40:11.851+00
5011	127.0.0.1	admin.rdos.show	/admin/rdos/104	GET	33	2021-07-12 23:40:16.23+00	2021-07-12 23:40:16.23+00
5012	127.0.0.1	admin.rdos.show	/admin/rdos/78	GET	33	2021-07-12 23:41:00.421+00	2021-07-12 23:41:00.421+00
5013	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:41:29.635+00	2021-07-12 23:41:29.635+00
5014	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:41:38.697+00	2021-07-12 23:41:38.697+00
5015	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:41:47.063+00	2021-07-12 23:41:47.063+00
5016	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:41:51.885+00	2021-07-12 23:41:51.885+00
5017	127.0.0.1	admin.rdos.show	/admin/rdos/11	GET	33	2021-07-12 23:42:06.117+00	2021-07-12 23:42:06.117+00
5018	127.0.0.1	admin.rdos.destroy	/admin/rdos/11	DELETE	33	2021-07-12 23:42:29.203+00	2021-07-12 23:42:29.203+00
5019	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:42:29.366+00	2021-07-12 23:42:29.366+00
5020	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:42:43.906+00	2021-07-12 23:42:43.906+00
5021	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:42:48.854+00	2021-07-12 23:42:48.854+00
5022	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:42:53.848+00	2021-07-12 23:42:53.848+00
5023	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:42:58.795+00	2021-07-12 23:42:58.795+00
5024	127.0.0.1	admin.rdos.destroy	/admin/rdos/54	DELETE	33	2021-07-12 23:43:15.242+00	2021-07-12 23:43:15.242+00
5025	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:43:15.409+00	2021-07-12 23:43:15.409+00
5026	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:43:27.084+00	2021-07-12 23:43:27.084+00
5027	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:43:33.1+00	2021-07-12 23:43:33.1+00
5028	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:43:37.844+00	2021-07-12 23:43:37.844+00
5029	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:43:43.259+00	2021-07-12 23:43:43.259+00
5030	127.0.0.1	admin.rdos.destroy	/admin/rdos/23	DELETE	33	2021-07-12 23:44:04.488+00	2021-07-12 23:44:04.488+00
5031	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:44:04.67+00	2021-07-12 23:44:04.67+00
5032	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:44:13.998+00	2021-07-12 23:44:13.998+00
5033	127.0.0.1	admin.rdos.destroy	/admin/rdos/17	DELETE	33	2021-07-12 23:44:23.432+00	2021-07-12 23:44:23.432+00
5034	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:44:23.597+00	2021-07-12 23:44:23.597+00
5035	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:44:32.505+00	2021-07-12 23:44:32.505+00
5036	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:44:58.405+00	2021-07-12 23:44:58.405+00
5037	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:46:07.031+00	2021-07-12 23:46:07.031+00
5038	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:46:18.113+00	2021-07-12 23:46:18.113+00
5039	127.0.0.1	admin.rdos.destroy	/admin/rdos/55	DELETE	33	2021-07-12 23:46:32.108+00	2021-07-12 23:46:32.108+00
5040	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:46:32.277+00	2021-07-12 23:46:32.277+00
5041	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:46:42.875+00	2021-07-12 23:46:42.875+00
5042	127.0.0.1	admin.rdos.destroy	/admin/rdos/57	DELETE	33	2021-07-12 23:46:53.552+00	2021-07-12 23:46:53.552+00
5043	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:46:53.711+00	2021-07-12 23:46:53.711+00
5044	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:46:59.187+00	2021-07-12 23:46:59.187+00
5045	127.0.0.1	admin.rdos.destroy	/admin/rdos/56	DELETE	33	2021-07-12 23:47:17.345+00	2021-07-12 23:47:17.345+00
5046	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:47:17.542+00	2021-07-12 23:47:17.542+00
5047	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:47:24.84+00	2021-07-12 23:47:24.84+00
5048	127.0.0.1	admin.rdos.destroy	/admin/rdos/22	DELETE	33	2021-07-12 23:47:42.567+00	2021-07-12 23:47:42.567+00
5049	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:47:42.743+00	2021-07-12 23:47:42.743+00
5050	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:47:47.879+00	2021-07-12 23:47:47.879+00
5051	127.0.0.1	admin.rdos.destroy	/admin/rdos/15	DELETE	33	2021-07-12 23:47:55.415+00	2021-07-12 23:47:55.415+00
5052	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:47:55.575+00	2021-07-12 23:47:55.575+00
5053	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:48:00.184+00	2021-07-12 23:48:00.184+00
5054	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:49:15.44+00	2021-07-12 23:49:15.44+00
5055	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:50:17.373+00	2021-07-12 23:50:17.373+00
5056	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:50:31.476+00	2021-07-12 23:50:31.476+00
5057	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:50:39.617+00	2021-07-12 23:50:39.617+00
5058	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:50:49.073+00	2021-07-12 23:50:49.073+00
5059	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:51:06.945+00	2021-07-12 23:51:06.945+00
5060	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:51:20.171+00	2021-07-12 23:51:20.171+00
5061	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:53:07.621+00	2021-07-12 23:53:07.621+00
5062	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:53:37.637+00	2021-07-12 23:53:37.637+00
5063	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:53:52.318+00	2021-07-12 23:53:52.318+00
5064	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:54:42.233+00	2021-07-12 23:54:42.233+00
5065	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:54:55.829+00	2021-07-12 23:54:55.829+00
5066	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:55:26.003+00	2021-07-12 23:55:26.003+00
5067	127.0.0.1	admin.rdos.show	/admin/rdos/84	GET	33	2021-07-12 23:55:51.468+00	2021-07-12 23:55:51.468+00
5068	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-12 23:56:45.425+00	2021-07-12 23:56:45.425+00
5069	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:56:51.575+00	2021-07-12 23:56:51.575+00
5070	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:58:47.058+00	2021-07-12 23:58:47.058+00
5071	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:58:53.02+00	2021-07-12 23:58:53.02+00
5073	127.0.0.1	admin.rdos.destroy	/admin/rdos/13	DELETE	33	2021-07-12 23:59:24.118+00	2021-07-12 23:59:24.118+00
5074	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:59:24.289+00	2021-07-12 23:59:24.289+00
5076	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:59:35.938+00	2021-07-12 23:59:35.938+00
5078	127.0.0.1	admin.rdos.destroy	/admin/rdos/21	DELETE	33	2021-07-12 23:59:59.64+00	2021-07-12 23:59:59.64+00
5079	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:59:59.808+00	2021-07-12 23:59:59.808+00
5081	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:00:17.282+00	2021-07-13 00:00:17.282+00
5083	127.0.0.1	admin.rdos.destroy	/admin/rdos/14	DELETE	33	2021-07-13 00:00:44.904+00	2021-07-13 00:00:44.904+00
5084	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:00:45.077+00	2021-07-13 00:00:45.077+00
5086	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:00:56.547+00	2021-07-13 00:00:56.547+00
5088	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:01:37.271+00	2021-07-13 00:01:37.271+00
5091	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:02:12.871+00	2021-07-13 00:02:12.871+00
5093	127.0.0.1	admin.rdos.destroy	/admin/rdos/20	DELETE	33	2021-07-13 00:02:46.505+00	2021-07-13 00:02:46.505+00
5094	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:02:46.676+00	2021-07-13 00:02:46.676+00
5096	127.0.0.1	admin.rdos.destroy	/admin/rdos/16	DELETE	33	2021-07-13 00:03:04.392+00	2021-07-13 00:03:04.392+00
5097	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:03:04.555+00	2021-07-13 00:03:04.555+00
5099	127.0.0.1	admin.rdos.destroy	/admin/rdos/19	DELETE	33	2021-07-13 00:03:23.328+00	2021-07-13 00:03:23.328+00
5100	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:03:23.492+00	2021-07-13 00:03:23.492+00
5102	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:03:46.961+00	2021-07-13 00:03:46.961+00
5104	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:04:56.123+00	2021-07-13 00:04:56.123+00
5107	127.0.0.1	sessions.store	/sessions	POST	67	2021-07-13 00:05:15.315+00	2021-07-13 00:05:15.316+00
5108	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 00:05:15.505+00	2021-07-13 00:05:15.505+00
5109	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:05:17.051+00	2021-07-13 00:05:17.051+00
5111	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:05:32.067+00	2021-07-13 00:05:32.067+00
5113	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:06:20.096+00	2021-07-13 00:06:20.096+00
5115	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:07:22.953+00	2021-07-13 00:07:22.953+00
5117	127.0.0.1	admin.rdos.destroy	/admin/rdos/53	DELETE	67	2021-07-13 00:07:39.872+00	2021-07-13 00:07:39.872+00
5118	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:07:40.054+00	2021-07-13 00:07:40.054+00
5120	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:08:14.154+00	2021-07-13 00:08:14.154+00
5126	127.0.0.1	admin.rdos.destroy	/admin/rdos/51	DELETE	67	2021-07-13 00:09:50.3+00	2021-07-13 00:09:50.3+00
5127	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:09:50.485+00	2021-07-13 00:09:50.485+00
5130	127.0.0.1	admin.rdos.destroy	/admin/rdos/52	DELETE	67	2021-07-13 00:10:24.018+00	2021-07-13 00:10:24.018+00
5131	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:10:24.2+00	2021-07-13 00:10:24.2+00
5134	127.0.0.1	admin.rdos.show	/admin/rdos/110	GET	67	2021-07-13 00:10:38.841+00	2021-07-13 00:10:38.841+00
5135	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:10:39.068+00	2021-07-13 00:10:39.068+00
5137	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:11:19.052+00	2021-07-13 00:11:19.052+00
5139	127.0.0.1	admin.rdos.destroy	/admin/rdos/48	DELETE	33	2021-07-13 00:11:52.373+00	2021-07-13 00:11:52.373+00
5140	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:11:52.538+00	2021-07-13 00:11:52.538+00
5142	127.0.0.1	admin.rdos.destroy	/admin/rdos/49	DELETE	33	2021-07-13 00:12:22.114+00	2021-07-13 00:12:22.114+00
5143	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:12:22.281+00	2021-07-13 00:12:22.281+00
5145	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:13:04.536+00	2021-07-13 00:13:04.536+00
5147	127.0.0.1	admin.rdos.destroy	/admin/rdos/24	DELETE	33	2021-07-13 00:14:14.847+00	2021-07-13 00:14:14.847+00
5148	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:14:15.009+00	2021-07-13 00:14:15.009+00
5150	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:14:32.35+00	2021-07-13 00:14:32.35+00
5152	127.0.0.1	admin.rdos.destroy	/admin/rdos/25	DELETE	33	2021-07-13 00:15:56.492+00	2021-07-13 00:15:56.492+00
5153	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:15:56.659+00	2021-07-13 00:15:56.659+00
5155	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:16:31.789+00	2021-07-13 00:16:31.789+00
5157	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:16:48.604+00	2021-07-13 00:16:48.604+00
5160	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:17:56.038+00	2021-07-13 00:17:56.038+00
5163	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:18:46.582+00	2021-07-13 00:18:46.582+00
5165	127.0.0.1	admin.rdos.destroy	/admin/rdos/26	DELETE	33	2021-07-13 00:20:05.224+00	2021-07-13 00:20:05.224+00
5166	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:20:05.402+00	2021-07-13 00:20:05.402+00
5168	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:21:09.592+00	2021-07-13 00:21:09.592+00
5170	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:21:50.14+00	2021-07-13 00:21:50.14+00
5173	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:22:11.609+00	2021-07-13 00:22:11.609+00
5175	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:23:26.939+00	2021-07-13 00:23:26.939+00
5072	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:58:58.446+00	2021-07-12 23:58:58.446+00
5075	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:59:30.499+00	2021-07-12 23:59:30.499+00
5077	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-12 23:59:40.567+00	2021-07-12 23:59:40.567+00
5080	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:00:09.073+00	2021-07-13 00:00:09.073+00
5082	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:00:26.633+00	2021-07-13 00:00:26.633+00
5085	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:00:52.036+00	2021-07-13 00:00:52.036+00
5087	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:01:30.781+00	2021-07-13 00:01:30.782+00
5089	127.0.0.1	admin.rdos.destroy	/admin/rdos/18	DELETE	33	2021-07-13 00:02:03.162+00	2021-07-13 00:02:03.162+00
5090	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:02:03.367+00	2021-07-13 00:02:03.367+00
5092	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:02:26.056+00	2021-07-13 00:02:26.056+00
5095	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:02:55.55+00	2021-07-13 00:02:55.55+00
5098	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:03:10.247+00	2021-07-13 00:03:10.247+00
5101	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:03:27.025+00	2021-07-13 00:03:27.025+00
5103	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:04:21.822+00	2021-07-13 00:04:21.822+00
5105	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 00:05:07.253+00	2021-07-13 00:05:07.253+00
5106	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:05:10.174+00	2021-07-13 00:05:10.174+00
5110	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:05:24.291+00	2021-07-13 00:05:24.291+00
5112	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:06:14.021+00	2021-07-13 00:06:14.021+00
5114	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:07:17.317+00	2021-07-13 00:07:17.317+00
5116	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:07:29.284+00	2021-07-13 00:07:29.284+00
5119	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:07:54.045+00	2021-07-13 00:07:54.045+00
5121	127.0.0.1	admin.rdos.show	/admin/rdos/110	GET	67	2021-07-13 00:08:29.791+00	2021-07-13 00:08:29.791+00
5122	127.0.0.1	admin.rdos.edit	/admin/rdos/110/edit	GET	67	2021-07-13 00:08:33.044+00	2021-07-13 00:08:33.044+00
5123	127.0.0.1	admin.rdos.update	/admin/rdos/110	PUT	67	2021-07-13 00:08:53.744+00	2021-07-13 00:08:53.744+00
5124	127.0.0.1	admin.rdos.show	/admin/rdos/110	GET	67	2021-07-13 00:08:53.944+00	2021-07-13 00:08:53.944+00
5125	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:09:04.2+00	2021-07-13 00:09:04.2+00
5128	127.0.0.1	admin.rdos.destroy	/admin/rdos/50	DELETE	67	2021-07-13 00:10:00.235+00	2021-07-13 00:10:00.236+00
5129	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:10:00.414+00	2021-07-13 00:10:00.414+00
5132	127.0.0.1	admin.rdos.destroy	/admin/rdos/110	DELETE	33	2021-07-13 00:10:24.606+00	2021-07-13 00:10:24.606+00
5133	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:10:24.791+00	2021-07-13 00:10:24.791+00
5136	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:10:42.775+00	2021-07-13 00:10:42.775+00
5138	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:11:20.458+00	2021-07-13 00:11:20.458+00
5141	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:12:12.61+00	2021-07-13 00:12:12.61+00
5144	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:12:43.865+00	2021-07-13 00:12:43.865+00
5146	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:13:22.88+00	2021-07-13 00:13:22.88+00
5149	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:14:27.871+00	2021-07-13 00:14:27.871+00
5151	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:14:38.4+00	2021-07-13 00:14:38.4+00
5154	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:16:04.783+00	2021-07-13 00:16:04.783+00
5156	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:16:44.337+00	2021-07-13 00:16:44.337+00
5158	127.0.0.1	admin.rdos.destroy	/admin/rdos/62	DELETE	33	2021-07-13 00:17:51.798+00	2021-07-13 00:17:51.798+00
5159	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:17:51.966+00	2021-07-13 00:17:51.966+00
5161	127.0.0.1	admin.rdos.destroy	/admin/rdos/27	DELETE	33	2021-07-13 00:18:43.818+00	2021-07-13 00:18:43.818+00
5162	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:18:43.986+00	2021-07-13 00:18:43.986+00
5164	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:18:52.191+00	2021-07-13 00:18:52.191+00
5167	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:20:10.555+00	2021-07-13 00:20:10.555+00
5169	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:21:39.929+00	2021-07-13 00:21:39.929+00
5171	127.0.0.1	admin.rdos.destroy	/admin/rdos/29	DELETE	33	2021-07-13 00:22:05.385+00	2021-07-13 00:22:05.385+00
5172	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:22:05.54+00	2021-07-13 00:22:05.54+00
5174	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:22:59.594+00	2021-07-13 00:22:59.594+00
5176	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-13 00:23:44.232+00	2021-07-13 00:23:44.232+00
5177	127.0.0.1	admin.rdos.destroy	/admin/rdos/32	DELETE	33	2021-07-13 00:24:26.77+00	2021-07-13 00:24:26.77+00
5178	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:24:26.952+00	2021-07-13 00:24:26.952+00
5179	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:24:34.972+00	2021-07-13 00:24:34.972+00
5180	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:24:53.214+00	2021-07-13 00:24:53.214+00
5181	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:25:22.518+00	2021-07-13 00:25:22.518+00
5182	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:25:29.168+00	2021-07-13 00:25:29.168+00
5183	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:25:41.384+00	2021-07-13 00:25:41.384+00
5184	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:26:01.438+00	2021-07-13 00:26:01.438+00
5185	127.0.0.1	admin.rdos.destroy	/admin/rdos/31	DELETE	33	2021-07-13 00:26:52.201+00	2021-07-13 00:26:52.201+00
5186	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:26:52.434+00	2021-07-13 00:26:52.434+00
5187	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:26:59.722+00	2021-07-13 00:26:59.722+00
5188	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:27:08.141+00	2021-07-13 00:27:08.141+00
5189	127.0.0.1	admin.rdos.destroy	/admin/rdos/43	DELETE	33	2021-07-13 00:27:41.384+00	2021-07-13 00:27:41.384+00
5190	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:27:41.556+00	2021-07-13 00:27:41.556+00
5191	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:27:49.308+00	2021-07-13 00:27:49.308+00
5192	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:27:54.376+00	2021-07-13 00:27:54.376+00
5193	127.0.0.1	admin.rdos.destroy	/admin/rdos/33	DELETE	33	2021-07-13 00:28:46.347+00	2021-07-13 00:28:46.347+00
5194	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:28:46.512+00	2021-07-13 00:28:46.512+00
5195	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:28:58.941+00	2021-07-13 00:28:58.941+00
5196	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:29:06.995+00	2021-07-13 00:29:06.995+00
5197	127.0.0.1	admin.rdos.destroy	/admin/rdos/34	DELETE	33	2021-07-13 00:29:33.088+00	2021-07-13 00:29:33.088+00
5198	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:29:33.258+00	2021-07-13 00:29:33.258+00
5199	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:29:41.195+00	2021-07-13 00:29:41.195+00
5200	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:29:50.394+00	2021-07-13 00:29:50.394+00
5201	127.0.0.1	admin.rdos.destroy	/admin/rdos/44	DELETE	33	2021-07-13 00:30:21.551+00	2021-07-13 00:30:21.551+00
5202	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:30:21.719+00	2021-07-13 00:30:21.719+00
5203	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:30:32.371+00	2021-07-13 00:30:32.371+00
5204	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:30:43.552+00	2021-07-13 00:30:43.552+00
5205	127.0.0.1	admin.rdos.destroy	/admin/rdos/35	DELETE	33	2021-07-13 00:31:54.882+00	2021-07-13 00:31:54.882+00
5206	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:31:55.047+00	2021-07-13 00:31:55.047+00
5207	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:32:05.272+00	2021-07-13 00:32:05.272+00
5208	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:32:13.264+00	2021-07-13 00:32:13.264+00
5218	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-13 00:34:11.288+00	2021-07-13 00:34:11.288+00
5209	127.0.0.1	admin.areas.index	/admin/areas	GET	67	2021-07-13 00:32:43.909+00	2021-07-13 00:32:43.909+00
5210	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	67	2021-07-13 00:32:45.857+00	2021-07-13 00:32:45.857+00
5211	127.0.0.1	admin.areas.furos.create	/admin/areas/furos/create	GET	67	2021-07-13 00:32:49.245+00	2021-07-13 00:32:49.245+00
5212	127.0.0.1	admin.areas.furos.store	/admin/areas/furos	POST	67	2021-07-13 00:32:59.957+00	2021-07-13 00:32:59.957+00
5213	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	67	2021-07-13 00:33:00.148+00	2021-07-13 00:33:00.148+00
5214	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-13 00:33:13.34+00	2021-07-13 00:33:13.34+00
5215	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-13 00:33:13.58+00	2021-07-13 00:33:13.58+00
5216	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 00:33:34.403+00	2021-07-13 00:33:34.403+00
5217	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:33:57.23+00	2021-07-13 00:33:57.23+00
5219	127.0.0.1	admin.rdos.destroy	/admin/rdos/37	DELETE	33	2021-07-13 00:34:19.151+00	2021-07-13 00:34:19.151+00
5220	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:34:19.321+00	2021-07-13 00:34:19.321+00
5221	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:34:35.037+00	2021-07-13 00:34:35.037+00
5222	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:34:57.937+00	2021-07-13 00:34:57.937+00
5223	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:35:28.357+00	2021-07-13 00:35:28.357+00
5224	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:35:57.367+00	2021-07-13 00:35:57.367+00
5225	127.0.0.1	admin.rdos.destroy	/admin/rdos/38	DELETE	33	2021-07-13 00:36:25.385+00	2021-07-13 00:36:25.385+00
5226	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:36:25.551+00	2021-07-13 00:36:25.551+00
5227	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:36:33.684+00	2021-07-13 00:36:33.684+00
5228	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:36:46.168+00	2021-07-13 00:36:46.168+00
5229	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:36:58.842+00	2021-07-13 00:36:58.842+00
5230	127.0.0.1	admin.rdos.destroy	/admin/rdos/47	DELETE	33	2021-07-13 00:37:09.539+00	2021-07-13 00:37:09.539+00
5231	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:37:09.707+00	2021-07-13 00:37:09.707+00
5232	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:37:15.688+00	2021-07-13 00:37:15.688+00
5233	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:37:24.891+00	2021-07-13 00:37:24.891+00
5234	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:37:26.892+00	2021-07-13 00:37:26.892+00
5235	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:37:40.028+00	2021-07-13 00:37:40.028+00
5236	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:37:40.358+00	2021-07-13 00:37:40.358+00
5237	127.0.0.1	admin.rdos.destroy	/admin/rdos/41	DELETE	33	2021-07-13 00:38:32.576+00	2021-07-13 00:38:32.576+00
5238	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:38:32.736+00	2021-07-13 00:38:32.736+00
5239	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:38:40.479+00	2021-07-13 00:38:40.479+00
5240	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:38:45.191+00	2021-07-13 00:38:45.192+00
5241	127.0.0.1	admin.rdos.destroy	/admin/rdos/40	DELETE	33	2021-07-13 00:39:15.867+00	2021-07-13 00:39:15.867+00
5242	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:39:16.03+00	2021-07-13 00:39:16.03+00
5243	127.0.0.1	admin.rdos.destroy	/admin/rdos/46	DELETE	67	2021-07-13 00:39:25.779+00	2021-07-13 00:39:25.779+00
5244	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:39:25.958+00	2021-07-13 00:39:25.958+00
5245	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:39:29.335+00	2021-07-13 00:39:29.335+00
5246	127.0.0.1	admin.rdos.destroy	/admin/rdos/42	DELETE	67	2021-07-13 00:40:00.274+00	2021-07-13 00:40:00.274+00
5247	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:40:00.451+00	2021-07-13 00:40:00.451+00
5248	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:40:04.216+00	2021-07-13 00:40:04.216+00
5249	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:40:09.578+00	2021-07-13 00:40:09.578+00
5250	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:40:22.795+00	2021-07-13 00:40:22.795+00
5251	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:41:11.121+00	2021-07-13 00:41:11.121+00
5252	127.0.0.1	admin.rdos.destroy	/admin/rdos/39	DELETE	67	2021-07-13 00:41:50.168+00	2021-07-13 00:41:50.168+00
5253	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:41:50.342+00	2021-07-13 00:41:50.342+00
5254	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:42:13.836+00	2021-07-13 00:42:13.836+00
5255	127.0.0.1	admin.rdos.destroy	/admin/rdos/36	DELETE	67	2021-07-13 00:42:40.18+00	2021-07-13 00:42:40.18+00
5256	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:42:40.365+00	2021-07-13 00:42:40.365+00
5257	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:42:44.032+00	2021-07-13 00:42:44.032+00
5258	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:42:59.815+00	2021-07-13 00:42:59.815+00
5259	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:43:03.046+00	2021-07-13 00:43:03.046+00
5260	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:43:33.32+00	2021-07-13 00:43:33.32+00
5261	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:43:34.807+00	2021-07-13 00:43:34.807+00
5262	127.0.0.1	admin.rdos.show	/admin/rdos/94	GET	33	2021-07-13 00:43:40.264+00	2021-07-13 00:43:40.264+00
5263	127.0.0.1	admin.rdos.edit	/admin/rdos/94/edit	GET	33	2021-07-13 00:43:45.932+00	2021-07-13 00:43:45.932+00
5264	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:43:58.139+00	2021-07-13 00:43:58.139+00
5265	127.0.0.1	admin.rdos.update	/admin/rdos/94	PUT	33	2021-07-13 00:43:59.988+00	2021-07-13 00:43:59.988+00
5266	127.0.0.1	admin.rdos.show	/admin/rdos/94	GET	33	2021-07-13 00:44:00.2+00	2021-07-13 00:44:00.2+00
5267	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:44:09.419+00	2021-07-13 00:44:09.419+00
5268	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:44:13.667+00	2021-07-13 00:44:13.667+00
5269	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:44:58.629+00	2021-07-13 00:44:58.629+00
5270	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:45:12.259+00	2021-07-13 00:45:12.259+00
5271	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:45:24.643+00	2021-07-13 00:45:24.643+00
5272	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:45:28.219+00	2021-07-13 00:45:28.219+00
5273	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:45:36.954+00	2021-07-13 00:45:36.954+00
5274	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 00:45:44.443+00	2021-07-13 00:45:44.443+00
5275	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	67	2021-07-13 00:45:47.711+00	2021-07-13 00:45:47.711+00
5276	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:46:11.219+00	2021-07-13 00:46:11.219+00
5277	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	67	2021-07-13 00:46:14.39+00	2021-07-13 00:46:14.39+00
5278	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:46:24.4+00	2021-07-13 00:46:24.4+00
5279	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	67	2021-07-13 00:46:28.299+00	2021-07-13 00:46:28.299+00
5280	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	67	2021-07-13 00:46:53.613+00	2021-07-13 00:46:53.613+00
5281	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:47:22.031+00	2021-07-13 00:47:22.031+00
5282	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:47:32.395+00	2021-07-13 00:47:32.395+00
5283	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:47:46.726+00	2021-07-13 00:47:46.726+00
5284	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:47:52.336+00	2021-07-13 00:47:52.336+00
5285	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:47:55.975+00	2021-07-13 00:47:55.975+00
5286	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:48:01.068+00	2021-07-13 00:48:01.068+00
5287	127.0.0.1	admin.rdos.show	/admin/rdos/98	GET	67	2021-07-13 00:48:08.948+00	2021-07-13 00:48:08.948+00
5288	127.0.0.1	admin.rdos.show	/admin/rdos/104	GET	33	2021-07-13 00:48:19.933+00	2021-07-13 00:48:19.933+00
5289	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:48:31.063+00	2021-07-13 00:48:31.063+00
5292	127.0.0.1	admin.rdos.update	/admin/rdos/104	PUT	33	2021-07-13 00:49:39.328+00	2021-07-13 00:49:39.328+00
5293	127.0.0.1	admin.rdos.show	/admin/rdos/104	GET	33	2021-07-13 00:49:39.502+00	2021-07-13 00:49:39.502+00
5290	127.0.0.1	admin.rdos.show	/admin/rdos/95	GET	67	2021-07-13 00:48:34.849+00	2021-07-13 00:48:34.849+00
5291	127.0.0.1	admin.rdos.edit	/admin/rdos/104/edit	GET	33	2021-07-13 00:49:03.728+00	2021-07-13 00:49:03.729+00
5294	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:49:51.08+00	2021-07-13 00:49:51.08+00
5295	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:50:29.413+00	2021-07-13 00:50:29.413+00
5296	127.0.0.1	admin.rdos.destroy	/admin/rdos/98	DELETE	67	2021-07-13 00:50:34.727+00	2021-07-13 00:50:34.727+00
5297	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 00:50:34.93+00	2021-07-13 00:50:34.93+00
5298	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:50:44.382+00	2021-07-13 00:50:44.382+00
5299	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:51:01.004+00	2021-07-13 00:51:01.004+00
5300	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:53:18.121+00	2021-07-13 00:53:18.121+00
5301	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:53:24.838+00	2021-07-13 00:53:24.838+00
5302	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 00:53:42.996+00	2021-07-13 00:53:42.996+00
5303	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	67	2021-07-13 00:54:33.785+00	2021-07-13 00:54:33.785+00
5304	127.0.0.1	admin.cargos.index	/admin/cargos	GET	67	2021-07-13 00:54:48.153+00	2021-07-13 00:54:48.154+00
5305	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-13 00:54:55.364+00	2021-07-13 00:54:55.364+00
5306	127.0.0.1	admin.areas.index	/admin/areas	GET	67	2021-07-13 00:55:00.225+00	2021-07-13 00:55:00.225+00
5307	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 00:55:07.165+00	2021-07-13 00:55:07.165+00
5308	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	67	2021-07-13 00:55:08.995+00	2021-07-13 00:55:08.995+00
5309	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	67	2021-07-13 00:55:32.28+00	2021-07-13 00:55:32.28+00
5310	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-13 01:05:55.973+00	2021-07-13 01:05:55.973+00
5311	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 01:16:48.041+00	2021-07-13 01:16:48.041+00
5312	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 02:06:23.063+00	2021-07-13 02:06:23.063+00
5313	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 02:06:23.201+00	2021-07-13 02:06:23.201+00
5314	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 04:08:30.507+00	2021-07-13 04:08:30.507+00
5315	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 05:38:43.671+00	2021-07-13 05:38:43.671+00
5316	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-13 10:37:34.026+00	2021-07-13 10:37:34.026+00
5317	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-13 10:37:34.255+00	2021-07-13 10:37:34.255+00
5318	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 10:42:33.958+00	2021-07-13 10:42:33.958+00
5319	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 11:16:08.469+00	2021-07-13 11:16:08.469+00
5320	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 11:18:23.682+00	2021-07-13 11:18:23.682+00
5321	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-13 11:18:23.924+00	2021-07-13 11:18:23.924+00
5322	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:18:30.911+00	2021-07-13 11:18:30.911+00
5323	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:18:56.935+00	2021-07-13 11:18:56.935+00
5324	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:19:06.755+00	2021-07-13 11:19:06.755+00
5325	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:19:10.214+00	2021-07-13 11:19:10.214+00
5326	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:19:17.762+00	2021-07-13 11:19:17.762+00
5327	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-13 11:19:22.29+00	2021-07-13 11:19:22.29+00
5328	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-13 11:19:23.673+00	2021-07-13 11:19:23.673+00
5329	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-13 11:19:24.903+00	2021-07-13 11:19:24.903+00
5330	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-13 11:19:29.771+00	2021-07-13 11:19:29.771+00
5331	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-13 11:19:29.982+00	2021-07-13 11:19:29.982+00
5332	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-13 11:19:31.116+00	2021-07-13 11:19:31.116+00
5333	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:19:32.974+00	2021-07-13 11:19:32.974+00
5334	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:19:44.985+00	2021-07-13 11:19:44.985+00
5335	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:21:07.104+00	2021-07-13 11:21:07.104+00
5336	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:21:18.733+00	2021-07-13 11:21:18.733+00
5337	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:22:25.237+00	2021-07-13 11:22:25.237+00
5338	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-13 11:25:18.016+00	2021-07-13 11:25:18.017+00
5339	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:29:41.893+00	2021-07-13 11:29:41.893+00
5340	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:38:24.525+00	2021-07-13 11:38:24.525+00
5341	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:38:32.443+00	2021-07-13 11:38:32.444+00
5342	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:49:53.773+00	2021-07-13 11:49:53.773+00
5343	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:49:58.846+00	2021-07-13 11:49:58.846+00
5344	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:50:06.542+00	2021-07-13 11:50:06.542+00
5345	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-13 11:50:12.459+00	2021-07-13 11:50:12.459+00
5346	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-13 11:52:17.862+00	2021-07-13 11:52:17.862+00
5347	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-13 11:52:19.382+00	2021-07-13 11:52:19.382+00
5348	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-13 11:52:52.43+00	2021-07-13 11:52:52.43+00
5349	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-13 11:52:59.297+00	2021-07-13 11:52:59.297+00
5350	127.0.0.1	admin.rdos.show	/admin/rdos/113	GET	34	2021-07-13 11:53:02.953+00	2021-07-13 11:53:02.953+00
5351	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-13 11:53:20.013+00	2021-07-13 11:53:20.013+00
5352	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:53:24.525+00	2021-07-13 11:53:24.525+00
5353	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:53:34.288+00	2021-07-13 11:53:34.288+00
5354	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 11:54:02.649+00	2021-07-13 11:54:02.649+00
5355	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 12:00:40.599+00	2021-07-13 12:00:40.599+00
5356	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 12:01:42.906+00	2021-07-13 12:01:42.906+00
5357	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 12:02:13.208+00	2021-07-13 12:02:13.208+00
5358	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-13 12:08:22.922+00	2021-07-13 12:08:22.922+00
5359	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-13 12:08:23.194+00	2021-07-13 12:08:23.194+00
5360	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 12:08:51.909+00	2021-07-13 12:08:51.909+00
5361	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 12:10:03.132+00	2021-07-13 12:10:03.132+00
5362	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 12:30:36.331+00	2021-07-13 12:30:36.331+00
5363	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-13 12:32:54.279+00	2021-07-13 12:32:54.279+00
5364	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-13 13:12:04.749+00	2021-07-13 13:12:04.749+00
5365	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-13 13:12:12.792+00	2021-07-13 13:12:12.792+00
5366	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-13 13:12:36.906+00	2021-07-13 13:12:36.906+00
5367	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	73	2021-07-13 13:12:44.77+00	2021-07-13 13:12:44.77+00
5368	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	73	2021-07-13 13:12:57.864+00	2021-07-13 13:12:57.864+00
5369	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-13 13:29:25.243+00	2021-07-13 13:29:25.243+00
5370	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 14:47:28.917+00	2021-07-13 14:47:28.917+00
5371	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-13 14:47:29.087+00	2021-07-13 14:47:29.087+00
5372	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 14:47:31.42+00	2021-07-13 14:47:31.42+00
5373	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-13 14:47:42.882+00	2021-07-13 14:47:42.882+00
5374	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-13 14:47:52.959+00	2021-07-13 14:47:52.959+00
5375	127.0.0.1	admin.rdos.show	/admin/rdos/113	GET	34	2021-07-13 14:47:58.485+00	2021-07-13 14:47:58.485+00
5376	127.0.0.1	admin.rdos.show	/admin/rdos/115	GET	34	2021-07-13 14:48:19.747+00	2021-07-13 14:48:19.747+00
5377	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 15:17:07.801+00	2021-07-13 15:17:07.801+00
5378	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 15:48:31.255+00	2021-07-13 15:48:31.255+00
5379	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 17:14:38.128+00	2021-07-13 17:14:38.128+00
5380	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 17:19:50.304+00	2021-07-13 17:19:50.304+00
5381	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 17:19:50.452+00	2021-07-13 17:19:50.452+00
5382	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 17:23:59.17+00	2021-07-13 17:23:59.17+00
5383	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 19:38:57.995+00	2021-07-13 19:38:57.995+00
5384	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 21:06:24.419+00	2021-07-13 21:06:24.419+00
5385	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-13 22:50:13.496+00	2021-07-13 22:50:13.496+00
5386	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-13 22:50:13.852+00	2021-07-13 22:50:13.852+00
5387	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-13 22:52:27.366+00	2021-07-13 22:52:27.366+00
5388	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-13 23:01:37.401+00	2021-07-13 23:01:37.401+00
5389	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-13 23:01:38.535+00	2021-07-13 23:01:38.535+00
5390	127.0.0.1	admin.rdos.index	/admin/rdos	GET	33	2021-07-13 23:01:50.76+00	2021-07-13 23:01:50.76+00
5391	127.0.0.1	admin.rdos.show	/admin/rdos/67	GET	33	2021-07-13 23:02:03.364+00	2021-07-13 23:02:03.364+00
5392	127.0.0.1	admin.rdos.show	/admin/rdos/115	GET	33	2021-07-13 23:02:16.684+00	2021-07-13 23:02:16.684+00
5393	127.0.0.1	api.rdos.store	/api/rdos	POST	67	2021-07-13 23:04:07.885+00	2021-07-13 23:04:07.885+00
5394	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/115/atividades	POST	33	2021-07-13 23:04:12.687+00	2021-07-13 23:04:12.687+00
5395	127.0.0.1	admin.rdos.show	/admin/rdos/115	GET	33	2021-07-13 23:04:12.979+00	2021-07-13 23:04:12.979+00
5396	127.0.0.1	admin.rdo_atividades.store	/admin/rdos/115/atividades	POST	33	2021-07-13 23:05:48.193+00	2021-07-13 23:05:48.193+00
5397	127.0.0.1	admin.rdos.show	/admin/rdos/115	GET	33	2021-07-13 23:05:48.98+00	2021-07-13 23:05:48.98+00
5398	127.0.0.1	admin.rdo_atividades.destroy	/admin/rdos/115/atividades/795	DELETE	33	2021-07-13 23:07:34.896+00	2021-07-13 23:07:34.896+00
5399	127.0.0.1	admin.rdos.show	/admin/rdos/115	GET	33	2021-07-13 23:07:35.16+00	2021-07-13 23:07:35.16+00
5400	127.0.0.1	admin.users.index	/admin/users	GET	33	2021-07-13 23:25:50.393+00	2021-07-13 23:25:50.393+00
5401	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-13 23:25:54.602+00	2021-07-13 23:25:54.602+00
5402	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-13 23:25:58.694+00	2021-07-13 23:25:58.694+00
5403	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	33	2021-07-13 23:26:26.149+00	2021-07-13 23:26:26.149+00
5404	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-13 23:27:02.978+00	2021-07-13 23:27:02.978+00
5405	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-13 23:27:03.227+00	2021-07-13 23:27:03.227+00
5406	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:32:38.052+00	2021-07-13 23:32:38.052+00
5407	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-13 23:32:46.739+00	2021-07-13 23:32:46.739+00
5408	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-13 23:32:57.065+00	2021-07-13 23:32:57.065+00
5409	127.0.0.1	admin.atividades.edit	/admin/atividades/101/edit	GET	67	2021-07-13 23:33:00.099+00	2021-07-13 23:33:00.099+00
5410	127.0.0.1	admin.atividades.update	/admin/atividades/101	PUT	67	2021-07-13 23:33:11.276+00	2021-07-13 23:33:11.276+00
5411	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-13 23:33:11.715+00	2021-07-13 23:33:11.715+00
5412	127.0.0.1	admin.atividades.edit	/admin/atividades/89/edit	GET	67	2021-07-13 23:33:58.88+00	2021-07-13 23:33:58.88+00
5413	127.0.0.1	admin.atividades.update	/admin/atividades/89	PUT	67	2021-07-13 23:35:03.488+00	2021-07-13 23:35:03.488+00
5414	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-13 23:35:03.827+00	2021-07-13 23:35:03.827+00
5415	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:35:48.557+00	2021-07-13 23:35:48.557+00
5416	127.0.0.1	admin.contratos.index	/admin/contratos	GET	67	2021-07-13 23:35:57.921+00	2021-07-13 23:35:57.921+00
5417	127.0.0.1	admin.contratos.edit	/admin/contratos/2/edit	GET	67	2021-07-13 23:36:37.096+00	2021-07-13 23:36:37.096+00
5418	127.0.0.1	admin.areas.index	/admin/areas	GET	67	2021-07-13 23:36:46.08+00	2021-07-13 23:36:46.08+00
5419	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:36:49.078+00	2021-07-13 23:36:49.078+00
5420	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:37:00.182+00	2021-07-13 23:37:00.182+00
5421	127.0.0.1	admin.contratos.index	/admin/contratos	GET	67	2021-07-13 23:37:02.244+00	2021-07-13 23:37:02.244+00
5422	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:37:13.957+00	2021-07-13 23:37:13.957+00
5423	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	67	2021-07-13 23:37:18.048+00	2021-07-13 23:37:18.048+00
5424	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-13 23:39:01.454+00	2021-07-13 23:39:01.454+00
5425	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	67	2021-07-13 23:39:05.645+00	2021-07-13 23:39:05.645+00
5426	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-13 23:39:07.887+00	2021-07-13 23:39:07.887+00
5427	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 23:39:11.834+00	2021-07-13 23:39:11.834+00
5428	127.0.0.1	admin.atividades.index	/admin/atividades	GET	67	2021-07-13 23:39:43.946+00	2021-07-13 23:39:43.946+00
5429	127.0.0.1	admin.rdos.index	/admin/rdos	GET	67	2021-07-13 23:39:51.238+00	2021-07-13 23:39:51.238+00
5430	127.0.0.1	admin.rdos.show	/admin/rdos/99	GET	67	2021-07-13 23:40:15.752+00	2021-07-13 23:40:15.752+00
5431	127.0.0.1	admin.users.index	/admin/users	GET	67	2021-07-13 23:43:15.051+00	2021-07-13 23:43:15.051+00
5432	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	67	2021-07-13 23:43:19.358+00	2021-07-13 23:43:19.358+00
5433	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:43:31.259+00	2021-07-13 23:43:31.259+00
5434	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	67	2021-07-13 23:44:01.895+00	2021-07-13 23:44:01.895+00
5435	127.0.0.1	admin.areas.index	/admin/areas	GET	67	2021-07-13 23:44:28.715+00	2021-07-13 23:44:28.715+00
5436	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	67	2021-07-13 23:44:32.012+00	2021-07-13 23:44:32.012+00
5437	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	67	2021-07-13 23:44:36.709+00	2021-07-13 23:44:36.71+00
5438	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	67	2021-07-13 23:44:40.33+00	2021-07-13 23:44:40.33+00
5439	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	67	2021-07-13 23:44:44.188+00	2021-07-13 23:44:44.188+00
5440	127.0.0.1	admin.areas.index	/admin/areas	GET	33	2021-07-13 23:45:18.439+00	2021-07-13 23:45:18.439+00
5441	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	67	2021-07-13 23:45:18.717+00	2021-07-13 23:45:18.717+00
5442	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	67	2021-07-13 23:45:22.72+00	2021-07-13 23:45:22.72+00
5443	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-07-13 23:45:22.919+00	2021-07-13 23:45:22.919+00
5444	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	67	2021-07-13 23:45:24.494+00	2021-07-13 23:45:24.494+00
5445	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	67	2021-07-13 23:45:32.236+00	2021-07-13 23:45:32.236+00
5446	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:45:34.715+00	2021-07-13 23:45:34.715+00
5447	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	67	2021-07-13 23:45:37.527+00	2021-07-13 23:45:37.527+00
5448	127.0.0.1	admin.areas.estruturas.index	/admin/areas/estruturas	GET	33	2021-07-13 23:45:38.299+00	2021-07-13 23:45:38.299+00
5449	127.0.0.1	admin.areas.minas.index	/admin/areas/minas	GET	33	2021-07-13 23:45:40.14+00	2021-07-13 23:45:40.14+00
5450	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:45:40.963+00	2021-07-13 23:45:40.963+00
5451	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	67	2021-07-13 23:45:42.607+00	2021-07-13 23:45:42.607+00
5452	127.0.0.1	admin.areas.complexos.index	/admin/areas/complexos	GET	33	2021-07-13 23:45:42.907+00	2021-07-13 23:45:42.907+00
5453	127.0.0.1	admin.areas.furos.index	/admin/areas/furos	GET	33	2021-07-13 23:45:44.655+00	2021-07-13 23:45:44.655+00
5454	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	67	2021-07-13 23:46:13.799+00	2021-07-13 23:46:13.799+00
5455	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	33	2021-07-13 23:46:18.236+00	2021-07-13 23:46:18.236+00
5456	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	67	2021-07-13 23:46:24.525+00	2021-07-13 23:46:24.525+00
5457	127.0.0.1	api.rdos.store	/api/rdos	POST	33	2021-07-14 00:15:58.808+00	2021-07-14 00:15:58.808+00
5458	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 01:37:05.073+00	2021-07-14 01:37:05.073+00
5459	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 04:46:52.214+00	2021-07-14 04:46:52.214+00
5460	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 05:43:25.759+00	2021-07-14 05:43:25.759+00
5461	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 06:07:34.606+00	2021-07-14 06:07:34.606+00
5462	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 06:16:13.503+00	2021-07-14 06:16:13.503+00
5463	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-14 10:49:40.577+00	2021-07-14 10:49:40.577+00
5464	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-14 10:49:40.833+00	2021-07-14 10:49:40.833+00
5465	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 11:24:13.436+00	2021-07-14 11:24:13.436+00
5466	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 11:35:55.236+00	2021-07-14 11:35:55.236+00
5467	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 11:46:08.02+00	2021-07-14 11:46:08.02+00
5468	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 11:46:09.129+00	2021-07-14 11:46:09.129+00
5469	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 14:37:46.84+00	2021-07-14 14:37:46.84+00
5470	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 14:37:46.995+00	2021-07-14 14:37:46.995+00
5471	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 14:37:50.185+00	2021-07-14 14:37:50.185+00
5472	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 14:38:03.829+00	2021-07-14 14:38:03.829+00
5473	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:38:12.603+00	2021-07-14 14:38:12.603+00
5474	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-07-14 14:38:15.752+00	2021-07-14 14:38:15.752+00
5475	127.0.0.1	admin.atividades.store	/admin/atividades	POST	34	2021-07-14 14:38:30.712+00	2021-07-14 14:38:30.712+00
5476	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:38:30.878+00	2021-07-14 14:38:30.878+00
5477	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:38:35.068+00	2021-07-14 14:38:35.068+00
5478	127.0.0.1	admin.atividades.destroy	/admin/atividades/115	DELETE	34	2021-07-14 14:38:40.538+00	2021-07-14 14:38:40.538+00
5479	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:38:40.719+00	2021-07-14 14:38:40.719+00
5480	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:38:45.108+00	2021-07-14 14:38:45.108+00
5481	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:38:48.162+00	2021-07-14 14:38:48.162+00
5482	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:38:51.041+00	2021-07-14 14:38:51.041+00
5483	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:38:53.717+00	2021-07-14 14:38:53.717+00
5484	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-14 14:39:06.191+00	2021-07-14 14:39:06.191+00
5485	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-14 14:39:13.682+00	2021-07-14 14:39:13.682+00
5486	127.0.0.1	admin.users.create	/admin/users/create	GET	34	2021-07-14 14:39:18.586+00	2021-07-14 14:39:18.586+00
5487	127.0.0.1	admin.users.store	/admin/users	POST	34	2021-07-14 14:40:08.482+00	2021-07-14 14:40:08.482+00
5488	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-14 14:40:08.674+00	2021-07-14 14:40:08.674+00
5489	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 14:40:25.738+00	2021-07-14 14:40:25.738+00
5490	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 14:41:22.922+00	2021-07-14 14:41:22.922+00
5491	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 14:41:24.093+00	2021-07-14 14:41:24.093+00
5492	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 14:41:35.575+00	2021-07-14 14:41:35.575+00
5493	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 14:45:36.925+00	2021-07-14 14:45:36.925+00
5494	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 14:45:38.759+00	2021-07-14 14:45:38.759+00
5495	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 14:45:45.804+00	2021-07-14 14:45:45.804+00
5496	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 14:46:06.806+00	2021-07-14 14:46:06.806+00
5497	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 14:47:11.907+00	2021-07-14 14:47:11.907+00
5498	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-14 14:47:16.202+00	2021-07-14 14:47:16.202+00
5499	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 14:47:16.365+00	2021-07-14 14:47:16.365+00
5500	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 14:47:18.1+00	2021-07-14 14:47:18.1+00
5501	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 14:47:19.205+00	2021-07-14 14:47:19.205+00
5502	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 16:23:16.327+00	2021-07-14 16:23:16.327+00
5503	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 19:24:28.667+00	2021-07-14 19:24:28.667+00
5504	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-14 19:35:42.385+00	2021-07-14 19:35:42.385+00
5505	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-14 19:35:42.594+00	2021-07-14 19:35:42.594+00
5506	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 19:40:01.716+00	2021-07-14 19:40:01.716+00
5507	127.0.0.1	sessions.store	/sessions	POST	73	2021-07-14 19:40:13.625+00	2021-07-14 19:40:13.625+00
5508	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-14 19:40:13.804+00	2021-07-14 19:40:13.804+00
5509	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	73	2021-07-14 19:41:24.252+00	2021-07-14 19:41:24.252+00
5510	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	73	2021-07-14 19:41:26.478+00	2021-07-14 19:41:26.478+00
5511	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 19:44:51.985+00	2021-07-14 19:44:51.985+00
5512	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 19:44:52.175+00	2021-07-14 19:44:52.175+00
5513	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-14 19:45:20.26+00	2021-07-14 19:45:20.26+00
5514	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-14 19:45:39.041+00	2021-07-14 19:45:39.041+00
5515	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 19:45:42.302+00	2021-07-14 19:45:42.302+00
5516	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-14 19:45:43.95+00	2021-07-14 19:45:43.95+00
5517	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 19:45:57.578+00	2021-07-14 19:45:57.578+00
5518	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-14 19:46:01.587+00	2021-07-14 19:46:01.587+00
5519	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 19:46:01.74+00	2021-07-14 19:46:01.74+00
5520	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-14 19:46:13.536+00	2021-07-14 19:46:13.536+00
5521	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 19:46:13.701+00	2021-07-14 19:46:13.701+00
5522	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 19:46:14.526+00	2021-07-14 19:46:14.526+00
5523	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-14 19:46:15.646+00	2021-07-14 19:46:15.646+00
5524	127.0.0.1	admin.reports.atividades_usuarios.index	/admin/reports/atividades-usuarios	GET	34	2021-07-14 19:46:29.418+00	2021-07-14 19:46:29.418+00
5525	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 19:46:50.555+00	2021-07-14 19:46:50.555+00
5526	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 19:47:43.665+00	2021-07-14 19:47:43.665+00
5527	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 19:47:51.219+00	2021-07-14 19:47:51.219+00
5528	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 19:48:44.805+00	2021-07-14 19:48:44.805+00
5529	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 19:49:08.406+00	2021-07-14 19:49:08.406+00
5530	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 19:52:41.374+00	2021-07-14 19:52:41.374+00
5531	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 20:00:22.194+00	2021-07-14 20:00:22.194+00
5532	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-14 20:00:29.954+00	2021-07-14 20:00:29.954+00
5533	127.0.0.1	admin.users.create	/admin/users/create	GET	34	2021-07-14 20:00:49.087+00	2021-07-14 20:00:49.087+00
5534	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 20:01:01.703+00	2021-07-14 20:01:01.703+00
5535	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-07-14 20:01:04.111+00	2021-07-14 20:01:04.111+00
5536	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-07-14 20:01:09.226+00	2021-07-14 20:01:09.226+00
5537	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-14 20:01:10.661+00	2021-07-14 20:01:10.661+00
5538	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-07-14 20:01:20.191+00	2021-07-14 20:01:20.191+00
5539	127.0.0.1	admin.cargos.create	/admin/cargos/create	GET	34	2021-07-14 20:01:22.626+00	2021-07-14 20:01:22.626+00
5540	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 20:01:23.753+00	2021-07-14 20:01:23.754+00
5541	127.0.0.1	admin.cargos.index	/admin/cargos	GET	34	2021-07-14 20:01:34.174+00	2021-07-14 20:01:34.174+00
5542	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 20:01:38.113+00	2021-07-14 20:01:38.113+00
5543	127.0.0.1	admin.atividades.create	/admin/atividades/create	GET	34	2021-07-14 20:01:46.918+00	2021-07-14 20:01:46.918+00
5544	127.0.0.1	admin.atividades.index	/admin/atividades	GET	34	2021-07-14 20:01:59.856+00	2021-07-14 20:01:59.856+00
5545	127.0.0.1	admin.atividades.edit	/admin/atividades/25/edit	GET	34	2021-07-14 20:02:04.53+00	2021-07-14 20:02:04.53+00
5546	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 20:03:02.176+00	2021-07-14 20:03:02.176+00
5547	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 20:03:04.475+00	2021-07-14 20:03:04.475+00
5548	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 20:03:39.048+00	2021-07-14 20:03:39.048+00
5549	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 20:04:25.602+00	2021-07-14 20:04:25.602+00
5550	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 20:04:33.86+00	2021-07-14 20:04:33.86+00
5551	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-07-14 20:04:55.592+00	2021-07-14 20:04:55.592+00
5552	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 20:04:58.106+00	2021-07-14 20:04:58.106+00
5553	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 20:04:59.583+00	2021-07-14 20:04:59.583+00
5554	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 20:05:05.477+00	2021-07-14 20:05:05.477+00
5555	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-14 20:05:14.692+00	2021-07-14 20:05:14.692+00
5556	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 20:05:14.854+00	2021-07-14 20:05:14.854+00
5557	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 20:05:16.137+00	2021-07-14 20:05:16.137+00
5558	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 20:05:18.034+00	2021-07-14 20:05:18.034+00
5559	127.0.0.1	admin.reports.producao_usuarios.index	/admin/reports/producao-usuarios	GET	34	2021-07-14 20:05:31.026+00	2021-07-14 20:05:31.026+00
5560	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-14 20:07:04.664+00	2021-07-14 20:07:04.664+00
5561	127.0.0.1	admin.rdos.show	/admin/rdos/113	GET	34	2021-07-14 20:07:23.588+00	2021-07-14 20:07:23.588+00
5562	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 20:08:42.446+00	2021-07-14 20:08:42.446+00
5563	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 20:08:46.283+00	2021-07-14 20:08:46.283+00
5564	127.0.0.1	admin.reports.distribuicao_atividades.index	/admin/reports/distribuicao-atividades	GET	34	2021-07-14 20:09:08.742+00	2021-07-14 20:09:08.742+00
5565	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-14 20:16:46.732+00	2021-07-14 20:16:46.732+00
5566	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 20:16:48.98+00	2021-07-14 20:16:48.98+00
5567	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-14 20:16:53.333+00	2021-07-14 20:16:53.333+00
5568	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 20:16:53.503+00	2021-07-14 20:16:53.503+00
5569	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-14 20:16:55.869+00	2021-07-14 20:16:55.869+00
5570	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 20:17:05.793+00	2021-07-14 20:17:05.793+00
5571	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-14 20:17:10.244+00	2021-07-14 20:17:10.244+00
5572	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 20:17:12.531+00	2021-07-14 20:17:12.531+00
5573	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-14 20:17:14.099+00	2021-07-14 20:17:14.099+00
5574	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 20:17:16.743+00	2021-07-14 20:17:16.743+00
5575	127.0.0.1	admin.configuracoes.store	/admin/configuracoes	POST	34	2021-07-14 20:17:21.116+00	2021-07-14 20:17:21.116+00
5576	127.0.0.1	admin.configuracoes.index	/admin/configuracoes	GET	34	2021-07-14 20:17:21.334+00	2021-07-14 20:17:21.334+00
5577	127.0.0.1	admin.rdos.index	/admin/rdos	GET	34	2021-07-14 20:17:23.124+00	2021-07-14 20:17:23.124+00
5578	127.0.0.1	admin.rdos.show	/admin/rdos/113	GET	34	2021-07-14 20:17:26.043+00	2021-07-14 20:17:26.043+00
5579	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 20:17:38.52+00	2021-07-14 20:17:38.52+00
5580	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 20:35:36.501+00	2021-07-14 20:35:36.501+00
5581	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 20:35:37.862+00	2021-07-14 20:35:37.862+00
5582	127.0.0.1	admin.equipamentos.index	/admin/equipamentos	GET	34	2021-07-14 20:35:41.555+00	2021-07-14 20:35:41.555+00
5583	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-14 20:35:42.223+00	2021-07-14 20:35:42.223+00
5584	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-14 20:35:42.888+00	2021-07-14 20:35:42.888+00
5585	127.0.0.1	admin.users.edit	/admin/users/66/edit	GET	34	2021-07-14 20:35:45.925+00	2021-07-14 20:35:45.925+00
5586	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-14 20:38:58.952+00	2021-07-14 20:38:58.952+00
5587	127.0.0.1	admin.dashboard.index	/admin/dashboard	GET	34	2021-07-14 20:38:59.116+00	2021-07-14 20:38:59.116+00
5588	127.0.0.1	admin.users.index	/admin/users	GET	34	2021-07-14 20:39:15.323+00	2021-07-14 20:39:15.323+00
5589	127.0.0.1	admin.users.edit	/admin/users/66/edit	GET	34	2021-07-14 20:39:18.787+00	2021-07-14 20:39:18.787+00
5590	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	67	2021-07-14 22:29:20.79+00	2021-07-14 22:29:20.79+00
5591	127.0.0.1	api.sync_data.index	/api/sync-data	GET	67	2021-07-14 22:29:21.022+00	2021-07-14 22:29:21.022+00
5592	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-15 00:31:56.598+00	2021-07-15 00:31:56.598+00
5593	127.0.0.1	api.sync_data.index	/api/sync-data	GET	33	2021-07-15 00:31:56.846+00	2021-07-15 00:31:56.846+00
5594	127.0.0.1	api.sync_version_is_outdated.index	/api/sync-version-is-outdated	GET	33	2021-07-15 00:37:29.506+00	2021-07-15 00:37:29.506+00
5595	127.0.0.1	sessions.index	/sessions	GET	\N	2021-07-15 01:18:34.496+00	2021-07-15 01:18:34.496+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: varao
--

COPY public.users (id, nome, cpf, password, remember_me_token, cargo_id, contrato_id, banco, agencia, conta, operacao_caixa, created_at, updated_at) FROM stdin;
24	Lairton Ferreira de Oliveira	82888094215	$argon2id$v=19$t=3,m=4096,p=1$DpBeIpgXOGqbkNcgctv+oA$YgT5jIHXWKeoNHClChsPi3ojAKe5wF5BIB0Ka3cJMmc	\N	19	2	Brasil	1104-5 	18375-X	\N	2021-06-20 17:58:28.679+00	2021-06-20 17:58:28.679+00
35	Josenilton dos Santos Barbosa	87510790549	$argon2id$v=19$t=3,m=4096,p=1$/ckhfLvDeFwt1bEJA14qWg$K6VVguTANS6ZcxeabRHDRI69QOOi33QAL/xr6pR5Ato	\N	30	1	Banco Itaú	2639	14598-2	\N	2021-06-22 12:21:42.891+00	2021-06-22 12:21:42.891+00
36	Antônio Carneiro	28800281249	$argon2id$v=19$t=3,m=4096,p=1$NR/REGNzKnKkjRs44fiepw$dJxkaI+Q7LiAePqkZMDwWDiXJmj/xrYOOfpwPYoCTQ8	\N	31	1	Caixa Econômica Federal	0097	62523-0	013	2021-06-22 12:24:23.654+00	2021-06-22 12:24:23.654+00
1	Admin	00000000000	$argon2id$v=19$t=3,m=4096,p=1$d7amIe6sdytuWiCGCx9qqg$BJJ08EMulhLFuejjwHolrEO7o6pn1gJ7nJARN9QUPDU	\N	2	\N	Banco do Brasil	102-0	746247-1	013	2021-05-12 13:35:43.321+00	2021-06-01 18:41:53.678+00
25	Leonardo dos Santos de Oliveira	04713335223	$argon2id$v=19$t=3,m=4096,p=1$oZsuwPhrbk4IQWwTHyFcZg$ncCXqzIwfcn6WbnKxe/e/c5MXy4upr3tqmi/hGKtQE8	\N	12	2	Bradesco	1961-5	0027733-9	\N	2021-06-20 17:59:44.106+00	2021-06-20 17:59:44.106+00
37	Carlos Neves do Santos	04808818558	$argon2id$v=19$t=3,m=4096,p=1$RU0G8azofokbcuQ2no3PIw$v4Jkv5smIEHvqlBoOaPcs6xCfpu1nDCKu4Jw+8DMnrI	\N	30	1	Caixa Econômica Federal	3729 	00030535-2	013	2021-06-22 12:27:36.211+00	2021-06-22 12:27:36.211+00
6	Amauri da Costa Tavares	00142463256	$argon2id$v=19$t=3,m=4096,p=1$IpFf8AYYv1b80eRhPH/g6Q$6eJp90O3RbT2l2W38FMqKtf06hs8/KG7TN3vTwduR9k	\N	11	2	Brasil	3274-3	9431-5	0	2021-06-18 14:46:42.112+00	2021-06-18 14:52:10.993+00
7	Wesley Batista dos Santos	04466005125	$argon2id$v=19$t=3,m=4096,p=1$MsngbdTIhJutA6RjBTVouw$QmbRUo6kSO6uYNuN06tAO0GiLV7sxslzfJnXzsXIQqk	\N	17	2	Bradesco	0470	794-3	0	2021-06-18 15:35:36.321+00	2021-06-18 15:35:36.321+00
8	Dilmar Souza dos Santos	71638210268	$argon2id$v=19$t=3,m=4096,p=1$/9uHAIAJJTgPj0yT9woAvw$YomNXoKx1NWmxkWluCE+3fzD2e5Lh3LzMh1+EJeBq5k	\N	17	2	Caixa	0994	000829676627-0	1288	2021-06-18 15:44:05.977+00	2021-06-18 15:44:05.977+00
10	Aucélio Costa Formiga	05441653493	$argon2id$v=19$t=3,m=4096,p=1$iu4x5sZ/+M2oO2550IQXYA$eSaVqS45H+pebAEq3mwr/yStnuhFc58lolPtInvQaoo	\N	16	2	Brasil	0521-5	63424-7 	0	2021-06-18 19:18:24.076+00	2021-06-18 19:18:24.076+00
11	Alan Santana da Cruz	09323376481	$argon2id$v=19$t=3,m=4096,p=1$od5SelIlgi39tBBvP/geIQ$8RmkA2//ZOMxCGjxUEcKrP7GxtI6xqwDMnWhf3tkhGk	\N	13	2	Nubank	0001	19425560-1	0	2021-06-18 19:21:17.6+00	2021-06-18 19:22:37.848+00
12	Benedito Marcos abreu Frazão 	87418592272	$argon2id$v=19$t=3,m=4096,p=1$fl/0e95hqP0INbneDSbK0Q$fbCoVOnN6M525WUhzHwLFxf6Zgh8BJZVqXLo2ucNEi8	\N	14	2	Brasil	130-9	88958-X	0	2021-06-18 19:25:00.966+00	2021-06-18 19:25:00.966+00
13	Bruno Damasceno Trolezi	09898899638	$argon2id$v=19$t=3,m=4096,p=1$n8E9nQTzwBZOKrzM6sTXdw$sFSzqwBaoQM4syszvKsgmp7fF4d/kpElz+vdYHzfpS0	\N	13	2	Bradesco	5766	5072-5	0	2021-06-18 19:27:08.367+00	2021-06-18 19:27:08.367+00
14	Diego Mendes Siqueira	01961350289	$argon2id$v=19$t=3,m=4096,p=1$22vHFbgAaxNN1S+3pVY3Cg$rerVMzao7ktvNmHWDlejE5AXEqpa+zUyc3FY9UduCGI	\N	15	2	Bradesco	1961-5	592192-9	0	2021-06-18 19:28:58.52+00	2021-06-18 19:28:58.52+00
26	Natalino dos Santos Souza	00588996181	$argon2id$v=19$t=3,m=4096,p=1$fG+T2z/AlIjTUxkA1TkMlg$yyji6CfYfqJsw5hBNm+vVDM8lHnQOr0OI1tP5vdoz8I	\N	14	2	Caixa	1626	0056278-3	\N	2021-06-20 18:00:59.366+00	2021-06-20 18:00:59.366+00
9	Adenilso Oliveira dos Santos	02007235960	$argon2id$v=19$t=3,m=4096,p=1$aDnqEmk4QkxzHHInxieZ/g$Moxlun7MiwKw4XJle8RC6ybLWjuga/SHrow79E3Bh8w	\N	25	2	Bradesco	1961-5	01052-9	0	2021-06-18 19:16:40.482+00	2021-06-20 17:29:03.65+00
16	Edinelson da Silva Lima 	65982916234	$argon2id$v=19$t=3,m=4096,p=1$/T/Ue6prZB5iJdb4o+qbFA$C2/s2SqlRFkSj6uzLSHP5f3OxlH6OGiUrpSvCYl3dAc	\N	25	2	Bradesco	1961-5	11107-4	\N	2021-06-20 17:44:25.429+00	2021-06-20 17:44:25.429+00
17	Elias Alves da Silva	77782925304	$argon2id$v=19$t=3,m=4096,p=1$PI3epr4cIFjSucoli2nQGQ$m4pRww9pAM/e2MMwUIyIYofCJ91QzK1VUDm13bOinvQ	\N	14	2	Bradesco	5732	10923-1	\N	2021-06-20 17:45:46.477+00	2021-06-20 17:45:46.477+00
18	Erismar Mota Ribeiro	03592637207	$argon2id$v=19$t=3,m=4096,p=1$4L0n3OaR5VOsf5EmR7vCVA$Wz5UcfJb7F98Yl46gTLJcCnSbfgGcEmldo9mYIlB4lU	\N	15	2	Bradesco	1961-5	26768-6	\N	2021-06-20 17:46:54.496+00	2021-06-20 17:46:54.496+00
19	Gerson Alves Dias	63834200204	$argon2id$v=19$t=3,m=4096,p=1$cSJWAfYrz8h3LTKd+JAnnQ$mfAj206BXKQvf9LsecsOj6dUAoE0N57NthMnhFo0nD0	\N	14	2	Bradesco	0759	42941-4	\N	2021-06-20 17:48:15.715+00	2021-06-20 17:48:15.715+00
20	Heber Gomes Viana	49623346204	$argon2id$v=19$t=3,m=4096,p=1$Jf405eXyPmclSeXl07W+jQ$uAYg2QYcRafbTEAdf11wh4cfjc6OO56TomjV3ePCaqo	\N	26	2	Bradesco	1961-5	0017275-8	\N	2021-06-20 17:50:01.506+00	2021-06-20 17:50:01.506+00
21	Jardel de Oliveira Mesquita	02964533237	$argon2id$v=19$t=3,m=4096,p=1$qEThh2XaIQwKOI2pvmxU+g$w+T35IsEsX+DlVJtwRgSi1J1koylPE910fMtqcrBNsk	\N	15	2	Brasil	3274-3	18.395-4	\N	2021-06-20 17:53:12.249+00	2021-06-20 17:53:12.249+00
22	Iury Oliveira Santos Avelar	09568631674	$argon2id$v=19$t=3,m=4096,p=1$y7NoFC9Ug84shwmVRlpbcA$379RiWCZiVhrL0ZzWl7Q8jctcp50BrzQtiKXRa70RbM	\N	27	2	Santander	3040	1088232-7	\N	2021-06-20 17:55:32.592+00	2021-06-20 17:55:32.592+00
23	Josivan Rodrigues Leite	69092923249	$argon2id$v=19$t=3,m=4096,p=1$AT6bA9kWF5uHwcR+xh+RXA$XbkRd7C8vk0I/Yq4QT7FILR0Gdx5TaDd0kpjp49k4/M	\N	14	2	Caixa	3575	00012520-0	\N	2021-06-20 17:57:07.421+00	2021-06-20 17:57:07.421+00
27	Nestogildo Gomes Barbosa	57909768249	$argon2id$v=19$t=3,m=4096,p=1$uRD/n0KdqxQ8IZJvCjhZwQ$h6GxScguAnXh0pPczcuDIKWfwIXAjbii2OHmpRskcOs	\N	14	2	Bradesco	1961-5	0010919-3	\N	2021-06-20 18:02:26.294+00	2021-06-20 18:02:26.294+00
28	Nilson Mesquita de Oliveira	01341493270	$argon2id$v=19$t=3,m=4096,p=1$Df0cxknlgJ3acXeadywnkw$Q5j2zxIaluft6NCDswcoXenu9qBfhJnRaSXohhzuAwE	\N	13	2	Bradesco	1961-5	35451-1	\N	2021-06-20 18:05:00.659+00	2021-06-20 18:05:00.659+00
29	Walterson Pinto de Oliveira	38578735153	$argon2id$v=19$t=3,m=4096,p=1$h7UNUvJO9CBLwfMRtf9KHw$Wk9XzxBF2SPn9Gy1U4nGzzRhRBPpoLpsgDZJs6g3eAo	\N	18	2	Bradesco	0470-7	3240-9	\N	2021-06-20 18:06:03.151+00	2021-06-20 18:06:03.151+00
30	Ronisson Mesquita de Oliveira	03775538240	$argon2id$v=19$t=3,m=4096,p=1$JPglIPMGAq0PkgpRmhRZGg$Lq005Nzh3PTvBwFPT43s1SzVqKXR9aRV1UUpe1fXdOk	\N	19	2	Itaú	1351	79258-3	\N	2021-06-20 18:07:16.223+00	2021-06-20 18:07:16.223+00
31	Tiago Ramos do Nascimento	02552227262	$argon2id$v=19$t=3,m=4096,p=1$4PI41FWd96R25rPXawuWtA$d6GBVMhZE7brcmt6UzxfM7L34n/Ar0iKhYlWyX1srU4	\N	22	2	Bradesco	1208-4	0009857-4	\N	2021-06-20 18:08:19.282+00	2021-06-20 18:08:19.282+00
32	Gilmar José dos Santos Júnior	02540491251	$argon2id$v=19$t=3,m=4096,p=1$+Ahr+R4l3bhROExmkMgrrg$P1A4L0iye14AfsqYaSnxK//fQKLSQexbYXxBbjM6u7g	\N	24	2	Brasil	3274-3	18696-1	\N	2021-06-21 19:56:44.21+00	2021-06-21 19:56:44.21+00
33	Cleberson da Silva Vieira	01375910205	$argon2id$v=19$t=3,m=4096,p=1$rZtogG6UAuUIsOXkl2nDLA$0twFC4eJIcPZGBAXvpMheB8WvP/DK06JNTOfWPaqT0s	\N	28	1	Banco do Brasil	0256	196193	\N	2021-06-21 22:05:08.511+00	2021-06-21 22:05:08.511+00
34	Simmon Viegas de Souza	00738036269	$argon2id$v=19$t=3,m=4096,p=1$YR0VG6dG58n3y74AUyp79w$3a3TGWxAJWlwRiIGxfaPG0RhHcWKlTk5lGDq4nIJw3w	\N	34	1	Banco do Brasil	2447	583413	\N	2021-06-22 01:53:24.646+00	2021-06-22 01:53:24.646+00
38	Claudio Henrique Junior 	11063299454	$argon2id$v=19$t=3,m=4096,p=1$RyPaYLpA3tPuqYNylNxfrA$bqp8EtqlcX15tQwH0EjN7DRDZKzXXpahupC3VReyitM	\N	32	1	Caixa Econômica Federal	 0732	15441-7	013	2021-06-22 12:29:48.16+00	2021-06-22 12:29:48.16+00
39	Clodoaldo Camilo Oliveira	59138785668	$argon2id$v=19$t=3,m=4096,p=1$DxrBtEBFetLyObjXnsTsDg$3JxJzDcGD13+KjLZoyEuE98msLQkW9swvRgihkZNXjI	\N	33	1	Caixa Econômica Federal	0134	00063111-7	013	2021-06-22 12:31:59.193+00	2021-06-22 12:31:59.193+00
40	José Eduardo de Souza Lima	64739325691	$argon2id$v=19$t=3,m=4096,p=1$yP28F1Y8LSYaANb6nibZZg$HZc0IuLysl1RTBX/vK23FCRhJ74Zv+KEqlpEmX3I3W4	\N	30	1	Caixa Econômica Federal	2983	49331-0	013	2021-06-22 12:34:33.712+00	2021-06-22 12:34:33.712+00
41	Markison Johnata dos Santos Silva 	01973020688	$argon2id$v=19$t=3,m=4096,p=1$kbnLVjm2AQZ6qSgBFwIr9g$+sBIDOQRPKx6QLjl7FTQUNUeMPBhstNYDxE2X7K3kYk	\N	30	1	Caixa Econômica Federal	 0094	18436-0	013	2021-06-22 12:37:16.791+00	2021-06-22 12:37:16.791+00
43	Silvanio Ferreira Lima	34974730819	$argon2id$v=19$t=3,m=4096,p=1$uytd/d6kX2YvCxdDJxtSRg$4Vm8I6XNJEzSBLNSElQ6ABJl0Y5kqji0MOH35cZdCyM	\N	32	1	Caixa Econômica Federal	0111 	25164-5	013	2021-06-22 12:45:12.286+00	2021-06-22 12:45:12.286+00
44	Wellington de Araújo Souza	10242628478	$argon2id$v=19$t=3,m=4096,p=1$ZU6A2mCyytx0y+V9ksVDfg$oqhLSj0LeyiNe4VAZQd6YJ4+G1OneN8w9L840w4dY1s	\N	30	1	Caixa Econômica Federal	4916	00012864-6	013	2021-06-22 12:53:58.406+00	2021-06-22 12:53:58.406+00
46	José Antônio Marques	04569188680	$argon2id$v=19$t=3,m=4096,p=1$r6w10BKAYmaWQ42xCYZ5JQ$tFTWwEWFTZ4flbnBRfmvfUFLCBWyuOa/OkwHYvkLvg0	\N	29	1	Caixa Econômica Federal	2133	00000506-2	013	2021-06-22 13:00:46.968+00	2021-06-22 13:00:46.968+00
47	Ivanilton Cesar Cardoso Santos	99822369549	$argon2id$v=19$t=3,m=4096,p=1$1j+PQVp2WdjjeEOVBaIgYw$MA2Pi85PFBRhEI4d8QcsOvkRvWK2FAygm/rk/WK9zAc	\N	29	1	Caixa Econômica Federal	0634	108797-4	013	2021-06-22 13:04:22.444+00	2021-06-22 13:04:22.444+00
48	Wellington Ramos Marinho da Silva	06694191685	$argon2id$v=19$t=3,m=4096,p=1$3HmXaqetmQ2A3jIA0kGKBA$xws9HJYBek9UxDjsb04xNVADuZSCiyNRh3h5DlF4K/I	\N	30	1	Bradesco	2483	0021513-9	\N	2021-06-22 13:07:08.836+00	2021-06-22 13:07:08.836+00
51	Dalton Cesar de Assis	03964815667	$argon2id$v=19$t=3,m=4096,p=1$lfGzGfsINUvuRymmlNjdiA$NDvr18G9Bu7Gx1mib/Py7Wltg5a25Yc+ZFehMRSxRrg	\N	29	1	Bradesco	2671	7762-3	\N	2021-06-22 13:19:06.485+00	2021-06-22 13:19:06.485+00
52	Franklin Quintino Honorio	05309833625	$argon2id$v=19$t=3,m=4096,p=1$0wAMAFCin2zeKcT1QzhSeQ$IdcbwzQ1TIoQvmcyIYskUQ6MIvDaPZm+03+CZyg9ywg	\N	30	1	Bradesco	1203-3	38398-8	\N	2021-06-22 13:20:52.565+00	2021-06-22 13:20:52.565+00
53	Flavio Vieira de Aguiar	01195801106	$argon2id$v=19$t=3,m=4096,p=1$7A5UpW/wWa7nIwSQfG1RkA$Wvg0Nxh0Ij9AU4lO7s1NfDQcJtO4JrFIYqlJzkyosCc	\N	31	1	Bradesco	0804-4	540643-9	\N	2021-06-22 13:22:33.856+00	2021-06-22 13:22:33.856+00
55	Filipe José dos Santos 	10361955626	$argon2id$v=19$t=3,m=4096,p=1$xp6o9v0eilQJACtp04NoVw$76D8P7F58UR9JM6AbGtzf73SMmZgxhBeKZ1uKhxjd88	\N	30	1	Banco do Brasil	09024	33915-6	\N	2021-06-22 13:28:29.249+00	2021-06-22 13:28:29.249+00
56	Geovanio Marcos dos Santos 	04997988642	$argon2id$v=19$t=3,m=4096,p=1$wWDs9ScQ/SS5ziUrQiQVsw$KHfOCe+hhNZxO87TQzT5+ugzhYJ0uaONbUfe1q4/IUM	\N	35	1	Banco do Brasil	0210-0 	64541-9	\N	2021-06-22 16:39:44.102+00	2021-06-22 16:39:44.102+00
58	Douglas Willian Martins Silva	06812401641	$argon2id$v=19$t=3,m=4096,p=1$j1i7ylrDlcH5hI80gRTqbw$TBt3hwFw2na+vBi9KABKviKg0eAjIyG3xPGGGKPnjMI	\N	30	1	Santander	3918 	010817814	\N	2021-06-22 16:44:34.52+00	2021-06-22 16:44:34.52+00
59	Márcio Fernandes dos Reis	42580030697	$argon2id$v=19$t=3,m=4096,p=1$m8EvYpjrHI766rc+vk3GGg$a3Qr+wwRJ+HLJTuteFg9eGSGLRRMvIB9pXvVxqThzfo	\N	33	1	Santander	3503	01087548-0	\N	2021-06-22 16:47:05.977+00	2021-06-22 16:47:05.977+00
62	Márcio André Pereira de Souza	98705571553	$argon2id$v=19$t=3,m=4096,p=1$jyVLn/e6YKvZFWcOHMnZww$+zyDQpAaldzBQ1bTK1U//0qJggonRiw/oGGBgQMCNc0	\N	29	1	Banco 623	0001 	009103322-7	\N	2021-06-22 16:54:30.149+00	2021-06-22 16:54:30.149+00
65	Cristiano do Carmo Gonçalves	10896030610	$argon2id$v=19$t=3,m=4096,p=1$dYzN/v7ELigYcwtMbye5mg$SflVmA9T5DF3rQz6S9Tj9TJmG5ZK4K3wuJkYN/gw3BE	\N	29	1	Nubank	0001	40603539-4	\N	2021-06-22 17:00:14.198+00	2021-06-22 17:00:14.198+00
61	Cristiano Andrade Batista	08605507616	$argon2id$v=19$t=3,m=4096,p=1$7e9f0e0PK93gXYR+0SlZlA$wYilVgO2n4EHFsMynrsWWNozhC/XyTNEGR2IX/GMccM	\N	30	1	Santander	3483	010723537	\N	2021-06-22 16:52:01.982+00	2021-06-26 22:12:14.718+00
66	Andriel Lima Santos	05897473552	$argon2id$v=19$t=3,m=4096,p=1$4npzgoe8i3jm5DkKj/lCNw$HWUtA9iOjRoYViCxdAoMc/IrsxRbHMEqZSNYtoEMZm4	\N	28	1	Bradesco	3064-3	629281-0	\N	2021-06-27 22:17:19.727+00	2021-06-27 22:17:19.727+00
68	Claudinei de Souza Leite	04376537659	$argon2id$v=19$t=3,m=4096,p=1$6BzEOLpIDkMnB4kN7BTqYA$G7VYDHcK5AwJEWqL1CWl5tQJivbBYUm9F/+wbTC8vLc	\N	31	1	Santander	3155	02010072-4	\N	2021-06-28 17:05:28.678+00	2021-06-28 17:05:28.678+00
69	Allan Henrique Hermogenes	12364735661	$argon2id$v=19$t=3,m=4096,p=1$lrtOba5Bajug84IEyPMZOQ$rESUSEm9oN29vF0zqE/QRAKvkFZ5axlvzmQxHQLbEAs	\N	33	1	Caixa Econômica Federal	4392	00012810-0	013	2021-06-28 17:08:07.612+00	2021-06-28 17:08:07.612+00
70	Edivaldo Honorato da Silva	33168999873	$argon2id$v=19$t=3,m=4096,p=1$g+NJyvGL7JT1otVEvy3Bag$6gfjdlMbzGjO3tDnaQDILUhRjgroxzlDwEhAJZ6bNfs	\N	30	1	Caixa Econômica Federal	1441	00025476-5	013	2021-06-28 17:11:49.093+00	2021-06-28 17:11:49.093+00
71	Washington Luiz	00000039339	$argon2id$v=19$t=3,m=4096,p=1$Ca9kDtdxvy9teBgSdD10ng$VbEIVDyXCd9Izr2fVEq+umN214mGi6P95lHcuXbYQfY	\N	37	1	x	0000	h8990	0000	2021-07-01 19:54:57.143+00	2021-07-01 19:54:57.143+00
67	Rafael Ferreira Lima	01678472280	$argon2id$v=19$t=3,m=4096,p=1$yt2OdkgbNYjsVbblZbzakw$RSxDHcM5VUFyFNSR3FvsAAnEElmWWTjdB0lA+MM3sY4	\N	28	1	Banco do Brasil	4247-1	18287-7	\N	2021-06-27 22:18:04.907+00	2021-07-01 22:08:36.369+00
73	Dalton Felipe	03935644280	$argon2id$v=19$t=3,m=4096,p=1$Gt0J4w51qLC5MdO1mmjJow$9q9GR5CdcB8ZsIMyas6bVAeifuhQ4JqaSaylw15j5q8	\N	38	2	Banco do Brasil	0130-1	97951-2	\N	2021-07-01 23:48:21.09+00	2021-07-01 23:48:21.09+00
74	Gustavo Costa	00000000000	$argon2id$v=19$t=3,m=4096,p=1$bEc2ZxL/9xdU1so48TR/4g$ubyUAR4OsvsCuxLXNEY95dLjWCVjBDEpJuvFfCkE7C8	\N	31	1	000000	000000	000000	000000	2021-07-08 22:41:32.528+00	2021-07-08 22:44:55.156+00
75	Joaquim Aparecido	00000000000	$argon2id$v=19$t=3,m=4096,p=1$jf1rkQTTDOhnVoy51sP01g$7PAxR4YyGdoff2rf5OQdjISUspPrJ9lzlQ5RvEAnvCA	\N	30	1	000000	000000	000000	000000	2021-07-08 22:46:08.299+00	2021-07-08 22:46:08.299+00
76	William	00202929202	$argon2id$v=19$t=3,m=4096,p=1$r8ThRiUtmZ2A+dO99lj1jA$qCN8UAOMP3D9462e0/kE6PQmry3ebLUMI/KE2MOskVQ	\N	30	1	Banco 623	xxx	xxx	\N	2021-07-12 00:22:52.354+00	2021-07-12 00:22:52.354+00
72	Giovanny Reis	02922929930	$argon2id$v=19$t=3,m=4096,p=1$tDNOTd57hZF1B5Q5proiEQ$qomjjBKCd+cF2wxeZavyy6Kka2+hmFCoh7d1/m0YN9c	\N	37	1	XZD	8789	089976	\N	2021-07-01 19:59:01.23+00	2021-07-12 00:24:54.558+00
77	Maria Elisangela da Costa de Jesus	04773026618	$argon2id$v=19$t=3,m=4096,p=1$HD6EmE5HRNKfhoTCNPrDlQ$omb2ETewWsBUb1gPy/+CvUn7onkajMG2zHuIxb1Rryg	\N	46	1	x	x	x	x	2021-07-12 20:06:39.685+00	2021-07-12 20:06:39.685+00
78	Josiane Pimenta Honorato	10911996630	$argon2id$v=19$t=3,m=4096,p=1$q/pItcB2w+w8gYAfsKB1NA$TQzFbqhnBGdIFBl1thaZ2+nfEfJ6YQuKijhPfVGSCek	\N	28	1	0	0	0	0	2021-07-14 14:40:08.511+00	2021-07-14 14:40:08.511+00
\.


--
-- Name: adonis_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.adonis_schema_id_seq', 39, true);


--
-- Name: api_sync_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.api_sync_versions_id_seq', 720, true);


--
-- Name: api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.api_tokens_id_seq', 114, true);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.areas_id_seq', 1, false);


--
-- Name: atividade_cargo_valores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.atividade_cargo_valores_id_seq', 790, true);


--
-- Name: atividade_rdo_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.atividade_rdo_users_id_seq', 1, false);


--
-- Name: atividade_rdos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.atividade_rdos_id_seq', 824, true);


--
-- Name: atividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.atividades_id_seq', 115, true);


--
-- Name: cargo_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.cargo_permissions_id_seq', 712, true);


--
-- Name: cargos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.cargos_id_seq', 46, true);


--
-- Name: complexos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.complexos_id_seq', 5, true);


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.contratos_id_seq', 3, true);


--
-- Name: equipamento_rdos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.equipamento_rdos_id_seq', 945, true);


--
-- Name: equipamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.equipamentos_id_seq', 45, true);


--
-- Name: estruturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.estruturas_id_seq', 37, true);


--
-- Name: furos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.furos_id_seq', 21, true);


--
-- Name: minas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.minas_id_seq', 6, true);


--
-- Name: rdo_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.rdo_users_id_seq', 892, true);


--
-- Name: rdos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.rdos_id_seq', 117, true);


--
-- Name: user_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.user_logs_id_seq', 5595, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: varao
--

SELECT pg_catalog.setval('public.users_id_seq', 78, true);


--
-- Name: adonis_schema adonis_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.adonis_schema
    ADD CONSTRAINT adonis_schema_pkey PRIMARY KEY (id);


--
-- Name: api_sync_versions api_sync_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.api_sync_versions
    ADD CONSTRAINT api_sync_versions_pkey PRIMARY KEY (id);


--
-- Name: api_tokens api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_pkey PRIMARY KEY (id);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: atividade_cargo_valores atividade_cargo_valores_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_cargo_valores
    ADD CONSTRAINT atividade_cargo_valores_pkey PRIMARY KEY (id);


--
-- Name: atividade_rdo_users atividade_rdo_users_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdo_users
    ADD CONSTRAINT atividade_rdo_users_pkey PRIMARY KEY (id);


--
-- Name: atividade_rdos atividade_rdos_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdos
    ADD CONSTRAINT atividade_rdos_pkey PRIMARY KEY (id);


--
-- Name: atividades atividades_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY (id);


--
-- Name: cargo_permissions cargo_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.cargo_permissions
    ADD CONSTRAINT cargo_permissions_pkey PRIMARY KEY (id);


--
-- Name: cargos cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id);


--
-- Name: complexos complexos_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.complexos
    ADD CONSTRAINT complexos_pkey PRIMARY KEY (id);


--
-- Name: contratos contratos_numero_unique; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.contratos
    ADD CONSTRAINT contratos_numero_unique UNIQUE (numero);


--
-- Name: contratos contratos_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.contratos
    ADD CONSTRAINT contratos_pkey PRIMARY KEY (id);


--
-- Name: equipamento_rdos equipamento_rdos_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.equipamento_rdos
    ADD CONSTRAINT equipamento_rdos_pkey PRIMARY KEY (id);


--
-- Name: equipamentos equipamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.equipamentos
    ADD CONSTRAINT equipamentos_pkey PRIMARY KEY (id);


--
-- Name: estruturas estruturas_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.estruturas
    ADD CONSTRAINT estruturas_pkey PRIMARY KEY (id);


--
-- Name: furos furos_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.furos
    ADD CONSTRAINT furos_pkey PRIMARY KEY (id);


--
-- Name: minas minas_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.minas
    ADD CONSTRAINT minas_pkey PRIMARY KEY (id);


--
-- Name: rdo_users rdo_users_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdo_users
    ADD CONSTRAINT rdo_users_pkey PRIMARY KEY (id);


--
-- Name: rdos rdos_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdos
    ADD CONSTRAINT rdos_pkey PRIMARY KEY (id);


--
-- Name: user_logs user_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.user_logs
    ADD CONSTRAINT user_logs_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: api_sync_versions api_sync_versions_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.api_sync_versions
    ADD CONSTRAINT api_sync_versions_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: api_tokens api_tokens_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.api_tokens
    ADD CONSTRAINT api_tokens_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: areas areas_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: atividade_cargo_valores atividade_cargo_valores_atividade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_cargo_valores
    ADD CONSTRAINT atividade_cargo_valores_atividade_id_foreign FOREIGN KEY (atividade_id) REFERENCES public.atividades(id) ON DELETE CASCADE;


--
-- Name: atividade_cargo_valores atividade_cargo_valores_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_cargo_valores
    ADD CONSTRAINT atividade_cargo_valores_cargo_id_foreign FOREIGN KEY (cargo_id) REFERENCES public.cargos(id) ON DELETE CASCADE;


--
-- Name: atividade_rdo_users atividade_rdo_users_atividade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdo_users
    ADD CONSTRAINT atividade_rdo_users_atividade_id_foreign FOREIGN KEY (atividade_id) REFERENCES public.atividades(id) ON DELETE CASCADE;


--
-- Name: atividade_rdo_users atividade_rdo_users_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdo_users
    ADD CONSTRAINT atividade_rdo_users_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: atividade_rdo_users atividade_rdo_users_rdo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdo_users
    ADD CONSTRAINT atividade_rdo_users_rdo_id_foreign FOREIGN KEY (rdo_id) REFERENCES public.rdos(id) ON DELETE CASCADE;


--
-- Name: atividade_rdo_users atividade_rdo_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdo_users
    ADD CONSTRAINT atividade_rdo_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: atividade_rdos atividade_rdos_atividade_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdos
    ADD CONSTRAINT atividade_rdos_atividade_id_foreign FOREIGN KEY (atividade_id) REFERENCES public.atividades(id) ON DELETE CASCADE;


--
-- Name: atividade_rdos atividade_rdos_furo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdos
    ADD CONSTRAINT atividade_rdos_furo_id_foreign FOREIGN KEY (furo_id) REFERENCES public.furos(id) ON DELETE CASCADE;


--
-- Name: atividade_rdos atividade_rdos_rdo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividade_rdos
    ADD CONSTRAINT atividade_rdos_rdo_id_foreign FOREIGN KEY (rdo_id) REFERENCES public.rdos(id) ON DELETE CASCADE;


--
-- Name: atividades atividades_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: cargo_permissions cargo_permissions_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.cargo_permissions
    ADD CONSTRAINT cargo_permissions_cargo_id_foreign FOREIGN KEY (cargo_id) REFERENCES public.cargos(id) ON DELETE CASCADE;


--
-- Name: cargos cargos_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: complexos complexos_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.complexos
    ADD CONSTRAINT complexos_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: equipamento_rdos equipamento_rdos_equipamento_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.equipamento_rdos
    ADD CONSTRAINT equipamento_rdos_equipamento_id_foreign FOREIGN KEY (equipamento_id) REFERENCES public.equipamentos(id) ON DELETE CASCADE;


--
-- Name: equipamento_rdos equipamento_rdos_rdo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.equipamento_rdos
    ADD CONSTRAINT equipamento_rdos_rdo_id_foreign FOREIGN KEY (rdo_id) REFERENCES public.rdos(id) ON DELETE CASCADE;


--
-- Name: equipamentos equipamentos_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.equipamentos
    ADD CONSTRAINT equipamentos_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: estruturas estruturas_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.estruturas
    ADD CONSTRAINT estruturas_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: estruturas estruturas_mina_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.estruturas
    ADD CONSTRAINT estruturas_mina_id_foreign FOREIGN KEY (mina_id) REFERENCES public.minas(id) ON DELETE CASCADE;


--
-- Name: furos furos_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.furos
    ADD CONSTRAINT furos_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: furos furos_estrutura_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.furos
    ADD CONSTRAINT furos_estrutura_id_foreign FOREIGN KEY (estrutura_id) REFERENCES public.estruturas(id) ON DELETE CASCADE;


--
-- Name: minas minas_complexo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.minas
    ADD CONSTRAINT minas_complexo_id_foreign FOREIGN KEY (complexo_id) REFERENCES public.complexos(id) ON DELETE CASCADE;


--
-- Name: minas minas_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.minas
    ADD CONSTRAINT minas_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: rdo_users rdo_users_rdo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdo_users
    ADD CONSTRAINT rdo_users_rdo_id_foreign FOREIGN KEY (rdo_id) REFERENCES public.rdos(id) ON DELETE CASCADE;


--
-- Name: rdo_users rdo_users_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdo_users
    ADD CONSTRAINT rdo_users_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: rdos rdos_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdos
    ADD CONSTRAINT rdos_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- Name: rdos rdos_equipamento_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdos
    ADD CONSTRAINT rdos_equipamento_id_foreign FOREIGN KEY (equipamento_id) REFERENCES public.equipamentos(id) ON DELETE CASCADE;


--
-- Name: rdos rdos_estrutura_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdos
    ADD CONSTRAINT rdos_estrutura_id_foreign FOREIGN KEY (estrutura_id) REFERENCES public.estruturas(id) ON DELETE CASCADE;


--
-- Name: rdos rdos_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.rdos
    ADD CONSTRAINT rdos_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_logs user_logs_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.user_logs
    ADD CONSTRAINT user_logs_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_cargo_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cargo_id_foreign FOREIGN KEY (cargo_id) REFERENCES public.cargos(id) ON DELETE CASCADE;


--
-- Name: users users_contrato_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: varao
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_contrato_id_foreign FOREIGN KEY (contrato_id) REFERENCES public.contratos(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

