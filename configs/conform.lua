--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d", "rustywind" },
    typescriptreact = { "eslint_d", "rustywind" },
    go = { "gofumpt", "golines", "goimports" },
    css = { "prettierd" },
    html = { "rustywind" },

    sh = { "shfmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
