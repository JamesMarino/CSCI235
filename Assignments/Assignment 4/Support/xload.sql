
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     10.1
   Title:          How to use XPath query language ?
   Script name:    xload.sql
   Task:           To load XML document into XML table
   Created by:     Janusz R. Getta
   Created on:	   04 Apr 2013
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO OFF
SET FEEDBACK ON
SET TERMOUT OFF

host echo TRUNCATE TABLE XML;       >qqq.sql
host echo INSERT INTO XML VALUES(' >>qqq.sql
host type &1                       >>qqq.sql
host echo ');                      >>qqq.sql
SET TERMOUT ON
SET ECHO ON
@qqq
SET ECHO OFF

prompt Done.
