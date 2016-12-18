call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'rust-lang/rust.vim'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'lervag/vimtex'

call plug#end()

set clipboard+=unnamedplus

" Base16 color scheme
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
set cursorline
colorscheme base16-monokai

" Unite fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])

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

" Run neomake on write
" autocmd! BufWritePost * Neomake

" Set terminal escape to esc
tnoremap <Esc> <C-\><C-n>

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

nmap <leader>n :NERDTreeToggle<CR>

nmap <leader>u :Unite file buffer -start-insert<CR>
nmap <leader>b :Unite buffer -start-insert<CR>

nmap <leader>e :e 
nmap <leader>d :bd<CR> 

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Better splits moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:deoplete#enable_at_startup = 1
