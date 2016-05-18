
SET SERVEROUTPUT ON

/* Note, that SQL*Plus does not display DBMS_OUTPUT messages until the PL/SQL program completes. 
   There is no mechanism for flushing the DBMS_OUTPUT buffers within the PL/SQL program.         */

DECLARE
SYSTS VARCHAR(60);

BEGIN
 SELECT TO_CHAR(SYSTIMESTAMP)
 INTO SYSTS
 FROM DUAL;

DBMS_OUTPUT.PUT_LINE(SYSTS);

DBMS_LOCK.SLEEP(10);         /* Sleep for 10 seconds						*/

SELECT TO_CHAR(SYSTIMESTAMP)
INTO SYSTS
FROM DUAL;

DBMS_OUTPUT.PUT_LINE(SYSTS);
END;
/
