### stub

```html
- A stub is only a method with a canned response, it doesn’t care about behavior.
- Returns canned responses, avoiding any meaningful computation or I/O
```

```ruby
allow(some_object).to receive(some_method).and_return(some_value)
```

### mock

```html
- A mock expects methods to be called, if they are not called the test will fail.
- Expects specific messages; will raise an error if it doesn’t receive
  them by the end of the example
```

```ruby
expect(some_object).to receive(some_method).and_return(some_value)
```

```html
  Mock test là khái niệm dùng để chỉ rằng, thay vì lấy data từ một real
  service, bạn sử dụng một bộ test data mà input và output của bạn được
  định nghĩa rõ ràng từ một service giả khác (mock) và bạn dùng nó như
  là input cho cái system mà bạn muốn test
```

### double

```html
The double is an “empty” object that (theoretically) can stand for any other object.
```

```ruby
user = double("User")

user.class
=> RSpec::Mocks::Double
```

### spy

```html
The spy accepts any method calls and always returns itself unless specified.
If you need the mock object to raise if it receives an unexpected method call,
you can use a double instead:
```

```ruby
[1] pry(main)> require 'rspec/mocks/standalone'
=> true
[2] pry(main)> user_spy = spy(User)
=> #<Double User>
[3] pry(main)> spy.whatever_method
=> #<Double (anonymous)>


[4] pry(main)> user_double = double(User)
=> #<Double User>
[5] pry(main)> user_double.whatever_method
RSpec::Mocks::MockExpectationError: #<Double User> received unexpected message :whatever_method with (no args)
from /Users/mauro-oto/.rvm/gems/ruby-2.2.1@carbide/gems/rspec-support-3.5.0/lib/rspec/support.rb:87:in block in <module:Support>
```

```html
If you haven't specified that the double can receive a given method, in the case above whatever_method, it'll raise an exception. You can explicitly tell the double that it can receive such a method and its return value like this:
```

```ruby
[6] pry(main)> user_double = double(User, whatever_method: nil)
=> #<Double User>
[7] pry(main)> user_double.whatever_method
=> nil
[8] pry(main)> user_double.some_method
RSpec::Mocks::MockExpectationError: #<Double User> received unexpected message :some_method with (no args)
from /Users/mauro-oto/.rvm/gems/ruby-2.2.1@carbide/gems/rspec-support-3.5.0/lib/rspec/support.rb:87:in block in <module:Support>
```

### fake


[spy vs double](https://www.ombulabs.com/blog/rspec/ruby/spy-vs-double-vs-instance-double.html)
[stub vs mock](https://viblo.asia/p/rspec-su-khac-biet-giua-mocks-va-stubs-3P0lPkNnZox)
