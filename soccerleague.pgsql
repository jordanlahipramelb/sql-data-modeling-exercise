DROP DATABASE soccerleague_db;
CREATE DATABASE soccerleague_db;
\c soccerleague_db;

CREATE TABLE season_dates (
    id SERIAL PRIMARY KEY,
    season TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE players_teams (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    season_id INTEGER REFERENCES season_dates NOT NULL,
    home_team_id INTEGER REFERENCES teams NOT NULL,
    away_team_id INTEGER REFERENCES teams NOT NULL,
    ref1_id INTEGER REFERENCES referees NOT NULL,
    ref2_id INTEGER REFERENCES referees,
    ref3_id INTEGER REFERENCES referees,
    result TEXT NOT NULL
);

CREATE TABLE goals_each_game (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    player_id INTEGER REFERENCES players
);
