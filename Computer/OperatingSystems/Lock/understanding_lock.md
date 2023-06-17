### where to use lock
~~~html
- You need to use locks in programming when you have multiple threads that may access shared resources concurrently, potentially causing unpredictable results or data races. Locks help ensure that only one thread at a time can access the resource, maintaining data consistency and integrity.

- In the context of multiple processing, using locks is not always the best approach, as it can limit the parallelism and efficiency of your code
~~~

### Errors that can happen when using locks include:
~~~html
1. Deadlocks: This occurs when two or more transactions are waiting for each other to release the locks they hold, leading to a circular wait and preventing the transactions from proceeding.

2. OptimisticLockException: This exception occurs when there are conflicting updates on entities in an optimistic locking scenario. In optimistic locking, version attributes are included in entities to control concurrent modifications, ensuring that updates or deletes won't be overwritten or lost silently. However, if two transactions try to update the same entity simultaneously, an OptimisticLockException is raised.

3. Cascading rollbacks: When using certain lock-based protocols, like the basic two-phase locking (2PL) protocol, cascading rollbacks can happen. If one transaction has to roll back, other dependent transactions may also need to roll back, leading to a cascade effect.
~~~

### what advisory lock vs mandotory lock


[source](https://academickids.com/encyclopedia/index.php/Lock_%28software_engineering%29)
