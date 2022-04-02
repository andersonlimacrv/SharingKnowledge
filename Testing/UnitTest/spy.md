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
