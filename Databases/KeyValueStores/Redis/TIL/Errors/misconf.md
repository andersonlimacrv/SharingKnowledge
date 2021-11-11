### error

```html
MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error.
```

### fixed

```html
The fix is simple. From a terminal window, enter the Redis CLI. From a terminal window type:

$`redis-cli`

Use the command:

$`config set stop-writes-on-bgsave-error no`

You should get an OK response, then type exit to get out of the reds-cli.
Try again where you received the error and everything should be working as expected.
```
