#!/bin/sh

# Taken from https://github.com/git/git/blob/master/contrib/hooks/post-receive-email#L658

refname=$1
rev=$2

other_branches=$(git for-each-ref --format='%(refname)' refs/heads/ | grep -F -v $refname)
git rev-parse --not $other_branches | git rev-list --pretty=%h%n%an%n%s%n%b%n --stdin $rev
