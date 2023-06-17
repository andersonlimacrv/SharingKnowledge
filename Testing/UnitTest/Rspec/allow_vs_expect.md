### allow

~~~html
allow is used to define the behavior of an object or method.
It is typically used to define a method to return a specific value
or to raise an exception. For example:
~~~

~~~ruby
allow(my_object).to receive(:my_method).and_return(my_value)

=begin
This code tells RSpec to allow my_object to receive a call
to my_method and to return my_value when it does.
=end
~~~


### expect

~~~html
expect, on the other hand, is used to define an expectation
about the result of a method call. It is typically used in
conjunction with a matcher to check that a method returns
a specific value or raises an exception. For example:
~~~

~~~ruby
expect(my_object.my_method).to eq(my_value)

=begin
This code tells RSpec to expect that calling my_method on my_object returns my_value.
=end
~~~


~~~html
In general, you should use allow to set up the behavior of an object or method, and expect to make assertions about the results of method calls. However, there are cases where you might use both in combination. For example, you might use allow to set up the behavior of a method, and then use expect to check that the method was called with the correct arguments.

It's important to use allow and expect appropriately to ensure that your tests are readable and maintainable. You should also make sure to use the correct matcher for your expectation, as there are many different matchers available in RSpec.
~~~


### allow and expect order

~~~html
In RSpec, the typical order for using expect and allow is to use expect first, followed by allow. The reason for this order is that expect sets up the expectation that a method will be called and specifies any arguments or return values, while allow sets up the behavior of the method. By setting up the expectation first, you ensure that the behavior you are setting up with allow matches the expected behavior.
~~~

~~~ruby
expect(my_object).to receive(:do_something).with(:arg1).once
expect(my_object).to receive(:do_something).with(:arg2).once

allow(my_object).to receive(:do_something) do |arg|
  if arg == :arg1
    # behavior for :arg1
  elsif arg == :arg2
    # behavior for :arg2
  end
end

my_object.do_something(:arg1)
my_object.do_something(:arg2)

=begin
Here, we use expect to set the expectation that do_something will be called once with :arg1 and once with :arg2. We then use allow to set up the behavior of do_something for each argument. Finally, we call do_something twice with the expected arguments.

Using both allow and expect in this way can make your test more expressive and easier to read, as it makes it clear what behavior you are setting up and what you are expecting to happen. However, it's important to use them appropriately and not to overuse them, as this can make your tests more complex and harder to maintain.
=end
~~~

~~~html
In RSpec, the typical order for using expect and allow is to use expect first, followed by allow. The reason for this order is that expect sets up the expectation that a method will be called and specifies any arguments or return values, while allow sets up the behavior of the method. By setting up the expectation first, you ensure that the behavior you are setting up with allow matches the expected behavior.
For example, consider the following code:
~~~

~~~ruby
allow(my_object).to receive(:my_method).and_return(my_value)
expect(my_object.my_method).to eq(my_value)

=begin
Here, we use allow to set up the behavior of my_method to return my_value, and then use expect to check that calling my_method on my_object actually returns my_value.
=end
~~~

~~~html
If you were to reverse the order and use allow before expect, you could potentially set up a different behavior than what you are expecting to test, which could lead to false positives or false negatives in your test results.

However, in some cases, it may make sense to use allow before expect. For example, if you are testing a method that has a side effect, such as modifying a database, you might use allow to set up the behavior of the method to perform the side effect, and then use expect to check that the side effect occurred as expected.

In general, it's important to use expect and allow appropriately and in a way that makes your tests easy to understand and maintain.
~~~


### example on allow first then expect after will lead wrong result

~~~ruby
# Incorrect order of expect and allow
allow(my_object).to receive(:my_method).and_return('hello')
expect(my_object.my_method).to eq('world')

=begin
In this example, we're using allow to set up the behavior of my_method to return the string 'hello', and then using expect to check that calling my_method on my_object returns the string 'world'.

However, since we used allow before expect, RSpec will set up the behavior of my_method to always return 'hello', regardless of what we expect. As a result, this test will always pass, even though it's testing the wrong thing.
To fix this test, we need to switch the order of expect and allow:
=end

# Correct order of expect and allow
expect(my_object).to receive(:my_method).and_return('hello')
result = my_object.my_method
expect(result).to eq('hello')

=begin
Here, we're using expect first to set up the expectation that my_method will be called and will return 'hello', and then using allow to set up the behavior of my_method to return 'hello'. We then call my_method and use expect to check that it returned 'hello', as expected.
=end
~~~
