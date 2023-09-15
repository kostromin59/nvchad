local M = {}

local cmp = require "cmp"
local types = require "cmp.types"
M.cmp = {
  window = {
    documentation = {
      border = "rounded",
      winhighlight = "NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder",
    },
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.menu = nil
      return vim_item
    end,
  },
  completion = {
    completeopt = "menu,menuone,noselect",
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
  },
  sources = {
    {
      name = "nvim_lsp",
      entry_filter = function(entry, _)
        local kind = types.lsp.CompletionItemKind[entry:get_kind()]

        if kind == "Text" then
          return false
        end
        return true
      end,
    },
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "rust",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettierd",
    "eslint-lsp",
    "eslint_d",
    "rustywind",
    "tailwindcss-language-server",

    -- Rust stuff
    "codelldb",
    "taplo",
    "rust-analyzer",
  },
  autotag = {
    enable = true,
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-c>"] = function(prompt_bufnr)
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
}

return M
