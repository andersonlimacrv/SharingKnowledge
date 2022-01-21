```ruby
class A
  TYPES = [
    TEST1 = 'test1',
    TEST2 = 'test2',
  ]
end

# this is possible:
p A::TEST1 #=> "test1"
# because [An array literal ([...]) defines no scope]
```

```ruby
# If you want to prevent visibility outside the class (hiding) you can use 'private_constant'
# private_constant :TEST1
class A
  CODES = [
    EVENT_CINEMA = 'event_cinema',
    GIFTPAY = 'giftpay',
  ]
  private_constant :EVENT_CINEMA, :GIFTPAY
end
 => A
2.6.6 :009 > A::EVENT_CINEMA
Traceback (most recent call last):
NameError (private constant A::EVENT_CINEMA referenced)
```
