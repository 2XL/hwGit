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


