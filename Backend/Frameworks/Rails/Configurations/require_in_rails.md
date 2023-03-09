### 1. require
- require is a method that is used when you want to reference
and execute code that is not written in your current file

```ruby
# absolute path
require './app/example_file.rb'

# shortened name/string
require 'example_file'
```

- Shortened string vs. Absolute paths?

```html
 The shortened strings always depend on the listed directories in $LOAD_PATH.
 $: is a global variable that is used for looking up external files.
 You may see this used in your bin/environment.rb like this:
```

```html
Require relies on you having installed (e.g. gem install [package]) a package
somewhere on your system for that functionality.

When using require you can use the "./" format for a file in the current directory,
e.g. require "./my_file" but that is not a common or recommended practice and you
should use require_relative instead.
```

```ruby
# bin/environment.rb
$LOAD_PATH << './app'
```

### 2. require_all (is a subset of require)
- the method allows you to require the entire directory

### 3. require_relative (is a subset of require)
-  to use when you are referring to a file that is relative to the current file
you are working on (basically, within the same project directory).

```ruby
require_relative('path')
# require_relative uses the current location of the file using the statement

# equals:
require(File.expand_path('path', File.dirname(__FILE__)))
# require uses your $LOAD_PATH to find the files.
```

### The general rules of thumb
1. require
- should be used for external files, like gems
- most likely be used to bring in code from a library someone else wrote

2. require_relative
- should be used for referring to files within your directory (local files)
- most likely be used to bring in code from another file that you wrote


```html
- Use require for installed gems
- Use require_relative for local files
```

[source](https://medium.ninja/@ellishim/understanding-require-vs-require-relative-vs-require-all-80e3b26d89e6)
