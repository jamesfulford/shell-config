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

BASEDIR=`basename "$DIR"`
COMMAND=`echo "source \"$DIR/entry.sh\"" \# $BASEDIR`

# Reinstall safe
test -f ~/.bash_profile && cat ~/.bash_profile | grep -v "$BASEDIR" >> ~/.bash_profile
echo "$COMMAND" >> ~/.bash_profile

# Reinstall safe
test -f ~/.bashrc && cat ~/.bashrc | grep -v "$BASEDIR" >> ~/.bashrc
echo "$COMMAND" >> ~/.bashrc
