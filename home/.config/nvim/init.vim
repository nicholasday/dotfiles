call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'

call plug#end()

let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
set cursorline
colorscheme base16-monokai

set hidden

imap jk <Esc>
