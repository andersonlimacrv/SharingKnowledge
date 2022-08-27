```sql
select
	a.relname,
	a.indexrelname,
	a.idx_scan,
	c.n_live_tup
from
	pg_stat_user_indexes a
inner join pg_index b on
	a.indexrelid = b.indexrelid
	and indisunique is false
inner join
    pg_stat_user_tables c on
    a.relname = c.relname
order by
	3 asc
	, 4 desc
limit 100
```


### n_live_tup:
### idx_scan:
