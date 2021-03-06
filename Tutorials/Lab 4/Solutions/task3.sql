SET ECHO ON;
SPOOL task3.lst;

-- Question 1
SELECT COUNT(ENAME), CITY FROM EMPLOYEE GROUP BY CITY;

-- Question 2
SELECT DNAME FROM(
SELECT DNAME, CITY FROM DEPTLOC)
GROUP BY DNAME
HAVING COUNT(DNAME) > 2;

-- Question 3
SELECT DNAME FROM(
SELECT DNAME, CITY FROM DEPTLOC)
GROUP BY DNAME
HAVING COUNT(DNAME) < 2;

SPOOL OFF;