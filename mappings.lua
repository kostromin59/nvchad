---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>wa"] = "",
    ["<leader>wr"] = "",
    ["<leader>wl"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>ca"] = "",
    ["<leader>cj"] = "",
    ["<leader>ch"] = "",
    ["<leader>cm"] = "",
    ["<leader>cc"] = "",
    ["<leader>b"] = "",
    ["<leader>x"] = "",
    ["<leader>f"] = "",
    ["<leader>ma"] = "",
    ["<leader>ra"] = "",
    ["<leader>rn"] = "",
    ["<leader>n"] = "",
    ["<leader>th"] = "",
    ["<leader>h"] = "",
    ["<leader>v"] = "",
    ["<A-i>"] = "",
    ["<leader>fm"] = "",
    ["<C-s>"] = "",
    ["<leader>pt"] = "",
  },
  t = {
    ["<A-i>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["-"] = { ":Neotree float toggle<CR>", "open neotree", opts = { nowait = true } },
    ["<leader>w"] = { ":w<CR>", "Save file", opts = { nowait = true } },
    ["<leader>gc"] = {
      "<cmd> Telescope git_commits <CR>",
      "Git commits",
    },
    ["<leader>q"] = {
      ":q<CR>",
      "Quit",
      opts = { nowait = true },
    },
    ["<leader>c"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
      opts = { nowait = true },
    },
    ["<leader><space>"] = {
      "<cmd>Telescope buffers<CR>",
      "Find buffers",
      opts = { nowait = true },
    },
    ["<leader>h"] = {
      "<cmd>nohlsearch<CR>",
      "No search highlight",
      opts = { nowait = true },
    },
    ["<C-a>"] = {
      "gg<S-v>G",
      "Select all text",
      opts = { nowait = true },
    },
    ["<A-j>"] = {
      ":m .+1<CR>==",
      "Move line down",
      opts = { nowait = true },
    },
    ["<A-k>"] = {
      ":m .-2<CR>==",
      "Move line up",
      opts = { nowait = true },
    },
    ["|"] = {
      ":vsplit<CR>",
      "Split vertical",
      opts = { nowait = true },
    },
    ["\\"] = {
      ":split<CR>",
      "Split horizontal",
      opts = { nowait = true },
    },
    ["<leader>db"] = {
      ":DapToggleBreakpont<CR>",
      "Toggle breakpoint",
    },
    ["<leader>dx"] = {
      ":DapTerminate<CR>",
      "Terminate DAP",
    },
    ["<leader>do"] = {
      "DapStepOver<CR>",
      "DAP step over",
    },
    ["f"] = {
      function()
        require("hop").hint_char1 {
          direction = require("hop.hint").HintDirection.AFTER_CURSOR,
          current_line_only = false,
        }
      end,
      "Hop after cursor",
    },
    ["F"] = {
      function()
        require("hop").hint_char1 {
          direction = require("hop.hint").HintDirection.BEFORE_CURSOR,
          current_line_only = false,
        }
      end,
      "Hop before cursor",
    },
  },
  v = {
    ["<A-j>"] = {
      ":m '>+1<CR>gv-gv",
      "Move lines down",
      opts = { nowait = true },
    },
    ["<A-k>"] = {
      ":m '<-2<CR>gv-gv",
      "Move lines up",
      opts = { nowait = true },
    },
  },
}

M.lspconfig = {
  n = {
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code action",
    },
    ["<leader>lj"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current context",
    },
    ["<leader>lD"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },
}

M.nvterm = {
  n = {
    ["<F7>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
    ["<leader>th"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },
    ["<leader>tv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "New vertical term",
    },
    ["<leader>tf"] = {
      function()
        require("nvterm.terminal").new "float"
      end,
      "New float term",
    },
    ["<leader>tt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },
  },
  t = {
    ["<F7>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

return M
