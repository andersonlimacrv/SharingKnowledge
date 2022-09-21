```ruby
require 'benchmark'

n = 100000

class User
  ROLES = %w(admin moderator contributor)

  def self.roles_constant_wrapper
    self::ROLES
  end

  def self.roles_with_caching
    @roles ||= %w(admin moderator contributor)
  end

  def self.roles
    %w(admin moderator contributor)
  end
end

Benchmark.bm(26) do |x|
  x.report('Just constant:')             { 1.upto(n) do; User::ROLES; end }
  x.report('Constant wrapper:')          { 1.upto(n) do; User.roles_constant_wrapper; end }
  x.report('Instance variable caching:') { 1.upto(n) do; User.roles_with_caching; end }
  x.report('No constant, no caching:')   { 1.upto(n) do; User.roles; end }
end
```

```ruby
                                 user     system      total        real
Just constant:               0.010000   0.000000   0.010000 (  0.010488)
Constant wrapper:            0.020000   0.000000   0.020000 (  0.019495)
Instance variable caching:   0.030000   0.000000   0.030000 (  0.021562)
No constant, no caching:     0.070000   0.000000   0.070000 (  0.072152)
```

### notes:

prefer to use `ROLES = %w(admin moderator contributor)` with fatest
