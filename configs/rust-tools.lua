local M = {}

M.setup = function()
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
end

return M
