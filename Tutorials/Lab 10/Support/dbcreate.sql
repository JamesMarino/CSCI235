SPOOL dbcreate
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Title:          Sample database
   Script name:    dbcreate.sql
   Task:           To create and to load a sample database
   Created by:	   Janusz R. Getta     
   Created on:	   23 October 2011
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO ON
SET LINESIZE 200
SET WRAP OFF

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
CREATE TABLE EMPLOYER(			  /* Employers			*/
ename        	VARCHAR(100)    NOT NULL, /* Employer name              */
city            VARCHAR(30)     NOT NULL, /* City                       */
state           VARCHAR(20)     NOT NULL, /* State                      */
phone           NUMBER(10)      NOT NULL, /* Phone number               */
fax             NUMBER(10)              , /* Fax number                 */
email           VARCHAR(50)             , /* E-mail address             */
web             VARCHAR(50)             , /* Web site address           */
        CONSTRAINT EMPLOYER_pkey PRIMARY KEY ( ename ) );

INSERT INTO EMPLOYER VALUES ( 'University of Sydney', 'Sydney', 'New South Wales', 612345678, NULL, 'admin@uos.edu', 'www.uos.edu.au');
INSERT INTO EMPLOYER VALUES ( 'University of Western Sydney', 'Western Sydney', 'New South Wales', 612345678, NULL, 'muws@uws.edu.au', 'www.uws.edu.au');
INSERT INTO EMPLOYER VALUES ( 'University of Wollongong', 'Wollongong', 'New South Wales', 6124243689, 6124234569, 'admin@uow.edu.au', 'www.uow.edu.au');
INSERT INTO EMPLOYER VALUES ( 'University of New South Wales', 'Sydney', 'New South Wales', 6129874574, 6123454445, 'adm@unsw.edu.au', 'www.unsw.edu.au');
INSERT INTO EMPLOYER VALUES ( 'University of Technology, Sydney', 'Sydney', 'New South Wales', 6125646872, NULL, 'postmaster@uts.edu.au', 'www.uts.edu.au');
INSERT INTO EMPLOYER VALUES ( 'Macquarie University', 'Sydney', 'New South Wales', 6125646346, NULL, 'main@mcq.edu.au', 'www.mcq.edu.au');
INSERT INTO EMPLOYER VALUES ( 'Monash University', 'Melbourne', 'Victoria', 6134567932, NULL, 'admin@monash.edu.au', 'www.monash.edu.au');
INSERT INTO EMPLOYER VALUES ( 'La Trobe University', 'Melbourne', 'Victoria', 6136677899, NULL, NULL, 'www.latrobe.edu.au');
INSERT INTO EMPLOYER VALUES ( 'University of Melbourne', 'Melbourne', 'Victoria', 6131234567, 6132345678, 'admin@uom.edu.au', 'www.uom.edu.au');
INSERT INTO EMPLOYER VALUES ( 'RMIT', 'Melbourne', 'Victoria', 6135050607, NULL, NULL, 'www.rmit.edu.au');
INSERT INTO EMPLOYER VALUES ( 'University of Queensland', 'Brisbane', 'Queeensland', 615333445, 6154465678, 'admin@uq.edu.au', 'www.uq.edu.au');
INSERT INTO EMPLOYER VALUES ( 'University of Adelaide', 'Adelaide', 'South Australia', 6172222567, 6172341278, 'main@uoa.edu.au', 'www.uoa.edu.au');
INSERT INTO EMPLOYER VALUES ( 'Murdoch University', 'Perth', 'Western Australia', 6182234588, NULL, 'admin@murdoch.edu.au', 'www.murdoch.edu.au');
INSERT INTO EMPLOYER VALUES ( 'Curtin University', 'Perth', 'Western Australia', 6182222567, NULL, 'main@curtin.edu.au', 'www.uoa.edu.au');
INSERT INTO EMPLOYER VALUES ( 'University of Western Australia','Perth', 'Western Australia', 6189876543, 6133341278, 'main@uowa.edu.au', 'www.uowa.edu.au');

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
CREATE TABLE POSITION(			  /* Advertised positions	*/
pnumber         NUMBER(8)       NOT NULL, /* Position number            */
title           VARCHAR(30)     NOT NULL, /* Position title             */
salary		NUMBER(9,2)	NOT NULL, /* Salary			*/
extras		VARCHAR(50)	        , /* Extras			*/
bonus		NUMBER(9,2)		, /* End of year bonus		*/
specification   VARCHAR(2000)	NOT NULL, /* Specification		*/
ename		VARCHAR(100)	NOT NULL, /* Employer name		*/
	CONSTRAINT POSITION_pkey PRIMARY KEY ( pnumber ),
	CONSTRAINT POSITION_fkey FOREIGN KEY ( ename) 
		REFERENCES EMPLOYER( ename ) );

INSERT INTO POSITION VALUES ( 00000001, 'lecturer', 45000.00, 'computer', NULL, 'teaching', 'University of New South Wales');
INSERT INTO POSITION VALUES ( 00000002, 'lecturer', 450000.00, 'mouse pad', 500000.0, 'research', 'University of Wollongong');
INSERT INTO POSITION VALUES ( 00000003, 'senior lecturer', 50000.00, 'a lot of red markers', NULL, 'a lot of hard work', 'University of Technology, Sydney'  );
INSERT INTO POSITION VALUES ( 00000004, 'associate professor', 200000.00, 'silver pen', NULL, 'teaching', 'University of Wollongong');
INSERT INTO POSITION VALUES ( 00000005, 'professor', 200000.00, 'chair', NULL, 'research', 'University of Queensland' );
INSERT INTO POSITION VALUES ( 00000006, 'professor', 100000.00, 'chair and desk', NULL, 'research', 'University of New South Wales' );
INSERT INTO POSITION VALUES ( 00000007, 'professor', 800000.00, 'chair', NULL, 'teaching and research', 'University of Wollongong');
INSERT INTO POSITION VALUES ( 00000008, 'senior lecturer', 45000.00, 'computer', 100000.00, 'teaching', 'University of Wollongong');
INSERT INTO POSITION VALUES ( 00000009, 'lecturer', 450000.00, 'mouse pad', 500000.00, 'research', 'University of Wollongong');
INSERT INTO POSITION VALUES ( 00000010, 'associate professor', 50000.00, 'a lot of red markers', NULL, 'a lot of hard work', 'University of Technology, Sydney' );

COMMIT;

PROMPT dbcreate.sql done.
SPOOL OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* End of script                                                        */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* The contents of relational tables 					*/
/*									*/
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* EMPLOYER								*/
/*									*/
@employer

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* POSITION								*/
/*									*/
@position

