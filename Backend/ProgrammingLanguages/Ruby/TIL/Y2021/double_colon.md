```ruby
class MyClass #1
end

module MyNameSpace
  class MyClass #2
  end

  def foo # Creates an instance of MyClass #1
    ::MyClass.new # If I left out the ::, it would refer to
                  # MyNameSpace::MyClass instead.
  end
end
```