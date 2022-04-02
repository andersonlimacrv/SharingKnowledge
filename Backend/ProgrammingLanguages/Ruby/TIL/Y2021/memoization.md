### 4 simple pattern

1. Super basic memoization

```ruby
class User < ActiveRecord::Base
  def twitter_followers
    # assuming twitter_user.followers makes a network call
    @twitter_followers ||= twitter_user.followers
  end
end

# What about nil?

class User < ActiveRecord::Base
  def twitter_followers
    return @twitter_followers if defined? @twitter_followers
    @twitter_followers = twitter_user.followers
  end
end


# The ||= more or less translates to @twitter_followers = @twitter_followers || twitter_user.followers. That means that you’ll only make the network call the first time you call twitter_followers, and future calls will just return the value of the instance variable @twitter_followers.
```

2. Multi-line memoization
Sometimes, slow code won’t fit on one line without doing terrible things to it. There are a few ways to extend the basic pattern to work with multiple lines of code, but this is my favorite:

```ruby
class User < ActiveRecord::Base
  def main_address
    @main_address ||= begin
      maybe_main_address = home_address if prefers_home_address?
      maybe_main_address = work_address unless maybe_main_address
      maybe_main_address = addresses.first unless maybe_main_address
    end
  end
end

# What about nil?

class User < ActiveRecord::Base
  def main_address
    return @main_address if defined? @main_address
    @main_address = begin
      main_address = home_address if prefers_home_address?
      main_address ||= work_address
      main_address ||= addresses.first # some semi-sensible default
    end
  end
end

# The begin...end creates a block of code in Ruby that can be treated as a single thing, kind of like {...} in C-style languages. That’s why ||= works just as well here as it did before.
```

# And what about parameters?
# if you want to memoize a method that takes parameters, like this one?

```ruby
class City < ActiveRecord::Base
  def self.top_cities(order_by)
    where(top_city: true).order(order_by).to_a
  end
end

# memoization
class City < ActiveRecord::Base
  def self.top_cities(order_by)
    @top_cities ||= Hash.new do |h, key|
      h[key] = where(top_city: true).order(key).to_a
    end
    @top_cities[order_by]
  end
end
```

### noted about nil and false case

```html
- This ||=-based technique can’t be used if the result of the computation is
false or nil, in that case you should use the defined? method to memoize.

- it will perform the heavy calculation every time
```

### when to use
- duplicate db calls
- expensive calculations
- calculations that do not change

### when not to use
- some methods that take params
- calculations that can easily change

### example

```ruby
# source: https://codingnews.info/post/memoization.html

# v1
def slow_function
  sleep 5
  'result'
end

def memoization
  @takes_time ||= slow_function
end

memoization()
# Wait 5 seconds
=> 'result'
memoziation()
# Inmediateley
=> 'result'

# v2
def slow_function
  @takes_time ||= begin
    sleep 5
    'result'
  end
end

slow_function()
# Wait 5 seconds
=> 'result'
slow_function()
# Inmediateley
=> 'result'
```

[source](https://www.justinweiss.com/articles/4-simple-memoization-patterns-in-ruby-and-one-gem/)
