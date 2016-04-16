SET ECHO ON;
SPOOL a2task1.lst;

SET LINESIZE 300;

/*
 * Task 1
 */
 
---------------
-- Task 1.1. --
---------------
ALTER TABLE DEPARTMENT ADD CONSTRAINT FK_DepartmentManager
  FOREIGN KEY (MANAGER#) REFERENCES EMPLOYEE(E#);

-- Diable foreign key in order to insert
ALTER TABLE DEPARTMENT DISABLE CONSTRAINT FK_DepartmentManager;

INSERT INTO DEPARTMENT VALUES (
  6,
  'Research Centre',
  '00271',
  TO_DATE('01/06/2016', 'DD/MM/YYYY')
);

INSERT INTO DEPTLOCATION VALUES (
  6,
  '3 Renovation campus, North Wollongong, NSW 2500'
);

INSERT INTO EMPLOYEE VALUES (
  '00271',
  'Garret',
  TO_DATE('10/04/1980', 'DD/MM/YYYY'),
  '13 Hindmarsh Ave, North Wollongong, NSW 2500',
  'M',
  '125.2',
  '00100',
  6
);

ALTER TABLE DEPARTMENT ENABLE CONSTRAINT FK_DepartmentManager;

---------------
-- Task 1.2. --
---------------

ALTER TABLE WORKSON ADD CONSTRAINT
  WorksOnCheckHours CHECK (HOURS <= 30);
  
---------------
-- Task 1.3. --
---------------

ALTER TABLE PROJECT MODIFY (
  PTITLE VARCHAR2(50)
);

---------------
-- Task 1.4. --
---------------

ALTER TABLE DEPARTMENT ADD TOTAL_STAFF_NUMBER NUMBER(5);

-- search employee number from department in employee table
UPDATE DEPARTMENT SET TOTAL_STAFF_NUMBER = (
  SELECT COUNT(*) FROM EMPLOYEE WHERE EMPLOYEE.D# = DEPARTMENT.D#
);

---------------
-- Task 1.5. --
---------------

UPDATE DEPTLOCATION SET D# = 3 WHERE D# = 5;
UPDATE EMPLOYEE SET D# = 3 WHERE D# = 5;
UPDATE PROJECT SET D# = 3 WHERE D# = 5;

DELETE FROM DEPARTMENT WHERE D# = 5;

UPDATE DEPARTMENT SET TOTAL_STAFF_NUMBER = (
  SELECT COUNT(*) FROM EMPLOYEE WHERE EMPLOYEE.D# = 3) WHERE DEPARTMENT.D# = 3;

---------------
-- Task 1.6. --
---------------

ALTER TABLE DEPENDENT DROP CONSTRAINT Dependent_CK;
ALTER TABLE DEPENDENT ADD CONSTRAINT Dependent_CK
  CHECK (Relationship IN ('SON', 'DAUGHTER', 'SPOUSE', 'MOTHER', 'FATHER', 'OTHER'));
  
---------------
-- Task 1.7. --
---------------

ACCEPT DEPARTMENT_NUMBER PROMPT 'Please enter a department number: ';

SELECT DEPARTMENT.DNAME, COUNT(PROJECT.P#) AS "Total Projects" FROM DEPARTMENT
  FULL JOIN PROJECT ON DEPARTMENT.D# = PROJECT.D# WHERE DEPARTMENT.D# = &DEPARTMENT_NUMBER
  GROUP BY DEPARTMENT.DNAME;

---------------
-- Task 1.8. --
---------------

ACCEPT PROJECT_NUMBER PROMPT 'Please enter a project number: ';
ACCEPT PROJECT_TITLE PROMPT 'Please enter a project title: ';
ACCEPT PROJECT_SPONSER PROMPT 'Please enter a sponsor: ';
ACCEPT PROJECT_DNUMBER PROMPT 'Please enter a department number: ';
ACCEPT PROJECT_BUDGET PROMPT 'Please enter a budget amount: ';

INSERT INTO PROJECT VALUES (
  &PROJECT_NUMBER,
  '&PROJECT_TITLE',
  '&PROJECT_SPONSER',
  &PROJECT_DNUMBER,
  &PROJECT_BUDGET
);

SPOOL OFF;
