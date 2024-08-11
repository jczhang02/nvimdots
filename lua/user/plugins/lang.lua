local lang = {}

lang["lervag/vimtex"] = {
	lazy = false,
	config = require("configs.lang.vimtex"),
}

lang["MortenStabenau/matlab-vim"] = {
	lazy = true,
	ft = "matlab",
	config = require("configs.lang.matlab"),
}

lang["microsoft/python-type-stubs"] = {
	lazy = true,
}

lang["gentoo/gentoo-syntax"] = {
	lazy = true,
	ft = { "ebuild" },
}

lang["benlubas/molten-nvim"] = {
	version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	build = ":UpdateRemotePlugins",
	init = function()
		-- this is an example, not a default. Please see the readme for more configuration options
		vim.g.molten_output_win_max_height = 12
	end,
}

return lang
