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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(32) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (169, 2018, 'Final', 4, 2, 69, 60);
INSERT INTO public.games VALUES (170, 2018, 'Third Place', 2, 0, 51, 53);
INSERT INTO public.games VALUES (171, 2018, 'Semi-Final', 2, 1, 60, 53);
INSERT INTO public.games VALUES (172, 2018, 'Semi-Final', 1, 0, 69, 51);
INSERT INTO public.games VALUES (173, 2018, 'Quarter-Final', 3, 2, 60, 55);
INSERT INTO public.games VALUES (174, 2018, 'Quarter-Final', 2, 0, 53, 62);
INSERT INTO public.games VALUES (175, 2018, 'Quarter-Final', 2, 1, 51, 56);
INSERT INTO public.games VALUES (176, 2018, 'Quarter-Final', 2, 0, 69, 52);
INSERT INTO public.games VALUES (177, 2018, 'Eighth-Final', 2, 1, 53, 50);
INSERT INTO public.games VALUES (178, 2018, 'Eighth-Final', 1, 0, 62, 59);
INSERT INTO public.games VALUES (179, 2018, 'Eighth-Final', 3, 2, 51, 67);
INSERT INTO public.games VALUES (180, 2018, 'Eighth-Final', 2, 0, 56, 68);
INSERT INTO public.games VALUES (181, 2018, 'Eighth-Final', 2, 1, 60, 72);
INSERT INTO public.games VALUES (182, 2018, 'Eighth-Final', 2, 1, 55, 71);
INSERT INTO public.games VALUES (183, 2018, 'Eighth-Final', 2, 1, 52, 49);
INSERT INTO public.games VALUES (184, 2018, 'Eighth-Final', 4, 3, 69, 58);
INSERT INTO public.games VALUES (185, 2014, 'Final', 1, 0, 65, 58);
INSERT INTO public.games VALUES (186, 2014, 'Third Place', 3, 0, 70, 56);
INSERT INTO public.games VALUES (187, 2014, 'Semi-Final', 1, 0, 58, 70);
INSERT INTO public.games VALUES (188, 2014, 'Semi-Final', 7, 1, 65, 56);
INSERT INTO public.games VALUES (189, 2014, 'Quarter-Final', 1, 0, 70, 61);
INSERT INTO public.games VALUES (190, 2014, 'Quarter-Final', 1, 0, 58, 51);
INSERT INTO public.games VALUES (191, 2014, 'Quarter-Final', 2, 1, 56, 50);
INSERT INTO public.games VALUES (192, 2014, 'Quarter-Final', 1, 0, 65, 69);
INSERT INTO public.games VALUES (193, 2014, 'Eighth-Final', 2, 1, 56, 54);
INSERT INTO public.games VALUES (194, 2014, 'Eighth-Final', 2, 0, 50, 52);
INSERT INTO public.games VALUES (195, 2014, 'Eighth-Final', 2, 0, 69, 64);
INSERT INTO public.games VALUES (196, 2014, 'Eighth-Final', 2, 1, 65, 63);
INSERT INTO public.games VALUES (197, 2014, 'Eighth-Final', 2, 1, 70, 68);
INSERT INTO public.games VALUES (198, 2014, 'Eighth-Final', 2, 1, 61, 66);
INSERT INTO public.games VALUES (199, 2014, 'Eighth-Final', 1, 0, 58, 59);
INSERT INTO public.games VALUES (200, 2014, 'Eighth-Final', 2, 1, 51, 57);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (49, 'Portugal');
INSERT INTO public.teams VALUES (50, 'Colombia');
INSERT INTO public.teams VALUES (51, 'Belgium');
INSERT INTO public.teams VALUES (52, 'Uruguay');
INSERT INTO public.teams VALUES (53, 'England');
INSERT INTO public.teams VALUES (54, 'Chile');
INSERT INTO public.teams VALUES (55, 'Russia');
INSERT INTO public.teams VALUES (56, 'Brazil');
INSERT INTO public.teams VALUES (57, 'United States');
INSERT INTO public.teams VALUES (58, 'Argentina');
INSERT INTO public.teams VALUES (59, 'Switzerland');
INSERT INTO public.teams VALUES (60, 'Croatia');
INSERT INTO public.teams VALUES (61, 'Costa Rica');
INSERT INTO public.teams VALUES (62, 'Sweden');
INSERT INTO public.teams VALUES (63, 'Algeria');
INSERT INTO public.teams VALUES (64, 'Nigeria');
INSERT INTO public.teams VALUES (65, 'Germany');
INSERT INTO public.teams VALUES (66, 'Greece');
INSERT INTO public.teams VALUES (67, 'Japan');
INSERT INTO public.teams VALUES (68, 'Mexico');
INSERT INTO public.teams VALUES (69, 'France');
INSERT INTO public.teams VALUES (70, 'Netherlands');
INSERT INTO public.teams VALUES (71, 'Spain');
INSERT INTO public.teams VALUES (72, 'Denmark');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 200, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 72, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams team_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT team_unq UNIQUE (team_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id, name);


--
-- Name: games fk_teamid; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_teamid FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_teamidop; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_teamidop FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

