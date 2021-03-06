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
-- Name: mail_email_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_email_filter (
    id bigint NOT NULL,
    email_id bigint NOT NULL,
    filter_id bigint NOT NULL
);


ALTER TABLE public.mail_email_filter OWNER TO postgres;

--
-- Name: mail_email_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_email_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_email_filter_id_seq OWNER TO postgres;

--
-- Name: mail_email_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_email_filter_id_seq OWNED BY public.mail_email_filter.id;


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
-- Name: mail_emailfolder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_emailfolder (
    id bigint NOT NULL,
    is_trash boolean NOT NULL,
    is_archive boolean NOT NULL,
    is_draft boolean NOT NULL,
    email_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.mail_emailfolder OWNER TO postgres;

--
-- Name: mail_emailfolder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_emailfolder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_emailfolder_id_seq OWNER TO postgres;

--
-- Name: mail_emailfolder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_emailfolder_id_seq OWNED BY public.mail_emailfolder.id;


--
-- Name: mail_filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_filter (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    owner_id bigint,
    filter_by character varying(100)
);


ALTER TABLE public.mail_filter OWNER TO postgres;

--
-- Name: mail_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_filter_id_seq OWNER TO postgres;

--
-- Name: mail_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_filter_id_seq OWNED BY public.mail_filter.id;


--
-- Name: mail_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_label (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    slug character varying(100),
    owner_id bigint
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
-- Name: mail_email_filter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_filter ALTER COLUMN id SET DEFAULT nextval('public.mail_email_filter_id_seq'::regclass);


--
-- Name: mail_email_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_label ALTER COLUMN id SET DEFAULT nextval('public.mail_email_label_id_seq'::regclass);


--
-- Name: mail_email_receivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_receivers ALTER COLUMN id SET DEFAULT nextval('public.mail_email_receivers_id_seq'::regclass);


--
-- Name: mail_emailfolder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_emailfolder ALTER COLUMN id SET DEFAULT nextval('public.mail_emailfolder_id_seq'::regclass);


--
-- Name: mail_filter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_filter ALTER COLUMN id SET DEFAULT nextval('public.mail_filter_id_seq'::regclass);


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
15	pbkdf2_sha256$260000$LMZ2xESyKffhK5FBIuQ6SE$+flubUNcDNGw9Z7JX92yq+KRwtzZ/LH5OUnr/0MxU0g=	2022-03-08 17:11:39.074287+00	f	pariaaaaa@gmail.com			f	t	2022-03-08 17:09:41.506891+00	kfashmhdyh@gmail.com	\N	\N	\N	\N	\N
16	pbkdf2_sha256$260000$yiJGpnRqW3vYVCAbbYCSCQ$qKe5QYc7g1RcfiqpgaZVGhkRL1lbqg3/E+el5Nculrk=	2022-03-09 13:16:17.786274+00	f	maryam.sheikhhadi.01@gmail.com			f	t	2022-03-09 13:08:01.871185+00	maryam.sheikhhadi.01@gmail.com	\N	\N	\N	\N	\N
10	pbkdf2_sha256$260000$6mPOXruqf3cDhkuIL78wuB$Z6s3q3Fv2I50yAbjuta93LShAjVzO7I+Jvz/DmWhZKs=	2022-03-17 19:56:45.411475+00	f	bluesky@gmail.com	blue	sky	f	t	2022-03-02 10:23:42+00		\N	\N	R	FR	bs
1	pbkdf2_sha256$260000$VyOGcnm7KkMRvQ3rZwO7qr$z3q0/7oYLoh9fiqDAgBPv6FqJI84sVlxc5LjpkKjmWU=	2022-03-17 20:03:31.224384+00	t	maryam@gmail.com			t	t	2022-02-26 17:10:15+00	messenger.django.project@gmail.com	\N	\N	\N	\N	1
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
41	Can add email folder	11	add_emailfolder
42	Can change email folder	11	change_emailfolder
43	Can delete email folder	11	delete_emailfolder
44	Can view email folder	11	view_emailfolder
45	Can add filter	12	add_filter
46	Can change filter	12	change_filter
47	Can delete filter	12	delete_filter
48	Can view filter	12	view_filter
\.


--
-- Data for Name: contacts_contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts_contact (id, first_name, last_name, email, other_emails, phone_number, birth_date, slug, user_id) FROM stdin;
6	test	erae	test@gmail.com	\N	\N	\N	\N	10
4	tapesh	amri	tt@gmail.com	mahsa@gmail.com	\N	2018-09-01	ta	1
5	bluekkkkk	sky	bluesky@gmail.com	sky@gmail.com	9197657383	\N	bs	1
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
57	2022-03-04 06:09:02.310326+00	18	thid is email 18	2	[{"changed": {"fields": ["Bcc"]}}]	10	1
58	2022-03-04 06:34:31.477214+00	19	this is email 19	2	[{"changed": {"fields": ["Bcc"]}}]	10	1
59	2022-03-04 07:52:03.595172+00	30	this is email 40	3		10	1
60	2022-03-04 07:52:03.601167+00	29	this is email 40	3		10	1
61	2022-03-04 07:52:03.605188+00	27	tt	3		10	1
62	2022-03-04 07:52:03.60724+00	26		3		10	1
63	2022-03-04 07:52:03.609182+00	25		3		10	1
64	2022-03-04 07:52:03.611224+00	24	test erae	3		10	1
65	2022-03-07 16:32:19.497346+00	42	biiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiib	3		10	1
66	2022-03-07 16:32:19.743209+00	39	mm	3		10	1
67	2022-03-07 16:32:19.747222+00	38	multi	3		10	1
68	2022-03-07 16:32:19.751209+00	37	multi	3		10	1
69	2022-03-07 16:32:19.755208+00	36	multiple	3		10	1
70	2022-03-07 16:32:19.75921+00	35	multiple	3		10	1
71	2022-03-07 16:32:19.763207+00	34	this is test multiple cc	3		10	1
72	2022-03-07 16:32:19.767214+00	33	this is test multiple cc	3		10	1
73	2022-03-07 16:32:19.770213+00	32	this is test multiple cc	3		10	1
74	2022-03-07 16:32:19.798413+00	31	this is test multiple input	3		10	1
75	2022-03-08 16:45:14.799677+00	4	test	2	[{"changed": {"fields": ["Owner"]}}]	7	1
76	2022-03-08 16:45:24.896615+00	3	label2	2	[{"changed": {"fields": ["Owner"]}}]	7	1
77	2022-03-08 16:45:39.2741+00	1	label1	2	[{"changed": {"fields": ["Owner"]}}]	7	1
78	2022-03-08 16:57:54.435834+00	13	atefetasa	3		6	1
79	2022-03-08 16:57:54.480834+00	12	iammaryam	3		6	1
80	2022-03-08 16:57:54.483836+00	11	yara	3		6	1
81	2022-03-08 16:57:54.486834+00	9	maryam_she_01@gmail.com	3		6	1
82	2022-03-08 16:57:54.489837+00	8	mk@gmil.com	3		6	1
83	2022-03-08 18:03:40.384958+00	14	atefetasa	3		6	1
84	2022-03-08 18:05:31.638511+00	41	bcc	3		10	1
85	2022-03-08 18:05:43.9756+00	44	go to sky okay?	3		10	1
86	2022-03-08 18:06:30.380966+00	23	this is email 40	3		10	1
87	2022-03-08 18:06:30.401001+00	19	this is email 19	3		10	1
88	2022-03-08 18:06:30.403003+00	18	thid is email 18	3		10	1
89	2022-03-09 08:36:50.807475+00	52	aaaaaaaaaaaaaa	3		10	1
90	2022-03-09 08:36:50.964654+00	51	rrrr	3		10	1
91	2022-03-09 08:36:50.966653+00	50	tttttttttttttttttttt	3		10	1
92	2022-03-09 08:36:50.968646+00	49	tt	3		10	1
93	2022-03-09 08:36:50.970645+00	48		3		10	1
94	2022-03-09 08:36:50.989653+00	47		3		10	1
95	2022-03-09 08:36:50.991653+00	46	22	3		10	1
96	2022-03-09 08:36:50.994649+00	43	bib bib	3		10	1
97	2022-03-09 08:36:50.997655+00	40	mmmmmmmmmmmmmmmmmmmmmmmmmmm	3		10	1
98	2022-03-09 10:00:49.357667+00	54	000	2	[{"changed": {"fields": ["Receivers", "Cc", "Bcc", "Text"]}}]	10	1
99	2022-03-09 10:01:49.89981+00	55	:)	2	[{"changed": {"fields": ["Receivers", "Cc", "Bcc"]}}]	10	1
100	2022-03-09 11:49:58.479588+00	60	44	3		10	1
101	2022-03-09 11:49:58.521818+00	59	11	3		10	1
102	2022-03-09 11:49:58.52384+00	58	1111	3		10	1
103	2022-03-09 11:49:58.52584+00	57	1111	3		10	1
104	2022-03-09 11:49:58.528371+00	56	1111	3		10	1
105	2022-03-09 17:17:01.10585+00	66	draft	3		10	1
106	2022-03-09 17:17:01.118857+00	65	draft	3		10	1
107	2022-03-09 17:17:01.121854+00	64	draft	3		10	1
108	2022-03-09 17:40:02.256001+00	71	draft	3		10	1
109	2022-03-09 17:40:02.275567+00	70	draft	3		10	1
110	2022-03-09 17:40:02.278571+00	68	000	3		10	1
111	2022-03-12 17:51:50.883914+00	3	maryam	3		8	1
112	2022-03-12 17:51:50.890909+00	2	maryam	3		8	1
113	2022-03-15 18:38:16.297421+00	4	EmailFolder object (4)	2	[{"changed": {"fields": ["Is trash"]}}]	11	1
114	2022-03-15 20:12:25.479639+00	4	EmailFolder object (4)	2	[{"changed": {"fields": ["Is trash", "Is draft"]}}]	11	1
115	2022-03-15 20:14:19.114116+00	83	email to bluesky	3		10	1
116	2022-03-15 20:14:19.124111+00	82	tst auto sign	3		10	1
117	2022-03-15 20:14:19.127118+00	81		3		10	1
118	2022-03-15 20:14:19.130112+00	80	sign	3		10	1
119	2022-03-15 20:14:19.133113+00	79		3		10	1
120	2022-03-15 20:14:19.137114+00	78		3		10	1
121	2022-03-15 20:14:19.142111+00	77		3		10	1
122	2022-03-15 20:14:19.14511+00	76	draft	3		10	1
123	2022-03-15 20:14:19.148118+00	75	draft	3		10	1
124	2022-03-15 20:14:19.150115+00	74	rp	3		10	1
125	2022-03-15 20:14:19.153113+00	73	3	3		10	1
126	2022-03-15 20:14:19.156114+00	72	000	3		10	1
127	2022-03-15 20:14:19.159116+00	67	rep	3		10	1
128	2022-03-15 20:14:19.162819+00	63	pp	3		10	1
129	2022-03-15 20:14:19.164819+00	61	73	3		10	1
130	2022-03-15 20:14:19.167835+00	55	:)	3		10	1
131	2022-03-15 20:14:19.16984+00	54	000	3		10	1
132	2022-03-15 20:14:19.172841+00	53	draft	3		10	1
133	2022-03-15 20:14:19.175839+00	45	3	3		10	1
134	2022-03-15 20:14:19.17884+00	28	reply	3		10	1
135	2022-03-15 20:16:18.067486+00	4	EmailFolder object (4)	2	[{"changed": {"fields": ["Is draft"]}}]	11	1
136	2022-03-15 20:16:33.073301+00	1	EmailFolder object (1)	2	[{"changed": {"fields": ["Is draft"]}}]	11	1
137	2022-03-15 20:16:40.366402+00	2	EmailFolder object (2)	2	[{"changed": {"fields": ["Is draft"]}}]	11	1
138	2022-03-15 20:16:50.490639+00	4	EmailFolder object (4)	2	[{"changed": {"fields": ["Is draft"]}}]	11	1
139	2022-03-15 20:18:08.443171+00	85	foleder email	3		10	1
140	2022-03-15 20:18:08.457172+00	84	foleder email	3		10	1
141	2022-03-15 20:22:18.287977+00	86	folder email test	3		10	1
142	2022-03-15 21:38:16.624288+00	10	True_folder test draft_bluesky@gmail.com	2	[{"changed": {"fields": ["Is draft"]}}]	11	1
143	2022-03-15 21:38:36.671666+00	10	True_folder test draft_bluesky@gmail.com	2	[]	11	1
144	2022-03-15 22:53:48.842221+00	6	blue-sign	1	[{"added": {}}]	8	1
145	2022-03-15 22:56:17.364655+00	90		3		10	1
146	2022-03-15 22:56:17.422665+00	89		3		10	1
147	2022-03-16 09:16:44.360553+00	91		3		10	1
148	2022-03-16 09:16:44.40455+00	88	to maryam	3		10	1
149	2022-03-16 16:06:27.402115+00	93	time test	3		10	1
150	2022-03-16 16:06:27.491116+00	87	folder test draft	3		10	1
151	2022-03-17 14:30:22.692486+00	104		3		10	1
152	2022-03-17 14:30:22.702493+00	103		3		10	1
153	2022-03-17 14:30:22.70549+00	102		3		10	1
154	2022-03-17 19:15:32.874452+00	120	nn	3		10	1
155	2022-03-17 19:15:32.905455+00	119	test corect success	3		10	1
156	2022-03-17 19:15:32.907459+00	118	hey you	3		10	1
157	2022-03-17 19:15:32.910455+00	117	hey you	3		10	1
158	2022-03-17 19:15:32.913461+00	116	hey you	3		10	1
159	2022-03-17 19:15:32.915457+00	115	com	3		10	1
160	2022-03-17 19:15:32.917452+00	114	bd	3		10	1
161	2022-03-17 19:15:32.918457+00	113	blue draft	3		10	1
162	2022-03-17 19:15:32.920456+00	110	draft	3		10	1
163	2022-03-17 19:15:32.923451+00	108	;;;;;;	3		10	1
164	2022-03-17 19:15:32.926458+00	105	ppp	3		10	1
165	2022-03-17 19:15:32.928463+00	101	tt	3		10	1
166	2022-03-17 19:15:32.930456+00	100	qq	3		10	1
167	2022-03-17 19:15:32.944452+00	99	gg	3		10	1
168	2022-03-17 19:15:32.946456+00	98	hh	3		10	1
169	2022-03-17 19:15:32.947452+00	97	nn	3		10	1
170	2022-03-17 19:15:32.949457+00	96	aa	3		10	1
171	2022-03-17 19:15:32.951457+00	95	cc	3		10	1
172	2022-03-17 19:15:32.953457+00	94	dd	3		10	1
173	2022-03-17 19:15:32.954457+00	92	test corect success	3		10	1
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
11	mail	emailfolder
12	mail	filter
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
28	accounts	0002_alter_user_phone_number	2022-03-07 23:18:51.959701+00
29	mail	0007_label_owner	2022-03-08 08:08:05.593661+00
30	mail	0008_emailfolder	2022-03-15 18:09:33.178241+00
31	mail	0009_auto_20220315_2205	2022-03-15 18:35:27.37466+00
32	mail	0010_filter_filter_by	2022-03-17 19:16:51.187254+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
waw5nc4s9x1njf5nle3utk4oxzs1be1r	.eJxVjE0OwiAYBe_C2hCghFKX7j0D-f6QqoGktCvj3bVJF7p9M_NeKsG2lrR1WdLM6qysOv1uCPSQugO-Q701Ta2uy4x6V_RBu742luflcP8OCvTyraMxgtln70g8W2sIOeQRXfZGBmtGJseRPUUwwMQQMIcQp8kOZAlEvT8FVTkJ:1nRxgl:zQ53ZZZX6B4RiZZadkogMnW1FbNP_4OzS4rDJV8pFyU	2022-03-23 14:53:19.922144+00
t11rnbz2hcvm1in9tioinkdqkkzd564c	.eJxVjEEOwiAQRe_C2hBhoDAu3fcMBIZBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIi1FmcfscU6cFtJ_ke222WNLd1mZLcFXnQLsc58_N6uH8HNfb6rV3UgAjoyajik3ZFe_DaGp0MGQcFuRjLnNSQABmAc_E4EEWr2BOL9wfsGjgn:1nUXOm:-pUZyn7iFZ_BAqtueA3cxfG8bARhiO9gbU6YFbOLOiM	2022-03-30 18:25:24.879816+01
da8mz4ew25m85l9305xa86i6i9f50mpa	.eJxVjEEOwiAQRe_C2hBhoDAu3fcMBIZBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIi1FmcfscU6cFtJ_ke222WNLd1mZLcFXnQLsc58_N6uH8HNfb6rV3UgAjoyajik3ZFe_DaGp0MGQcFuRjLnNSQABmAc_E4EEWr2BOL9wfsGjgn:1nUwEn:3SbJWeaiwSmy6OVUq1RmNvQC8J2OW-tQGq5rEooNtV8	2022-03-31 20:56:45.415477+01
kyzsuwiot79d7w9bgka7zyy0eyc0mjc2	.eJxVjE0OwiAYBe_C2hCghFKX7j0D-f6QqoGktCvj3bVJF7p9M_NeKsG2lrR1WdLM6qysOv1uCPSQugO-Q701Ta2uy4x6V_RBu742luflcP8OCvTyraMxgtln70g8W2sIOeQRXfZGBmtGJseRPUUwwMQQMIcQp8kOZAlEvT8FVTkJ:1nUwLL:XXU710UPmPrGZUo2_HH0z7nagfaQy663qwV-4ouprBY	2022-03-31 21:03:31.232384+01
m8fkuq3iwpp29aua884jif74jwxedebj	.eJxVjEEOwiAQRe_C2hBhoDAu3fcMBIZBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIi1FmcfscU6cFtJ_ke222WNLd1mZLcFXnQLsc58_N6uH8HNfb6rV3UgAjoyajik3ZFe_DaGp0MGQcFuRjLnNSQABmAc_E4EEWr2BOL9wfsGjgn:1nQ1Z5:cVXQPZ8A_WyFCqsG95JzoDmQr9ysBjHVBgzcEgYpfVI	2022-03-18 06:37:23.427469+00
ubu7wl57y3txgalucznvvufhrkqafotq	.eJxVjE0OwiAYBe_C2hCghFKX7j0D-f6QqoGktCvj3bVJF7p9M_NeKsG2lrR1WdLM6qysOv1uCPSQugO-Q701Ta2uy4x6V_RBu742luflcP8OCvTyraMxgtln70g8W2sIOeQRXfZGBmtGJseRPUUwwMQQMIcQp8kOZAlEvT8FVTkJ:1nQ1g1:hld3q62Lko4U1uiiQ-wkCpvDgZEQYloA1wXX5jdgn8c	2022-03-18 06:44:33.402618+00
kjtbfhkryz9omsf5reysjq2ggobfqf9m	.eJxVjEEOwiAQRe_C2hBhoDAu3fcMBIZBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIi1FmcfscU6cFtJ_ke222WNLd1mZLcFXnQLsc58_N6uH8HNfb6rV3UgAjoyajik3ZFe_DaGp0MGQcFuRjLnNSQABmAc_E4EEWr2BOL9wfsGjgn:1nQox4:gXJEEF3dyL3pSYYTjylEUzwS01bhw5APSW_EHsKc9CI	2022-03-20 11:21:26.064348+00
iaj5ju0zlycukvlnzbogfpd9cwcmf2vd	.eJxVjE0OwiAYBe_C2hCghFKX7j0D-f6QqoGktCvj3bVJF7p9M_NeKsG2lrR1WdLM6qysOv1uCPSQugO-Q701Ta2uy4x6V_RBu742luflcP8OCvTyraMxgtln70g8W2sIOeQRXfZGBmtGJseRPUUwwMQQMIcQp8kOZAlEvT8FVTkJ:1nQpJq:DYNyV3b_RyRyolQCbPEP61D0EYVRYzqG8u3T_gnuqok	2022-03-20 11:44:58.287213+00
\.


