#!/bin/sh

if [ ! -z "$1" ]; then host="$1"; shift; fi

for f in _*; do
  case "$f" in
    *.bak|*~) ;; # skip
    *)
	basename=$(echo "$f" |cut -c2-)
	destfile=".$basename"
	if [ -s "$f" ]; then
	  if [ -z "$host" ]; then
	    #( test ! -s "$HOME"/"$destfile" || \
	    #  test "$f" -nt "$HOME"/"$destfile" ) && \
	    #( echo cp "$f" "$HOME"/"$destfile" && \cp -p "$f" "$HOME"/"$destfile" )
	    ln -v -sf "$PWD"/"$f" "$HOME"/"$destfile"
	  else
	    rsync -tP --backup "$f" "$host:$destfile"
	  fi
	fi
    ;;
  esac
done

