local fn = vim.fn

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

local function tab(fallback)
    local luasnip = require "luasnip"
    if fn.pumvisible() == 1 then
        fn.feedkeys(t "<C-n>", "n")
    elseif luasnip.expand_or_jumpable() then
        fn.feedkeys(t "<Plug>luasnip-expand-or-jump", "")
    elseif check_back_space() then
        fn.feedkeys(t "<tab>", "n")
    else
        fallback()
    end
end

local function shift_tab(fallback)
    local luasnip = require "luasnip"
    if fn.pumvisible() == 1 then
        fn.feedkeys(t "<C-p>", "n")
    elseif luasnip.jumpable(-1) then
        fn.feedkeys(t "<Plug>luasnip-jump-prev", "")
    else
        fallback()
    end
end

local cmp = require "cmp"

cmp.setup {
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(tab, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(shift_tab, { "i", "s" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
    },
    sources = {
      -- For luasnip user.
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
    },
}

--   -- Setup nvim-cmp.
--   local cmp = require'cmp'
-- 
--   cmp.setup({
--     snippet = {
--       expand = function(args)
--         -- For `vsnip` user.
--         -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
-- 
--         -- For `luasnip` user.
--         require('luasnip').lsp_expand(args.body)
-- 
--         -- For `ultisnips` user.
--         -- vim.fn["UltiSnips#Anon"](args.body)
--       end,
--     },
--     mapping = {
--       ['<Tab>'] = cmp.mapping(tab, {'i', 's'}),
--       ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.close(),
--       ['<CR>'] = cmp.mapping.confirm({ select = true }),
--     },
--     sources = {
--       { name = 'nvim_lsp' },
--       -- For luasnip user.
--       { name = 'luasnip' },
--       { name = 'buffer' },
--     }
--   })
--   -->
