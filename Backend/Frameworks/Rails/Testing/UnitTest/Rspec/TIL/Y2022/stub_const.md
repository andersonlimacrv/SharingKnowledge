```ruby
class A
	CONSTANT_A = ENV["VALUE_FOR_CONSTANT_A"]
end


stub_const("A::CONSTANT_A", ENV["VALUE_FOR_CONSTANT_A"])
```
