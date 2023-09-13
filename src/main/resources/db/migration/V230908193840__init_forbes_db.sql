--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-09-11 11:28:00

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
-- TOC entry 214 (class 1259 OID 18328)
-- Name: channel_errors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel_errors (
    id bigint NOT NULL,
    date_time character varying(255),
    description text,
    duration character varying(255),
    name character varying(255),
    status character varying(255),
    type character varying(255),
    user_id bigint,
    date_time_log character varying(255)
);


ALTER TABLE public.channel_errors OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 18333)
-- Name: channel_errors_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel_errors_channels (
    channel_error_id bigint NOT NULL,
    channels_id bigint NOT NULL
);


ALTER TABLE public.channel_errors_channels OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18336)
-- Name: channel_errors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channel_errors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_errors_id_seq OWNER TO postgres;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 216
-- Name: channel_errors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channel_errors_id_seq OWNED BY public.channel_errors.id;


--
-- TOC entry 217 (class 1259 OID 18337)
-- Name: channel_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel_log (
    id bigint NOT NULL,
    date_time_log character varying(255),
    description text,
    duration character varying(255),
    time_in character varying(255),
    time_out character varying(255),
    channel_id bigint,
    user_id bigint
);


ALTER TABLE public.channel_log OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18342)
-- Name: channel_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channel_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_log_id_seq OWNER TO postgres;

--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 218
-- Name: channel_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channel_log_id_seq OWNED BY public.channel_log.id;


--
-- TOC entry 219 (class 1259 OID 18343)
-- Name: channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channels (
    id bigint NOT NULL,
    description text,
    in_address character varying(255),
    name character varying(255),
    out_address character varying(255),
    priority character varying(255),
    type character varying(255),
    user_id bigint
);


ALTER TABLE public.channels OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18348)
-- Name: channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channels_id_seq OWNER TO postgres;

--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 220
-- Name: channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channels_id_seq OWNED BY public.channels.id;


--
-- TOC entry 221 (class 1259 OID 18349)
-- Name: channels_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channels_user (
    channel_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.channels_user OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18352)
-- Name: comment_channel_errors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_channel_errors (
    id bigint NOT NULL,
    date_time_log character varying(255),
    channel_error_id bigint,
    user_id bigint
);


ALTER TABLE public.comment_channel_errors OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 18355)
-- Name: comment_channel_errors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_channel_errors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_channel_errors_id_seq OWNER TO postgres;

--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 223
-- Name: comment_channel_errors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_channel_errors_id_seq OWNED BY public.comment_channel_errors.id;


--
-- TOC entry 224 (class 1259 OID 18356)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    channel_err_id bigint,
    comment_text text,
    date_time timestamp(6) without time zone,
    user_id bigint
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18361)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 225
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 226 (class 1259 OID 18362)
-- Name: device_errors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_errors (
    id bigint NOT NULL,
    date_time character varying(255),
    description text,
    name character varying(255),
    status character varying(255),
    type character varying(255),
    device_id bigint,
    user_id bigint,
    date_time_log character varying(255)
);


ALTER TABLE public.device_errors OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18367)
-- Name: device_errors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_errors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_errors_id_seq OWNER TO postgres;

--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 227
-- Name: device_errors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_errors_id_seq OWNED BY public.device_errors.id;


--
-- TOC entry 228 (class 1259 OID 18368)
-- Name: device_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_type (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.device_type OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18371)
-- Name: device_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_type_id_seq OWNER TO postgres;

--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 229
-- Name: device_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_type_id_seq OWNED BY public.device_type.id;


