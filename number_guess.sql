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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer NOT NULL,
    tries integer NOT NULL
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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (28, 19, 738);
INSERT INTO public.games VALUES (29, 20, 191);
INSERT INTO public.games VALUES (30, 19, 816);
INSERT INTO public.games VALUES (31, 19, 86);
INSERT INTO public.games VALUES (32, 19, 952);
INSERT INTO public.games VALUES (33, 23, 920);
INSERT INTO public.games VALUES (34, 24, 626);
INSERT INTO public.games VALUES (35, 23, 312);
INSERT INTO public.games VALUES (36, 23, 41);
INSERT INTO public.games VALUES (37, 23, 850);
INSERT INTO public.games VALUES (38, 26, 956);
INSERT INTO public.games VALUES (39, 26, 788);
INSERT INTO public.games VALUES (40, 27, 759);
INSERT INTO public.games VALUES (41, 27, 727);
INSERT INTO public.games VALUES (42, 26, 973);
INSERT INTO public.games VALUES (43, 26, 81);
INSERT INTO public.games VALUES (44, 26, 451);
INSERT INTO public.games VALUES (45, 28, 7);
INSERT INTO public.games VALUES (46, 29, 184);
INSERT INTO public.games VALUES (47, 29, 476);
INSERT INTO public.games VALUES (48, 30, 498);
INSERT INTO public.games VALUES (49, 30, 345);
INSERT INTO public.games VALUES (50, 29, 741);
INSERT INTO public.games VALUES (51, 29, 798);
INSERT INTO public.games VALUES (52, 29, 366);
INSERT INTO public.games VALUES (53, 28, 18);
INSERT INTO public.games VALUES (54, 31, 646);
INSERT INTO public.games VALUES (55, 31, 741);
INSERT INTO public.games VALUES (56, 32, 523);
INSERT INTO public.games VALUES (57, 32, 677);
INSERT INTO public.games VALUES (58, 31, 633);
INSERT INTO public.games VALUES (59, 31, 1001);
INSERT INTO public.games VALUES (60, 31, 343);
INSERT INTO public.games VALUES (61, 33, 673);
INSERT INTO public.games VALUES (62, 33, 422);
INSERT INTO public.games VALUES (63, 34, 679);
INSERT INTO public.games VALUES (64, 34, 659);
INSERT INTO public.games VALUES (65, 33, 288);
INSERT INTO public.games VALUES (66, 33, 846);
INSERT INTO public.games VALUES (67, 33, 823);
INSERT INTO public.games VALUES (68, 35, 897);
INSERT INTO public.games VALUES (69, 35, 890);
INSERT INTO public.games VALUES (70, 36, 690);
INSERT INTO public.games VALUES (71, 36, 853);
INSERT INTO public.games VALUES (72, 35, 244);
INSERT INTO public.games VALUES (73, 35, 719);
INSERT INTO public.games VALUES (74, 35, 886);
INSERT INTO public.games VALUES (75, 37, 569);
INSERT INTO public.games VALUES (76, 37, 563);
INSERT INTO public.games VALUES (77, 38, 196);
INSERT INTO public.games VALUES (78, 38, 863);
INSERT INTO public.games VALUES (79, 37, 997);
INSERT INTO public.games VALUES (80, 37, 756);
INSERT INTO public.games VALUES (81, 37, 375);
INSERT INTO public.games VALUES (82, 39, 582);
INSERT INTO public.games VALUES (83, 39, 425);
INSERT INTO public.games VALUES (84, 40, 735);
INSERT INTO public.games VALUES (85, 40, 69);
INSERT INTO public.games VALUES (86, 39, 272);
INSERT INTO public.games VALUES (87, 39, 292);
INSERT INTO public.games VALUES (88, 39, 597);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (19, 'user_1667011704728');
INSERT INTO public.user_info VALUES (20, 'user_1667011704727');
INSERT INTO public.user_info VALUES (21, 'user_1667011876139');
INSERT INTO public.user_info VALUES (22, 'user_1667011876138');
INSERT INTO public.user_info VALUES (23, 'user_1667012751902');
INSERT INTO public.user_info VALUES (24, 'user_1667012751901');
INSERT INTO public.user_info VALUES (26, 'user_1667012998872');
INSERT INTO public.user_info VALUES (27, 'user_1667012998871');
INSERT INTO public.user_info VALUES (28, 'user_1667011876140');
INSERT INTO public.user_info VALUES (29, 'user_1667013145082');
INSERT INTO public.user_info VALUES (30, 'user_1667013145081');
INSERT INTO public.user_info VALUES (31, 'user_1667013321692');
INSERT INTO public.user_info VALUES (32, 'user_1667013321691');
INSERT INTO public.user_info VALUES (33, 'user_1667013337460');
INSERT INTO public.user_info VALUES (34, 'user_1667013337459');
INSERT INTO public.user_info VALUES (35, 'user_1667013375716');
INSERT INTO public.user_info VALUES (36, 'user_1667013375715');
INSERT INTO public.user_info VALUES (37, 'user_1667013413072');
INSERT INTO public.user_info VALUES (38, 'user_1667013413071');
INSERT INTO public.user_info VALUES (39, 'user_1667013423878');
INSERT INTO public.user_info VALUES (40, 'user_1667013423877');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 88, true);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 40, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: user_info user_info_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id);


--
-- PostgreSQL database dump complete
--

