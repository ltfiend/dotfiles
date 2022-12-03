-- local sumneko_binary = '/home/peter/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server'
local sumneko_root_path = '/home/peter/.local/share/nvim/lsp_servers/sumneko_lua/extension/server'
local sumneko_binary    = '/home/peter/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server'

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>vd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>vi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>vsh', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>vh', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, bufopts)
-- vim.keymap.set('n', '<leader>vll' LspLocationList, bufopts)
    vim.keymap.set('n', '<C-p>', vim.lsp.buf.hover, bufopts)


--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--     vim.keymap.set('n', '<space>wl', function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, bufopts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--     vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--     vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

require("nvim-lsp-installer").setup {}

-- require'lspconfig'.grammarly.setup{ on_attach = on_attach }
require 'lspconfig'.bashls.setup { on_attach = on_attach }
require 'lspconfig'.perlnavigator.setup { on_attach = on_attach }
require 'lspconfig'.html.setup { on_attach = on_attach }
require 'lspconfig'.awk_ls.setup { on_attach = on_attach }
require 'lspconfig'.tsserver.setup { on_attach = on_attach }
require 'lspconfig'.angularls.setup { on_attach = on_attach }

require 'lspconfig'.dockerls.setup {
    on_attach = on_attach,
    cmd = { '/home/peter/.local/share/nvim/lsp_servers/dockerfile/node_modules/dockerfile-language-server-nodejs/bin/docker-langserver --stdio' },
}

require 'lspconfig'.pyright.setup {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require 'lspconfig'.pylsp.setup {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- require 'lspconfig'.sourcery.setup {
--     on_attach = on_attach,
--     capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }
-- 
-- require 'lspconfig'.jedi_language_server.setup {
--     on_attach = on_attach,
--     capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }

require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require 'lspconfig'.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require 'lspconfig'.bashls.setup {
    -- cmd = { '/home/peter/.local/share/nvim/lsp_servers/bash/node_modules/.bin/bash-language-server' },
    on_attach = on_attach,
    cmd = { '/snap/bin/bash-language-server' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require 'lspconfig'.marksman.setup {
    on_attach = on_attach,
    -- cmd = { '.local/share/nvim/lsp_servers/marksman/marksman' },
    -- filetypes = { 'md' },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
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
                globals = { 'vim' },
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
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
