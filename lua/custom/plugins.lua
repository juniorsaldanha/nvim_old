local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- disable nvim-tree for use neo-tree instead
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "3.*",
        config = function()
          require "custom.configs.window-picker"
        end,
      },
    },
    config = function()
      require "custom.configs.neo-tree"
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = function()
      return require "custom.keymaps.which-key"
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPre",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require "custom.configs.todo-comments"
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "psliwka/vim-smoothie",
    config = function()
      require "custom.configs.vim-smoothie"
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require "custom.configs.persistence"
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      require "custom.configs.git-blame"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    -- NOTE: Load the plugin settings with delay
    config = function()
      -- @diagnostic disable-next-line: param-type-mismatch
      vim.defer_fn(function()
        require "custom.configs.copilot"
        -- @diagnostic disable-next-line: param-type-mismatch
      end, 200)
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
