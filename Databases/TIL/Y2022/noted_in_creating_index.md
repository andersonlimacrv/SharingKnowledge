```sql
CREATE INDEX index_name ON table_name (column_name);
```

- đánh index theo cú pháp trên thì PostgreSQL sẽ lock table để tạo index


```sql
CREATE INDEX CONCURRENTLY index_name ON table_name (column_name);
```

```html
Khi sử dụng tùy chọn này được sử dụng thì PostgreSQL phải thực hiện hai lần quét bảng, và nó sẽ đợi tất cả các giao dịch hiện có làm thay đổi đến database chấm dứt để thực hiện. Và hẳn nhiên khi khối lượng công việc nhiều lên như vậy thì phương pháp tạo index này sẽ tiêu tốn tài nguyên hơn thông thường đáng kể. Tuy nhiên, vì nó cho phép các hoạt động bình thường tiếp tục trong khi tạo index, nên phương pháp này rất hữu ích để thêm các index mới trong môi trường production.
```


[source](https://viblo.asia/p/investigation-tao-va-quan-ly-index-postgresql-gAm5yrMXKdb)
