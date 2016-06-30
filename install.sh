#!/bin/sh

### # debug
### set -x

# zsh-workaround
setopt shwordsplit >/dev/null 2>&1
# bash nullglob
shopt nullglob >/dev/null 2>&1

### # backup suffix type #1: e.g.: 2016-06-30.2a5e9b
### suffix=$(git log --pretty=format:'%ad.%h' --abbrev-commit --date=short -1 2>/dev/null)
# backup suffix type #2: e.g.: 2016-06-30_15-39-28
if [ -z "$suffix" ]; then suffix=$(date +%Y-%m-%d_%H-%M-%S); fi

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
	if [ -s "$f" ]; then
	  if [ -z "$remote" ]; then

	    srcfile="$PWD/$f"
	    destfile="$HOME/.$basename"

	    if ! test "$destfile" -ef "$srcfile"; then
		# create backup ( ~ )
		test -s "$destfile" && \mv "$destfile" "$destfile"-"$suffix"~
		# make symlink
		ln -v -sf "$srcfile" "$destfile"
	    fi

	  else

	    srcfile="$PWD/$f"
	    destfile="$remote.$basename"

	    rsync -tP --backup --suffix=-"$suffix"~ "$srcfile" "$destfile"

	  fi
	fi
    ;;
  esac
done
