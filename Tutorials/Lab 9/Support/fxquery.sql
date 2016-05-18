
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     10.2
   Title:          How to use XQath query language ?
   Script name:    fxquery.sql
   Task:           To execute XQuery query stored in a file
   Created by:     Janusz R. Getta
   Created on:	   06 Apr 2013
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET TERMOUT OFF
SET SERVEROUTPUT ON
SET LONG 2000

  host echo DECLARE                                       >qqq.sql
  host echo result   XMLType;                            >>qqq.sql
  host echo buf      VARCHAR(20000);                     >>qqq.sql
  host echo doc      DBMS_XMLDOM.DOMDocument;            >>qqq.sql
  host echo BEGIN                                        >>qqq.sql
  host echo SELECT XMLQuery(                             >>qqq.sql
  host echo '                                            >>qqq.sql
  host type &1                                           >>qqq.sql
  host echo ' PASSING X RETURNING CONTENT)               >>qqq.sql
  host echo   INTO result                                >>qqq.sql
  host echo   FROM XML;                                  >>qqq.sql
  host echo   doc  := DBMS_XMLDOM.newDOMDocument(result);>>qqq.sql
  host echo   DBMS_XMLDOM.writeToBuffer(doc, buf);       >>qqq.sql
  host echo   DBMS_OUTPUT.put_line(buf);                 >>qqq.sql
  host echo END;                                         >>qqq.sql
  host echo /                                            >>qqq.sql
SET TERMOUT ON
@qqq

prompt Done.
