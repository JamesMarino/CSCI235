SET ECHO ON;
SPOOL task2.lst;

-- 1. add information about a manager of each project, assume that information 
-- about all managers must be included in a relational table EMPLOYEE,
ALTER TABLE PROJECT
  ADD MANAGER# NUMBER(4);

-- 2. add information about the hobbies possessed by the employees; an employee
-- possesses one or more hobbies, and a hobby is possessed by zero or more employees
CREATE TABLE HOBBIES(
  H# INTEGER NOT NULL,
  HobbyName VARCHAR(70) NOT NULL,
  
  CONSTRAINT HobbiesPKey1 PRIMARY KEY (H#)
);

CREATE TABLE EMPLOYEEHOBBIES(
  H# INTEGER NOT NULL,
  E# NUMBER(4) NOT NULL,
  
  CONSTRAINT EmployeeHobbiesPKey1 PRIMARY KEY (H#, E#),
  
  FOREIGN KEY(H#) REFERENCES HOBBIES(H#),
  FOREIGN KEY(E#) REFERENCES EMPLOYEE(E#)
);

-- 3. remove information about the budgets of departments.
ALTER TABLE DEPARTMENT DROP COLUMN BUDGET;

SPOOL OFF;
