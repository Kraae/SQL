-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  home_team_id TEXT NOT NULL,
  away_team_id TEXT NOT NULL,
  match_location TEXT NOT NULL,
  match_date TEXT NOT NULL,
  start_time TEXT NOT NULL,
  season_id TEXT NOT NULL,
  head_referee_id TEXT NOT NULL,
  assistant_referee_id TEXT NOT NULL,
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  match_id TEXT NOT NULL,
  player_id TEXT NOT NULL,
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name_category TEXT NOT NULL,
  current_team TEXT NOT NULL,
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name_referees TEXT NOT NULL,
);

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name_teams TEXT NOT NULL,
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  initial_date TEXT NOT NULL,
  final_date TEXT NOT NULL,
);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  team_id TEXT, ON DELETE SET NULL,
  match_id TEXT, ON DELETE SET NULL,
  result TEXT NOT NULL,
);

CREATE TABLE Line_Up
(
  id SERIAL PRIMARY KEY,
  team_id TEXT, ON DELETE SET NULL,
  match_id TEXT, ON DELETE SET NULL,
  player_id TEXT NOT NULL, 
);

INSERT INTO matches
  (home_team_id, away_team_id, match_location, match_date, start_time, season_id, head_referee_id, assistant_referee)
VALUES
  ('home_team_id_1', 'away_team_id_1', 'match_location_1', 'match_date_1', 'start_time_1', 'head_referee_id_1', 'assistant_referee_1'),
  ('home_team_id_2', 'away_team_id_2', 'match_location_2', 'match_date_2', 'start_time_2', 'head_referee_id_2', 'assistant_referee_2'),
  ('home_team_id_3', 'away_team_id_3', 'match_location_3', 'match_date_3', 'start_time_3', 'head_referee_id_3', 'assistant_referee_3'),
  
INSERT INTO goals
  (match_id, player_id)
VALUES
  ('match_id_1', 'player_id_1'),
  ('match_id_2', 'player_id_2'),
  ('match_id_3', 'player_id_3'),
 
INSERT INTO players
  (name_category, current_team)
VALUES
  ('name_category_1', 'current_team_1'),
  ('name_category_2', 'current_team_2'),
  ('name_category_3', 'current_team_3'),
 
 
INSERT INTO referees
  (name_referees)
VALUES
  ('name_referees_1'),
  ('name_referees_2'),
  ('name_referees_3'),

INSERT INTO teams
  (name_teams)
VALUES
  ('name_teams_1'),
  ('name_teams_2'),
  ('name_teams_3'),
  
INSERT INTO seasons
  (initial_date, final_date)
VALUES
  ('initial_date_1', 'final_date_1'),
  ('initial_date_2', 'final_date_2'),
  ('initial_date_3', 'final_date_3'),

INSERT INTO results
  (team_id, match_id, result)
VALUES
  ('team_id_1', 'match_id_1', 'result_1'),
  ('team_id_2', 'match_id_2', 'result_2'),
  ('team_id_3', 'match_id_3', 'result_3'),

INSERT INTO results
  (team_id, match_id, player_id)
VALUES
  ('team_id_1', 'match_id_1', 'player_id_1'),
  ('team_id_2', 'match_id_2', 'player_id_2'),
  ('team_id_3', 'match_id_3', 'player_id_3'),