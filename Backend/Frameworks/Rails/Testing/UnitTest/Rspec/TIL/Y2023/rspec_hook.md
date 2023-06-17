```rbuy
#after(*args, &block) ⇒ void (also: #prepend_after)
Declare a block of code to be run after each example (using :example) or once after all examples n the context (using :context).

#append_after(*args, &block) ⇒ void
Adds block to the back of the list of after blocks in the same scope (:example, :context, or :suite).

#around(*args) {|Example| ... } ⇒ void
Declare a block of code, parts of which will be run before and parts after the example.

#before(*args, &block) ⇒ void (also: #append_before)
Declare a block of code to be run before each example (using :example) or once before any example (using :context).

#prepend_before(*args, &block) ⇒ void
Adds block to the front of the list of before blocks in the same scope (:example, :context, or :suite).
```

[source](https://rubydoc.info/gems/rspec-core/RSpec/Core/Hooks#)
