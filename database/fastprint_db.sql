--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14
-- Dumped by pg_dump version 12.1

-- Started on 2023-09-24 05:28:40

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

--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 68605)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 68603)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 212 (class 1259 OID 68615)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 68613)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 208 (class 1259 OID 68597)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 68595)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 214 (class 1259 OID 68623)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 68633)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 68631)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 213 (class 1259 OID 68621)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 218 (class 1259 OID 68641)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 68639)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 220 (class 1259 OID 68701)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 68699)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 219
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 206 (class 1259 OID 68587)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 68585)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 205
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 204 (class 1259 OID 68576)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 68574)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 203
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 227 (class 1259 OID 68777)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 68734)
-- Name: fastprint_app_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fastprint_app_kategori (
    id_kategori integer NOT NULL,
    nama_kategori text
);


ALTER TABLE public.fastprint_app_kategori OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 68732)
-- Name: fastprint_app_kategori_id_kategori_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fastprint_app_kategori_id_kategori_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastprint_app_kategori_id_kategori_seq OWNER TO postgres;

--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 221
-- Name: fastprint_app_kategori_id_kategori_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fastprint_app_kategori_id_kategori_seq OWNED BY public.fastprint_app_kategori.id_kategori;


--
-- TOC entry 226 (class 1259 OID 68756)
-- Name: fastprint_app_produk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fastprint_app_produk (
    id_produk integer NOT NULL,
    nama_produk text,
    harga integer,
    kategori_id integer NOT NULL,
    status_id integer NOT NULL
);


ALTER TABLE public.fastprint_app_produk OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 68754)
-- Name: fastprint_app_produk_id_produk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fastprint_app_produk_id_produk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastprint_app_produk_id_produk_seq OWNER TO postgres;

--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 225
-- Name: fastprint_app_produk_id_produk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fastprint_app_produk_id_produk_seq OWNED BY public.fastprint_app_produk.id_produk;


--
-- TOC entry 224 (class 1259 OID 68745)
-- Name: fastprint_app_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fastprint_app_status (
    id_status integer NOT NULL,
    nama_status text
);


ALTER TABLE public.fastprint_app_status OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 68743)
-- Name: fastprint_app_status_id_status_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fastprint_app_status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fastprint_app_status_id_status_seq OWNER TO postgres;

--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 223
-- Name: fastprint_app_status_id_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fastprint_app_status_id_status_seq OWNED BY public.fastprint_app_status.id_status;


