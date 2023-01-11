Both mock and stub are aliases of the more generic double

[test doubles](https://womanonrails.com/test-doubles)

```html
- type of test doubles

+ dummy
+ fake
+ stub
+ spy or mock
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
