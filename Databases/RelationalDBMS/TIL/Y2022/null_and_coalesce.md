### why NULL
- data không có giá trị
- left join bị thiếu
- case when bị thiếu

### rescue NULL with Coalesce

```sql
-- nếu giá trị đầu tiên là null thì sẽ lấy "no data"
coalesce(<null_value>, "no data")
```
