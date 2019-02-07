" Get the defaults that most users want.
if filereadable("$VIMRUNTIME/defaults.vim")
  source $VIMRUNTIME/defaults.vim
endif

try
    if has('syntax') && has('eval')
      packadd! matchit
    endif
catch
endtry

" Put swap files somewhere less intrusive
set undodir=~/.vim/tmp//
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

set hlsearch
set autoindent		" always set autoindenting on

"let fo-=or
color desert

filetype plugin on
let g:tex_flavor='latex'

filetype plugin indent on
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set autoread

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Key bindings.

let mapleader = ","

noremap <leader>w :w<cr>
noremap <leader>q :q<cr>

nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>V :tabnew $MYVIMRC<cr>
nnoremap <leader>r :so $MYVIMRC<cr>

nnoremap <leader>s :%s /
vnoremap <leader>s :%s /

inoremap jj <esc>
nnoremap j gj
nnoremap k gk

nnoremap <cr> i<cr><esc>==

nnoremap <F2> :set nonumber!<cr>
