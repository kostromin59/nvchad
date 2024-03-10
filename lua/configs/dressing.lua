local M = {}

M.input = {
	get_config = function()
		if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
			return { enabled = false }
		end
	end,
}

return M
