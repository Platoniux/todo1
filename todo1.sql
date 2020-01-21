--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


--
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(80) NOT NULL,
    email character varying(120) NOT NULL,
    password_hash character varying(128)
);


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.alembic_version (version_num) FROM stdin;
4b44a7e371b5
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."user" (id, username, email, password_hash) FROM stdin;
1	admin	admin@example.com	\N
2	guest	guest@example.com	\N
3	platon	platon@gmail.com	pbkdf2:sha256:150000$kd6SE8CR$ac9b6ed7ce6fb696403070adbc916100701b6cb783d256f59b0937e96cc3fbd6
4	susanna	susanna@example.com	pbkdf2:sha256:150000$ueQega4P$66282efcddae8f2e67a23069c3a35fb6d48ad1f345d0e6139a643154204b7dac
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_id_seq', 36, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

