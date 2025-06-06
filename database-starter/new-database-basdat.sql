PGDMP                         }            basdat    15.3    15.3 I    _           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            `           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            a           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            b           1262    24600    basdat    DATABASE     �   CREATE DATABASE basdat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE basdat;
                postgres    false                        3079    41808 
   btree_gist 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;
    DROP EXTENSION btree_gist;
                   false            c           0    0    EXTENSION btree_gist    COMMENT     T   COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';
                        false    2            �            1259    42485    catatan    TABLE     �   CREATE TABLE public.catatan (
    id integer NOT NULL,
    note text NOT NULL,
    id_siswa integer NOT NULL,
    id_chapter integer NOT NULL
);
    DROP TABLE public.catatan;
       public         heap    postgres    false            �            1259    42484    catatan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.catatan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.catatan_id_seq;
       public          postgres    false    230            d           0    0    catatan_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.catatan_id_seq OWNED BY public.catatan.id;
          public          postgres    false    229            �            1259    32800    chapter    TABLE        CREATE TABLE public.chapter (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    bobot integer NOT NULL
);
    DROP TABLE public.chapter;
       public         heap    postgres    false            �            1259    32799    chapter_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chapter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.chapter_id_seq;
       public          postgres    false    218            e           0    0    chapter_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.chapter_id_seq OWNED BY public.chapter.id;
          public          postgres    false    217            �            1259    32855    konfigurasi    TABLE     �   CREATE TABLE public.konfigurasi (
    id integer NOT NULL,
    nama_konfigurasi character varying(255) NOT NULL,
    nilai text NOT NULL,
    deskripsi text
);
    DROP TABLE public.konfigurasi;
       public         heap    postgres    false            �            1259    32854    konfigurasi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.konfigurasi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.konfigurasi_id_seq;
       public          postgres    false    226            f           0    0    konfigurasi_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.konfigurasi_id_seq OWNED BY public.konfigurasi.id;
          public          postgres    false    225            �            1259    32838    nilai    TABLE     �   CREATE TABLE public.nilai (
    id integer NOT NULL,
    angka_nilai integer NOT NULL,
    id_subparam integer NOT NULL,
    id_siswa integer NOT NULL
);
    DROP TABLE public.nilai;
       public         heap    postgres    false            �            1259    42459    predikat    TABLE     {   CREATE TABLE public.predikat (
    id integer NOT NULL,
    nama character varying(100) NOT NULL,
    rentang int4range
);
    DROP TABLE public.predikat;
       public         heap    postgres    false            �            1259    42458    nilai_huruf_id_seq    SEQUENCE     �   CREATE SEQUENCE public.nilai_huruf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.nilai_huruf_id_seq;
       public          postgres    false    228            g           0    0    nilai_huruf_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.nilai_huruf_id_seq OWNED BY public.predikat.id;
          public          postgres    false    227            �            1259    32837    nilai_id_seq    SEQUENCE     �   CREATE SEQUENCE public.nilai_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.nilai_id_seq;
       public          postgres    false    224            h           0    0    nilai_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.nilai_id_seq OWNED BY public.nilai.id;
          public          postgres    false    223            �            1259    32814    param    TABLE     �   CREATE TABLE public.param (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    id_chapter integer NOT NULL
);
    DROP TABLE public.param;
       public         heap    postgres    false            �            1259    32813    param_id_seq    SEQUENCE     �   CREATE SEQUENCE public.param_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.param_id_seq;
       public          postgres    false    220            i           0    0    param_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.param_id_seq OWNED BY public.param.id;
          public          postgres    false    219            �            1259    32793    siswa    TABLE     x   CREATE TABLE public.siswa (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    nrp text NOT NULL
);
    DROP TABLE public.siswa;
       public         heap    postgres    false            �            1259    32792    siswa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.siswa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.siswa_id_seq;
       public          postgres    false    216            j           0    0    siswa_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.siswa_id_seq OWNED BY public.siswa.id;
          public          postgres    false    215            �            1259    32826    subparam    TABLE     �   CREATE TABLE public.subparam (
    id integer NOT NULL,
    nama character varying(255) NOT NULL,
    id_param integer NOT NULL
);
    DROP TABLE public.subparam;
       public         heap    postgres    false            �            1259    32825    subparam_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subparam_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.subparam_id_seq;
       public          postgres    false    222            k           0    0    subparam_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.subparam_id_seq OWNED BY public.subparam.id;
          public          postgres    false    221            �           2604    42488 
   catatan id    DEFAULT     h   ALTER TABLE ONLY public.catatan ALTER COLUMN id SET DEFAULT nextval('public.catatan_id_seq'::regclass);
 9   ALTER TABLE public.catatan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    32803 
   chapter id    DEFAULT     h   ALTER TABLE ONLY public.chapter ALTER COLUMN id SET DEFAULT nextval('public.chapter_id_seq'::regclass);
 9   ALTER TABLE public.chapter ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    32858    konfigurasi id    DEFAULT     p   ALTER TABLE ONLY public.konfigurasi ALTER COLUMN id SET DEFAULT nextval('public.konfigurasi_id_seq'::regclass);
 =   ALTER TABLE public.konfigurasi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    32841    nilai id    DEFAULT     d   ALTER TABLE ONLY public.nilai ALTER COLUMN id SET DEFAULT nextval('public.nilai_id_seq'::regclass);
 7   ALTER TABLE public.nilai ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    32817    param id    DEFAULT     d   ALTER TABLE ONLY public.param ALTER COLUMN id SET DEFAULT nextval('public.param_id_seq'::regclass);
 7   ALTER TABLE public.param ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    42462    predikat id    DEFAULT     m   ALTER TABLE ONLY public.predikat ALTER COLUMN id SET DEFAULT nextval('public.nilai_huruf_id_seq'::regclass);
 :   ALTER TABLE public.predikat ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    32796    siswa id    DEFAULT     d   ALTER TABLE ONLY public.siswa ALTER COLUMN id SET DEFAULT nextval('public.siswa_id_seq'::regclass);
 7   ALTER TABLE public.siswa ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    32829    subparam id    DEFAULT     j   ALTER TABLE ONLY public.subparam ALTER COLUMN id SET DEFAULT nextval('public.subparam_id_seq'::regclass);
 :   ALTER TABLE public.subparam ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            \          0    42485    catatan 
   TABLE DATA           A   COPY public.catatan (id, note, id_siswa, id_chapter) FROM stdin;
    public          postgres    false    230   �N       P          0    32800    chapter 
   TABLE DATA           2   COPY public.chapter (id, nama, bobot) FROM stdin;
    public          postgres    false    218   �N       X          0    32855    konfigurasi 
   TABLE DATA           M   COPY public.konfigurasi (id, nama_konfigurasi, nilai, deskripsi) FROM stdin;
    public          postgres    false    226   :O       V          0    32838    nilai 
   TABLE DATA           G   COPY public.nilai (id, angka_nilai, id_subparam, id_siswa) FROM stdin;
    public          postgres    false    224   �O       R          0    32814    param 
   TABLE DATA           5   COPY public.param (id, nama, id_chapter) FROM stdin;
    public          postgres    false    220   �O       Z          0    42459    predikat 
   TABLE DATA           5   COPY public.predikat (id, nama, rentang) FROM stdin;
    public          postgres    false    228   P       N          0    32793    siswa 
   TABLE DATA           .   COPY public.siswa (id, nama, nrp) FROM stdin;
    public          postgres    false    216   eP       T          0    32826    subparam 
   TABLE DATA           6   COPY public.subparam (id, nama, id_param) FROM stdin;
    public          postgres    false    222   Q       l           0    0    catatan_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.catatan_id_seq', 1, true);
          public          postgres    false    229            m           0    0    chapter_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.chapter_id_seq', 3, true);
          public          postgres    false    217            n           0    0    konfigurasi_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.konfigurasi_id_seq', 1, true);
          public          postgres    false    225            o           0    0    nilai_huruf_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.nilai_huruf_id_seq', 15, true);
          public          postgres    false    227            p           0    0    nilai_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.nilai_id_seq', 3, true);
          public          postgres    false    223            q           0    0    param_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.param_id_seq', 6, true);
          public          postgres    false    219            r           0    0    siswa_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.siswa_id_seq', 9, true);
          public          postgres    false    215            s           0    0    subparam_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.subparam_id_seq', 12, true);
          public          postgres    false    221            �           2606    42492    catatan catatan_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.catatan
    ADD CONSTRAINT catatan_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.catatan DROP CONSTRAINT catatan_pkey;
       public            postgres    false    230            �           2606    32805    chapter chapter_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.chapter
    ADD CONSTRAINT chapter_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.chapter DROP CONSTRAINT chapter_pkey;
       public            postgres    false    218            �           2606    32864 ,   konfigurasi konfigurasi_nama_konfigurasi_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.konfigurasi
    ADD CONSTRAINT konfigurasi_nama_konfigurasi_key UNIQUE (nama_konfigurasi);
 V   ALTER TABLE ONLY public.konfigurasi DROP CONSTRAINT konfigurasi_nama_konfigurasi_key;
       public            postgres    false    226            �           2606    32862    konfigurasi konfigurasi_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.konfigurasi
    ADD CONSTRAINT konfigurasi_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.konfigurasi DROP CONSTRAINT konfigurasi_pkey;
       public            postgres    false    226            �           2606    42468    predikat nilai_huruf_nama_key 
   CONSTRAINT     X   ALTER TABLE ONLY public.predikat
    ADD CONSTRAINT nilai_huruf_nama_key UNIQUE (nama);
 G   ALTER TABLE ONLY public.predikat DROP CONSTRAINT nilai_huruf_nama_key;
       public            postgres    false    228            �           2606    42466    predikat nilai_huruf_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.predikat
    ADD CONSTRAINT nilai_huruf_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.predikat DROP CONSTRAINT nilai_huruf_pkey;
       public            postgres    false    228            �           2606    32843    nilai nilai_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.nilai DROP CONSTRAINT nilai_pkey;
       public            postgres    false    224            �           2606    42470    predikat no_overlap_grade 
   CONSTRAINT     k   ALTER TABLE ONLY public.predikat
    ADD CONSTRAINT no_overlap_grade EXCLUDE USING gist (rentang WITH &&);
 C   ALTER TABLE ONLY public.predikat DROP CONSTRAINT no_overlap_grade;
       public            postgres    false    228            �           2606    32819    param param_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.param
    ADD CONSTRAINT param_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.param DROP CONSTRAINT param_pkey;
       public            postgres    false    220            �           2606    32798    siswa siswa_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.siswa
    ADD CONSTRAINT siswa_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.siswa DROP CONSTRAINT siswa_pkey;
       public            postgres    false    216            �           2606    32831    subparam subparam_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.subparam
    ADD CONSTRAINT subparam_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.subparam DROP CONSTRAINT subparam_pkey;
       public            postgres    false    222            �           2606    41066 !   nilai unique_nilai_siswa_subparam 
   CONSTRAINT     m   ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT unique_nilai_siswa_subparam UNIQUE (id_siswa, id_subparam);
 K   ALTER TABLE ONLY public.nilai DROP CONSTRAINT unique_nilai_siswa_subparam;
       public            postgres    false    224    224            �           2606    42504    catatan unique_siswa_chapter 
   CONSTRAINT     g   ALTER TABLE ONLY public.catatan
    ADD CONSTRAINT unique_siswa_chapter UNIQUE (id_siswa, id_chapter);
 F   ALTER TABLE ONLY public.catatan DROP CONSTRAINT unique_siswa_chapter;
       public            postgres    false    230    230            �           2606    42498    catatan fk_catatan_chapter    FK CONSTRAINT     �   ALTER TABLE ONLY public.catatan
    ADD CONSTRAINT fk_catatan_chapter FOREIGN KEY (id_chapter) REFERENCES public.chapter(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.catatan DROP CONSTRAINT fk_catatan_chapter;
       public          postgres    false    3490    218    230            �           2606    42493    catatan fk_catatan_siswa    FK CONSTRAINT     �   ALTER TABLE ONLY public.catatan
    ADD CONSTRAINT fk_catatan_siswa FOREIGN KEY (id_siswa) REFERENCES public.siswa(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.catatan DROP CONSTRAINT fk_catatan_siswa;
       public          postgres    false    216    230    3488            �           2606    32849    nilai nilai_id_siswa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_id_siswa_fkey FOREIGN KEY (id_siswa) REFERENCES public.siswa(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.nilai DROP CONSTRAINT nilai_id_siswa_fkey;
       public          postgres    false    224    216    3488            �           2606    32844    nilai nilai_id_subparam_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.nilai
    ADD CONSTRAINT nilai_id_subparam_fkey FOREIGN KEY (id_subparam) REFERENCES public.subparam(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.nilai DROP CONSTRAINT nilai_id_subparam_fkey;
       public          postgres    false    224    222    3494            �           2606    32820    param param_id_chapter_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.param
    ADD CONSTRAINT param_id_chapter_fkey FOREIGN KEY (id_chapter) REFERENCES public.chapter(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.param DROP CONSTRAINT param_id_chapter_fkey;
       public          postgres    false    218    220    3490            �           2606    32832    subparam subparam_id_param_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.subparam
    ADD CONSTRAINT subparam_id_param_fkey FOREIGN KEY (id_param) REFERENCES public.param(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.subparam DROP CONSTRAINT subparam_id_param_fkey;
       public          postgres    false    222    3492    220            \      x�3�t��OQ��OR�4�4����� 7�F      P   ,   x�3�t���v�4�2��uqbט�������Ȏ���� �A�      X   S   x�3�,(JM��N,���̋�)�)-�t����I�T�(-*MS�)P *��M�QHLO,R(�,.OTH�̫L,I�N�S k����� 4`      V   &   x�3�440�4�4�2ⴰ�42�9-�8���=... KG      R   5   x�3���t��4�2������,c.N_GoGG��)�m�egs��qqq ,�      Z   =   x�34�t䌶0�140��24�t�67ӱ0rL8�9�Mt�ASN�hSM�=... #O	�      N   �   x�M��
�0E�3_1_P��}����X
vS�fb��i��+i!nϹ׉�{�P)S���h�%B�J��tR\�̎Z�$s�%���Gu�9�+x�<R�l����(asۼ���Dg�1��M��O��~��᧊�NP[	�\B�|���:�      T   ^   x�3�t	�4�2�tu�Ɯީ�y�9�ŉy�&\&�n�E��%@�)X��X��9�RS.�RS.K�Rc.C�Z �E���L�W� �n!m     