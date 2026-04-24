require("lsp_signature").setup({
	bind = true,
	check_completion_visible = false,
	floating_window = true,
	floating_window_above_cur_line = true,
	hi_parameter = "Search",
	hint_enable = true,
	transparency = nil,
	wrap = true,
	zindex = 45,
	handler_opts = { border = "single" },
})
