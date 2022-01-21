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

### another definition:
- Mocking is the practice of using fake objects to mimic the behaviour of
real application components. Since mock objects simulate the behaviour of
the original components, they can be used during testing of an isolated
application code to handle its interaction with other parts of the application.

[source](https://www.netguru.com/blog/ruby-tests-rspec-mocks)

### benefits:
- The simplification of the test environment building process
- Minimizing time and resource footprint.

### mocking object types:
1. stub: returns pre-programmed results in response to specific messages
2. mock: has built-in expectations of messages that it will receive and
  it will fail if those expectations are not fulfilled.
3. null object:  returns self in response to any message.
4. spy: registers all messages
5. fake: a simplified version of an object that operates correctly
  in development but is unsuitable for production, e.g. an SQLite database.
6. dummy: an object that is passed around but is never used.
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
- The double is an “empty” object that (theoretically) can stand for any other object.
- another definition in Rspec: double to denote a generic object representing
any type of mocking object.

### Rspec has three types of double
1. Pure double (also known as double or normal double)
2. Verifying double
3. Partial double
```

#### Working with pure doubles

```ruby
random_double = double('random')
allow(random_double).to receive(:rand).and_return(7)
expect((1..6).map{ random_double.rand(1..10) }).to eq([7,7,7,7,7,7])
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

### double vs instance_double

```html
# Bad
double(:mailer, deliver: true, foo: 42)
double(:User, find: fake_user, bar: 43)

# Better
instance_double(Mailer, deliver: true, foo: 42)
# => RSpec::Mocks::MockExpectationError: the Tags class does not implement the instance method: foo

class_double(User, find: fake_user, bar: 43)
# => RSpec::Mocks::MockExpectationError: the User class does not implement the class method: bar

### instance_double can fail a test if methods are not available in the specified class
### double doesn't care about anything.
```
