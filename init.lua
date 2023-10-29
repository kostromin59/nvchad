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

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
  end,
})

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.wrap = false
vim.g.indent_blankline_show_current_context = false
