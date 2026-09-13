--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    around_earth boolean,
    kg numeric NOT NULL,
    more_info text,
    discovery_year integer,
    number_of_observations integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type_of character varying(50),
    distance_from_earth numeric,
    num_star bigint
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
    name character varying(30) NOT NULL,
    type_of character varying(50),
    kg numeric
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
    name character varying(30) NOT NULL,
    type_of character varying(50),
    kg numeric,
    has_life boolean
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
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type_of character varying(50),
    kg numeric,
    is_spherical boolean
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', false, 939000000000000000000, 'Planeta anão do cinturão de asteroides', NULL, NULL);
INSERT INTO public.asteroid VALUES (2, 'Vesta', false, 259000000000000000000, 'Um dos maiores asteroides conhecidos', NULL, NULL);
INSERT INTO public.asteroid VALUES (3, 'Apophis', true, 61000000000, 'Asteroide que passa próximo da Terra', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Láctea', 'Espiral', 0, 6);
INSERT INTO public.galaxy VALUES (2, 'Andrômeda', 'Espiral', 2537000, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Grande Nuvem de Magalhães', 'IRREGULAR', 163000, 30000000);
INSERT INTO public.galaxy VALUES (4, 'Galáxia do Triângulo', 'Spiral', 3000000, 40000000000);
INSERT INTO public.galaxy VALUES (5, 'Galáxia do Sombrero', 'Spiral', 29000000, 100000000000);
INSERT INTO public.galaxy VALUES (6, 'Galáxia do Redemoinho', 'Spiral', 23000000, 100000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Lua', 'Rochosa', 73500000000000000000000);
INSERT INTO public.moon VALUES (2, 4, 'Fobos', 'Rochosa', 10700000000000000);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Rochosa', 1480000000000000);
INSERT INTO public.moon VALUES (4, 5, 'Io', 'Rochosa vulcânica', 89300000000000000000000);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Gelada', 48000000000000000000000);
INSERT INTO public.moon VALUES (6, 5, 'Ganimedes', 'Gelada rochosa', 148000000000000000000000);
INSERT INTO public.moon VALUES (7, 5, 'Calisto', 'Gelada rochosa', 108000000000000000000000);
INSERT INTO public.moon VALUES (8, 6, 'Titã', 'Gelada com atmosfera', 135000000000000000000000);
INSERT INTO public.moon VALUES (9, 6, 'Reia', 'Gelada rochosa', 2310000000000000000000);
INSERT INTO public.moon VALUES (10, 6, 'Jápeto', 'Gelada rochosa', 1810000000000000000000);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 'Gelada rochosa', 1100000000000000000000);
INSERT INTO public.moon VALUES (12, 6, 'Tétis', 'Gelada', 617000000000000000000);
INSERT INTO public.moon VALUES (13, 6, 'Encélado', 'Gelada', 108000000000000000000);
INSERT INTO public.moon VALUES (14, 6, 'Mimas', 'Gelada', 37500000000000000000);
INSERT INTO public.moon VALUES (15, 7, 'Miranda', 'Gelada rochosa', 65900000000000000000);
INSERT INTO public.moon VALUES (16, 7, 'Ariel', 'Gelada rochosa', 1350000000000000000000);
INSERT INTO public.moon VALUES (17, 7, 'Umbriel', 'Gelada rochosa', 1280000000000000000000);
INSERT INTO public.moon VALUES (18, 7, 'Titânia', 'Gelada rochosa', 3530000000000000000000);
INSERT INTO public.moon VALUES (19, 7, 'Oberon', 'Gelada rochosa', 3010000000000000000000);
INSERT INTO public.moon VALUES (20, 8, 'Tritão', 'Gelada rochosa', 21400000000000000000000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercúrio', NULL, 330000000000000000000000, false);
INSERT INTO public.planet VALUES (2, 1, 'Vênus', NULL, 4870000000000000000000000, false);
INSERT INTO public.planet VALUES (3, 1, 'Terra', NULL, 5970000000000000000000000, true);
INSERT INTO public.planet VALUES (4, 1, 'Marte', NULL, 642000000000000000000000, false);
INSERT INTO public.planet VALUES (5, 1, 'Júpiter', NULL, 1900000000000000000000000000, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturno', NULL, 568000000000000000000000000, false);
INSERT INTO public.planet VALUES (7, 1, 'Urano', NULL, 86800000000000000000000000, false);
INSERT INTO public.planet VALUES (8, 1, 'Netuno', NULL, 102000000000000000000000000, false);
INSERT INTO public.planet VALUES (9, 1, 'Plutão', NULL, 13000000000000000000000, false);
INSERT INTO public.planet VALUES (10, 1, 'Ceres', NULL, 939000000000000000000, false);
INSERT INTO public.planet VALUES (11, 1, 'Éris', NULL, 16700000000000000000000, false);
INSERT INTO public.planet VALUES (12, 1, 'Haumea', NULL, 4010000000000000000000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'Anã amarela', 1.989, true);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 'Estrela branca', 4.1, true);
INSERT INTO public.star VALUES (3, 1, 'Vega', 'Estrela branca', 4.3, true);
INSERT INTO public.star VALUES (4, 1, 'Rigel', 'Supergigante azul', 1.4, true);
INSERT INTO public.star VALUES (5, 1, 'Antares', 'Supergigante vermelha', 2.4, true);
INSERT INTO public.star VALUES (6, 1, 'Betelgeuse', 'Supergigante vermelha', 3.3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, true);


--
-- Name: asteroid asteroid_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);


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
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: asteroid planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (asteroid_id);


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

