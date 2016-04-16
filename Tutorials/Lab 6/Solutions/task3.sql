SET ECHO ON;
SPOOL task3.lst;

SET LINESIZE 		1000
SET PAGESIZE 		1000

-- Question 1
CREATE TABLE TOTAPPS(
  ApplicantNumber NUMBER(5) ,
  TotalApplications NUMBER(20)
);

INSERT INTO TOTAPPS (ApplicantNumber, TotalApplications)
  SELECT APPLIES.A# AS ApplicantNumber, COUNT(APPLIES.A#) AS TotalApplications FROM APPLIES GROUP BY APPLIES.A#;

-- Question 2
UPDATE POSITION SET SALARY = (SALARY + (0.1*SALARY)) WHERE NOT EXISTS (
  SELECT APPLIES.P# FROM APPLIES WHERE POSITION.P# = APPLIES.P#
);

-- Question 3
DELETE FROM APPLICANT WHERE NOT EXISTS (
  SELECT A# FROM APPLIES WHERE APPLIES.A# = APPLICANT.A#
);

SPOOL OFF;
