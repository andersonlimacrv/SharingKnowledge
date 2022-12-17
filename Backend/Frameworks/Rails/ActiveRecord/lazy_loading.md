### Lazy loading

```html
Philosophy of lazy loading design pattern is to delay initalization of an object until the time when it is really needed
```

~~~ruby
> Post.all.map { |post| [post.title, post.user.name] }
  Post Load (4.3ms)  SELECT "posts".* FROM "posts"
  User Load (0.7ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
  User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]
  User Load (0.2ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 4], ["LIMIT", 1]]

 => [["title", "test"], [nil, "test"], ["Ognjen Dobrić", "Red Star"], ["Nemanja Dangubić", "Red Star"], ["Novica Veličković", "Partizan"], ["Vanja Marinković", "Partizan"]]
~~~

```html
Our result is just what we wanted, but the number of queries in our logs indicates that we have N+1 situation, which may be a problem is case when we have a lot of records.
```

```html
N+1 means that we have executed one query for the posts and then one query for each post's user (in our case N is 6)
```

### Let’s eager load teams and reduce the number of queries.

```html
Eager loading technique allow as to preload all “posts” associated data (“users” in our case).
```

~~~ruby
> Post.includes(:user).map { |post| [post.title, post.user.name] }
Post Load (0.9ms)  SELECT "posts".* FROM "posts"
User Load (4.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" IN ($1, $2, $3)  [["id", 1], ["id", 3], ["id", 4]]
 => [["title", "test"], [nil, "test"], ["Ognjen Dobrić", "Red Star"], ["Nemanja Dangubić", "Red Star"], ["Novica Veličković", "Partizan"], ["Vanja Marinković", "Partizan"]]
~~~

```html
In short, includes() combines behaviours of two Rails methods, preload() when we need two separate queries and eager_load() in cases when it is best to run a single query.
```

### Let’s examine the next example. Suppose that we want to fetch only the Red Star users.

~~~ruby
> Post.includes(:user).where(users: { name: "Red Star" }).map { |post| [post.title, post.user.name] }
SQL (22.0ms)  SELECT "posts"."id" AS t0_r0, "posts"."title" AS t0_r1, "posts"."user_id" AS t0_r2, "posts"."created_at" AS t0_r3, "posts"."updated_at" AS t0_r4, "posts"."published" AS t0_r5, "users"."id" AS t1_r0, "users"."name" AS t1_r1, "users"."created_at" AS t1_r2, "users"."updated_at" AS t1_r3 FROM "posts" LEFT OUTER JOIN "users" ON "users"."id" = "posts"."user_id" WHERE "users"."name" = $1  [["name", "Red Star"]]
 => [["Ognjen Dobrić", "Red Star"], ["Nemanja Dangubić", "Red Star"]]
~~~

### Let’s try with joins
- joins() is a Rails prefered way when we need to specify conditions on associations, so let’s test it.

~~~ruby
> Post.joins(:user).where(users: { name: "Red Star" }).map { |post| [post.title, post.user.name] }
Post Load (0.6ms)  SELECT "posts".* FROM "posts" INNER JOIN "users" ON "users"."id" = "posts"."user_id" WHERE "users"."name" = $1  [["name", "Red Star"]]
User Load (0.3ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
User Load (0.9ms)  SELECT "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]
 => [["Ognjen Dobrić", "Red Star"], ["Nemanja Dangubić", "Red Star"]]
~~~

```html
The result is still the same, and a good thing is that we don’t load unnecessary data into memory any more. But as we can see from the logs, N+1 situation is back again.

In order to eliminate unnecessary queries, we will need to use select() method together with joins().
```

### `joins` combined with `select` method

~~~ruby
> Post.joins(:user).where(users: { name: "Red Star" }).select("posts.*, users.name as user_name").map { |post| [post.title, post.user_name] }

 Post Load (6.4ms)  SELECT posts.*, users.name as user_name FROM "posts" INNER JOIN "users" ON "users"."id" = "posts"."user_id" WHERE "users"."name" = $1  [["name", "Red Star"]]
 => [["Ognjen Dobrić", "Red Star"], ["Nemanja Dangubić", "Red Star"]]
~~~

[source](https://axiomq.com/blog/better-performance-for-rails-app-with-joins-and-eager-loading/)
