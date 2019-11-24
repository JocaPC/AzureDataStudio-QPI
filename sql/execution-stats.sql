select top 50 start_time,
    [type] = execution_type_desc,
	[queries/s] =  sum(count_executions)/ min(interval_mi) /60,
	[cpu %] = ROUND(100. * (sum(count_executions*cpu_time_ms) /1000.)
                / ( min(interval_mi) * 60)
                /  (SELECT top 1 cpu_count FROM qpi.sys_info)/*cores*/,1)
from qpi.db_query_plan_exec_stats_history
group by start_time, execution_type_desc
order by start_time desc;