-- 只是在开发测试的时候需要使用下面的DROP语句
-- DROP VIEW IF EXISTS d32_doctandresear ;
-- DROP VIEW IF EXISTS d31_doctandpati ;
-- DROP TABLE IF EXISTS d3_doctor;

CREATE TABLE d3_doctor
(
  patientID int NOT NULL,
  medicationName VARCHAR NOT NULL,
  clinicalData VARCHAR,
  mechanismOfAction VARCHAR,
  dosage VARCHAR NOT NULL
);

-- latestModifiedState value is one of these:
-- 'unchanged medicine', 'inserted medicine', 'deleted medicine', 'updated medicine'

INSERT INTO d3_doctor VALUES
(188, 'Ibuprofen', 'CLiD1', 'MeA1','one tablet every 4h'),
(189, 'Wellbutrin', 'CLiD2', 'MeA2','100 mg twice daily');

-- SELECT * FROM d3_doctor;
-- SELECT * FROM d31_doctandpati;
-- SELECT * FROM d32_doctandresear;
