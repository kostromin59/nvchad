local M = {}

M.dap_ui = function()
	local dap, dapui = require("dap"), require("dapui")
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

local map = function(keymap, action, desc)
	vim.keymap.set("n", keymap, action, { desc = desc })
end

M.load_mappings = function()
	map("<leader>db", "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint at line")
	map("<leader>dr", "<cmd>DapContinue<cr>", "Start or continue the debugger")
end

return M
