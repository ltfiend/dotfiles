local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local action_layout = require("telescope.actions.layout")
local conf = require("telescope.config").values
local actions = require("telescope.actions")


require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' 🔍 ',
        color_devicons = true,
        disable_devicons = false,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            n = {
                ['<M-p>'] = action_layout.toggle_preview,
            },
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
                ["<esc>"] = actions.close,
                ['<M-p>'] = action_layout.toggle_preview,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        arecibo = {
            ["selected_engine"]   = 'google',
            ["url_open_command"]  = 'xdg-open',
            ["show_http_headers"] = false,
            ["show_domain_icons"] = false,
        }    
    }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('arecibo')

-- This was a config found in github, it has some interesting sections for later.
-- lua << EOF
-- require('telescope').setup{
--   defaults = {
--     vimgrep_arguments = {
--       'rg',
--       '--color=never',
--       '--no-heading',
--       '--with-filename',
--       '--line-number',
--       '--column',
--       '--smart-case'
--     },
--     prompt_prefix = "> ",
--     selection_caret = "> ",
--     entry_prefix = "  ",
--     initial_mode = "insert",
--     selection_strategy = "reset",
--     sorting_strategy = "descending",
--     layout_strategy = "horizontal",
--     layout_config = {
--       horizontal = {
--         mirror = false,
--       },
--       vertical = {
--         mirror = false,
--       },
--     },
--     file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--     file_ignore_patterns = {},
--     generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--     shorten_path = true,
--     winblend = 0,
--     border = {},
--     borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
--     color_devicons = false,
--     disable_devicons = true,
--     use_less = true,
--     set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
--     file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--     grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--     qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
-- 
--     -- Developer configurations: Not meant for general override
--     buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
--   }
-- }
-- 
-- EOF
