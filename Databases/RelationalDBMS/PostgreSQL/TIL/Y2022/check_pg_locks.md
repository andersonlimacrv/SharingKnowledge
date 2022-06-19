```sql
SELECT DISTINCT age(now(), query_start) AS age, pg_stat_activity.pid,pg_locks.granted,pg_stat_activity.application_name,pg_stat_activity.backend_start, pg_stat_activity.xact_start, pg_stat_activity.state_change, pg_stat_activity.state, pg_stat_activity.query_start, left(pg_stat_activity.query, 60)
    FROM pg_stat_activity, pg_locks
    WHERE pg_locks.pid = pg_stat_activity.pid
```


### To clear a lock, run this SQL against your DB:

```sql
select pg_advisory_unlock({the pid of the lock you want to release})
```
