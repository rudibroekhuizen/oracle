select 'message_level: '||message_level, 'originating_timestamp: '||to_char(originating_timestamp,'DD-MM-YYYY HH24:MI:SS') from x$dbgalertext where originating_timestamp > sysdate-8/24;
