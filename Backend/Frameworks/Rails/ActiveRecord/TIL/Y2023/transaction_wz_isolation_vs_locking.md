### transaction with isolation vs locking
~~~html
- Rails transactions and locking are two powerful features that can be used to ensure data consistency and prevent race conditions in concurrent systems. Here's a brief explanation of each feature, and when to use it:


- Transactions group multiple database operations into a single atomic unit, while isolation levels determine how much a transaction is isolated from other concurrent transactions. By choosing the appropriate isolation level, we can balance the need for data consistency with the need for concurrent access to the database.
~~~

1. Transactions:
~~~html
A transaction is a way to group a set of database operations into a single atomic unit. If any of the operations in the transaction fail, then the entire transaction will be rolled back, ensuring that the database is left in a consistent state. Transactions are particularly useful when multiple database operations need to be performed together, such as updating multiple tables or creating multiple records.

- Example:
Suppose we have a Rails application that allows users to buy and sell products. When a user makes a purchase, we want to deduct the purchase amount from their account balance and add a new transaction record to the database. We can use a transaction to ensure that both operations happen together, and that the database remains consistent even if one of the operations fails:
~~~

~~~ruby
User.transaction do
  user.decrement!(:balance, purchase_amount)
  Transaction.create!(user: user, amount: purchase_amount, transaction_type: 'purchase')
end
~~~

2. Locking:
~~~html
- Locking is a way to prevent multiple threads or processes from accessing the same data at the same time, which can cause race conditions and data inconsistencies. There are two types of locks in Rails: pessimistic locking and optimistic locking.

- Pessimistic locking: This type of locking is used when we want to prevent other processes from accessing a resource while we are using it. When we acquire a pessimistic lock, other processes will be blocked until we release the lock. Pessimistic locking is typically used when we are performing a long-running operation that requires exclusive access to a resource, such as updating a record.

Example:
Suppose we have a Rails application that allows users to reserve seats on a flight. When a user selects a seat, we want to prevent other users from selecting the same seat until the reservation is complete. We can use pessimistic locking to ensure that only one user can reserve a seat at a time:
~~~

~~~ruby
seat = Seat.find(params[:seat_id])
seat.with_lock do
  if seat.available?
    reservation = Reservation.create!(user: current_user, seat: seat)
    redirect_to reservation
  else
    flash[:error] = "Sorry, that seat is no longer available"
    redirect_to root_path
  end
end
~~~

~~~html
- Optimistic locking: This type of locking is used when we want to prevent data inconsistencies that can occur when multiple processes update the same record simultaneously. When we enable optimistic locking on a record, Rails will add a version number to the record, and any updates to the record must include the correct version number, or else the update will fail.

Example:
Suppose we have a Rails application that allows users to edit blog posts. When a user updates a blog post, we want to ensure that no other user has edited the post in the meantime. We can use optimistic locking to prevent conflicting updates:
~~~

~~~ruby
post = Post.find(params[:id])
post.update!(title: params[:title], body: params[:body], updated_at: Time.now)
~~~

==========================================================================================

- When should I use a transaction?

~~~html
Whenever you make an operation that affects more than a single database row, you should always use a transaction.

Note that in Rails, ActiveRecord::Base#save automatically opens a transaction. Hence changes you make in callbacks, nested attributes processing, etc. will automatically run inside a transaction.
~~~

~~~html
Các thuộc tính của Transaction

1. Atomicity: Một transaction xác định ranh giới của nó rất rõ ràng, tức xác định điểm bắt đầu và kết thúc của tiến trình. Như vậy có thể coi nó như một đơn vị thực thi và đơn vị thực thi này thực hiện theo nguyên tắc “all or nothing”. Nghĩa là nếu một thành phần nào đó trong transaction thực thi lỗi thì đồng nghĩa với việc không có gì xảy ra tức không có gì thay đổi về mặt dữ liệu.

2. Consistency: Dữ liệu nhất quán với transaction ở thời điểm bắt đầu và kết thúc hay bảo đảm rằng Database thay đổi một cách chính xác trạng thái theo một transaction đã được commit thành công.

3. Isolation: Các transaction có khả năng hoạt động một cách độc lập và không liên quan đến nhau.

4. Durability: Dữ liệu của transaction sau khi thực thi xong được cố định, chính thức và bền vững. Nghĩa là những thay đổi đã được cố định, không có chuyện có thể chuyển lại trạng thái dữ liệu lúc trước khi thực hiện transaction.
~~~

[source](https://makandracards.com/makandra/31937-differences-between-transactions-and-locking)
[source](https://medium.ninja/inspiredbrilliance/what-are-database-locks-1aff9117c290)
[source](https://viblo.asia/p/what-is-transaction-6J3ZgOzRZmB)
