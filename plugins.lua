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
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "custom.configs.neotree"
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
      local codelldb = require("mason-registry").get_package "codelldb"
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      require("rust-tools").setup {
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        tools = {
          autoSetHints = true,
          inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
          },
        },
        server = {
          on_attach = require("plugins.configs.lspconfig").on_attach,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                autoReload = true,
              },
              checkOnSave = true,
            },
          },
          standalone = true,
          checkOnSave = {
            allFeatures = true,
            command = "clippy",
          },
        },
      }
      require("rust-tools").inlay_hints.enable()
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
        config = function(_, opts)
          require("plugins.configs.others").luasnip(opts)

          local luasnip = require "luasnip"

          luasnip.filetype_extend("javascriptreact", { "html" })
          require("luasnip/loaders/from_vscode").lazy_load()
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
    opts = {
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<C-c>"] = function(prompt_bufnr)
                local action_state = require "telescope.actions.state"
                local current_picker = action_state.get_current_picker(prompt_bufnr)
                current_picker:delete_selection(function(selection)
                  local bufnr = selection.bufnr
                  -- get associated window(s)
                  local winids = vim.fn.win_findbuf(bufnr)
                  -- fill winids with new empty buffers
                  for _, winid in ipairs(winids) do
                    -- check documentation of nvim_create_buf carefully about whether you want a scratch buffer or something else
                    local new_buf = vim.api.nvim_create_buf(false, true)
                    vim.api.nvim_win_set_buf(winid, new_buf)
                  end
                  -- remove buffer at last
                  vim.api.nvim_buf_delete(bufnr, { force = true })
                end)
              end,
            },
          },
        },
      },
    },
  },

  {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
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
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "astro",
      "glimmer",
      "handlebars",
      "hbs",
    },
    "windwp/nvim-ts-autotag",
    opts = {
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },
}

return plugins
