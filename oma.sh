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

function oma_git() {
	pushd $OMA_HOME > /dev/null
	git ${@}
	popd > /dev/null
}

function oma_edit() {
  vim $OMA_JOURNAL 
}

function usage() {
echo "Usage:
$0 [-a | -n] <query | title>
Queries https://oma.app or creates a new entry in $OMA_DIR/my-oma.md

	-a		Query all oma contributors with <query>. If not set, it will query $OMA_USER (as set in $OMA_DIR/oma.conf) only
	-e		Opens vim on the OMA journal
	-n  --new	Creates a entry into own OMA journal.
	-c  --commit	Commit current changes in $OMA_HOME. It is advised to check the status/diff with <oma -g status> before
	-g  --git	Runs any git command in $OMA_HOME
			Note: Does not work with commit -m at the moment 
			Example: 
			$0 -g commit -m 'new entry'
	

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
  -e)
	oma_edit
	exit 0
  ;;
  --new|-n)
	FN=new_entry
	shift
  ;;
  --git|-g)
	FN=oma_git
	shift
  ;;
  -c|--commit)
	pushd $OMA_HOME > /dev/null
	git commit .
	popd > /dev/null
	exit
  ;;
esac

if [ "$1" == "" ]; then
  usage
  exit 1
fi

"$FN" $@
