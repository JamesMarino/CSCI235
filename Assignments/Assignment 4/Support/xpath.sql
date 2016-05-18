
SET ECHO OFF
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Experiment:     10.1
   Title:          How to use XPath query language ?
   Script name:    xpath.sql
   Task:           To execute XPath query
   Created by:     Janusz R. Getta
   Created on:	   05 Apr 2013
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

SET ECHO OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET LONG 2000
SET SERVEROUTPUT ON

DECLARE
result   XMLType;
buf      VARCHAR(20000);
doc      DBMS_XMLDOM.DOMDocument;
BEGIN
  SELECT XMLType.EXTRACT(X,'&1')
  INTO result
  FROM XML;
  doc  := DBMS_XMLDOM.newDOMDocument(result);
  DBMS_XMLDOM.writeToBuffer(doc, buf);
  DBMS_OUTPUT.put_line(buf);
END;
/

SET FEEDBACK ON
SET VERIFY ON
SET ECHO ON

prompt Done.
