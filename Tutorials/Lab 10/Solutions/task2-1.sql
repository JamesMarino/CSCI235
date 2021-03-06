SET ECHO ON;
SPOOL task2-1.lst;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SET SERVEROUTPUT ON;

BEGIN
    
  UPDATE POSITION SET POSITION.BONUS = 0
    WHERE POSITION.BONUS IS NULL;
    
  DBMS_LOCK.SLEEP(10);
    
  UPDATE POSITION SET POSITION.BONUS = POSITION.BONUS * 1.05;

  COMMIT;

END;
/

SELECT * FROM POSITION;

SPOOL OFF;
