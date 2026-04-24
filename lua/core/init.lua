require("core.globals")
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.lazy")

-- Defer LSP server configuration until after all plugins are loaded
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("configs.lsp")
	end,
})
