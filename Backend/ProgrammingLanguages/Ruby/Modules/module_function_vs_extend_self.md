```ruby
module RubyCademy
  extend self

  def headline
    puts "Learn Ruby and Ruby on Rails!"
  end
end

RubyCademy.headline # => Learn Ruby and Ruby on Rails!
```

```ruby
module RubyCademy
  def headline
    puts "Learn Ruby and Ruby on Rails!"
  end

  module_function :headline
end

RubyCademy.headline # => Learn Ruby and Ruby on Rails!
```
