local M = {}

M.filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

M.jsx_brackets = true
M.remove_template_string = true
M.restore_quotes = {
	normal = [["]],
	jsx = [["]],
}

return M
