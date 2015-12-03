call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'

call plug#end()

let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
set cursorline
colorscheme base16-monokai

" Allow hidden buffers
set hidden

imap jk <Esc>

" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>
