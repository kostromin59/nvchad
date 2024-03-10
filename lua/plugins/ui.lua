return {
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		opts = {},
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
	},

	{
		"stevearc/dressing.nvim",
		lazy = false,
		opts = require("configs.dressing"),
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = false,
	},
}
