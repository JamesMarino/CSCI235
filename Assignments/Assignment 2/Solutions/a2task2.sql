SET ECHO ON;
SPOOL a2task2.lst;

SET LINESIZE 300;

/*
 * Task 2
 */

---------------
-- Task 2.1. --
---------------

SELECT UNIQUE DEPARTMENT.D#, DEPARTMENT.DNAME FROM DEPARTMENT
  JOIN DEPTLOCATION ON DEPTLOCATION.D# = DEPARTMENT.D#
  WHERE UPPER(DEPTLOCATION.Address) LIKE '%WOLLONGONG%';
  
---------------
-- Task 2.2. --
---------------

SELECT DEPARTMENT.D#, DEPARTMENT.DNAME, DEPARTMENT.MANAGER# FROM DEPARTMENT
  WHERE DEPARTMENT.D# NOT IN (SELECT UNIQUE D# FROM PROJECT);

---------------
-- Task 2.3. --
---------------

SELECT DEPARTMENT.D#, DEPARTMENT.DNAME, NVL(SUM(PROJECT.BUDGET), 0) "TOTAL BUDGETS"
FROM DEPARTMENT FULL JOIN PROJECT ON DEPARTMENT.D# = PROJECT.D#
GROUP BY DEPARTMENT.D#, DEPARTMENT.DNAME;

---------------
-- Task 2.4. --
---------------

SELECT EMPLOYEE.E#, EMPLOYEE.NAME, EMPLOYEE.D#, NVL(SUM(WORKSON.HOURS), 0) "TOTAL HOURS/W"
FROM EMPLOYEE FULL JOIN WORKSON ON EMPLOYEE.E# = WORKSON.E# GROUP BY EMPLOYEE.E#, EMPLOYEE.NAME, EMPLOYEE.D#;

---------------
-- Task 2.5. --
---------------

SELECT EMPLOYEE.E#, EMPLOYEE.NAME FROM EMPLOYEE WHERE SUPER# = (
  SELECT E# FROM EMPLOYEE E2 WHERE E2.NAME = 'Alvin'
);

---------------
-- Task 2.6. --
---------------

SELECT EMPLOYEE.E#, EMPLOYEE.NAME FROM EMPLOYEE WHERE NOT EXISTS (
  SELECT * FROM DEPENDENT WHERE EMPLOYEE.E# = DEPENDENT.E#
);

---------------
-- Task 2.7. --
---------------

SELECT DISTINCT EMPLOYEE.E#, EMPLOYEE.NAME FROM EMPLOYEE JOIN WORKSON ON EMPLOYEE.E# = WORKSON.E#
  WHERE (SELECT PROJECT.BUDGET FROM PROJECT WHERE PROJECT.P# = WORKSON.P#) > 200000;

---------------
-- Task 2.8. --
---------------

SELECT PROJECT.SPONSOR, SUM(PROJECT.BUDGET) AS "Total Budgets" FROM PROJECT GROUP BY PROJECT.SPONSOR;

---------------
-- Task 2.9. --
---------------

SELECT UNIQUE EMPLOYEE.E#, EMPLOYEE.NAME FROM EMPLOYEE JOIN PROJECT
ON EMPLOYEE.D# = PROJECT.D# WHERE PROJECT.SPONSOR = 'Education committee';

---------------
-- Task 2.10. -
---------------

SELECT CAST(AVG(MONTHS_BETWEEN(CURRENT_DATE, DOB))/12 AS INT) "Average Age of Employees" FROM EMPLOYEE;

SPOOL OFF;
