select wait_type, wait_per_task_ms
from qpi.wait_stats
where category not in ('Preemptive','Replication','Idle','Tracing')
order by wait_per_task_ms desc;