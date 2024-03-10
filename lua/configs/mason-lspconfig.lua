local opts = {}

opts.ensure_installed = require("languages").mason_lspconfig
opts.automatic_installation = true

require("mason-lspconfig").setup(opts)

local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		})
	end,
})
