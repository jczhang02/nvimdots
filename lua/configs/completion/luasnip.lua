local ls = require("luasnip")
ls.config.setup({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	region_check_events = "CursorMoved",
	delete_check_events = "TextChanged",
})
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").lazy_load({
	paths = { vim.fn.stdpath("config") .. "/luasnippets" },
})
require("luasnip.loaders.from_snipmate").lazy_load({
	paths = { vim.fn.stdpath("config") .. "/snips" },
})
