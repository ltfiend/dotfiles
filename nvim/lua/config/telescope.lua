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
        },
        media_files = {
            filetypes = {"png", "jpg", "jpeg"},
            find_cmd = 'rg',
            -- media_previewer = "catimg-previewer"
        }
    }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('arecibo')
require('telescope').load_extension('dap')
require('telescope').load_extension('media_files')
-- require('telescope').load_extension('emoji')
