-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets ON DELETE CASCADE,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL
);

INSERT INTO planets
  (name, galaxy, moons)
VALUES
  ('Earth', 'Milky Way', '{"The Moon"}'),
  ('Mars', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 'Milky Way', '{}'),
  ('Neptune', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 'Milky Way', '{}'),
  ('Gliese 876 b', 'Milky Way', '{}');

INSERT INTO orbits
  (orbital_period_in_years, orbits_around)
VALUES
(1.00, 'The Sun'),
(1.88, 'The Sun'),
(0.62, 'The Sun'),
(164.8, 'The Sun'),
(0.03, 'Proxima Centauri'),
(0.23, 'Gliese 876');