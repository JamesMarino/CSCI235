SET ECHO ON;
SPOOL task3.lst;

-- 1.
INSERT INTO PROJECT (P#, TITLE, BUDGET, STARTD, ENDD) VALUES (8, 'New Project', NULL, CURRENT_DATE, CURRENT_DATE + 100);

-- 2.
UPDATE EMPLOYEE SET DNAME='ACCOUNTING', CITY='NEW YORK', STREET#=30, BLDG#=123, LEVEL#=99  WHERE E#=7698;

-- 3.
ALTER TABLE EMPLOYEE DROP CONSTRAINT EMPLOYEE_FKEY1;
ALTER TABLE EMPLOYEE DROP CONSTRAINT EMPLOYEE_FKEY2;
ALTER TABLE DEPTLOC DROP CONSTRAINT DEPTLOC_FKEY;

DELETE FROM DEPARTMENT WHERE DNAME='TRANSPORT';
DELETE FROM DEPTLOC WHERE DNAME='TRANSPORT';
DELETE FROM EMPLOYEE WHERE DNAME='TRANSPORT';

SPOOL OFF;