--
-- TOC entry 230 (class 1259 OID 18372)
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id bigint NOT NULL,
    address character varying(255),
    address_multycast character varying(255),
    description text,
    name character varying(255),
    type_id bigint
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18377)
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO postgres;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 231
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- TOC entry 232 (class 1259 OID 18378)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 18381)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 233
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 234 (class 1259 OID 18382)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    comment text,
    date_time_log character varying(255),
    dead_line character varying(255),
    description text,
    name character varying(255),
    priority character varying(255),
    status character varying(255)
);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 18387)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO postgres;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 235
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- TOC entry 236 (class 1259 OID 18388)
-- Name: task_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_user (
    task_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.task_user OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18391)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    description text,
    login character varying(255),
    name character varying(255),
    password character varying(255),
    phone character varying(255),
    "position" character varying(255),
    shift character varying(255),
    surname character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18396)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 238
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 239 (class 1259 OID 18397)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_id bigint NOT NULL,
    roles_id bigint NOT NULL
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- TOC entry 3239 (class 2604 OID 18400)
-- Name: channel_errors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_errors ALTER COLUMN id SET DEFAULT nextval('public.channel_errors_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 18401)
-- Name: channel_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_log ALTER COLUMN id SET DEFAULT nextval('public.channel_log_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 18402)
-- Name: channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels ALTER COLUMN id SET DEFAULT nextval('public.channels_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 18403)
-- Name: comment_channel_errors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_channel_errors ALTER COLUMN id SET DEFAULT nextval('public.comment_channel_errors_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 18404)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 18405)
-- Name: device_errors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_errors ALTER COLUMN id SET DEFAULT nextval('public.device_errors_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 18406)
-- Name: device_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_type ALTER COLUMN id SET DEFAULT nextval('public.device_type_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 18407)
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 18408)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 18409)
-- Name: task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 18410)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3432 (class 0 OID 18328)
-- Dependencies: 214
-- Data for Name: channel_errors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel_errors (id, date_time, description, duration, name, status, type, user_id, date_time_log) FROM stdin;
17	2023-08-24T10:33	        Не сработала входная метка Россия 24	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-24 10:44:49.61202
31	2023-08-24T23:48	          не сработало вход		Не срабатывание	Завершен	Другое	22	2023-08-24 23:59:23.120029
18	2023-08-24T11:31	          	00:01	Не сработал автовход	Завершен	Другое	7	2023-08-24 11:49:31.068974
19	2023-08-24T11:49	         Не сработала входная метка 	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-24 12:00:28.355629
20	2023-08-24T12:30	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	7	2023-08-24 14:10:53.156088
21	2023-08-24T14:22	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-24 14:33:49.975513
22	2023-08-24T14:31	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-24 14:41:24.699476
23	2023-08-24T19:08	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-08-24 19:19:48.623971
24	2023-08-24T20:12	         ВХОДНАЯ МЕТКА НЕ СРАБОТАЛА  	00:01	НЕ СРАБОТАЛ ЕВРОНЬЮЗ ВХОДНАЯ МЕТКА	Завершен	Пропадание сигнала от источника	21	2023-08-24 20:52:43.97834
25	2023-08-24T21:17	          Не срабатывание		Не срабатывание	Завершен	Другое	22	2023-08-24 21:32:43.552058
26	82023-02-04T21:06	          	00:01	Не сработал автовход	Завершен	Другое	21	2023-08-24 22:12:34.177893
27	2023-08-24T21:57	Не сработал автовход        	00:01	Не сработал автовход	Завершен	Другое	21	2023-08-24 22:14:46.126957
28	2023-08-24T22:18	    Не сработал автовход       	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	21	2023-08-24 22:29:14.916864
29	2023-08-24T22:37	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-08-24 22:49:37.560093
30	20232-08-24T23:12	    Не сработал автовход на тк евроньюз      	00:01	Не сработал автовход на тк евроньюз	Завершен	Пропадание сигнала от источника	21	2023-08-24 23:27:03.162
32	2023-08-24T23:50	  Не сработал автовход        	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	21	2023-08-25 00:07:52.998036
33	2023-08-25T00:05	      Не сработал автовход на тк спас    	00:01	Не сработал автовход на тк спас	Завершен	Пропадание сигнала от источника	21	2023-08-25 00:17:39.889123
34	2023-08-25T00:12	          Не сработал автовход на тк евроньюз	00:01	Не сработал автовход тк евроньюз	Завершен	Пропадание сигнала от источника	21	2023-08-25 00:23:17.735988
35	2023-08-25T00:21	   Не сработал автовход тк спас       	00:01	Не сработал автовход тк спас	Завершен	Пропадание сигнала от источника	21	2023-08-25 00:32:42.621026
36	2023-08-25T01:25	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-08-25 01:36:30.741963
37	2023-08-25T01:40	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-08-25 01:50:26.982323
38	2023-08-25T01:51	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-08-25 02:02:00.580045
39	2023-08-25T02:26	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-08-25 02:49:14.930416
40	2023-08-25T02:42	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	21	2023-08-25 03:15:02.340487
43	2023-08-25T10:47	          перезагрузка сервера	04:00	пропадание	Завершен	Работы на стороне компании	14	2023-08-25 11:01:05.475255
42	2023-08-25T11:45	  Перезагружали сервер	02:00	Не сработал автовход	Завершен	Работы на стороне компании	12	2023-08-25 10:58:08.274046
44	2023-08-25T10:44	      Перезагрузка сервера    	02:00	Пропадание сигнала	Завершен	Работы на стороне компании	11	2023-08-25 11:18:24.288147
45	2023-08-25T11:15	          	00:01	Не сработал автовход	Завершен	Другое	12	2023-08-25 11:25:22.776314
46	2023-08-25T15:46	          	00:01	Не сработал автовход	Завершен	Другое	12	2023-08-25 15:48:04.770489+06
47	2023-08-25T16:08	          от источника	01:40	пропадание	Завершен	Пропадание сигнала от источника	14	2023-08-25 16:12:06.176967+06
48	2023-08-25T16:08	          от источника	01:40	пропадание	Завершен	Пропадание сигнала от источника	14	2023-08-25 16:13:25.51096+06
49	2023-08-25T19:46	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-25 21:02:23.4112+06
50	2023-08-25T20:16	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-25 21:03:06.647466+06
51	2023-08-25T21:10	          	00:01	Не сработал автовход	Завершен	Другое	7	2023-08-25 21:33:13.941999+06
116	2023-08-29T16:00	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-08-29 17:48:59.721568+06
52	2023-08-25T21:28	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-26 07:56:51.835957+06
53	2023-08-25T21:28	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-26 07:57:37.91989+06
54	2023-08-25T22:16	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-26 07:59:04.129264+06
55	2023-08-25T23:34	        Не сработала входная метка  	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-26 07:59:46.115053+06
59	2023-08-26T12:56	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-26 13:52:37.25584+06
60	2023-08-26T12:05	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-26 14:00:08.207421+06
58	2023-08-26T12:35	          		Не сработала входная метка	Завершен	Другое	16	2023-08-26 12:37:25.741144+06
56	202310-08-26T10:32	          		Не сработала входная метка	Завершен	Пропадание сигнала от источника	16	2023-08-26 10:35:22.137441+06
57	2023-08-26T11:29	          		Не сработала входная метка	Завершен	Другое	16	2023-08-26 11:33:03.994943+06
74	2023-08-27T10:55	   автовход Евроньюз не сработала входная метка, блок не по времени       	00:01	Не сработал автовход Евроньюз	Завершен	Пропадание сигнала от источника	21	2023-08-27 11:06:06.662478+06
62	2023-08-26T16:52	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-26 16:55:21.00261+06
63	2023-08-26T17:51	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-26 17:54:04.296411+06
75	2023-08-27T12:15	    евроньюз не сработала входная метка       	00:01	Не сработала входная метка на тк евроньюз	Завершен	Пропадание сигнала от источника	21	2023-08-27 12:34:50.711296+06
61	2023-08-26T16:02	          		Не сработала входная метка	Завершен	Другое	16	2023-08-26 16:18:30.351016+06
64	2023-08-26T19:13	          	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	11	2023-08-26 19:16:51.898699+06
65	2023-08-26T18:48	          от источника	01:20	пропадание сигнала	Завершен	Пропадание сигнала от источника	14	2023-08-26 19:32:19.930835+06
66	2023-08-26T19:35	Euronews_RUS	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	12	2023-08-26 19:38:19.846418+06
67	2023-08-26T20:47	Euronews_RUS	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	12	2023-08-26 20:49:41.208335+06
68	2023-08-26T21:08	          	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	12	2023-08-26 21:11:30.453317+06
69	2023-08-26T22:13	Euronews_RUS	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	12	2023-08-26 22:15:02.132345+06
70	2023-08-26T23:05	          	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	12	2023-08-26 23:07:36.725272+06
71	2023-08-27T00:53	          	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	12	2023-08-27 00:54:59.951411+06
72	20230-08-27T02:03	          	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	11	2023-08-27 02:11:38.038057+06
73	2023-08-27T09:54	          	00:01	Не сработала входная метка	Завершен	Другое	20	2023-08-27 10:00:40.844237+06
76	2023-08-07T13:20	      не сработала входная метка на евроньюз    	00:01	Не сработал автовход на тк евроньюз	Завершен	Пропадание сигнала от источника	21	2023-08-27 13:29:37.270277+06
77	2023-08-27T15:08	          	00:01	Не сработала входная метка	Завершен	Другое	20	2023-08-27 15:12:41.366081+06
78	2023-08-27T15:08	   Не сработала входная метка на т.к. Евро ньюз.       	00:01	Не сработала входная метка на т.к. Евро ньюз.	Завершен	Пропадание сигнала от источника	21	2023-08-27 15:24:23.572685+06
79	2023-08-27T16:01	 В эфир т.к. спас дали  не заявленный по эл сетки Спонсорный блок.         	00:01	В эфир т.к. спас дали  не заявленный по эл сетки Спонсорный блок.	Завершен	Пропадание сигнала от источника	21	2023-08-27 16:09:51.754713+06
80	2023-08-27T16:15	  Не сработала входная метка на т.к. Евро ньюз.        	00:01	Не сработала входная метка на т.к. Евро ньюз.	Завершен	Пропадание сигнала от источника	21	2023-08-27 16:17:57.800935+06
117	2023-08-29T16:15	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-08-29 17:49:27.216089+06
118	2023-08-29T16:49	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-08-29 17:49:47.546572+06
119	2023-08-29T13:12	EURONEWS RUS\t\r\n	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-08-29 17:50:28.281274+06
81	2023-08-28T16:17	   В эфир т.к. спас дали  не заявленный по эл сетки Спонсорный блок.       	00:01	В эфир т.к. спас дали  не заявленный по эл сетки Спонсорный блок.	Завершен	Пропадание сигнала от источника	21	2023-08-27 16:21:06.680085+06
82	2023-08-27T16:37	 В эфир т.к. спас дали  не заявленный по эл сетки Спонсорный блок.         	00:03	В эфир т.к. спас дали  не заявленный по эл сетки Спонсорный блок.	Завершен	Пропадание сигнала от источника	21	2023-08-27 16:39:11.501336+06
83	2023-08-27T17:04	          	00:01	Не сработала входная метка	Завершен	Другое	20	2023-08-27 17:10:02.107807+06
84	2023-08-27T18:11	          	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	20	2023-08-27 18:13:32.991861+06
85	2023-08-27T19:15	          		Не срабатывание	Завершен	Пропадание сигнала от источника	19	2023-08-27 19:18:29.581983+06
86	2023-08-27T19:34	          	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	16	2023-08-27 19:39:50.212195+06
87	2023-08-27T19:56	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-27 20:35:58.806114+06
88	2023-08-27T20:11	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-27 20:36:32.029705+06
89	2023-08-27T20:37	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-27 20:53:18.470112+06
90	2023-08-27T21:32	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-27 23:00:14.830869+06
91	2023-08-27T22:55	          восстановление сигнала 23:47		пропадание сигнала	Завершен	Пропадание сигнала от источника	19	2023-08-27 23:00:58.372294+06
92	2023-08-27T23:45	    восстановление сигнала в 0:28		пропадание сигнала	Завершен	Пропадание сигнала от источника	19	2023-08-27 23:50:10.817582+06
93	2023-08-27T19:29	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-28 05:28:26.283163+06
94	2023-08-27T23:31	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-28 05:29:52.724894+06
95	2023-08-28T00:21	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-28 05:31:08.431292+06
96	2023-08-28T02:38	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-28 05:31:39.518144+06
97	2023-08-27T19:05	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-28 05:33:03.527256+06
98	2023-08-27T20:05	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-28 05:33:45.105789+06
99	2023-08-28T11:16	          	00:01	Не сработал автовход	Завершен	Проблема с autodetect каналов	7	2023-08-28 11:57:17.44516+06
100	2023-08-28T12:35	          	00:01	Не срабатывание	Завершен	Проблема с autodetect каналов	8	2023-08-28 12:40:49.408317+06
101	2023-08-28T12:38	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-28 12:41:29.840364+06
102	2023-08-28T13:12	          	00:01	Не сработал автовход на тк евроньюз	Завершен	Проблема с autodetect каналов	7	2023-08-28 13:15:48.087424+06
103	2023-08-28T15:19	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-28 15:21:52.067341+06
104	2023-08-28T16:02	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-28 16:05:12.692004+06
105	2023-08-28T17:10	          	00:01	Не срабатывание	Завершен	Проблема с autodetect каналов	8	2023-08-28 17:15:47.042934+06
106	2023-08-28T17:14	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-28 17:16:33.878788+06
107	2023-08-28T13:48	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-28 17:41:10.904331+06
108	2023-08-28T18:46	          	00:01	Не сработал автовход тк спас	Завершен	Проблема с autodetect каналов	7	2023-08-28 18:54:46.336605+06
109	2023-08-28T19:03	Не сработала входная метка          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-08-28 19:19:44.475012+06
110	2023-08-28T20:09	          	00:01	Не сработала входная метка	Завершен	Другое	20	2023-08-29 08:11:32.834515+06
111	2023-08-28T21:30	          	00:01	Не сработала входная метка	Завершен	Другое	20	2023-08-29 08:12:46.363067+06
112	2023-08-28T23:48	          	00:01	Не сработала входная метка	Завершен	Другое	20	2023-08-29 08:13:34.05138+06
113	2023-08-28T01:50	          	00:01	Не сработала входная метка	Завершен	Другое	20	2023-08-29 08:14:26.530208+06
114	2023-08-29T16:47	          	00:01	Не сработала входная метка	Завершен	Пропадание сигнала от источника	11	2023-08-29 16:52:42.340448+06
115	2023-08-29T15:44	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-08-29 17:48:20.62553+06
120	2023-05-29T18:16	          от источника	01:30	пропадание сигнала	Завершен	Пропадание сигнала от источника	14	2023-08-29 18:17:35.286751+06
121	2023-08-30T02:21	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-30 02:23:38.78714+06
122	2023-08-30T03:31	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Другое	9	2023-08-30 03:35:00.185927+06
123	2023-08-30T09:41	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-30 09:43:46.522061+06
124	2023-08-30T12:50	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-30 12:53:03.983695+06
125	2023-08-30T13:08	          		Не срабатывание	Завершен	Пропадание сигнала от источника	19	2023-08-30 18:17:27.454879+06
126	2023-08-30T18:18	          		Не срабатывание	Завершен	Пропадание сигнала от источника	19	2023-08-30 18:21:00.962824+06
127	2023-08-30T10:43	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-30 18:21:11.753797+06
129	2023-08-30T17:20	          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-30 18:23:09.247476+06
130	2023-08-30T18:13	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-08-30 18:24:18.60512+06
142	2023-08-31T14:28	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-08-31 14:40:10.671486+06
128		          	00:01	Не сработала входная метка	Завершен	Другое	18	2023-08-30 18:21:36.070595+06
131	2023-08-30T19:55	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-08-30 19:56:39.612129+06
132	2023-08-30T21:47	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-08-30 21:48:26.977642+06
133	2023-08-30T22:18	          	01:30	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-08-30 22:58:08.277136+06
134	2023-08-31T00:35	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-08-31 00:42:31.28096+06
135	2023-08-31T03:47	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-08-31 03:51:30.867575+06
136	2023-08-31T09:54	     Не сработала входная метка на т.к. Евро ньюз.     	00:01	Не сработала входная метка на т.к. Евро ньюз.	Завершен	Пропадание сигнала от источника	21	2023-08-31 09:58:44.244519+06
137	2023-08-31T11:17	Не сработала входная метка на т.к. Спас.          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-08-31 11:25:11.416351+06
138	2023-08-31T11:42	Не сработала входная метка на т.к. Евро ньюз.          	00:01	Не сработала входная метка на т.к. Евро ньюз.	Завершен	Пропадание сигнала от источника	21	2023-08-31 11:44:21.978454+06
139	2023-08-31T12:25	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-08-31 12:27:43.446905+06
140	2023-08-31T12:40	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-08-31 12:42:28.063811+06
141	2023-08-31T14:20	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-08-31 14:39:46.471882+06
147	2023-08-31T18:30	Не сработала входная метка на т.к. Спас.         	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-08-31 18:34:11.441745+06
143		          		Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	23	2023-08-31 15:09:42.476742+06
144	2023-08-31T15:07	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-08-31 15:12:53.341742+06
145	2023-08-31T16:15	Не сработала входная метка на т.к. Спас.          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-08-31 16:19:13.454023+06
146	2023-08-31T17:41	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-08-31 17:43:40.972592+06
148	2023-08-31T19:10	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-31 19:12:44.32692+06
149	2023-08-31T19:19	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-08-31 19:21:17.723862+06
150	2023-08-31T21:11	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-01 01:53:31.337362+06
151	2023-09-01T01:51	          	00:02	Не сработала входная метка	Завершен	Другое	16	2023-09-01 01:54:38.942564+06
152	2023-09-01T02:25	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	16	2023-09-01 03:25:37.777617+06
153	2023-09-01T03:40	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-01 03:42:06.827014+06
154	2023-08-31T21:45	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-09-01 06:50:02.809995+06
155	2023-09-01T05:58	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-01 07:19:23.17307+06
156	2023-09-01T10:33	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Проблема с autodetect каналов	7	2023-09-01 10:38:56.111679+06
157	2023-09-01T11:38	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Другое	9	2023-09-01 11:42:26.286963+06
158	2023-09-01T11:47	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Другое	9	2023-09-01 11:49:59.005903+06
159	2023-09-01T14:55	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Другое	9	2023-09-01 14:57:09.478427+06
160	2023-09-01T14:44	          	00:01	Не срабатывание	Завершен	Проблема с autodetect каналов	8	2023-09-01 15:17:02.805333+06
161	2023-09-01T15:18	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Другое	9	2023-09-01 15:19:48.556651+06
162	2023-09-01T15:46	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	7	2023-09-01 17:50:40.786042+06
163	2023-09-01T18:46	Не сработала входная метка на т.к. Спас.          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-01 19:01:47.203384+06
164	2023-09-01T19:36	    блок не по времени      	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-01 19:50:09.030396+06
165	2023-09-01T19:55	 блок не повремени         	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-01 19:59:47.018473+06
166	2023-09-01T20:27	          	00:01	Не сработала входная метка	Завершен	Другое	23	2023-09-01 20:33:51.348494+06
167	2023-09-01T21:29	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-09-01 21:32:08.755668+06
168	2023-09-01T21:49	          	01:00	Не срабатывание	Завершен	Другое	22	2023-09-01 21:49:13.801344+06
169	0020-09-01T22:06	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-01 22:43:55.850007+06
170	2023-09-01T20:25	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-01 22:45:25.923382+06
171	2023-09-01T22:45	          	00:10	Не срабатывание	Завершен	Пропадание сигнала от источника	22	2023-09-01 22:47:27.772981+06
172	2023-09-01T23:54	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-09-01 23:57:20.308634+06
173	2023-09-02T00:54	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-02 01:04:21.844879+06
174	2023-09-02T01:46	          	00:01	Не сработала входная метка на т.к. Евро ньюз.	Завершен	Пропадание сигнала от источника	21	2023-09-02 01:53:35.608957+06
175	2023-09-02T03:45	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-09-02 06:36:18.555806+06
176	2023-09-02T03:53	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-09-02 06:37:04.739221+06
177	2023-09-02T05:29	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-09-02 06:37:35.665859+06
178	2023-09-02T06:31	Кратковременное пропадание изображения и звука 06:31-06:33	02:00	Пропадание сигнала	Завершен	Пропадание сигнала от источника	23	2023-09-02 06:39:47.455379+06
179	2023-09-02T07:28	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-09-02 07:30:59.398582+06
180	2023-09-02T08:31	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	23	2023-09-02 08:34:00.687478+06
181	2023-09-02T11:57	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-02 12:04:39.037091+06
182	2023-09-02T12:55	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-02 12:58:36.827939+06
183	2023-09-02T12:58	          	00:01	Не сработал автовход	Завершен	Пропадание сигнала от источника	12	2023-09-02 13:00:04.078507+06
184	2023-09-02T12:01	          	00:01	Не срабатывание	Завершен	Другое	14	2023-09-02 13:17:33.614594+06
185	2023-09-02T16:12	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	12	2023-09-02 16:14:21.496277+06
186	2023-09-02T17:25	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	12	2023-09-02 17:27:16.122396+06
187	2023-09-02T18:02	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-02 18:05:23.518173+06
188	2023-09-02T18:13	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-02 18:16:35.9759+06
189	2023-09-02T18:30	          	00:01	Не срабатывание	Завершен	Другое	14	2023-09-02 18:33:45.408956+06
190	2023-09-02T20:35	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Проблема с autodetect каналов	9	2023-09-02 20:37:18.970811+06
191	2023-09-02T21:11	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Проблема с autodetect каналов	7	2023-09-02 21:15:19.008593+06
192	2023-09-02T21:14	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Проблема с autodetect каналов	9	2023-09-02 21:16:02.727138+06
193	2023-09-02T21:54	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Проблема с autodetect каналов	7	2023-09-02 21:58:55.032598+06
194	2023-09-02T22:58	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Проблема с autodetect каналов	9	2023-09-02 23:00:40.729555+06
195	2023-09-03T10:00	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-03 10:03:13.970724+06
199	2023-09-03T12:52	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-03 12:54:51.632017+06
200	2023-09-03T12:57	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-03 12:59:39.813777+06
201	2023-09-03T15:30	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-03 15:36:01.093075+06
202	2023-09-03T15:54	          		Не срабатывание	Завершен	Проблема с autodetect каналов	19	2023-09-03 18:09:18.258994+06
203	2023-09-03T18:12	          		Не срабатывание	Завершен	Проблема с autodetect каналов	19	2023-09-03 18:15:32.741133+06
196	2023-09-03T11:12	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-09-03 11:15:14.962497+06
197	2023-09-03T11:50	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-09-03 12:00:56.503912+06
198	2023-09-03T12:04	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-09-03 12:07:57.257268+06
204	2023-09-03T12:22	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-09-03 18:22:38.825928+06
205	2023-09-03T18:15	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-09-03 18:24:16.157987+06
206	2023-09-03T19:31	          	00:01	Не срабатывание	Завершен	Проблема с autodetect каналов	14	2023-09-03 19:34:43.770068+06
207	2023-09-03T20:23	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-03 20:27:34.240852+06
208	2023-09-03T21:18	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	12	2023-09-03 21:20:53.955121+06
209	2023-09-03T21:33	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	12	2023-09-03 21:35:25.443167+06
210	2023-09-03T21:57	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-03 22:03:45.103025+06
211	2023-09-03T22:22	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-03 22:25:37.42939+06
212	2023-09-03T22:43	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	12	2023-09-03 22:43:57.991436+06
213	2023-09-04T03:29	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-04 03:32:48.584383+06
214	2023-09-04T04:52	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-04 04:56:29.005237+06
215	2023-09-04T11:21	 Не сработала входная метка на т.к. Спас.         	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-04 11:24:38.781147+06
216	2023-09-04T13:45	Не сработала входная метка на т.к. Спас.          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-04 13:47:30.418278+06
217	2023-09-04T16:39	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	20	2023-09-04 16:42:27.912567+06
218	2023-09-04T18:29	          	00:01	Не сработала входная метка Россия 24	Завершен	Другое	20	2023-09-04 18:34:13.991128+06
222	2023-09-04T20:38	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-09-05 07:18:42.746526+06
223	2023-09-04T02:48	          	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	18	2023-09-05 07:20:45.754242+06
224	2023-09-04T19:42	          		Не срабатывание	Завершен	Проблема с autodetect каналов	19	2023-09-05 07:54:52.08631+06
225	2023-09-04T19:34	          		Пропал входной сигнал Россия Культура. повесил ГЦП. ГС оповестил	Завершен	Пропадание сигнала от источника	15	2023-09-05 07:58:19.089703+06
219	2023-09-04T18:49	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-05 02:47:39.376482+06
220	2023-09-04T20:13	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-05 02:48:23.702441+06
221	2023-09-04T23:50	          	00:01	Не сработала входная метка	Завершен	Другое	16	2023-09-05 02:49:01.096794+06
227	2023-09-05T10:00	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Проблема с autodetect каналов	7	2023-09-05 10:11:42.918255+06
228	2023-09-05T11:05	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Проблема с autodetect каналов	7	2023-09-05 11:28:55.388113+06
229	2023-09-05T13:32	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Проблема с autodetect каналов	9	2023-09-05 14:11:30.154302+06
230	2023-09-05T13:40	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Проблема с autodetect каналов	9	2023-09-05 14:12:02.451501+06
231	2023-09-05T15:03	          	00:01	Не срабатывание	Завершен	Проблема с autodetect каналов	8	2023-09-05 15:09:10.464343+06
232	2023-09-05T15:17	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Проблема с autodetect каналов	9	2023-09-05 15:19:23.999479+06
233	2023-09-05T15:42	          Не сработала входная метка	00:01	Не сработала входная метка	Завершен	Проблема с autodetect каналов	9	2023-09-05 15:46:16.063854+06
234	2023-09-05T15:54	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Проблема с autodetect каналов	9	2023-09-05 15:56:20.368094+06
235	2023-09-05T16:39	          Не сработала входная метка Россия 24	00:01	Не сработала входная метка Россия 24	Завершен	Проблема с autodetect каналов	9	2023-09-05 16:40:57.520988+06
237	2023-09-05T19:42	          	00:01	Не сработала входная метка на т.к. Евро ньюз.	Завершен	Пропадание сигнала от источника	21	2023-09-05 23:56:45.885589+06
238	2023-05-19T19:52	Не сработала входная метка на т.к. Спас.          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	21	2023-09-05 23:58:02.674283+06
239	2023-09-05T22:12	   Не сработала входная метка на т.к. Евро ньюз.       	00:01	Не сработала входная метка на т.к. Евро ньюз.	Завершен	Пропадание сигнала от источника	21	2023-09-05 23:58:57.182804+06
240	2023-09-05T22:18	Не сработала входная метка на т.к. Спас          	00:01	Не сработала входная метка на т.к. Спас	Завершен	Пропадание сигнала от источника	21	2023-09-06 00:00:54.83945+06
242	2023-09-06T12:15	          	00:01	Не сработала входная метка Россия 24	Завершен	Пропадание сигнала от источника	11	2023-09-06 12:18:46.837733+06
244	2023-09-06T16:26	          	00:01	Не сработала входная метка на т.к. Спас.	Завершен	Пропадание сигнала от источника	12	2023-09-06 16:32:29.103822+06
243	2023-09-06T15:38	          	00:01	Не сработала входная метка на т.к. Спас.	В процессе	Пропадание сигнала от источника	12	2023-09-06 15:39:18.966255+06
241	2023-09-05T21:40	          	00:01	Не сработала входная метка Россия 24	В процессе	Другое	20	2023-09-06 08:17:49.201579+06
236	2023-09-05T15:46	          	00:01	Не сработала входная метка на т.к. Спас.	В процессе	Проблема с autodetect каналов	7	2023-09-05 17:16:18.371512+06
226	2023-09-05T09:16	          		Появился сигнал т.к. Россия Культура	В процессе	Пропадание сигнала от источника	6	2023-09-05 09:20:57.056481+06
\.


--
-- TOC entry 3433 (class 0 OID 18333)
-- Dependencies: 215
-- Data for Name: channel_errors_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel_errors_channels (channel_error_id, channels_id) FROM stdin;
17	1
18	22
19	1
20	22
21	1
22	1
23	1
24	21
25	30
26	22
27	21
28	22
29	1
30	21
31	30
32	22
33	21
34	21
35	22
36	1
37	1
38	1
39	1
40	21
42	22
43	4
44	23
45	22
46	22
47	4
48	31
48	28
49	1
50	1
51	22
52	1
53	1
54	1
55	1
56	1
57	1
58	1
59	22
60	21
61	1
62	1
63	21
64	1
65	31
65	28
65	4
68	22
70	22
71	22
72	1
73	1
74	9
75	21
76	9
77	1
78	21
79	22
80	9
81	22
82	22
83	1
84	1
85	28
86	1
87	1
88	1
89	1
90	1
91	16
92	16
93	22
94	22
95	22
96	22
97	21
98	21
99	22
100	28
101	1
102	9
103	1
104	13
105	28
106	1
107	13
108	22
109	22
110	1
111	1
112	1
113	1
114	1
115	22
116	22
117	22
118	22
120	31
120	28
120	4
121	1
122	1
123	1
124	1
125	30
126	28
127	22
128	22
129	22
130	22
131	22
132	22
133	15
134	1
135	1
136	21
137	22
138	21
139	1
140	1
141	1
142	1
144	1
145	22
146	1
147	22
148	1
149	1
150	1
151	1
152	1
153	1
154	22
155	1
156	22
157	1
158	1
159	1
160	31
161	1
162	22
163	22
164	22
165	22
166	13
167	1
168	30
169	22
170	22
171	30
172	1
173	22
174	21
175	1
176	1
177	1
178	1
179	1
180	1
181	1
182	1
183	22
184	4
185	22
186	22
187	1
188	1
189	28
190	1
191	22
192	1
193	22
194	1
195	1
196	22
197	22
198	22
199	1
200	1
201	1
202	28
203	28
204	22
205	9
206	4
207	1
208	22
209	22
210	1
211	1
212	22
213	1
214	1
215	22
216	22
217	1
218	1
219	1
220	1
221	1
222	22
223	22
224	28
225	11
226	11
227	22
228	22
229	1
230	1
231	28
232	1
233	13
234	1
235	1
236	22
237	21
238	22
239	21
240	22
241	1
242	1
243	22
244	22
\.


--
-- TOC entry 3435 (class 0 OID 18337)
-- Dependencies: 217
-- Data for Name: channel_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel_log (id, date_time_log, description, duration, time_in, time_out, channel_id, user_id) FROM stdin;
\.


--
-- TOC entry 3437 (class 0 OID 18343)
-- Dependencies: 219
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channels (id, description, in_address, name, out_address, priority, type, user_id) FROM stdin;
31	Выбранное устройство для детектирования:\r\nFDVrt Устройство 3 Выход (Имя слоя: OHOTNIK_HD) (Звук (язык): Основной;\r\nЧастота: 48000 Гц; Входное усиление: 8 дБ; Канал: левый; Пропускать символов: 1)\r\n\r\nНазвание команды:  "OXOTA_IN_XD" \r\nТаймаут:  0 с\r\n\r\nКод:  ABCD\r\nДлительность символа (мс):  50\r\nДлительность паузы (мс):  50\r\nДопустимое отклонение (мс):  50\r\nЗадержка срабатывания (мс):  0\r\n	123.456.78.90:1112	Охотник и Рыболов HD	123.456.78.90:1112	Высокий	HD 16x9	\N
32	Отдача слайда в HD на ГС	123.456.78.90:1112	Слайд HD	123.456.78.90:1112	Низкий	HD 16x9	\N
19	Мониторинг за пропущенной рекламой	123.456.78.90:1112	Россия 24 (Уральск)	123.456.78.90:1112	Средний	SD 16x9	\N
23	Автомат, NR23Line	123.456.78.90:1112	РБК	123.456.78.90:1112	Высокий	SD 16x9	\N
27	Врезка метки 12+	123.456.78.90:1112	TLC HD	123.456.78.90:1112	Средний	HD 16x9	\N
1	Выбранное устройство для детектирования:\r\nFDVrt Устройство 1 Выход (Имя слоя: Россия24_104) (Звук (язык): Основной;\r\nЧастота: 48000 Гц; Входное усиление: 4 дБ; Канал: левый + правый; Пропускать символов: 0)\r\n\r\nНазвание команды:  "RUSSIA24_68D1_federal" \r\nНазвание команды:  "RUSSIA24_8#c*_region" \r\nТаймаут:  0 с\r\n\r\nКод:  68D1\r\nКод:  8#c*\r\nДлительность символа (мс):  50\r\nДлительность паузы (мс):  40\r\nДопустимое отклонение (мс):  35\r\nЗадержка срабатывания (мс):  0\r\n	123.456.78.90:1112	Россия	123.456.78.90:1112	Высокий	SD 16x9	\N
4	Selected device for detection:\r\nFDVrt Device 3 Output (Layer name: Priklychenia) (Sound (Language): Sound #1;\r\nSample rate: 48000 Hz; Input gain: 0 dB; Channel: right; Symbols to skip: 0)\r\n\r\nCommand title:  "Travel_HD_IN" \r\nTimeout:  0 s\r\n\r\nDTMF string:  ABCD\r\nTone duration (ms):  50\r\nPause duration (ms):  50\r\nDeviation (ms):  35\r\nDelay (ms):  0	123.456.78.90:1112	Приключения SD	123.456.78.90:1112	Высокий	SD 16x9	\N
11	врезка метки 12+	123.456.78.90:1112	Россия Культура	123.456.78.90:1112	Средний	SD 16x9	\N
33	Врезка метки 12+	123.456.78.90:1112	Eurosport HD	123.456.78.90:1112	Средний	HD 16x9	\N
8	Сквозной без изменений	123.456.78.90:1112	DW	123.456.78.90:1112	Низкий	HD 16x9	\N
20	Отдача слайда на ГС	123.456.78.90:1112	Слайд	123.456.78.90:1112	Средний	SD 16x9	\N
22	Selected device for detection:\r\nFDVrt Device 2 Output (Layer name: SPAS_IN) (Sound (Language): Common;\r\nSample rate: 48000 Hz; Input gain: 2 dB; Channel: right; Symbols to skip: 0)\r\n\r\nCommand title:  "SPAS_DTMF_IN" \r\nTimeout:  0 s\r\n\r\nDTMF string:  B910\r\nTone duration (ms):  50\r\nPause duration (ms):  50\r\nDeviation (ms):  35\r\nDelay (ms):  0	123.456.78.90:1112	Спас	123.456.78.90:1112	Высокий	SD 16x9	\N
14	Сквозной без изменений	123.456.78.90:1112	Уникум	123.456.78.90:1112	Низкий	SD 16x9	\N
12	Выбранное устройство для детектирования:\r\nFDVrt Устройство 1 Выход (Имя слоя: ARSENAL_IN) (Звук (язык): rus;\r\nЧастота: 48000 Гц; Входное усиление: 0 дБ; Канал: правый; Пропускать символов: 0)\r\n\r\nНазвание команды:  "ARSENAL_IN2" \r\nТаймаут:  0 с\r\n\r\nКод:  ABCD\r\nДлительность символа (мс):  50\r\nДлительность паузы (мс):  50\r\nДопустимое отклонение (мс):  50\r\nЗадержка срабатывания (мс):  0\r\n	123.456.78.90:1112	Арсенал	123.456.78.90:1112	Высокий	SD 16x9	\N
15	Выбранное устройство для детектирования:\r\nFDVrt Устройство 1 Выход (Имя слоя: Загородный) (Звук (язык): Основной;\r\nЧастота: 48000 Гц; Входное усиление: 8 дБ; Канал: левый; Пропускать символов: 1)\r\n\r\nНазвание команды:  "Загородный_IN" \r\nТаймаут:  0 с\r\n\r\nКод:  ABCD\r\nДлительность символа (мс):  50\r\nДлительность паузы (мс):  50\r\nДопустимое отклонение (мс):  50\r\nЗадержка срабатывания (мс):  0	123.456.78.90:1112	Загородный	123.456.78.90:1112	Высокий	SD 16x9	\N
29	Сквозной без изменений	123.456.78.90:1112	Муз Тв HD	123.456.78.90:1112	Низкий	HD 16x9	\N
13	Выбранное устройство для детектирования:\r\nFDVrt Устройство 2 Выход (Имя слоя: THB_IN) (Звук (язык): Основной;\r\nЧастота: 48000 Гц; Входное усиление: 0 дБ; Канал: левый; Пропускать символов: 0)\r\n\r\nНазвание команды:  "THB_IN" \r\nТаймаут:  0 с\r\n\r\nКод:  D1#\r\nДлительность символа (мс):  40\r\nДлительность паузы (мс):  40\r\nДопустимое отклонение (мс):  40\r\nЗадержка срабатывания (мс):  0	123.456.78.90:1112	ТНВ	123.456.78.90:1112	Высокий	SD 16x9	\N
3	врезка метки 12+	123.456.78.90:1112	Еurosport SD	123.456.78.90:1112	Средний	SD 16x9	\N
34	Врезка метки 12+	123.456.78.90:1112	Animal Planet HD	123.456.78.90:1112	Средний	HD 16x9	\N
9	Выбранное устройство для детектирования:\r\nFDVrt Устройство 5 Выход (Имя слоя: PyatnicaInt_IN) (Звук (язык): Основной;\r\n\r\nЧастота: 48000 Гц; Длительность эталонного фрагмента: 341 мс; Канал: левый)\r\n\r\nНазвание команды:  "Euronews_RUS" \r\nТаймаут:  0 с\r\n\r\nВыбранные образцы для детектирования:\r\n1) Z:\\Шапки Euronews RUS\\Euronews_zastavka.wav (Задержка: 00.50 с; Отступ: 00.00 с; Порог: 60%);\r\n\r\n2) Z:\\АНОНСЫ\\Euronews_RUS\\шапки New\\Euronews_zastavka 1.wav (Задержка: 00.50 с; Отступ: 00.00 с; Порог: 60%);\r\n\r\n3) Z:\\АНОНСЫ\\Euronews_RUS\\шапки New\\Euronews_zastavka 2.wav (Задержка: 00.50 с; Отступ: 00.00 с; Порог: 60%);\r\n\r\n4) Z:\\АНОНСЫ\\Euronews_RUS\\шапки New\\Euronews_zastavka 3.wav (Задержка: 00.50 с; Отступ: 00.00 с; Порог: 70% (по умолчанию));\r\n\r\n5) Z:\\АНОНСЫ\\Euronews_RUS\\шапки New\\Euronews_zastavka.wav (Задержка: 00.50 с; Отступ: 00.00 с; Порог: 60%).\r\n	123.456.78.90:1112	Euronews SD	123.456.78.90:1112	Средний	SD 16x9	\N
21	Автомат, NRSCTE	123.456.78.90:1112	Euronews	123.456.78.90:1112	Высокий	SD 16x9	\N
17	Выбранное устройство для детектирования:\r\nFDVrt Устройство 3 Выход (Имя слоя: Muz_TV_IN) (Звук (язык): Основной;\r\nЧастота: 48000 Гц; Входное усиление: 6 дБ; Канал: левый + правый; Пропускать символов: 1)\r\n\r\nНазвание команды:  "MUZ_IN" \r\nТаймаут:  0 с\r\n\r\nКод:  670A\r\nДлительность символа (мс):  100\r\nДлительность паузы (мс):  40\r\nДопустимое отклонение (мс):  100\r\nЗадержка срабатывания (мс):  0\r\n	123.456.78.90:1112	МузТВ	123.456.78.90:1112	Высокий	SD 16x9	\N
28	Выбранное устройство для детектирования:\r\nFDVrt Устройство 1 Выход (Имя слоя: Priklyucheniya) (Звук (язык): rus;\r\nЧастота: 48000 Гц; Входное усиление: 0 дБ; Канал: правый; Пропускать символов: 0)\r\n\r\nНазвание команды:  "Travel_HD_IN" \r\nТаймаут:  0 с\r\n\r\nКод:  ABCD\r\nДлительность символа (мс):  50\r\nДлительность паузы (мс):  50\r\nДопустимое отклонение (мс):  35\r\nЗадержка срабатывания (мс):  0\r\n	123.456.78.90:1112	Приключения HD	123.456.78.90:1112	Высокий	HD 16x9	\N
10	врезка метки 12+	123.456.78.90:1112	Россия РТР	123.456.78.90:1112	Средний	SD 16x9	\N
30	Мониторинг канала, автомат от HD	123.456.78.90:1112	Охотник и Рыболов 	123.456.78.90:1112	Низкий	SD 16x9	\N
16	Ручной без автомата	123.456.78.90:1112	CNN	123.456.78.90:1112	Высокий	HD 16x9	\N
18	Ручной без автомата\r\nВрезка метки 12+	123.456.78.90:1112	TMB	123.456.78.90:1112	Средний	SD 16x9	\N
24	Канал собственного вещания, набивка плейлистов 	123.456.78.90:1112	ИнфоКанал	123.456.78.90:1112	Высокий	SD 16x9	\N
26	Врезка метки 12+	123.456.78.90:1112	Discovery HD	123.456.78.90:1112	Средний	HD 16x9	\N
25	Канал собственного вещания, набивка плейлистов	123.456.78.90:1112	ТВ Азия	123.456.78.90:1112	Высокий	SD 16x9	\N
\.


