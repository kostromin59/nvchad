require("nvchad.mappings")

local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "-", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })

map("n", "<C-a>", "gg0vG$", { desc = "Select all" })
map("i", "<C-a>", "<Esc>gg0vG$", { desc = "Select all" })

map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Lsp floating diagnostics" })
map("n", "<C-t>", "<cmd>TroubleToggle workspace_diagnostics<cr>", { desc = "Trouble" })

map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical split" })

map("n", "<A-j>", "<cmd>m .+1<cr>==")
map("n", "<A-k>", "<cmd>m .-2<cr>==")

map("i", "<A-j>", "<Esc><cmd>m .+1<cr>==gi")
map("i", "<A-k>", "<Esc><cmd>m .-2<cr>==gi")

map("v", "<A-j>", ":m'>+<cr>gv=`<my`>mzgv`yo`z")
map("v", "<A-k>", ":m'<-2<cr>gv=`>my`<mzgv`yo`z")

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
map("i", "jj", "<ESC>", { desc = "Escape insert mode" })

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "<", "<<", { silent = true })
vim.keymap.set("n", ">", ">>", { silent = true })
vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("v", "p", '"_dP', { silent = true })
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

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
