-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id TEXT NOT NULL,
  moons_id TEXT[]
);

CREATE TABLE orbits_around  
(
  id SERIAL PRIMARY KEY,
  orbits_around TEXT NOT NULL,
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL,
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT[],
);

INSERT INTO planets
  (planet_name, orbital_period_in_years)
VALUES
  ('Earth', 1.00),
  ('Mars', 1.88),
  ('Venus', 0.62),
  ('Neptune', 164.8),
  ('Proxima Centauri b', 0.03),
  ('Gliese 876 b', 0.23);

INSERT INTO orbits_around
  (orbits_around_star)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO galaxy
  (galaxy_name)
VALUES
  ('Milky Way'),
  ('Proxima Centauri'),
  ('Gliese 876');

INSERT INTO moons
  (moon_name)
VALUES
  ('The Moon'),
  ('Phobos', 'Deimos'),
  ('Naiad', 'Thalassa', 'Despina', 'Galatea', 'Larissa', 'S/2004 N 1', 'Proteus', 'Triton', 'Nereid', 'Halimede', 'Sao', 'Laomedeia', 'Psamathe', 'Neso'),
  