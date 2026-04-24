require("which-key").setup({
	preset = "modern",
	delay = 400,
	win = {
		border = "rounded",
		padding = { 1, 2 },
	},
	icons = {
		mappings = false,
	},
	spec = {
		{ "<leader>f", group = "find" },
		{ "<leader>g", group = "git" },
		{ "<leader>l", group = "lsp" },
		{ "<leader>t", group = "toggle/terminal" },
		{ "<leader>b", group = "buffer" },
		{ "<leader>w", group = "window" },
		{ "<leader>x", group = "diagnostics" },
		{ "<leader>s", group = "session" },
	},
})
