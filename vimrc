set hlsearch
set incsearch
syntax on
set autoindent
set number
set backspace=2
filetype plugin on
set shiftwidth=4
set expandtab
set tabstop=8
set softtabstop=0
set smarttab
set ignorecase
colorscheme ron
highlight trailing_whitespace ctermbg=red guibg=red
match trailing_whitespace /\s\+$/
" mason syntax highlighting
au BufNewFile,BufRead *.cmp,*.xmp,*.bml set filetype=mason

nmap <silent><expr>  e  g:GTF_goto_file()
nmap <silent><expr>  q  g:GTF_goto_file('`')

noremap <F4> :set hlsearch! hlsearch?<CR>

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%78v', 100)

"Remaps
map <C-n> :NERDTreeToggle<CR>
nnoremap ; $
vnoremap ; $
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
ca nog noh
ca nof noh
ca ews %s/\s\+$//g

" Schllepp Mappings
vmap <up>    <Plug>SchleppUp
vmap <down>  <Plug>SchleppDown
vmap <left>  <Plug>SchleppLeft
vmap <right> <Plug>SchleppRight

vmap D       <Plug>SchleppDupLeft
vmap <C-D>   <Plug>SchleppDupLeft


execute pathogen#infect()

"=======Search Folding
" Don't start new buffers folded
set foldlevelstart=99

" Highlight folds
highlight Folded  ctermfg=cyan ctermbg=black

" Toggle on and off...
nmap <silent> <expr>  zz  FS_ToggleFoldAroundSearch({'context':1})

" Show only sub defns (and maybe comments)...
let perl_sub_pat = '^\s*\%(sub\|func\|method\|package\)\s\+\k\+'
let vim_sub_pat  = '^\s*fu\%[nction!]\s\+\k\+'
augroup FoldSub
    autocmd!
    autocmd BufEnter * nmap <silent> <expr>  zp  FS_FoldAroundTarget(perl_sub_pat,{'context':1})
    autocmd BufEnter * nmap <silent> <expr>  za  FS_FoldAroundTarget(perl_sub_pat.'\zs\\|^\s*#.*',{'context':0, 'folds':'invisible'})
    autocmd BufEnter *.vim,.vimrc nmap <silent> <expr>  zp  FS_FoldAroundTarget(vim_sub_pat,{'context':1})
    autocmd BufEnter *.vim,.vimrc nmap <silent> <expr>  za  FS_FoldAroundTarget(vim_sub_pat.'\\|^\s*".*',{'context':0, 'folds':'invisible'})
    autocmd BufEnter * nmap <silent> <expr>             zv  FS_FoldAroundTarget(vim_sub_pat.'\\|^\s*".*',{'context':0, 'folds':'invisible'})
augroup END



" Show only C #includes...
nmap <silent> <expr>  zu  FS_FoldAroundTarget('^\s*use\s\+\S.*;',{'context':1})

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_google'

set runtimepath^=~/.vim/plugin/gitgutter.vim
