call plug#begin('~/.vim/plugged')

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'

call plug#end()

" Base16 color scheme
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
set cursorline
colorscheme base16-monokai

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

nmap <leader>u :Unite file buffer<CR>

nmap <leader>e :e 
nmap <leader>d :bd<CR> 

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Better splits moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:markdown_composer_browser = "firefox"
let g:deoplete#enable_at_startup = 1

  " Follow symlinks when opening a file {{{
  " NOTE: this happens with directory symlinks anyway (due to Vim's chdir/getcwd
  "       magic when getting filenames).
  " Sources:
  "  - https://github.com/tpope/vim-fugitive/issues/147#issuecomment-7572351
  "  - http://www.reddit.com/r/vim/comments/yhsn6/is_it_possible_to_work_around_the_symlink_bug/c5w91qw
  function! MyFollowSymlink(...)
    if exists('w:no_resolve_symlink') && w:no_resolve_symlink
      return
    endif
    let fname = a:0 ? a:1 : expand('%')
    if fname =~ '^\w\+:/'
      " Do not mess with 'fugitive://' etc.
      return
    endif
    let fname = simplify(fname)

    let resolvedfile = resolve(fname)
    if resolvedfile == fname
      return
    endif
    let resolvedfile = fnameescape(resolvedfile)
    let sshm = &shm
    set shortmess+=A  " silence ATTENTION message about swap file (would get displayed twice)
    exec 'file ' . resolvedfile
    let &shm=sshm

    " Re-init fugitive.
    call fugitive#detect(resolvedfile)
    if &modifiable
      " Only display a note when editing a file, especially not for `:help`.
      redraw  " Redraw now, to avoid hit-enter prompt.
      echomsg 'Resolved symlink: =>' resolvedfile
    endif
  endfunction
  command! FollowSymlink call MyFollowSymlink()
  command! ToggleFollowSymlink let w:no_resolve_symlink = !get(w:, 'no_resolve_symlink', 0) | echo "w:no_resolve_symlink =>" w:no_resolve_symlink
  au BufReadPost * nested call MyFollowSymlink(expand('%'))
