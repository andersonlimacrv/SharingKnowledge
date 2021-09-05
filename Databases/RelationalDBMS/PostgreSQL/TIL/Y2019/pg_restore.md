```ruby
pg_restore --verbose --host <db_host> --username <db_username> --clean --no-owner --no-acl --dbname <db_name> /<path_to_pg_dump_file>
```

### other way

```bash
psql <your_db_name>

\i '<your_path_to_dump_sql>'
```
