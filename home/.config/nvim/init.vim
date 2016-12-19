if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim')

call dein#add('Shougo/deoplete.nvim')
call dein#add('chriskempson/base16-vim')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
end

set clipboard+=unnamedplus

" Base16 color scheme
" Uses the colorscheme set by the shell with base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set cursorline

" Allow hidden buffers
set hidden

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Set line numbers
set number

" Remap jk to esc
imap jk <Esc>

" Set soft wrap at 80
set tw=80
set wrap
set linebreak
set nolist

" Set stuff to work on soft wrapped lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" Bind some git fugitive commands
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

nmap <leader>e :e 
nmap <leader>d :bd<CR> 

" Better splits moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
