SPOOL position
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Title:          Positions offered
   Script name:    position.sql
   Task:           To list the contents of a relational table POSITION
   Created by:	   Janusz R. Getta     
   Created on:	   23 November 2012
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO ON
SET LINESIZE 200
SET WRAP OFF

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* POSITION								*/
/*									*/
COLUMN pnumber		FORMAT 99999999 	HEADING "Position|number"
COLUMN title           	FORMAT A20		HEADING "Title"
COLUMN salary		FORMAT 999999.99	HEADING "Salary"
COLUMN extras		FORMAT A20		HEADING "Extras"
COLUMN bonus		FORMAT 999999.99	HEADING "End of year|bonus"
COLUMN specification   	FORMAT A30		HEADING "Specification"
COLUMN ename		FORMAT A30		HEADING "Employer name"

SELECT	pnumber,
	title,
	salary,
	extras,
	bonus,
	specification,
	ename
FROM POSITION
ORDER BY pnumber ASC;

PROMPT Done.
SPOOL OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* End of script                                                        */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
