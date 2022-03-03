--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254),
    phone_number character varying(11),
    birth_date date,
    gender character varying(1),
    country character varying(2),
    slug character varying(100)
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- Name: accounts_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_user_groups OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_groups_id_seq OWNER TO postgres;

--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_groups_id_seq OWNED BY public.accounts_user_groups.id;


--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO postgres;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: accounts_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_user_user_permissions OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_user_permissions_id_seq OWNED BY public.accounts_user_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
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
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
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
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
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
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: contacts_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts_contact (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    other_emails character varying(254),
    phone_number character varying(11),
    birth_date date,
    slug character varying(100),
    user_id bigint
);


ALTER TABLE public.contacts_contact OWNER TO postgres;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_contact_id_seq OWNER TO postgres;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts_contact.id;


--
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
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
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
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
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
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
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
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: mail_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_email (
    id bigint NOT NULL,
    subject character varying(100),
    text text,
    file character varying(100),
    created timestamp with time zone NOT NULL,
    edited timestamp with time zone NOT NULL,
    is_archive boolean NOT NULL,
    is_draft boolean NOT NULL,
    is_trash boolean NOT NULL,
    slug character varying(100),
    sender_id bigint,
    signature_id bigint,
    email_object_id bigint
);


ALTER TABLE public.mail_email OWNER TO postgres;

