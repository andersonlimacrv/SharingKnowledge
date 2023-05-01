### Naming convention for Redis Key and Namespace
- If all of your data has to be stored in a single database, please create a namespace with a key prefix.

- example

~~~sql
// Set keys for Saving account

SET Saving:key1 value
SET Saving:key2 value

// Set keys for Credit Account

SET Credit:key1 value
SET Credit:key2 value


// Set keys for Personal account

SET Personal:key1 value
SET Personal:key2 value
~~~

### Size/Lenth of Redis Key and Namespace
- Any key above 1024 bytes is not recommended as key size may cause issues considering memory and bandwidth.

+ Redis key size max is 512 MB.
+ Redis Value size max is 512 MB.


### Manage Key Expiration in Redis Cache
- Managing the key Expiration is an important aspect while managing the keys in Reds cache.
- Understand your datastore pattern.
- Carefully check the data expiration. Too short Key expiration will make objects to expires sooner in Cache thereby increasing the call to your backend server also too long data will make you used stale old data producing issues.
[source](https://www.thecodebuzz.com/redis-cache-best-practices-development/)
