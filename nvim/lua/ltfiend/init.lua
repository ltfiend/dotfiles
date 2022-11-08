-- Packer
require("ltfiend.plugins").setup()

-- load config directory (thinking I'll pull this back to load each from here, no reason for this abstraction)

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
require("config.nvim-rest")
require("config.gitsigns")
-- require("config.whichkey")

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

vim.g.gruvbox_baby_function_style = bold
vim.g.gruvbox_baby_background_color = dark
vim.g.gruvbox_baby_telescope_theme = 0
vim.g.gruvbox_baby_transparent_mode = 0
vim.cmd 'colorscheme gruvbox-baby'
-- vim.g.gruvbox_baby_colors = { soft_green = "#FFFFFF" }

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("nvim-tree").setup()

map('n', '<C-N>', ':NvimTreeToggle<CR>', opts)
map('n', ';up', '<Plug>RestNvimPreview;', opts)
map('n', ';ug', '<Plug>RestNvim;', opts)
