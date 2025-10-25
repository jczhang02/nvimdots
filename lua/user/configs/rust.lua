return function()
	vim.g.rustaceanvim = {
		tools = {
			executor = require("rustaceanvim.executors").toggleterm,
		},
	}
end
