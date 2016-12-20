" Base16 color scheme
" Uses the colorscheme set by the shell with base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:rustfmt_autosave = 1 

let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (<SID>is_whitespace() ? "\<Tab>" : deoplete#mappings#manual_complete())
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH="~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"
let g:racer_experimental_completer = 1

autocmd! BufWritePost *.rs Neomake! cargo
let g:neomake_open_list = 2
