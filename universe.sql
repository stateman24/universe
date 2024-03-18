--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(60) NOT NULL,
    diameter_in_km numeric(8,2) NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    mass numeric(20,2) NOT NULL,
    diameter numeric(20,2) NOT NULL,
    has_life boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    diameter numeric(10,3) NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric(20,2) NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age integer NOT NULL,
    radius numeric(10,2) NOT NULL,
    mass numeric(20,2) NOT NULL,
    temperature integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(60) NOT NULL,
    note text
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Cygnus', 'Irregular', 5932.34, 'Starburst galaxy with intense star formation activity');
INSERT INTO public.galaxy VALUES (2, 'Milky way', 'Spiral', 29575.42, 'Interacting galaxy with distorted shapes due to gravitational interactions');
INSERT INTO public.galaxy VALUES (3, 'Gemini', 'Ring', 31884.51, 'Spiral galaxy with multiple arms and a bright central bulge');
INSERT INTO public.galaxy VALUES (4, 'Pegasus', 'Lenticular', 57612.88, 'Irregular galaxy with a chaotic and asymmetrical shape');
INSERT INTO public.galaxy VALUES (5, 'Leo', 'Lenticular', 67566.44, 'Compact elliptical galaxy with a small size and high stellar density');
INSERT INTO public.galaxy VALUES (6, 'Cassiopeia', 'Elliptical', 11412.45, 'Supermassive black hole galaxy with a massive central black hole');
INSERT INTO public.galaxy VALUES (7, 'Lyra', 'Ring', 41011.25, 'Irregular galaxy with a chaotic and asymmetrical shape');
INSERT INTO public.galaxy VALUES (8, 'Aquarius', 'Barred Spiral', 61608.22, 'Ring galaxy with a ring-like structure of stars');
INSERT INTO public.galaxy VALUES (9, 'Phoenix', 'Dwarf', 17291.41, 'Quasar galaxy with an active galactic nucleus emitting powerful radiation');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ymir', 743500632029.75, 6175.74, false, 1);
INSERT INTO public.moon VALUES (2, 'Selene', 996654878991.41, 6991.34, false, 2);
INSERT INTO public.moon VALUES (3, 'Loge', 44627749096.48, 4861.79, false, 3);
INSERT INTO public.moon VALUES (4, 'Thebe', 54151005072.33, 3148.20, true, 4);
INSERT INTO public.moon VALUES (5, 'Phoebe', 277492826100.58, 4430.27, false, 5);
INSERT INTO public.moon VALUES (6, 'Aegaeon', 611219226198.37, 3408.68, false, 6);
INSERT INTO public.moon VALUES (7, 'Aegir', 364989218172.00, 6802.90, false, 7);
INSERT INTO public.moon VALUES (8, 'Greip', 514361284888.22, 7449.36, false, 8);
INSERT INTO public.moon VALUES (9, 'Euanthe', 762861383434.47, 5211.58, false, 9);
INSERT INTO public.moon VALUES (10, 'Diana', 379475817486.47, 7153.81, true, 10);
INSERT INTO public.moon VALUES (11, 'Helene', 198438021094.30, 3146.25, false, 11);
INSERT INTO public.moon VALUES (15, 'Ganemeyd', 416870889903.07, 6391.17, true, 14);
INSERT INTO public.moon VALUES (16, 'Anthe', 943228325858.38, 5639.34, false, 15);
INSERT INTO public.moon VALUES (17, 'Telesto', 982977118951.14, 6595.91, false, 7);
INSERT INTO public.moon VALUES (18, 'Atlas', 436919727919.17, 2271.70, false, 8);
INSERT INTO public.moon VALUES (19, 'Hyperion', 37753047272.25, 6588.96, true, 9);
INSERT INTO public.moon VALUES (20, 'Epimetheus', 945625581638.22, 5335.67, true, 2);
INSERT INTO public.moon VALUES (21, 'Janus', 757046680663.83, 5783.52, false, 4);
INSERT INTO public.moon VALUES (22, 'Pan', 429378287376.27, 2079.07, true, 5);
INSERT INTO public.moon VALUES (23, 'Hati', 357876487130.75, 4429.25, true, 8);
INSERT INTO public.moon VALUES (24, 'Skoll', 407835030014.38, 3972.70, true, 7);
INSERT INTO public.moon VALUES (25, 'Daphnis', 19092823077.20, 4145.39, true, 9);
INSERT INTO public.moon VALUES (26, 'Prometheus', 89429480437.24, 2972.26, true, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (14, 'Venus', 138980.430, false, 140240222.65, 1);
INSERT INTO public.planet VALUES (15, 'Mars', 76317.020, false, 879124143.33, 1);
INSERT INTO public.planet VALUES (13, 'Comet', 62518.150, true, 642994272.77, 15);
INSERT INTO public.planet VALUES (5, 'Andromeda', 7256.950, true, 9465453.39, 14);
INSERT INTO public.planet VALUES (1, 'Supernova', 92553.990, true, 535532392.09, 8);
INSERT INTO public.planet VALUES (2, 'Asteroid', 120207.060, false, 652685741.80, 8);
INSERT INTO public.planet VALUES (3, 'Pluto', 26333.150, false, 183989562.73, 12);
INSERT INTO public.planet VALUES (4, 'Pulsar', 144330.990, false, 290401432.31, 11);
INSERT INTO public.planet VALUES (7, 'Jupiter', 57289.310, false, 583437485.04, 11);
INSERT INTO public.planet VALUES (8, 'Stardust', 134696.340, false, 84507491.21, 10);
INSERT INTO public.planet VALUES (9, 'Earth', 106015.250, true, 154506302.76, 10);
INSERT INTO public.planet VALUES (11, 'Solara', 140212.310, true, 553644182.69, 13);
INSERT INTO public.planet VALUES (6, 'Nebula', 33844.290, true, 530608380.78, 8);
INSERT INTO public.planet VALUES (10, 'Blackhole', 102528.290, false, 480824052.14, 10);
INSERT INTO public.planet VALUES (12, 'Saturn', 64719.570, true, 20749387.43, 14);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Aldebaran', 576817, 66339.59, 7130.54, 33, 1);
INSERT INTO public.star VALUES (8, 'Vega', 580350, 6024.23, 37343.58, 81, 2);
INSERT INTO public.star VALUES (9, 'Bellatrix', 789157, 1092.54, 91343.69, 103, 3);
INSERT INTO public.star VALUES (10, 'Alnilam', 385393, 45415.93, 94713.67, -4, 4);
INSERT INTO public.star VALUES (11, 'Antares', 242492, 35890.58, 56808.95, 44, 5);
INSERT INTO public.star VALUES (12, 'Pollux', 745562, 69798.39, 36966.70, 41, 6);
INSERT INTO public.star VALUES (13, 'Polaris', 642108, 4339.09, 3064.54, 46, 9);
INSERT INTO public.star VALUES (14, 'Porycon', 997774, 1755.34, 20620.04, -19, 8);
INSERT INTO public.star VALUES (15, 'Denab', 629915, 16754.72, 6207.40, 68, 7);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Proxima Centauri', 'The Trappist-1 system contains seven Earth-sized planets.');
INSERT INTO public.system VALUES (2, 'Betelgeuse', 'The Proxima Centauri system is the closest known planetary system to the Solar System.');
INSERT INTO public.system VALUES (3, 'Alpha Centauri', 'The Proxima Centauri system is the closest known planetary system to the Solar System.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: system system_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_name_unique UNIQUE (name);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

