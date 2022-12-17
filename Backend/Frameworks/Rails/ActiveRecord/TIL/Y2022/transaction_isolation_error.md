```html
TransactionIsolationError will be raised under the following conditions:

1. The adapter does not support setting the isolation level
2. You are joining an existing open transaction
3. You are creating a nested (savepoint) transaction

The mysql2 and postgresql adapters support setting the transaction isolation level.
```

[source](https://api.rubyonrails.org/classes/ActiveRecord/TransactionIsolationError.html)
