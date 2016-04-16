SET LINESIZE 		100
SET PAGESIZE 		300

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* Lookup tables                                                        */
/*									*/

CREATE TABLE LPTitle(
title        VARCHAR(30)     NOT NULL, /* Position title              */
	CONSTRAINT LPTitle_pkey PRIMARY KEY ( title ) );

INSERT INTO LPTitle VALUES( 'ASSISTANT' ); 
INSERT INTO LPTitle VALUES( 'ASSOC. LECTURER' ); 
INSERT INTO LPTitle VALUES( 'LECTURER' ); 
INSERT INTO LPTitle VALUES( 'SENIOR LECTURER' );
INSERT INTO LPTitle VALUES( 'ASSOC. PROFESSOR' );
INSERT INTO LPTitle VALUES( 'PROFESSOR' );


CREATE TABLE LState(
state      VARCHAR(3)     NOT NULL, /* State name            */
	CONSTRAINT LState_pkey PRIMARY KEY ( state ) );

INSERT INTO LState VALUES ( 'NSW' );
INSERT INTO LState VALUES ( 'Vic' );
INSERT INTO LState VALUES ( 'SA' );
INSERT INTO LState VALUES ( 'ACT' );
INSERT INTO LState VALUES ( 'WA' );
INSERT INTO LState VALUES ( 'Que' );
INSERT INTO LState VALUES ( 'NT' );
INSERT INTO LState VALUES ( 'Tas' );


CREATE TABLE LSkill(
skill	      VARCHAR(30)     NOT NULL, /* Skill name          		*/
	CONSTRAINT LSkill_pkey PRIMARY KEY ( skill ) );

INSERT INTO LSkill VALUES ( 'C++ PROGRAMMING' );
INSERT INTO LSkill VALUES ( 'C PROGRAMMING' );
INSERT INTO LSkill VALUES ( 'JAVA PROGRAMMING' );
INSERT INTO LSkill VALUES ( 'DATABASE DESIGN' );
INSERT INTO LSkill VALUES ( 'SQL PROGRAMMING' );
INSERT INTO LSkill VALUES ( 'DATABASE ADMIN.' );
INSERT INTO LSkill VALUES ( 'PAINTING' );
INSERT INTO LSkill VALUES ( 'COOKING' );
INSERT INTO LSKILL VALUES ( 'TRUCK DRIVING' );
INSERT INTO LSkill VALUES ( 'NETWORK ADMIN.' );
INSERT INTO LSkill VALUES ( 'INFORMATION SYST. ADMIN' );



