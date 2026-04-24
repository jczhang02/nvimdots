return {
	-- treesitter cluster (main branch, eager load for highlight)
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = function()
			vim.cmd.TSUpdate()
		end,
		config = function()
			require("configs.editor.treesitter")
		end,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
				config = function()
					require("configs.editor.ts-textobjects")
				end,
			},
			{
				"andymass/vim-matchup",
				config = function()
					require("configs.editor.matchup")
				end,
			},
			{
				"windwp/nvim-ts-autotag",
				config = function()
					require("configs.editor.ts-autotag")
				end,
			},
			{
				"hiphish/rainbow-delimiters.nvim",
				submodules = false,
				config = function()
					require("configs.editor.rainbow-delimiters")
				end,
			},
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				config = function()
					require("configs.editor.ts-context-commentstring")
				end,
			},
		},
	},

	-- flash.nvim — jump / remote / treesitter search
	{
		"folke/flash.nvim",
		event = { "CursorHold", "CursorHoldI" },
		keys = { "s", "S", "r", "R" },
		config = function()
			require("configs.editor.flash")
		end,
	},

	-- nvim-surround
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "InsertEnter",
		config = function()
			require("configs.editor.nvim-surround")
		end,
	},

	-- mini.align
	{
		"echasnovski/mini.align",
		keys = { "ga", "gA" },
		config = function()
			require("configs.editor.mini-align")
		end,
	},

	-- autoclose.nvim
	{
		"m4xshen/autoclose.nvim",
		event = "InsertEnter",
		config = function()
			require("configs.editor.autoclose")
		end,
	},

	-- nvim-highlight-colors
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("configs.editor.highlight-colors")
		end,
	},

	-- suda.vim — sudo read/write
	{
		"lambdalisue/suda.vim",
		cmd = { "SudaRead", "SudaWrite" },
		init = function()
			vim.g.suda_smart_edit = 1
		end,
	},

	-- vim-sleuth — auto-detect indentation
	{
		"tpope/vim-sleuth",
		event = { "BufNewFile", "BufReadPost" },
	},

	-- grug-far — find and replace
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		config = function()
			require("configs.editor.grug-far")
		end,
	},

	-- persisted.nvim — session management
	{
		"olimorris/persisted.nvim",
		cmd = {
			"SessionToggle",
			"SessionStart",
			"SessionStop",
			"SessionSave",
			"SessionLoad",
			"SessionLoadLast",
		},
		config = function()
			require("configs.editor.persisted")
		end,
	},

	-- nvim-bufdel — delete buffers cleanly
	{
		"ojroques/nvim-bufdel",
		cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
	},

	-- neogen — docstring generator
	{
		"danymat/neogen",
		cmd = "Neogen",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("configs.editor.neogen")
		end,
	},

	-- diffview.nvim
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose" },
		config = function()
			require("configs.editor.diffview")
		end,
	},

	-- which-key — keymap hint popup
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.editor.which-key")
		end,
	},

	-- trouble — workspace diagnostics / quickfix / references list
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
			{ "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP refs/defs (Trouble)" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
		},
		config = function()
			require("configs.editor.trouble")
		end,
	},
}
