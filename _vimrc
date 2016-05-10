"colorscheme evening

set sw=4 ts=8 ai nows
"set et

"set compatible selectmode=mouse backup
set nobackup
"set grepprg=egrep
"set tags=tags.ctags,./tags.ctags,../tags.ctags,../../tags.ctags,../../../tags.ctags,../../../../tags.ctags,tags,./tags,~/src/tags.ctags
set tags=tags.ctags,./tags.ctags,../tags.ctags,../../tags.ctags,../../../tags.ctags,../../../../tags.ctags,$CTAGSROOT/tags.ctags,~/src/tags.ctags,~/.ctags/*
set noai nosi

set nobackup
set noswf

set nu nows

"syntax on
"set backup
"set backupext=~
"set backupdir=~/tmp
"set patchmode

set diffopt=iwhite 
set diffopt+=filler



"highlight DiffAdd cterm=NONE ctermfg=white ctermbg=Green gui=NONE guifg=white guibg=Green
"highlight DiffDelete cterm=NONE ctermfg=white ctermbg=Red gui=NONE guifg=white guibg=Red
"highlight DiffChange cterm=NONE ctermfg=white ctermbg=Yellow gui=NONE guifg=white guibg=Yellow
"highlight DiffText cterm=NONE ctermfg=white ctermbg=Magenta gui=NONE guifg=white guibg=Magenta

"highlight DiffAdd cterm=NONE ctermfg=white ctermbg=DarkGreen gui=NONE guifg=white guibg=Green
"highlight DiffDelete cterm=NONE ctermfg=white ctermbg=DarkRed gui=NONE guifg=white guibg=Red
"highlight DiffChange cterm=NONE ctermfg=white ctermbg=DarkYellow gui=NONE guifg=white guibg=Yellow
"highlight DiffText cterm=NONE ctermfg=white ctermbg=DarkMagenta gui=NONE guifg=white guibg=Magenta



map  :tp
map  :tn
map  :cp
map  :cn
map t i_T(f"f"a)F"F"F_
map  i_TCHAR(f'f'a)F'F'F_
map  :sy on:TlistToggle

"set dir=c:\\temp
"set nohlsearch


"map  :set guifont=vt100:h11:cANSI columns=129 lines=43 nu nowrap sw=4
"map  :set guifont=ProFontWindows:h11:cANSI columns=139 lines=43 nu nowrap
map  :set guifont=Lucida_Sans_Typewriter:h9:cANSI columns=119 lines=43 nu nowrap
map  :set guifont=GulimChe:h10:cHANGEUL columns=89 lines=29 nonu wrap sw=8

set nowrap
sy on

"colorscheme peaksea
set background=dark

"colorscheme desert256
"set bg=dark

"set t_Co=256
"colorscheme xoria256
"set bg=dark

set fencs=ucs-bom,utf-8,euc-kr



" for ant
" see :help errorformat-javac :help errorformat-ant
set efm+=\ %#[javac]\ %#%f:%l:%c:%*\\d:%*\\d:\ %t%[%^:]%#:%m,\%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#



















"let &termencoding=&encoding
"se encoding=utf-8
"setglobal fileencoding=utf-8

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

se noswapfile
se bufhidden=unload
"se buftype=nowritefile
se undolevels=5
"se scrolloff=9999


autocmd FileType java set sw=4 ts=4 et
autocmd FileType python set sw=4 ts=4 et
au BufEnter *.java set ai sw=4 ts=4 et
au BufEnter *.py set ai sw=4 ts=4 et

let g:DirDiffExcludes = ".git,CVS,*.class,*.exe,.*.swp"

"### BEGIN source ~/.vimrc-largefile
"let &termencoding=&encoding
"se encoding=utf-8
"setglobal fileencoding=utf-8

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
endif

se noswapfile
se bufhidden=unload
"se buftype=nowritefile
se undolevels=5
"se scrolloff=9999
"se bg=dark

:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"se cursorline
"map ;; :.,.w>>check.txt.x

map ;; :sy off:se nowrap nowrapscan cursorline so=9999:.,.w !tee -a check.txt.x >/dev/null
map ;a :sy off:se nowrap nowrapscan cursorline so=9999:.,.w !transmission-remote -a $(perl -ne 's@^([0-9A-F]{40}).*$@magnet:?xt=urn:btih:\L\1\&tr=udp\%3A\%2F\%2Ftracker.publicbt.com\%3A80\%2Fannounce\&tr=http\%3A\%2F\%2Ftracker.publicbt.com\%2Fannounce\&tr=http\%3A\%2F\%2Ftracker.torrentbox.com\%3A2710\%2Fannounce@ && print;') -ph all

autocmd FileType java set sw=4 ts=4 et
autocmd FileType python set sw=4 ts=4 et
au BufEnter *.java set ai sw=4 ts=4 et
au BufEnter *.py set ai sw=4 ts=4 et
"### END source ~/.vimrc-largefile

se enc=utf8

"se t_Co=256 bg=dark
"se bg=dark
"se t_Co=256 bg=light

