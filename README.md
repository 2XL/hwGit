GIT
===


* get started:

```bash
sudo apt-get install git
man git || git help
```


* Golden Rules: 
    1. never 'rebase' shared commits # pushed
    2. be careful when you `revert` merged commits
        * revert is not undo
        * it creates a new commit that does the opposite operations 
 
 # WIP (Work In Progress)
 ... commit everything (small changes)
 ... after finishing features
 ... refactor commit history
 ```git rebase```