--
-- Name: mail_email_bcc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_email_bcc (
    id bigint NOT NULL,
    email_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.mail_email_bcc OWNER TO postgres;

--
-- Name: mail_email_bcc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_email_bcc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_email_bcc_id_seq OWNER TO postgres;

--
-- Name: mail_email_bcc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_email_bcc_id_seq OWNED BY public.mail_email_bcc.id;


--
-- Name: mail_email_cc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_email_cc (
    id bigint NOT NULL,
    email_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.mail_email_cc OWNER TO postgres;

--
-- Name: mail_email_cc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_email_cc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_email_cc_id_seq OWNER TO postgres;

--
-- Name: mail_email_cc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_email_cc_id_seq OWNED BY public.mail_email_cc.id;


--
-- Name: mail_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_email_id_seq OWNER TO postgres;

--
-- Name: mail_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_email_id_seq OWNED BY public.mail_email.id;


--
-- Name: mail_email_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_email_label (
    id bigint NOT NULL,
    email_id bigint NOT NULL,
    label_id bigint NOT NULL
);


ALTER TABLE public.mail_email_label OWNER TO postgres;

--
-- Name: mail_email_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_email_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_email_label_id_seq OWNER TO postgres;

--
-- Name: mail_email_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_email_label_id_seq OWNED BY public.mail_email_label.id;


--
-- Name: mail_email_receivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_email_receivers (
    id bigint NOT NULL,
    email_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.mail_email_receivers OWNER TO postgres;

--
-- Name: mail_email_receivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_email_receivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_email_receivers_id_seq OWNER TO postgres;

--
-- Name: mail_email_receivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_email_receivers_id_seq OWNED BY public.mail_email_receivers.id;


--
-- Name: mail_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_label (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    slug character varying(100)
);


ALTER TABLE public.mail_label OWNER TO postgres;

--
-- Name: mail_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_label_id_seq OWNER TO postgres;

--
-- Name: mail_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_label_id_seq OWNED BY public.mail_label.id;


--
-- Name: mail_signature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_signature (
    id bigint NOT NULL,
    text character varying(100) NOT NULL,
    stamp character varying(100),
    user_id bigint
);


ALTER TABLE public.mail_signature OWNER TO postgres;

--
-- Name: mail_signature_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_signature_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_signature_id_seq OWNER TO postgres;

--
-- Name: mail_signature_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_signature_id_seq OWNED BY public.mail_signature.id;


--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: accounts_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_groups_id_seq'::regclass);


--
-- Name: accounts_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: contacts_contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact ALTER COLUMN id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: mail_email id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email ALTER COLUMN id SET DEFAULT nextval('public.mail_email_id_seq'::regclass);


--
-- Name: mail_email_bcc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_bcc ALTER COLUMN id SET DEFAULT nextval('public.mail_email_bcc_id_seq'::regclass);


--
-- Name: mail_email_cc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_cc ALTER COLUMN id SET DEFAULT nextval('public.mail_email_cc_id_seq'::regclass);


--
-- Name: mail_email_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_label ALTER COLUMN id SET DEFAULT nextval('public.mail_email_label_id_seq'::regclass);


--
-- Name: mail_email_receivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_receivers ALTER COLUMN id SET DEFAULT nextval('public.mail_email_receivers_id_seq'::regclass);


--
-- Name: mail_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_label ALTER COLUMN id SET DEFAULT nextval('public.mail_label_id_seq'::regclass);


--
-- Name: mail_signature id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_signature ALTER COLUMN id SET DEFAULT nextval('public.mail_signature_id_seq'::regclass);


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (id, password, last_login, is_superuser, username, first_name, last_name, is_staff, is_active, date_joined, email, phone_number, birth_date, gender, country, slug) FROM stdin;
9	pbkdf2_sha256$260000$DnWcfGmBDdyS3FTit7ZFZP$/aMSMCjj/Ww1lJFfI9QUKX/MivKYglCaafiuf3AB910=	\N	f	maryam_she_01@gmail.com			f	t	2022-03-02 10:11:15+00		\N	\N	F	IR	msh
10	pbkdf2_sha256$260000$6mPOXruqf3cDhkuIL78wuB$Z6s3q3Fv2I50yAbjuta93LShAjVzO7I+Jvz/DmWhZKs=	2022-03-03 08:57:38.383162+00	f	bluesky@gmail.com	blue	sky	f	t	2022-03-02 10:23:42+00		\N	\N	R	FR	bs
1	pbkdf2_sha256$260000$VyOGcnm7KkMRvQ3rZwO7qr$z3q0/7oYLoh9fiqDAgBPv6FqJI84sVlxc5LjpkKjmWU=	2022-03-03 17:24:14.485726+00	t	maryam@gmail.com			t	t	2022-02-26 17:10:15+00	messenger.django.project@gmail.com	\N	\N	\N	\N	1
8	mk1234	\N	f	mk@gmil.com			f	t	2022-02-28 17:20:21+00	mkr@gmail.com	\N	\N	\N	\N	mk
\.


--
-- Data for Name: accounts_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add label	7	add_label
26	Can change label	7	change_label
27	Can delete label	7	delete_label
28	Can view label	7	view_label
29	Can add signature	8	add_signature
30	Can change signature	8	change_signature
31	Can delete signature	8	delete_signature
32	Can view signature	8	view_signature
33	Can add Contact	9	add_contact
34	Can change Contact	9	change_contact
35	Can delete Contact	9	delete_contact
36	Can view Contact	9	view_contact
37	Can add email	10	add_email
38	Can change email	10	change_email
39	Can delete email	10	delete_email
40	Can view email	10	view_email
\.


--
-- Data for Name: contacts_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_contact (id, first_name, last_name, email, other_emails, phone_number, birth_date, slug, user_id) FROM stdin;
3	m	k	mk@gmil.com	\N	\N	\N	0	1
5	blue	sky	bluesky@gmail.com	\N	\N	\N	bs	1
4	tapesh	amri	tapesh@gmail.com	\N	\N	2018-09-01	ta	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-02-27 09:54:32.221771+00	1	Contact object (1)	1	[{"added": {}}]	9	1
2	2022-02-27 10:52:39.390501+00	2	Contact object (2)	1	[{"added": {}}]	9	1
3	2022-02-27 15:23:59.030961+00	1	Label object (1)	1	[{"added": {}}]	7	1
4	2022-02-27 17:26:39.167811+00	1	Signature object (1)	1	[{"added": {}}]	8	1
5	2022-02-27 17:27:10.629622+00	1	Email object (1)	1	[{"added": {}}]	10	1
6	2022-02-28 17:11:50.316507+00	6	tara@gmail.com	1	[{"added": {}}]	6	1
7	2022-02-28 17:12:55.208313+00	7	kafashmhdiye@gmail.com	1	[{"added": {}}]	6	1
8	2022-02-28 17:13:39.555157+00	1	Contact object (1)	2	[{"changed": {"fields": ["Email"]}}]	9	1
9	2022-02-28 17:13:46.36973+00	2	Contact object (2)	2	[]	9	1
10	2022-02-28 17:20:16.642593+00	7	kafashmhdiye@gmail.com	3		6	1
11	2022-02-28 17:20:16.656591+00	6	tara@gmail.com	3		6	1
12	2022-02-28 17:20:16.658594+00	5	maryam010101	3		6	1
13	2022-02-28 17:20:16.660595+00	4	mhdiye__	3		6	1
14	2022-02-28 17:20:16.662592+00	3	mrym_sheikhhadi	3		6	1
15	2022-02-28 17:20:16.664592+00	2	maryam01	3		6	1
16	2022-02-28 17:21:05.656686+00	8	mk@gmil.com	1	[{"added": {}}]	6	1
17	2022-02-28 17:21:29.3678+00	2	Contact object (2)	3		9	1
18	2022-02-28 17:21:29.372796+00	1	Contact object (1)	3		9	1
19	2022-02-28 17:23:52.592412+00	3	Contact object (3)	1	[{"added": {}}]	9	1
20	2022-02-28 22:40:22.180995+00	1	maryam@gmail.com	2	[{"changed": {"fields": ["Username", "Slug"]}}]	6	1
21	2022-03-02 10:27:40.196931+00	9	maryam_she_01	2	[{"changed": {"fields": ["Active", "Slug"]}}]	6	1
22	2022-03-02 10:42:55.994777+00	10	bluesky	2	[{"changed": {"fields": ["Active", "Slug"]}}]	6	1
23	2022-03-03 08:36:38.998002+00	19		2	[{"changed": {"fields": ["Sender"]}}]	10	1
24	2022-03-03 08:37:34.55738+00	10	bluesky	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
25	2022-03-03 08:38:22.442431+00	10	bluesky@gmail.com	2	[{"changed": {"fields": ["Username", "Gender", "Country", "Slug"]}}]	6	1
26	2022-03-03 08:39:02.597951+00	9	maryam_she_01@gmail.com	2	[{"changed": {"fields": ["Username", "Gender", "Country", "Slug"]}}]	6	1
27	2022-03-03 08:55:11.075046+00	3	label2	1	[{"added": {}}]	7	1
28	2022-03-03 08:55:42.146414+00	18	maryam@gmail.com	2	[{"changed": {"fields": ["Receivers", "Cc", "Bcc", "Subject", "Text", "Label", "Signature", "Email object", "Is archive", "Is draft"]}}]	10	1
29	2022-03-03 08:56:54.286661+00	19	bluesky@gmail.com	2	[{"changed": {"fields": ["Receivers", "Cc", "Bcc", "Subject", "Text", "Label", "Email object"]}}]	10	1
30	2022-03-03 09:30:16.045267+00	17	this is text	3		10	1
31	2022-03-03 09:30:16.054271+00	16	this is text	3		10	1
32	2022-03-03 09:30:16.061273+00	15	tst text	3		10	1
33	2022-03-03 09:30:16.064278+00	14	txt tst 4	3		10	1
34	2022-03-03 09:30:16.067277+00	13	bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb	3		10	1
35	2022-03-03 09:30:16.07027+00	12	aaaaaaaaaaaaaaaaaaaaaaaa	3		10	1
36	2022-03-03 09:30:16.072276+00	11	tst text	3		10	1
37	2022-03-03 09:30:16.074272+00	10	text test	3		10	1
38	2022-03-03 09:30:16.107274+00	9	text test	3		10	1
39	2022-03-03 09:30:16.109272+00	8	thid id test cc bcc	3		10	1
40	2022-03-03 09:30:16.110271+00	7	first email	3		10	1
41	2022-03-03 09:30:16.112272+00	6	this is test monday	3		10	1
42	2022-03-03 09:30:16.114271+00	5	this is test monda;y	3		10	1
43	2022-03-03 09:30:16.115272+00	4	this is monday test	3		10	1
44	2022-03-03 09:30:16.118273+00	3	this is monday test	3		10	1
45	2022-03-03 09:30:16.120271+00	2	this is monday test	3		10	1
46	2022-03-03 09:30:16.122274+00	1	this is test	3		10	1
47	2022-03-03 09:58:29.201824+00	19	this is email 19	2	[{"changed": {"fields": ["File", "Is archive"]}}]	10	1
48	2022-03-03 15:19:12.277161+00	18	thid is email 18	2	[{"changed": {"fields": ["Receivers", "Cc", "Bcc"]}}]	10	1
49	2022-03-03 15:34:37.635487+00	19	this is email 19	2	[{"changed": {"fields": ["Receivers", "Cc"]}}]	10	1
50	2022-03-03 15:35:17.272877+00	19	this is email 19	2	[{"changed": {"fields": ["Bcc"]}}]	10	1
51	2022-03-03 16:08:12.977557+00	19	this is email 19	2	[{"changed": {"fields": ["Label", "Is trash"]}}]	10	1
52	2022-03-03 18:17:34.189801+00	5	bluesky@gmail.com	1	[{"added": {}}]	9	1
53	2022-03-03 19:16:10.632347+00	22	this is email 20	3		10	1
54	2022-03-03 19:16:10.64235+00	21	this is email 20	3		10	1
55	2022-03-03 19:16:10.644336+00	20	this is email 20	3		10	1
56	2022-03-03 20:05:15.947113+00	4	tapesh@gmail.com	2	[{"changed": {"fields": ["Birth date", "Slug"]}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	user
7	mail	label
8	mail	signature
9	contacts	contact
10	mail	email
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-02-26 17:06:56.543237+00
2	contenttypes	0002_remove_content_type_name	2022-02-26 17:06:56.768334+00
3	auth	0001_initial	2022-02-26 17:06:57.594877+00
4	auth	0002_alter_permission_name_max_length	2022-02-26 17:06:57.612881+00
5	auth	0003_alter_user_email_max_length	2022-02-26 17:06:57.622862+00
6	auth	0004_alter_user_username_opts	2022-02-26 17:06:57.631879+00
7	auth	0005_alter_user_last_login_null	2022-02-26 17:06:57.642881+00
8	auth	0006_require_contenttypes_0002	2022-02-26 17:06:57.646861+00
9	auth	0007_alter_validators_add_error_messages	2022-02-26 17:06:57.655881+00
10	auth	0008_alter_user_username_max_length	2022-02-26 17:06:57.665883+00
11	auth	0009_alter_user_last_name_max_length	2022-02-26 17:06:57.67488+00
12	auth	0010_alter_group_name_max_length	2022-02-26 17:06:57.735909+00
13	auth	0011_update_proxy_permissions	2022-02-26 17:06:57.758885+00
14	auth	0012_alter_user_first_name_max_length	2022-02-26 17:06:57.774056+00
15	accounts	0001_initial	2022-02-26 17:06:58.685945+00
16	admin	0001_initial	2022-02-26 17:06:58.923267+00
17	admin	0002_logentry_remove_auto_add	2022-02-26 17:06:58.944756+00
18	admin	0003_logentry_add_action_flag_choices	2022-02-26 17:06:58.967753+00
19	sessions	0001_initial	2022-02-26 17:06:59.174214+00
20	mail	0001_initial	2022-02-26 18:08:15.91523+00
21	contacts	0001_initial	2022-02-26 18:56:36.653407+00
22	mail	0002_email	2022-02-26 19:04:33.894382+00
23	contacts	0002_alter_contact_user	2022-02-27 09:00:08.291848+00
24	mail	0003_alter_email_label	2022-02-28 17:07:01.989038+00
25	mail	0004_auto_20220301_1341	2022-03-01 10:11:33.312756+00
26	mail	0005_email_is_reply	2022-03-01 11:12:04.674297+00
27	mail	0006_auto_20220301_2226	2022-03-01 18:56:24.448498+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
caytrws1bglup59ctnauyt4jmdx48i28	.eJxVjE0OwiAYBe_C2hCghFKX7j0D-f6QqoGktCvj3bVJF7p9M_NeKsG2lrR1WdLM6qysOv1uCPSQugO-Q701Ta2uy4x6V_RBu742luflcP8OCvTyraMxgtln70g8W2sIOeQRXfZGBmtGJseRPUUwwMQQMIcQp8kOZAlEvT8FVTkJ:1nOGGj:tMAdtaAyaOO8ArnqJAoZPw6jPrJ4GSaty5wiCJRJZWk	2022-03-13 09:55:09.069948+00
8ylxi5oyvooc8b7wa5oa4n17fmrguy73	.eJxVjE0OwiAYBe_C2hCghFKX7j0D-f6QqoGktCvj3bVJF7p9M_NeKsG2lrR1WdLM6qysOv1uCPSQugO-Q701Ta2uy4x6V_RBu742luflcP8OCvTyraMxgtln70g8W2sIOeQRXfZGBmtGJseRPUUwwMQQMIcQp8kOZAlEvT8FVTkJ:1nPLnl:TrxO_ASVmlz1QaOF-GCn6_gXlxV3aYKPEfasMeKQXig	2022-03-16 10:01:45.421893+00
4lk6rwnpvvztopupwwoalh49hv2rz3p1	.eJxVjE0OwiAYBe_C2hCghFKX7j0D-f6QqoGktCvj3bVJF7p9M_NeKsG2lrR1WdLM6qysOv1uCPSQugO-Q701Ta2uy4x6V_RBu742luflcP8OCvTyraMxgtln70g8W2sIOeQRXfZGBmtGJseRPUUwwMQQMIcQp8kOZAlEvT8FVTkJ:1nPpBW:TYfqORXEV-N3zzlwN461VdIfAKlh_BOt3xLogeFsTsM	2022-03-17 17:24:14.576396+00
\.


--
-- Data for Name: mail_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email (id, subject, text, file, created, edited, is_archive, is_draft, is_trash, slug, sender_id, signature_id, email_object_id) FROM stdin;
18	email 18	thid is email 18		2022-03-01 20:22:56.745782+00	2022-03-03 15:19:12.233162+00	t	t	f	\N	1	1	\N
19	email 19	this is email 19	media/docs/Haamim_-_Sia_Sefid_320.mp3	2022-03-01 20:26:42.215487+00	2022-03-03 16:08:12.957583+00	t	f	t	\N	10	\N	\N
23	email 40	this is email 40	media/docs/Requirements.txt	2022-03-03 19:14:16.144852+00	2022-03-03 19:14:16.144852+00	f	f	f	\N	1	\N	\N
\.


--
-- Data for Name: mail_email_bcc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_bcc (id, email_id, user_id) FROM stdin;
5	18	10
7	18	1
8	19	1
9	23	10
\.


--
-- Data for Name: mail_email_cc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_cc (id, email_id, user_id) FROM stdin;
5	18	10
6	19	1
7	18	1
8	19	10
9	23	10
\.


--
-- Data for Name: mail_email_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_label (id, email_id, label_id) FROM stdin;
2	18	3
3	19	3
4	19	1
5	23	1
\.


--
-- Data for Name: mail_email_receivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_receivers (id, email_id, user_id) FROM stdin;
13	18	10
14	19	1
15	18	1
16	19	10
17	23	10
\.


--
-- Data for Name: mail_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_label (id, title, slug) FROM stdin;
1	label1	lable1
3	label2	label2
\.


--
-- Data for Name: mail_signature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_signature (id, text, stamp, user_id) FROM stdin;
1	MaryamSign		1
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 10, true);


--
-- Name: accounts_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: contacts_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_contact_id_seq', 5, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 56, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: mail_email_bcc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_bcc_id_seq', 9, true);


--
-- Name: mail_email_cc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_cc_id_seq', 9, true);


--
-- Name: mail_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_id_seq', 23, true);


--
-- Name: mail_email_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_label_id_seq', 5, true);


--
-- Name: mail_email_receivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_receivers_id_seq', 17, true);


--
-- Name: mail_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_label_id_seq', 3, true);


--
-- Name: mail_signature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_signature_id_seq', 1, true);


--
-- Name: accounts_user_groups accounts_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups accounts_user_groups_user_id_group_id_59c0b32f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_group_id_59c0b32f_uniq UNIQUE (user_id, group_id);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_slug_key UNIQUE (slug);


--
-- Name: accounts_user_user_permissions accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq UNIQUE (user_id, permission_id);


--
-- Name: accounts_user_user_permissions accounts_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: contacts_contact contacts_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_pkey PRIMARY KEY (id);


--
-- Name: contacts_contact contacts_contact_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_slug_key UNIQUE (slug);


--
-- Name: contacts_contact contacts_contact_user_id_email_de1713b3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_user_id_email_de1713b3_uniq UNIQUE (user_id, email);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: mail_email_bcc mail_email_bcc_email_id_user_id_c7f8a56a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_bcc
    ADD CONSTRAINT mail_email_bcc_email_id_user_id_c7f8a56a_uniq UNIQUE (email_id, user_id);


--
-- Name: mail_email_bcc mail_email_bcc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_bcc
    ADD CONSTRAINT mail_email_bcc_pkey PRIMARY KEY (id);


--
-- Name: mail_email_cc mail_email_cc_email_id_user_id_548854b4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_cc
    ADD CONSTRAINT mail_email_cc_email_id_user_id_548854b4_uniq UNIQUE (email_id, user_id);


--
-- Name: mail_email_cc mail_email_cc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_cc
    ADD CONSTRAINT mail_email_cc_pkey PRIMARY KEY (id);


--
-- Name: mail_email_label mail_email_label_email_id_label_id_55f5aa37_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_label
    ADD CONSTRAINT mail_email_label_email_id_label_id_55f5aa37_uniq UNIQUE (email_id, label_id);


--
-- Name: mail_email_label mail_email_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_label
    ADD CONSTRAINT mail_email_label_pkey PRIMARY KEY (id);


--
-- Name: mail_email mail_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email
    ADD CONSTRAINT mail_email_pkey PRIMARY KEY (id);


--
-- Name: mail_email_receivers mail_email_receivers_email_id_user_id_da673c2f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_receivers
    ADD CONSTRAINT mail_email_receivers_email_id_user_id_da673c2f_uniq UNIQUE (email_id, user_id);


--
-- Name: mail_email_receivers mail_email_receivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_receivers
    ADD CONSTRAINT mail_email_receivers_pkey PRIMARY KEY (id);


--
-- Name: mail_email mail_email_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email
    ADD CONSTRAINT mail_email_slug_key UNIQUE (slug);


--
-- Name: mail_label mail_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_label
    ADD CONSTRAINT mail_label_pkey PRIMARY KEY (id);


--
-- Name: mail_label mail_label_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_label
    ADD CONSTRAINT mail_label_slug_key UNIQUE (slug);


--
-- Name: mail_signature mail_signature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_signature
    ADD CONSTRAINT mail_signature_pkey PRIMARY KEY (id);


--
-- Name: accounts_user_groups_group_id_bd11a704; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_group_id_bd11a704 ON public.accounts_user_groups USING btree (group_id);


--
-- Name: accounts_user_groups_user_id_52b62117; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_groups_user_id_52b62117 ON public.accounts_user_groups USING btree (user_id);


--
-- Name: accounts_user_slug_b5afb108_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_slug_b5afb108_like ON public.accounts_user USING btree (slug varchar_pattern_ops);


--
-- Name: accounts_user_user_permissions_permission_id_113bb443; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_permission_id_113bb443 ON public.accounts_user_user_permissions USING btree (permission_id);


--
-- Name: accounts_user_user_permissions_user_id_e4f0a161; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_user_permissions_user_id_e4f0a161 ON public.accounts_user_user_permissions USING btree (user_id);


--
-- Name: accounts_user_username_6088629e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_username_6088629e_like ON public.accounts_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: contacts_contact_slug_97abaf8a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_slug_97abaf8a_like ON public.contacts_contact USING btree (slug varchar_pattern_ops);


--
-- Name: contacts_contact_user_id_cff1a837; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contacts_contact_user_id_cff1a837 ON public.contacts_contact USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: mail_email_bcc_email_id_019fd01b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_bcc_email_id_019fd01b ON public.mail_email_bcc USING btree (email_id);


--
-- Name: mail_email_bcc_user_id_4b0542d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_bcc_user_id_4b0542d7 ON public.mail_email_bcc USING btree (user_id);


--
-- Name: mail_email_cc_email_id_82bd2bb5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_cc_email_id_82bd2bb5 ON public.mail_email_cc USING btree (email_id);


--
-- Name: mail_email_cc_user_id_c62447ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_cc_user_id_c62447ab ON public.mail_email_cc USING btree (user_id);


--
-- Name: mail_email_email_object_id_64e0377d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_email_object_id_64e0377d ON public.mail_email USING btree (email_object_id);


--
-- Name: mail_email_label_email_id_e3704702; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_label_email_id_e3704702 ON public.mail_email_label USING btree (email_id);


--
-- Name: mail_email_label_label_id_4a41b8d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_label_label_id_4a41b8d2 ON public.mail_email_label USING btree (label_id);


--
-- Name: mail_email_receivers_email_id_1dbf183c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_receivers_email_id_1dbf183c ON public.mail_email_receivers USING btree (email_id);


--
-- Name: mail_email_receivers_user_id_27c016a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_receivers_user_id_27c016a1 ON public.mail_email_receivers USING btree (user_id);


--
-- Name: mail_email_sender_id_102f874d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_sender_id_102f874d ON public.mail_email USING btree (sender_id);


--
-- Name: mail_email_signature_id_f0378076; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_signature_id_f0378076 ON public.mail_email USING btree (signature_id);


--
-- Name: mail_email_slug_5befecac_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_slug_5befecac_like ON public.mail_email USING btree (slug varchar_pattern_ops);


--
-- Name: mail_label_slug_3e6cd61c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_label_slug_3e6cd61c_like ON public.mail_label USING btree (slug varchar_pattern_ops);


--
-- Name: mail_signature_user_id_6ea60876; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_signature_user_id_6ea60876 ON public.mail_signature USING btree (user_id);


--
-- Name: accounts_user_groups accounts_user_groups_group_id_bd11a704_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_group_id_bd11a704_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_groups accounts_user_groups_user_id_52b62117_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_groups
    ADD CONSTRAINT accounts_user_groups_user_id_52b62117_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_permission_id_113bb443_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_permission_id_113bb443_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_user_user_permissions accounts_user_user_p_user_id_e4f0a161_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user_user_permissions
    ADD CONSTRAINT accounts_user_user_p_user_id_e4f0a161_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contacts_contact contacts_contact_user_id_cff1a837_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_user_id_cff1a837_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_bcc mail_email_bcc_email_id_019fd01b_fk_mail_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_bcc
    ADD CONSTRAINT mail_email_bcc_email_id_019fd01b_fk_mail_email_id FOREIGN KEY (email_id) REFERENCES public.mail_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_bcc mail_email_bcc_user_id_4b0542d7_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_bcc
    ADD CONSTRAINT mail_email_bcc_user_id_4b0542d7_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_cc mail_email_cc_email_id_82bd2bb5_fk_mail_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_cc
    ADD CONSTRAINT mail_email_cc_email_id_82bd2bb5_fk_mail_email_id FOREIGN KEY (email_id) REFERENCES public.mail_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_cc mail_email_cc_user_id_c62447ab_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_cc
    ADD CONSTRAINT mail_email_cc_user_id_c62447ab_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email mail_email_email_object_id_64e0377d_fk_mail_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email
    ADD CONSTRAINT mail_email_email_object_id_64e0377d_fk_mail_email_id FOREIGN KEY (email_object_id) REFERENCES public.mail_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_label mail_email_label_email_id_e3704702_fk_mail_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_label
    ADD CONSTRAINT mail_email_label_email_id_e3704702_fk_mail_email_id FOREIGN KEY (email_id) REFERENCES public.mail_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_label mail_email_label_label_id_4a41b8d2_fk_mail_label_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_label
    ADD CONSTRAINT mail_email_label_label_id_4a41b8d2_fk_mail_label_id FOREIGN KEY (label_id) REFERENCES public.mail_label(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_receivers mail_email_receivers_email_id_1dbf183c_fk_mail_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_receivers
    ADD CONSTRAINT mail_email_receivers_email_id_1dbf183c_fk_mail_email_id FOREIGN KEY (email_id) REFERENCES public.mail_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_receivers mail_email_receivers_user_id_27c016a1_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_receivers
    ADD CONSTRAINT mail_email_receivers_user_id_27c016a1_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email mail_email_sender_id_102f874d_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email
    ADD CONSTRAINT mail_email_sender_id_102f874d_fk_accounts_user_id FOREIGN KEY (sender_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email mail_email_signature_id_f0378076_fk_mail_signature_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email
    ADD CONSTRAINT mail_email_signature_id_f0378076_fk_mail_signature_id FOREIGN KEY (signature_id) REFERENCES public.mail_signature(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_signature mail_signature_user_id_6ea60876_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_signature
    ADD CONSTRAINT mail_signature_user_id_6ea60876_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

