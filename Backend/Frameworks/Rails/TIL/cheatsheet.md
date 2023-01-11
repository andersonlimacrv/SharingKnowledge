### user devise verify password
~~~ruby
u.valid_password?("yourpassword")
~~~

### inherited
- Callback invoked whenever a subclass of the current class is created.
[source](https://apidock.com/ruby/Class/inherited)

~~~ruby
class Foo
  def self.inherited(subclass)
    puts "New subclass: #{subclass}"
  end
end

class Bar < Foo
end

class Baz < Bar
end

=begin
New subclass: Bar
New subclass: Baz
=end
~~~