--
-- TOC entry 2768 (class 2604 OID 68608)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 68618)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 68600)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 68626)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 68636)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 68644)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 68704)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 68590)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 68579)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 68737)
-- Name: fastprint_app_kategori id_kategori; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fastprint_app_kategori ALTER COLUMN id_kategori SET DEFAULT nextval('public.fastprint_app_kategori_id_kategori_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 68759)
-- Name: fastprint_app_produk id_produk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fastprint_app_produk ALTER COLUMN id_produk SET DEFAULT nextval('public.fastprint_app_produk_id_produk_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 68748)
-- Name: fastprint_app_status id_status; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fastprint_app_status ALTER COLUMN id_status SET DEFAULT nextval('public.fastprint_app_status_id_status_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 68605)
-- Dependencies: 210
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2979 (class 0 OID 68615)
-- Dependencies: 212
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2975 (class 0 OID 68597)
-- Dependencies: 208
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission VALUES (25, 'Can add kategori', 7, 'add_kategori');
INSERT INTO public.auth_permission VALUES (26, 'Can change kategori', 7, 'change_kategori');
INSERT INTO public.auth_permission VALUES (27, 'Can delete kategori', 7, 'delete_kategori');
INSERT INTO public.auth_permission VALUES (28, 'Can view kategori', 7, 'view_kategori');
INSERT INTO public.auth_permission VALUES (29, 'Can add status', 8, 'add_status');
INSERT INTO public.auth_permission VALUES (30, 'Can change status', 8, 'change_status');
INSERT INTO public.auth_permission VALUES (31, 'Can delete status', 8, 'delete_status');
INSERT INTO public.auth_permission VALUES (32, 'Can view status', 8, 'view_status');
INSERT INTO public.auth_permission VALUES (33, 'Can add produk', 9, 'add_produk');
INSERT INTO public.auth_permission VALUES (34, 'Can change produk', 9, 'change_produk');
INSERT INTO public.auth_permission VALUES (35, 'Can delete produk', 9, 'delete_produk');
INSERT INTO public.auth_permission VALUES (36, 'Can view produk', 9, 'view_produk');


--
-- TOC entry 2981 (class 0 OID 68623)
-- Dependencies: 214
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2983 (class 0 OID 68633)
-- Dependencies: 216
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2985 (class 0 OID 68641)
-- Dependencies: 218
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2987 (class 0 OID 68701)
-- Dependencies: 220
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2973 (class 0 OID 68587)
-- Dependencies: 206
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (7, 'fastprint_app', 'kategori');
INSERT INTO public.django_content_type VALUES (8, 'fastprint_app', 'status');
INSERT INTO public.django_content_type VALUES (9, 'fastprint_app', 'produk');


--
-- TOC entry 2971 (class 0 OID 68576)
-- Dependencies: 204
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2023-09-23 18:48:54.67628+07');
INSERT INTO public.django_migrations VALUES (2, 'auth', '0001_initial', '2023-09-23 18:48:54.872652+07');
INSERT INTO public.django_migrations VALUES (3, 'admin', '0001_initial', '2023-09-23 18:48:54.909362+07');
INSERT INTO public.django_migrations VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-09-23 18:48:54.920164+07');
INSERT INTO public.django_migrations VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-23 18:48:54.93039+07');
INSERT INTO public.django_migrations VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-09-23 18:48:54.958579+07');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-09-23 18:48:54.970536+07');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-09-23 18:48:54.9816+07');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-09-23 18:48:54.992368+07');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-09-23 18:48:55.002607+07');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-09-23 18:48:55.005614+07');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-09-23 18:48:55.015814+07');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-09-23 18:48:55.03499+07');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-09-23 18:48:55.046159+07');
INSERT INTO public.django_migrations VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-09-23 18:48:55.059002+07');
INSERT INTO public.django_migrations VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-09-23 18:48:55.071249+07');
INSERT INTO public.django_migrations VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-09-23 18:48:55.081508+07');
INSERT INTO public.django_migrations VALUES (18, 'fastprint_app', '0001_initial', '2023-09-23 18:48:55.247163+07');
INSERT INTO public.django_migrations VALUES (19, 'sessions', '0001_initial', '2023-09-23 18:48:55.269604+07');


--
-- TOC entry 2994 (class 0 OID 68777)
-- Dependencies: 227
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2989 (class 0 OID 68734)
-- Dependencies: 222
-- Data for Name: fastprint_app_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fastprint_app_kategori VALUES (1, 'L QUEENLY');
INSERT INTO public.fastprint_app_kategori VALUES (2, 'L MTH AKSESORIS (IM)');
INSERT INTO public.fastprint_app_kategori VALUES (3, 'L MTH TABUNG (LK)');
INSERT INTO public.fastprint_app_kategori VALUES (4, 'SP MTH SPAREPART (LK)');
INSERT INTO public.fastprint_app_kategori VALUES (5, 'CI MTH TINTA LAIN (IM)');
INSERT INTO public.fastprint_app_kategori VALUES (6, 'S MTH STEMPEL (IM)');
INSERT INTO public.fastprint_app_kategori VALUES (7, 'L MTH AKSESORIS (LK)');


