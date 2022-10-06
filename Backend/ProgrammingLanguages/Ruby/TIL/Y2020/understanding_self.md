- "Self" is the current object.
- The object to which a method is applied or the object which receives the method call is "self".
- The current object depends on the context.
- To know which object is “self”, we need to know what context the program is in at given time.
As a program runs, its context constantly changes. Context is where your code is now as the program runs.


### example
```ruby
# self trỏ đến một đối tượng
class Ghost
  def reflect
    self
  end
end

g = Ghost.new
g.reflect == g # => true
```


```ruby
# self trỏ đến một lớp
class Ghost
  def self.reflect
    self
  end
end

Ghost.reflect == Ghost # => true

# same in module

module Ghost
  def self.reflect
    self
  end
end
Ghost.reflect == Ghost # => true
```


```ruby
# Như bạn có thể thấy bên dưới, self trỏ đến lớp hoặc module đang trong quá trình khai báo.
class Ghost
  self == Ghost # => true
end

module Mummy
  self == Mummy # => true
end
```


```ruby
# Các phương thức hỗn hợp (mixed-in) hoạt động giống như các instance method hoặc class method bình thường khi nói đến self. Điều này thật ý nghĩa. Nếu không, mixin sẽ không thể tương tác với lớp bạn đã trộn nó vào.

# instance methods
module Reflection
  def reflect
    self
  end
end

class Ghost
  include Reflection
end

g = Ghost.new
g.reflect == g # => true

# class methods
module Reflection
  def reflect
    self
  end
end

class Ghost
  extend Reflection
end

Ghost.reflect == Ghost # => true
```

[source](https://viblo.asia/p/self-trong-ruby-la-gi-gGJ59xQ9lX2)
[source](https://anupamagadde.dev/post/625847760745332736/self-in-ruby)


### Notes

```ruby
class ServiceA
	attr_reader :data

	def initialize(params1)
		@params1 = params1
	end

	def call
		result = 1+1
		@data = result
	end
end

service = ServiceA.new("testaaaa")
service.call
service.data # => 2
service.params1 # => undefined

service = ServiceA.new("testaaaa").call
service.data # => undefined
```

```ruby
class ServiceA
	attr_reader :data

	def initialize(params1)
		@params1 = params1
	end

	def call
		result = 1+1
		@data = result
		self
	end
end

service = ServiceA.new("testaaaa").call
service.data # => 2
```
