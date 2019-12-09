select  qsi.*,
        [Query store] = qso.actual_state_desc,
        [(GB) Query store] = qso.current_storage_size_mb/1024
from qpi.sys_info qsi, sys.database_query_store_options qso