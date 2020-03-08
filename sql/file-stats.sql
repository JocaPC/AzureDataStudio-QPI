-- Gets the file IO statistics for the current database since the last snapshot
select * from qpi.db_file_stats; 

-- Tips:
-- use qpi:snapshot file stats to take more recent file snapshot
-- use qpi.file_stats to get the statistics of all database files (including other databases)