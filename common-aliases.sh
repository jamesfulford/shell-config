#!/bin/bash

alias ls="ls -FG"
alias ll="ls -l"
alias c=clear
alias x=exit
alias p="ping 8.8.8.8"

alias aliases="subl ~/.bash_aliases"
alias source-aliases="source ~/shell-config/common-aliases.sh"
alias cbranch="git rev-parse --abbrev-ref HEAD | pbcopy"

alias watch="watch " # so you can use aliases

# https://www.sublimemerge.com/docs/command_line
# but smerge is not installed by default
alias sb="smerge ."

# Git
alias cont="git rebase --continue"
alias abort="git rebase --abort"
alias amend="git commit --amend --no-edit"

function pull () {
    git pull --rebase --autostash origin $(git rev-parse --abbrev-ref HEAD)
}

function patch () {
    local branch=${1:-master}
    git format-patch "$branch"
}

function clean-branches() {
    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
    git gc
}
 