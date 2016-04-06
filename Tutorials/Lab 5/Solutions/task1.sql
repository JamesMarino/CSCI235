SET ECHO ON;
SPOOL task1.lst;

-- Question 1
SELECT S2.REQUIRES FROM SREQUIRED S1 JOIN SREQUIRED S2 ON S1.requires = S2.sname WHERE S1.sname = 'C++ programming';

-- Question 2
SELECT S2.sname FROM SREQUIRED S1 JOIN SREQUIRED S2 ON S1.sname = S2.requires WHERE S1.requires = 'writing';

SPOOL OFF;
