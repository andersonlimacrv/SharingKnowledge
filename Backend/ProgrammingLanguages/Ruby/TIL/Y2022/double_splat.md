### That is the double splat operator which is available since Ruby 2.0.

```html
It captures all keyword arguments
(which can also be a simple hash, which was the idiomatic way to emulate keyword arguments before they became part of the Ruby language)
```

- The operator ** is useful as an options hash.

```ruby
def one_method(**options);end
```

- This form is completely similar to the following:

```ruby
def another_method(options = {});end
```


[source](https://jetrockets.com/blog/ruby-double-splat-operator-cheatsheet)
