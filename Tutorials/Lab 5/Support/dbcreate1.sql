SET ECHO ON
SET LINESIZE 200
SET WRAP OFF

CREATE TABLE SKILL(
sname	      VARCHAR(30)     NOT NULL, /* Skill name          		*/
sclass		  VARCHAR(20)     NOT NULL, /* Skill class              */
	CONSTRAINT SKILL_pkey PRIMARY KEY ( sname ) );

INSERT INTO SKILL VALUES ( 'CORBA programming', 'programming' );
INSERT INTO SKILL VALUES ( 'C++ programming', 'programming' );
INSERT INTO SKILL VALUES ( 'C programming', 'programming' );
INSERT INTO SKILL VALUES ( 'Java programming', 'programming' );
INSERT INTO SKILL VALUES ( 'database design', 'design' );
INSERT INTO SKILL VALUES ( 'SQL programming', 'programming' );
INSERT INTO SKILL VALUES ( 'database administration', 'administration' );
INSERT INTO SKILL VALUES ( 'painting', 'manual' );
INSERT INTO SKILL VALUES ( 'cooking', 'manual' );
INSERT INTO SKILL VALUES ( 'driving', 'manual' );
INSERT INTO SKILL VALUES ( 'network administration', 'administration' );
INSERT INTO SKILL VALUES ( 'Web design', 'design' );
INSERT INTO SKILL VALUES ( 'PHP programming', 'programming' );
INSERT INTO SKILL VALUES ( 'accounting', 'finance' );
INSERT INTO SKILL VALUES ( 'bricklaying', 'manual' );
INSERT INTO SKILL VALUES ( 'concreting', 'manual');
INSERT INTO SKILL VALUES ( 'reading', 'general' );
INSERT INTO SKILL VALUES ( 'writing', 'general' );
INSERT INTO SKILL VALUES ( 'thinking', 'general' );

CREATE TABLE SREQUIRED(
sname	      VARCHAR(30)     NOT NULL, /* Skill name          		*/
requires      VARCHAR(30)     NOT NULL, /* Skill required		*/
slevel        NUMBER(2)	      NOT NULL, /* Level required		*/
	CONSTRAINT SREQUIRED_pkey PRIMARY KEY ( sname, requires ),
	CONSTRAINT SREQUIRED_fkey1 FOREIGN KEY ( sname)
		REFERENCES SKILL( sname ),
	CONSTRAINT SREQUIRED_fkey2 FOREIGN KEY ( requires )
		REFERENCES SKILL( sname ) );

INSERT INTO SREQUIRED VALUES ( 'CORBA programming', 'C++ programming', 5);
INSERT INTO SREQUIRED VALUES ( 'C++ programming', 'C programming', 5);
INSERT INTO SREQUIRED VALUES ( 'Java programming', 'C programming', 5);
INSERT INTO SREQUIRED VALUES ( 'PHP programming', 'C programming', 5);
INSERT INTO SREQUIRED VALUES ( 'C programming', 'reading', 10);
INSERT INTO SREQUIRED VALUES ( 'C programming', 'writing', 10);
INSERT INTO SREQUIRED VALUES ( 'database administration', 'SQL programming', 8 );
INSERT INTO SREQUIRED VALUES ( 'network administration', 'reading', 10);
INSERT INTO SREQUIRED VALUES ( 'network administration', 'writing', 10);
INSERT INTO SREQUIRED VALUES ( 'accounting', 'reading', 10);
INSERT INTO SREQUIRED VALUES ( 'accounting', 'writing', 10);
INSERT INTO SREQUIRED VALUES ( 'SQL programming', 'reading', 5 );
INSERT INTO SREQUIRED VALUES ( 'SQL programming', 'writing', 5 );
INSERT INTO SREQUIRED VALUES ( 'SQL programming', 'thinking', 10 );
