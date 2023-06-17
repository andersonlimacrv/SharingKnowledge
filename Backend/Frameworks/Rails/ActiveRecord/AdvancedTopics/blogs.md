### advanced activerecord
https://blog.rubyhero.dev/advanced-active-record

I. Locking of the records
1. Optimistic locking
~~~html
In optimistic locking, you assume another person won’t update the same record simultaneously. If this is going to happen, the application should raise an error.

This behaviour is controlled with a column called lock_version. Add this column to your model, and Rails will automatically apply optimistic locking. This is what it looks like in practice when you have the lock_version column in your table:
~~~

~~~ruby
company1 = Company.find(1)
company2 = Company.find(1)

company1.title = "Great company"
company1.save # => true

company2.title = "Awesome company"
company2.save # Attempted to update a stale object: Job. (ActiveRecord::StaleObjectError)

=begin
The second update will be rollbacked as someone has updated the record in the meantime. In this example, we process both records in the same console, but in real applications, it will control concurrent processes.

We name it optimistic locking because we allow reading the record, and we assume there will be no conflicts,s so there is no need to lock exclusively and disallow other people from dealing with this record.
=end
~~~

2. Pessimistic locking
~~~html
In the pessimistic mode, you eliminate the case where some other process will update or even fetch the record when the transaction is not committed. Let’s consider this case:
~~~

~~~ruby
company = Company.find(1)

company.with_lock do
  sleep(10)
  company.update(title: 'Awesome')
end
~~~

~~~html
The transaction will just hang for 10 seconds. You can open another terminal window and try to update the record:
~~~

~~~ruby
company = Company.find(1)
company.update(title: 'Great')

=begin

You won’t be able to do this. The second transaction will hang until the locked one is finished. After the first transaction is finished, the second will finish, and both users will see the title as "Great".

If you would avoid fetching the record if the locked record is updated, you would have to replace Company.find(1) with Company.lock.find(1). There are a few ways you can lock records with Rails, but since this article is just an introduction, I won’t go into details about it.

=end
~~~

------------------------------------------------------
II. Integer vs. UUID as the primary key
------------------------------------------------------
III. Fulltext search
------------------------------------------------------
IV. Database views
------------------------------------------------------
V. Geospatial data

