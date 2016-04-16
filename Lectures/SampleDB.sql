CREATE TABLE Department(
	name VARCHAR2(50),
	code CHAR(5),
	total_staff_number NUMBER(2) NOT NULL,
	Chair VARCHAR2(50),
	budget NUMBER(9,1) NULL,
	CONSTRAINT dept_pkey PRIMARY KEY(name), CONSTRAINT dept_ckey1 UNIQUE(code),
	CONSTRAINT dept_ckey2 UNIQUE(chair),
	CONSTRAINT dept_check1 CHECK (total_staff_number BETWEEN 1 AND 50)
);

CREATE TABLE Course(
	c# CHAR(7),
	title VARCHAR2(200) NOT NULL,
	credits NUMBER(1) NOT NULL,
	offered_by VARCHAR2(50) NULL,
	CONSTRAINT course_pkey PRIMARY KEY(c#), CONSTRAINT course_check1 CHECK (credits IN (6, 12)),
	CONSTRAINT course_fkey1 FOREIGN KEY(offered_by) REFERENCES Department(name)
);
