return {
	{
		"axelvc/template-string.nvim",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		opts = require("configs.template-string"),
	},

	{
		"windwp/nvim-ts-autotag",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact", "html" },
		opts = {},
	},
}
