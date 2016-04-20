


#!/bin/sh

update(){(

  for f in _*; do
    case "$f" in
      *.bak|*~) ;; #skip 
      *)
	basename=$(echo "$f" |cut -c2-)
	destfile="$HOME/.$basename"
	if [ -s "$f" ]; then
	  ( test ! -s "$destfile" || \
	    test "$f" -nt "$destfile" ) && \
	  ( echo cp "$f" "$destfile" && \cp -p "$f" "$destfile" )
	fi
	;;
    esac
  done

)}

commit(){(

  for f in _*; do
    case "$f" in
      *.bak|*~) ;; #skip 
      *)
	basename=$(echo "$f" |cut -c2-)
	destfile="$HOME/.$basename"
	( test -s "$destfile" && \
	  test "$f" -ot "$destfile" ) && \
	( echo cp -p "$destfile" "$f" && \cp -p "$destfile" "$f" )
	;;
    esac
  done

)}

usage_and_exit(){
  echo "Usage: make.sh update or make.sh commit" 1>&2
  exit 1
}

if [ -z "$1" ]; then
  usage_and_exit
fi

cmd="$1"
shift

case "$cmd" in
  update)
    update
    ;;
  commit)
    commit
    ;;
  *)
    usage_and_exit
    ;;
esac

