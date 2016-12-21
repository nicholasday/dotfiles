" Base16 color scheme
" Uses the colorscheme set by the shell with base16
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:rustfmt_autosave = 1 

let g:deoplete#enable_at_startup = 1

let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH="~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/"
let g:racer_experimental_completer = 1

let g:neomake_rustytags_maker= {
    \ 'exe': 'rusty-tags',
    \ 'args': ['vi'],
    \ }

autocmd! BufWritePost *.rs NeomakeSh! cargo fmt
autocmd! BufWritePost *.rs NeomakeProject rustytags
autocmd! BufWritePost *.rs NeomakeProject clippy
"let g:neomake_open_list = 2

" Denite changed matched char highlight
highlight deniteMatchedChar ctermfg=cyan

call denite#custom#var('file_rec', 'command',
    \ ['rg', '--files', '--glob', '!.git'])

call denite#custom#var('file_rec_new', 'command',
    \ ['rg', '--files', '--glob', '!.git'])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading'])

" Closes vim when NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#whitespace#enabled = 0