--
-- TOC entry 3439 (class 0 OID 18349)
-- Dependencies: 221
-- Data for Name: channels_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channels_user (channel_id, user_id) FROM stdin;
9	22
9	19
9	14
9	8
1	23
1	9
1	11
1	16
4	22
4	19
4	14
4	8
10	10
10	13
10	20
10	17
11	10
11	13
11	20
11	17
12	10
12	13
12	20
12	17
13	23
13	9
13	11
13	16
14	21
14	12
14	7
14	18
15	21
15	12
15	7
15	18
16	22
16	19
16	14
16	8
17	10
17	13
17	20
17	17
18	23
18	9
18	11
18	16
19	21
19	12
19	7
19	18
20	4
20	3
20	5
20	24
20	6
20	15
21	22
21	19
21	14
21	8
22	21
22	12
22	7
22	18
23	23
23	9
23	11
23	16
24	4
24	3
24	5
24	24
24	6
24	15
25	4
25	3
25	5
25	24
25	6
25	15
28	22
28	19
28	14
28	8
30	22
30	19
30	14
30	8
31	22
31	19
31	14
31	8
32	4
32	3
32	5
32	24
32	6
32	15
34	4
34	3
34	5
34	24
34	6
34	15
8	4
8	5
8	24
8	6
8	7
8	15
26	4
26	3
26	5
26	24
26	15
26	2
33	4
33	3
33	5
33	24
33	15
27	4
27	3
27	5
27	24
27	6
27	15
27	2
3	4
3	5
3	24
3	6
3	15
3	2
29	4
29	5
29	24
29	6
29	15
29	2
\.


