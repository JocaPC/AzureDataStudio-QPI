select category, [wait time(sec)] = sum(wait_time_s)
from qpi.wait_stats
where category not in ('Preemptive','Replication')
group by category_id, category
order by sum(wait_time_s) desc