--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.24
-- Dumped by pg_dump version 9.6.24

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

SET default_with_oids = false;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: albums; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.albums (
    id bigint NOT NULL,
    release_date date,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text,
    spanish_desc text,
    album_art_path character varying DEFAULT '/images/'::character varying
);


--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: news_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.news_items (
    id bigint NOT NULL,
    item_date date,
    text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    spanish_text text
);


--
-- Name: news_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.news_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: news_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.news_items_id_seq OWNED BY public.news_items.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: songs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.songs (
    id bigint NOT NULL,
    lyrics text,
    title character varying,
    filetype character varying DEFAULT 'mp3'::character varying,
    album_id bigint,
    artist character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    file_path character varying DEFAULT '/songs/'::character varying,
    track_no integer,
    play_count integer DEFAULT 0,
    download_count integer DEFAULT 0
);


--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.songs_id_seq OWNED BY public.songs.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: news_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_items ALTER COLUMN id SET DEFAULT nextval('public.news_items_id_seq'::regclass);


--
-- Name: songs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs ALTER COLUMN id SET DEFAULT nextval('public.songs_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.albums (id, release_date, title, created_at, updated_at, description, spanish_desc, album_art_path) FROM stdin;
2	2019-01-01	Outro	2019-01-06 15:55:38.820452	2020-06-28 19:09:45.198786	Outro was intended to be part of <i>Songs That Don't Belong Together</i>, but I decided it belonged on its own.	Outro was intended to be part of <i>Songs That Don't Belong Together</i>, but I decided it belonged on its own.	/images/outro_cover.jpg
1	2019-01-07	Songs That Don't Belong Together	2019-01-04 15:51:28.071564	2020-08-09 01:09:10.979907	Recorded in 2018.<br><br>\r\nSpecial thanks to my good friend Zhewei Zhang for designing the beautiful cover art! I've also made an orchestral version of "Song for a Friend," which is <a href="https://youtu.be/ndHnGPBY67E">here</a>.	Grabado en 2018.<br><br>\r\nSi no le gusta una canción, la salte. Este tiene al menos tres géneros, y no puedo llamar a dos. <br>Creé una versión orquestal de "Song for a Friend," lo cual puede encontrar <a href="https://youtu.be/ndHnGPBY67E">aquí</a>.	/images/stdbt_cover.jpg
4	2020-08-02	Kindling	2020-08-02 20:01:50.764866	2020-08-09 01:10:17.335748	<i>Kindling</i> was recorded 2019-2020.<br><br>\r\n"Waterbird" is for Lois.	Grabado 2019-2020.<br><br>\r\n"Waterbird" está dedicado a Lois.	/images/kindling_cover.jpg
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.albums_id_seq', 4, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2019-01-03 17:47:35.250128	2019-01-03 17:47:35.250128
\.


--
-- Data for Name: news_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.news_items (id, item_date, text, created_at, updated_at, spanish_text) FROM stdin;
39	2019-03-14	THINC News, a digital news startup focused on technology's impact on humanity, published an <a href="https://thinc.news/the-loneliness-of-facebook/">op-ed</a> of mine about social media with its first batch of stories. I'm proud it's in there with a very thought-provoking bunch.	2019-03-15 01:16:58.871817	2019-04-27 14:15:41.124789	THINC News, un inicial que produce noticias sobre el impacto de la tecnología en la humanidad, publicó un <a href="https://thinc.news/the-loneliness-of-facebook/">artículo de opinión</a> mío sobre las redes sociales, con su primer conjunto de artículos. Todos son muy estimulantes.
1	2018-12-14	I accepted my first “real” job. I’ll continue to make an impact in medicine by working on software for pharmacists at <a href="https://en.wikipedia.org/wiki/McKesson_Corporation">McKesson</a>.	2019-01-03 18:11:51.902049	2019-01-12 15:21:39.585899	He aceptado mi primera oferta de empleo "real." Continuaré a tener un impacto en la medicina mientras trabajo en software para farmacéuticos para <a href="https://es.wikipedia.org/wiki/McKesson_Corporation">McKesson</a>.
36	2018-12-23	I started to redesign and rebuild my website (formerly built with Django and JQuery) with Ruby on Rails and React, with which I had no prior experience. It was an interesting ride that led to what you see today.	2019-01-06 20:20:17.570632	2019-01-12 16:11:12.630003	Empecé a rediseñar y reconstruir este sitio (lo cual escribí en Django y JQuery hace mucho vez) con Ruby on Rails y React, con los que no tenía ninguna experiencia. Era un proceso interesante que llevó a lo que ves hoy.
34	2018-12-16	I graduated from the University of Pittsburgh with a B.S. in computer science. A major and a half and 4.5 years actually didn’t go by quickly at all! From those there when I was born to elementary and high school teachers to professors and mentors, so many people played an integral part in the journey that it's hard to believe. I’m glad to have had a rich educational experience, but I don’t intend to stop learning anytime soon.	2019-01-04 21:35:34.698167	2019-01-15 00:09:32.644416	Me gradué de la Universidad de Pittsburgh con la licenciatura en las Ciencias de la Computación. ¡1.5 especialidades y 4.5 años actualmente no pasaron rápidamente! Pienso de las personas quienes eran allí cuando nací, maestros de mis escuelas primaria y segundaria, profesores de mi universidad, y mentores míos. Tantas personas han ayudado durante esta viaje que no puedo creerlo. Me alegro de que tuviera una experiencia educacional enriquecedora, pero no voy a parar de aprender pronto.
37	2019-02-09	I completed a new <a href="https://www.youtube.com/watch?v=ndHnGPBY67E">arrangement</a> of my song "Song for a Friend" for some very... different instruments.	2019-02-10 04:54:39.010902	2019-02-10 04:54:39.010902	Cumplí un <a href="https://www.youtube.com/watch?v=ndHnGPBY67E">arreglo</a> nuevo de mi cancion "Song for a Friend" con unos instrumentos muy... diferentes.
35	2018-12-31	I published an <a href="https://www.linkedin.com/pulse/lessons-learned-from-tough-job-search-recent-future-grads-puglionesi/">article </a> on the difficulties I encountered on a recent job search, with some ideas about how new graduates might improve their chances.	2019-01-06 20:18:55.657133	2019-01-12 14:21:13.366808	Publiqué un <a href="https://www.linkedin.com/pulse/lessons-learned-from-tough-job-search-recent-future-grads-puglionesi/">artículo</a> sobre los problemas que encontré durante mi búsqueda de empleo reciente. Contiene unas ideas sobre cómo graduados recientes pueden mejorar sus perspectivas de trabajo.
38	2019-02-26	I've simplified an old project I've been using for months and (finally) released it to Android's app store. Check out <a href="https://play.google.com/store/apps/details?id=org.andrewpuglionesi.com.routinetimer">Physical Therapy Timer</a>!	2019-02-27 01:52:10.908692	2019-07-07 12:06:06.578075	He cumplido una aplicación móvil y (finalmente) lo lancé en el Google Play Store. ¡Mira al <a href="https://play.google.com/store/apps/details?id=org.andrewpuglionesi.com.routinetimer&hl=es">Physical Therapy Timer</a>!
42	2019-08-19	My <a href="https://www.publicsource.org/my-preference-for-buses-puzzles-some-people-but-consider-the-benefits-of-ditching-your-car/">PublicSource essay</a> about car ownership calls into question a costly consumer decision that's been accepted as part of American life. But it does so by considering all the benefits that alternative modes of transportation offer the individual.	2019-08-20 02:28:41.346245	2019-08-20 02:28:41.346245	Mi <a href="https://www.publicsource.org/my-preference-for-buses-puzzles-some-people-but-consider-the-benefits-of-ditching-your-car/">ensayo en PublicSource</a> acerca de la propiedad de vehículos cuestiona una decisión del consumidor costosa la que es aceptado en la vida Americana. Pero para hacerlo, considera los beneficios que otros medios de transporte ofrecen al individuo.
43	2020-03-13	My latest <a href="https://stringsofcharacters.wordpress.com/2020/03/13/steps-to-protect-yourself-and-others-from-covid-19/">blog post</a> is about how to protect yourself and others from COVID-19. This is a pandemic and a public health crisis. We all have a part in fighting it, so please catch yourself up if you need to.	2020-03-13 17:11:47.61954	2020-03-13 17:57:49.520236	Mi última <a href="https://stringsofcharacters.wordpress.com/2020/03/13/steps-to-protect-yourself-and-others-from-covid-19/">entrada de blog</a> es sobre cómo puedes proteger a ti y otros contra COVID-19. Es una pandemia y una crisis de salud pública. Todos podemos ayudar a luchar contra el virus, así que infórmate, por favor, si no sabes mucho.
41	2019-06-09	I broke both of my elbows in a bicycle accident. If that ever happens to you, I recommend Buffalo Rose's song <a href="https://www.buffalorosemusic.com/music">"Poison Oak"</a>. And so it doesn't, don't loop a bag over the handlebars of your bike.	2019-07-13 11:55:18.561966	2019-07-20 12:15:14.668727	Me rompí los codos en un accidente de bicicleta. Si un día rompes unos huesos, recomiendo la canción <a href="https://www.buffalorosemusic.com/music">"Poison Oak"</a> por Buffalo Rose. Y no lleva nada por los manubrios de una bicicleta.
40	2019-07-12	I migrated both codebases of this website (and a couple others) from Heroku to the Google Cloud Platform.	2019-07-13 10:37:05.748973	2021-03-14 00:35:56.898239	Migré los dos codebases de este sitio al Google Cloud Platform.
44	2020-06-17	I wrapped up a freelance project for <a href="https://getenergysmarter.org/">CCI</a>, a Pittsburgh-based nonprofit. I combined data analytics, software development, and graphic design to quantify and illustrate the benefits of their home energy efficiency upgrades.	2020-09-02 23:30:43.592196	2021-03-14 00:38:34.288628	Terminé un proyecto para <a href="https://getenergysmarter.org/">CCI</a>, un una organización sin fines de lucro que está ubicada en Pittsburgh. Utilizamos la ciencia de datos, el desarrollo de software, y el diseño gráfico para cuantificar y comunicar los beneficios de sus mejoras de eficiencia energética.
45	2021-07-03	You should probably drop whatever you're doing and play this <a href="https://aop4.github.io/sidescroller/src/index.html">computer game</a> I made with Vue.js.	2021-08-22 12:14:25.280876	2021-08-22 12:17:32.77708	Debes jugar este <a href="https://aop4.github.io/sidescroller/src/index.html">videojuego</a> que creé con Vue.js.
46	2021-08-01	📍Philadelphia — I am immensely grateful that I've had the opportunity to come home.	2021-08-22 12:29:48.757742	2021-08-22 12:33:05.984916	📍Philadelphia — Estoy contentísimo de regresar a mi ciudad natal.
47	2022-06-21	I'm excited to continue making an impact in health tech as a software engineer at Philips!	2022-06-29 00:20:14.780471	2022-06-29 00:21:19.33443	¡Estoy feliz de seguir haciendo un impacto en la tecnología de la salud en Philips!
48	2023-11-18	I ran my first half marathon.	2024-01-14 02:01:27.645	2024-01-14 02:01:27.645	Corrí mi primera media maratón.
\.


--
-- Name: news_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_items_id_seq', 48, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20190102212031
20190102213606
20190102213911
20190103013109
20190104031804
20190104132618
20190104215647
20190105135941
20190106111216
20190210220832
20200628000943
20200628152908
20200628153058
20200628153331
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.songs (id, lyrics, title, filetype, album_id, artist, created_at, updated_at, file_path, track_no, play_count, download_count) FROM stdin;
7		Outro	mp3	2	Andrew Puglionesi	2019-01-06 15:56:08.790266	2022-03-06 23:05:27.0079	/songs/Outro.mp3	1	9	1
1		Blemish	mp3	1	Andrew Puglionesi	2019-01-04 16:23:57.539459	2023-02-28 02:48:41.495771	/songs/Blemish.mp3	1	74	0
2	Love, I’m trying to reach out\r\nI’m trying to grab hold,\r\ntrying; my heart won’t let me in.\r\nIf I didn’t know you, if I hadn’t seen you\r\nthat day I don’t know where I’d be now\r\nwhere I’d be now\r\nBut it wouldn’t be here\r\n\r\nI’ve gotta say something, I want to say nothing\r\nI’m gonna say something--\r\nthat’s why I’m here\r\nI guess it could be your beauty,\r\nor it could be much more\r\ncould be that I need to call you dear someday...\r\n\r\nDear someday,\r\n\r\nI know I haven’t lived you yet,\r\nAnd the sun hasn’t risen in the corner of sky it’ll call its own\r\nAnd though you seem rather distant,\r\nhope I may have the fortune\r\nto call you my own,\r\nsomeday	Dear Someday	mp3	1	Andrew Puglionesi	2019-01-04 16:26:11.0397	2023-02-28 02:51:00.408645	/songs/Dear Someday.mp3	2	80	0
4		The Why Did I Decide to Play Blues at 1 AM Blues	mp3	1	Andrew Puglionesi	2019-01-04 16:31:02.347328	2023-02-28 02:57:48.000576	/songs/The Why Did I Decide to Play Blues at 1 AM Blues.mp3	4	34	0
6		At the Cinema	mp3	1	Andrew Puglionesi	2019-01-04 16:44:30.241009	2023-02-28 03:04:22.377584	/songs/At the Cinema.mp3	6	29	0
15	You keep putting acid in my blood\r\nKeep throwing fuel into the fire\r\nKeep putting pavement on my skin\r\nI'm older than you'll ever know\r\n\r\nKeep drilling holes into my chest\r\nKeep taking everything that's mine\r\nKeep spewing air that I can't breathe\r\nI swear, I swear, I swear I'll be fine\r\n\r\nKeep killing all the things I love\r\nKeep taking every drop I've got\r\nUse my flesh to kill those men\r\nI'll woefully, woefully take them as mine\r\n\r\nKeep all the gases burning bright\r\nKeeping you warm and safe at night\r\nNever mind that I have a fever\r\nAnd you have a duty to me and your kind\r\n\r\n'Cause I know your children hear me\r\nAnd that they know wrong from right\r\nAnd that they won't let you forward\r\nAnd that you won't let them die\r\n\r\nNot by my hand, no\r\nPlease not by my hand	By My Hand	mp3	4	Andrew Puglionesi	2020-08-02 20:06:36.307834	2024-09-23 06:14:32.352635	/songs/By My Hand.mp3	3	15	1
13	She lives in a little old house\r\nDown by the river\r\n\r\nWhere the roots meet the soil\r\nAnd the soil turns to sand\r\nAnd the sand meets the stone\r\nAnd the stone turns to water\r\n\r\nHer name’s carried out by the wind\r\nAnd it glides to the fields\r\nLike a kite set free by a gale\r\n\r\nThe trees hold their breath as she nears\r\nAnd make way for the queen of the\r\nEver-turning world\r\n\r\nOh waterbird\r\nWake me up\r\nLead me home\r\n\r\nOh waterbird\r\nWake me up\r\nLead me home\r\n\r\nOh waterbird\r\nWake me up\r\nLead me home	Waterbird	mp3	4	Andrew Puglionesi	2020-08-02 20:02:59.89546	2024-09-23 06:15:16.405085	/songs/Waterbird.mp3	1	30	2
16	All of a sudden\r\nYou’re a wanderer\r\nI’ll tell you something:\r\nWe have everything we want\r\n—it’s not much\r\n\r\nDeep in the valley\r\nRiver passing by your side\r\nHope is a rainbow\r\nWider than the bleeding sky\r\n\r\nBe never-ending\r\nDeath is nothing, fate and time\r\nThe sun is a message\r\nLighting up how you ask why\r\n\r\nFollow the path between\r\nTomorrow and today\r\nLike it’s some kind of dream\r\nYou know it’s getting late\r\n\r\nRun the grass through your hands\r\nLet it become what you know\r\nBreathe in the purest air\r\nRest for a while\r\n\r\nGo to the mountain’s peak\r\nTo the edge of your world\r\nLook out over existence\r\nYou are everything that’s wild	Wanderer	mp3	4	Andrew Puglionesi	2020-08-02 20:07:53.069869	2024-09-23 05:52:38.572768	/songs/Wanderer.mp3	5	12	1
17	I really want to go north\r\nWhere the snow will be falling\r\nAnd I can find someplace warm\r\nAnd I can find someone\r\n\r\nI really want to go south\r\nA los lugares antiguos\r\nLa selva es fuego\r\n\r\nI really want to go east\r\nTo some place that made me\r\nThey already hate us again\r\nBaruch ata Adonai\r\n\r\nI really want to go west\r\nFind some truth in the mountains\r\nBury the lies in the sand\r\nBury the lie\r\n\r\nI think my compass is broken\r\n'Cause every direction\r\nBrings with it a sign\r\n\r\nAnd home is an omen\r\nAnd home is an omen\r\nAnd home is an omen\r\n\r\nAnd omens are never fi/ne	Compass	mp3	4	Andrew Puglionesi	2020-08-02 20:09:43.387214	2024-09-23 06:11:20.077303	/songs/Compass.mp3	4	10	2
19	Is everything we see written with destiny,\r\nor with the laws that men and women have bled?\r\nMy questions, do you see, are they a part of me,\r\nor are they part, part of some other man?\r\nWhat is the point of this thing we call life we live?\r\nAre we just here, or is it happiness?\r\nBecause that's all that I seem to see,\r\nAll that I want for me, you, and our kin\r\nKin of all kinds, you know,\r\nWalls leave no one alone\r\nWe'll breathe the air until\r\nour time comes\r\nAnd our time will come\r\n\r\nAm I mechanical? Am I an animal?\r\nDoes half of what I know ever leave my head?\r\nDoes the world we perceive reflect reality?\r\nWhy won't you look at me, or was it something I said?\r\nWhy am I tied to you,\r\nWhy's my mind leap to you,\r\nWhy does your absence make me so damn upset?\r\nAnd why do we exist?\r\n\r\nSometimes I think it's we who make the meaning, and\r\nWe're fallible but failure's a misleading word\r\nWe're malleable but sometimes there's no time to mend\r\nBreathe in, breathe out,\r\nI see you're trying to swim\r\nDon't ever give in\r\nWe're in a universe that we cannot begin to comprehend\r\nIs it limitless, or, tell me, does it have some kind of end?\r\nWhat makes me me, and what makes you you?\r\nAnd why can I feel this kind of pain?\r\nAnd why do I have these thoughts I can't explain?\r\nAnd why can I remember the glint in your eyes?\r\nAnd why do we feel like the same people for our entire lives?\r\nAnd why do we have lives?\r\n\r\nWhat do my words mean?\r\nIs language without seams?\r\nIs there a perfect way to learn about our past?\r\nIs this a fleeting time\r\nin a fleeting life\r\nin a universe that lives a million times?\r\nAre my decisions tests?\r\nIs my wonder at best answered by what you'd call a guess?\r\nAnd do you have a guess?	Philosopher's Song	mp3	1	Andrew Puglionesi	2023-02-28 02:48:18.472326	2023-02-28 02:53:30.351132	/songs/Philosopher's Song.mp3	3	1	0
5	You have these warm-weather eyes\r\nand this wishful smile\r\nand a bright, breathy voice\r\nI've owed a song for a while\r\n\r\nYou've a mind like Einstein's\r\nand a wit like Locke's\r\nyou have a laugh like the ocean\r\nwhen I hear it, I'm\r\n\r\nlost at sea, in the waves\r\nthat's me, trying desperately to\r\nfind something I lost so long ago\r\nI found in you\r\n\r\nAnd though I know I tend to make it all\r\nmuch bigger than it is,\r\nI could never let this slip by\r\n\r\nPlease stay, don't go\r\nI want you here, you're part of home\r\nYou're part of home\r\nYou're part of home\r\n\r\nYou say you've looked into a street or two,\r\nlooked over a bridge or two, and thought "what if I jumped in?"\r\nwhen everyday the pain keeps getting worse, no end in sight,\r\nprefer to sleep\r\nwhy wake, why wake, why wake, when waking up means sorrow\r\n\r\nAnd though I can't know what you're going through,\r\nthere's just one thing I ask of you\r\n\r\nPlease stay, don't go\r\nI want you here, you're part of home\r\nPlease stay, don't go\r\nI want you here, you're part of home\r\nYou're part of home\r\nYou're part of home\r\n\r\nYou have these warm-weather eyes\r\nand this wishful smile\r\nand a bright, breathy voice\r\nI've owed a song for a while\r\n\r\nAnd if I didn't know any better\r\nI'd say\r\n(that I love you)\r\n(cause I love you)	Song for a Friend	mp3	1	Andrew Puglionesi	2019-01-04 16:43:51.542872	2023-02-28 03:00:17.086748	/songs/Song for a Friend.mp3	5	42	1
14	I had some strange dreams last night\r\nSo I woke up really fast\r\nAnd wrote them down in a text message\r\nAlmost sent it off to you\r\n\r\nAnd the streets went the same way\r\nBut everything was really green\r\nAnd really damp and really grey\r\nWith all these fields and rolling hills\r\nDo you know a place like that\r\n\r\nBut in your room I couldn't speak\r\nI was so tired I just collapsed on the bed\r\nAnd then I crawled underneath it\r\nAnd all I saw was white\r\n\r\nSo much happened and I thought through\r\nWhat it meant, what it meant, what it meant,\r\nWhat it meant, what it meant\r\nAnd it meant that I would miss you\r\n\r\nSeems that everyone I know just leaves and goes to California\r\nHeard the weather's really nice\r\nAnd heard that everyone is beautiful\r\nAnd no one's ever sad\r\nAnd money's falling from the sky\r\nBut sometimes everything's on fire\r\nI hope that you're never on fire\r\n\r\nThe power went out last night\r\nSo I woke up real slow\r\nAnd felt the light	Dreams (California)	mp3	4	Andrew Puglionesi	2020-08-02 20:05:24.277281	2024-09-23 06:12:42.171693	/songs/Dreams (California).mp3	2	20	1
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.songs_id_seq', 19, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: news_items news_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.news_items
    ADD CONSTRAINT news_items_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_songs_on_album_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_songs_on_album_id ON public.songs USING btree (album_id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: songs fk_rails_f4e40cd655; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT fk_rails_f4e40cd655 FOREIGN KEY (album_id) REFERENCES public.albums(id);

--
-- PostgreSQL database dump complete
--

