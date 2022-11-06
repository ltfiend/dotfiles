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
