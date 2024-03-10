local opts = {}

opts.ensure_installed = require("languages").mason_lspconfig
opts.automatic_installation = false

require("mason-lspconfig").setup(opts)

local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local capabilities = configs.capabilities
local on_init = configs.on_init

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
	function(server_name)
		-- Default server configuration
		lspconfig[server_name].setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
			on_init = on_init,
		})
	end,
	-- Lua
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			on_init = on_init,

			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})
	end,
})
