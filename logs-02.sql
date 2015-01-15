Check this: https://github.com/rudibroekhuizen/puppet-role_logstash/blob/master/files/logstash-oraclelog-02.conf

select 'message_level: '||message_level, 'originating_timestamp: '||to_char(originating_timestamp,'DD-MM-YYYY HH24:MI:SS') from x$dbgalertext where originating_timestamp > sysdate-8/24;

select 'message_level='||message_level, 'originating_timestamp='||to_char(originating_timestamp,'DD-MM-YYYY HH24:MI:SS') from x$dbgalertext where originating_timestamp > sysdate-8/24;
message_level=16							 originating_timestamp=13-01-2015 08:58:31
message_level=16							 originating_timestamp=13-01-2015 10:00:48
message_level=16							 originating_timestamp=13-01-2015 11:10:14
message_level=16							 originating_timestamp=13-01-2015 12:14:39
message_level=16							 originating_timestamp=13-01-2015 13:16:56
message_level=16							 originating_timestamp=13-01-2015 14:19:55
message_level=16							 originating_timestamp=13-01-2015 15:20:46
message_level=16							 originating_timestamp=13-01-2015 16:21:37
