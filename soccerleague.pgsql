DROP DATABASE soccerleague_db;
CREATE DATABASE soccerleague_db;
\c soccerleague_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    goals_scored INTEGER
);

CREATE TABLE players_teams (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team_1 INTEGER REFERENCES teams NOT NULL,
    team_2 INTEGER REFERENCES teams NOT NULL,
    ref TEXT NOT NULL
);

CREATE TABLE league_dates (
    id SERIAL PRIMARY KEY,
    season TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);