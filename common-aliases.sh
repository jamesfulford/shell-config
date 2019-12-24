#!/bin/bash

alias ls="ls -FG"
alias ll="ls -l"
alias c=clear

up(){ DEEP=$1; for i in $(seq 1 ${DEEP:-"1"}); do cd ../; done; pwd;}
bs(){ curl -s 'http://cbsg.sourceforge.net/cgi-bin/live' | grep -Eo '^<li>.*</li>' | sed "s@\</\\?li\>@@g" | gshuf -n 1 | cowsay;}
function go(){ cd $1; ls; }
