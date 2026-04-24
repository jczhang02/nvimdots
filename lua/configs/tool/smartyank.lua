require("smartyank").setup({
	highlight = { enabled = false },
	clipboard = { enabled = true },
	tmux = {
		enabled = true,
		cmd = { "tmux", "set-buffer", "-w" },
	},
	osc52 = {
		enabled = true,
		ssh_only = true,
		silent = true,
	},
	validate_yank = false,
})
