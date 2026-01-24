--
-- PostgreSQL database dump
--

\restrict dCkc4VlCxACfklKigQw2ReJ97pnMb4VwgHcDFu8bVfYarrFkS48iaITMkOyyhvs

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.11

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- Name: blog_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blog_categories (
    id bigint NOT NULL,
    name character varying,
    sort_priority integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: blog_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blog_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blog_categories_id_seq OWNED BY public.blog_categories.id;


--
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blog_posts (
    id bigint NOT NULL,
    title character varying,
    body_markdown text,
    header_image_url character varying,
    pinned boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    blog_category_id bigint NOT NULL,
    path character varying NOT NULL,
    is_draft boolean DEFAULT false
);


--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blog_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blog_posts_id_seq OWNED BY public.blog_posts.id;


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
-- Name: blog_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_categories ALTER COLUMN id SET DEFAULT nextval('public.blog_categories_id_seq'::regclass);


--
-- Name: blog_posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_posts ALTER COLUMN id SET DEFAULT nextval('public.blog_posts_id_seq'::regclass);


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
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.albums (id, release_date, title, created_at, updated_at, description, spanish_desc, album_art_path) FROM stdin;
2	2019-01-01	Outro	2019-01-06 15:55:38.820452	2020-06-28 19:09:45.198786	Outro was intended to be part of <i>Songs That Don't Belong Together</i>, but I decided it belonged on its own.	Outro was intended to be part of <i>Songs That Don't Belong Together</i>, but I decided it belonged on its own.	/images/outro_cover.jpg
1	2019-01-07	Songs That Don't Belong Together	2019-01-04 15:51:28.071564	2020-08-09 01:09:10.979907	Recorded in 2018.<br><br>\r\nSpecial thanks to my good friend Zhewei Zhang for designing the beautiful cover art! I've also made an orchestral version of "Song for a Friend," which is <a href="https://youtu.be/ndHnGPBY67E">here</a>.	Grabado en 2018.<br><br>\r\nSi no le gusta una canción, la salte. Este tiene al menos tres géneros, y no puedo llamar a dos. <br>Creé una versión orquestal de "Song for a Friend," lo cual puede encontrar <a href="https://youtu.be/ndHnGPBY67E">aquí</a>.	/images/stdbt_cover.jpg
4	2020-08-02	Kindling	2020-08-02 20:01:50.764866	2020-08-09 01:10:17.335748	<i>Kindling</i> was recorded 2019-2020.<br><br>\r\n"Waterbird" is for Lois.	Grabado 2019-2020.<br><br>\r\n"Waterbird" está dedicado a Lois.	/images/kindling_cover.jpg
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2019-01-03 17:47:35.250128	2019-01-03 17:47:35.250128
\.


--
-- Data for Name: blog_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blog_categories (id, name, sort_priority, created_at, updated_at) FROM stdin;
1	Tech	0	2025-05-03 20:31:28.296691	2025-05-03 20:31:28.296691
2	Other	1	2025-05-03 20:31:38.386337	2025-05-03 20:31:38.386337
\.


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.blog_posts (id, title, body_markdown, header_image_url, pinned, created_at, updated_at, blog_category_id, path, is_draft) FROM stdin;
1	(Practical) Software Engineering Philosophy	These are some guiding principles that I've found helpful throughout my career.\r\n\r\n## What you're building is just as important as how you build it.\r\n\r\nSoftware plays a real role in the real world. When organizations prioritize delivery speed, profit, or convenience over the well-being of users, there are real consequences. Planes crash. A patient gets the wrong medication. Privacy is violated.\r\n\r\nGiven our interest in technical design and implementation, it's easy for engineers to keep our heads down and do what we're told. But what if we're told to do something we see as questionable or unethical? What if we notice a flaw that could bring down production?\r\n\r\nAs those closest to the codebase, we have the clearest insight into our systems, and we know things no one else knows. With your unique perspective and knowledge, you may be the only person who recognizes a problem. Engineers aren't solely responsible for organizational failures, but we have a duty to speak up when we see them coming.\r\n\r\n## Unit tests are foundational to reliable software.\r\n\r\nDuring interviews, I've often asked candidates why unit tests are important. They usually say that a unit test suite can be executed much faster than a manual test suite. That's true, but it just scratches the surface. To fully benefit from unit testing, we need to understand everything it offers.\r\n\r\nUnit tests vet code in a way no manual test can. They examine the smallest testable components of the system. If your code were a bicycle, this would be like separately testing every part of the bicycle. The spokes, the chain, the handbrakes, the shocks. Once we've tested all these individual components, we can have much more confidence in the bicycle as a whole.\r\n\r\nAnd what if we never tested them? What if the handbrake designer never tried squeezing the brake and the chain was never spun on a chainring? The parts might come off the assembly line with imperceptible defects, and I certainly wouldn't want to touch that bike. Unit tests ensure the stability of the system by testing it deeply.\r\n\r\nOther benefits of unit testing are that it encourages you to dream up all the edge cases your code might encounter and to design your code in such a way that future programmers can easily use it. And of course, if someone refactors a function in the future, unit tests serve as a quality gate.\r\n\r\n## Don't encourage best practices—enforce them.\r\n\r\nThe only way to guarantee that best practices are followed is to make them mandatory.\r\n\r\nNo matter how nicely you ask a group of programmers to deliver code with 80% test coverage, people will underdeliver if all you've done is ask. Humans make mistakes.\r\n\r\nWhat will guarantee 80% coverage is setting up an automated check in your build pipeline that keeps non-compliant code from being merged. Similarly, linters can enforce style guidelines, and version control platforms can mandate code review. Many of the tools we use can be configured to raise the standard of quality.\r\n\r\nOnce these guide rails are in place, they humble just about everyone and catch mistakes from the best of the best.\r\n\r\n## Half of your job is staying calm.\r\n\r\nBeginner programmers are often frustrated by the craft. This is natural: when we transition from using software to writing it, we're suddenly faced with unintuitive tools that can't tolerate ambiguity and give us cryptic feedback.\r\n\r\nFrom the beginning, emotional regulation is one of a programmer's most important skills. When your mental bandwidth is consumed by panic or anger, it's difficult to find the source of your mistakes.\r\n\r\nAs we gain experience, we get better at dealing with ambiguous error messages and counterintuitive results. We learn to stay calm and seek the root of the problem. Underlying our success is the ability to keep it together, to let curiosity rather than frustration guide us.\r\n\r\n## Functions should have a single identifiable purpose.\r\n\r\nWe've all groaned at 500-line functions in legacy code, and with good reason: the more work a function handles, the harder it is to modify and test. Sometimes monster functions are the result of generations of programmers who felt rushed and added their code in the most convenient place to meet a deadline. Sometimes the legacy code was just poorly designed to begin with.\r\n\r\nOne way to make sure your functions are concise—and that they stay concise—is to ensure they do just one thing. retrieveInventoryItems() should retrieve some items from an inventory, for example. But it shouldn't also send an email, update those items in a database, and store the speed of light in a global variable.\r\n\r\nTo orchestrate a series of related tasks, one "root-level" function can call multiple lower level functions that each have a single clear purpose. Here's a simple example:\r\n\r\n```\r\npublic void processSale(OrderData order) {\r\n    this.validateOrder(order);\r\n    this.inventoryService.removeFromInventory(order.getItems());\r\n    this.warehouseService.initiateOrderShipping(order);\r\n    this.notificationService.sendOrderConfirmation(order);\r\n}\r\n```\r\n\r\nBecause it calls on more specialized functions to do the heavy lifting, we can get a high-level understanding of the processSale() function with one quick glance. If processSale() did everything by itself, it might be a 2,000-line giant.\r\n\r\nOf course, classes, packages, and projects should have a clearly identifiable purpose as well. But because functions are our most fundamental building blocks, poorly structured functions tend to be especially troublesome. Once we let them grow into monsters, taming them becomes a formidable task.\r\n\r\n## Write code for people.\r\n\r\nWhen you can think of multiple ways to accomplish a task, favor the implementation that will be easiest for programmers to understand and work with in the future.\r\n\r\nProgrammers are all authors. We're writing code for two audiences at once: computer processors and other people. There are practically infinite ways to write code that functions correctly, but most of them aren't readable, performant, or reasonable. That's why programming is hard.\r\n\r\nReadability can be addressed as you write code and re-read it. How long would it take a newcomer to grasp what it does? Did you choose good variable names? Is there anything that should be clarified with a comment? Does what you've written truly "click"?\r\n\r\nEven when the code seems crystal clear in an IDE, it's helpful to review your own pull requests before you add reviewers. You may save yourself some embarassment by catching silly mistakes, but more importantly it puts you in the shoes of your human audience. You're writing code for people—including all the present and future colleagues who will have to understand and work with it.\r\n\r\n## Reduce, reuse, refactor.\r\n\r\nLook for opportunities to reuse code so that you and your colleagues don't keep reinventing the wheel.\r\n\r\nPerhaps you're working with a monolith, and you notice that the same 30-line permission check is duplicated six times. Instead of copying it yet again, you could abstract it into a class dealing with permissions.\r\n\r\nIn a distributed environment where there's crosstalk between microservices, it may be helpful to write a client library for a given service, rather than writing separate clients in each dependent application.\r\n\r\nAnd of course, when creating a UI, you can build modular components with an eye toward reusing them in different contexts.\r\n\r\nThis idea is nothing new: as the mantra goes, "don't repeat yourself." The hard part is taking a step back and realizing that several teams, projects, or modules are all doing the same thing. But staying one step ahead of duplication saves time, streamlines maintenance, and reduces complexity.\r\n\r\n## If a requirement doesn't make sense, then work to change it.\r\n\r\nIf you think a requirement is ill-advised or illogical, bring it up with your team.\r\n\r\nThe alternative is to write code that won't serve users well. Code that hinders the success of the software. Code that you or someone else will have to rewrite later.\r\n\r\nMaybe you're wrong and the requirements are just fine. You might as well make sure.\r\n\r\n## Languages and frameworks are frequently interchangeable.\r\n\r\nBlasphemy, I know. We need speed, type safety, and elegant object-oriented language features to build systems that scale! But consider this: Instagram was built with Python, which meets none of those criteria. And Instagram is pretty big.\r\n\r\nMost modern programming languages support the same basic constructs and have similar syntax. In special cases, it might be easier to do things in a certain language (R is good for data science and statistics, or so I hear). But most languages and competing frameworks are more similar than different.\r\n\r\nConsider the following three sets of tools:\r\n\r\n- { React, Angular, Vue, JQuery }\r\n- { Spring Boot, Ruby on Rails, Django, Node }\r\n- { C#, Java, JavaScript, Python }\r\n\r\nThe members within each set are capable of doing pretty much the same things. You can still build a fully functioning website with JQuery today. You could rewrite a Spring Boot service with Rails, completely preserving its behavior along the way. That's because they're just tools designed to solve the same basic problems.\r\n\r\nI am not advocating for clinging to outdated technologies forever, nor am I denying that new tools can be revolutionary for developers' productivity.\r\n\r\nBut I think we put too much emphasis on our choice of tools and frameworks. Recruiters and hiring managers seek out candidates who have experience with every tool in their tech stack. They have a tendency to label people as "Java" or "iOS" developers and keep them on a narrow path. For our part, developers also tend to stick with what we know.\r\n\r\nBut every developer is capable of learning a new language or framework by building off of past experience with similar tools. If they have a firm understanding of their domain (say, RESTful microservices), then learning new tools is largely a matter of learning new syntax. A strong foundation is what makes you capable. There's no need to fear a new tech stack.\r\n\r\n## Software is always a work in progress.\r\n\r\nIf software is good, someone somewhere will ask you to make it better. Sometimes it happens in the middle of the development process, and sometimes it happens after a release. In a truly agile process, we give the customer time and space to provide feedback, we listen, and we iterate on our design and implementation to meet their needs.\r\n\r\nAt least, that's how it should be. Reality doesn't always live up to those ideals. I once had to sunset a successful project because I didn't make environment setup easy enough or document it well enough. After weeks of trying to rekindle my local development environment on a new computer, sifting through version incompatibilities and mind-boggling [dependency hell](https://en.wikipedia.org/wiki/Dependency_hell), I realized I couldn't maintain the project without rewriting it. People asked me for new functionality, but I couldn't deliver.\r\n\r\nDon't let that happen! Make sure environment setup is easy and well-documented. Even if you're the only maintainer of a project, pretend that you have to make it approachable to complete newcomers, because you'll forget key details yourself. Make sure that builds and deployments are automated, reproducible, and effortlessly easy to run. And handle technical debt *before* it becomes an emergency.\r\n\r\nThe job of keeping customers satisfied doesn't end with business analysts or UX designers. It depends on every part of the software development lifecycle, and it requires an eye toward long-term sustainability.	\N	t	2025-05-03 20:33:24.768854	2025-05-03 21:32:30.827576	1	practical-software-engineering-philosophy	f
4	In Praise of Desktop Computers	When I was a wee lad, I spent many an hour booting up a clunky beige desktop computer, launching *The Oregon Trail*, and delighting as pixels danced across a hulking CRT monitor. As computing became more ingrained in everyday life throughout the early 2000's, I jostled siblings and parents for access to a single desktop computer where everyone logged into a shared account for convenience. Similar scenes played out in homes across the country.\r\n\r\nAt the behest of me and my brother, our family eventually got a laptop to supplement the desktop, and I had my own laptop as a teenager. For well over a decade after that, I didn't even consider buying a desktop. They're heavy, they're bulky, and they reminded me of dial-up internet connections.\r\n\r\nI wasn't alone. Laptops have gained the lion's share of the PC market, and it's not hard to imagine why: the portability of a laptop is ideal for school, work, and short- or long-distance travel. But what if you *don't* need portability?\r\n\r\nIn that case, desktops are better in just about every way.\r\n\r\n## Desktops are easier to repair\r\n\r\nDesktop computers are generally easier and cheaper to repair than laptops.\r\n\r\nIn a laptop, the processor, graphics card, RAM and motherboard are often soldered together and packaged as a single unit. That means that when one of these components fails, you may have to replace all of them. That's why, when the USB-C charging ports on my last laptop wore out, the manufacturer wanted to charge me over $700 for a repair.\r\n\r\nWhen faced with such high repair costs, one might be tempted to throw out their broken laptop and buy a new one. But how much would that cost? And how long would the new laptop last before one of its parts failed?\r\n\r\nDesktop computers have a much more modular design, making repairs cheaper. Pretty much all of their parts can be individually removed and swapped for something else. The processor, graphics card, motherboard, fans, power supply, RAM, and even the *case* can be replaced. If you're up to the challenge, you can save money by buying replacement parts and making repairs yourself.\r\n\r\nRepairability is nice, but most of us don't want our computers to break in the first place. Desktops also win in that department, since they tend to be more durable than laptops and require fewer repairs. Just think about it: laptops are constantly being carried around, spilled on, and dropped. In contrast, it's pretty hard to rough up a heavy, sturdy desktop that sits in one place and stays there. Another reason laptops tend to die faster is that they have less robust cooling mechanisms, and the resulting high temperatures take a toll on system components.\r\n\r\n## Desktops are easier to upgrade\r\n\r\nThe modular design that makes desktops easy to repair also makes hardware upgrades easier. If you ever need to do more graphics-intensive tasks like video editing or gaming, you can always add or replace a dedicated GPU. If you need more storage space or RAM, they can be added in a snap thanks to desktop motherboards' abundant SSD and RAM slots.\r\n\r\nWhereas modern laptops often restrict you to upgrading the storage drive, every single component of a desktop can be independently upgraded. As technology advances and demands on computers change, a desktop computer can evolve to meet the occasion.\r\n\r\n## Desktops give you more bang for your buck\r\n\r\nWhen considering the cost of a desktop computer, it's important to factor in the cost of peripheral devices. If you don't already have them, you'll need a monitor, keyboard, and mouse, plus a permanent desk to hold them all.\r\n\r\nBecause those peripherals vary in price, it's hard to guarantee that a full desktop setup will always be cheaper than a laptop. But in general, desktops give you more bang for your buck. They tend to integrate more powerful components and more effective cooling mechanisms thanks to the plentiful real estate of a desktop tower. Thus they generally perform better than similarly priced laptops, which are optimized for compactness and light weight.\r\n\r\nAs any PC gamer will tell you, you can save a lot by buying parts and building a desktop computer yourself. Having done this, I can't recommend it to everyone. But if you have the curiosity and time, it can be a rewarding and educational experience. Plus, if you managed to build a PC from scratch, surely you can replace a failing part when that day comes.\r\n\r\nThinking beyond the up-front costs, desktops also offer the potential for long-term savings. Since they're more durable than laptops and easier and cheaper to repair, choosing a desktop computer could save you money for years to come.\r\n\r\n## Desktops have more I/O ports\r\n\r\nIn the race to build thinner and lighter systems, many laptop manufacturers have nixed disc drives, ethernet ports, USB-A ports, headphone jacks, and HDMI ports. Consumers didn't ask to have these features removed, and many didn't like it.\r\n\r\nDesktops, in contrast, have every kind of port your heart desires, and they have a *lot* of them. Even CD/DVD drives can still be integrated into desktop towers.\r\n\r\nA desktop's stationary nature also makes connecting peripheral devices less of a hassle. You could easily plug 10 devices into a desktop's USB ports and leave them there for a year. Compared to the constant juggling between two working USB-A ports and two failing USB-C ports on my old laptop, that's pretty darn convenient.\r\n\r\n## Desktops all but force you to use an ergonomic workspace\r\n\r\nIt's easy to fall into the habit of sitting on the couch and slouching over a laptop (or phone, for that matter). But [that's not good for you](https://www.wired.com/story/ergonomic-experts-convinced-me-ive-been-using-laptops-all-wrong/) and can cause a bunch of musculoskeletal ailments.\r\n\r\nAnother nice thing about a desktop computer is that it pretty much forces you to set up a traditional workspace, complete with a proper desk and chair. If you adjust all your equipment [to meet your body's needs](https://ors.od.nih.gov/sr/dohs/Documents/checklist-ergonomics-computer-workstation-self-assessment.pdf), then you're kind of locked into using an ergonomic workspace. There is no escape!!!\r\n\r\n## You can't take a desktop everywhere you go\r\n\r\nPerhaps a desktop's greatest weakness is also a strength. You can't take it with you wherever you go. You can't work when you're supposed to be on vacation. You can't devote half of your attention to it while you're trying to spend time with people you care about. And maybe, just maybe, using a less portable device will make it easier to walk outside and touch grass. Even if it doesn't, you could always touch the grass in *The Oregon Trail*.	\N	f	2025-11-09 13:44:54.073194	2025-11-09 21:12:01.095673	1	in-praise-of-desktop-computers	f
2	Why You Should Buy Music	Music streaming services are incredible resources. With just about every major music release at your fingertips for little to no cost, listening to music has never been as convenient as it is today. But even in this age of streaming, there are still plenty of good reasons to buy and own your favorite tunes.\r\n\r\n## Convenience isn't everything\r\n\r\nStreaming platforms are a great way to discover new artists because you can check out their work without committing much time or money. But in my experience, the ability to listen to anything at any time can be distracting. It's difficult to sit through an entire album when every song ever made (not to mention every mobile app ever made) is at your fingertips.\r\n\r\nWhen artists and producers create an album together, they craft a cohesive set of songs with common themes, textures, and stories. It's worth taking the time to listen to albums the way they're intended to be heard—from start to finish. That comes more naturally when you play a record or CD, because you have to put in more effort to stop the music once it starts. And when you’ve paid for an album, you're likely to value it more, listen to it more often, and listen to it in its entirety. After all, you’ll want to get your money's worth.\r\n\r\n## A purchase lasts forever\r\n\r\nDid you know that songs and albums can disappear from streaming services overnight? It's happened to at least one track I'm particularly fond of: "Steamroller" by Phoebe Bridgers. While it's not clear to me why it was removed from streaming services, many artists have pulled their music intentionally, for example as an [act of protest](https://www.pastemagazine.com/music/spotify/musicians-who-have-left-spotify) against a streaming service.\r\n\r\nIf you own a physical copy or digital download of a favorite album, you'll always be able to listen to it. Even if the streaming landscape changes dramatically or your favorite artists boycott streaming platforms, no one can take away files and physical media that you own.\r\n\r\n## For audiophiles\r\n\r\nWhen you stream music with a smartphone, you're probably not getting the best listening experience possible—especially if you have great hearing and a picky ear.\r\n\r\nBy default, most streaming services will compress audio before delivering it to your device. This reduces how much data is sent to your phone, which is usually a good thing for both the listener and the streaming service. But the audio is compressed with a "lossy" algorithm, meaning that it sounds different from uncompressed audio. Compared to a CD or high quality digital download, lossy audio sounds less crisp and clear.\r\n\r\nHistorically, audio quality has been an area where streaming couldn't compete with a traditional listening experience. Streaming services have begun to change that by offering "lossless" audio in recent years, but you probably have to adjust your settings to benefit from it. Lossless audio is compressed in such a way that human ears can't tell the difference between the compressed and uncompressed versions.\r\n\r\nUnfortunately, streaming lossless audio without a WiFi connection will eat up a lot of cellular data. Streaming apps may allow you to download lossless files over WiFi, but those will take up a ton of storage space on your phone. In any case, many audiophiles gravitate toward digital audio players or stereo systems for offline music listening since the average smartphone isn't optimized to deliver pristine audio.\r\n\r\n## Environmental impact\r\n\r\nLet me be clear: if you're trying to minimize your environmental impact, listening to music should not be at the top of your priority list. But when we consider trends like streaming and the vinyl resurgence on a global scale, they have implications worth considering.\r\n\r\nPlastic records, CDs, and cassette tapes aren't great for the environment. They take ages to biodegrade and leave ecologically disruptive microplastics in their wake. But you know what? Streaming isn't all that great either.\r\n\r\nWhen you stream a song, you're downloading it from a server in a data center. Data centers require a lot of electricity and water to keep servers running and to keep them from overheating. And the more people stream their media, the greater the demand on data centers.\r\n\r\nSo what are the lowest impact ways to consume music? I think this is where digital downloads shine. When you download a song using a service like iTunes, you only download it once. Compare this to a streaming service, where listening to the same song 30 times may be equivalent to downloading it your device over and over again, each time increasing the environmental impact. Services like Bandcamp, 7digital, and Qobuz allow you to download high-resolution, lossless audio without putting additional stress on data centers each time you press play.\r\n\r\nIf you head to a local record store, thrift store, or used book store, chances are you'll find used CDs, records, or cassette tapes. Buying used physical media is a great way to minimize your environmental impact, keep plastic out of landfills, and support a local business. There's just one downside: buying used media doesn't do anything to support the people behind the music.\r\n\r\n## Artist compensation\r\n\r\nI hope you already know that an artist [makes very little](https://www.businessinsider.com/guides/streaming/how-much-does-spotify-pay-per-stream) when you stream one of their songs. We're talking a fraction of a penny. When using Spotify, for example, you'd have to play a song over 200 times before the artist earns a single dollar.\r\n\r\nThe most popular artists do make good money from streaming, of course, but only by accruing billions of streams from a massive worldwide fanbase. Obviously, not every artist can achieve that kind of popularity.\r\n\r\nBuying a record isn't necessarily the best way to support an artist, either. Attending concerts and buying merch like T-shirts while you're there may be better because it cuts out middlemen, logistics, and shipping fees—so more of your money goes to the artist.\r\n\r\nStill, compared to streaming, buying music does a lot more to [support artists financially](https://pitchfork.com/thepitch/how-much-more-money-artists-earn-from-bandcamp-compared-to-spotify-apple-music-youtube/), and that can make an especially big difference for smaller, independent artists.\r\n\r\n## In conclusion\r\n\r\nThere's no perfect way to listen to music. But if you want to support your favorite artists, unplug from your smartphone, or appreciate your favorite songs for a lifetime, you should make like it's 1999 and just pay for it.	\N	f	2025-05-03 20:34:33.520634	2025-05-05 03:19:45.707914	2	why-you-should-buy-music	f
3	6 Profound Contemporary Classical Pieces	Bach? Blech. Like many of us in the 21st century, I have trouble connecting with traditional classical music. But guess what? People didn't stop writing classical music centuries ago. And thanks to some brave pioneers, contemporary composers are free from many of the constraints of the past.\r\n\r\nThese are some of my favorite contemporary classical pieces. Channeling the sounds of old into pure emotion, they're inspiring, captivating, moving, and profound.\r\n\r\n## Thomas Adès — *O Albion*  \r\n<div style="border: 1px solid #eee; border-radius: 5px; padding: 0em 1em">\r\nRecommended recording: Australian Chamber Orchestra, conducted by Richard Tognetti for the *River* soundtrack\r\n\r\nListen: [Spotify](https://open.spotify.com/track/1HuUYLNE2Ymu7bD9XVxgM5) | [Apple Music](https://music.apple.com/us/song/o-albion-version-for-string-orchestra/1580676686) | [YouTube](https://youtu.be/kPwH-_7FDiA)\r\n</div>\r\n*O Albion* is the 6th movement of *Arcadiana*, an avant-garde piece for string quartet. The most traditional movement in the piece, *O Albion* is gentle but slightly dissonant, masterfully creating and resolving tension throughout. What I love about this piece is that there's no showing off, no virtuosity on display. It strikes a reverent tone and stays true to it.\r\n\r\n## Max Richter — *On the Nature of Daylight*\r\n<div style="border: 1px solid #eee; border-radius: 5px; padding: 1em">\r\nListen: [Spotify](https://open.spotify.com/track/56oReVXIfUO9xkX7pHmEU0) | [Apple Music](https://music.apple.com/us/song/on-the-nature-of-daylight/1368090483) | [YouTube](https://youtu.be/tUMc_-Bcunk)\r\n</div>\r\n*On the Nature of Daylight* is in no hurry. Two cellos and a viola build tension with slow, rich, melancholic chords for about two minutes before the melody is introduced. But the longer you listen, the more intensely emotional this piece becomes. It's simple, but its simplicity is what makes it beautiful.\r\n\r\nMax Richter's work ranges from synth-infused studio albums to movie soundtracks, a reimagining of Vivaldi's *Four Seasons*, and an eight-hour composition specifically designed to help people sleep. But *On the Nature of Daylight* is one of Richter's most successful pieces, and for good reason.\r\n\r\n## Anna Clyne — *DANCE: I. when you're broken open*\r\n<div style="border: 1px solid #eee; border-radius: 5px; padding: 0em 1em">\r\nRecommended recording: Inbal Segev with the London Philharmonic Orchestra\r\n\r\nListen: [Spotify](https://open.spotify.com/track/3Y0EbmwdJNP7dgVqSD8vRW) | [Apple Music](https://music.apple.com/us/song/dance-i-when-youre-broken-up/1509718500) | [YouTube](https://youtu.be/lJhbE_YPb3U)\r\n</div>\r\nJust listen to this. Clyne and cellist Inbal Segev push the cello to the limits of its range and expressive capacity, making for a positively touching tune.\r\n\r\nA cello concerto, *DANCE* consists of five movements. I can't recommend this first movement enough, but it's worth experiencing the rest. The concerto feels like a journey through time and space because Clyne drew inspiration from a range of traditional and contemporary influences.\r\n\r\n## Steve Reich — *Duet*\r\n<div style="border: 1px solid #eee; border-radius: 5px; padding: 0em 1em">\r\nRecommended recording: Mari Samuelsen, from her album *LIFE*\r\n\r\nListen: [Spotify](https://open.spotify.com/track/25FLQon7K93SECDUycUKsS) | [Apple Music](https://music.apple.com/us/song/duet/1746107420) | [YouTube](https://youtu.be/ehSnj_w91lA)\r\n</div>\r\nThe concept behind *Duet* is simple: two violins play similar melodies with slightly different timing, echoing and trailing each other in a vivacious game of call and response. It conveys a transcendent joy that just can't be communicated any other way.\r\n\r\n## Arvo Pärt — *Cantus in Memoriam Benjamin Britten*\r\n<div style="border: 1px solid #eee; border-radius: 5px; padding: 0em 1em">\r\nRecommended recording: Munich Radio Orchestra, conducted by Ulf Schirmer\r\n\r\nListen: [Spotify](https://open.spotify.com/track/5ugD2GLKGK9FHNQ1JRP1m3) | [Apple Music](https://music.apple.com/us/song/cantus-in-memoriam-benjamin-britten-live/1222984051) | [YouTube](https://youtu.be/Jtj-8Pui4P8)\r\n</div>\r\nThis piece may not have lyrics, but its meaning is unmistakable: grim, dramatic, and leaden with lament, it couldn't be anything but an elegy. After learning of fellow composer Benjamin Britten's passing, Arvo Pärt dedicated this piece to Britten.\r\n\r\nThe string section produces a foreboding and mysterious wall of sound through an interesting trick with timing. This piece is a *prolation canon*, meaning the same melody is played simultaneously at different speeds. Some instruments rush ahead of the others, with the echoes of their past trailing behind in slow motion. (Pärt used the same technique to a haunting effect in his piece *Festina Lente*.) A bell tolls throughout this elegy and sounds its final solemn note, evoking a traditional funeral bell.\r\n\r\nAn Estonian composer and devout Christian, Pärt was censured by the Soviet Union for writing music that aligned with his religious beliefs. After taking a long and dispirited hiatus, he recovered from that setback and created a huge body of instrumental and choral work inspired by medieval music and his own inventive compositional techniques.\r\n\r\n## Philip Glass — *I'm Going to Make a Cake* (for solo piano)\r\n<div style="border: 1px solid #eee; border-radius: 5px; padding: 0em 1em">\r\nRecommended recording: Nicolas Horvath on the album *Glassworlds, Vol. 4*\r\n\r\nListen: [Spotify](https://open.spotify.com/track/1qOK37KJ7kIJdDVZKvlm5y) | [Apple Music](https://music.apple.com/us/song/im-going-to-make-a-cake-from-the-hours/1118000449) | [YouTube](https://youtu.be/aRaSxyIfOeo)\r\n</div>\r\nThis piece's adherence to strict patterns and its lightning-fast arpeggios are quintessentially Philip Glass. A stripped down solo arrangement suits it well, and pianist Nicolas Horvath gives an organic and powerful performance.\r\n\r\nPhilip Glass's uniquely minimalist and pattern-driven compositions broke the mold of everything that came before them. He and his ensemble had to endure a lot of criticism before he would become a household name, but in doing so they paved the way for a future where composers could express themselves freely and create groundbreaking neoclassical music. Glass is a pioneer.	\N	f	2025-05-17 13:51:35.914444	2025-05-18 19:06:44.937892	2	profound-contemporary-classical-pieces	f
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
20250407012731
20250420101644
20250420102457
20250420200255
20250427032213
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.songs (id, lyrics, title, filetype, album_id, artist, created_at, updated_at, file_path, track_no, play_count, download_count) FROM stdin;
2	Love, I’m trying to reach out\r\nI’m trying to grab hold,\r\ntrying; my heart won’t let me in.\r\nIf I didn’t know you, if I hadn’t seen you\r\nthat day I don’t know where I’d be now\r\nwhere I’d be now\r\nBut it wouldn’t be here\r\n\r\nI’ve gotta say something, I want to say nothing\r\nI’m gonna say something--\r\nthat’s why I’m here\r\nI guess it could be your beauty,\r\nor it could be much more\r\ncould be that I need to call you dear someday...\r\n\r\nDear someday,\r\n\r\nI know I haven’t lived you yet,\r\nAnd the sun hasn’t risen in the corner of sky it’ll call its own\r\nAnd though you seem rather distant,\r\nhope I may have the fortune\r\nto call you my own,\r\nsomeday	Dear Someday	mp3	1	Andrew Puglionesi	2019-01-04 16:26:11.0397	2024-10-05 22:55:42.54117	/songs/Dear Someday.mp3	2	82	0
4		The Why Did I Decide to Play Blues at 1 AM Blues	mp3	1	Andrew Puglionesi	2019-01-04 16:31:02.347328	2024-10-05 22:13:40.393256	/songs/The Why Did I Decide to Play Blues at 1 AM Blues.mp3	4	35	0
6		At the Cinema	mp3	1	Andrew Puglionesi	2019-01-04 16:44:30.241009	2024-10-05 22:23:48.985876	/songs/At the Cinema.mp3	6	30	0
7		Outro	mp3	2	Andrew Puglionesi	2019-01-06 15:56:08.790266	2024-10-05 23:58:50.563761	/songs/Outro.mp3	1	31	1
1		Blemish	mp3	1	Andrew Puglionesi	2019-01-04 16:23:57.539459	2024-10-06 02:15:57.421707	/songs/Blemish.mp3	1	96	0
17	I really want to go north\r\nWhere the snow will be falling\r\nAnd I can find someplace warm\r\nAnd I can find someone\r\n\r\nI really want to go south\r\nA los lugares antiguos\r\nLa selva es fuego\r\n\r\nI really want to go east\r\nTo some place that made me\r\nThey already hate us again\r\nBaruch ata Adonai\r\n\r\nI really want to go west\r\nFind some truth in the mountains\r\nBury the lies in the sand\r\nBury the lie\r\n\r\nI think my compass is broken\r\n'Cause every direction\r\nBrings with it a sign\r\n\r\nAnd home is an omen\r\nAnd home is an omen\r\nAnd home is an omen\r\n\r\nAnd omens are never fi/ne	Compass	mp3	4	Andrew Puglionesi	2020-08-02 20:09:43.387214	2024-10-05 22:38:53.285066	/songs/Compass.mp3	4	11	2
16	All of a sudden\r\nYou’re a wanderer\r\nI’ll tell you something:\r\nWe have everything we want\r\n—it’s not much\r\n\r\nDeep in the valley\r\nRiver passing by your side\r\nHope is a rainbow\r\nWider than the bleeding sky\r\n\r\nBe never-ending\r\nDeath is nothing, fate and time\r\nThe sun is a message\r\nLighting up how you ask why\r\n\r\nFollow the path between\r\nTomorrow and today\r\nLike it’s some kind of dream\r\nYou know it’s getting late\r\n\r\nRun the grass through your hands\r\nLet it become what you know\r\nBreathe in the purest air\r\nRest for a while\r\n\r\nGo to the mountain’s peak\r\nTo the edge of your world\r\nLook out over existence\r\nYou are everything that’s wild	Wanderer	mp3	4	Andrew Puglionesi	2020-08-02 20:07:53.069869	2024-10-05 22:41:39.677712	/songs/Wanderer.mp3	5	13	1
15	You keep putting acid in my blood\r\nKeep throwing fuel into the fire\r\nKeep putting pavement on my skin\r\nI'm older than you'll ever know\r\n\r\nKeep drilling holes into my chest\r\nKeep taking everything that's mine\r\nKeep spewing air that I can't breathe\r\nI swear, I swear, I swear I'll be fine\r\n\r\nKeep killing all the things I love\r\nKeep taking every drop I've got\r\nUse my flesh to kill those men\r\nI'll woefully, woefully take them as mine\r\n\r\nKeep all the gases burning bright\r\nKeeping you warm and safe at night\r\nNever mind that I have a fever\r\nAnd you have a duty to me and your kind\r\n\r\n'Cause I know your children hear me\r\nAnd that they know wrong from right\r\nAnd that they won't let you forward\r\nAnd that you won't let them die\r\n\r\nNot by my hand, no\r\nPlease not by my hand	By My Hand	mp3	4	Andrew Puglionesi	2020-08-02 20:06:36.307834	2024-10-13 03:47:09.980013	/songs/By My Hand.mp3	3	17	1
13	She lives in a little old house\r\nDown by the river\r\n\r\nWhere the roots meet the soil\r\nAnd the soil turns to sand\r\nAnd the sand meets the stone\r\nAnd the stone turns to water\r\n\r\nHer name’s carried out by the wind\r\nAnd it glides to the fields\r\nLike a kite set free by a gale\r\n\r\nThe trees hold their breath as she nears\r\nAnd make way for the queen of the\r\nEver-turning world\r\n\r\nOh waterbird\r\nWake me up\r\nLead me home\r\n\r\nOh waterbird\r\nWake me up\r\nLead me home\r\n\r\nOh waterbird\r\nWake me up\r\nLead me home	Waterbird	mp3	4	Andrew Puglionesi	2020-08-02 20:02:59.89546	2025-07-19 18:43:38.653863	/songs/Waterbird.mp3	1	38	7
5	You have these warm-weather eyes\r\nand this wishful smile\r\nand a bright, breathy voice\r\nI've owed a song for a while\r\n\r\nYou've a mind like Einstein's\r\nand a wit like Locke's\r\nyou have a laugh like the ocean\r\nwhen I hear it, I'm\r\n\r\nlost at sea, in the waves\r\nthat's me, trying desperately to\r\nfind something I lost so long ago\r\nI found in you\r\n\r\nAnd though I know I tend to make it all\r\nmuch bigger than it is,\r\nI could never let this slip by\r\n\r\nPlease stay, don't go\r\nI want you here, you're part of home\r\nYou're part of home\r\nYou're part of home\r\n\r\nYou say you've looked into a street or two,\r\nlooked over a bridge or two, and thought "what if I jumped in?"\r\nwhen everyday the pain keeps getting worse, no end in sight,\r\nprefer to sleep\r\nwhy wake, why wake, why wake, when waking up means sorrow\r\n\r\nAnd though I can't know what you're going through,\r\nthere's just one thing I ask of you\r\n\r\nPlease stay, don't go\r\nI want you here, you're part of home\r\nPlease stay, don't go\r\nI want you here, you're part of home\r\nYou're part of home\r\nYou're part of home\r\n\r\nYou have these warm-weather eyes\r\nand this wishful smile\r\nand a bright, breathy voice\r\nI've owed a song for a while\r\n\r\nAnd if I didn't know any better\r\nI'd say\r\n(that I love you)\r\n(cause I love you)	Song for a Friend	mp3	1	Andrew Puglionesi	2019-01-04 16:43:51.542872	2024-10-05 22:30:16.184284	/songs/Song for a Friend.mp3	5	43	1
14	I had some strange dreams last night\r\nSo I woke up really fast\r\nAnd wrote them down in a text message\r\nAlmost sent it off to you\r\n\r\nAnd the streets went the same way\r\nBut everything was really green\r\nAnd really damp and really grey\r\nWith all these fields and rolling hills\r\nDo you know a place like that\r\n\r\nBut in your room I couldn't speak\r\nI was so tired I just collapsed on the bed\r\nAnd then I crawled underneath it\r\nAnd all I saw was white\r\n\r\nSo much happened and I thought through\r\nWhat it meant, what it meant, what it meant,\r\nWhat it meant, what it meant\r\nAnd it meant that I would miss you\r\n\r\nSeems that everyone I know just leaves and goes to California\r\nHeard the weather's really nice\r\nAnd heard that everyone is beautiful\r\nAnd no one's ever sad\r\nAnd money's falling from the sky\r\nBut sometimes everything's on fire\r\nI hope that you're never on fire\r\n\r\nThe power went out last night\r\nSo I woke up real slow\r\nAnd felt the light	Dreams (California)	mp3	4	Andrew Puglionesi	2020-08-02 20:05:24.277281	2024-10-13 03:45:20.391424	/songs/Dreams (California).mp3	2	23	1
19	Is everything we see written with destiny,\r\nor with the laws that men and women have bled?\r\nMy questions, do you see, are they a part of me,\r\nor are they part, part of some other man?\r\nWhat is the point of this thing we call life we live?\r\nAre we just here, or is it happiness?\r\nBecause that's all that I seem to see,\r\nAll that I want for me, you, and our kin\r\nKin of all kinds, you know,\r\nWalls leave no one alone\r\nWe'll breathe the air until\r\nour time comes\r\nAnd our time will come\r\n\r\nAm I mechanical? Am I an animal?\r\nDoes half of what I know ever leave my head?\r\nDoes the world we perceive reflect reality?\r\nWhy won't you look at me, or was it something I said?\r\nWhy am I tied to you,\r\nWhy's my mind leap to you,\r\nWhy does your absence make me so damn upset?\r\nAnd why do we exist?\r\n\r\nSometimes I think it's we who make the meaning, and\r\nWe're fallible but failure's a misleading word\r\nWe're malleable but sometimes there's no time to mend\r\nBreathe in, breathe out,\r\nI see you're trying to swim\r\nDon't ever give in\r\nWe're in a universe that we cannot begin to comprehend\r\nIs it limitless, or, tell me, does it have some kind of end?\r\nWhat makes me me, and what makes you you?\r\nAnd why can I feel this kind of pain?\r\nAnd why do I have these thoughts I can't explain?\r\nAnd why can I remember the glint in your eyes?\r\nAnd why do we feel like the same people for our entire lives?\r\nAnd why do we have lives?\r\n\r\nWhat do my words mean?\r\nIs language without seams?\r\nIs there a perfect way to learn about our past?\r\nIs this a fleeting time\r\nin a fleeting life\r\nin a universe that lives a million times?\r\nAre my decisions tests?\r\nIs my wonder at best answered by what you'd call a guess?\r\nAnd do you have a guess?	Philosopher's Song	mp3	1	Andrew Puglionesi	2023-02-28 02:48:18.472326	2024-10-05 22:09:22.292428	/songs/Philosopher's Song.mp3	3	2	0
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.albums_id_seq', 4, true);


--
-- Name: blog_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blog_categories_id_seq', 2, true);


--
-- Name: blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.blog_posts_id_seq', 4, true);


--
-- Name: news_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.news_items_id_seq', 48, true);


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
-- Name: blog_categories blog_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_categories
    ADD CONSTRAINT blog_categories_pkey PRIMARY KEY (id);


--
-- Name: blog_posts blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


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
-- Name: index_blog_posts_on_blog_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_blog_posts_on_blog_category_id ON public.blog_posts USING btree (blog_category_id);


--
-- Name: index_blog_posts_on_path; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_blog_posts_on_path ON public.blog_posts USING btree (path);


--
-- Name: index_songs_on_album_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_songs_on_album_id ON public.songs USING btree (album_id);


--
-- Name: blog_posts fk_rails_915634ded9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT fk_rails_915634ded9 FOREIGN KEY (blog_category_id) REFERENCES public.blog_categories(id);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;

--
-- PostgreSQL database dump complete
--

\unrestrict dCkc4VlCxACfklKigQw2ReJ97pnMb4VwgHcDFu8bVfYarrFkS48iaITMkOyyhvs

