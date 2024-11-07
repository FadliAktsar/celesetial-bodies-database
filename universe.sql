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
    galaxy_types character varying(60) NOT NULL,
    is_spherical boolean,
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
    planet_id integer,
    name character varying(60) NOT NULL,
    age_in_millions_of_years numeric,
    description text,
    year_discovered integer
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
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    observation_date date NOT NULL
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(60) NOT NULL,
    planet_types character varying(60) NOT NULL,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    year_discovered integer,
    distance_from_earth numeric
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 'Our galaxy, which has spiral arms and is home to our solar system');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, 'The closest galaxy to the Milky Way and part of the local group');
INSERT INTO public.galaxy VALUES (3, 'Tringulum Galaxy (M33)', 'Spiral', true, 'A small spiral galaxy also included in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy (M104)', 'Spiral', true, 'A spiral galaxy with a large bulge resembling a sombrero hat');
INSERT INTO public.galaxy VALUES (5, 'Whirpool Galaxy (M51)', 'Spiral', true, 'A spiral galaxy with beautifully interwined arms');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Ellips', false, 'A large elliptical galaxy known for its central activity');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 5, 'Io', 4500000000, 'Volcanic activity on this Jovian moon is so abundant, it resurfaces the face of Io with new deposits faster than comets, and asteroids can pepper it with large craters.', 1610);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 20000000000, 'There is strong evidence Jupiters moon Europa has a saltwater ocean that may be one of the best places to look for environments where life could exist beyond Earth.', 1610);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 4500000000, 'The largest moon in the solar system, this icy world is the only moon to have its own magnetic field and the atmospheric auroras that come with that.', 1610);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 4500000000, 'Callisto is the most heavily cratered object in our solar system.', 1610);
INSERT INTO public.moon VALUES (1, 3, 'The Moon', 4460000000, 'From lighting up our skies to maintaining a geological record of our solar system’s history, Earth’s closest celestial neighbor plays a pivotal role in the study of our planet and our solar system.', 1609);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 200000000, 'Phobos is the larger of Mars two moons. It orbits Mars three times a day, and is so close to the planets surface that in some locations on Mars it cannot always be seen.', 1877);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 200000000, 'Deimos is th', 1877);
INSERT INTO public.moon VALUES (8, 6, 'Mimas', 2500000000, 'It is very bright, reflecting more than 80 percent of sunlight falling on it. Mimas is believed to be coated with fresh ice particles from the E ring, which originates in the active plumes of Enceladus. Its surface is bright and heavily marked with deep, bowl-shaped impact craters.', 1789);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 1000000000, 'Geysers venting from Saturn moon Enceladus give clues that its subsurface saltwater ocean could be a possible habitat for life.', 1789);
INSERT INTO public.moon VALUES (10, 6, 'Tethys', 4400000000, 'Tethys has a diameter of 1,066 km (662 miles), and its density of about 1.0 grams per cubic cmÃ¢?"the same as that of waterÃ¢?"indicates that it is composed essentially of pure water ice.', 1684);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 4000000000, 'Dione is a small moon of 349 miles (562 km) in mean radius orbiting Saturn every 2.7 days at a distance of 234,500 miles (377,400 km), which is roughly the same distance that our Moon orbits Earth.', 1684);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 450000000, 'Rhea is the second largest moon of Saturn, but with a mean radius of 475 miles (764 kilometers) it is less than a third the radius of Saturn largest moon, Titan.', 1672);
INSERT INTO public.moon VALUES (13, 6, 'Titan', 1000000000, 'Saturn largest moon, Titan has an earthlike cycle of liquids flowing across its surface. It is the only moon with a thick atmosphere.', 1655);
INSERT INTO public.moon VALUES (14, 6, 'Hyperion', 4400000000, 'Hyperion is the largest of Saturn irregular, nonspherical moons.', 1848);
INSERT INTO public.moon VALUES (15, 6, 'Iapetus', 4400000000, 'Hyperion is the largest of Saturn irregular, nonspherical moons.', 1671);
INSERT INTO public.moon VALUES (16, 6, 'Pheobe', 3000000, 'Hyperion is the largest of Saturn irregular, nonspherical moons.', 1898);
INSERT INTO public.moon VALUES (17, 6, 'Janus', 3000000, 'Hyperion is the largest of Saturn irregular, nonspherical moons.', 1966);
INSERT INTO public.moon VALUES (18, 6, 'Epithemus', 3000000, 'Hyperion is the largest of Saturn irregular, nonspherical moons.', 1977);
INSERT INTO public.moon VALUES (19, 6, 'Helene', 3000000, 'Hyperion is the largest of Saturn irregular, nonspherical moons.', 1980);
INSERT INTO public.moon VALUES (20, 6, 'Telesto', 3000000, 'Hyperion is the largest of Saturn irregular, nonspherical moons.', 1980);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (1, 'Andromeda', '2023-01-15');
INSERT INTO public.observation VALUES (2, 'Alpha Centauri', '2022-11-02');
INSERT INTO public.observation VALUES (3, 'Mars', '2021-05-22');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Merkurius', 'Terrestrial', false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', false);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', false);
INSERT INTO public.planet VALUES (6, 1, 'Saturnus', 'Gas Giant', false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', false);
INSERT INTO public.planet VALUES (8, 1, 'Neptunus', 'Ice Giant', false);
INSERT INTO public.planet VALUES (9, 2, 'Kepler-22b', 'Exoplanet', false);
INSERT INTO public.planet VALUES (10, 3, 'Proxima b', 'Exoplanet', false);
INSERT INTO public.planet VALUES (11, 4, 'HD 209458 b', 'Hot Jupiter', false);
INSERT INTO public.planet VALUES (12, 5, 'Gliese 581g', 'Exoplanet', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', NULL, 0);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 1862, 8.370045208990435);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri', 1839, 3.9259386007692);
INSERT INTO public.star VALUES (4, 1, 'Betelguese', 1836, 642.1986705590544);
INSERT INTO public.star VALUES (5, 1, 'Vega', 1850, 25.02265608280089);
INSERT INTO public.star VALUES (6, 1, 'Rigel', 1781, 859.8736693721206);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: observation observation_object_observed_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_object_observed_key UNIQUE (name);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


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

