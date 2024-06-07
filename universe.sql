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
    name character varying(50),
    other_id integer NOT NULL,
    ammount_of_systems numeric NOT NULL,
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
    name character varying(50),
    star_system_id integer NOT NULL,
    age numeric NOT NULL,
    description text,
    planet_id integer
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
-- Name: other; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other (
    other_id integer NOT NULL,
    name character varying(50),
    star_id integer,
    ammount_of_stars numeric NOT NULL,
    description text,
    galaxy_id integer
);


ALTER TABLE public.other OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    other_id integer NOT NULL,
    ammount_of_planets numeric NOT NULL,
    description text,
    galaxy_id integer,
    bigger_than_sun boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: other_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_id_seq OWNER TO freecodecamp;

--
-- Name: other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_id_seq OWNED BY public.star.star_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    ammount_of_moons integer,
    description text,
    star_id integer,
    has_life boolean NOT NULL
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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.other_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'a', 1, 1, 'f');
INSERT INTO public.galaxy VALUES (2, 'b', 2, 2, 'f');
INSERT INTO public.galaxy VALUES (3, 'c', 3, 3, 'f');
INSERT INTO public.galaxy VALUES (4, 'd', 4, 4, 'f');
INSERT INTO public.galaxy VALUES (5, 'e', 5, 5, 'f');
INSERT INTO public.galaxy VALUES (6, 'f', 6, 6, 'f');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'a', 7, 1, 'f', 1);
INSERT INTO public.moon VALUES (2, 'b', 2, 2, 'f', 2);
INSERT INTO public.moon VALUES (3, 'c', 3, 3, 'f', 3);
INSERT INTO public.moon VALUES (4, 'd', 4, 4, 'f', 4);
INSERT INTO public.moon VALUES (5, 'e', 5, 5, 'f', 5);
INSERT INTO public.moon VALUES (6, 'f', 6, 6, 'f', 6);
INSERT INTO public.moon VALUES (7, 'a2', 7, 1, 'f', 1);
INSERT INTO public.moon VALUES (8, 'b2', 2, 2, 'f', 2);
INSERT INTO public.moon VALUES (9, 'c2', 3, 3, 'f', 3);
INSERT INTO public.moon VALUES (10, 'd2', 4, 4, 'f', 4);
INSERT INTO public.moon VALUES (11, 'e2', 5, 5, 'f', 5);
INSERT INTO public.moon VALUES (12, 'f2', 6, 6, 'f', 6);
INSERT INTO public.moon VALUES (13, 'a3', 7, 1, 'f', 1);
INSERT INTO public.moon VALUES (14, 'b3', 2, 2, 'f', 2);
INSERT INTO public.moon VALUES (15, 'c3', 3, 3, 'f', 3);
INSERT INTO public.moon VALUES (16, 'd3', 4, 4, 'f', 4);
INSERT INTO public.moon VALUES (17, 'e3', 5, 5, 'f', 5);
INSERT INTO public.moon VALUES (18, 'f3', 6, 6, 'f', 6);
INSERT INTO public.moon VALUES (19, 'a4', 7, 1, 'f', 1);
INSERT INTO public.moon VALUES (20, 'b4', 2, 2, 'f', 2);
INSERT INTO public.moon VALUES (21, 'c4', 3, 3, 'f', 3);
INSERT INTO public.moon VALUES (22, 'd4', 4, 4, 'f', 4);
INSERT INTO public.moon VALUES (23, 'e4', 5, 5, 'f', 5);
INSERT INTO public.moon VALUES (24, 'f4', 6, 6, 'f', 6);


--
-- Data for Name: other; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other VALUES (2, 'a', NULL, 1, 'f', 1);
INSERT INTO public.other VALUES (3, 'b', NULL, 2, 'f', 2);
INSERT INTO public.other VALUES (4, 'c', NULL, 3, 'f', 3);
INSERT INTO public.other VALUES (5, 'd', NULL, 4, 'f', 4);
INSERT INTO public.other VALUES (6, 'e', NULL, 5, 'f', 5);
INSERT INTO public.other VALUES (7, 'f', NULL, 6, 'f', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'a', 1, 'f', 13, true);
INSERT INTO public.planet VALUES (2, 'b', 2, 'f', 13, false);
INSERT INTO public.planet VALUES (3, 'c', 3, 'f', 13, true);
INSERT INTO public.planet VALUES (4, 'd', 4, 'f', 13, false);
INSERT INTO public.planet VALUES (5, 'e', 5, 'f', 13, true);
INSERT INTO public.planet VALUES (6, 'f', 6, 'f', 13, false);
INSERT INTO public.planet VALUES (7, 'a2', 1, 'f', 13, true);
INSERT INTO public.planet VALUES (8, 'b2', 2, 'f', 13, false);
INSERT INTO public.planet VALUES (9, 'c2', 3, 'f', 13, true);
INSERT INTO public.planet VALUES (10, 'd2', 4, 'f', 13, false);
INSERT INTO public.planet VALUES (11, 'e2', 5, 'f', 13, true);
INSERT INTO public.planet VALUES (12, 'f2', 6, 'f', 13, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (13, 'a', 7, 1, 'f', 1, true);
INSERT INTO public.star VALUES (14, 'b', 2, 2, 'f', 2, false);
INSERT INTO public.star VALUES (15, 'c', 3, 3, 'f', 3, true);
INSERT INTO public.star VALUES (16, 'd', 4, 4, 'f', 4, false);
INSERT INTO public.star VALUES (17, 'e', 5, 5, 'f', 5, true);
INSERT INTO public.star VALUES (18, 'f', 6, 6, 'f', 6, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_id_seq', 18, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: other star_system_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT star_system_id UNIQUE (other_id);


--
-- Name: other star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT star_system_pkey PRIMARY KEY (other_id);


--
-- Name: other galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_system_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_system_id FOREIGN KEY (other_id) REFERENCES public.other(other_id);


--
-- PostgreSQL database dump complete
--

