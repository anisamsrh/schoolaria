toc.dat                                                                                             0000600 0004000 0002000 00000037132 14774115043 0014453 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           1    	            }            basdat    15.3    15.3 ;    >           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         @           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         A           1262    24600    basdat    DATABASE     �   CREATE DATABASE basdat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE basdat;
                postgres    false         �            1259    32800    chapter    TABLE        CREATE TABLE public.chapter (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    bobot integer NOT NULL
);
    DROP TABLE public.chapter;
       public         heap    postgres    false         �            1259    32799    chapter_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chapter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.chapter_id_seq;
       public          postgres    false    217         B           0    0    chapter_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.chapter_id_seq OWNED BY public.chapter.id;
          public          postgres    false    216         �            1259    32855    konfigurasi    TABLE     �   CREATE TABLE public.konfigurasi (
    id integer NOT NULL,
    nama_konfigurasi character varying(255) NOT NULL,
    nilai text NOT NULL,
    deskripsi text
);
    DROP TABLE public.konfigurasi;
       public         heap    postgres    false         �            1259    32854    konfigurasi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.konfigurasi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.konfigurasi_id_seq;
       public          postgres    false    227         C           0    0    konfigurasi_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.konfigurasi_id_seq OWNED BY public.konfigurasi.id;
          public          postgres    false    226         �            1259    32838    nilai    TABLE     �   CREATE TABLE public.nilai (
    id integer NOT NULL,
    angka_nilai integer NOT NULL,
    id_subparam integer NOT NULL,
    id_siswa integer NOT NULL
);
    DROP TABLE public.nilai;
       public         heap    postgres    false         �            1259    32837    nilai_id_seq    SEQUENCE     �   CREATE SEQUENCE public.nilai_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.nilai_id_seq;
       public          postgres    false    225         D           0    0    nilai_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.nilai_id_seq OWNED BY public.nilai.id;
          public          postgres    false    224         �            1259    32814    param    TABLE     �   CREATE TABLE public.param (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    id_chapter integer NOT NULL
);
    DROP TABLE public.param;
       public         heap    postgres    false         �            1259    32813    param_id_seq    SEQUENCE     �   CREATE SEQUENCE public.param_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.param_id_seq;
       public          postgres    false    221         E           0    0    param_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.param_id_seq OWNED BY public.param.id;
          public          postgres    false    220         �            1259    32807    predikat    TABLE     �   CREATE TABLE public.predikat (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    batas_atas integer NOT NULL,
    batas_bawah integer NOT NULL
);
    DROP TABLE public.predikat;
       public         heap    postgres    false         �            1259    32806    predikat_id_seq    SEQUENCE     �   CREATE SEQUENCE public.predikat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.predikat_id_seq;
       public          postgres    false    219         F           0    0    predikat_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.predikat_id_seq OWNED BY public.predikat.id;
          public          postgres    false    218         �            1259    32793    siswa    TABLE     x   CREATE TABLE public.siswa (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    nrp text NOT NULL
);
    DROP TABLE public.siswa;
       public         heap    postgres    false         �            1259    32792    siswa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.siswa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.siswa_id_seq;
       public          postgres    false    215         G           0    0    siswa_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.siswa_id_seq OWNED BY public.siswa.id;
          public          postgres    false    214         �            1259    32826    subparam    TABLE     �   CREATE TABLE public.subparam (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    id_param integer NOT NULL
);
    DROP TABLE public.subparam;
       public         heap    postgres    false         �            1259    32825    subparam_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subparam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.subparam_id_seq;
       public          postgres    false    223         H           0    0    subparam_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.subparam_id_seq OWNED BY public.subparam.id;
          public          postgres    false    222         �           2604    32803 
   chapter id    DEFAULT     h   ALTER TABLE ONLY public.chapter ALTER COLUMN id SET DEFAULT nextval('public.chapter_id_seq'::regclass);
 9   ALTER TABLE public.chapter ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217         �           2604    32858    konfigurasi id    DEFAULT     p   ALTER TABLE ONLY public.konfigurasi ALTER COLUMN id SET DEFAULT nextval('public.konfigurasi_id_seq'::regclass);
 =   ALTER TABLE public.konfigurasi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227         �           2604    32841    nilai id    DEFAULT     d   ALTER TABLE ONLY public.nilai ALTER COLUMN id SET DEFAULT nextval('public.nilai_id_seq'::regclass);
 7   ALTER TABLE public.nilai ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225         �           2604    32817    param id    DEFAULT     d   ALTER TABLE ONLY public.param ALTER COLUMN id SET DEFAULT nextval('public.param_id_seq'::regclass);
 7   ALTER TABLE public.param ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221         �           2604    32810    predikat id    DEFAULT     j   ALTER TABLE ONLY public.predikat ALTER COLUMN id SET DEFAULT nextval('public.predikat_id_seq'::regclass);
 :   ALTER TABLE public.predikat ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219         �           2604    32796    siswa id    DEFAULT     d   ALTER TABLE ONLY public.siswa ALTER COLUMN id SET DEFAULT nextval('public.siswa_id_seq'::regclass);
 7   ALTER TABLE public.siswa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215         �           2604    32829    subparam id    DEFAULT     j   ALTER TABLE ONLY public.subparam ALTER COLUMN id SET DEFAULT nextval('public.subparam_id_seq'::regclass);
 :   ALTER TABLE public.subparam ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223         1          0    32800    chapter 
   TABLE DATA           2   COPY public.chapter (id, nama, bobot) FROM stdin;
    public          postgres    false    217       3377.dat ;          0    32855    konfigurasi 
   TABLE DATA           M   COPY public.konfigurasi (id, nama_konfigurasi, nilai, deskripsi) FROM stdin;
    public          postgres    false    227       3387.dat 9          0    32838    nilai 
   TABLE DATA           G   COPY public.nilai (id, angka_nilai, id_subparam, id_siswa) FROM stdin;
    public          postgres    false    225       3385.dat 5          0    32814    param 
   TABLE DATA           5   COPY public.param (id, nama, id_chapter) FROM stdin;
    public          postgres    false    221       3381.dat 3          0    32807    predikat 
   TABLE DATA           E   COPY public.predikat (id, nama, batas_atas, batas_bawah) FROM stdin;
    public          postgres    false    219       3379.dat /          0    32793    siswa 
   TABLE DATA           .   COPY public.siswa (id, nama, nrp) FROM stdin;
    public          postgres    false    215       3375.dat 7          0    32826    subparam 
   TABLE DATA           6   COPY public.subparam (id, nama, id_param) FROM stdin;
    public          postgres    false    223       3383.dat I           0    0    chapter_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.chapter_id_seq', 7, true);
          public          postgres    false    216         J           0    0    konfigurasi_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.konfigurasi_id_seq', 1, true);
          public          postgres    false    226         K           0    0    nilai_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.nilai_id_seq', 26, true);
          public          postgres    false    224         L           0    0    param_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.param_id_seq', 11, true);
          public          postgres    false    220         M           0    0    predikat_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.predikat_id_seq', 1, false);
          public          postgres    false    218         N           0    0    siswa_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.siswa_id_seq', 7, true);
          public          postgres    false    214         O           0    0    subparam_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.subparam_id_seq', 17, true);
          public          postgres    false    222         �           2606    32805    chapter chapter_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.chapter
    ADD CONSTRAINT chapter_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.chapter DROP CONSTRAINT chapter_pkey;
       public            postgres    false    217         �           2606    32864 ,   konfigurasi konfigurasi_nama_konfigurasi_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.konfigurasi
    ADD CONSTRAINT konfigurasi_nama_konfigurasi_key UNIQUE (nama_konfigurasi);
 V   ALTER TABLE ONLY public.konfigurasi DROP CONSTRAINT konfigurasi_nama_konfigurasi_key;
       public            postgres    false    227         �           2606    32862    konfigurasi konfigurasi_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.konfigurasi
    ADD CONSTRAINT konfigurasi_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.konfigurasi DROP CONSTRAINT konfigurasi_pkey;
       public            postgres    false    227         �           2606    32843    nilai nilai_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.nilai DROP CONSTRAINT nilai_pkey;
       public            postgres    false    225         �           2606    32819    param param_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.param
    ADD CONSTRAINT param_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.param DROP CONSTRAINT param_pkey;
       public            postgres    false    221         �           2606    32812    predikat predikat_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.predikat
    ADD CONSTRAINT predikat_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.predikat DROP CONSTRAINT predikat_pkey;
       public            postgres    false    219         �           2606    32798    siswa siswa_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.siswa
    ADD CONSTRAINT siswa_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.siswa DROP CONSTRAINT siswa_pkey;
       public            postgres    false    215         �           2606    32831    subparam subparam_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.subparam
    ADD CONSTRAINT subparam_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.subparam DROP CONSTRAINT subparam_pkey;
       public            postgres    false    223         �           2606    41066 !   nilai unique_nilai_siswa_subparam 
   CONSTRAINT     m   ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT unique_nilai_siswa_subparam UNIQUE (id_siswa, id_subparam);
 K   ALTER TABLE ONLY public.nilai DROP CONSTRAINT unique_nilai_siswa_subparam;
       public            postgres    false    225    225         �           2606    32849    nilai nilai_id_siswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_id_siswa_fkey FOREIGN KEY (id_siswa) REFERENCES public.siswa(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.nilai DROP CONSTRAINT nilai_id_siswa_fkey;
       public          postgres    false    3211    215    225         �           2606    32844    nilai nilai_id_subparam_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_id_subparam_fkey FOREIGN KEY (id_subparam) REFERENCES public.subparam(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.nilai DROP CONSTRAINT nilai_id_subparam_fkey;
       public          postgres    false    225    223    3219         �           2606    32820    param param_id_chapter_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.param
    ADD CONSTRAINT param_id_chapter_fkey FOREIGN KEY (id_chapter) REFERENCES public.chapter(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.param DROP CONSTRAINT param_id_chapter_fkey;
       public          postgres    false    221    217    3213         �           2606    32832    subparam subparam_id_param_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subparam
    ADD CONSTRAINT subparam_id_param_fkey FOREIGN KEY (id_param) REFERENCES public.param(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.subparam DROP CONSTRAINT subparam_id_param_fkey;
       public          postgres    false    3217    223    221                                                                                                                                                                                                                                                                                                                                                                                                                                              3377.dat                                                                                            0000600 0004000 0002000 00000000101 14774115043 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	FISIKA	5
3	KIMIA	5
4	MATEMATIKA	5
1	OTONOMI	4
7	SEJARAH	5
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                               3387.dat                                                                                            0000600 0004000 0002000 00000000125 14774115043 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	predikat_min_lulus	B	Nilai huruf predikat minimal agar siswa dinyatakan lulus
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                           3385.dat                                                                                            0000600 0004000 0002000 00000000336 14774115043 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	43	4	1
2	72	11	1
3	48	6	1
4	80	3	1
5	18	7	1
7	19	2	1
8	36	1	2
10	11	9	2
11	32	3	2
12	61	12	2
13	32	4	2
14	28	4	3
15	79	12	3
16	81	5	3
17	68	9	3
18	81	2	3
19	95	7	3
20	96	1	3
22	88	8	1
24	88	9	1
25	100	12	1
6	67	1	1
\.


                                                                                                                                                                                                                                                                                                  3381.dat                                                                                            0000600 0004000 0002000 00000000151 14774115043 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	UJIAN	1
3	PR	2
4	UJIAN	2
5	PR	3
6	UJIAN	3
7	PR	4
8	UJIAN	4
10	Artikel Ilmiah	7
1	Artikel Ilmiah	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                       3379.dat                                                                                            0000600 0004000 0002000 00000000067 14774115043 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	A	100	91
2	B	90	76
3	C	75	51
4	D	50	31
5	E	30	0
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                         3375.dat                                                                                            0000600 0004000 0002000 00000000170 14774115043 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	CHRISTIN	1014
2	AMIN	1024
3	LIA	1076
4	Annisa	50324231025
6	Miftakhuddin	5024231129
7	Bustanul Arifin	5024231129
\.


                                                                                                                                                                                                                                                                                                                                                                                                        3383.dat                                                                                            0000600 0004000 0002000 00000000303 14774115043 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	ETS	2
2	EAS	2
3	TUGAS 1	1
4	ETS	4
5	EAS	4
6	TUGAS 1	3
7	ETS	6
8	EAS	6
9	TUGAS 1	5
10	ETS	8
11	EAS	8
12	TUGAS 1	7
17	Tokoh Perjanjian Linggarjati	10
16	Tokoh Perjuangan Agresi Militer 1	10
\.


                                                                                                                                                                                                                                                                                                                             restore.sql                                                                                         0000600 0004000 0002000 00000030505 14774115043 0015375 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

DROP DATABASE basdat;
--
-- Name: basdat; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE basdat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE basdat OWNER TO postgres;

\connect basdat

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
-- Name: chapter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chapter (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    bobot integer NOT NULL
);


ALTER TABLE public.chapter OWNER TO postgres;

--
-- Name: chapter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chapter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chapter_id_seq OWNER TO postgres;

--
-- Name: chapter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chapter_id_seq OWNED BY public.chapter.id;


--
-- Name: konfigurasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.konfigurasi (
    id integer NOT NULL,
    nama_konfigurasi character varying(255) NOT NULL,
    nilai text NOT NULL,
    deskripsi text
);


ALTER TABLE public.konfigurasi OWNER TO postgres;

--
-- Name: konfigurasi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.konfigurasi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.konfigurasi_id_seq OWNER TO postgres;

--
-- Name: konfigurasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.konfigurasi_id_seq OWNED BY public.konfigurasi.id;


--
-- Name: nilai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nilai (
    id integer NOT NULL,
    angka_nilai integer NOT NULL,
    id_subparam integer NOT NULL,
    id_siswa integer NOT NULL
);


ALTER TABLE public.nilai OWNER TO postgres;

--
-- Name: nilai_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nilai_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nilai_id_seq OWNER TO postgres;

--
-- Name: nilai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nilai_id_seq OWNED BY public.nilai.id;


--
-- Name: param; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.param (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    id_chapter integer NOT NULL
);


ALTER TABLE public.param OWNER TO postgres;

--
-- Name: param_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.param_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.param_id_seq OWNER TO postgres;

--
-- Name: param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.param_id_seq OWNED BY public.param.id;


--
-- Name: predikat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.predikat (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    batas_atas integer NOT NULL,
    batas_bawah integer NOT NULL
);


ALTER TABLE public.predikat OWNER TO postgres;

--
-- Name: predikat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.predikat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.predikat_id_seq OWNER TO postgres;

--
-- Name: predikat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.predikat_id_seq OWNED BY public.predikat.id;


--
-- Name: siswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siswa (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    nrp text NOT NULL
);


ALTER TABLE public.siswa OWNER TO postgres;

--
-- Name: siswa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.siswa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.siswa_id_seq OWNER TO postgres;

--
-- Name: siswa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siswa_id_seq OWNED BY public.siswa.id;


--
-- Name: subparam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subparam (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    id_param integer NOT NULL
);


ALTER TABLE public.subparam OWNER TO postgres;

--
-- Name: subparam_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subparam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subparam_id_seq OWNER TO postgres;

--
-- Name: subparam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subparam_id_seq OWNED BY public.subparam.id;


--
-- Name: chapter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapter ALTER COLUMN id SET DEFAULT nextval('public.chapter_id_seq'::regclass);


--
-- Name: konfigurasi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.konfigurasi ALTER COLUMN id SET DEFAULT nextval('public.konfigurasi_id_seq'::regclass);


--
-- Name: nilai id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nilai ALTER COLUMN id SET DEFAULT nextval('public.nilai_id_seq'::regclass);


--
-- Name: param id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.param ALTER COLUMN id SET DEFAULT nextval('public.param_id_seq'::regclass);


--
-- Name: predikat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predikat ALTER COLUMN id SET DEFAULT nextval('public.predikat_id_seq'::regclass);


--
-- Name: siswa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siswa ALTER COLUMN id SET DEFAULT nextval('public.siswa_id_seq'::regclass);


--
-- Name: subparam id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subparam ALTER COLUMN id SET DEFAULT nextval('public.subparam_id_seq'::regclass);


--
-- Data for Name: chapter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chapter (id, nama, bobot) FROM stdin;
\.
COPY public.chapter (id, nama, bobot) FROM '$$PATH$$/3377.dat';

--
-- Data for Name: konfigurasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.konfigurasi (id, nama_konfigurasi, nilai, deskripsi) FROM stdin;
\.
COPY public.konfigurasi (id, nama_konfigurasi, nilai, deskripsi) FROM '$$PATH$$/3387.dat';

--
-- Data for Name: nilai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nilai (id, angka_nilai, id_subparam, id_siswa) FROM stdin;
\.
COPY public.nilai (id, angka_nilai, id_subparam, id_siswa) FROM '$$PATH$$/3385.dat';

--
-- Data for Name: param; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.param (id, nama, id_chapter) FROM stdin;
\.
COPY public.param (id, nama, id_chapter) FROM '$$PATH$$/3381.dat';

--
-- Data for Name: predikat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.predikat (id, nama, batas_atas, batas_bawah) FROM stdin;
\.
COPY public.predikat (id, nama, batas_atas, batas_bawah) FROM '$$PATH$$/3379.dat';

--
-- Data for Name: siswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siswa (id, nama, nrp) FROM stdin;
\.
COPY public.siswa (id, nama, nrp) FROM '$$PATH$$/3375.dat';

--
-- Data for Name: subparam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subparam (id, nama, id_param) FROM stdin;
\.
COPY public.subparam (id, nama, id_param) FROM '$$PATH$$/3383.dat';

--
-- Name: chapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chapter_id_seq', 7, true);


--
-- Name: konfigurasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.konfigurasi_id_seq', 1, true);


--
-- Name: nilai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nilai_id_seq', 26, true);


--
-- Name: param_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.param_id_seq', 11, true);


--
-- Name: predikat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.predikat_id_seq', 1, false);


--
-- Name: siswa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.siswa_id_seq', 7, true);


--
-- Name: subparam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subparam_id_seq', 17, true);


--
-- Name: chapter chapter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chapter
    ADD CONSTRAINT chapter_pkey PRIMARY KEY (id);


--
-- Name: konfigurasi konfigurasi_nama_konfigurasi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.konfigurasi
    ADD CONSTRAINT konfigurasi_nama_konfigurasi_key UNIQUE (nama_konfigurasi);


--
-- Name: konfigurasi konfigurasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.konfigurasi
    ADD CONSTRAINT konfigurasi_pkey PRIMARY KEY (id);


--
-- Name: nilai nilai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_pkey PRIMARY KEY (id);


--
-- Name: param param_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.param
    ADD CONSTRAINT param_pkey PRIMARY KEY (id);


--
-- Name: predikat predikat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predikat
    ADD CONSTRAINT predikat_pkey PRIMARY KEY (id);


--
-- Name: siswa siswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siswa
    ADD CONSTRAINT siswa_pkey PRIMARY KEY (id);


--
-- Name: subparam subparam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subparam
    ADD CONSTRAINT subparam_pkey PRIMARY KEY (id);


--
-- Name: nilai unique_nilai_siswa_subparam; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT unique_nilai_siswa_subparam UNIQUE (id_siswa, id_subparam);


--
-- Name: nilai nilai_id_siswa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_id_siswa_fkey FOREIGN KEY (id_siswa) REFERENCES public.siswa(id) ON DELETE CASCADE;


--
-- Name: nilai nilai_id_subparam_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_id_subparam_fkey FOREIGN KEY (id_subparam) REFERENCES public.subparam(id) ON DELETE CASCADE;


--
-- Name: param param_id_chapter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.param
    ADD CONSTRAINT param_id_chapter_fkey FOREIGN KEY (id_chapter) REFERENCES public.chapter(id) ON DELETE CASCADE;


--
-- Name: subparam subparam_id_param_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subparam
    ADD CONSTRAINT subparam_id_param_fkey FOREIGN KEY (id_param) REFERENCES public.param(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           