SELECT TOP 10 query_id, [TempDB used(MB)] = tempdb_used_mb,
		[text],
		[Duration(sec)] = CAST(duration_s AS NUMERIC(8,1)), count_executions, [CPU(sec)] = CAST(cpu_time_ms AS NUMERIC(8,1))/1000
FROM qpi.db_query_exec_stats_history
WHERE tempdb_used_mb > 1
ORDER BY tempdb_used_mb DESC
