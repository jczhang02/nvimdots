require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
	filetypes = {
		markdown = true,
		gitcommit = true,
		yaml = true,
		["*"] = true,
	},
})
