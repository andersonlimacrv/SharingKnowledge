[source](https://medium.ninja/geekculture/how-to-read-and-understand-explain-query-plans-in-postgresql-8179299fd613)


### example
~~~sql
-- ...
Hash Join  (cost=373.26..381.11 rows=3 width=294)
-- ...
~~~


~~~html
1. start-up cost (cost=373.26) is the estimated Postgres computational units to start up a node to start process the query.
2. total cost (381.11) is the estimated Postgres computational units to finish process the query and return results.
3. output rows (rows=3) is the estimated number of rows returned.
4. width or average (width=294) row size (in bytes) is the estimated size of each output row.
~~~


~~~html
- Hash Join: The first operation is a Hash Join, which means that the database will use a hash table to join the data from the “office” table and the “city” table based on the “city_id” column.

- Bitmap Heap Scan on Office: The next operation is a Bitmap Heap Scan on the “office” table. This means that the database will use a bitmap to identify the rows from the table that match the condition “office_id < ‘10’”.

- Bitmap Index Scan on Office_pkey: The bitmap is then used to scan the index “office_pkey” to identify the matching rows.

- Hash: The next operation is a Hash, which is used to create a hash table of the data from the “city” table.

- Seq Scan on City: The final operation is a Sequential Scan on the “city” table, which means that the database will read the entire table to return the matching rows.
~~~
