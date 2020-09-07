" Peter's init.vim file, originated from ThePrimeagen, heavily modified now

syntax on

set guicursor=
set relativenumber
" don't highlight previous search pattern
set nohlsearch
" keeps buffers from being unloaded when it is abandonded (buffers)
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set number
" dont' wrap if off the screen to the right.  Need to think about this
set nowrap
" case sensitive when search includes a capital, other case insensitve
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" search live while typing.  Has some caveats, esc takes to you the last
" cursor position.
set incsearch
set termguicolors
" number of lines to keep above and below the cursor when scrollling
set scrolloff=8
" If in Insert, Replace or Visual mode put a message on the last line.
set noshowmode

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set nocp
filetype plugin on

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

" Completeion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline' " Status line
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'scrooloose/nerdtree'
"" 
Plug 'mhinz/vim-startify'
Plug 'davidhalter/jedi-vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'nvim-treesitter/nvim-treesitter'


" Color Stuff
Plug 'gruvbox-community/gruvbox' " color
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" format go files
" Plug 'tweekmonster/gofmt.vim'

" Fun stuff 
" Plug '/home/mpaulson/personal/vim-apm'
"Plug 'theprimeagen/vim-be-good', {'do': './install.sh'}

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:gruvbox_invert_selection='0'

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

colorscheme gruvbox
set background=dark
set t_Co=256

if executable('rg')
    let g:rg_derive_root='true'
endif
let mapleader = ";"
let loaded_matchparen = 1
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
" let g:fzf_checkout_track_key = 'ctrl-t'
" let g:fzf_branch_actions = 'ctrl-t'

nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
" nnoremap <leader>h :wincmd h<CR>
" nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>k :wincmd k<CR>
" nnoremap <leader>l :wincmd l<CR>
" psd remap to arrow keys for switching splits
 nnoremap <leader><Left> :wincmd h<CR>
 nnoremap <leader><Down> :wincmd j<CR>
 nnoremap <leader><Up> :wincmd k<CR>
 nnoremap <leader><Right> :wincmd l<CR>

nnoremap <leader>h :History<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
" nnoremap <C-p> :GFiles<CR>
" nnoremap <Leader>f :Files<CR>
" nnoremap <Leader>g :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
" nnoremap <Leader>; :Buffers<CR>
"nnoremap <Leader>bh :History:
nnoremap <Leader>q :lua require'telescope.builtin'.history{}<CR>
nnoremap <Leader>? :map<CR>
nnoremap <Leader>c :HexokinaseToggle<CR>
nnoremap <Leader>l :LazyGit<CR>
nnoremap <Leader>j :e /home/peter/logbook.2020<CR>

nnoremap <Leader>t :Vex<CR>
nnoremap <Leader>T :split term://htop<CR>
nnoremap <Leader>b :split term://bash<CR>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>] :resize +10<CR>
nnoremap <Leader>[ :resize -10<CR>
nnoremap <Leader>= :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>

nnoremap <Leader>n :NERDTreeToggle<CR>

" Telescope
nnoremap <Leader>f :lua require'telescope.builtin'.grep_string()<CR>
nnoremap <Leader>g :lua require'telescope.builtin'.git_files()<CR>
nnoremap <Leader>p :lua require'telescope.builtin'.live_grep()<CR>
nnoremap <Leader>q :lua require'telescope.builtin'.quickfix()<CR>
nnoremap <Leader>s :lua require'telescope.builtin'.grep_string()<CR>
nnoremap <Leader>; :lua require'telescope.builtin'.buffers()<CR>
nnoremap <Leader>; :lua require'telescope.builtin'.buffers()<CR>

nnoremap / :lua require'telescope.builtin'.live_grep()<CR>


vnoremap J :m '>+0<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d

" vim TODO;
" nmap <Leader>tu <Plug>BujoChecknormal
" nmap <Leader>th <Plug>BujoAddnormal
" let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Vim with me
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

" inoremap <C-c> <esc>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" inoremap <silent><expr> <C-space> coc#refresh()
inoremap <silent><expr> <C-space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" YES
com! W w

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END
