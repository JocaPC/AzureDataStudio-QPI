select top 20 category, wait_type, waiting_tasks_count, 
wait_time_s, wait_per_task_ms, max_wait_time_ms, 
signal_wait_time_s
from qpi.wait_stats
order by wait_per_task_ms desc;