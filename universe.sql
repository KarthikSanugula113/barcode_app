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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_period_years integer,
    diameter_km numeric(10,2),
    is_periodic boolean,
    has_water boolean,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    diameter_light_years numeric,
    has_black_hole boolean,
    has_water boolean,
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
    name character varying(30) NOT NULL,
    planet_id integer,
    radius_km numeric(10,3),
    is_spherical boolean,
    has_life boolean,
    orbital_days numeric(10,3),
    description text
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    radius_km integer,
    has_life boolean,
    has_water boolean,
    distance_au numeric(4,2),
    description text
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_kelvin integer,
    mass_solar numeric(4,2),
    is_main_sequence boolean,
    has_water boolean,
    description text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (2, 'Halley', 75, 11.00, true, false, 'Famous periodic comet', 1);
INSERT INTO public.comet VALUES (3, 'Hale- Bopp', 2533, 60.00, true, false, 'very bright comet', 1);
INSERT INTO public.comet VALUES (4, 'Encke', 3, 4.80, true, false, 'Shortest peiod', 2);
INSERT INTO public.comet VALUES (5, 'Hyakutake', 70000, 4.00, false, false, 'Long tail comet', 3);
INSERT INTO public.comet VALUES (6, 'Borrelly', 7, 8.00, true, false, 'Visited by probe', 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 13600, 105700, true, false, 'Home galaxy for Earth');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 220000, true, false, 'Nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 60000, false, true, 'Small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8000, 76000, true, false, 'Interacting galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 13000, 49000, true, false, 'Bright nucleus galaxy');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 11000, 14000, false, true, 'Satellite galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.000, true, false, 27.300, 'Earth moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.000, false, false, 0.300, 'Mars moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.000, false, false, 1.300, 'Mars moon');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.000, true, false, 1.800, 'Volcanic moon');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.000, true, false, 3.500, 'Ocean moon');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.000, true, false, 7.100, 'Largest moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.000, true, false, 16.700, 'Cratered moon');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575.000, true, false, 16.000, 'Thick atmosphere');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252.000, true, false, 1.400, 'Water geysers');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198.000, true, false, 0.900, 'Death star look');
INSERT INTO public.moon VALUES (11, 'Triton', 8, 1353.000, true, false, 5.900, 'Retrograde orbit');
INSERT INTO public.moon VALUES (12, 'Nereid', 8, 170.000, false, false, 360.000, 'Irregular orbit');
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 761.000, true, false, 13.500, 'uranus moon');
INSERT INTO public.moon VALUES (14, 'Titania', 7, 788.000, true, false, 8.700, 'Largest Uranus moon');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 236.000, true, false, 1.400, 'Extreme cliffs');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 578.000, true, false, 2.500, 'Bright surface');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 584.000, true, false, 4.100, 'Dark moon');
INSERT INTO public.moon VALUES (18, 'Charon', 9, 606.000, true, false, 6.400, 'Pluto moon');
INSERT INTO public.moon VALUES (19, 'Styx', 9, 10.000, false, false, 20.200, 'Small moon');
INSERT INTO public.moon VALUES (20, 'Kerberos', 9, 12.000, false, false, 32.100, 'Tiny moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, false, false, 0.39, 'Closest planet to the star sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6052, false, false, 0.72, 'Hottest planet');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6371, true, true, 1.00, 'Life supporting planet');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3390, false, true, 1.52, 'Red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, false, false, 5.20, 'Gas giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, false, true, 9.58, 'Ringed planet');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, false, false, 19.20, 'Ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, false, false, 30.10, 'Farthest planet');
INSERT INTO public.planet VALUES (9, 'Proxima b', 5, 7160, false, true, 0.05, 'Exoplanet');
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2, 10000, false, true, 0.85, 'Super Earth');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 2, 14300, false, false, 0.05, 'Hot jupiter');
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 5, 9000, false, false, 0.13, 'Habitable planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1.00, true, false, 'Our Star');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, 2.10, true, false, 'Brightest star');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, 20.00, false, false, 'Red Supergiant');
INSERT INTO public.star VALUES (4, 'Rigel', 1, 12100, 21.00, true, false, 'Blue Supergiant');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 3842, 0.12, true, false, 'Closest Star');
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 5790, 1.10, true, false, 'Binary System star');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


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
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

