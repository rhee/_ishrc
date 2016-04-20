:

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

cmd="$1"
shift

case "$cmd" in
  update)
    git pull && update
    ;;
  commit)
    merge && git commit -m. -a && git push
    ;;
esac

