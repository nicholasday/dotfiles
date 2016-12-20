if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

call dein#begin('~/.vim')

call dein#add('Shougo/deoplete.nvim')
call dein#add('chriskempson/base16-vim')
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')
call dein#add('neomake/neomake')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
end

set clipboard+=unnamedplus

set cursorline

" Allow hidden buffers
set hidden

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Set line numbers
set number

" Set soft wrap at 80
set tw=80
set wrap
set linebreak
set nolist

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/plugins.vim

