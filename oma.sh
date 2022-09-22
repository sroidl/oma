#!/usr/bin/env bash
#set -x
OMA_DIR=$HOME/.oma
# if oma config exists, source it to read the variables form there
[ -f $OMA_DIR/oma.conf ] && source $OMA_DIR/oma.conf

function query() {
	echo "Asking ${OMA_USER:-everyone}'s oma for help on '$@'"
	curl oma.app/$OMA_USER/$@ 
}

function new_entry() {
	{ echo "# $@"; echo "";  cat $OMA_JOURNAL; } >${OMA_JOURNAL}.new
	mv $OMA_JOURNAL{.new,}
	vim -c 'startinsert' $OMA_JOURNAL +2

}


function usage() {
echo "Usage:
$0 [-a | -n] <query | title>
Queries https://oma.app or creates a new entry in $OMA_DIR/my-oma.md

	-a	Query all oma contributors with <query>. If not set, it will query $OMA_USER (as set in $OMA_DIR/oma.conf) only
	-n	Creates a entry into own oma journal.

" 
}

FN=query
CMD=${1}
#shift || true
case "$CMD" in
  -a)
	 OMA_USER=""
	 FN=query
	 shift
  ;;
  -n)
	FN=new_entry
	shift
  ;;
esac

if [ "$1" == "" ]; then
  usage
  exit 1
fi

"$FN" $@
