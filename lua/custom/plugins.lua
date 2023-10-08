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

  -- NOTE: disabling nvim-tree for use neo-tree instead
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    opts = overrides.nvimtree,
  },

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
      local opts = require "custom.keymaps.which-key"
      return opts
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

  -- TODO:Add keymap for it F9 and add on which-key menu <leader> something
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "psliwka/vim-smoothie",
    event = "BufReadPre",
    config = function()
      require "custom.configs.vim-smoothie"
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.noice"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require "custom.configs.bufferline"
    end,
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
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings "gopher"
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
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
}

return plugins