/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
/* Database tables							*/
/*									*/
CREATE TABLE Applicant(
a#              NUMBER(6)       NOT NULL, /* Staff number               */
fname           VARCHAR(20)     NOT NULL, /* First name                 */
lname		VARCHAR(30)	NOT NULL, /* Last name			*/
address         VARCHAR(50)     NOT NULL, /* Street, home number, etc.  */
city		VARCHAR(30)	NOT NULL, /* City			*/
state		VARCHAR(20)	NOT NULL, /* State			*/
phone#		NUMBER(10)	NOT NULL, /* Phone number		*/
fax#		NUMBER(10)		, /* Fax number			*/
email		VARCHAR(50)		, /* E-mail address		*/
acomment	LONG			,  /* Interesting comments from interviews */
	CONSTRAINT Applicant_pkey PRIMARY KEY ( a# ),
	CONSTRAINT Applicant_fkey1 FOREIGN KEY ( state )
				REFERENCES LState ( state ) );

INSERT INTO Applicant VALUES ( 000001, 'PETER', 'JONES', '7 STATION ST.', 'PERTH', 
'WA', 645278453, NULL, NULL, 'Job expectations ? Money, money, money, ...' );
INSERT INTO Applicant VALUES ( 000002, 'JOHN', 'BLACK', '23 VICTORIA ST.', 'GEELONG', 
'Vic', 63569784, 63569785, 'blunder@hotmail.com', 'Microsoft Access ? Oh yeah, kindergarten database system' );
INSERT INTO Applicant VALUES ( 000003, 'MARY', 'WHITE', '453 RITCHIE CR.', 'MELBOURNE', 
'Vic', 62389541, NULL, 'mary@yahoo.com', 'Hard work ? You must be kidding !' );
INSERT INTO Applicant VALUES ( 000004, 'MICHAEL', 'COLLINS', '12 GREEN PL.', 'BRISBANE', 
'Que', 63336666, NULL, 'mike@hotmail.com', 'Java ? My way !!!' );
INSERT INTO Applicant VALUES ( 000005, 'MARGARET', 'FINCH', '45 ANZAC PDE.', 'SYDNEY', 
'NSW', 64573489, NULL, NULL, 'Microsoft ? Hmmm, does it still exist ?' );
INSERT INTO Applicant VALUES ( 000006, 'GARY', 'KASPAROW', '99 CHESS ST.', 'PERTH', 
'WA', 645278434, NULL, NULL, 'C++ ? Check mate !' );
INSERT INTO Applicant VALUES ( 000007, 'CLAUDIA', 'HOFFMAN', '23 STATION ST.', 'HOBART', 
'Tas', 64577744, NULL, 'cch@cs.odmg.org', 'Databases ? Oh yes, yes ! I like databases in Strogonoff sauce with a bit of rice and mushroom salad' );
INSERT INTO Applicant VALUES ( 000008, 'STEPHEN', 'STAUNTON', '23 HUXLEY AVE.', 'ALICE SPRINGS', 
'WA', 623778453, NULL, NULL, 'The best project ? Hello world !' );
INSERT INTO Applicant VALUES ( 000009, 'JOSEPH', 'STAUNTON', '23 HUXLEY AVE.', 'ALICE SPRINGS', 
'WA', 623778453, NULL, NULL, 'The favorite programming technique ? Shareware !' );
INSERT INTO Applicant VALUES ( 0000010, 'JANUSZ', 'GETTA', '10 ELLENBOROUGH PL', 'DAPTO WEST', 
'NSW', 642214339, NULL, 'jrg@cs.uow.edu.au', 'Software Engineering ? You can''t be serious !' );

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE SPossessed(
a#        	NUMBER(6) 	NOT NULL, /* Applicant number           */
sname		VARCHAR(30)	NOT NULL, /* Skill name                 */
skilllevel	NUMBER(2)	NOT NULL, /* Skill level                */
	CONSTRAINT SPossessed_pkey PRIMARY KEY ( a#, sname ), 
	CONSTRAINT SPossessed_fkey1 FOREIGN KEY ( a# )
				REFERENCES Applicant ( a# )
				ON DELETE CASCADE,
	CONSTRAINT SPossessed_fkey2 FOREIGN KEY ( sname )
				REFERENCES LSkill ( skill ),
	CONSTRAINT SPossessed_check1 CHECK ( skilllevel IN 
					( 1,2,3,4,5,6,7,8,9,10 ) ) );

INSERT INTO SPossessed VALUES ( 000001, 'JAVA PROGRAMMING', 9 );
INSERT INTO SPossessed VALUES ( 000001, 'C PROGRAMMING', 4 );
INSERT INTO SPossessed VALUES ( 000001, 'COOKING', 9 );
INSERT INTO SPossessed VALUES ( 000002, 'JAVA PROGRAMMING', 7 );
INSERT INTO SPossessed VALUES ( 000002, 'TRUCK DRIVING', 9 );
INSERT INTO SPossessed VALUES ( 000003, 'C++ PROGRAMMING', 10 );
INSERT INTO SPossessed VALUES ( 000003, 'JAVA PROGRAMMING', 9 );
INSERT INTO SPossessed VALUES ( 000003, 'PAINTING', 5 );
INSERT INTO SPossessed VALUES ( 000008, 'COOKING', 9 );
INSERT INTO SPossessed VALUES ( 0000010, 'COOKING', 1 );
INSERT INTO SPossessed VALUES ( 0000010, 'PAINTING', 9 );
INSERT INTO SPossessed VALUES ( 0000010, 'SQL PROGRAMMING', 10 );
INSERT INTO SPossessed VALUES ( 000005, 'SQL PROGRAMMING', 6 );
INSERT INTO SPossessed VALUES ( 000006, 'SQL PROGRAMMING', 8 );
INSERT INTO SPossessed VALUES ( 000007, 'SQL PROGRAMMING', 9 );
INSERT INTO SPossessed VALUES ( 000008, 'SQL PROGRAMMING', 3 );
INSERT INTO SPossessed VALUES ( 0000010, 'DATABASE DESIGN', 10 );
INSERT INTO SPossessed VALUES ( 000007, 'COOKING', 10 );

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
CREATE TABLE Position(
p#              NUMBER(8)       NOT NULL, /* Position number            */
ptitle          VARCHAR(30)     NOT NULL, /* Position title             */
employer 	VARCHAR(100)    NOT NULL, /* Institution name           */
salary		NUMBER(9,2)	NOT NULL, /* Salary			*/
extras		VARCHAR(50)		, /* Extras			*/
specification   LONG		        , /* Specification		*/
	CONSTRAINT Position_pkey PRIMARY KEY ( p# ),
	CONSTRAINT Position_fkey1 FOREIGN KEY ( ptitle )
				REFERENCES LPTitle ( title ) );

INSERT INTO Position VALUES ( 00000001, 'LECTURER', 'UNSW', 45000.00, 'computer', 'Teaching');
INSERT INTO Position VALUES ( 00000002, 'LECTURER', 'UOW', 450000.00, 'mouse pad', 'Research');
INSERT INTO Position VALUES ( 00000003, 'SENIOR LECTURER', 'UTS', 50000.00, NULL, 'A lot of hard work'  );
INSERT INTO Position VALUES ( 00000004, 'ASSOC. PROFESSOR', 'UOW', 60000.00, NULL, NULL);
INSERT INTO Position VALUES ( 00000005, 'PROFESSOR', 'UQ', 80000.00, 'chair', 'Research' );
INSERT INTO Position VALUES ( 00000006, 'PROFESSOR', 'UNSW', 80000.00, 'chair', 'Research' );
INSERT INTO Position VALUES ( 00000007, 'PROFESSOR', 'UOW', 80000.00, 'chair', 'Teaching and research');

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
CREATE TABLE SNeeded(
p#        	NUMBER(8) 	NOT NULL, /* Position number            */
sname		VARCHAR(30)	NOT NULL, /* Skill name                 */
skilllevel	NUMBER(2)	NOT NULL, /* Skill level                */
	CONSTRAINT SNeeded_pkey PRIMARY KEY ( p#, sname ), 
	CONSTRAINT SNeeded_fkey1 FOREIGN KEY ( p# )
				REFERENCES Position ( p# )
				ON DELETE CASCADE,
	CONSTRAINT SNeeded_fkey2 FOREIGN KEY ( sname )
				REFERENCES LSkill ( skill ),
	CONSTRAINT SNeeded_check1 CHECK ( skilllevel IN 
					( 1,2,3,4,5,6,7,8,9,10 ) ) );

INSERT INTO SNeeded VALUES ( 00000001, 'JAVA PROGRAMMING', 8 );
INSERT INTO SNeeded VALUES ( 00000001, 'COOKING', 9 );
INSERT INTO SNeeded VALUES ( 00000002, 'JAVA PROGRAMMING', 3 );
INSERT INTO SNeeded VALUES ( 00000002, 'TRUCK DRIVING', 9 );
INSERT INTO SNeeded VALUES ( 00000003, 'C++ PROGRAMMING', 7 );
INSERT INTO SNeeded VALUES ( 00000003, 'JAVA PROGRAMMING', 10 );
INSERT INTO SNeeded VALUES ( 00000003, 'PAINTING', 4 );
INSERT INTO SNeeded VALUES ( 00000005, 'COOKING', 10 );
INSERT INTO SNeeded VALUES ( 00000001, 'C PROGRAMMING', 4 );
INSERT INTO SNeeded VALUES ( 00000006, 'COOKING', 2 );
INSERT INTO SNeeded VALUES ( 00000005, 'PAINTING', 6 );
INSERT INTO SNeeded VALUES ( 00000007, 'SQL PROGRAMMING', 10 );
INSERT INTO SNeeded VALUES ( 00000004, 'SQL PROGRAMMING', 6 );
INSERT INTO SNeeded VALUES ( 00000005, 'SQL PROGRAMMING', 3 );
INSERT INTO SNeeded VALUES ( 00000007, 'PAINTING', 5 );
INSERT INTO SNeeded VALUES ( 00000001, 'SQL PROGRAMMING', 3 );
INSERT INTO SNeeded VALUES ( 00000002, 'DATABASE DESIGN', 10 );
INSERT INTO SNeeded VALUES ( 00000007, 'COOKING', 8 );


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
CREATE TABLE Applies(
a#		NUMBER(6)	NOT NULL, /* Applicant number		*/
p#		NUMBER(8)	NOT NULL, /* Position number		*/
appdate		DATE		NOT NULL, /* Application date 		*/
	CONSTRAINT Applies_pkey PRIMARY KEY ( a#, p# ), 
	CONSTRAINT Applies_fkey1 FOREIGN KEY ( a# )
				REFERENCES Applicant ( a# )
				ON DELETE CASCADE,
	CONSTRAINT Applies_fkey2 FOREIGN KEY ( p# )
				REFERENCES Position ( p# ) 
				ON DELETE CASCADE);

INSERT INTO Applies VALUES( 000001, 00000001, TO_DATE('13-DEC-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000002, 00000001, TO_DATE('13-DEC-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000003, 00000002, TO_DATE('14-NOV-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000004, 00000002, TO_DATE('20-JAN-2000','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000005, 00000002, TO_DATE('22-JAN-2000','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000005, 00000003, TO_DATE('09-MAY-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000006, 00000003, TO_DATE('17-JUN-1999','DD-MON-YYYY') ); 
INSERT INTO Applies VALUES( 000007, 00000003, TO_DATE('18-JUN-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000007, 00000004, TO_DATE('13-APR-2000','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000008, 00000004, TO_DATE('13-APR-2000','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000009, 00000004, TO_DATE('14-APR-2000','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000010, 00000005, TO_DATE('23-SEP-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000001, 00000006, TO_DATE('26-OCT-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000002, 00000006, TO_DATE('27-OCT-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000003, 00000006, TO_DATE('28-OCT-1999','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000004, 00000007, TO_DATE('01-JAN-2000','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000005, 00000007, TO_DATE('03-JAN-2000','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000006, 00000007, TO_DATE('04-JAN-2000','DD-MON-YYYY') );
INSERT INTO Applies VALUES( 000007, 00000007, TO_DATE('07-JAN-2000','DD-MON-YYYY') );


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
CREATE TABLE CoursePassed(
a#              NUMBER(6)       NOT NULL, /* Applicant number           */
ctitle          VARCHAR(50)     NOT NULL, /* Course title               */
institution     VARCHAR(100)    NOT NULL, /* Institution name           */
compdate        DATE            NOT NULL, /* Completion date            */
grade		CHAR(1)		NOT NULL, /* Grade			*/
	CONSTRAINT CoursePassed_pkey PRIMARY KEY ( a#, ctitle, institution ),
	CONSTRAINT CoursePassed_fkey1 FOREIGN KEY ( a# )
				REFERENCES Applicant ( a# ) 
				ON DELETE CASCADE);

INSERT INTO CoursePassed VALUES ( 000001, 'JAVA PROGRAMMING', 'UNSW', TO_DATE('10-MAR-1997','DD-MON-YYYY'), 'A' );
INSERT INTO CoursePassed VALUES ( 000001, 'C PROGRAMMING', 'UOW', TO_DATE('1-APR-1988','DD-MON-YYYY'), 'B' );
INSERT INTO CoursePassed VALUES ( 000001, 'COOKING', 'TAFE', TO_DATE('10-JAN-1979','DD-MON-YYYY'), 'A' );
INSERT INTO CoursePassed VALUES ( 000002, 'JAVA PROGRAMMING', 'UOW', TO_DATE('10-MAR-1997','DD-MON-YYYY'), 'C' );
INSERT INTO CoursePassed VALUES ( 000002, 'TRUCK DRIVING', 'RTA', TO_DATE('23-JUN-1980','DD-MON-YYYY'), 'D' );
INSERT INTO CoursePassed VALUES ( 000003, 'C++ PROGRAMMING', 'UNSW', TO_DATE('1-DEC-1994','DD-MON-YYYY'), 'A' );
INSERT INTO CoursePassed VALUES ( 000003, 'JAVA PROGRAMMING', 'UOW', TO_DATE('10-MAR-1997','DD-MON-YYYY'), 'B' );
INSERT INTO CoursePassed VALUES ( 000003, 'PAINTING', 'LOUVRE', TO_DATE('3-APR-1985','DD-MON-YYYY'), 'B' );
INSERT INTO CoursePassed VALUES ( 000004, 'JAVA - MY WAY', 'UOS', TO_DATE('3-APR-1998','DD-MON-YYYY'),'B' );
INSERT INTO CoursePassed VALUES ( 000001, 'ADVANCED JAVA', 'UOW', TO_DATE('1-JUN-1998','DD-MON-YYYY'), 'B' );
INSERT INTO CoursePassed VALUES ( 000004, 'E-COMMERCE FOR KIDS', 'UOW', TO_DATE('1-JUN-1998','DD-MON-YYYY'), 'A' );


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
CREATE TABLE FEmployer(
a#              NUMBER(6)       NOT NULL, /* Applicant number           */
employer        VARCHAR(100)    NOT NULL, /* Employer name              */
fromdate        DATE            NOT NULL, /* From date                  */
todate		DATE		        , /* To date			*/
	CONSTRAINT FEmployer_pkey PRIMARY KEY ( a#, employer, fromdate ),
	CONSTRAINT FEmployer_fkey1 FOREIGN KEY ( a# )
				REFERENCES Applicant ( a# ) 
				ON DELETE CASCADE );

INSERT INTO FEmployer VALUES ( 000001, 'UCLA', TO_DATE('10-MAR-1979','DD-MON-YYYY'), TO_DATE('09-JAN-1997','DD-MON-YYYY') );
INSERT INTO FEmployer VALUES ( 000001, 'UWS', TO_DATE('10-JAN-1997','DD-MON-YYYY'), TO_DATE('23-MAY-2000','DD-MON-YYYY') );
INSERT INTO FEmployer VALUES ( 000002, 'UOW', TO_DATE('10-MAR-1995','DD-MON-YYYY'), NULL );
INSERT INTO FEmployer VALUES ( 000003, 'UNSW', TO_DATE('1-DEC-1994','DD-MON-YYYY'), TO_DATE('2-DEC-1994','DD-MON-YYYY') );
INSERT INTO FEmployer VALUES ( 000003, 'UNSW',TO_DATE('10-MAR-1997','DD-MON-YYYY'), NULL );
INSERT INTO FEmployer VALUES ( 000005, 'UN', TO_DATE('3-APR-1985','DD-MON-YYYY'), NULL );
INSERT INTO FEmployer VALUES ( 000006, 'UOS', TO_DATE('3-APR-1998','DD-MON-YYYY'), NULL );
INSERT INTO FEmployer VALUES ( 000009, 'CIA', TO_DATE('1-JUN-1998','DD-MON-YYYY'), TO_DATE('26-APR-2000','DD-MON-YYYY') );
INSERT INTO FEmployer VALUES ( 0000010, 'ISTEI', TO_DATE('1-JUN-1979','DD-MON-YYYY'), TO_DATE('29-JUL-1991','DD-MON-YYYY'));
INSERT INTO FEmployer VALUES ( 0000010, 'UOW', TO_DATE('30-JUl-1991','DD-MON-YYYY'), NULL);


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */ 
CREATE TABLE Referee(
a#		NUMBER(6)      	NOT NULL, /* Applicant number		*/
fname           VARCHAR(30)    	NOT NULL, /* First name                 */
lname           VARCHAR(30)    	NOT NULL, /* Last name                  */
phone#		NUMBER(10)  	NOT NULL, /* Phone number		*/
	CONSTRAINT Referee_pkey PRIMARY KEY ( a#, fname, lname, phone# ),
	CONSTRAINT Referee_fkey1 FOREIGN KEY ( a# )
				REFERENCES Applicant ( a# ) 
				ON DELETE CASCADE );

INSERT INTO Referee VALUES ( 000001, 'PETER', 'BLACK', 936478593 );
INSERT INTO Referee VALUES ( 000003, 'NEIL', 'JONES', 346502749 );
INSERT INTO Referee VALUES ( 000002, 'NEIL', 'JONES', 346502749 );
INSERT INTO Referee VALUES ( 000006, 'SASHA', 'VOLKOV', 624374905 );
INSERT INTO Referee VALUES ( 000006, 'JAMES', 'BOND', 341984057 );

COMMIT;

PROMPT Done.
