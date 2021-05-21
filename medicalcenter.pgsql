DROP DATABASE medicalcenter_db;
CREATE DATABASE medicalcenter_db;
\c medicalcenter_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_num INTEGER NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_number INTEGER NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE doctors_to_patients (
    id SERIAL PRIMARY KEY,
    doc_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    pt_id INTEGER
);

CREATE TABLE patient_diagnoses (
    id SERIAL PRIMARY KEY,
    pt_id INTEGER REFERENCES patients ON DELETE CASCADE,
    diagnosis_id INTEGER
)