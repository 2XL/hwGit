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
 
 
 * Git Models of Workflow
    * P2P Model
        * all people has instance of repo in sync
    * Centralized Model
        * require a `blessed` repository also known as `origin`
    * PR Model (Pull Request)
        * role of maintainers: who pushes the code
        * role of contributor: who pull, prepare pull requests
    * Layered PR Model 
        * main_project (the benevolent dictator) ... franco/hitler/stalin/mao/myself.
            * sub_project_1 (lieutenants): substitute actor for a superior
            * sub_project_2
            * ...
            
 * Git Branches Type
    * `stable branch`: one single line (stable)
    * `unstable branch`: one single line (stable or broke)
    * `integration branch`: it fork and merge features (stable or broke)
    * `release branch`: merges from integration branch, used to be versioned (stable)
    * `feature branches`: the integration branch only merges from features
    