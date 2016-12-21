" Buffers navigation and management
nnoremap <silent> + :bn<CR>
nnoremap <silent> _ :bp<CR>

" Bind some git fugitive commands
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gpu :Git push<cr>
nmap <leader>gpl :Git pull<cr>


nmap <leader>e :e 
nmap <leader>d :bd<CR> 

" Better splits moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set stuff to work on soft wrapped lines
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

" Remap jk to esc
imap jk <Esc>

" Opens file/buffer Denite
nmap <leader>u :Denite buffer file_rec_new<cr>
nmap <leader>/ :Denite grep<cr>
nmap <leader>b :Denite buffer<cr>

nmap <leader>q :q!<cr>
nmap <leader>s :w<cr>
nmap <leader>wq :wq<cr>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-Tab>  pumvisible() ? "\<c-p>" : "\<c-h>"

nmap <leader>t :Tagbar<cr>

nmap <leader>n :NERDTreeToggle<CR>
