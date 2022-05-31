--
require("ltfiend.lsp")
require("ltfiend.telescope")
require("ltfiend.cmp")
require("ltfiend.devicons")
require("ltfiend.barbar")
require'lspconfig'.bashls.setup{}
require "config"
-- require "utils"
require("plugins").setup()
local components = {
  active = {},
  inactive = {}
}
-- require("ltfiend.tts")
require'nvim-treesitter.install'.prefer_git = true

require('dap.ext.vscode').load_launchjs()

-- require('possession').setup()
require('gitsigns').setup()

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

local opts = {
    -- ... other configs
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

-- Normal setup
require('rust-tools').setup(opts)
require('lualine').setup { 
    options = {
        theme = "gruvbox-baby"
    }
}

vim.g.gruvbox_baby_function_style = bold
vim.g.gruvbox_baby_background_color = dark
vim.g.gruvbox_baby_telescope_theme = 0
vim.g.gruvbox_baby_transparent_mode = 0
vim.cmd 'colorscheme gruvbox-baby'
