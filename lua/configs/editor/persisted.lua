require("persisted").setup({
	save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
	autostart = true,
	autoload = false,
	follow_cwd = true,
	use_git_branch = true,
	should_save = function()
		return vim.bo.filetype ~= "alpha"
	end,
})
