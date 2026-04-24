local settings = require("core.settings")

vim.api.nvim_set_option_value(
	"indentexpr",
	"v:lua.require'nvim-treesitter'.indentexpr()",
	{}
)

require("nvim-treesitter").install(settings.treesitter_deps)

require("nvim-treesitter").setup({
	highlight = { enable = true },
	indent = { enable = true },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
})
