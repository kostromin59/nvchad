local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "rust_analyzer",
  "taplo",
  "tailwindcss",
  "emmet_language_server",
  "emmet_ls",
  "prismals",
  "gopls",
}

local on_attach = function(client, bufnr)
  require("plugins.configs.lspconfig").on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
      ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
      }),
    },
  }
end

vim.diagnostic.config {
  update_in_insert = true,
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