--
-- TOC entry 3440 (class 0 OID 18352)
-- Dependencies: 222
-- Data for Name: comment_channel_errors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_channel_errors (id, date_time_log, channel_error_id, user_id) FROM stdin;
\.


--
-- TOC entry 3442 (class 0 OID 18356)
-- Dependencies: 224
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, channel_err_id, comment_text, date_time, user_id) FROM stdin;
9	244	NoComments	2023-09-06 15:18:07.860862	1
7	242	Чтоб мудро жизнь прожить, знать надобно немало,\nДва важных правила запомни для начала:\nТы лучше голодай, чем что попало есть,\nИ лучше будь один, чем вместе с кем попало.	2023-09-06 15:10:37.964387	7
2	243	Некий короткий комментарий	2023-08-06 11:37:12	2
10	243	Вовка пишет!	2023-09-06 16:23:33.244035	1
5	244	Можно соблазнить мужчину, у которого есть жена.\nМожно соблазнить мужчину, у которого есть любовница.\nНо нельзя соблазнить мужчину,\nУ которого есть любимая женщина.	2023-09-06 15:12:03.527352	8
1	244	Еще один комментарий 	2023-09-09 11:37:16	3
4	243	Кто понял жизнь тот больше не спешит,\nСмакует каждый миг и наблюдает,\nКак спит ребёнок, молится старик,\nКак дождь идёт и как снежинки тают.\nВ обыкновенном видит красоту,\nВ запутанном простейшее решенье,\nОн знает, как осуществить мечту,\nОн любит жизнь и верит в воскресенье,\nОн понял то, что счастье не в деньгах,\nИ их количество от горя не спасет,\nНо кто живёт с синицею в руках,\nСвою жар-птицу точно не найдет\nКто понял жизнь, тот понял суть вещей,\nЧто совершенней жизни только смерть,\nЧто знать, не удивляясь, пострашней,\nЧем что-нибудь не знать и не уметь. 	2023-09-06 15:04:37.847092	4
6	243	Не делай зла — вернется бумерангом,\nНе плюй в колодец — будешь воду пить,\nНе оскорбляй того, кто ниже рангом,\nА вдруг придется, что-нибудь просить.\nНе предавай друзей, их не заменишь,\nИ не теряй любимых — не вернешь,\nНе лги себе — со временем проверишь,\nЧто этой ложью сам себя ты предаёшь.	2023-09-06 15:08:24.408019	5
8	242	Дарить себя — не значит продавать.\nИ рядом спать — не значит переспать.\nНе отомстить — не значит все простить.\nНе рядом быть — не значит не любить.	2023-09-06 15:10:16.021348	6
3	244	Комментария к событию	2023-09-06 11:37:11	1
11	244	rj	2023-09-06 17:04:18.349851	1
\.


