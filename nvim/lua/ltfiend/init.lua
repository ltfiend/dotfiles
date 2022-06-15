require "config"
require'lspconfig'.bashls.setup{}
require("ltfiend.plugins").setup()
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

vim.g.gruvbox_baby_function_style = bold
vim.g.gruvbox_baby_background_color = dark
vim.g.gruvbox_baby_telescope_theme = 0
vim.g.gruvbox_baby_transparent_mode = 0
vim.cmd 'colorscheme gruvbox-baby'
vim.g.gruvbox_baby_colors = { soft_green = "#FFFFFF" }
--
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
-- vim.cmd[[colorscheme tokyonight]]
