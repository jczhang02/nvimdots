require("render-markdown").setup({
	enabled = true,
	max_file_size = 2.0,
	debounce = 100,
	render_modes = { "n", "c", "t" },
	anti_conceal = { enabled = true },
	log_level = "error",
})
