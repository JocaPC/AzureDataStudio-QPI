SELECT query_id, [read(MB)] = physical_io_reads_kb/1024, [Duration(sec)] = CAST(duration_s AS NUMERIC(8,1)), count_executions, [CPU(sec)] = CAST(cpu_time_ms AS NUMERIC(8,1))/1000, text
FROM qpi.db_query_exec_stats_history
order by physical_io_reads_kb desc