SPOOL employer
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Title:          Employers who offer the positions
   Script name:    employer.sql
   Task:           To list the contents of a relational table EMPLOYER
   Created by:	   Janusz R. Getta     
   Created on:	   24 September 2012
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO ON
SET LINESIZE 200
SET WRAP OFF

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* EMPLOYER								*/
/*									*/
COLUMN ename		FORMAT A35		HEADING "Employer name"
COLUMN city            	FORMAT A10		HEADING "City"
COLUMN state           	FORMAT A20		HEADING	"State"
COLUMN phone            FORMAT 9999999999	HEADING "Phone"
COLUMN fax              FORMAT 9999999999	HEADING "Fax"
COLUMN email         	FORMAT A20		HEADING "Email|address"
COLUMN web             	FORMAT A20		HEADING "Web|address"

SELECT	ename,
	city,
	state,
	phone,
	fax,
	email,
	web
FROM EMPLOYER
ORDER BY ename ASC;

PROMPT Done.
SPOOL OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* End of script                                                        */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
