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

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    num_stars integer NOT NULL,
    has_black_hole boolean NOT NULL
);

ALTER TABLE public.galaxy OWNER TO freecodecamp;

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet numeric,
    is_habitable boolean NOT NULL,
    is_satellite boolean NOT NULL
);

ALTER TABLE public.moon OWNER TO freecodecamp;

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

CREATE TABLE public.moon_type (
    moon_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);

ALTER TABLE public.moon_type OWNER TO freecodecamp;

CREATE SEQUENCE public.moon_type_moon_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.moon_type_moon_type_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.moon_type_moon_type_id_seq OWNED BY public.moon_type.moon_type_id;

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer NOT NULL,
    num_moons integer NOT NULL,
    distance_from_star numeric,
    has_atmosphere boolean NOT NULL
);

ALTER TABLE public.planet OWNER TO freecodecamp;

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying,
    temperature numeric,
    is_visible boolean NOT NULL
);

ALTER TABLE public.star OWNER TO freecodecamp;

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

ALTER TABLE ONLY public.moon_type ALTER COLUMN moon_type_id SET DEFAULT nextval('public.moon_type_moon_type_id_seq'::regclass);

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 200, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 250, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small galaxy in Local Group', 50, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A grand-design spiral galaxy', 80, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Edge-on spiral galaxy', 30, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', 150, true);

INSERT INTO public.moon VALUES (1, 'Moon', 1, 0.00257, false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.00004, false, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 0.00007, false, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4, 0.00107, false, true);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 0.00067, false, true);
INSERT INTO public.moon VALUES (6, 'Titan', 5, 0.00817, false, true);
INSERT INTO public.moon VALUES (7, 'Enceladus', 5, 0.00159, false, true);
INSERT INTO public.moon VALUES (8, 'Triton', 6, 0.00237, false, true);
INSERT INTO public.moon VALUES (9, 'Charon', 9, 0.0019, false, true);
INSERT INTO public.moon VALUES (10, 'Io', 4, 0.00042, false, true);
INSERT INTO public.moon VALUES (11, 'Callisto', 4, 0.00188, false, true);
INSERT INTO public.moon VALUES (12, 'Phoebe', 7, 0.215, false, true);
INSERT INTO public.moon VALUES (13, 'Rhea', 5, 0.00352, false, true);
INSERT INTO public.moon VALUES (14, 'Oberon', 8, 0.0018, false, true);
INSERT INTO public.moon VALUES (15, 'Miranda', 6, 0.00014, false, true);
INSERT INTO public.moon VALUES (16, 'Dione', 5, 0.00252, false, true);
INSERT INTO public.moon VALUES (17, 'Hyperion', 5, 0.00494, false, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 8, 0.00128, false, true);
INSERT INTO public.moon VALUES (19, 'Umbriel', 8, 0.00127, false, true);
INSERT INTO public.moon VALUES (20, 'Larissa', 10, 0.00074, false, true);

INSERT INTO public.moon_type VALUES (1, 'Rocky', 'Moons with rocky surfaces and solid structures.');
INSERT INTO public.moon_type VALUES (2, 'Icy', 'Moons with icy surfaces, often containing water ice.');
INSERT INTO public.moon_type VALUES (3, 'Gas', 'Moons that are primarily composed of gas, such as those in gas giant planets.');

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, 1.5, true);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0, 0.7, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 2, 79, 5.2, true);
INSERT INTO public.planet VALUES (5, 'Saturn', 2, 82, 9.5, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 3, 14, 30.1, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 3, 27, 19.2, true);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 0, 0.4, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 4, 5, 39.5, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 5, 0, 0.36, true);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 6, 2, 0.146, true);
INSERT INTO public.planet VALUES (12, 'HD 209458b', 2, 0, 0.047, true);

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 2, 'G2V', 5790, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A1V', 9940, true);
INSERT INTO public.star VALUES (4, 'Vega', 3, 'A0V', 9602, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 4, 'M1I', 3600, true);
INSERT INTO public.star VALUES (6, 'Antares', 5, 'M1Iab', 3570, true);

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);

SELECT pg_catalog.setval('public.moon_type_moon_type_id_seq', 3, true);

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_name_key UNIQUE (name);

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_pkey PRIMARY KEY (moon_type_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


