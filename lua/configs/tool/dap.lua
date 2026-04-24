local dap = require("dap")
local dapui = require("dapui")

-- Auto open/close dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open({ reset = true })
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Signs
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })

-- Python adapter (system debugpy)
dap.adapters.python = function(callback, config)
	if config.request == "attach" then
		local port = (config.connect or config).port
		local host = (config.connect or config).host or "127.0.0.1"
		callback({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = { source_filetype = "python" },
		})
	else
		callback({
			type = "executable",
			command = vim.fn.exepath("python3"),
			args = { "-m", "debugpy.adapter" },
			options = { source_filetype = "python" },
		})
	end
end

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Debug",
		console = "integratedTerminal",
		program = "${file}",
		pythonPath = function()
			local venv = vim.env.CONDA_PREFIX or vim.env.VIRTUAL_ENV
			if venv then
				local p = venv .. "/bin/python"
				if vim.fn.executable(p) == 1 then
					return p
				end
			end
			local cwd = vim.uv.cwd()
			for _, v in ipairs({ cwd .. "/venv", cwd .. "/.venv" }) do
				local p = v .. "/bin/python"
				if vim.fn.executable(p) == 1 then
					return p
				end
			end
			return "python3"
		end,
	},
}

-- codelldb adapter for C/C++/Rust
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.exepath("codelldb"),
		args = { "--port", "${port}" },
		detached = true,
	},
}

dap.configurations.c = {
	{
		name = "Debug",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		terminal = "integrated",
	},
	{
		name = "Debug (with args)",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = function()
			local args = vim.fn.input("Arguments: ")
			return vim.split(args, " ", { trimempty = true })
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		terminal = "integrated",
	},
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
