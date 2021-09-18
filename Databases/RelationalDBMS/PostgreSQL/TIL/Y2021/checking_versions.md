```html
psql --version

pg_dump --version

pg_restore --version
```


### update psql version

go to `~/.zshrc` file (if you are using ohmyzshrc plugin)

then added this below

```html
export PATH="/usr/local/sbin:$PATH"
# using postgres 9.6
# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# using postgres 13
export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
```