--
-- TOC entry 3444 (class 0 OID 18362)
-- Dependencies: 226
-- Data for Name: device_errors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_errors (id, date_time, description, name, status, type, device_id, user_id, date_time_log) FROM stdin;
11	2023-08-25T10:44	Слетели настройки слоя в форварде телеканала РБК. Произведена перезагрузка сервера и настройка слоя форварда.	Искажение по звуку т.к РБК	Завершен	Программная проблема	13	4	2023-08-25 11:10:25.952341
12	2023-08-28T12:01	          	Создал резервную копию, обновил программу	Завершен	Другое	52	24	2023-08-28 12:08:52.216955+06
13	2023-08-30T06:40	Произведена замена компьютера OPER7, из-за вышедшей из строя сетевой карты на материнской плате.	Операторский ПК	Завершен	Аппаратная проблема	26	24	2023-08-30 06:50:45.663981+06
14	2023-09-11T10:30	          	Проблемы с охлаждением ЦП	В процессе	Плановое мероприятие	4	1	2023-09-11 10:30:36.647881+06
15	2023-09-10T10:35	требуется замена платы	Проблема с сетевой картой	Завершен	Аппаратная проблема	23	24	2023-09-11 10:36:01.512861+06
16	2023-08-28T10:37	заменили блок питания	Проблема с блоком питания	Завершен	Программная проблема	22	6	2023-09-11 10:37:45.132127+06
\.