--
-- Data for Name: mail_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email (id, subject, text, file, created, edited, is_archive, is_draft, is_trash, slug, sender_id, signature_id, email_object_id) FROM stdin;
128	aa	this is test filter		2022-03-17 20:14:22.46579+00	2022-03-17 20:14:22.46579+00	f	f	f	\N	1	\N	\N
131	this is different	this is different		2022-03-17 20:24:23.445399+00	2022-03-17 20:24:23.445399+00	f	f	f	\N	10	\N	\N
\.


--
-- Data for Name: mail_email_bcc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_bcc (id, email_id, user_id) FROM stdin;
\.


--
-- Data for Name: mail_email_cc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_cc (id, email_id, user_id) FROM stdin;
\.


--
-- Data for Name: mail_email_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_filter (id, email_id, filter_id) FROM stdin;
16	128	7
\.


--
-- Data for Name: mail_email_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_label (id, email_id, label_id) FROM stdin;
\.


--
-- Data for Name: mail_email_receivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_email_receivers (id, email_id, user_id) FROM stdin;
86	128	10
89	131	1
\.


--
-- Data for Name: mail_emailfolder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_emailfolder (id, is_trash, is_archive, is_draft, email_id, user_id) FROM stdin;
76	f	f	f	131	10
77	f	f	f	131	1
71	f	f	f	128	1
72	f	f	f	128	10
\.


