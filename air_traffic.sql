-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
)

CREATE TABLE departure_times (
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES FROM airlines ON DELETE CASCADE,
  departure TIMESTAMP NOT NULL,
  city_id INTEGER REFERENCES cities ON DELETE CASCADE,
  country_id INTEGER REFERENCES countries ON DELETE CASCADE
);

CREATE TABLE arrival_times (
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES FROM airlines ON DELETE CASCADE,
  arrival TIMESTAMP NOT NULL,
  city_id INTEGER REFERENCES cities ON DELETE CASCADE,
  country_id INTEGER REFERENCES countries ON DELETE CASCADE
);

INSERT INTO passengers
  (first_name, last_name, seat)
VALUES
  ('Jennifer', 'Finch', '33B'),
  ('Thadeus', 'Gathercoal', '8A'),
  ('Sonja', 'Pauley', '12F'),
  ('Jennifer', 'Finch', '20A'),
  ('Waneta', 'Skeleton', '23D'),
  ('Thadeus', 'Gathercoal', '18C'),
  ('Berkie', 'Wycliff', '9E'),
  ('Alvin', 'Leathes', '1A'),
  ('Berkie', 'Wycliff', '32B'),
  ('Cory', 'Squibbes', '10D');

INSERT INTO cities
  (name)
VALUES
  ('Washington DC'),
  ('Tokyo'),
  ('Los Angeles'),
  ('Seattle'),
  ('Paris'),
  ('Dubai'),
  ('New York'),
  ('Cedar Rapids'),
  ('Charlotte'),
  ('Sao Paolo')
  ('London'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Casablanca'),
  ('Beijing'),
  ('Chicago'),
  ('New Orleans'),
  ('Santiago');

INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO airlines
  (name)
VALUES
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'
  'United'),
  ('American Airlines'),
  ('Avianca Brasil');

-- INSERT INTO tickets
--   (departure, arrival)
-- VALUES
--   ('2018-04-08 09:00:00', '2018-04-08 12:00:00')
--   ('2018-12-19 12:45:00', '2018-12-19 16:15:00')
--   ('2018-01-02 07:00:00', '2018-01-02 08:03:00')
--   ('2018-04-15 16:50:00', '2018-04-15 21:00:00')
--   ('2018-08-01 18:30:00', '2018-08-01 21:50:00')
--   ('2018-10-31 01:15:00', '2018-10-31 12:55:00')
--   ('2019-02-06 06:00:00', '2019-02-06 07:47:00')
--   ('2018-12-22 14:42:00', '2018-12-22 15:56:00')
--   ('2019-02-06 16:28:00', '2019-02-06 19:18:00')
--   ('2019-01-20 19:30:00', '2019-01-20 22:45:00')

