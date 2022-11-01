local M = {}

local whichkey = require "which-key"

-- local function keymap(lhs, rhs, desc)
--   vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
-- end

function M.setup()
  local keymap = {
    d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    },
  }


-- " lua require("ltfiend")
-- 
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

  whichkey.register(keymap, {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })

  local keymap_v = {
    name = "Debug",
    e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
  }
  whichkey.register(keymap_v, {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  })
end

return M
