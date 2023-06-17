[source](https://blog.saeloun.com/2022/03/23/rails-7-adds-lock_with/)


### before
~~~ruby
ActiveRecord::Base.transaction do
  article = Article.find("00000000-0000-0000-0000-000000000001").lock!("FOR UPDATE NOWAIT")
  article.like_count += 1
  article.save!

  ActiveRecord::Base.transaction(requires_new: true) do
    author = article.author.lock!("FOR UPDATE NOWAIT")
    author.articles_liked += 1
    author.save!
  end
end
~~~


### after
~~~ruby
=begin

After Rails 7 we can use with_lock to create nested transactions and can specify transaction optional arguments like:-

- requires_new: If this is set to true then the block will be wrapped in a database savepoint acting as a sub-transaction.
- isolation: We can specify the Isolation Levels to avoid dirty reads.
- joinable: This can be set to false to avoid surprises while dealing with custom nested transactions

=end
article = Article.find("00000000-0000-0000-0000-000000000001")

article.with_lock do
  author = article.author
  article.like_count += 1
  article.save!

  # Will create a new transaction called sub-transaction/savepoint.
  # And, in case of error it will rollback to this savepoint and will not rollback parent transaction

  author.with_lock("FOR UPDATE NOWAIT", requires_new: true) do
    author.articles_liked += 1
    author.save!
  end
end
~~~

