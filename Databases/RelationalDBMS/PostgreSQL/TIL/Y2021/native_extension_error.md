```html
compiling pg_connection.c
pg_connection.c:2394:3: error: implicit declaration of function 'gettimeofday' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                gettimeofday(&currtime, NULL);
                ^
pg_connection.c:2411:4: error: implicit declaration of function 'gettimeofday' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                        gettimeofday(&currtime, NULL);
```

### fixed

```html
gem install pg -v '0.18.4' -- --with-cflags="-Wno-error=implicit-function-declaration"
```