--
-- TOC entry 3446 (class 0 OID 18368)
-- Dependencies: 228
-- Data for Name: device_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_type (id, name) FROM stdin;
1	Персональный компьютер оператора
2	SVRALM1
3	Сервер
4	Операторский ПК
5	Видео Стена
6	Источник бесперебойного питания
7	Запчасть
\.


--
-- TOC entry 3448 (class 0 OID 18372)
-- Dependencies: 230
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (id, address, address_multycast, description, name, type_id) FROM stdin;
4	12.34.56.78	12.34.56.78	Россия 24, РТР, Культура	SVRALM1	3
16	12.34.56.78	12.34.56.78	Загородный -1\r\nCNN -2\r\nМУЗТВ -3\r\nТМБ -5	SVRALM8	3
13	12.34.56.78	12.34.56.78	Euronews -1\r\nСПАС -2\r\nПриключения SD -3\r\nРБК -4\r\nEURONEWS RUS -5	SVRALM6	3
20	12.34.56.78	12.34.56.78	Охотник и рыболов SD -1\r\nОхотник и рыболов HD-3\r\nСлайд -5	SVRALM14	3
28	12.34.56.78	12.34.56.78	Загородный\r\nУникум(детский)\r\nСпас\r\nEURONEWS RUS	Oper13	4
29	12.34.56.78	12.34.56.78	Приключения HD\r\nПриключения SD\r\nОхотник и Рыболов\r\nCNN\r\nTMB	Oper14	4
32	12.34.56.78	12.34.56.78		Резерв OPER9	4
5	12.34.56.78	12.34.56.78	Арсенал-1\r\nТНВ -2\r\nУникум-3\r\nEurosport SD-5	SVRALM2	3
34	12.34.56.78	12.34.56.78		Резерв OPER10	4
18	12.34.56.78	12.34.56.78	DISCOVERY -1\r\nTLC -2	SVRALM12	3
11	12.34.56.78	12.34.56.78	Россия24 Уральск -1	SVRALM4	3
26	12.34.56.78	12.34.56.78	МУЗТВ\r\nАрсенал\r\nРоссия РТР\r\nРоссия Культура\r\nEuronews ENG	Oper7	4
15	12.34.56.78	12.34.56.78	ГОРЯЧИЙ РЕЗЕРВ РОССИЯ	SVRALM7	3
30	12.34.56.78	12.34.56.78		Резерв OPER5	4
44	12.34.56.78	12.34.56.78	Левая сторона	Монитор 2	5
27	12.34.56.78	12.34.56.78	РБК\r\nТНВ \r\nРоссия 24	Oper8	4
31	12.34.56.78	12.34.56.78		резерв OPER3	4
17	12.34.56.78	12.34.56.78	TVASIA -1\r\nИНФОКАНАЛ -2	SVRALM9	3
22	12.34.56.78	12.34.56.78		TNT AND Friday	3
50	12.34.56.78	12.34.56.78		Монитор 7	5
23	12.34.56.78	12.34.56.78		Инфо Караганда 	3
12	12.34.56.78	12.34.56.78	Слайд -1	SVRALM5	3
19	12.34.56.78	12.34.56.78	Приключения HD -1\r\nМУЗТВ AVC( ДЛЯ ГС) -2	SVRALM13	3
21	12.34.56.78	12.34.56.78	ANIMAL PLANET -1\r\nEUROSPORT HD -2\r\n	SVRALM15	3
45	12.34.56.78	12.34.56.78	Левая сторона	Монитор 3	5
47	12.34.56.78	12.34.56.78		Основной источник бесперебойного питания	6
52	12.34.56.78	12.34.56.78	10.32.11.80:8080- для входа\r\n10.32.11.80:4900- для Radmina	Сервер Учета	3
49	12.34.56.78	12.34.56.78		Монитор 6	5
43	12.34.56.78	12.34.56.78	Левая сторона	Монитор 1	5
48	12.34.56.78	12.34.56.78		Монитор 5	5
46	12.34.56.78	12.34.56.78	Левая сторона	Монитор 4	5
51	12.34.56.78	12.34.56.78		Монитор 8	5
\.