--
-- Data for Name: mail_filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_filter (id, title, owner_id, filter_by) FROM stdin;
1	fol	1	\N
2	fol	1	\N
3	fol	1	\N
4	maryam	1	\N
5	blue	1	\N
6	n	10	\N
7	filter by a	10	aa
\.


--
-- Data for Name: mail_label; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_label (id, title, slug, owner_id) FROM stdin;
4	test	test	1
3	label2	label2	10
1	label1	lable1	10
5	art	art	1
6	tech	tech	1
7	archive	archive	1
10	Trash	trash	1
11	Draft	draft	1
13	Tests	tests	1
\.


--
-- Data for Name: mail_signature; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail_signature (id, text, stamp, user_id) FROM stdin;
1	MaryamSign		1
4	maryam		1
5	maryam		\N
6	blue-sign		10
\.


--
-- Name: accounts_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_groups_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 16, true);


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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: contacts_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_contact_id_seq', 7, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 173, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 32, true);


--
-- Name: mail_email_bcc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_bcc_id_seq', 36, true);


--
-- Name: mail_email_cc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_cc_id_seq', 40, true);


--
-- Name: mail_email_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_filter_id_seq', 17, true);


--
-- Name: mail_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_id_seq', 131, true);


--
-- Name: mail_email_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_label_id_seq', 28, true);


