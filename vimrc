set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'

call vundle#end()
filetype plugin indent on

" Put swap files somewhere less intrusive
set undodir=~/.vim/tmp//
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

set autoread
set number
set hlsearch
set autoindent
set encoding=utf-8
set clipboard=unnamed

"let fo-=or
syntax enable
color desert

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let g:tex_flavor='latex'
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

let g:ackprg = 'ag --vimgrep'

" Key bindings.
let mapleader = ","

noremap <leader>w :w<cr>
noremap <leader>q :q<cr>
noremap <leader>Q :q!<cr>
noremap <leader>e :e<cr>

nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>r :so $MYVIMRC<cr>

nnoremap <leader>s :%s/
nnoremap <leader>a :Ack<Space>
nnoremap \ :noh<cr>

inoremap jk <esc>
nnoremap j gj
nnoremap k gk

nnoremap " 0i"<esc>
nnoremap <cr> i<cr><esc>==
nnoremap <F2> :set nonumber!<cr>

set tabpagemax=128
map <C-h> gT
map <C-l> gt
map <leader>t :tabnew<cr>

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

