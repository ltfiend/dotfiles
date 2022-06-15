-- local sumneko_binary = '/home/peter/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server'
local sumneko_root_path  = '/home/peter/.local/share/nvim/lsp_servers/sumneko_lua/extension/server'
local sumneko_binary = '/home/peter/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server'

local function on_attach()
end

require("nvim-lsp-installer").setup {}

-- require'lspconfig'.grammarly.setup{ on_attach = on_attach }
require'lspconfig'.bashls.setup{ on_attach = on_attach }
require'lspconfig'.perlnavigator.setup{ on_attach = on_attach }
require'lspconfig'.html.setup{ on_attach = on_attach }
require'lspconfig'.awk_ls.setup{ on_attach = on_attach }
require'lspconfig'.tsserver.setup{ on_attach = on_attach }
require'lspconfig'.angularls.setup{ on_attach = on_attach }

require'lspconfig'.dockerls.setup{
    on_attach = on_attach,
--    cmd = {'/home/peter/.local/share/nvim/lsp_servers/dockerfile/node_modules/dockerfile-language-server-nodejs/bin/docker-langserver'},
}

require'lspconfig'.pyright.setup{
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.bashls.setup{
    -- cmd = { '/home/peter/.local/share/nvim/lsp_servers/bash/node_modules/.bin/bash-language-server' },
    on_attach = on_attach,
    cmd = { '/snap/bin/bash-language-server' },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.sumneko_lua.setup{
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    filetypes = { "lua", "ttslua" },
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}



local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}
