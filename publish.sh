#!/usr/bin/env bash

# setup git
git config --global user.name "Curtis Alexander"
git config --global user.email "calex@calex.org"

# checkout
git checkout -b publish
git add .
git commit --message "Travis build: ${TRAVIS_BUILD_NUMBER}"

git remote add origin-pages https://${GITHUB_TOKEN}@github.com/curtisalexander/calex.git > /dev/null 2>&1
git push --quiet --set-upstream origin publish

