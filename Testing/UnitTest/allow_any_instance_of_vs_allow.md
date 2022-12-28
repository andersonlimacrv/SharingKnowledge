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
