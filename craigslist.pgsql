DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES region ON DELETE SET NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE SET NULL,
    title TEXT,
    body TEXT NOT NULL,
    category TEXT NOT NULL,
    location_id INTEGER REFERENCES location ON DELETE SET NULL,
    region_id INTEGER REFERENCES region ON DELETE SET NULL
);