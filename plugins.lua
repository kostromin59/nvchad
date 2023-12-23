local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

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

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    -- enabled = false,
  },

  {
    "antosha417/nvim-lsp-file-operations",
    lazy = false,
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    "NvChad/nvterm",
    config = function()
      require "custom.configs.nvterm"
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    config = function()
      require("custom.configs.rust-tools").setup()
    end,
  },

  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        after = "nvim-cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)
          require("luasnip.loaders.from_vscode").load {}
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescriptreact", "javascriptreact" } },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = false,
    },
  },

  {
    "axelvc/template-string.nvim",
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    opts = {
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
      jsx_brackets = true,
      remove_template_string = true,
      restore_quotes = {
        normal = [["]],
        jsx = [["]],
      },
    },
  },

  { "phaazon/hop.nvim", opts = {} },

  {
    "windwp/nvim-ts-autotag",
    ft = require("custom.configs.nvim-ts-autotag").ft,
    opts = require("custom.configs.nvim-ts-autotag").opts,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("custom.configs.todo-comments").setup()
    end,
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = false,
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            },
          },
        },
      }

      require("telescope").load_extension "ui-select"
    end,
  },
}

return plugins
