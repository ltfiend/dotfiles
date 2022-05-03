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

  -- Plugins
  local function plugins(use)
    use {
        'lewis6991/gitsigns.nvim',
        tag='release',
        config = function()
            require('gitsigns').setup()
        end
    }
        -- Converting from init.vim - 20220403
    --
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
             'nvim-telescope/telescope-dap.nvim'
        }
    }
--     
--     use {
--      'sheerun/vim-polyglot'
--     }
--     
--     use {
--      'junegunn/fzf'
--     }
--     
--     use {
--      'stsewd/fzf-checkout.vim'
--     }
--     
--     use {
--      'tpope/vim-dispatch'
--     }
--     
--     use {
--      'nvim-lua/popup.nvim'
--     }
--     
--     use {
--      'nvim-lua/plenary.nvim'
--     }
--     
--     use {
--      'nvim-telescope/telescope.nvim',
--      requires = { 'nvim-lua/plenary.nvim' }
--     }
--     
--     use {
--      'nvim-telescope/telescope-fzy-native.nvim'
--     }
--     
--     use {
--      'nvim-telescope/telescope-dap.nvim'
--     }
--     
--     use {
--      'kyazdani42/nvim-web-devicons'
--     }
--     
--     use {
--      'neovim/nvim-lspconfig'
--     }
--     
--     use {
--      'scalameta/nvim-metals'
--     }
--     
--     use {
--      'hrsh7th/cmp-nvim-lsp'
--     }
--     
--     use {
--      'hrsh7th/cmp-buffer'
--     }
--     
--     use {
--      'hrsh7th/nvim-cmp'
--     }
--     
--     use {
--      'L3MON4D3/LuaSnip'
--     }
--     
--     use {
--      'saadparwaiz1/cmp_luasnip'
--     }
--     
--     use {
--      'williamboman/nvim-lsp-installer'
--     }
--     
--     use {
--      'jbyuki/venn.nvim'
--     }
--     
--     use {
--      'scrooloose/nerdtree'
--     }
--     
--     use {
--      'mhinz/vim-startify'
--     }
--     
--     use {
--      'rrethy/vim-hexokinase', 
--      run = 'make hexokinase'
--     }
--     
--     use {
--      'gruvbox-community/gruvbox' 
--     }
--     
--     use {
--      'theniceboy/vim-calc'
--     }
--     
--     use {
--      'mfussenegger/nvim-dap'
--     }
--     
--     use {
--      'mfussenegger/nvim-dap-python'
--     }
--     
--     use {
--      'Pocco81/DAPInstall.nvim'
--     }
--     
--     use {
--      'theHamsta/nvim-dap-virtual-text'
--     }
--     
--     use {
--      'rcarriga/nvim-dap-ui'
--     }
--     
--     use {
--      'nvim-telescope/telescope-dap.nvim'
--     }
--     
--     use {
--      'leoluz/nvim-dap-go'
--     }
--     
--     use {
--      'jbyuki/one-small-step-for-vimkind'
--     }
------
    -- Debugging
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    use {
      "mfussenegger/nvim-dap",
      opt = true,
      event = "BufReadPre",
      module = { "dap" },
      wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
      requires = {
        "Pocco81/DAPInstall.nvim",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        "nvim-telescope/telescope-dap.nvim",
        { "leoluz/nvim-dap-go", module = "dap-go" },
        { "jbyuki/one-small-step-for-vimkind", module = "osv" },
      },
      config = function()
        require("config.dap").setup()
      end,
    }
    
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
