SELECT text, blocked_by_query, blocked_by_session_id, wait_time_s, wait_type
FROM qpi.blocked_queries;

-- Tips:
-- You can unblock the query using KILL <blocked_by_session_id> if you are sure that blocking query is stuck.
-- You can find the locks that other queries are holding using:
-- SELECT * FROM qpi.query_locks;