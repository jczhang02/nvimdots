local notify = require("notify")

notify.setup({
	stages = "fade",
	render = "default",
	fps = 20,
	timeout = 2500,
	minimum_width = 50,
	max_width = 80,
	background_colour = "NotifyBackground",
	icons = {
		ERROR = " ",
		WARN = " ",
		INFO = " ",
		DEBUG = " ",
		TRACE = "✎",
	},
	on_open = function(win)
		vim.api.nvim_set_option_value("winblend", 0, { scope = "local", win = win })
		vim.api.nvim_win_set_config(win, { zindex = 90 })
	end,
	level = "INFO",
})

vim.notify = notify
