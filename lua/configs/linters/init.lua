local lint = require("lint")
lint.linters_by_ft = {
	vim = { "vint" },
	sh = { "shellcheck" },
	bash = { "shellcheck" },
	zsh = { "shellcheck" },
}
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("UserLint", { clear = true }),
	callback = function()
		lint.try_lint()
	end,
})