--
-- Name: mail_email_receivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_email_receivers_id_seq', 89, true);


--
-- Name: mail_emailfolder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_emailfolder_id_seq', 77, true);


--
-- Name: mail_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_filter_id_seq', 7, true);


--
-- Name: mail_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_label_id_seq', 15, true);


--
-- Name: mail_signature_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_signature_id_seq', 6, true);


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
-- Name: mail_email_filter mail_email_filter_email_id_filter_id_e1fcd3fc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_filter
    ADD CONSTRAINT mail_email_filter_email_id_filter_id_e1fcd3fc_uniq UNIQUE (email_id, filter_id);


--
-- Name: mail_email_filter mail_email_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_filter
    ADD CONSTRAINT mail_email_filter_pkey PRIMARY KEY (id);


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
-- Name: mail_emailfolder mail_emailfolder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_emailfolder
    ADD CONSTRAINT mail_emailfolder_pkey PRIMARY KEY (id);


--
-- Name: mail_filter mail_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_filter
    ADD CONSTRAINT mail_filter_pkey PRIMARY KEY (id);


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
-- Name: mail_email_filter_email_id_fbaa801d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_filter_email_id_fbaa801d ON public.mail_email_filter USING btree (email_id);


--
-- Name: mail_email_filter_filter_id_01c640b3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_email_filter_filter_id_01c640b3 ON public.mail_email_filter USING btree (filter_id);


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
-- Name: mail_emailfolder_email_id_9a818d5c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_emailfolder_email_id_9a818d5c ON public.mail_emailfolder USING btree (email_id);


