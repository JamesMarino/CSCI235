SPOOL task1;
SET ECHO ON;
SET FEEDBACK ON;
SET LINESIZE 100;
SET PAGESIZE 100;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE LISTSKILL
IS
  appNumber APPLICANT.ANUMBER%TYPE;
  firstName APPLICANT.FNAME%TYPE;
  lastName APPLICANT.LNAME%TYPE;
  skillName SPOSSESSED.SNAME%TYPE;
  skillLevel SPOSSESSED.SLEVEL%TYPE;
  CURSOR Q1 IS
    SELECT ANUMBER, FNAME, LNAME FROM APPLICANT;
  CURSOR Q2 IS
    SELECT SNAME, SLEVEL FROM SPOSSESSED WHERE ANUMBER = appNumber ORDER BY SLEVEL DESC;
    
  counter NUMBER;
  finalRow VARCHAR2(256);
  finalInnerRow VARCHAR2(256);
BEGIN
  
  counter := 0;

  OPEN Q1;
  LOOP
    FETCH Q1 INTO appNumber, firstName, lastName;
    IF Q1%NOTFOUND THEN EXIT; END IF;
    
    OPEN Q2;
    LOOP
      FETCH Q2 INTO skillName, skillLevel;
      IF Q2%NOTFOUND THEN EXIT; END IF;
      
      counter := counter + 1;
      finalInnerRow := finalInnerRow || (UPPER(skillName) || ':' || skillLevel || ', ');
      
    END LOOP;
    CLOSE Q2;

    DBMS_OUTPUT.PUT_LINE(counter || ' ' || UPPER(firstName) || ' ' || UPPER(lastName) || ': ' || finalInnerRow);
    
    counter := 0;
    finalInnerRow := '';
    
  END LOOP;
  CLOSE Q1;
END LISTSKILL;
/

EXECUTE LISTSKILL;

SPOOL OFF;
