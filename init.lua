-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
vim.opt.scrolloff = 6
vim.opt.pumheight = 10
vim.opt.pumblend = 0
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"