--
-- Name: mail_emailfolder_user_id_058eda7e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_emailfolder_user_id_058eda7e ON public.mail_emailfolder USING btree (user_id);


--
-- Name: mail_filter_owner_id_0acd4079; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_filter_owner_id_0acd4079 ON public.mail_filter USING btree (owner_id);


--
-- Name: mail_label_owner_id_f33ecba1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_label_owner_id_f33ecba1 ON public.mail_label USING btree (owner_id);


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
-- Name: mail_email_filter mail_email_filter_email_id_fbaa801d_fk_mail_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_filter
    ADD CONSTRAINT mail_email_filter_email_id_fbaa801d_fk_mail_email_id FOREIGN KEY (email_id) REFERENCES public.mail_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_email_filter mail_email_filter_filter_id_01c640b3_fk_mail_filter_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_email_filter
    ADD CONSTRAINT mail_email_filter_filter_id_01c640b3_fk_mail_filter_id FOREIGN KEY (filter_id) REFERENCES public.mail_filter(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: mail_emailfolder mail_emailfolder_email_id_9a818d5c_fk_mail_email_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_emailfolder
    ADD CONSTRAINT mail_emailfolder_email_id_9a818d5c_fk_mail_email_id FOREIGN KEY (email_id) REFERENCES public.mail_email(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_emailfolder mail_emailfolder_user_id_058eda7e_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_emailfolder
    ADD CONSTRAINT mail_emailfolder_user_id_058eda7e_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_filter mail_filter_owner_id_0acd4079_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_filter
    ADD CONSTRAINT mail_filter_owner_id_0acd4079_fk_accounts_user_id FOREIGN KEY (owner_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_label mail_label_owner_id_f33ecba1_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_label
    ADD CONSTRAINT mail_label_owner_id_f33ecba1_fk_accounts_user_id FOREIGN KEY (owner_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mail_signature mail_signature_user_id_6ea60876_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_signature
    ADD CONSTRAINT mail_signature_user_id_6ea60876_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

