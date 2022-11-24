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

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- map('n', '<leader>f', ':Telescope buffers\n', opts)
-- map('n', '<leader>f',  require('telescope.builtin').fd())
-- nnoremap <Leader>f :lua require'telescope.builtin'.fd()<CR>
-- nnoremap <Leader>F :lua require'telescope.builtin'.file_browser()<CR>
-- " nnoremap <Leader>g :lua require'telescope.builtin'.git_files()<CR>
-- nnoremap <Leader>s :lua require'telescope.builtin'.live_grep()<CR>
-- nnoremap <Leader>r :lua require("telescope").extensions.live_grep_raw.live_grep_raw()<CR>
-- nnoremap <Leader>go :lua require'telescope.builtin'.live_grep({grep_open_files = true})<CR>
-- nnoremap <Leader>g :lua require'telescope.builtin'.grep_string()<CR>
-- nnoremap <Leader>; :lua require'telescope.builtin'.buffers()<CR>
-- nnoremap <Leader>1 :lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>
-- " nnoremap <Leader>; :lua require'telescope.builtin'.buffers{path_display={"shorten"}}<CR>
-- nnoremap <Leader>h :lua require'telescope.builtin'.oldfiles()<CR>
-- nnoremap <Leader>H :lua require'telescope.builtin'.help_tags()<CR>
-- nnoremap <Leader>m :lua require'telescope.builtin'.marks()<CR>
-- nnoremap <Leader>M :lua require'telescope.builtin'.man_pages()<CR>
-- nnoremap <Leader>Mt :Telescope metals commands<CR>
-- nnoremap <Leader>k :lua require'telescope.builtin'.keymaps()<CR>
-- nnoremap <Leader>vrc :lua require('ltfiend.telescope').search_dotfiles()<CR>
-- " nnoremap <C-p> :lua require'telescope.builtin'.fd()<CR>
-- " nnoremap <Leader>d :lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({}))<CR>

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

