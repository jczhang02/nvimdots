require("which-key").setup({
	preset = "modern",
	delay = vim.o.timeoutlen,
	triggers = {
		{ "<auto>", mode = "nixso" },
	},
	plugins = {
		marks = true,
		registers = true,
		spelling = { enabled = true, suggestions = 20 },
		presets = {
			motions = false,
			operators = false,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	win = {
		border = "none",
		padding = { 1, 2 },
		wo = { winblend = 0 },
	},
	expand = 1,
	icons = {
		group = "",
		rules = false,
		colors = false,
	},
	spec = {
		{ "<leader>b", group = "Buffer" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>l", group = "LSP" },
		{ "<leader>d", group = "Debug" },
		{ "<leader>t", group = "Toggle/Tab" },
		{ "<leader>c", group = "Code" },
		{ "<leader>h", group = "Harpoon" },
		{ "<leader>x", group = "Diagnostics" },
		{ "<leader>s", group = "Search" },
	},
})
