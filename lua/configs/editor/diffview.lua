require("diffview").setup({
	diff_binaries = false,
	enhanced_diff_hl = false,
	use_icons = true,
	show_help_hints = true,
	watch_index = true,
	git_cmd = { "git" },
	hg_cmd = { "hg" },
	view = {
		default = {
			layout = "diff2_horizontal",
			disable_diagnostics = true,
			winbar_info = false,
		},
		merge_tool = {
			layout = "diff3_horizontal",
			disable_diagnostics = true,
			winbar_info = true,
		},
		file_history = {
			layout = "diff2_horizontal",
			disable_diagnostics = true,
			winbar_info = false,
		},
	},
})