--
-- TOC entry 2993 (class 0 OID 68756)
-- Dependencies: 226
-- Data for Name: fastprint_app_produk; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fastprint_app_produk VALUES (6, 'ALCOHOL GEL POLISH CLEANSER GP-CLN01', 12500, 1, 1);
INSERT INTO public.fastprint_app_produk VALUES (9, 'ALUMUNIUM FOIL ALL IN ONE BULAT 23mm IM', 1000, 2, 1);
INSERT INTO public.fastprint_app_produk VALUES (11, 'ALUMUNIUM FOIL ALL IN ONE BULAT 30mm IM', 1000, 2, 1);
INSERT INTO public.fastprint_app_produk VALUES (12, 'ALUMUNIUM FOIL ALL IN ONE SHEET 250mm IM', 1250, 2, 2);
INSERT INTO public.fastprint_app_produk VALUES (15, 'ALUMUNIUM FOIL HDPE/PE BULAT 23mm IM', 12500, 2, 1);
INSERT INTO public.fastprint_app_produk VALUES (17, 'ALUMUNIUM FOIL HDPE/PE BULAT 30mm IM', 1000, 2, 1);
INSERT INTO public.fastprint_app_produk VALUES (18, 'ALUMUNIUM FOIL HDPE/PE SHEET 250mm IM', 13000, 2, 2);
INSERT INTO public.fastprint_app_produk VALUES (19, 'ALUMUNIUM FOIL PET SHEET 250mm IM', 1000, 2, 2);
INSERT INTO public.fastprint_app_produk VALUES (22, 'ARM PENDEK MODEL U', 13000, 2, 1);
INSERT INTO public.fastprint_app_produk VALUES (23, 'ARM SUPPORT KECIL', 13000, 3, 2);
INSERT INTO public.fastprint_app_produk VALUES (24, 'ARM SUPPORT KOTAK PUTIH', 13000, 2, 2);
INSERT INTO public.fastprint_app_produk VALUES (26, 'ARM SUPPORT PENDEK POLOS', 13000, 3, 1);
INSERT INTO public.fastprint_app_produk VALUES (27, 'ARM SUPPORT S IM', 1000, 2, 2);
INSERT INTO public.fastprint_app_produk VALUES (28, 'ARM SUPPORT T (IMPORT)', 13000, 2, 1);
INSERT INTO public.fastprint_app_produk VALUES (29, 'ARM SUPPORT T - MODEL 1 ( LOKAL )', 10000, 3, 1);
INSERT INTO public.fastprint_app_produk VALUES (50, 'BLACK LASER TONER FP-T3 (100gr)', 13000, 2, 2);
INSERT INTO public.fastprint_app_produk VALUES (56, 'BODY PRINTER CANON IP2770', 500, 4, 1);
INSERT INTO public.fastprint_app_produk VALUES (58, 'BODY PRINTER T13X', 15000, 4, 1);
INSERT INTO public.fastprint_app_produk VALUES (59, 'BOTOL 1000ML BLUE KHUSUS UNTUK EPSON R1800/R800 - 4180 IM (T054920)', 10000, 5, 1);
INSERT INTO public.fastprint_app_produk VALUES (60, 'BOTOL 1000ML CYAN KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4120 IM (T054220)', 10000, 5, 2);
INSERT INTO public.fastprint_app_produk VALUES (61, 'BOTOL 1000ML GLOSS OPTIMIZER KHUSUS UNTUK EPSON R1800/R800/R1900/R2000/IX7000/MG6170 - 4100 IM (T054020)', 1500, 5, 1);
INSERT INTO public.fastprint_app_produk VALUES (62, 'BOTOL 1000ML L.LIGHT BLACK KHUSUS UNTUK EPSON 2400 - 0599 IM', 1500, 5, 2);
INSERT INTO public.fastprint_app_produk VALUES (63, 'BOTOL 1000ML LIGHT BLACK KHUSUS UNTUK EPSON 2400 - 0597 IM', 1500, 5, 2);
INSERT INTO public.fastprint_app_produk VALUES (64, 'BOTOL 1000ML MAGENTA KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4140 IM (T054320)', 1000, 5, 1);
INSERT INTO public.fastprint_app_produk VALUES (65, 'BOTOL 1000ML MATTE BLACK KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 3503 IM (T054820)', 1500, 5, 2);
INSERT INTO public.fastprint_app_produk VALUES (66, 'BOTOL 1000ML ORANGE KHUSUS UNTUK EPSON R1900/R2000 IM - 4190 (T087920)', 1500, 5, 1);
INSERT INTO public.fastprint_app_produk VALUES (67, 'BOTOL 1000ML RED KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4170 IM (T054720)', 1000, 5, 2);
INSERT INTO public.fastprint_app_produk VALUES (68, 'BOTOL 1000ML YELLOW KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4160 IM (T054420)', 1500, 5, 2);
INSERT INTO public.fastprint_app_produk VALUES (70, 'BOTOL KOTAK 100ML LK', 1000, 7, 1);
INSERT INTO public.fastprint_app_produk VALUES (72, 'BOTOL 10ML IM', 1000, 6, 2);


