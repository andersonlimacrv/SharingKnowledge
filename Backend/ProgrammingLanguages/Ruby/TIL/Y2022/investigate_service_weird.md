```ruby
class A
  attr_reader :int_value_a

  def fee
    service_b.int_value_a
    # NoMethodError Exception: undefined method `int_value_a' for 0:Integer
  end

  private

  def service_b
    service = ServiceB.new(
      attr_a: 'a'
    )
    service.call
  end
end
##############################################################################
class A
  attr_reader :int_value_a

  def fee
    service_b.int_value_a
    # no error
  end

  private

  def service_b
    service = ServiceB.new(
      attr_a: 'a'
    )
    service.tap(&:call)
    # tap: Yields self to the block, and then returns self.
  end
end
```
