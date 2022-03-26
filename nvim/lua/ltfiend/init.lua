require("ltfiend.lsp")
require("ltfiend.telescope")
require("ltfiend.cmp")
require("ltfiend.devicons")
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
