SELECT query_id, [TempDB used(MB)] = tempdb_used_mb,
		[Duration(sec)] = CAST(duration_s AS NUMERIC(8,1)), count_executions, [CPU(sec)] = CAST(cpu_time_ms AS NUMERIC(8,1))/1000,
		text
FROM qpi.db_query_exec_stats_history
order by tempdb_used_mb desc
