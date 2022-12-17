### automated way of dealing with N+1 query with goldiloader
- Just add it in your Gemfile:

~~~ruby
gem "goldiloader"

# …and watch as your associations are magically eager loaded:

> users = User.limit(5).to_a
# SELECT "users".* FROM "users" LIMIT 5

> users.each { |user| user.posts.to_a }
# SELECT "posts".* FROM "posts" WHERE "posts"."user_id" IN (1,2,3,4,5)
~~~


[goldiloader](https://github.com/salsify/goldiloader)
[source](https://lipanski.com/posts/activerecord-eager-loading)
