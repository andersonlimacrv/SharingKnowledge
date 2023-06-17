[autocorrect](https://docs.rubocop.org/rubocop/usage/auto_correct.html)

### generating comments
- example: offense that can not autocorrect so that we should generate comment to disable the warning

```html
$ rubocop --auto-correct --disable-uncorrectable
```

### severity levels for offenses

~~~ruby
rubocop <file_name> --force-exclusion --display-cop-names --display-only-fail-level-offenses --fail-level=convention
~~~

~~~html
- RuboCop has five built-in severity levels for offenses, ordered from lowest to highest severity:

1. convention - style guidelines and best practices
2. warning - potential issues that could lead to bugs or unexpected behavior
3. error - definite problems that need to be fixed
4. fatal - severe issues that will cause the code to fail
5. unknown - offenses that RuboCop is unable to determine the severity of
~~~
