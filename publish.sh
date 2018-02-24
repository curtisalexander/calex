#!/usr/bin/env bash

###########
## Setup ##
###########

git config --global user.name "Curtis Alexander"
git config --global user.email "calex@calex.org"


#############################
## Fetch, Checkout, Commit ##
#############################

# https://stackoverflow.com/a/44036486

# Fetch all the remote branches. Travis clones with `--depth`, which
# implies `--single-branch`, so we need to overwrite remote.origin.fetch to
# do that.
git config --replace-all remote.origin.fetch +refs/heads/*:refs/remotes/origin/*
git fetch

git checkout -b publish
git add .
git commit --message "Travis build: ${TRAVIS_BUILD_NUMBER}"


##########
## Push ##
##########

git remote add origin-publish https://${GITHUB_TOKEN}@github.com/curtisalexander/calex.git > /dev/null 2>&1
# force as don't care to keep local in sync with remote
git push -f --quiet --set-upstream origin-publish publish
