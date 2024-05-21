local configs = require("nvchad.configs.lspconfig")
local conf = require("nvconfig").ui.lsp

local map = vim.keymap.set

local custom_on_attach = function(client, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts("Lsp Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Lsp Go to definition"))
	map("n", "gi", vim.lsp.buf.implementation, opts("Lsp Go to implementation"))
	map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Lsp Show signature help"))

	map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Lsp Go to type definition"))

	map("n", "<leader>lr", vim.lsp.buf.rename, opts("Lsp rename"))

	map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts("Lsp Code action"))
	map("n", "gr", vim.lsp.buf.references, opts("Lsp Show references"))

	if conf.signature and client.server_capabilities.signatureHelpProvider then
		require("nvchad.lsp.signature").setup(client, bufnr)
	end
end

configs.on_attach = custom_on_attach

return configs
