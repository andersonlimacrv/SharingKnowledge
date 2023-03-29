### works for public method
~~~ruby
allow(Object).to receive(:method).and_return(AnyValue)
~~~

### works for private or public method
~~~ruby
allow_any_instance_of(Class).to receive(:instance_method).and_return(AnyValue)
allow_any_instance_of(Class).to receive(:instance_method).and_raise(AnyError)
~~~

[tips](https://medium.com/beamdental/rspec-tips-allow-any-instance-of-c11e38b098be)


### receive_messages() vs receive()
- allow_any_instance_of(A).to receive_messages() will allow you to stub any instance method of class A with a hash of method names and return values.
- allow_any_instance_of(A).to receive(:instance_method).and_return(AnyValue) will allow you to stub a specific instance method of class A with a specific return value.

~~~html
For example, if you have a class Calculator with instance methods add and subtract, you can use allow_any_instance_of(Calculator).to receive_messages(add: 5, subtract: 3) to stub both methods with return values of 5 and 3 respectively.

Alternatively, you can use allow_any_instance_of(Calculator).to receive(:add).and_return(5) to stub only the add method with a return value of 5.

It's generally recommended to use the more specific allow_any_instance_of(A).to receive(:instance_method).and_return(AnyValue) syntax to avoid accidentally stubbing unintended methods.
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
