### Things that break eager loading: where, order, limit
- Applying where, order or limit clauses on your ActiveRecord associations will break eager loading

- Let’s see what happens when we try to order our posts:

~~~ruby
> users = User.includes(:posts).limit(5).to_a
# SELECT "users".* FROM "users" LIMIT 5
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" IN (1,2,3,4,5)

> users.each { |user| user.posts.order(:created_at).to_a }
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 1 ORDER BY "posts"."created_at" ASC
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 2 ORDER BY "posts"."created_at" ASC
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 3 ORDER BY "posts"."created_at" ASC
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 4 ORDER BY "posts"."created_at" ASC
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 5 ORDER BY "posts"."created_at" ASC
~~~

```html
Even though calling includes(:posts) produced an IN query which seems to cover all our posts, applying the order clause on our association ignored this and triggered a bunch of N+1 queries. In order for eager loading to work, the eager loaded query should match the query required to fetch your association.
```

- One way to avoid this is by moving the order inside a default scope:

~~~ruby
class Post
  default_scope { order(:created_at) }
end

> users = User.includes(:posts).limit(5).to_a
# SELECT "users".* FROM "users" LIMIT 5
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" IN (1,2,3,4,5) ORDER BY "posts"."created_at" ASC

> users.each { |user| user.posts.to_a }
# No queries here, they've been eager loaded already
~~~

- …another way is by moving the order inside the parent association:

~~~ruby
class User
  has_many :posts, -> { order(:created_at) }
end

> users = User.includes(:posts).limit(5).to_a
# SELECT "users".* FROM "users" LIMIT 5
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" IN (1,2,3,4,5) ORDER BY "posts"."created_at" ASC

> users.each { |user| user.posts.to_a }
# No queries here, they've been eager loaded already
~~~

- …and yet another way is by moving the order inside a scoped parent association:

~~~ruby
class User
  has_many :ordered_posts, -> { order(:created_at) }, class_name: "Post"
end

> users = User.includes(:ordered_posts).limit(5).to_a
# SELECT "users".* FROM "users" LIMIT 5
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" IN (1,2,3,4,5) ORDER BY "posts"."created_at" ASC

> users.each { |user| user.ordered_posts.to_a }
# No queries here, they've been eager loaded already
~~~

- Let’s see what happens when we apply a where condition to our posts:

~~~ruby
> users = User.includes(:posts).limit(5).to_a
# SELECT "users".* FROM "users" LIMIT 5
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" IN (1,2,3,4,5)

> users.each { |user| user.posts.where("created_at < ?", 1.week.ago).to_a }
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 1 AND (created_at < '2020-09-25 08:55:05.919824')
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 2 AND (created_at < '2020-09-25 08:55:05.919824')
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 3 AND (created_at < '2020-09-25 08:55:05.919824')
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 4 AND (created_at < '2020-09-25 08:55:05.919824')
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" = 5 AND (created_at < '2020-09-25 08:55:05.919824')
~~~

- Ok, that didn’t work. But we can fix it exactly the same way.
- You can move the where condition inside a default scope:

~~~ruby
class Post
  default_scope { where("created_at < ?", 1.week.ago) }
end

> users = User.includes(:posts).limit(5).to_a
> users.each { |user| user.posts.to_a }
~~~

- …or inside the parent association:

~~~ruby
class User
  has_many :posts, -> { where("created_at < ?", 1.week.ago) }
end

> users = User.includes(:posts).limit(5).to_a
> users.each { |user| user.posts.to_a }
~~~

- …or inside a scoped parent association:

~~~ruby
class User
  has_many :posts_from_one_week_ago, -> { where("created_at < ?", 1.week.ago) }
end

> users = User.includes(:posts_from_one_week_ago).limit(5).to_a
> users.each { |user| user.posts_from_one_week_ago.to_a }
~~~

- continue reading in source
[source](https://lipanski.com/posts/activerecord-eager-loading)
