### ACID: Atomicity, Consistency, Isolation, and Durability
1. Atomicity
2. Consistency
3. Isolation
~~~html
- is a fundamental property of database systems that ensures the concurrent execution of transactions does not interfere with each other.
- It is one of the ACID (Atomicity, Consistency, Isolation, and Durability) properties that guarantee database transactions are processed reliably.
- Isolation levels determine the degree to which a transaction is isolated from other transactions, with higher levels providing more strict isolation.
~~~
4. Durability


### More about Isolation
~~~html
There are four standard isolation levels in SQL databases:

1. Read Uncommitted: This is the lowest isolation level, where transactions can read uncommitted data (also known as dirty reads). It can lead to issues such as dirty reads and lost updates.

2. Read Committed: Transactions can only read data that has been committed by other transactions. This level prevents dirty reads but can still experience non-repeatable reads and phantom reads.

3. Repeatable Read: Transactions can only read committed data, and repeated reads of the same data will always return the same result. This level prevents dirty reads and non-repeatable reads but can still experience phantom reads.

4. Serializable: This is the highest isolation level, where transactions are fully isolated from each other. It prevents dirty reads, non-repeatable reads, and phantom reads, but can have a performance impact due to increased locking.
~~~

### How to use Isolation
1. Read Uncommitted
~~~html
Use this isolation level when performance is more important than data consistency, and you can tolerate dirty reads. This is not recommended for most applications, but it could be useful in specific situations where you need to quickly read data without waiting for locks.
~~~

~~~ruby
ActiveRecord::Base.transaction(isolation: :read_uncommitted) do
  # Read data quickly without waiting for locks
  data = SomeModel.where(some_condition: true)
end
~~~

2. Read Committed
~~~html
This is the default isolation level in PostgreSQL and Oracle. Use this level when you want to ensure that you read only committed data and prevent dirty reads. This is suitable for most applications where data consistency is important.
~~~

~~~ruby
ActiveRecord::Base.transaction(isolation: :read_committed) do
  # Perform operations that require reading committed data
  user = User.find(user_id)
  user.update!(balance: user.balance - transaction_amount)
end
~~~

3. Repeatable Read
~~~html
Use this level when you want to prevent non-repeatable reads. This level keeps read and write locks on selected data until the end of the transaction. However, it does not prevent phantom reads.
~~~

~~~ruby
ActiveRecord::Base.transaction(isolation: :repeatable_read) do
  # Perform operations that require repeatable reads
  order = Order.find(order_id)
  order_items = order.order_items

  # Re-fetch the order_items to ensure they haven't changed
  order_items_again = order.order_items
  raise "Order items changed during transaction" unless order_items == order_items_again

  # Process the order
end
~~~

4.Serializable
~~~html
This is the highest isolation level, which prevents both non-repeatable reads and phantom reads. Use this level when you need the strictest data consistency guarantees.
~~~

~~~ruby
ActiveRecord::Base.transaction(isolation: :serializable) do
  # Perform operations that require strict data consistency
  inventory_item = InventoryItem.lock.find(item_id)
  raise "Not enough stock" if inventory_item.stock < required_quantity

  # Update the inventory and create an order
  inventory_item.update!(stock: inventory_item.stock - required_quantity)
  order = Order.create!(user_id: user_id, inventory_item_id: item_id, quantity: required_quantity)
end
~~~

~~~html
Remember that the isolation level support depends on the database system you are using, and the default isolation level might be different depending on the database system
~~~
