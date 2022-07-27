```ruby
[1] pry(main)> class Account
[1] pry(main)*   def initialize(*args)
[1] pry(main)*     pp(args)
[1] pry(main)*   end
[1] pry(main)* end
=> :initialize
[2] pry(main)> class User < Account
[2] pry(main)*   def initialize(a, b)
[2] pry(main)*     super()
[2] pry(main)*   end
[2] pry(main)* end
=> :initialize
[3] pry(main)> class Guest < Account
[3] pry(main)*   def initialize(a, b)
[3] pry(main)*     super
[3] pry(main)*   end
[3] pry(main)* end
=> :initialize
[4] pry(main)> User.new(1, 2)
[]
=> #<User:0x00005621248cfcf8>
[5] pry(main)> Guest.new(1, 2)
[1, 2]
=> #<Guest:0x00005621248fb650>

super - sends all arguments passed to the function to parent
super() - no arguments
```



| super        | super()           | super(arg1, arg2, …) |
| ------------- |:-------------:| -----:|
|  Will take ALL args to the inherited method     |Will NOT take any args | Will take the specified args |



```ruby
class Animal
  def eat(food)
    puts "eating #{food}"
  end
end

class Dog < Animal
  def eat(food1, food2)
    # super without declaring args
    super
    puts "eating #{food2} as well"
  end
end

class Cat < Animal
  def eat(food1, food2)
    # super with args
    super(food1)
    puts "eating #{food2} as well"
  end
end
class BlankSlate
	instance_methods.each { |meth| undef_method(meth) unless meth =~ /\A__/ }

	def initialize(args)
		@delegate = delegate_object


	end

	def method_missing(meth, *args, &block)
		@delegate.send(meth, *args, &block)
	end


end
# vì kế thừa hàm eat có mỗi một tham số
# cho nên nếu dùng super thì nó truyền tất cả tham số vào hàm kế thừa cho nên lỗi
# "ArgumentError: (given 2, expected 1)"

doggy = Dog.new
kitty = Cat.new
doggy.eat("bento", "sushi") # "ArgumentError: (given 2, expected 1)"
kitty.eat("bento", "sushi") # "eating bento" & "eating sushi as well"
```
[source](http://chenghsuan.me/posts/ruby-super-super)
