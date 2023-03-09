~~~ruby
require 'objspace'

class UsersController < ApplicationController
  def index
    print_memory_usage("Before loading users")
    @users = User.all
    print_memory_usage("After loading users")
    # ...
  end

  private

  def print_memory_usage(message)
    puts "#{message}:"
    usage = ObjectSpace.count_objects_size
    usage.each do |type, bytes|
      puts "#{type} => #{bytes / 1024.0} KB"
    end
    puts "-" * 40
  end
end

=begin
	Before loading users:
	ARRAY => 1.12 MB
	CLASS => 0.29 KB
	HASH => 1.04 MB
	MODULE => 0.05 KB
	SYMBOL => 2.35 MB
	TOTAL => 20.54 MB
	----------------------------------------
	After loading users:
	ARRAY => 15.52 MB
	CLASS => 0.29 KB
	HASH => 1.15 MB
	MODULE => 0.05 KB
	SYMBOL => 2.58 MB
	TOTAL => 41.74 MB
	----------------------------------------
=end
~~~

### how to reduce memory bloat

~~~html
1. Use lazy loading and pagination: Instead of loading all records from a database query at once, you can use lazy loading and pagination to only load the records that are needed at a given time. This can significantly reduce memory usage, especially for large data sets.

2. Use select and pluck to reduce memory usage: If you only need a few columns from a table, you can use the select or pluck methods to fetch only those columns, rather than fetching the entire record. This can reduce the amount of memory used by the application.

3. Use caching to avoid unnecessary queries: If you have data that is frequently accessed but rarely updated, you can use caching to avoid unnecessary database queries and reduce memory usage. You can use Rails' built-in caching mechanisms or use a third-party caching solution like Redis or Memcached.

4. Use smaller objects and avoid creating unnecessary objects: Large objects like arrays and hashes can consume a lot of memory, so it's important to use smaller objects when possible. Additionally, you should avoid creating unnecessary objects, such as temporary variables or objects that are only used briefly.

5. Use background jobs for CPU-intensive or memory-intensive tasks: If you have tasks that are CPU-intensive or memory-intensive, such as image processing or data analysis, you can move those tasks to background jobs using tools like Active Job or Sidekiq. This can free up memory and CPU resources for the main application.
~~~

### tools to detect
- using memory profiling tools like the `memory_profiler` gem can help you identify areas of the code that are using excessive memory and guide your optimization efforts.
