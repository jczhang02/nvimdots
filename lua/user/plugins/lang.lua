local lang = {}

lang["lervag/vimtex"] = {
	lazy = true,
	ft = { "tex", "bib" },
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
	lazy = true,
	ft = { "qmake" },
}

lang["junegunn/fzf"] = {
	build = "./install --all",
}

return lang
