### what is database view
~~~html
A database view is a virtual table representing the result of a query on one or more
underlying tables or views in a database
~~~

### pros
1. Simplify complex SQL operations: Database views can make complex queries more manageable and easier to understand
- source: aristeksystems.com
2. Data protection and access restriction: You can grant access to specific parts of a table without giving access to the entire table
- source: aristeksystems.com, stackoverflow.com, mssqlplanner.com.
3. Flexibility: Views allow you to change underlying data structures without affecting application queries, as long as the view can hide the data structures
- source: stackoverflow.com.
4. No physical storage: Views don't store data in a physical location, which saves space - - source: mssqlplanner.com.

### cons
1. Performance issues: Query details are hidden, which may cause performance problems. It can be difficult to trace the issue if you're not aware that you're using a view instead of a regular table
- source: aristeksystems.com.
2. Irrelevant views: When a table is dropped, associated views become irrelevant
- source: mssqlplanner.com.
3. Slower queries: Since views are created when a query requesting data from the view is triggered, they can be slower than querying the underlying tables directly
- source: mssqlplanner.com.
4. Memory usage: When views are created for large tables, they can occupy more memory
- source: mssqlplanner.com.
