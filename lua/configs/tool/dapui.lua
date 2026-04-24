require("dapui").setup({
	force_buffers = true,
	icons = {
		expanded = "",
		collapsed = "",
		current_frame = "",
	},
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.3 },
				{ id = "watches", size = 0.3 },
				{ id = "stacks", size = 0.3 },
				{ id = "breakpoints", size = 0.1 },
			},
			size = 0.3,
			position = "right",
		},
		{
			elements = {
				{ id = "console", size = 0.55 },
				{ id = "repl", size = 0.45 },
			},
			position = "bottom",
			size = 0.25,
		},
	},
	controls = {
		enabled = true,
		element = "repl",
	},
	floating = {
		border = "single",
		mappings = { close = { "q", "<Esc>" } },
	},
	render = { indent = 1, max_value_lines = 85 },
})
