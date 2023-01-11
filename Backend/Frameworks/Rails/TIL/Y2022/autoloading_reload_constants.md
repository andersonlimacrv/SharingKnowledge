```ruby
module XML
  class SAXParser
    Module.nesting
  end
end

=> [XML::SAXParser, XML]

class XML::SAXParser
  Module.nesting
end

=> [XML::SAXParser]
```

### In Ruby, there are two main ways to define a class inside a module.
1. The “standard” way is to nest the class definition inside the module:

```ruby
module MyModule
  class MyClass
    # ...
  end
end
```
2. The “shortcut” way is to use the :: notation:

```ruby
class MyModule::MyClass
  # ...
end
```

Both of these approaches generally work, but they are not equivalent.


[autoloading_and_reloading_constants](https://guides.rubyonrails.org/v4.2.2/autoloading_and_reloading_constants.html)
[namespace in rails](https://randycoulman.com/blog/2014/12/09/namespaced-classes-in-rails/)
