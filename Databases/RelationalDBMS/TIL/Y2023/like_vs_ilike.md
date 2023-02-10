[source](https://docs.actian.com/zen/v15/index.html#page/sqlref/sqlref.LIKE_and_ILIKE.htm#ww2341429)

~~~html
The main difference between LIKE and ILIKE is that:
LIKE is case-sensitive while ILIKE is case-insensitive.
~~~

~~~sql
SELECT * FROM employees
WHERE name LIKE 'J%';

-- This query will return all rows from the "employees" table where the name column starts with the letter "J".
~~~

~~~sql
SELECT * FROM employees
WHERE name ILIKE 'J%';

-- This query will return all rows from the "employees" table where the name column starts with the letter "J" or "j".
~~~
