local actions = require("glance").actions

require("glance").setup({
	height = 20,
	zindex = 50,
	preview_win_opts = {
		cursorline = true,
		number = true,
		wrap = true,
	},
	border = {
		enable = false,
		top_char = "―",
		bottom_char = "―",
	},
	list = {
		position = "right",
		width = 0.33,
	},
	folds = {
		folded = true,
		fold_closed = "",
		fold_open = "",
	},
	indent_lines = { enable = true },
	winbar = { enable = true },
	mappings = {
		list = {
			["k"] = actions.previous,
			["j"] = actions.next,
			["<Up>"] = actions.previous,
			["<Down>"] = actions.next,
			["<S-Tab>"] = actions.previous_location,
			["<Tab>"] = actions.next_location,
			["<C-u>"] = actions.preview_scroll_win(8),
			["<C-d>"] = actions.preview_scroll_win(-8),
			["<CR>"] = actions.jump,
			["v"] = actions.jump_vsplit,
			["s"] = actions.jump_split,
			["t"] = actions.jump_tab,
			["c"] = actions.close_fold,
			["o"] = actions.open_fold,
			["[]"] = actions.enter_win("preview"),
			["q"] = actions.close,
			["Q"] = actions.close,
			["<Esc>"] = actions.close,
			["gq"] = actions.quickfix,
		},
		preview = {
			["Q"] = actions.close,
			["<C-c>q"] = actions.close,
			["<C-c>o"] = actions.jump,
			["<C-c>v"] = actions.jump_vsplit,
			["<C-c>s"] = actions.jump_split,
			["<C-c>t"] = actions.jump_tab,
			["<C-p>"] = actions.previous_location,
			["<C-n>"] = actions.next_location,
			["[]"] = actions.enter_win("list"),
		},
	},
	hooks = {
		before_open = function(results, open, _, method)
			if #results == 0 then
				vim.notify(
					"This method is not supported by any of the servers registered for the current buffer",
					vim.log.levels.WARN,
					{ title = "Glance" }
				)
			elseif #results == 1 and method == "references" then
				vim.notify(
					"The identifier under cursor is the only one found",
					vim.log.levels.INFO,
					{ title = "Glance" }
				)
			else
				open(results)
			end
		end,
	},
})
