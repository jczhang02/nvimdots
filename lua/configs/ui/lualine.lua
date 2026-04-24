local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function has_git()
	local gitdir = vim.fs.find(".git", {
		limit = 1,
		upward = true,
		type = "directory",
		path = vim.fn.expand("%:p:h"),
	})
	return #gitdir > 0
end

local function has_enough_room()
	return vim.o.columns > 100
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		disabled_filetypes = { statusline = { "alpha" } },
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"branch",
				icon = "",
				cond = has_git,
			},
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
				source = diff_source,
				cond = has_git,
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
				symbols = { modified = " [+]", readonly = " [RO]", unnamed = "[No Name]" },
			},
		},
		lualine_x = {
			{
				"filetype",
				colored = true,
				icon_only = false,
				cond = has_enough_room,
			},
			{ "progress", cond = has_enough_room },
		},
		lualine_y = {},
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
