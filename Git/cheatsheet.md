### This command line lists all the merged branches
git branch --merged

### update origin
git remote set-url origin <your repo>

### git blame file and specific line
git blame -L 1,5 README.md

### check config
git config --list


### git diff
- to compare the working directory with the local repo:

git diff HEAD <filename>

-  to compare two branches:

git diff <source branch> <target branch>
