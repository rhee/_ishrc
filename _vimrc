set enc=utf8 fencs=ucs-bom,utf-8,euc-kr
set sw=4 sts=4 ts=8 noai nosi
set nu nowrap nows
"set et
set tags=tags.ctags,./tags.ctags,../tags.ctags,../../tags.ctags,../../../tags.ctags,../../../../tags.ctags,$CTAGSROOT/tags.ctags,~/src/tags.ctags,~/.ctags/*

set nobackup noswapfile
se bufhidden=unload
se undolevels=5

sy on

set diffopt=iwhite 
set diffopt+=filler

let g:DirDiffExcludes = ".git,CVS,*.class,*.exe,.*.swp"

"for ant see :help errorformat-javac :help errorformat-ant
set efm+=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

autocmd FileType java set sw=4 sts=4 ts=8 et
au BufEnter *.java set ai sw=4 sts=4 ts=8 et
autocmd FileType python set sw=4 sts=4 ts=8 et
au BufEnter *.py set ai sw=4 sts=4 ts=8 et

:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

map  :tp
map  :tn
map  :cp
map  :cn
map t i_T(f"f"a)F"F"F_
map  i_TCHAR(f'f'a)F'F'F_
map  :sy on:TlistToggle

map  :set guifont=Lucida_Sans_Typewriter:h9:cANSI columns=119 lines=43 nu nowrap
map  :set guifont=GulimChe:h10:cHANGEUL columns=89 lines=29 nonu wrap sw=8

"so ~/.vimrc-vundle

map ;; :sy off:se nowrap nowrapscan cursorline so=9999:.,.w !tee -a check.txt.x >/dev/null
map ;a :sy off:se nowrap nowrapscan cursorline so=9999:.,.w !transmission-remote -a $(perl -ne 's@^([0-9A-F]{40}).*$@magnet:?xt=urn:btih:\L\1\&tr=udp\%3A\%2F\%2Ftracker.publicbt.com\%3A80\%2Fannounce\&tr=http\%3A\%2F\%2Ftracker.publicbt.com\%2Fannounce\&tr=http\%3A\%2F\%2Ftracker.torrentbox.com\%3A2710\%2Fannounce@ && print;') -ph all

