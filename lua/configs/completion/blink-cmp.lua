local border = function(hl)
	return {
		{ "┌", hl },
		{ "─", hl },
		{ "┐", hl },
		{ "│", hl },
		{ "┘", hl },
		{ "─", hl },
		{ "└", hl },
		{ "│", hl },
	}
end

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-w>"] = { "cancel", "fallback" },
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},

	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = false,
		kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		},
	},

	completion = {
		accept = {
			auto_brackets = { enabled = true },
		},

		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},

		menu = {
			border = border("PmenuBorder"),
			winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:PmenuSel",
			scrollbar = false,
			max_height = 15,
			draw = {
				treesitter = { "lsp" },
				columns = {
					{ "kind_icon", "label", "label_description", gap = 1 },
					{ "source_name" },
				},
				components = {
					source_name = {
						text = function(ctx)
							local map = {
								LSP = "[LSP]",
								Buffer = "[BUF]",
								Path = "[PATH]",
								Snippets = "[SNIP]",
								copilot = "[CPLT]",
								Copilot = "[CPLT]",
							}
							return map[ctx.source_name] or ("[" .. string.upper(ctx.source_name) .. "]")
						end,
						highlight = "BlinkCmpSource",
					},
				},
			},
		},

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
			window = {
				border = border("CmpDocBorder"),
				winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
				max_width = 80,
				max_height = 20,
			},
		},

		ghost_text = {
			enabled = true,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			buffer = {
				opts = {
					get_bufnrs = function()
						if vim.api.nvim_buf_line_count(0) >= 15000 then
							return {}
						end
						return vim.api.nvim_list_bufs()
					end,
				},
			},
		},
	},

	cmdline = {
		enabled = true,
		keymap = {
			preset = "none",
			["<Tab>"] = { "show_and_insert", "select_next" },
			["<S-Tab>"] = { "show_and_insert", "select_prev" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept_and_enter", "fallback" },
			["<C-e>"] = { "cancel" },
		},
		completion = {
			menu = { auto_show = true },
			list = { selection = { preselect = false, auto_insert = true } },
			ghost_text = { enabled = false },
		},
	},

	snippets = { preset = "luasnip" },
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = {
		enabled = true,
		window = { border = border("PmenuBorder") },
	},
})

-- Link custom highlight groups from the old cmp UI so catppuccin colors them
local function link(from, to)
	if vim.fn.hlexists(from) == 0 then
		vim.api.nvim_set_hl(0, from, { link = to, default = true })
	end
end
link("PmenuBorder", "FloatBorder")
link("CmpDoc", "NormalFloat")
link("CmpDocBorder", "FloatBorder")
link("BlinkCmpSource", "Comment")
