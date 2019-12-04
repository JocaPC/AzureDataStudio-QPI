SELECT query_id, [Duration(sec)] = CAST(duration_s AS NUMERIC(8,1)), count_executions, [CPU(sec)] = CAST(cpu_time_ms AS NUMERIC(8,1)),  text
FROM qpi.db_query_exec_stats_history
order by cpu_time_ms desc

