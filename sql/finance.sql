--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14
-- Dumped by pg_dump version 12.14

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
-- Name: tb_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user (
    id integer NOT NULL,
    user_name character varying(255),
    login_name character varying(255),
    password character varying(255),
    type integer DEFAULT 2,
    id_no character varying(125),
    phone_no character varying(125)
);


ALTER TABLE public.tb_user OWNER TO postgres;

--
-- Name: COLUMN tb_user.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tb_user.id IS '用户 id';


--
-- Name: COLUMN tb_user.user_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tb_user.user_name IS '登录名';


--
-- Name: COLUMN tb_user.login_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tb_user.login_name IS '用户名';


--
-- Name: COLUMN tb_user.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tb_user.password IS '密码';


--
-- Name: COLUMN tb_user.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tb_user.type IS '1 为管理员用户，2 为普通用户';


--
-- Name: COLUMN tb_user.id_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tb_user.id_no IS '身份证号';


--
-- Name: COLUMN tb_user.phone_no; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tb_user.phone_no IS '手机号';


--
-- Name: tb_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_user_id_seq OWNER TO postgres;

--
-- Name: tb_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_user_id_seq OWNED BY public.tb_user.id;


--
-- Name: tb_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN id SET DEFAULT nextval('public.tb_user_id_seq'::regclass);


--
-- Data for Name: tb_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_user (id, user_name, login_name, password, type, id_no, phone_no) FROM stdin;
2146283281	ycxyyy	ycx	25d55ad283aa400af464c76d713c07ad	2	320602199709112500	17771856147
1	admin	admin	e10adc3949ba59abbe56e057f20f883e	1	320602199901012222	17788888888
\.


--
-- Name: tb_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_user_id_seq', 1, true);


--
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

