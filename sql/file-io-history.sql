select  cast(datepart(hour, start_time) as char(2)) +':'+ cast(datepart(mi, start_time) as char(2)),
        [logwrite(mbps)] = sum(case when type = 'LOG' then write_mbps else 0 end),
        [logwrite_latency(ms)] = max(case when type = 'LOG' then write_latency_ms else null end)
from qpi.file_stats_history
where DATEDIFF(hour, start_time, GETUTCDATE()) < 4
group by start_time
order by start_time asc
