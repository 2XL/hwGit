GIT
===


* get started:

```bash
sudo apt-get install git
man git || git help
```

<

* Golden Rules: 
    1. Never 'rebase' shared commits # pushed
    2. Be careful when you `revert` merged commits
        * revert is not undo
        * it creates a new commit that does the opposite operations 
    3. Simple, clear purpose and principles give rise to complex and intelligent behaviour. (Micro service)
    4. Complex rules and regulations give rise to simple and stupid behaviour (Monolith)
    
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
    
## Good practice:

* If rebase, dont merge
* If merge, dont rebase
* Only developer X can do Y on branch Z
* Dont push to a red build (Failed Integration Branch) / using hooks
* `Rebase Squash` a feature to a single commit before you merge it to master
* Choose the most appropriate model by context
* Start small and grow it.

## Example:

* Distribution model
    - centralized
* Branching model
    - one Integration (master)
    - one Feature branch per Feature (feature/awsomefeature)
* Constraints
    - Keep master stable, fix it ASAP if it breaks
    - Integrate Feature Branches every few days
    - Use merge over rebase by default



## References:

[Git models](http://nvie.com/posts/a-successful-git-branching-model/)