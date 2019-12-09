select * from qpi.memory_buffers
where db_name not in ('model_replicatedmaster', 'model_msdb', 'replicated_master', 'Resource DB');