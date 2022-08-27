[source](https://thoughtbot.com/blog/ruby-splat-operator)

### Destructuring

```ruby
x, y, z = *[1,2,3]

puts x
# => 1

puts y
# => 2

puts z
# => 3
```

### Constructing

```ruby
x = *123
# => [123]
```

