set enc=utf8 fencs=ucs-bom,utf-8,euc-kr
set sw=4 sts=4 ts=8 noai nosi
set hlsearch
set nu nowrap nows
set et
set modeline
set nobackup noswapfile
se bufhidden=unload
se undolevels=5
se noeb vb t_vb=
sy on

autocmd FileType java set sw=4 sts=4 ts=8 et
au BufEnter *.java set ai sw=4 sts=4 ts=8 et
autocmd FileType python set sw=4 sts=4 ts=8 et
au BufEnter *.py set ai sw=4 sts=4 ts=8 et
autocmd FileType yaml set sw=2 sts=2 ts=8 et
au BufEnter *.yml set ai sw=2 sts=2 ts=8 et


set tags=tags.ctags,./tags.ctags,../tags.ctags,../../tags.ctags,../../../tags.ctags,../../../../tags.ctags,$CTAGSROOT/tags.ctags,~/src/tags.ctags,~/.ctags/*

set diffopt=
"set diffopt+=iwhite
set diffopt+=filler

if &diff
    " diff mode
    set diffopt+=iwhite
endif

let g:DirDiffExcludes = "__pycache__,.ipynb_checkpoints,.git,CVS,*.class,*.exe,*.pyc,.*.swp,*.jpg,*.png,*.ckpt,*.ckpt-data-?????-of-?????,*.gz,*.xz,*.bz2"

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
autocmd FileType yaml set sw=2 sts=2 ts=8 et
au BufEnter *.yml set ai sw=2 sts=2 ts=8 et

"se cursorline
:hi clear cursorline
":hi cursorline gui=underline
:hi cursorline cterm=underline

":hi CursorLine   cterm=NONE ctermbg=darkgray ctermfg=white guibg=darkgray guifg=white
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
":nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

map  :tp
map  :tn
map  :cp
map  :cn
map t i_T(f"f"a)F"F"F_
map  i_TCHAR(f'f'a)F'F'F_
map  :sy on:TlistToggle

map  :set guifont=Lucida_Sans_Typewriter:h9:cANSI columns=119 lines=43 nu nowrap
map  :set guifont=GulimChe:h10:cHANGEUL columns=89 lines=29 nonu wrap sw=8

map ;; :sy off:se nowrap nowrapscan cursorline so=9999:.,.w !tee -a check.txt.x >/dev/null

" so ~/.vimrc-neobundle
" so ~/.vimrc-vundle

" map b :so ~/.vimrc-neobundle
" map  :so ~/.vimrc-neobundle
" map b :so ~/.vimrc-vundle
" map  :so ~/.vimrc-vundle

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" netwr trouble
" nasty NetrwMessage [RO] window with message:
" **error** (netrw) there are no marked files in this window (:help netrw-mf)
" http://stackoverflow.com/questions/21686729/vim-how-to-remove-netrw
"let loaded_netrwPlugin = 1
let g:netrw_banner = 0

let g:airline_theme='one'

"call plug#begin()
"Plug 'https://github.com/rakr/vim-one.git'
"call plug#end()

"colorscheme one

se bg=light
