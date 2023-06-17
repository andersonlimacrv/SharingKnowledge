### works for public method (?)
~~~ruby
allow(Object).to receive(:method).and_return(AnyValue)
~~~

### works for private or public method (?)
~~~ruby
allow_any_instance_of(Class).to receive(:instance_method).and_return(AnyValue)
allow_any_instance_of(Class).to receive(:instance_method).and_raise(AnyError)
~~~

[tips](https://medium.com/beamdental/rspec-tips-allow-any-instance-of-c11e38b098be)

### receive_messages() vs receive_message_chain()

~~~html
receive_messages allows us to set up multiple message expectations on a test double in a single call.
It takes a hash of message names and their corresponding return values or blocks
~~~

~~~ruby
user = double("user")
allow(user).to receive_message_chain(:address, :city, :name).and_return("New York")

expect(user.address.city.name).to eq("New York")

=begin
In the example above, we set up a chain of message expectations on the test double user using receive_message_chain.
We expect user.address.city.name to return "New York".

One important thing to note is that receive_message_chain can lead to tightly coupled tests,
since it requires knowledge of the internal structure of the object being tested.
It is generally considered better practice to use receive_messages or individual allow statements to set up message expectations on test doubles whenever possible, to keep tests more maintainable and less brittle.
=end
~~~

### receive_messages() vs receive()
- allow_any_instance_of(A).to receive_messages() will allow you to stub any instance method of class A with a hash of method names and return values.

- allow_any_instance_of(A).to receive(:instance_method).and_return(AnyValue) will allow you to stub a specific instance method of class A with a specific return value.

~~~html
For example, if you have a class Calculator with instance methods add and subtract, you can use allow_any_instance_of(Calculator).to receive_messages(add: 5, subtract: 3) to stub both methods with return values of 5 and 3 respectively.

Alternatively, you can use allow_any_instance_of(Calculator).to receive(:add).and_return(5) to stub only the add method with a return value of 5.

It's generally recommended to use the more specific allow_any_instance_of(A).to receive(:instance_method).and_return(AnyValue) syntax to avoid accidentally stubbing unintended methods.
~~~

~~~ruby
user = double("user")
allow(user).to receive_messages(name: "John", age: 30)

expect(user.name).to eq("John")
expect(user.age).to eq(30)

=begin
In the example above, we set up two message expectations on the test double user using receive_messages.
We expect user.name to return "John" and user.age to return 30.
=end

user = double("user")
allow(user).to receive(:name).and_return("John")

expect(user.name).to eq("John")

=begin
In the example above, we set up a message expectation on the test double user using receive.
We expect user.name to return "John".
=end
~~~

~~~html
One important difference between receive_messages and receive is that receive_messages
allows us to set up multiple message expectations in a single call, while receive only
sets up a single message expectation. Additionally, receive_messages can make our tests
more readable and concise when we need to set up multiple message expectations on a test double.

However, receive can be more flexible than receive_messages in some cases, since it allows
us to set up message expectations with more complex behavior using blocks. For example,
we can use a block to set up a sequence of return values for a single message:


user = double("user")
allow(user).to receive(:name) do
  "John"
end.and_then do
  "Doe"
end

expect(user.name).to eq("John")
expect(user.name).to eq("Doe")


In the example above, we set up a message expectation on the test double user using receive.
We expect user.name to return "John" on the first call, and "Doe" on the second call.
We achieve this by using the and_then method to set up a sequence of return values for the name message.
~~~

### and_call_original vs and_return
~~~ruby
allow(Object).to receive(:method).and_call_original
~~~

allow(Object).to receive(:method).and_call_original and allow(Object).to receive(:method).and_return(AnyValue) are two different ways to stub a method in RSpec:

1. allow(Object).to receive(:method).and_call_original:
This sets up a test double for the method, but instead of overriding the method behavior with a specific value or block, it calls the original implementation of the method. This is useful when you want to test the behavior of the original method but still isolate it from any dependencies or side effects that it might have.

2. allow(Object).to receive(:method).and_return(AnyValue):
This sets up a test double for the method and specifies a specific return value for the method. In this case, AnyValue is a placeholder value that can be any value or object. This is useful when you want to test the behavior of the method in a specific scenario or with a specific input.

Here's an example of how to use each of these methods:

~~~ruby
# Example using and_call_original
class MyClass
  def my_method
    # Some implementation
  end
end

RSpec.describe MyClass do
  describe "#my_method" do
    it "calls the original implementation" do
      my_object = MyClass.new
      expect(my_object).to receive(:my_method).and_call_original

      my_object.my_method
      # Any assertions on the behavior of my_method
    end
  end
end

# Example using and_return
class MyClass
  def my_method(arg)
    # Some implementation
  end
end

RSpec.describe MyClass do
  describe "#my_method" do
    it "returns a specific value for a specific input" do
      my_object = MyClass.new
      expect(my_object).to receive(:my_method).with("input").and_return("output")

      result = my_object.my_method("input")
      expect(result).to eq("output")
    end
  end
end
~~~

you can use and_call_original and and_return with methods that take arguments or without arguments. Here's an example of using and_call_original with a method that takes an argument:

~~~ruby
class MyClass
  def my_method(arg)
    # Some implementation
  end
end

RSpec.describe MyClass do
  describe "#my_method" do
    it "calls the original implementation with argument" do
      my_object = MyClass.new
      expect(my_object).to receive(:my_method).with("input").and_call_original

      my_object.my_method("input")
      # Any assertions on the behavior of my_method
    end
  end
end

class MyClass
  def my_method
    # Some implementation
  end
end

RSpec.describe MyClass do
  describe "#my_method" do
    it "returns a specific value" do
      my_object = MyClass.new
      expect(my_object).to receive(:my_method).and_return("output")

      result = my_object.my_method
      expect(result).to eq("output")
    end
  end
end
~~~

~~~ruby
class User
  def name
    "John"
  end
end

RSpec.describe User do
  it "delegates to the original implementation" do
    user = User.new
    allow(user).to receive(:name).and_call_original

    expect(user.name).to eq("John")
  end
end
=begin
In the example above, we create a new instance of the User class
and set up a message expectation on the name method using and_call_original.
This allows us to test the original implementation of the name method while still
using a test double for other methods on the same object.

and_return, on the other hand, allows us to set up a message expectation on a
test double that returns a specific value or executes a block
=end

user = double("user")
allow(user).to receive(:name).and_return("John")

expect(user.name).to eq("John")
=begin
In the example above, we set up a message expectation on the test double user using and_return.
We expect user.name to return "John".
=end

=begin
In general, and_call_original should be used sparingly, since it can make tests more brittle and
tightly coupled to the implementation of the objects being tested.
Instead, it's generally considered better practice to set up message expectations
using and_return or other methods that allow for more flexible behavior.
=end
~~~
