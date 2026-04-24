local settings = require("core.settings")

require("catppuccin").setup({
	flavour = "latte",
	background = { light = "latte", dark = "mocha" },
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = false,
	show_end_of_buffer = false,
	term_colors = true,
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	styles = {
		comments = { "italic" },
		functions = { "bold" },
		keywords = { "italic" },
		operators = { "bold" },
		conditionals = { "bold" },
		loops = { "bold" },
		booleans = { "bold", "italic" },
		numbers = {},
		types = {},
		strings = {},
		variables = {},
		properties = {},
	},
	integrations = {
		treesitter = true,
		telescope = { enabled = true, style = "nvchad" },
		which_key = true,
		gitsigns = true,
		indent_blankline = { enabled = true, colored_indent_levels = true },
		bufferline = true,
		dap = true,
		dap_ui = true,
		neogit = true,
		lsp_trouble = true,
		render_markdown = true,
		blink_cmp = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		notify = true,
		nvimtree = true,
		rainbow_delimiters = true,
		flash = true,
		diffview = true,
		mini = { enabled = true },
		semantic_tokens = true,
	},
	color_overrides = {},
	highlight_overrides = {
		all = function(cp)
			return {
				NormalFloat = { fg = cp.text, bg = cp.mantle },
				FloatBorder = { fg = cp.mantle, bg = cp.mantle },
				CursorLineNr = { fg = cp.green },

				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { bg = cp.none },
				LspInfoBorder = { link = "FloatBorder" },

				IblIndent = { fg = cp.surface0 },
				IblScope = { fg = cp.surface2, style = { "bold" } },

				Pmenu = { fg = cp.overlay2, bg = cp.base },
				PmenuBorder = { fg = cp.surface1, bg = cp.base },
				PmenuSel = { bg = cp.green, fg = cp.base },

				NotifyBackground = { bg = cp.base },

				NvimTreeRootFolder = { fg = cp.pink },
				NvimTreeIndentMarker = { fg = cp.surface2 },

				TroubleNormal = { bg = cp.base },
				TroubleNormalNC = { bg = cp.base },

				TelescopeMatching = { fg = cp.lavender },
				TelescopeResultsDiffAdd = { fg = cp.green },
				TelescopeResultsDiffChange = { fg = cp.yellow },
				TelescopeResultsDiffDelete = { fg = cp.red },

				["@keyword.return"] = { fg = cp.pink, style = {} },
				["@error.c"] = { fg = cp.none, style = {} },
				["@error.cpp"] = { fg = cp.none, style = {} },
			}
		end,
	},
})

vim.cmd.colorscheme(settings.colorscheme)
