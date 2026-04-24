return {
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("configs.ui.catppuccin")
		end,
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		config = function()
			require("configs.ui.lualine")
		end,
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		event = { "BufReadPre", "BufAdd", "BufNewFile" },
		config = function()
			require("configs.ui.bufferline")
		end,
	},

	-- Dashboard
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("configs.ui.alpha")
		end,
	},

	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.ui.gitsigns")
		end,
	},

	-- Indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("configs.ui.indent-blankline")
		end,
	},

	-- Notifications
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("configs.ui.notify")
		end,
	},

	-- Smart window splits
	{
		"mrjones2014/smart-splits.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.ui.smart-splits")
		end,
	},

	-- Todo comments
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.ui.todo-comments")
		end,
	},
}
