[source](https://dev.to/rmpato/git-pull-multiple-repositories-at-once-4l68)

### example
- create a parent folder includes multiple repo that you'd like to git pull once

```ruby
find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;


# mindepth, maxdepth: level directory
# type d: type is directory
```
