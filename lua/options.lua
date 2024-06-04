require("nvchad.options")

vim.diagnostic.config({
	update_in_insert = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
	},
	update_in_insert = true,
})

vim.opt.pumheight = 10
vim.opt.wrap = false
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"

local function open_nvim_tree()
	require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
