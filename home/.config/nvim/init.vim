if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim

call dein#begin('~/.config/nvim/plugins')

call dein#add('Shougo/deoplete.nvim')
call dein#add('chriskempson/base16-vim')
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')
call dein#add('neomake/neomake')
call dein#add('nicholasday/denite.nvim') " Adds support for creating new files
                                         " in file_rec_new
call dein#add('haya14busa/dein-command.vim')
call dein#add('lilydjwg/tagbar') " Add support for rust
call dein#add('scrooloose/nerdtree')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('jeffkreeftmeijer/vim-numbertoggle')
call dein#add('redbmk/vim-fugitive') " For following symlinks
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('posva/vim-vue')

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

set tags=./tags,tags,$RUST_SRC_PATH/tags;

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim
