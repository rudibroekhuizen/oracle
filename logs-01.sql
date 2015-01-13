-- this will hopefully provide input for logstash
-- sqlplus -s / as sysdba @logs-01.sql > log.txt

set echo off
set verify off
set feedback off
set head off
set wrap off

-- show complete rows
set linesize 32767

-- show all rows without printing colomn names again:
set pagesize 0

column col01 newline
column col02 newline
column col03 newline

select 'originating_timestamp: '||to_char(originating_timestamp,'DD-MM-YYYY HH24:MI:SS') col01,
       'message_level:         '||message_level col02,
       'message_text:          '||message_text col03
from x$dbgalertext where where originating_timestamp > sysdate-1/24;
exit
