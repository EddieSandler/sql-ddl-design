
-- in terminal:
-- psql < ddl.sql
-- psql medical_center

DROP DATABASE IF EXISTS  medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE physician
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialty TEXT NOT NULL
);

CREATE TABLE patient
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER


);

CREATE TABLE diagnosis
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL

);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  date DATE,
  physician_id INTEGER REFERENCES physician ON DELETE CASCADE,
  patient_id INTEGER REFERENCES patient ON DELETE CASCADE,
  diagnosis_id INTEGER REFERENCES diagnosis ON DELETE CASCADE
);

INSERT INTO physician
  (name, specialty)
VALUES
  ('Marcus Welby MD', 'Cardiology'),
  ('Doogie Houser MD', 'Obstetrics'),
  ('Greg House MD', 'Infectuous Disease');


INSERT INTO patient
  (name,age)
VALUES
  ('Jane Smith', 32),
  ('John Doe', 25),
  ('Mary Johnson', 28);


INSERT INTO diagnosis
  (name)
VALUES
  ('Pregnancy'),
  ('COVID 19'),
  ('Irregular Heartbeat'),
  ('COVID 19'),
  ('Chlamydia'),
  ('Gonorrhea'),
  ('UTI');


INSERT INTO visits
  (date,physician_id, patient_id, diagnosis_id)
VALUES
('11/7/2023',3,2,4),
('11/7/2023',3,2,5),
('11/7/2023',3,2,6),
('11/9/2023',2,3,1),
('11/10/2023',1,1,1),
('11/11/2023',1,2,2),
('11/12/2023',1,3,2);


--Q1 What are all of the visits and  diagnoses for John Doe?--
SELECT patient_name,diagnosis,visits.date FROM patient
JOIN visits ON patient.id=visits.patient_id
JOIN diagnosis ON visits.diagnosis_id=diagnosis.id
WHERE patient_name='John Doe';




--Q2 Which physician has  the most patient visits?--
SELECT name, COUNT (physician_id) as appt_count
from physician
JOIN visits ON physician.id=visits.physician_id
GROUP BY physician.id ORDER BY appt_count desc limit 1
;

--Q3 When did Poor Charlie visit the doctor? who was the doctor?
SELECT physician.name,visits.date from visits
JOIN physician ON visits.physician_id=physician.id
JOIN patient ON visits.patient_id=patient.id
WHERE patient.patient_name='Poor Charlie';


