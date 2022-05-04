--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    name character varying(50) NOT NULL,
    diameter_yl integer NOT NULL,
    distance_from_earth_yl integer NOT NULL,
    quantity_of_galaxies integer,
    constellation character varying(30),
    cluster_id integer NOT NULL
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    cluster_id integer,
    name character varying(50) NOT NULL,
    diameter_yl integer NOT NULL,
    distance_from_earth_yl integer NOT NULL,
    quantity_of_stars text,
    constellation character varying(30)
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
    planet_id integer,
    name character varying(50) NOT NULL,
    diameter_km integer NOT NULL,
    distance_from_its_planet_km integer NOT NULL,
    contains_water boolean
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
    star_id integer,
    name character varying(50) NOT NULL,
    diameter_km integer NOT NULL,
    distance_from_earth_yl integer NOT NULL,
    gravity_ms numeric NOT NULL,
    interesting_facts text,
    contains_water boolean,
    in_circumstellar_habitable_zone boolean
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
    galaxy_id integer,
    name character varying(50) NOT NULL,
    diameter_km integer NOT NULL,
    distance_from_earth_yl integer NOT NULL,
    gravity_ms numeric(10,2),
    age_mega_yr integer
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


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
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES ('Virgo cluster', 15000000, 59000000, 1300, 'Virgo and Coma Verenices', 1);
INSERT INTO public.cluster VALUES ('Local group', 10000000, 0, 49, NULL, 2);
INSERT INTO public.cluster VALUES ('Norma cluster', 1268000000, 221100000, 603, 'Norma', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 2, 'Milky Way galaxy', 175000, 0, '2.5E11', NULL);
INSERT INTO public.galaxy VALUES (1, 2, 'Andromeda galaxy', 220000, 2450000, '10E12', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 2, 'Triangulum galaxy', 60000, 3200000, '4E10', 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 2, 'Canis Major Overdensity', 26, 25000, '1E9', 'Canis Major');
INSERT INTO public.galaxy VALUES (5, 2, 'Cygnus A', 1, 760000000, NULL, 'Cygnus');
INSERT INTO public.galaxy VALUES (6, 2, 'Large Magellanic Clouds', 14000, 163000, NULL, 'Dorado/Mensa');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Burger', 125, 12500, false);
INSERT INTO public.moon VALUES (2, 1, 'Hot Dog', 145, 12500, false);
INSERT INTO public.moon VALUES (3, 2, '404', 404, 4040, false);
INSERT INTO public.moon VALUES (4, 2, '404_1', 4040, 40400, false);
INSERT INTO public.moon VALUES (5, 3, 'Vegetables', 906090, 91, true);
INSERT INTO public.moon VALUES (6, 3, 'Do exercise', 906090, 91, true);
INSERT INTO public.moon VALUES (7, 4, 'Vitamines', 900000, 405, true);
INSERT INTO public.moon VALUES (8, 4, 'Water', 95000, 9596, true);
INSERT INTO public.moon VALUES (9, 5, 'Nine', 99999, 99999999, true);
INSERT INTO public.moon VALUES (10, 5, 'Ten', 101010, 1010, false);
INSERT INTO public.moon VALUES (11, 6, 'XS', 608080, 5652, false);
INSERT INTO public.moon VALUES (12, 6, 'S', 608080, 5652, false);
INSERT INTO public.moon VALUES (13, 7, 'Fiona', 146236, 76545, true);
INSERT INTO public.moon VALUES (14, 7, 'Donkey', 4796269, 764173, true);
INSERT INTO public.moon VALUES (15, 8, 'Freedom', 47917639, 74173, true);
INSERT INTO public.moon VALUES (16, 8, 'Judgement', 79425839, 4173, true);
INSERT INTO public.moon VALUES (17, 10, 'Free sex', 1749254, 4173, true);
INSERT INTO public.moon VALUES (18, 10, 'Maria', 17449254, 7915, true);
INSERT INTO public.moon VALUES (19, 12, 'mexico City', 47649254, 77915, true);
INSERT INTO public.moon VALUES (20, 12, 'Queretaro', 47929254, 7913585, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Pizza planet', 3141500, 314153200, 3.1415, 'it contains frozzen pizza', true, false);
INSERT INTO public.planet VALUES (2, 1, '404 Planet not found', 404, 404, 404, '404', true, false);
INSERT INTO public.planet VALUES (3, 1, 'Fat Planet', 49663695, 56578233, 4, 'All is fat', true, true);
INSERT INTO public.planet VALUES (4, 2, 'Melon', 49663695, 56578233, 10, 'it does not cointain melons', true, true);
INSERT INTO public.planet VALUES (5, 2, 'Eight', 888888888, 888888, 8, 'Everything has an eight shape', true, false);
INSERT INTO public.planet VALUES (6, 2, 'XL', 767676, 8787878, 760, 'Everything is tall', false, true);
INSERT INTO public.planet VALUES (7, 2, 'Sherk Planet', 325468551, 36540, 3.241, 'Sherk planet', true, true);
INSERT INTO public.planet VALUES (8, 3, 'jail Planet', 56476, 8787878, 7.9, 'All are prisioners', true, true);
INSERT INTO public.planet VALUES (9, 3, 'Tororo Planet', 156, 6354, 14, 'Totoro is no longer here', true, true);
INSERT INTO public.planet VALUES (10, 3, 'The Barto', 175156, 568746354, 14, 'The Barto was here', true, false);
INSERT INTO public.planet VALUES (11, 4, 'Hippie Planet', 47546666, 27631, 10, 'Just peace and love', false, false);
INSERT INTO public.planet VALUES (12, 5, 'Mexico', 4145, 81265, 17, 'Mexico is currently here', false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Alpha Andromedae', 7000, 97, 375.00, 70);
INSERT INTO public.star VALUES (2, 1, 'Beta Andromedae', 200, 197, 152.00, NULL);
INSERT INTO public.star VALUES (3, 1, 'Gamma Andromedae', 160, 390, 200.00, 7);
INSERT INTO public.star VALUES (4, 2, 'The Sun', 1391016, 0, 274.00, 4603);
INSERT INTO public.star VALUES (5, 2, 'Antares', 946000000, 550, 390.00, 11);
INSERT INTO public.star VALUES (6, 2, 'Betelgeuse', 1234000000, 643, 0.00, 8);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


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

