### question
- can test method in module A access the attr_a in class B and why and give example

~~~ruby
module A
  private

  def test
    puts attr_a
  end
end

class B
  include A
  attr_reader :attr_a, :attr_b, :attr_ac

  def initialize
    # @attr_a = "test_value"
  end

  def call_test
    test
  end
end

b = B.new
puts b.call_test # => "test_value"
~~~

### answer

~~~html
- Yes, the test method in module C can access attr_a in class B. This is because when a module is included in a class, the methods defined in the module become part of the class's method lookup chain docs.ruby-lang.org.
~~~