--
-- TOC entry 3450 (class 0 OID 18378)
-- Dependencies: 232
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	ROLE_ADMIN
2	ROLE_ENGINEER
3	ROLE_OPERATOR
\.


--
-- TOC entry 3452 (class 0 OID 18382)
-- Dependencies: 234
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task (id, comment, date_time_log, dead_line, description, name, priority, status) FROM stdin;
1		2023-08-24 09:56	2023-08-31T18:00	внедрение и тест базы	Изучить онлайн интерфейс	Высокий	Завершен
3	\N	2023-09-04 09:41	2023-09-05T13:00	Собрать инфу по запчастям, что есть в наличии, что в не рабочем состоянии	Запчасти сбор информации	Средний	В процессе
\.


--
-- TOC entry 3454 (class 0 OID 18388)
-- Dependencies: 236
-- Data for Name: task_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.task_user (task_id, user_id) FROM stdin;
1	1
1	5
1	6
1	24
1	15
1	4
1	3
3	6
3	15
3	3
3	24
3	5
3	4
\.


--
-- TOC entry 3455 (class 0 OID 18391)
-- Dependencies: 237
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, description, login, name, password, phone, "position", shift, surname) FROM stdin;
10		jbezos	Джефф	$2a$10$j2KMpDpCKw/7csbGQ5OQQuSn4ic5HS3WByNAIrRN1LX67lpcaklLW		Оператор	Смена-1	Безос
23		baffet	Уорен	$2a$10$9/JPaJib0pa.8jxPPpTl1ONaFqUk2aJOWt5zuJ8pSPIJ8swJqDukq		Оператор	Смена-4	Баффет
13		geits	Билл	$2a$10$n2Qnzuohh6.H63i3qeeDv.uQ4xtleCPQFpnQAOqn/RlvrUaFg3ti.		Оператор	Смена-2	Гейтс
19		blumberg	Майкл	$2a$10$v7exAkscVq5eLegqLFovJ.IM0r4NQQPKhDs9Y1uRZTJUZTV.XolUm		Оператор	Смена-3	Блумберг
9		slim	Карлос	$2a$10$RYWhuAWZzdJqaMigeExl0ekiGN0LuVmm8.aQLKsgdsCJrjDuYBsfm		Оператор	Смена-1	Слим
21		ambani	Мукеш	$2a$10$MWlfzhVXxwRyBP6S3hjLxuAghqfFhWxTnAiPx0JfHhwPGwQN.GZI6		Оператор	Смена-3	Амбани
12		balmer	Стив	$2a$10$kogMo37Ey9/lSpSYCjLc6.SudxAHVsyBLu7Nv3GiWru0B59zPrr0W		Оператор	Смена-2	Балмер
22		shanshan	Чжун	$2a$10$U5kctOqImlF6RhRjHOHT5OFBapU0CmU.ZVGvS5Hsp619ayWz/j4DC		Оператор	Смена-4	Шаньшань
14		wolt	Элис	$2a$10$/4r7SlvtGZSiiWrI.AXu3uYDARatR75YA7AdRmSuRA4o9WhS8Y/YS		Оператор	Смена-2	Уолтон
11		ma	Джек	$2a$10$hASN18aTJsFFpYrU9twc2OGS.NvXMDzPVniReUaN.SN9AgZNF7m.2		Оператор	Смена-2	Ма
7		leo	Леонардо	$2a$10$jkccNFzxNyG/lgIYx3mhiedIbuvFD17RIGs4nhkCOeiXhgAKYA1kO		Оператор	Смена-1	Дель
16		dell	Майкл	$2a$10$Sa2UhLm/fUzkOCYOFoNZg.OeIVgclf5Su190ejDg0t5ftiqVa1X0i		Оператор	Смена-3	Делл
17		yanay	Тадаси	$2a$10$WE9SdrkWB9XH9hBE3zGQdeM3nmksRZkWvfSHPNdI3W.rvQg244ulq		Оператор	Смена-3	Янай
18		aikan	Карл	$2a$10$AAwd0SNAsCmxC/MugZkqVe4uBeyO0ULf3t5WANLACSkb2dvwYl38W		Оператор	Смена-3	Айкан
8		dzhianlin	Ванг	$2a$10$UTrY.8uBeApnpJjdeBoyN.ANerG1w8eCL4WZ.SN9KvNBkfU/KVLw2		Оператор	Смена-1	Джианлин
4		arno	Бернар	$2a$10$TyRmmh6CGt7EHCopOqQw..X6eZV7kKZL5HrftRyB1jF66KQK9lePG		Инженер	Смена-1	Арно
15		balavatnik	Леонид	$2a$10$BnEMPewl0e5w8oOURd6mQ.EgvTf/VOlokvD5DUUPfCz6FFQ20Fg/q		Инженер	Смена-3	Балаватник
6		nait	Стив	$2a$10$c0qXpKpoNH2R8PgznxQXY.ReOizBEsJTUF6U5ry1NuZo28v1Pkowm		Инженер	Смена-1	Найт
24		wolton	Джим	$2a$10$yGerE2ScPWMKQ2MLRJpMeuN6leALg5KdeXYTdk8v9D5hMGUNQk5Oa		Инженер	Без смены	Уолтон
2		fissolo	Мария	$2a$10$amgdPttt3lSozhxNwpCAL.vCFK0g8en/o7dN5odlqYDdysuMBAGUS		Начальник	Без смены	Фиссоло
5	Дежурный инженер	cuckerberg	Марк	$2a$10$H7TK4NpIFkEFMXRMVyaMouHz0XFagOQ9RC9ekiv5dXXWZHUhg2Vh2		Инженер	Без смены	Цукерберг
20		erdjin	Чарльз	$2a$10$h0JSFGzcLuQ30.EzxS3DA.pltYUtNoDR7k3z8CcdWpRKoBdXL6Vzq		Оператор	Смена-4	Эрджен
3		ellison	Ларри	$2a$10$KLVnEH5/7v58bZmCuEep0.4viJdqivm9wWM922vZPR36EoN1D.FGm		Инженер	Смена-3	Эллисон
1		ruslan	Руслан	$2a$10$MXQ/VOqC3hM5URWFHQP7COBraZLAD3SVM73DGmqUAn0I75F.0M41e	+77072559319	Инженер	Без смены	Амраев
\.


