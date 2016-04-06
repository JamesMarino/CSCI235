/*
 * Task 2
 */

---------------
-- Task 2.1. --
---------------

/*
SELECT * FROM DEPTLOCATION;

SELECT UNIQUE DEPARTMENT.D#, DEPARTMENT.DNAME FROM DEPARTMENT
  JOIN DEPTLOCATION ON DEPTLOCATION.D# = DEPARTMENT.D#
  WHERE Address LIKE '%Wollongong%';
*/  
  
---------------
-- Task 2.2. --
---------------

/*
SELECT D#, DNAME, MANAGER# FROM DEPARTMENT WHERE D# NOT IN (SELECT UNIQUE D# FROM PROJECT);
*/

---------------
-- Task 2.3. --
---------------

/*
SELECT DEPARTMENT.D#, DEPARTMENT.DNAME, NVL(SUM(PROJECT.BUDGET), 0) "TOTAL BUDGETS"
FROM DEPARTMENT FULL JOIN PROJECT ON DEPARTMENT.D# = PROJECT.D#
GROUP BY DEPARTMENT.D#, DEPARTMENT.DNAME;
*/

---------------
-- Task 2.4. --
---------------

/*
SELECT EMPLOYEE.E#, EMPLOYEE.NAME, EMPLOYEE.D#, NVL(WORKSON.HOURS, 0) "TOTAL HOURS/W"
FROM EMPLOYEE FULL JOIN WORKSON ON EMPLOYEE.E# = WORKSON.E#;
*/

---------------
-- Task 2.5. --
---------------

/*
SELECT E#, NAME FROM EMPLOYEE WHERE E# = (SELECT E# FROM EMPLOYEE WHERE NAME = 'Alvin');
*/

---------------
-- Task 2.6. --
---------------

/*
-- Not to sure about this
SELECT E#, NAME FROM EMPLOYEE WHERE NOT EXISTS (SUPER#);
*/

---------------
-- Task 2.7. --
---------------

/*
SELECT UNIQUE EMPLOYEE.E#, EMPLOYEE.NAME FROM EMPLOYEE FULL JOIN PROJECT ON EMPLOYEE.D# = PROJECT.D# WHERE PROJECT.BUDGET > 20000;
*/

---------------
-- Task 2.8. --
---------------

/*
-- Seems to simple
SELECT SPONSOR, BUDGET FROM PROJECT;
*/

---------------
-- Task 2.9. --
---------------

/*
SELECT UNIQUE EMPLOYEE.E#, EMPLOYEE.NAME FROM EMPLOYEE JOIN PROJECT
ON EMPLOYEE.D# = PROJECT.D# WHERE PROJECT.SPONSOR = 'Education committee';
*/

---------------
-- Task 2.10. --
---------------

/*
SELECT AVG(MONTHS_BETWEEN(CURRENT_DATE, DOB))/12 "Average Age of Employees" FROM EMPLOYEE;
*/
