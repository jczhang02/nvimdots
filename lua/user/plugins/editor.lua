local editor = {}

editor["danymat/neogen"] = {
	lazy = true,
	cmd = { "Neogen" },
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = require("configs.editor.neogen"),
}

editor["kevinhwang91/nvim-hlslens"] = {
	lazy = true,
	event = "SearchWrapped",
	config = require("configs.editor.nvim-hlslens"),
}

editor["kylechui/nvim-surround"] = {
	lazy = true,
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "InsertEnter",
	config = require("configs.editor.nvim-surround"),
}

editor["nvim-treesitter/nvim-treesitter"] = {
	commit = "4fc09bee78e91bf4ba471cdab4bf9dfa37fde51c",
}

-- editor["hiphish/rainbow-delimiters.nvim"] = {
-- 	submodules = false,
-- }

return editor
