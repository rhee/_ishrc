#!/bin/sh

if [ ! -z "$1" ]; then
  remote="$1"; shift
  # add ':' if not already exists. e.g.: myserver => myserver:
  case "$remote" in *:*);;*)remote=$remote:;;esac
fi

for f in _*; do
  case "$f" in
    *.bak|*~) ;; # skip
    *)
	basename=$(echo "$f" |cut -c2-)
	destfile=".$basename"
	if [ -s "$f" ]; then
	  if [ -z "$remote" ]; then

	    #( test ! -s "$HOME"/"$destfile" || \
	    #  test "$f" -nt "$HOME"/"$destfile" ) && \
	    #( echo cp "$f" "$HOME"/"$destfile" && \cp -p "$f" "$HOME"/"$destfile" )

	    # create backup ( ~ )
	    test -s "$HOME"/"$destfile" -a ! -L "$HOME"/"$destfile" && \mv "$HOME"/"$destfile" "$HOME"/"$destfile"~

	    # make symlink
	    ln -v -sf "$PWD"/"$f" "$HOME"/"$destfile"

	  else

	    rsync -tP --backup "$f" "$remote$destfile"

	  fi
	fi
    ;;
  esac
done
