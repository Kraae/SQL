-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists_id TEXT[] NOT NULL,
  album TEXT NOT NULL,
  producers_id TEXT[] NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artists_name TEXT[] NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producers_name TEXT[] NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, release_date, album)
VALUES
  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013', 'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing''s on the Wall');

INSERT INTO artists
  (artists_name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary', 'Boyz II Men'),
  ('Lady Gaga', 'Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z', 'Alicia Keys'),
  ('Katy Perry', 'Juicy J'),
  ('Maroon 5', 'Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

  INSERT INTO producers
  (producers_name)
VALUES
  ('Dust Brothers', 'Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin', 'Cirkut'),
  ('Shellback', 'Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');