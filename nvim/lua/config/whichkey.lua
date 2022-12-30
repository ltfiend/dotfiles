local M = {}

local whichkey = require("which-key")

local conf = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = false, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      -- add operators that will trigger motion and text object completion
      -- to enable all native operators, set the preset / operators plugin above
      operators = { gc = "Comments" },
      key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
      },
      window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "+", "="}, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      show_keys = true, -- show the currently pressed key and its label as a message in the command line
      triggers = "auto", -- automatically setup triggers
      -- triggers = {"<leader>"}, -- or specify a list manually
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
      },
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by default for Telescope
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
}

whichkey.setup(conf)

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local v_opts = {
  mode = "v", -- Visual mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local function normal_keymap()
  local keymap_f = nil -- File search
  local keymap_p = nil -- Project search

  keymap_f = {
    name = "Telescope",
    f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
    d = { "<cmd>lua require('utils.finder').find_dotfiles()<cr>", "Dotfiles" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    r = { "<cmd>Telescope file_browser<cr>", "Browser" },
    s = { "<cmd>Telescope spell_suggest<cr>", "Spelling" },
    m = { "<cmd>Telescope media_files<cr>", "Media" },
    y = { "<cmd>Telescope symbols<cr>", "Symbols" },
    w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    G = {
        name = "Git",
        s = { "<cmd>Telescope git_status<cr>", "Git Status" },
        f = { "<cmd>Telescope git_files<cr>", "Git Files" },
        h = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
        c = { "<cmd>Telescope git_commits_<cr>", "Git Commits" },
        b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
    },
  }

  keymap_p = {
    name = "Project",
    p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List" },
    s = { "<cmd>Telescope repo list<cr>", "Search" },
  }

  local keymap = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["t"] = { "<cmd>ToggleTerm<CR>", "Terminal" },

    b = {
      name = "Buffer",
      c = { "<Cmd>BDelete this<Cr>", "Close Buffer" },
      f = { "<Cmd>BDelete! this<Cr>", "Force Close Buffer" },
      D = { "<Cmd>BWipeout other<Cr>", "Delete All Buffers" },
    },

    c = {
      name = "Code",
      g = { "<cmd>Neogen func<Cr>", "Generate Func Doc" },
      G = { "<cmd>Neogen class<Cr>", "Generate Class Doc" },
      x = "Swap Next Parameter",
      X = "Swap Prev Parameter",
      f = "Select Outer Function",
      F = "Select Outer Class",
    },

    d = {
      name = "Debug",
    },

    a = keymap_f,
    p = keymap_p,

    z = {
      name = "System",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
      x = { "<cmd>cd %:p:h<cr>", "Change Directory" },
    },

    g = {
      name = "Git",
      s = { "<cmd>Neogit<CR>", "Status" },
      y = {
        "<cmd>lua require'gitlinker'.get_buf_range_url('n', {action_callback = require'gitlinker.actions'.open_in_browser})<cr>",
        "Link",
      },
      c = { "<cmd>lua require'telescope.builtin'.git_commits()<cr>", "Commits" },
      l = { "<cmd>lua require'telescope.builtin'.git_bcommits()<cr>", "Commits" },
      b = { "<cmd>lua require'telescope.builtin'.git_branches()<cr>", "Branches" },
      S = { "<cmd>lua require'telescope.builtin'.git_stash()<cr>", "Stash" },
    },
  }
  whichkey.register(keymap, opts)
end

local function visual_keymap()
  local keymap = {
    g = {
      name = "Git",
      y = {
        "<cmd>lua require'gitlinker'.get_buf_range_url('v', {action_callback = require'gitlinker.actions'.open_in_browser})<cr>",
        "Link",
      },
    },
  }

  whichkey.register(keymap, v_opts)
end

normal_keymap()
visual_keymap()

return M
