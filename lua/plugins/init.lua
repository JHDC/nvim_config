return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    cmd = {
      "SessionSave",
      "SessionRestore",
      "SessionDelete",
      "Autosession"
    },
    config = function()
      local function restore_nvim_tree()
        local nvim_tree_api = require('nvim-tree.api')
        nvim_tree_api.tree.open()
        nvim_tree_api.tree.change_root(vim.fn.getcwd())
        nvim_tree_api.tree.reload()
      end
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        post_restore_cmds = { restore_nvim_tree }
      }
    end
  },

  {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    cmd = {
      "EnableWhitespace",
      "DisableWhitespace",
      "ToggleWhitespace",
      "StripWhitespace"
    }
  },

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup {
        git = {
          ignore = false,
        }
      }
    end
  }

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
