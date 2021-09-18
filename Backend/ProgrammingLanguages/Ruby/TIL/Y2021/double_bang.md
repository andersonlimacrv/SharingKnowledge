```html
It casts a variable into type boolean and determine its truthy or falsy value
```

### example

```ruby
# Numbers...
!!1 # => true
!!0 # => true

# Numbers as strings...
!!'1' # => true
!!'0' # => false

# Truthy strings (case insensitive)...
!!'true'  # => true  (alias: 't')
!!'false' # => false (alias: 'f')
!!'yes'   # => false (alias: 'y')
!!'no'    # => false (alias: 'n')

# Booleans...
!!true  # => true
!!false # => false

# Nil...
!!nil # => false
```
[source](https://stackoverflow.com/questions/36418966/double-bang-meaning-in-ruby)