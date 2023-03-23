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
