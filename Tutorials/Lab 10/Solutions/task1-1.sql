SET ECHO ON;
SPOOL task1-1.lst;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET SERVEROUTPUT ON;

SELECT * FROM POSITION;

BEGIN

  UPDATE POSITION SET POSITION.SALARY = (POSITION.SALARY + POSITION.SALARY*0.1)
  WHERE POSITION.ENAME IN (
    SELECT EMPLOYER.ENAME FROM EMPLOYER WHERE EMPLOYER.STATE = 'New South Wales'
  );
  
  DBMS_LOCK.SLEEP(10);
  COMMIT;
  
END;
/

SELECT * FROM POSITION;

SPOOL OFF;