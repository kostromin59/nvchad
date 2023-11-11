local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local b = null_ls.builtins

local sources = {

  -- Webdev stuff
  b.formatting.prettierd.with {
    condition = function(utils)
      return utils.root_has_file {
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
        "prettier.config.js",
        ".prettierrc.mjs",
        ".prettierrc.cjs",
        "prettier.config.mjs",
        "prettier.config.cjs",
        ".prettierrc.toml",
      }
    end,
  },
  b.formatting.eslint_d,
  b.diagnostics.eslint_d.with {
    condition = function(utils)
      return utils.root_has_file { ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" }
    end,
  },
  b.code_actions.eslint_d,
  b.formatting.rustywind,

 -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Rust
  b.formatting.rustfmt,
  b.formatting.taplo,

  -- Go
  b.formatting.gofumpt,
  b.formatting.goimports,
  b.formatting.golines,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, async = true }
        end,
      })
    end
  end,
}
