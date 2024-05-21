local M = {}

M.lsp_fallback = true

M.formatters_by_ft = {
	lua = { "stylua" },
	javascript = { "eslint_d", "eslint" },
	typescript = { "eslint_d", "eslint" },
	javascriptreact = { "eslint_d", "eslint", "rustywind" },
	typescriptreact = { "eslint_d", "eslint", "rustywind" },
	go = { "gofumpt", "golines", "goimports" },
	css = { "prettierd" },
	html = { "prettierd", "rustywind" },
	json = { "prettierd" },
}

return M
