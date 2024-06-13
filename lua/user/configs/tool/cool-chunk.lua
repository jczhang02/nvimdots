return function()
	local support_filetypes = {
		"json",
		"go",
		"c",
		"python",
		"cpp",
		"rust",
		"h",
		"lua",
	}
	local exclude_filetypes = {
		aerial = true,
		dashboard = true,
		help = true,
		lspinfo = true,
		lspsagafinder = true,
		packer = true,
		checkhealth = true,
		man = true,
		mason = true,
		NvimTree = true,
		["neo-tree"] = true,
		plugin = true,
		lazy = true,
		TelescopePrompt = true,
		[""] = true, -- because TelescopePrompt will set a empty ft, so add this.
		alpha = true,
		toggleterm = true,
		sagafinder = true,
		sagaoutline = true,
		better_term = true,
		fugitiveblame = true,
		Trouble = true,
		qf = true,
		Outline = true,
		starter = true,
		NeogitPopup = true,
		NeogitStatus = true,
		DiffviewFiles = true,
		DiffviewFileHistory = true,
		DressingInput = true,
		spectre_panel = true,
		zsh = true,
		registers = true,
		startuptime = true,
		OverseerList = true,
		Navbuddy = true,
		noice = true,
		notify = true,
		["dap-repl"] = true,
		saga_codeaction = true,
		sagarename = true,
		cmp_menu = true,
		["null-ls-info"] = true,
		guihua = true,
		http = true,
		httpResult = true,
		netrw = true,
		gitcommit = true,
	}

	require("cool-chunk").setup({

		chunk = {
			notify = true,
			support_filetypes = support_filetypes,
			exclude_filetypes = exclude_filetypes,
			hl_group = {
				chunk = "CursorLineNr",
				error = "Error",
			},
			chars = {
				horizontal_line = "─",
				vertical_line = "│",
				left_top = "╭",
				left_bottom = "╰",
				left_arrow = "<",
				bottom_arrow = "v",
				right_arrow = ">",
			},
			textobject = "ah",
			animate_duration = 200, -- if don't want to animation, set to 0.
			fire_event = { "CursorHold", "CursorHoldI" },
		},
		context = {
			notify = true,
			chars = {
				"│",
			},
			hl_group = {
				context = "LineNr",
			},
			exclude_filetypes = exclude_filetypes,
			support_filetypes = support_filetypes,
			textobject = "ih",
			jump_support_filetypes = { "lua", "python" },
			jump_start = "[{",
			jump_end = "]}",
			fire_event = { "CursorHold", "CursorHoldI" },
		},
		line_num = {
			notify = true,
			hl_group = {
				chunk = "CursorLineNr",
				context = "LineNr",
				error = "Error",
			},
			support_filetypes = support_filetypes,
			exclude_filetypes = exclude_filetypes,
			fire_event = { "CursorHold", "CursorHoldI" },
		},
	})
end