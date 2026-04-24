require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	auto_attach = true,
	signcolumn = true,
	sign_priority = 6,
	update_debounce = 100,
	word_diff = false,
	current_line_blame = true,
	diff_opts = { internal = true },
	watch_gitdir = { follow_files = true },
	current_line_blame_opts = {
		delay = 1000,
		virt_text = true,
		virtual_text_pos = "eol",
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Next hunk" })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Prev hunk" })

		-- Actions
		map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame line" })
		map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
		map("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
		map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
	end,
})
