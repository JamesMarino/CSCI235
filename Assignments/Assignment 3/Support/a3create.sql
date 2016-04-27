SET ECHO ON
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/*									*/
/* CSCI235 Assignment 3			                                */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~					*/
/* Created by: 		Janusz R. Getta 				*/
/* Updated by: 		Tianbing Xia 					*/
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* A domain of Academic.position					*/
/*									*/

CREATE TABLE LPosition(
position	VARCHAR(20)	NOT NULL, /* Position occupied		*/
		CONSTRAINT LPosition_pkey PRIMARY KEY ( position )
);

INSERT INTO LPosition VALUES( 'ASSOCIATE LECTURER');
INSERT INTO LPosition VALUES( 'LECTURER');
INSERT INTO LPosition VALUES( 'SENIOR LECTURER');
INSERT INTO LPosition VALUES( 'ASSOCIATE PROFESSOR');
INSERT INTO LPosition VALUES( 'PROFESSOR');


/*									*/
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* Object class: ACADEMIC     						*/
/*									*/
CREATE TABLE Academic(
staff#		NUMBER(10)	NOT NULL, /* Staff number		*/
first_name	VARCHAR(30)	NOT NULL, /* First name			*/
last_name	VARCHAR(30)	NOT NULL, /* Last name			*/
email		VARCHAR(50)	NOT NULL, /* Email address		*/
bldg#		NUMBER(5)	NOT NULL, /* Office in building		*/
room#		VARCHAR(5)	NOT NULL, /* Office number+suffix	*/
phone#		NUMBER(4)	NOT NULL, /* Phone number		*/
position	VARCHAR(20)	NOT NULL, /* Position occupied		*/
	CONSTRAINT Academic_pkey PRIMARY KEY( staff# ),
	CONSTRAINT Academic_ckey1 UNIQUE ( first_name, last_name ),
	CONSTRAINT Academic_ckey2 UNIQUE( email ),
	CONSTRAINT Academic_ckey3 UNIQUE( bldg#, room#),
	CONSTRAINT Academic_ckey4 UNIQUE( phone# ),
	CONSTRAINT Academic_fkey4 FOREIGN KEY ( position )
				REFERENCES LPosition( position ) );

INSERT INTO Academic VALUES (1000000010, 'Bill', 'Gates', 'billg@hotmail.com', 3, '201', 1234, 'PROFESSOR');
INSERT INTO Academic VALUES (1000000015, 'Steven', 'Jobs', 'steven@gmail.com', 3, '202', 1312, 'PROFESSOR');
INSERT INTO Academic VALUES (1000000020, 'Mark', 'Zuckerberg', 'markz@hotmail.com', 3, '207', 2134, 'ASSOCIATE PROFESSOR');
INSERT INTO Academic VALUES (1000000030, 'James', 'Bond', 'jamesb@hotmail.com', 3, '210', 1324, 'ASSOCIATE PROFESSOR');
INSERT INTO Academic VALUES (1000000040, 'Indiana', 'Jones', 'indianajones@gmail.com', 3, '211', 2143, 'PROFESSOR');
INSERT INTO Academic VALUES (1000000050, 'Shrek', 'Myers', 'shrek@hotmail.com', 3, '205', 3214, 'PROFESSOR');
INSERT INTO Academic VALUES (1000000060, 'George', 'Lucas', 'george_lucas@hotmail.com', 3, '203', 1342, 'SENIOR LECTURER');
INSERT INTO Academic VALUES (1000000070, 'Harrison', 'Ford', 'harrison@gmail.com', 3, '209', 2413, 'PROFESSOR');
INSERT INTO Academic VALUES (1000000080, 'Harry', 'Potter', 'harry_potter@hotmail.com', 3, '206', 3412, 'LECTURER');
INSERT INTO Academic VALUES (1000000090, 'Albus', 'Dumbledore', 'albusd@gmail.com', 3, '213', 4321, 'PROFESSOR');
INSERT INTO Academic VALUES (1000000110, 'Severus', 'Snape', 'severussnape@gmail.com', 3, '212', 2314, 'PROFESSOR');
INSERT INTO Academic VALUES (1000000120, 'Rubeus', 'Hagrid', 'rubeush@hotmail.com', 3, '214', 4213, 'LECTURER');

/*									*/
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* Object class: SUBJECT						*/
/*									*/
CREATE TABLE Subject(
code  		CHAR(7)		NOT NULL, /* Subject code		*/
name		VARCHAR(200)	NOT NULL, /* Subject name		*/
credits		NUMBER(2)	NOT NULL, /* Credit points		*/
description	VARCHAR(2000)	NOT NULL, /* Subject description	*/
	CONSTRAINT Subject_pkey PRIMARY KEY( code ),
	CONSTRAINT Subject_ckey1 UNIQUE( name ) );

INSERT INTO Subject VALUES ('CSCI124', 'Applied programming', 6, 'C++ procedure language');
INSERT INTO Subject VALUES ('CSCI204', 'Object and Generic Programming in C++', 6, 'Advanced C++');
INSERT INTO Subject VALUES ('CSCI235', 'Databases', 6, 'Database designs and implementations');
INSERT INTO Subject VALUES ('CSCI222', 'Systems Development', 6, 'Projects and systems');
INSERT INTO Subject VALUES ('CSCI317', 'Database Performance Tuning', 6, 'Database optimization');
INSERT INTO Subject VALUES ('CSCI321', 'Project', 12, 'Software project');
INSERT INTO Subject VALUES ('CSCI979', 'Thesis', 24, 'Research report and thesis');

/*									*/
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* Object class: RUNNING SUBJECT and 					*/
/* Association: RUNNING SUBJECT Is-instance-of SUBJECT			*/
/*									*/
CREATE TABLE RunningSubject(
code  		CHAR(7)		NOT NULL, /* Subject code		*/
asession	VARCHAR(7)	NOT NULL, /* Session running		*/
year		NUMBER(4)	NOT NULL, /* Year running		*/
enrolment	NUMBER(3)	NOT NULL, /* Total enrolment		*/
	CONSTRAINT RunningSubject_pkey PRIMARY KEY( code, asession, year ),
	CONSTRAINT RunningSubject_fkey1 FOREIGN KEY ( code )  
				REFERENCES Subject( code ),
 	CONSTRAINT RunningSubject_check1 
		CHECK (asession IN ( 'AUTUMN', 'SPRING', 'SUMMER' ) ) );

INSERT INTO RunningSubject VALUES ('CSCI124', 'AUTUMN', 2013, 123);
INSERT INTO RunningSubject VALUES ('CSCI124', 'SPRING', 2013, 120);
INSERT INTO RunningSubject VALUES ('CSCI124', 'AUTUMN', 2014, 125);
INSERT INTO RunningSubject VALUES ('CSCI124', 'SPRING', 2014, 110);
INSERT INTO RunningSubject VALUES ('CSCI124', 'AUTUMN', 2015, 130);
INSERT INTO RunningSubject VALUES ('CSCI124', 'SPRING', 2015, 108);

INSERT INTO RunningSubject VALUES ('CSCI204', 'AUTUMN', 2013, 85);
INSERT INTO RunningSubject VALUES ('CSCI204', 'SPRING', 2013, 90);
INSERT INTO RunningSubject VALUES ('CSCI204', 'AUTUMN', 2014, 92);
INSERT INTO RunningSubject VALUES ('CSCI204', 'SPRING', 2014, 95);
INSERT INTO RunningSubject VALUES ('CSCI204', 'AUTUMN', 2015, 102);
INSERT INTO RunningSubject VALUES ('CSCI204', 'SPRING', 2015, 95);
INSERT INTO RunningSubject VALUES ('CSCI204', 'AUTUMN', 2016, 123);

INSERT INTO RunningSubject VALUES ('CSCI235', 'AUTUMN', 2013, 80);
INSERT INTO RunningSubject VALUES ('CSCI235', 'SPRING', 2013, 92);
INSERT INTO RunningSubject VALUES ('CSCI235', 'AUTUMN', 2014, 99);
INSERT INTO RunningSubject VALUES ('CSCI235', 'SPRING', 2014, 95);
INSERT INTO RunningSubject VALUES ('CSCI235', 'AUTUMN', 2015, 112);
INSERT INTO RunningSubject VALUES ('CSCI235', 'SPRING', 2015, 120);
INSERT INTO RunningSubject VALUES ('CSCI235', 'AUTUMN', 2016, 132);

INSERT INTO RunningSubject VALUES ('CSCI222', 'AUTUMN', 2013, 65);
INSERT INTO RunningSubject VALUES ('CSCI222', 'SPRING', 2013, 78);
INSERT INTO RunningSubject VALUES ('CSCI222', 'AUTUMN', 2014, 82);
INSERT INTO RunningSubject VALUES ('CSCI222', 'SPRING', 2014, 102);
INSERT INTO RunningSubject VALUES ('CSCI222', 'AUTUMN', 2015, 130);
INSERT INTO RunningSubject VALUES ('CSCI222', 'SPRING', 2015, 121);
INSERT INTO RunningSubject VALUES ('CSCI222', 'AUTUMN', 2016, 99);

INSERT INTO RunningSubject VALUES ('CSCI317', 'AUTUMN', 2013, 35);
INSERT INTO RunningSubject VALUES ('CSCI317', 'SPRING', 2013, 42);
INSERT INTO RunningSubject VALUES ('CSCI317', 'AUTUMN', 2014, 23);
INSERT INTO RunningSubject VALUES ('CSCI317', 'SPRING', 2014, 31);
INSERT INTO RunningSubject VALUES ('CSCI317', 'AUTUMN', 2015, 41);
INSERT INTO RunningSubject VALUES ('CSCI317', 'SPRING', 2015, 25);
INSERT INTO RunningSubject VALUES ('CSCI317', 'AUTUMN', 2016, 40);

INSERT INTO RunningSubject VALUES ('CSCI321', 'AUTUMN', 2013, 90);
INSERT INTO RunningSubject VALUES ('CSCI321', 'SPRING', 2013, 32);
INSERT INTO RunningSubject VALUES ('CSCI321', 'AUTUMN', 2014, 112);
INSERT INTO RunningSubject VALUES ('CSCI321', 'SPRING', 2014, 43);
INSERT INTO RunningSubject VALUES ('CSCI321', 'AUTUMN', 2015, 128);
INSERT INTO RunningSubject VALUES ('CSCI321', 'SPRING', 2015, 22);

INSERT INTO RunningSubject VALUES ('CSCI979', 'AUTUMN', 2013, 12);
INSERT INTO RunningSubject VALUES ('CSCI979', 'SPRING', 2013, 5);
INSERT INTO RunningSubject VALUES ('CSCI979', 'AUTUMN', 2014, 6);
INSERT INTO RunningSubject VALUES ('CSCI979', 'SPRING', 2014, 8);
INSERT INTO RunningSubject VALUES ('CSCI979', 'AUTUMN', 2015, 4);
INSERT INTO RunningSubject VALUES ('CSCI979', 'SPRING', 2015, 10);

/*									*/
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* Association: ACADEMIC Teaches RUNNING SUBJECT			*/
/*									*/
CREATE TABLE Teaches(
code  		CHAR(7)		NOT NULL, /* Subject code		*/
asession	VARCHAR(7)	NOT NULL, /* Session running		*/
year		NUMBER(4)	NOT NULL, /* Year running		*/
lecturer	NUMBER(10)	NOT NULL, /* Lecturer			*/
	CONSTRAINT Teaches_pkey PRIMARY KEY( code, asession, year, lecturer ),
	CONSTRAINT Teaches_fkey1 FOREIGN KEY ( code, asession, year )  
				REFERENCES RunningSubject( code, asession, year ),
	CONSTRAINT RunningSubject_fkey2 FOREIGN KEY ( lecturer )
				REFERENCES Academic( staff# ) );

INSERT INTO Teaches VALUES ('CSCI124', 'AUTUMN', 2013, 1000000010);
INSERT INTO Teaches VALUES ('CSCI124', 'AUTUMN', 2013, 1000000015);
INSERT INTO Teaches VALUES ('CSCI124', 'SPRING', 2013, 1000000020);
INSERT INTO Teaches VALUES ('CSCI124', 'AUTUMN', 2014, 1000000020);
INSERT INTO Teaches VALUES ('CSCI124', 'SPRING', 2014, 1000000030);
INSERT INTO Teaches VALUES ('CSCI124', 'AUTUMN', 2015, 1000000030);
INSERT INTO Teaches VALUES ('CSCI124', 'SPRING', 2015, 1000000040);

INSERT INTO Teaches VALUES ('CSCI204', 'AUTUMN', 2013, 1000000015);
INSERT INTO Teaches VALUES ('CSCI204', 'SPRING', 2013, 1000000020);
INSERT INTO Teaches VALUES ('CSCI204', 'AUTUMN', 2014, 1000000030);
INSERT INTO Teaches VALUES ('CSCI204', 'SPRING', 2014, 1000000030);
INSERT INTO Teaches VALUES ('CSCI204', 'AUTUMN', 2015, 1000000050);
INSERT INTO Teaches VALUES ('CSCI204', 'SPRING', 2015, 1000000050);
INSERT INTO Teaches VALUES ('CSCI204', 'AUTUMN', 2016, 1000000050);

INSERT INTO Teaches VALUES ('CSCI235', 'AUTUMN', 2013, 1000000030);
INSERT INTO Teaches VALUES ('CSCI235', 'SPRING', 2013, 1000000040);
INSERT INTO Teaches VALUES ('CSCI235', 'AUTUMN', 2014, 1000000040);
INSERT INTO Teaches VALUES ('CSCI235', 'SPRING', 2014, 1000000050);
INSERT INTO Teaches VALUES ('CSCI235', 'AUTUMN', 2015, 1000000060);
INSERT INTO Teaches VALUES ('CSCI235', 'SPRING', 2015, 1000000050);
INSERT INTO Teaches VALUES ('CSCI235', 'AUTUMN', 2016, 1000000050);

INSERT INTO Teaches VALUES ('CSCI222', 'AUTUMN', 2013, 1000000080);
INSERT INTO Teaches VALUES ('CSCI222', 'SPRING', 2013, 1000000080);
INSERT INTO Teaches VALUES ('CSCI222', 'AUTUMN', 2014, 1000000110);
INSERT INTO Teaches VALUES ('CSCI222', 'SPRING', 2014, 1000000110);
INSERT INTO Teaches VALUES ('CSCI222', 'AUTUMN', 2015, 1000000120);
INSERT INTO Teaches VALUES ('CSCI222', 'SPRING', 2015, 1000000110);
INSERT INTO Teaches VALUES ('CSCI222', 'AUTUMN', 2016, 1000000070);

INSERT INTO Teaches VALUES ('CSCI317', 'AUTUMN', 2013, 1000000090);
INSERT INTO Teaches VALUES ('CSCI317', 'SPRING', 2013, 1000000080);
INSERT INTO Teaches VALUES ('CSCI317', 'AUTUMN', 2014, 1000000070);
INSERT INTO Teaches VALUES ('CSCI317', 'SPRING', 2014, 1000000070);
INSERT INTO Teaches VALUES ('CSCI317', 'AUTUMN', 2015, 1000000080);
INSERT INTO Teaches VALUES ('CSCI317', 'SPRING', 2015, 1000000070);
INSERT INTO Teaches VALUES ('CSCI317', 'AUTUMN', 2016, 1000000070);

INSERT INTO Teaches VALUES ('CSCI321', 'AUTUMN', 2013, 1000000010);
INSERT INTO Teaches VALUES ('CSCI321', 'SPRING', 2013, 1000000020);
INSERT INTO Teaches VALUES ('CSCI321', 'AUTUMN', 2014, 1000000015);
INSERT INTO Teaches VALUES ('CSCI321', 'SPRING', 2014, 1000000040);
INSERT INTO Teaches VALUES ('CSCI321', 'AUTUMN', 2015, 1000000040);
INSERT INTO Teaches VALUES ('CSCI321', 'SPRING', 2015, 1000000040);

INSERT INTO Teaches VALUES ('CSCI979', 'AUTUMN', 2013, 1000000030);
INSERT INTO Teaches VALUES ('CSCI979', 'SPRING', 2013, 1000000040);
INSERT INTO Teaches VALUES ('CSCI979', 'AUTUMN', 2014, 1000000050);
INSERT INTO Teaches VALUES ('CSCI979', 'SPRING', 2014, 1000000060);
INSERT INTO Teaches VALUES ('CSCI979', 'AUTUMN', 2015, 1000000070);
INSERT INTO Teaches VALUES ('CSCI979', 'SPRING', 2015, 1000000080);

/*									*/
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* End of script                                                        */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
PROMPT Done.
