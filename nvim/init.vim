syntax on

set shortmess+=c
set shortmess-=F

filetype plugin on

highlight ColorColumn ctermbg=0 guibg=lightgrey

" treat tabletop simulator files like lua files
au BufNewFile,BufRead *.ttslua                     setf lua

" possible for openscad use, not sure yet
" au BufRead,BufNewFile *.scad    setfiletype openscad

augroup lsp
  au!
  au FileType scala,sbt,java lua require("metals").initialize_or_attach({})
augroup end

set foldmethod=indent
set foldnestmax=1
set nofoldenable

call plug#begin('~/.config/nvim/plugged')
call plug#end()

lua require ("ltfiend")

if executable('rg')
    let g:rg_derive_root='true'
endif
let mapleader = ";"
" let loaded_matchparen = 1
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
" let g:fzf_checkout_track_key = 'ctrl-t'
" let g:fzf_branch_actions = 'ctrl-t'


nnoremap <C-Left> :wincmd h<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Right> :wincmd l<CR>

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-s> :lua require'dap'.continue()<CR>

" nnoremap <C-n> :set number!<CR>:set relativenumber!<CR> 

" Fix for capital W mistype when doing :w
com! W w

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete

set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

