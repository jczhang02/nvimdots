local opts = {
	options = {
		always_show_bufferline = true,
		close_command = "BufDel! %d",
		right_mouse_command = "BufDel! %d",
		tab_size = 20,
		separator_style = "thin",
		show_buffer_icons = true,
		show_tab_indicators = true,
		show_buffer_close_icons = true,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count)
			return "(" .. count .. ")"
		end,
		numbers = nil,
		max_name_length = 20,
		max_prefix_length = 13,
		buffer_close_icon = "󰅖",
		left_trunc_marker = "",
		right_trunc_marker = "",
		modified_icon = "●",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				padding = 0,
			},
			{
				filetype = "trouble",
				text = "LSP Outline",
				text_align = "center",
				padding = 0,
			},
		},
	},
	highlights = {},
}

local ok, catppuccin_bufferline = pcall(require, "catppuccin.groups.integrations.bufferline")
if ok then
	opts.highlights = catppuccin_bufferline.get({
		styles = { "italic", "bold" },
		custom = {
			all = {
				hint = { fg = "#DC8A78" },
				hint_visible = { fg = "#DC8A78" },
				hint_selected = { fg = "#DC8A78" },
				hint_diagnostic = { fg = "#DC8A78" },
				hint_diagnostic_visible = { fg = "#DC8A78" },
				hint_diagnostic_selected = { fg = "#DC8A78" },
			},
		},
	})
end

require("bufferline").setup(opts)
