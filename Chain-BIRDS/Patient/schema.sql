-- 只是在开发测试的时候需要使用下面的DROP语句
DROP VIEW IF EXISTS d13_patianddoct CASCADE;
DROP TABLE IF EXISTS d1_patient;

CREATE TABLE d1_patient
(
  patientID int NOT NULL PRIMARY KEY,
  medicationName VARCHAR NOT NULL,
  clinicalData VARCHAR,
  address VARCHAR,
  dosage VARCHAR NOT NULL
);

INSERT INTO d1_patient VALUES
(188, 'Ibuprofen', 'CLiD1', 'Sapporo','one tablet every 4h');

-- CREATE VIEW d13_patianddoct AS
-- SELECT patientID, medicationName, clinicalData, dosage
-- FROM d1_patient;

-- SELECT * FROM d1_patient;
-- SELECT * FROM d13_patianddoct;
