metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"

metals_config.on_attach = function(client, bufnr)
      require("metals").setup_dap()
end

