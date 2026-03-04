local lang = {}

lang["lervag/vimtex"] = {
	lazy = false,
	config = require("configs.lang.vimtex"),
}

lang["microsoft/python-type-stubs"] = {
	lazy = true,
}

lang["gentoo/gentoo-syntax"] = {
	lazy = true,
	ft = { "ebuild" },
}

lang["artoj/qmake-syntax-vim"] = {
	ft = { "qmake" },
}

lang["junegunn/fzf"] = {
	build = "./install --all",
}

return lang
