-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Doctors
(
  id SERIAL PRIMARY KEY,
  doctor_name TEXT NOT NULL,
  specialty TEXT NOT NULL,
  npi_number VARCHAR(10) UNIQUE NOT NULL,
);

CREATE TABLE Visits
(
  id SERIAL PRIMARY KEY,
  doctor_id REFERENCES Doctors(id) ON DELETE CASCADE,
  patient_id REFERENCES Patients(id) ON DELETE CASCADE,
  date 
);

CREATE TABLE Patients 
(
  id SERIAL PRIMARY KEY,
  patient_name TEXT NOT NULL,
  insurance TEXT NOT NULL,
  birthday TEXT NOT NULL,
);

CREATE TABLE Diseases
(
  id SERIAL PRIMARY KEY,
  disease_name INTEGER REFERENCES users ON DELETE SET NULL,
  disease_description name VARCHAR(15) NOT NULL, description TEXT,
);

CREATE TABLE Diagnoses
(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES users ON DELETE SET NULL,
  disease_id 
  notes BOOLEAN DEFAULT false
);

INSERT INTO Doctors
  (id, doctor_name, specialty, npi_number)
VALUES
  (John Smith, 'Oncologist', '9875637826'),
  (Anthony Perez, 'Internalist', '9576346926'),
  (Vera Abaaba, 'Hospitalist', '4532678134'),

INSERT INTO Visits
  (id, doctor_id, patient_id, date)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

INSERT INTO Patients
  (id, patient_name, insurance, birthday)
VALUES
  ('Sohpia', Medicaid, '01/02/1988'),
  ('Tony', Humana, '02/03/1982'),
  ('Mick', Molenta, '05/14/1952'),

INSERT INTO Diseases
  (id, disease_name, disease_description)
VALUES
  ('Osteoporosis', 'when bone mineral density and bone mass decreases, or when the quality or structure of bone changes'),
  ('cholelithiasis', 'hard, pebble-like pieces of material, usually made of cholesterol or bilirubin, that develop in your gallbladder'),
  ('Gestational diabetes', 'a type of diabetes that can develop during pregnancy in women who dont already have diabetes'),


INSERT INTO Diagnoses
  (id, visit_id, disease_id, notes)
VALUES
  ('visit_id', 'disease_id','notes_1'),
  ('visit_id', 'disease_id','notes_2'),
  ('visit_id', 'disease_id','notes_3'),
 
