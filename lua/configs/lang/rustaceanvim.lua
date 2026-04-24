vim.g.rustaceanvim = {
	dap = {
		adapter = false,
		configuration = false,
		autoload_configurations = false,
	},
	tools = {
		executor = require("rustaceanvim.executors").toggleterm,
		reload_workspace_from_cargo_toml = true,
	},
	server = { standalone = true },
}
