```sql
EXPLAIN

SELECT *
FROM table_a
```

#### explain options
1. Analyze
2. BUFFERS
3. VERBOSE
4. SETTINGS
5. WAL


[source](https://www.cybertec-postgresql.com/en/how-to-interpret-postgresql-explain-analyze-output/)


### noted

```html
hi mn,

- khi mình dùng explain analyze để phân tích một query thì excecution time là bao nhiêu ms thì chấp nhận được, và bao nhiêu ms gọi là lâu nhỉ?

-> Cái này tuỳ công ty anh, có công ty dưới 10ms, có chỗ dưới 20ms, bên mình thì hiện tại chưa thấy force nhưng dưới 100ms là được
```
