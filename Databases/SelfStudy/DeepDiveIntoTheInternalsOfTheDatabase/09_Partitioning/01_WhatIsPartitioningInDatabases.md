### What Is Partitioning in Databases?

~~~hmtl
- Partitioning a database is the process of breaking down a massive dataset into smaller datasets and distributing these smaller datasets across multiple host machines. Every host instance can hold multiple smaller datasets.

- Every record in the database belongs to exactly one partition. Each partition acts as a database that can perform read and write operations on its own. We can either fire the database query targeting a single partition or scatter it across multiple partitions.
~~~

### There are two ways to scale a database:
1. Vertical scaling
2. Horizontal scaling

