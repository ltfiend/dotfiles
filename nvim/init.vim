syntax on

" set guicursor=
" set relativenumber
" set hlsearch " don't highlight previous search pattern
" set hidden " keeps buffers from being unloaded when it is abandonded (buffers)
" set noerrorbells
" set tabstop=4 
" set softtabstop=4
" set shiftwidth=4
" set expandtab
" set autoindent
" set smartindent
" set number
" set nowrap " dont' wrap if off the screen to the right.  Need to think about this
" set smartcase " case sensitive when search includes a capital, other case insensitve
" set noswapfile
" set nobackup
" set undodir=~/.config/nvim/undodir
" set undofile
" set termguicolors
" set scrolloff=8 " number of lines to keep above and below the cursor when scrollling
" set noshowmode " If in Insert, Replace or Visual mode put a message on the last line.
" set cmdheight=2 " Give more space for displaying messages.
" 
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set shortmess-=F
" vim.opt_global.shortmess:remove("F")

filetype plugin on

" Set timeouts to remove delay after hitting ESC
" set timeoutlen=500
" set ttimeoutlen=10
" 
" set colorcolumn=120
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
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  
  " Completeion
  " Plug 'sheerun/vim-polyglot' " LSP loader
  "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  "Plug 'junegunn/fzf.vim'
  " Plug 'tpope/vim-dispatch'
  " Plug 'nvim-lua/popup.nvim'
  " Plug 'nvim-lua/plenary.nvim'
  " Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'neovim/nvim-lspconfig'
  " Plug 'scalameta/nvim-metals'
  " Plug 'hrsh7th/cmp-nvim-lsp'
  " Plug 'hrsh7th/cmp-buffer'
  " Plug 'hrsh7th/cmp-path'
  " Plug 'hrsh7th/cmp-cmdline'
  " Plug 'hrsh7th/nvim-cmp'
  " Plug 'L3MON4D3/LuaSnip'
  " Plug 'saadparwaiz1/cmp_luasnip'
  " Plug 'williamboman/nvim-lsp-installer'

  " Plug 'jbyuki/venn.nvim'
  " Plug 'theniceboy/vim-calc'
  " Plug 'simrat39/rust-tools.nvim'

  " Plug 'scrooloose/nerdtree'
  " Plug 'mhinz/vim-startify'
 " Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  
  " Plug 'gruvbox-community/gruvbox' " color
 " Plug 'mfussenegger/nvim-dap'
 " Plug 'mfussenegger/nvim-dap-python'
 " 
 " " Plug 'Pocco81/dap-buddy.nvim', {'commit': '24923c3'}
 " Plug 'theHamsta/nvim-dap-virtual-text'
 " Plug 'rcarriga/nvim-dap-ui'
 " Plug 'nvim-telescope/telescope-dap.nvim'
 " Plug 'leoluz/nvim-dap-go'
 " Plug 'jbyuki/one-small-step-for-vimkind'

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

