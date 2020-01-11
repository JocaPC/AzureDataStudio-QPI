SELECT TOP 10 query_id,
        [CPU(sec)] = CAST(cpu_time_ms AS NUMERIC(8,1))/1000,  text,
        [Duration(sec)] = CAST(duration_s AS NUMERIC(8,1)), 
        count_executions
FROM qpi.db_query_exec_stats_history
order by cpu_time_ms desc

