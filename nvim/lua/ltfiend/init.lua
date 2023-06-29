-- PackerG
require("ltfiend.plugins").setup()

require("config.nvim-tree")
require("config.barbar")
require("config.cmp")
require("config.devicons")
require("config.lsp")
require("config.lualine")
require("config.metals")
require("config.rust-tools")
require("config.sidebar")
require("config.telescope")
require("config.treesitter")
require("config.treesitter-context")
-- require("config.nvim-rest")
require("config.gitsigns")
require("config.colorscheme")
require("config.whichkey")
require("config.dap")
require("config.dap-gui")
require("config.telekasten")
--
-- vim.opt.guicursor=true
vim.g.mapleader=';'
vim.opt.relativenumber=true
vim.opt.hlsearch=true --don't highlight previous search pattern
vim.opt.hidden=true --keeps buffers from being unloaded when it is abandonded (buffers)
-- vim.opt.noerrorbells=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.autoindent=true
vim.opt.smartindent=true
vim.opt.number=true
vim.opt.wrap=true --dont' wrap if off the screen to the right.  Need to think about this
vim.opt.smartcase=true --case sensitive when search includes a capital, other case insensitve
vim.opt.swapfile=false
vim.opt.backup=false
vim.opt.undodir='/home/peter/.config/nvim/undodir'
vim.opt.undofile=false
vim.opt.termguicolors=true
vim.opt.scrolloff=8 -- number of lines to keep above and below the cursor when scrollling
vim.opt.showmode=false --" If in Insert, Replace or Visual mode put a message on the last line.
vim.opt.cmdheight=2 --" Give more space for displaying messages.
vim.opt.updatetime=50
-- vim.opt.shortmess+=c
-- vim.opt.shortmess-=F
vim.opt.timeoutlen=500
vim.opt.ttimeoutlen=10
-- vim.opt.colorcolumn=120

PLUGINS = {
  fzf_lua = {
    enabled = false,
  },
  telescope = {
    enabled = true,
  },
  nvim_dap = {
    enabled = true,
  },
}

local components = {
  active = {},
  inactive = {}
}
-- require("ltfiend.tts")
-- require'nvim-treesitter.install'.prefer_git = true
-- require'nvim-treesitter.configs'.setup {
--     highlight = {
--         enable = true
--     }
-- }

require('dap.ext.vscode').load_launchjs()
-- require('possession').setup()
-- require('gitsigns').setup()

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

local opts = { noremap = true, silent = true }
require("nvim-tree").setup()

local map = vim.api.nvim_set_keymap
map('n', '<C-N>', ':NvimTreeToggle<CR>', opts)
map('n', '<S-F1>', ':e /home/peter/Journals/logbook.2020<CR>', opts)
map('n', '<S-F2>', ':e /home/peter/qmk_firmware/keymap-dactyl/keymap.c<CR>', opts)
map('n', '<S-F3>', '/home/peter/Journals/Bookmarks<CR>', opts)
map('n', '<S-F4>', ':Telekasten<CR>', opts)
map('n', '<S-F5>', ':Telekasten toggle_todo<CR>', opts)
map('n', '<S-F9>', ':lua require(\'dapui\').toggle()<CR>', opts)
map('n', ';<CR>', ':so ~/.config/nvim/init.vim<CR>', opts)
map('n', '<leader>e', ':set spell!<CR>', opts)
map('n', '<Leader>f', ':Telescope fd<CR>', opts)
map('n', '<Leader>s', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>S', ':Telescope current_buffer_fuzzy_find<CR>', opts)
map('n', '<Leader>;', ':Telescope buffers<CR>', opts)
map('n', '<Leader>h', ':Telescope oldfiles<CR>', opts)
map('n', '<Leader>H', ':Telescope help_tags<CR>', opts)
map('n', '<Leader>m', ':Telescope marks<CR>', opts)
map('n', '<Leader>M', ':Telescope man_pages<CR>', opts)
map('n', '<Leader>vrc', ':lua require(\'ltfiend.telescope\').search_dotfiles()<CR>', opts)
map('n', '<Leader>k', ':Telescope keymaps<CR>', opts)

-- map('n', '<leader>f', ':Telescope buffers<CR>', opts)

-- map('n', '<S-F4>', ':vsplit<CR>', opts)
-- map('n', '<S-F5>', ':vsplit<CR>', opts)
-- map('n', '<S-F6>', ':vsplit<CR>', opts)
-- map('n', '<S-F7>', ':vsplit<CR>', opts)
-- map('n', '<S-F8>', ':vsplit<CR>', opts)
-- map('n', '<S-F9>', ':vsplit<CR>', opts)
-- map('n', '<S-F10>', ':vsplit<CR>', opts)
-- map('n', '<S-F11>', ':vsplit<CR>', opts)
-- map('n', '<S-F12>', ':vsplit<CR>', opts)
--
-- function Todo() print("Hello, Test") end
