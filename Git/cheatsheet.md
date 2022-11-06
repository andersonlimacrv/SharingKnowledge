### This command line lists all the merged branches
```html
git branch --merged
```

### update origin
```html
git remote set-url origin <your repo>
```

### git blame file and specific line
```html
git blame -L 1,5 README.md
```

### check config
```html
git config --list
```

### git diff
1. to compare the working directory with the local repo:

```html
git diff HEAD <filename>
```

2. to compare two branches:

```html
git diff <source branch> <target branch>
```

### Delete already merged branches but master and dev

```html
git branch --merged | egrep -v "(*|master|dev)" | xargs git branch -d
```
[source](https://github.com/Tikam02/DevOps-Guide/blob/master/CI-CD/git/git-advanced-commands.md)
