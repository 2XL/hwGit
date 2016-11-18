#!/usr/bin/env bash




# description of what we want,
# cmd

# HEAD: current working pointer [WORKSPACE]
# [STASH]   [CODE](workspace)  [INDEX](pointer)   [REPO](tree)

# start a repo
git init


#####################################
# changing and committing
touch edited_file
git diff # we see the a file is modified / created
git add edited_filename  # add to the index
git diff # check the different between local index (.git directory) and working area
# no diff
git diff --cached # compare local index with remote repo index
# have diff
git commit -m "edit message" # commit the local index, to repo
# all aligned
# moving between commits (switching HEAD with checkout)
git checkout branch_name

#####################################
# removing a file from working area dn index
git rm file_name # if the file was not in the repository
    # --cached # remove from index
    # -f # remove for all

######################################
# move and rename files
## option 1
mv file_name new_file_name
git add new_file_name

## option 2
git mv file_name new_file_name

######################################
# revert editions
##
# commands that moves branches -> that creates a commit
#
git commit
git merge
git rebase
git pull
# and also
git reset
    # --hard
    # --soft
    # --mixed

######################################
## demo reset commits
git log # list the commits with its id
# to stage a modification to the index means
git add modified_file
git commit -m "modified_file because blah"

# now i want to move back from the latest 'commit'
git log # choose the commit <id> that we want to point our index
git reset --hard commid_id # move back and the latest commits got removed

# i want to revert the latest 'add|stage' from updating the current index
## option 1
git rm --cache .
## option 2 # rollback of the index to the latest repo HEAD
git reset HEAD # default --mixed
git reset HEAD filename # default --mixed

# i want to revert the index and the working area, file states,
# (same as the latest commit) don't care losing all the edits
git reset --hard HEAD

# i want to revert a commit but let the edits staged
git reset --soft HEAD

# commit the changes using previous reset message
git commit -c ORIG_HEAD # .git/ORIG_HEAD
# -c # edit the latest message
# -C # without edit

# i just want to edit the latest 'commit message'
git commit --amend
# i want to revert file modification of working area
git checkout HEAD modified_file

######################################
# The Stash (Safely in a secret place),
# 1. align [WORK|INDEX|REPO] by moving the staged files to stash stage
# 2. checkout to the current commit
git stash --include-untracked
# check stashed stage
git stash list
# move back the stashed data to the working area and index
git stash apply
#
# do some changes, stage changes and commit them
#
# clean stash stage
git stash clear


######################################
# Merging branches
git merge [branch]
# case 1 HAVE CONFLICT
#
# <<<<<<HEAD
# ASDF              # what is in the HEAD branch
# =====
# QWER              # what is in the [branch] branch
# >>>>>>[branch]
#
# show latest [branch-id]
more .git/MERGE_HEAD
#
# the solution could be removing both, keeping one or both
#
git add conflict_file
git commit -m "fix conflict"
# end merge

######################################
# history decorator
#
git log
#commit a47db77fad44e3252f367210b86a3b687e0a25c9
#Author: chenglong.zq <chenglong.zq@gmail.com>
#Date:   Fri Nov 18 02:08:20 2016 +0100
#
#    README.md code instead of raw
#
#commit 5fb84eb263f6caceba521af77827d4d847bbdd3c
#:...skipping...
#commit a47db77fad44e3252f367210b86a3b687e0a25c9
#Author: chenglong.zq <chenglong.zq@gmail.com>
#Date:   Fri Nov 18 02:08:20 2016 +0100
#
#    README.md code instead of raw
#commit 5fb84eb263f6caceba521af77827d4d847bbdd3c
#Author: chenglong.zq <chenglong.zq@gmail.com>
#Date:   Fri Nov 18 02:06:12 2016 +0100
#
#    Git toolbox
#
#commit f100a4a6116d076d7c5b9984b4099bda0ae1ef74
#Author: chenglong.zq <chenglong.zq@gmail.com>
#Date:   Fri Nov 18 01:15:52 2016 +0100
#
#    Initial Commit

git log --graph
#x@x:hwGit$ git log --graph --decorate --oneline
#* a47db77 (HEAD -> master) README.md code instead of raw
#* 5fb84eb (origin/master) Git toolbox
#* f100a4a Initial Commit

git show [commit_id|branch_name|HEAD|HEAD^]
#x@x ~/CodeLab/Bash/hwGit $ git show a47db77
#commit a47db77fad44e3252f367210b86a3b687e0a25c9
#Author: chenglong.zq <chenglong.zq@gmail.com>
#Date:   Fri Nov 18 02:08:20 2016 +0100
#
#    README.md code instead of raw
#
#diff --git a/README.md b/README.md
#index 9c5c213..6c5380a 100644
#--- a/README.md
#+++ b/README.md
#@@ -4,8 +4,9 @@ GIT
#
# * get started:
#
#+```bash
# sudo apt-get install git
# man git || git help
#-
#+```
#
#
#x@x ~/CodeLab/Bash/hwGit $

HEAD        root
HEAD^       root parent
HEAD^^      root grant parent
HEAD~3      root grant grant parent # goto head and move back 3 positions
HEAD~4^2    # if we have a merge move from left to right ordered by id name
HEAD@{"1 month ago"} # where was head one month ago

###########################
# track history of one file

# know who edited each line of a file
git blame file_name
# git blame README.md
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100  1) GIT
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100  2) ===
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100  3)
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100  4)
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100  5) * get started:
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100  6)
#a47db77f (chenglong.zq 2016-11-18 02:08:20 +0100  7) ```bash
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100  8) sudo apt-get install git
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100  9) man git || git help
#a47db77f (chenglong.zq 2016-11-18 02:08:20 +0100 10) ```
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100 11)
#^f100a4a (chenglong.zq 2016-11-18 01:15:52 +0100 12)

# show all the modifications between two 'commits' or 'branches' [x] [y]
git diff HEAD HEAD~1
#x@x ~/CodeLab/Bash/hwGit $ git diff HEAD HEAD~1
#diff --git a/README.md b/README.md
#index 6c5380a..9c5c213 100644
#--- a/README.md
#+++ b/README.md
#@@ -4,9 +4,8 @@ GIT
#
# * get started:
#
#-```bash
# sudo apt-get install git
# man git || git help
#-```
#+
#
#
#x@x ~/CodeLab/Bash/hwGit $

# show editions per each commit
git log --patch

# show 'commits' which contains certain string
git log --grep [keyword] --oneline
#x@x ~/CodeLab/Bash/hwGit $ git log --grep Git --oneline
#5fb84eb Git toolbox

# show 'commit' which contains matching keywords in edition
git log -G[keyword] --patch

# get help for subcommand
git help grep

# show latest # commits
git log -3 --oneline
#x@x ~/CodeLab/Bash/hwGit $ git log -3 --oneline
#a47db77 README.md code instead of raw
#5fb84eb Git toolbox
#f100a4a Initial Commit
#x@x ~/CodeLab/Bash/hwGit $

# show commits between [index_index]
git log HEAD~5..HEAD^ --oneline # oldest..recent

# show commits between [branches..branch]
git log branch_a..branch_b --oneline


