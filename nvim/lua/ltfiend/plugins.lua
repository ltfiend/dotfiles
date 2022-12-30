local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

    -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

--         tag='release',
  -- Plugins
  local function plugins(use)
    use { 'lewis6991/gitsigns.nvim', }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
             'nvim-telescope/telescope-live-grep-raw.nvim',
             'nvim-telescope/telescope.nvim',
             'nvim-telescope/telescope-fzy-native.nvim',
             'nvim-telescope/telescope-dap.nvim',
             'nvim-telescope/telescope-media-files.nvim'
        }
    }

    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { 'marko-cerovac/material.nvim' }
    -- use { 'luisiacc/gruvbox-baby' }
    use { "ellisonleao/gruvbox.nvim" }
    use { 'EdenEast/nightfox.nvim' }
    -- use { 'folke/tokyonight.nvim' }
    use { 'sidebar-nvim/sidebar.nvim' }

    use {
        'nvim-telescope/telescope-arecibo.nvim',
         rocks = {"openssl", "lua-http-parser"}
    }

    use { 'nvim-telescope/telescope-symbols.nvim', }
    -- use { 'xiyaowong/telescope-emoji.nvim', }
    use { 'ptethng/telescope-makefile' }

    use {
        'iamcco/markdown-preview.nvim',
        run = "cd app && npm install",
        setup =
            function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
        }

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
        end 
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use { 'nvim-treesitter/nvim-treesitter', }
    use { 'nvim-treesitter/nvim-treesitter-context' }

    -- use { "rest-nvim/rest.nvim", requires = { "nvim-lua/plenary.nvim" }}

--    use {
--        '~/Git/ietf-plugin.nvim/'
--    }

--     use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--         config = function()
--             require("lsp_lines").register_lsp_virtual_lines()
--         end,
--     })

--
--     use {
--      'sheerun/vim-polyglot'
--     }


    use { 'junegunn/fzf.vim' }
    use { 'tpope/vim-dispatch' }
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'neovim/nvim-lspconfig' }
    use { 'scalameta/nvim-metals' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'williamboman/nvim-lsp-installer' }
    use { 'mhinz/vim-startify' }

    use { 'Pocco81/dap-buddy.nvim' }
    use { 'ravenxrz/DAPInstall.nvim' }
    use { 'mfussenegger/nvim-dap',
      config = function()
         require("config.dap").setup()
      end,
    }
    use { 'mfussenegger/nvim-dap-python' }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'leoluz/nvim-dap-go' }
    use { 'jbyuki/one-small-step-for-vimkind' }

    use { 'simrat39/rust-tools.nvim' }
--     use { 'jbyuki/venn.nvim' }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
	    }
      end
    }

    use { 'renerocksai/calendar-vim' }
    use { 'nvim-telescope/telescope-media-files.nvim' }
    -- use { 'renerocksai/telekasten.nvim' }
    use { '~/Git/telekasten.nvim' }

    use {
        "kode-team/mastodon.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
          "rcarriga/nvim-notify",
          "kkharji/sqlite.lua",
        },
        config = function()
        require("mastodon").setup()
    end
    }

--     use {
--       "mfussenegger/nvim-dap",
--       opt = true,
--       event = "BufReadPre",
--       module = { "dap" },
--       config = function()
--         require("config.dap").setup()
--       end,
--       wants = {
--           "nvim-dap-virtual-text",
--           "DAPInstall.nvim",
--           "nvim-dap-ui",
--           "nvim-dap-python"
--       }, -- , "which-key.nvim" },
--       requires = {
--         "theHamsta/nvim-dap-virtual-text",
--         "rcarriga/nvim-dap-ui",
--         "mfussenegger/nvim-dap-python",
--         "nvim-telescope/telescope-dap.nvim",
--         { "leoluz/nvim-dap-go", module = "dap-go" },
--         { "jbyuki/one-small-step-for-vimkind", module = "osv" },
--       },
--       config = function()
--         require("config.dap").setup()
--       end,
--     }

--     use {
--       'jedrzejboczar/possession.nvim',
--       requires = { 'nvim-lua/plenary.nvim' },
--       config = function()
--         require("config.possession").setup()
--       end,
--     }

    -- Bootstrap Neovim
    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
