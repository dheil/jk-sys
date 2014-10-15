#!/usr/bin/env sh

usage()
{
cat << EOF
usage: $0 options

This script can be installed local ($HOME) or global.

OPTIONS:
   -h      Show this message
   -l      install local ($HOME/.jk-sys)
   -g      install global (/opt/jk-sys)
   -v      Verbose

EOF
}

GLOBAL=
LOCAL=
VERBOSE=

while getopts “ghlv” OPTION
do
case $OPTION in
 g)
     GLOBAL=1
     ;;
 h)
     usage
     exit 1
     ;;
 l)
     LOCAL=1
     ;;
 v)
     VERBOSE=1
     ;;
 ?)
     usage
     exit
     ;;
esac
done

if [[ -z $GLOBAL ]] && [[ -z $LOCAL ]]; then
  usage
  exit 1
fi

if [[ -n $GLOBAL ]] && [[ -n $LOCAL ]]; then
  echo "ERROR: You can install only global OR local"
  usage
  exit 1
fi

OPT=-l
if [[ -n $GLOBAL ]]; then
  OPT=-g
fi

if [[ -n $VERBOSE ]]; then
  if [[ -n $GLOBAL ]]; then
    echo "starting global install..."
  else 
    echo "starting local install..."
  fi
  OPT="$OPT -v"
fi

./zsh/install.sh $OPT
./vim/install.sh $OPT

