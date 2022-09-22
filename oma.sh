#!/usr/bin/env bash
set -x
OMA_DIR=$HOME/.oma
# if oma config exists, source it to read the variables form there
[ -f $OMA_DIR/oma.conf ] && source $OMA_DIR/oma.conf

if [ "$1" == "@all" ]; then
 OMA_USER=
 # remove  @all from query
 shift || true
fi

curl oma.app/$OMA_USER/$@ 

