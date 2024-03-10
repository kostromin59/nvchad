require("nvchad.mappings")

local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "-", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "jj", "<ESC>", { desc = "Escape insert mode" })

map({ "n", "t" }, "<F7>", function()
	require("nvchad.term").toggle({
		pos = "float",
		id = "floatTerm",
		float_opts = {
			row = 0.1,
			col = 0.1,
			width = 0.8,
			height = 0.7,
			border = "rounded",
		},
	})
end, { desc = "Terminal Toggle Floating term" })

-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<leader>wk")
nomap("n", "<leader>wK")

nomap("n", "<leader>b")
nomap("n", "<leader>e")
nomap("n", "<leader>n")

nomap("n", "<leader>th")

nomap("n", "<C-n>")

nomap("n", "<A-i>")
