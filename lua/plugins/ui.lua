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

	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle", "TodoTrouble" },
		opts = require("configs.trouble"),
	},

	{
		"mistricky/codesnap.nvim",
		build = "make",
		cmd = { "CodeSnap" },
		opts = {},
	},
}
