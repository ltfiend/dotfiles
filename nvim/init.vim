syntax on

set guicursor=
set relativenumber
set hlsearch " don't highlight previous search pattern
set hidden " keeps buffers from being unloaded when it is abandonded (buffers)
set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set number
set nowrap " dont' wrap if off the screen to the right.  Need to think about this
set smartcase " case sensitive when search includes a capital, other case insensitve
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set termguicolors
set scrolloff=8 " number of lines to keep above and below the cursor when scrollling
set noshowmode " If in Insert, Replace or Visual mode put a message on the last line.
set cmdheight=2 " Give more space for displaying messages.

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

filetype plugin on

" Set timeouts to remove delay after hitting ESC
set timeoutlen=1000
set ttimeoutlen=10

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.config/nvim/plugged')

" treat tabletop simulator files like lua files
au BufNewFile,BufRead *.ttslua                     setf lua
" possible for openscad use, not sure yet
" au BufRead,BufNewFile *.scad    setfiletype openscad

augroup lsp
  au!
  au FileType scala,sbt lua require("metals").initialize_or_attach({})
augroup end

set foldmethod=indent
set foldnestmax=1
set nofoldenable

" Completeion
" Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot' " LSP loader
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-dispatch'
" Plug 'vim-airline/vim-airline' " Status line
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'
Plug 'scalameta/nvim-metals'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For luasnip user.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'williamboman/nvim-lsp-installer'
Plug 'jbyuki/venn.nvim'
Plug 'scrooloose/nerdtree'
"" 
Plug 'mhinz/vim-startify'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'lambdalisue/suda'

" Git
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Color Stuff
Plug 'gruvbox-community/gruvbox' " color

Plug 'theniceboy/vim-calc'
" Plug 'ryanoasis/vim-devicons'


"Plug 'terryma/vim-multiple-cursors'

" Coc
"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

" lua require ('mcpfunctions')
" lua require ('telescope')
"
call plug#end()

lua require ("ltfiend")

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:gruvbox_invert_selection='0'

" --- vim go (polyglot) settings.
" not using go at the moment, could probably delete
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

" set t_Co=256
colorscheme gruvbox
set background=dark

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

" Open help for the current word
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>cw :cd <C-R>=expand("<cWORD>")<CR><CR>
" nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" soon to be removed.  no arrows on the dactyl.  hjkl from now on.
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Right> :wincmd l<CR>

nnoremap <C-Left> :wincmd h<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Right> :wincmd l<CR>

nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>? :map<CR>
nnoremap <Leader>w :set wrap<CR>

" close current buffer
nnoremap <leader>c :call Calc()<CR>
"nnoremap <Leader>c :bw<CR>

" nnoremap <Leader>l :LazyGit<CR>

" Reload init.vim
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>ei :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>j :e /home/peter/Journals/logbook.2020<CR>
nnoremap <Leader>K :e /home/peter/qmk_firmware/keymap-dactyl/keymap.c<CR>
nnoremap <leader>dw :cd <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>dh :cd ~<CR>

" nnoremap <Leader>t :Vex<CR>
nnoremap <Leader>T :split term://htop<CR>
"nnoremap <Leader>t :split term://<CR>
nnoremap <Leader>b :e /home/peter/Journals/Bookmarks<CR>
" nnoremap <Leader>s :split<CR>
nnoremap <Leader>V :vsplit<CR>
nnoremap <Leader>] :resize +15<CR>
nnoremap <Leader>[ :resize -10<CR>
nnoremap <Leader>= :vertical resize +10<CR>
nnoremap <Leader>- :vertical resize -10<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-r> :FloatermNew --height=0.8 --width=0.8 ranger<CR>

" TTS Mod
" nnoremap <Leader>Z :lua require'telescope.getscripts'.fd()<CR>
nnoremap <C-e> :lua mcptimeslide()CR>

" vnoremap J :m '>+0<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv
" vnoremap X "_d

nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Fix for capital W mistype
com! W w

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        " botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <C-t> :call TermToggle(12)<CR>
inoremap <C-t> <Esc>:call TermToggle(12)<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle(12)<CR>

function! SaveBufNames()
    let files = filter(map(range(1,bufnr('$')), 'bufname(v:val)'), '!empty(v:val)')
    call writefile(files, '/home/peter/bufname.out')
endfunction

nnoremap <Leader>B :call SaveBufNames()<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
