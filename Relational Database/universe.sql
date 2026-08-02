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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(20) NOT NULL,
    nationality character varying(20),
    year_of_birth integer
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy_description text,
    galaxy_type character varying(20),
    diameter_parsecs integer,
    distance_light_years integer,
    is_visible_naked_eye boolean,
    astronomer_id integer
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
    name character varying(20) NOT NULL,
    moon_description text,
    moon_type character varying(20),
    diameter_in_km numeric(10,2),
    age_in_billion_years numeric(6,2),
    has_life boolean,
    planet_id integer NOT NULL,
    astronomer_id integer
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
    name character varying(20) NOT NULL,
    planet_description text,
    planet_type character varying(20),
    diameter_in_km numeric(10,2),
    age_in_billion_years numeric(6,2),
    has_life boolean,
    star_id integer NOT NULL,
    astronomer_id integer
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
    name character varying(20) NOT NULL,
    star_description text,
    star_type character varying(20),
    diameter_in_km numeric(10,2),
    age_in_billion_years numeric(6,2),
    galaxy_id integer NOT NULL,
    astronomer_id integer
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
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


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
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'William Herschel', 'German', 1738);
INSERT INTO public.astronomer VALUES (2, 'Johann Galle', 'German', 1812);
INSERT INTO public.astronomer VALUES (3, 'Aleksander Wolszczan', 'Polish', 1946);
INSERT INTO public.astronomer VALUES (4, 'Michel Mayor', 'Swiss', 1942);
INSERT INTO public.astronomer VALUES (5, 'Galileo Galilei', 'Italian', 1564);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 30000, 0, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 'Spiral', 220000, 2537000, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third Local Group member', 'Spiral', 18740, 2878000, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting spiral galaxy', 'Spiral', 27000, 23000000, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 12', 'Spiral in Pisces', 'Spiral', 12528, 153293497, false, 1);
INSERT INTO public.galaxy VALUES (6, 'NGC 23', 'Barred spiral in Pegasus', 'Barred Spiral', 51500, 173500000, false, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 'The most volcanically active moon in the Solar System, orbiting Jupiter.', 'Rocky Moon', 3643.00, 4.50, false, 3, 5);
INSERT INTO public.moon VALUES (2, 'Europa', 'An icy moon believed to harbor a global subsurface ocean beneath its crust.', 'Icy Moon', 3122.00, 4.50, false, 3, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'The largest moon in the Solar System and the only moon known to have its own magnetic field.', 'Rocky Moon', 5268.00, 4.50, false, 3, 5);
INSERT INTO public.moon VALUES (4, 'Callisto', 'A heavily cratered moon with one of the oldest known surfaces in the Solar System.', 'Rocky Moon', 4821.00, 4.50, false, 3, 5);
INSERT INTO public.moon VALUES (5, 'Mimas', 'A small icy moon famous for its enormous Herschel crater.', 'Icy Moon', 396.00, 4.50, false, 10, 1);
INSERT INTO public.moon VALUES (6, 'Enceladus', 'An icy moon with water geysers that may indicate a subsurface ocean.', 'Icy Moon', 504.00, 4.50, false, 10, 1);
INSERT INTO public.moon VALUES (7, 'Titan', 'Saturn largest moon, featuring a dense atmosphere and liquid methane lakes.', 'Icy Moon', 5150.00, 4.50, false, 10, NULL);
INSERT INTO public.moon VALUES (8, 'Rhea', 'Saturn second-largest moon, composed mainly of water ice.', 'Icy Moon', 1528.00, 4.50, false, 10, NULL);
INSERT INTO public.moon VALUES (9, 'Dione', 'An icy moon with bright cliffs and evidence of past geological activity.', 'Icy Moon', 1123.00, 4.50, false, 10, NULL);
INSERT INTO public.moon VALUES (10, 'Tethys', 'An icy moon characterized by a massive impact crater and a long canyon.', 'Icy Moon', 1062.00, 4.50, false, 10, NULL);
INSERT INTO public.moon VALUES (11, 'Miranda', 'A small Uranian moon with dramatic cliffs and unusual surface features.', 'Icy Moon', 472.00, 4.50, false, 4, NULL);
INSERT INTO public.moon VALUES (12, 'Ariel', 'The brightest major moon of Uranus, showing signs of ancient tectonic activity.', 'Icy Moon', 1158.00, 4.50, false, 4, NULL);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'A dark icy moon with an ancient, heavily cratered surface.', 'Icy Moon', 1169.00, 4.50, false, 4, NULL);
INSERT INTO public.moon VALUES (14, 'Titania', 'The largest moon of Uranus, featuring extensive fault valleys and impact craters.', 'Icy Moon', 1578.00, 4.50, false, 4, NULL);
INSERT INTO public.moon VALUES (15, 'Oberon', 'The outermost major moon of Uranus with a heavily cratered icy surface.', 'Icy Moon', 1523.00, 4.50, false, 4, NULL);
INSERT INTO public.moon VALUES (16, 'Triton', 'Neptune largest moon, orbiting in a retrograde direction and exhibiting nitrogen geysers.', 'Icy Moon', 2707.00, 4.50, false, 12, NULL);
INSERT INTO public.moon VALUES (17, 'Proteus', 'An irregularly shaped moon of Neptune with a dark, cratered surface.', 'Irregular Moon', 420.00, 4.50, false, 12, NULL);
INSERT INTO public.moon VALUES (18, 'Nereid', 'A distant moon of Neptune with one of the most eccentric orbits of any large moon.', 'Irregular Moon', 340.00, 4.50, false, 12, NULL);
INSERT INTO public.moon VALUES (19, 'Phobos', 'The larger and closer of Mars two small irregular moons.', 'Irregular Moon', 22.53, 4.50, false, 2, NULL);
INSERT INTO public.moon VALUES (20, 'Deimos', 'The smaller and more distant moon of Mars with a smooth, dusty surface.', 'Irregular Moon', 12.40, 4.50, false, 2, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known world that supports life.', 'Terrestrial', 12742.00, 4.54, true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', 'A cold rocky planet known as the Red Planet with evidence of ancient water.', 'Terrestrial', 6779.00, 4.60, false, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the Solar System, composed primarily of hydrogen and helium.', 'Gas Giant', 139820.00, 4.60, false, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Uranus', 'An ice giant with a unique sideways rotation and a pale blue atmosphere.', 'Ice Giant', 50724.00, 4.50, false, 1, 1);
INSERT INTO public.planet VALUES (5, 'Pluto', 'A dwarf planet located in the Kuiper Belt beyond Neptune.', 'Dwarf Planet', 2377.00, 4.60, false, 1, NULL);
INSERT INTO public.planet VALUES (6, '51 Pegasi b', 'The first exoplanet discovered orbiting a Sun-like star, classified as a hot Jupiter.', 'Hot Jupiter', NULL, 6.10, false, 2, 4);
INSERT INTO public.planet VALUES (7, 'HD 17092 b', 'A giant exoplanet orbiting the evolved star HD 17092.', 'Gas Giant', NULL, 2.40, false, 3, 3);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 'A rocky exoplanet orbiting within the habitable zone of Proxima Centauri.', 'Rocky Exoplanet', NULL, 4.85, false, 4, NULL);
INSERT INTO public.planet VALUES (9, 'Venus', 'The hottest planet in the Solar System due to its dense carbon dioxide atmosphere.', 'Terrestrial', 12104.00, 4.50, false, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Saturn', 'A gas giant famous for its extensive and bright ring system.', 'Gas Giant', 116460.00, 4.50, false, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Mercury', 'The smallest and innermost planet in the Solar System.', 'Terrestrial', 4879.00, 4.50, false, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Neptune', 'The outermost planet in the Solar System and an ice giant with strong winds.', 'Ice Giant', 49244.00, 4.50, false, 1, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our solar system star', 'Yellow Dwarf', 1392700.00, 4.60, 1, NULL);
INSERT INTO public.star VALUES (2, '51 Pegasi', 'First star with exoplanet', 'Subgiant', 1552634.50, 6.10, 1, 4);
INSERT INTO public.star VALUES (3, 'HD 17092', 'K-type giant in Perseus', 'K Giant', 8820000.00, 6.00, 1, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Nearest star to Sun', 'Red Dwarf', 214538.00, 4.85, 1, NULL);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Brightest in triple system', 'Yellow Dwarf', 1702860.00, 5.30, 1, NULL);
INSERT INTO public.star VALUES (6, 'Sirius', 'Brightest star in night sky', 'White Main Seq', 2390000.00, 0.24, 1, NULL);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 5, true);


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
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


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
-- Name: galaxy galaxy_astronomer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_astronomer_id_fkey FOREIGN KEY (astronomer_id) REFERENCES public.astronomer(astronomer_id);


--
-- Name: moon moon_astronomer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_astronomer_id_fkey FOREIGN KEY (astronomer_id) REFERENCES public.astronomer(astronomer_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_astronomer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_astronomer_id_fkey FOREIGN KEY (astronomer_id) REFERENCES public.astronomer(astronomer_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_astronomer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_astronomer_id_fkey FOREIGN KEY (astronomer_id) REFERENCES public.astronomer(astronomer_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

