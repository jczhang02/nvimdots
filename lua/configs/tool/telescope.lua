local lga_actions = require("telescope-live-grep-args.actions")

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		initial_mode = "normal",
		prompt_prefix = "  ",
		selection_caret = " ",
		scroll_strategy = "limit",
		results_title = false,
		layout_strategy = "flex",
		path_display = { "absolute" },
		selection_strategy = "reset",
		color_devicons = true,
		file_ignore_patterns = { ".git/", ".cache", "build/", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
		layout_config = {
			horizontal = { preview_width = 0.55 },
			vertical = { mirror = false },
			width = 0.85,
			height = 0.92,
			preview_cutoff = 120,
		},
		mappings = {
			n = { ["q"] = "close" },
		},
	},
	extensions = {
		fzf = {
			fuzzy = false,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		live_grep_args = {
			auto_quoting = true,
			mappings = {
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				},
			},
		},
		undo = {
			side_by_side = true,
			mappings = {
				i = {
					["<cr>"] = require("telescope-undo.actions").yank_additions,
					["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
					["<C-cr>"] = require("telescope-undo.actions").restore,
				},
			},
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("projects")
require("telescope").load_extension("undo")
require("telescope").load_extension("zoxide")

local builtin = require("telescope.builtin")
local lga = require("telescope").extensions.live_grep_args

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find: files" })
vim.keymap.set("n", "<leader>fg", lga.live_grep_args, { desc = "Find: live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find: buffers" })
vim.keymap.set("n", "gb", builtin.buffers, { desc = "Find: buffers" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find: oldfiles" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find: help tags" })
vim.keymap.set("n", "<leader>fp", function()
	require("telescope").extensions.projects.projects({})
end, { desc = "Find: projects" })
