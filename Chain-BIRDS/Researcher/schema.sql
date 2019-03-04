-- 只是在开发测试的时候需要使用下面的DROP语句
DROP VIEW IF EXISTS d23_researanddoc CASCADE;
DROP TABLE IF EXISTS d2_researcher;

CREATE TABLE d2_researcher
(
  medicationName VARCHAR NOT NULL PRIMARY KEY,
  mechanismOfAction VARCHAR,
  modeOfAction VARCHAR,
  sharedWithDoctorOrNot VARCHAR
);

INSERT INTO d2_researcher VALUES
('Ibuprofen', 'MeA1', 'MoA1', 'Yes'),
('Wellbutrin', 'MeA2', 'MoA2', 'Yes'),
('Codeine','MeA3', 'MoA3', 'No');

-- SELECT * FROM d2_researcher;
-- SELECT * FROM d23_researanddoc;