--
-- TOC entry 2991 (class 0 OID 68745)
-- Dependencies: 224
-- Data for Name: fastprint_app_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fastprint_app_status VALUES (1, 'bisa dijual');
INSERT INTO public.fastprint_app_status VALUES (2, 'tidak bisa dijual');


--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 209
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 211
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 207
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 215
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 213
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 217
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 219
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 205
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 203
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 221
-- Name: fastprint_app_kategori_id_kategori_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fastprint_app_kategori_id_kategori_seq', 7, true);


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 225
-- Name: fastprint_app_produk_id_produk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fastprint_app_produk_id_produk_seq', 1, false);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 223
-- Name: fastprint_app_status_id_status_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fastprint_app_status_id_status_seq', 2, true);


--
-- TOC entry 2791 (class 2606 OID 68730)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2796 (class 2606 OID 68657)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2799 (class 2606 OID 68620)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 68610)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 68648)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2788 (class 2606 OID 68602)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 68638)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 68672)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2801 (class 2606 OID 68628)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 68646)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 68686)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2804 (class 2606 OID 68724)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2819 (class 2606 OID 68710)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 68594)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2783 (class 2606 OID 68592)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 68584)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 68784)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2822 (class 2606 OID 68742)
-- Name: fastprint_app_kategori fastprint_app_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fastprint_app_kategori
    ADD CONSTRAINT fastprint_app_kategori_pkey PRIMARY KEY (id_kategori);


--
-- TOC entry 2827 (class 2606 OID 68764)
-- Name: fastprint_app_produk fastprint_app_produk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fastprint_app_produk
    ADD CONSTRAINT fastprint_app_produk_pkey PRIMARY KEY (id_produk);


--
-- TOC entry 2824 (class 2606 OID 68753)
-- Name: fastprint_app_status fastprint_app_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fastprint_app_status
    ADD CONSTRAINT fastprint_app_status_pkey PRIMARY KEY (id_status);


--
-- TOC entry 2789 (class 1259 OID 68731)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2794 (class 1259 OID 68668)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2797 (class 1259 OID 68669)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 68654)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2805 (class 1259 OID 68684)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2808 (class 1259 OID 68683)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2811 (class 1259 OID 68698)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2814 (class 1259 OID 68697)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2802 (class 1259 OID 68725)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2817 (class 1259 OID 68721)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2820 (class 1259 OID 68722)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2829 (class 1259 OID 68786)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2832 (class 1259 OID 68785)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2825 (class 1259 OID 68775)
-- Name: fastprint_app_produk_kategori_id_2d312192; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fastprint_app_produk_kategori_id_2d312192 ON public.fastprint_app_produk USING btree (kategori_id);


--
-- TOC entry 2828 (class 1259 OID 68776)
-- Name: fastprint_app_produk_status_id_3a135957; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fastprint_app_produk_status_id_3a135957 ON public.fastprint_app_produk USING btree (status_id);


--
-- TOC entry 2835 (class 2606 OID 68663)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2834 (class 2606 OID 68658)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2833 (class 2606 OID 68649)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2837 (class 2606 OID 68678)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2836 (class 2606 OID 68673)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2839 (class 2606 OID 68692)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2838 (class 2606 OID 68687)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2840 (class 2606 OID 68711)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2841 (class 2606 OID 68716)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2842 (class 2606 OID 68765)
-- Name: fastprint_app_produk fastprint_app_produk_kategori_id_2d312192_fk_fastprint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fastprint_app_produk
    ADD CONSTRAINT fastprint_app_produk_kategori_id_2d312192_fk_fastprint FOREIGN KEY (kategori_id) REFERENCES public.fastprint_app_kategori(id_kategori) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2843 (class 2606 OID 68770)
-- Name: fastprint_app_produk fastprint_app_produk_status_id_3a135957_fk_fastprint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fastprint_app_produk
    ADD CONSTRAINT fastprint_app_produk_status_id_3a135957_fk_fastprint FOREIGN KEY (status_id) REFERENCES public.fastprint_app_status(id_status) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2023-09-24 05:28:41

--
-- PostgreSQL database dump complete
--

