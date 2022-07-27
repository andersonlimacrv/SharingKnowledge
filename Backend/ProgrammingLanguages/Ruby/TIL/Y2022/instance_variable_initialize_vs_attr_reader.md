### original version

```ruby
class User
  def initialize(name)
    @name = name
  end

  def loud_name
    "#{@name.upcase}!!!"
  end
end
```

### attr_reader version

```ruby
class User
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def loud_name
    "#{name.upcase}!!!"
  end
end
```

[source](https://www.codewithjason.com/dont-wrap-instance-variables-attr_reader-unless-necessary/)
