select * from qpi.memory_buffers
where db_name not in ('master','model','msdb', 'model_replicatedmaster', 'model_msdb', 'replicated_master', 'Resource DB');