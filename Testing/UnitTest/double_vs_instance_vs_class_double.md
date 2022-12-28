1. double
2. instance_double
3. class_double


### double vs instance_double

~~~ruby
# Bad
double(:mailer, deliver: true, foo: 42)
double(:User, find: fake_user, bar: 43)

# Better
instance_double(Mailer, deliver: true, foo: 42)
# => RSpec::Mocks::MockExpectationError: the Tags class does not implement the instance method: foo

class_double(User, find: fake_user, bar: 43)
# => RSpec::Mocks::MockExpectationError: the User class does not implement the class method: bar

=begin
- instance_double can fail a test if methods are not available in the specified class
- double doesn't care about anything.
=end
~~~
