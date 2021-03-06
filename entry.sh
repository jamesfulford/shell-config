#!/bin/bash

#
# Find this script's location directory
#
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

# Common aliases
source "$DIR/common-aliases.sh"
test -f "~/.bash_aliases" && source "~/.bash_aliases"

# PS1 Prompt
source "$DIR/tools/prompt.sh"
source "$DIR/default/prompt.sh"

# Git completion
source "$DIR/tools/git-completion.sh"
source "$DIR/tools/git-prompt.sh"
