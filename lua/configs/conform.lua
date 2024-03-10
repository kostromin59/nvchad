local M = {}

M.lsp_fallback = true

M.formatters_by_ft = {
	lua = { "stylua" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d", "rustywind" },
	typescriptreact = { "eslint_d", "rustywind" },
	go = { "gofumpt", "golines", "goimports" },
	css = { "prettierd" },
	html = { "rustywind" },
}

return M
