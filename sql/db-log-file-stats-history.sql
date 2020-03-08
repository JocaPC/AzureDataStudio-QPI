-- Returns IO statistics for database data files (mdf/ndf):
select  [time] = CONVERT(VARCHAR(5), CAST(start_time AS smalldatetime), 108),
        [Write(MB/s)] = SUM(write_mbps),
        [IO(MB/s)] = SUM(throughput_mbps),
        [IO/sec] = SUM(iops),
        [Read latency(ms)] = AVG(read_latency_ms),
        [Write latency(ms)] = AVG(write_latency_ms)
from qpi.db_file_stats_history
where type = 'log'
and start_time >= DATEADD(hh, -24, GETUTCDATE())
group by CAST(start_time AS smalldatetime)
order by CAST(start_time AS smalldatetime) asc

-- Tips:
-- Add columns in SELECT [Total reads] = SUM(num_of_reads), [Total writes] = SUM(num_of_writes)
-- use qpi:snapshot to take more recent snapshot of file io statistics.