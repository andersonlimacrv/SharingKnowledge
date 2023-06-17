~~~html
1. `git diff --name-only --diff-filter=d $(git merge-base $SQUARE_BRANCH origin/$BASE_BRANCH) $SQUARE_BRANCH > output-files`

This command generates a list of file names that have changed between the merge base of `$SQUARE_BRANCH` and `origin/$BASE_BRANCH`,
and the current `$SQUARE_BRANCH`.

`--name-only` option lists only the file names,
`--diff-filter=d` option filters out deleted files.


2. `[ ! -s output-files ] && echo 'no changed files' || rubocop $(paste -sd ' ' output-files) --force-exclusion --display-cop-names --display-only-fail-level-offenses --fail-level=warning`

This command first checks if the `output-files` file is empty (i.e., no changed files) using the `-s` test. If it's empty, it echoes 'no changed files'. If not, it runs RuboCop, a Ruby static code analyzer, on the changed files listed in `output-files`. The `--force-exclusion`, `--display-cop-names`, `--display-only-fail-level-offenses`, and `--fail-level=warning` options configure RuboCop's behavior.

Here's a breakdown of the RuboCop options:
- `--force-exclusion`: Enforces the exclusion of files specified in the RuboCop configuration file.
- `--display-cop-names`: Displays the names of the cops that found offenses.
- `--display-only-fail-level-offenses`: Only displays offenses with a severity equal to or greater than the specified fail level.
- `--fail-level=warning`: Sets the minimum severity level for offenses to be considered a failure.
~~~

~~~html
$(paste -sd ' ' output-files)

### example
1. output-files

file1.rb
file2.rb
file3.rb

2. Running paste -sd ' ' output-files would generate the following output:

file1.rb file2.rb file3.rb
~~~
