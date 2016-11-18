#!/usr/bin/env bash




# description of what we want,
# cmd

# HEAD: current working pointer [WORKSPACE]
#

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

git log

