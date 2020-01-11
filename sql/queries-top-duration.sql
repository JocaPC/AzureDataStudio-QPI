SELECT TOP 10 query_id,
            [Duration(sec)] = CAST(duration_s AS NUMERIC(8,1)),
            text,
            count_executions, [CPU(sec)] = CAST(cpu_time_ms AS NUMERIC(8,1))/1000
FROM qpi.db_query_exec_stats_history
order by duration_s desc