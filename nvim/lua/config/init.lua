require("config.lsp")
require("config.telescope")
require("config.cmp")
require("config.devicons")
require("config.barbar")
require("config.metals")
require("config.sidebar")
require("config.lualine")
require("config.rust-tools")
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
