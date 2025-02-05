PGDMP                      |            abitmedia-cloud-auth    16.4    16.4 :    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    16398    abitmedia-cloud-auth    DATABASE     �   CREATE DATABASE "abitmedia-cloud-auth" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
 &   DROP DATABASE "abitmedia-cloud-auth";
                postgres    false            5           0    0    DATABASE "abitmedia-cloud-auth"    COMMENT     ^   COMMENT ON DATABASE "abitmedia-cloud-auth" IS 'Base de datos para módulo de autenticación';
                   postgres    false    4916                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            6           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16781    company_users    TABLE     �   CREATE TABLE public.company_users (
    id bigint NOT NULL,
    issue_point_id bigint NOT NULL,
    establishment_id bigint NOT NULL,
    company_id bigint NOT NULL,
    user_id bigint NOT NULL
);
 !   DROP TABLE public.company_users;
       public         heap    postgres    false    4            �            1259    16780    company_users_id_seq    SEQUENCE     }   CREATE SEQUENCE public.company_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.company_users_id_seq;
       public          postgres    false    217    4            7           0    0    company_users_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.company_users_id_seq OWNED BY public.company_users.id;
          public          postgres    false    216            �            1259    16891    permission_roles    TABLE     i   CREATE TABLE public.permission_roles (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);
 $   DROP TABLE public.permission_roles;
       public         heap    postgres    false    4            �            1259    16799    permissions    TABLE     \  CREATE TABLE public.permissions (
    id bigint NOT NULL,
    module_id bigint NOT NULL,
    path character varying(255) NOT NULL,
    method character varying(20) NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);
    DROP TABLE public.permissions;
       public         heap    postgres    false    4            �            1259    16798    permissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    4    219            8           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    218            �            1259    16886 
   role_users    TABLE     ]   CREATE TABLE public.role_users (
    role_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.role_users;
       public         heap    postgres    false    4            �            1259    16816    roles    TABLE     #  CREATE TABLE public.roles (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false    4            �            1259    16815    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    221    4            9           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    220            �            1259    16826    settings_users    TABLE     �   CREATE TABLE public.settings_users (
    id bigint NOT NULL,
    language character varying(10) DEFAULT 'es'::character varying NOT NULL,
    request_limit integer DEFAULT 100 NOT NULL,
    user_id bigint NOT NULL,
    company_id bigint NOT NULL
);
 "   DROP TABLE public.settings_users;
       public         heap    postgres    false    4            �            1259    16825    settings_users_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.settings_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.settings_users_id_seq;
       public          postgres    false    223    4            :           0    0    settings_users_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.settings_users_id_seq OWNED BY public.settings_users.id;
          public          postgres    false    222            �            1259    16837    users    TABLE     "  CREATE TABLE public.users (
    id bigint NOT NULL,
    cognito_id character varying NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    document character varying(20) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(50) NOT NULL,
    address character varying(500) NOT NULL,
    photo text,
    status smallint DEFAULT 1 NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    16836    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    4    225            ;           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    224            �            1259    16564 	   users_seq    SEQUENCE     s   CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.users_seq;
       public          postgres    false    4            m           2604    16784    company_users id    DEFAULT     t   ALTER TABLE ONLY public.company_users ALTER COLUMN id SET DEFAULT nextval('public.company_users_id_seq'::regclass);
 ?   ALTER TABLE public.company_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            n           2604    16802    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            p           2604    16819    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            r           2604    16829    settings_users id    DEFAULT     v   ALTER TABLE ONLY public.settings_users ALTER COLUMN id SET DEFAULT nextval('public.settings_users_id_seq'::regclass);
 @   ALTER TABLE public.settings_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            u           2604    16840    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            $          0    16781    company_users 
   TABLE DATA           b   COPY public.company_users (id, issue_point_id, establishment_id, company_id, user_id) FROM stdin;
    public          postgres    false    217   D       .          0    16891    permission_roles 
   TABLE DATA           B   COPY public.permission_roles (permission_id, role_id) FROM stdin;
    public          postgres    false    227   6D       &          0    16799    permissions 
   TABLE DATA           n   COPY public.permissions (id, module_id, path, method, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    219   fD       -          0    16886 
   role_users 
   TABLE DATA           6   COPY public.role_users (role_id, user_id) FROM stdin;
    public          postgres    false    226   IE       (          0    16816    roles 
   TABLE DATA           a   COPY public.roles (id, company_id, name, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    221   jE       *          0    16826    settings_users 
   TABLE DATA           Z   COPY public.settings_users (id, language, request_limit, user_id, company_id) FROM stdin;
    public          postgres    false    223   \F       ,          0    16837    users 
   TABLE DATA           �   COPY public.users (id, cognito_id, first_name, last_name, document, email, phone, address, photo, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    225   yF       <           0    0    company_users_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.company_users_id_seq', 1, false);
          public          postgres    false    216            =           0    0    permissions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.permissions_id_seq', 8, true);
          public          postgres    false    218            >           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 8, true);
          public          postgres    false    220            ?           0    0    settings_users_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.settings_users_id_seq', 1, false);
          public          postgres    false    222            @           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
          public          postgres    false    224            A           0    0 	   users_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.users_seq', 401, true);
          public          postgres    false    215            x           2606    16788 2   company_users company_users_company_id_user_id_key 
   CONSTRAINT     |   ALTER TABLE ONLY public.company_users
    ADD CONSTRAINT company_users_company_id_user_id_key UNIQUE (company_id, user_id);
 \   ALTER TABLE ONLY public.company_users DROP CONSTRAINT company_users_company_id_user_id_key;
       public            postgres    false    217    217            z           2606    16786     company_users company_users_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.company_users
    ADD CONSTRAINT company_users_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.company_users DROP CONSTRAINT company_users_pkey;
       public            postgres    false    217            �           2606    16895 ;   permission_roles permission_roles_permission_id_role_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.permission_roles
    ADD CONSTRAINT permission_roles_permission_id_role_id_key PRIMARY KEY (permission_id, role_id);
 e   ALTER TABLE ONLY public.permission_roles DROP CONSTRAINT permission_roles_permission_id_role_id_key;
       public            postgres    false    227    227            |           2606    16807 1   permissions permissions_module_id_path_method_key 
   CONSTRAINT        ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_module_id_path_method_key UNIQUE (module_id, path, method);
 [   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_module_id_path_method_key;
       public            postgres    false    219    219    219            ~           2606    16805    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    219            �           2606    16890    role_users role_users_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.role_users
    ADD CONSTRAINT role_users_pkey PRIMARY KEY (role_id, user_id);
 D   ALTER TABLE ONLY public.role_users DROP CONSTRAINT role_users_pkey;
       public            postgres    false    226    226            �           2606    16824    roles roles_name_company_id_key 
   CONSTRAINT     f   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_company_id_key UNIQUE (name, company_id);
 I   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_name_company_id_key;
       public            postgres    false    221    221            �           2606    16822    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    221            �           2606    16833 "   settings_users settings_users_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.settings_users
    ADD CONSTRAINT settings_users_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.settings_users DROP CONSTRAINT settings_users_pkey;
       public            postgres    false    223            �           2606    16835 )   settings_users settings_users_user_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.settings_users
    ADD CONSTRAINT settings_users_user_id_key UNIQUE (user_id);
 S   ALTER TABLE ONLY public.settings_users DROP CONSTRAINT settings_users_user_id_key;
       public            postgres    false    223            �           2606    16847    users users_cognito_id_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cognito_id_key UNIQUE (cognito_id);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_cognito_id_key;
       public            postgres    false    225            �           2606    16849    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    225            �           2606    16845    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    225            �           2606    16850 (   company_users company_users_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.company_users
    ADD CONSTRAINT company_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 R   ALTER TABLE ONLY public.company_users DROP CONSTRAINT company_users_user_id_fkey;
       public          postgres    false    225    4748    217            �           2606    16875 *   settings_users settings_users_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.settings_users
    ADD CONSTRAINT settings_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 T   ALTER TABLE ONLY public.settings_users DROP CONSTRAINT settings_users_user_id_fkey;
       public          postgres    false    223    4748    225            $      x������ � �      .       x�3�4�2�4b.#N#.c 6�=... 5��      &   �   x�u��n1Ek�+������Q�$)i��R�](���D6,�+�̽6
���c�x�|����eE�59
Ԋ�S�v��L19!p͖�S��L4�|���v]��@�yɏ:RGd��������I��>���8�.��_5cg�b�e~�nߢ��,�ĉ �y��"�i�$�R��־%��_��n8��۳<��Հ�ʂY��D/?��[�1�]�a�      -      x�3������� �'      (   �   x����J�P��u�U�r���3;i�QW��E
6�K��)U�$�]��>l�y��~?�������QnL�$EV`,�?u����}8�~[��j$�+C���Z�n��~,���j�Q@0���h )f��VM���נ~�f�8���!��k-��@y�E�v�k|�fw���dg5*�%*� �!M~D��{r��i}�r�n�7K i�L3�.U V��:���B���h�      *      x������ � �      ,   2  x���;n�0Ek�*��Px?�T)�ư� �ܐiK����)U����r���E���s�tI
1%c"h @�@��Y'q��>�s��yR��M��
-�w`����������U�m?_)�Y#L��ƛY]�)P$�&� t RkY�Q�=�`ZӋ��(Ɯ�h^ߩ��6�#]�a���ᘕX�u>�Ã����#1�����c�mZ������PV�`u������r��$/S��Y��^�C �P�}�o���|��Y�9����4�j��e��46'�y�S?F��N\�u�R���ߪ����_���S�\�OCo��s��7>�|Q��Zo���ip�U�lh�aH^�Ȣ��l��� �-�/�N�C�z�y+p�V�+�I�ÏzZ�1E�ؒ\���i<,qC/*��Rw0�����?��>�ޜgj���8��ߦ�y�̗K����G��A��ZS{4Ӊ�^��H�W)P%4�ʩC�`W'v�)=Xȑ�$�SN^Ծ��S\G�e[�����z�T/�;4�h����:	-�1ϦX�e��v�n����`�     