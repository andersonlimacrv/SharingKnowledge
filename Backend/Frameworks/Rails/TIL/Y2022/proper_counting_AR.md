### count
	it performs SQL COUNT query to the database

### size
	- performs SQL COUNT query to the database when records are not loaded into memory, and if they are, it calls simply length on them

### length
	- it loads objects into memory and count them - it does not have its implementation in the ActiveRecord library

### The best practices are the following:
- use count if you want to just count records, for example, in the controller or model
- use size if you want to count records in the view or if you are not sure if they were loaded in the memory
- don’t use length on ActiveRecord’s collection

[source](https://longliveruby.com/level-ups/counting-records-with-active-record)
