```ruby
Model_A.find_by(id: "123").explain
```


```ruby
# Running explain analyze with AR

query = %{
  EXPLAIN ANALYZE
  SELECT *
  FROM table_a
}

puts ActiveRecord::Base.connection.exec_query(query)
```