--
-- TOC entry 3457 (class 0 OID 18397)
-- Dependencies: 239
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_roles (user_id, roles_id) FROM stdin;
10	3
23	3
13	3
19	3
9	3
21	3
12	3
22	3
14	3
11	3
7	3
16	3
17	3
18	3
8	3
4	2
15	2
6	2
24	2
2	1
5	2
20	2
3	2
1	1
\.


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 216
-- Name: channel_errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channel_errors_id_seq', 244, true);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 218
-- Name: channel_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channel_log_id_seq', 1, false);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 220
-- Name: channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channels_id_seq', 34, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 223
-- Name: comment_channel_errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_channel_errors_id_seq', 1, false);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 225
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 11, true);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 227
-- Name: device_errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_errors_id_seq', 16, true);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 229
-- Name: device_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_type_id_seq', 7, true);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 231
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_id_seq', 52, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 233
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 235
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_id_seq', 3, true);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 238
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- TOC entry 3251 (class 2606 OID 18412)
-- Name: channel_errors channel_errors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_errors
    ADD CONSTRAINT channel_errors_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 18414)
-- Name: channel_log channel_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_log
    ADD CONSTRAINT channel_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 18416)
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 18418)
-- Name: comment_channel_errors comment_channel_errors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_channel_errors
    ADD CONSTRAINT comment_channel_errors_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 18420)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 18422)
-- Name: device_errors device_errors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_errors
    ADD CONSTRAINT device_errors_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 18424)
-- Name: device_type device_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_type
    ADD CONSTRAINT device_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 18426)
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 18428)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 18430)
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 18432)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 18433)
-- Name: channel_log fk1v8qmyipf4gntyrm40lubgfka; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_log
    ADD CONSTRAINT fk1v8qmyipf4gntyrm40lubgfka FOREIGN KEY (channel_id) REFERENCES public.channels(id);


--
-- TOC entry 3288 (class 2606 OID 18438)
-- Name: users_roles fk2o0jvgh89lemvvo17cbqvdxaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3286 (class 2606 OID 18443)
-- Name: task_user fk32eeu8p13crqmo7dfdtn6hncm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_user
    ADD CONSTRAINT fk32eeu8p13crqmo7dfdtn6hncm FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3273 (class 2606 OID 18448)
-- Name: channel_errors_channels fk3ng03j7ckgfl48k5y53winkny; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_errors_channels
    ADD CONSTRAINT fk3ng03j7ckgfl48k5y53winkny FOREIGN KEY (channel_error_id) REFERENCES public.channel_errors(id);


--
-- TOC entry 3285 (class 2606 OID 18453)
-- Name: devices fk7qwim433ahgmqdso00bior92r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT fk7qwim433ahgmqdso00bior92r FOREIGN KEY (type_id) REFERENCES public.device_type(id);


--
-- TOC entry 3282 (class 2606 OID 18458)
-- Name: comments fk8omq0tc18jd43bu5tjh6jvraq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk8omq0tc18jd43bu5tjh6jvraq FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3289 (class 2606 OID 18463)
-- Name: users_roles fka62j07k5mhgifpp955h37ponj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fka62j07k5mhgifpp955h37ponj FOREIGN KEY (roles_id) REFERENCES public.roles(id);


--
-- TOC entry 3287 (class 2606 OID 18468)
-- Name: task_user fkd1fn28rqhh1ku21jx7hcksvh9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_user
    ADD CONSTRAINT fkd1fn28rqhh1ku21jx7hcksvh9 FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- TOC entry 3278 (class 2606 OID 18473)
-- Name: channels_user fkd4fvvhhymd2bjwig8uaxl1beb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels_user
    ADD CONSTRAINT fkd4fvvhhymd2bjwig8uaxl1beb FOREIGN KEY (channel_id) REFERENCES public.channels(id);


--
-- TOC entry 3279 (class 2606 OID 18478)
-- Name: channels_user fkdbd4wq06gtutysu7l24u7p2j5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels_user
    ADD CONSTRAINT fkdbd4wq06gtutysu7l24u7p2j5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3283 (class 2606 OID 18483)
-- Name: device_errors fkea9lap7rih1qvyw07ptn0qb4e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_errors
    ADD CONSTRAINT fkea9lap7rih1qvyw07ptn0qb4e FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3280 (class 2606 OID 18488)
-- Name: comment_channel_errors fkf2ogcbaq8y6ewk3655rlc9f7r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_channel_errors
    ADD CONSTRAINT fkf2ogcbaq8y6ewk3655rlc9f7r FOREIGN KEY (channel_error_id) REFERENCES public.channel_errors(id);


--
-- TOC entry 3272 (class 2606 OID 18493)
-- Name: channel_errors fkgdbducv7v1ahu1b5bkgfq35kj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_errors
    ADD CONSTRAINT fkgdbducv7v1ahu1b5bkgfq35kj FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3284 (class 2606 OID 18498)
-- Name: device_errors fkgmmee0c3jtxf6g48njvl1ct2m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_errors
    ADD CONSTRAINT fkgmmee0c3jtxf6g48njvl1ct2m FOREIGN KEY (device_id) REFERENCES public.devices(id);


--
-- TOC entry 3281 (class 2606 OID 18503)
-- Name: comment_channel_errors fkhyi8t1wmil7d4a7sem3h7maqt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_channel_errors
    ADD CONSTRAINT fkhyi8t1wmil7d4a7sem3h7maqt FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3277 (class 2606 OID 18508)
-- Name: channels fki78dq62d5f9wn545wcdl4kohf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT fki78dq62d5f9wn545wcdl4kohf FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3276 (class 2606 OID 18513)
-- Name: channel_log fknsbcwyx6kfeu6jb224d88o7eh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_log
    ADD CONSTRAINT fknsbcwyx6kfeu6jb224d88o7eh FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3274 (class 2606 OID 18518)
-- Name: channel_errors_channels fko3usnb7pfqsdnirrgohr2gmxp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_errors_channels
    ADD CONSTRAINT fko3usnb7pfqsdnirrgohr2gmxp FOREIGN KEY (channels_id) REFERENCES public.channels(id);


-- Completed on 2023-09-11 11:28:00

--
-- PostgreSQL database dump complete
--

