[source](https://alxibra.medium.com/isolation-level-in-rails-847edc9e347d)
[source](https://viblo.asia/p/hieu-ro-hon-ve-transaction-trong-rails-aWj538yGK6m)
[source](https://apidock.com/rails/ActiveRecord/ConnectionAdapters/DatabaseStatements/transaction)

### các mức isolation được cung cấp trong rails

~~~html
1. read_uncommitted: Khi transaction thực hiện ở mức này, các truy vấn vẫn có thể truy nhập vào các bản ghi đang được cập nhật bởi một transaction khác và nhận được dữ liệu tại thời điểm đó mặc dù dữ liệu đó chưa được commit (uncommited data). Nếu vì lý do nào đó transaction ban đầu rollback lại những cập nhật, dữ liệu sẽ trở lại giá trị cũ. Khi đó transaction thứ hai nhận được dữ liệu sai.

2. read_committed: Transaction sẽ không đọc được dữ liệu đang được cập nhật mà phải đợi đến khi việc cập nhật thực hiện xong. Vì thế nó tránh được dirty read như ở mức trên.

3. repeatable_read: Mức isolation này hoạt động nhứ mức read commit nhưng nâng thêm một nấc nữa bằng cách ngăn không cho transaction ghi vào dữ liệu đang được đọc bởi một transaction khác cho đến khi transaction khác đó hoàn tất.

4. serializable: Mức isolation này tăng thêm một cấp nữa và khóa toàn bộ dải các bản ghi có thể bị ảnh hưởng bởi một transaction khác, dù là UPDATE/DELETE bản ghi đã có hay INSERT bản ghi mới. Nếu bạn thay cửa sổ 1 bằng đoạn code
~~~

### phạm vi áp dụng các mức isolation
|Mức Isolation    |	Dirty read	|Nonrepeatable read	|Phantom read|
|================================================================|
|read_uncommitted |	Yes					|Yes								|Yes         |
|read_committed	 	|	No					|Yes								|Yes				 |
|repeatable_read  |	No					|No									|Yes 				 |
|serializable	   	|	No					|No									|No          |


~~~ruby
# If your database supports setting the isolation level for a transaction, you can set it like so:
Post.transaction(isolation: :serializable) do
  # ...
end
~~~
