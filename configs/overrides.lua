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
    "deno",
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

return M
