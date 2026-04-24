return {
	-- Telescope fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", desc = "Find: files" },
			{ "<leader>fg", desc = "Find: live grep" },
			{ "<leader>fb", desc = "Find: buffers" },
			{ "<leader>fo", desc = "Find: oldfiles" },
			{ "<leader>fh", desc = "Find: help tags" },
			{ "<leader>fp", desc = "Find: projects" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-live-grep-args.nvim",
			"DrKJeff16/project.nvim",
			"debugloop/telescope-undo.nvim",
			"jvgrootveld/telescope-zoxide",
		},
		config = function()
			require("configs.tool.telescope")
		end,
	},

	-- Which-key keybinding hints
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("configs.tool.which-key")
		end,
	},

	-- File tree
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile", "NvimTreeFindFileToggle", "NvimTreeRefresh" },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
			{ "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
			{ "<leader>nf", "<cmd>NvimTreeFindFile<CR>", desc = "Find file in tree" },
			{ "<leader>nr", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file tree" },
		},
		config = function()
			require("configs.tool.nvim-tree")
		end,
	},

	-- Terminal manager
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "ToggleTermToggleAll" },
		keys = {
			{ "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle float terminal" },
			{ "<C-\\>", "<cmd>ToggleTerm direction=horizontal<CR>", mode = { "n", "i", "t" }, desc = "Toggle terminal" },
		},
		config = function()
			require("configs.tool.toggleterm")
		end,
	},

	-- Diagnostics list
	{
		"folke/trouble.nvim",
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (global)" },
			{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (workspace)" },
			{ "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Diagnostics (buffer)" },
		},
		config = function()
			require("configs.tool.trouble")
		end,
	},

	-- Breadcrumb bar
	{
		"Bekaboo/dropbar.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("configs.tool.dropbar")
		end,
	},

	-- Smart yank with OSC52/tmux support
	{
		"ibhagwan/smartyank.nvim",
		event = "BufReadPost",
		config = function()
			require("configs.tool.smartyank")
		end,
	},

	-- AI chat companion
	{
		"olimorris/codecompanion.nvim",
		version = "^18.0.0",
		cond = function()
			return require("core.settings").use_chat
		end,
		event = "VeryLazy",
		dependencies = {
			"ravitemer/codecompanion-history.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("configs.tool.codecompanion")
		end,
	},

	-- Debug adapter protocol
	{
		"mfussenegger/nvim-dap",
		cmd = { "DapContinue", "DapToggleBreakpoint", "DapTerminate", "DapStepOver", "DapStepInto", "DapStepOut" },
		keys = {
			{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "DAP: toggle breakpoint" },
			{ "<leader>dc", "<cmd>DapContinue<CR>", desc = "DAP: continue" },
		},
		dependencies = {
			"nvim-neotest/nvim-nio",
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					require("configs.tool.dapui")
				end,
			},
		},
		config = function()
			require("configs.tool.dap")
		end,
	},

	-- Async run commands
	{
		"skywind3000/asyncrun.vim",
		cmd = { "AsyncRun", "AsyncStop", "Rungnome", "Pytest" },
		dependencies = { "preservim/vimux" },
		config = function()
			require("configs.tool.asyncrun")
		end,
	},

	-- Async task runner
	{
		"skywind3000/asynctasks.vim",
		cmd = { "AsyncTask", "AsyncTaskList", "AsyncTaskEdit" },
		config = function()
			require("configs.tool.asynctasks")
		end,
	},

	-- .gitignore generator
	{
		"wintermute-cell/gitignore.nvim",
		cmd = "Gitignore",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	-- Debug print statements
	{
		"andrewferrier/debugprint.nvim",
		cmd = "DebugPrint",
		keys = {
			{ "g?p", desc = "DebugPrint: below" },
			{ "g?P", desc = "DebugPrint: above" },
			{ "g?v", desc = "DebugPrint: variable below" },
			{ "g?V", desc = "DebugPrint: variable above" },
		},
		config = function()
			require("configs.tool.debugprint")
		end,
	},

	-- Harpoon file marks
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		keys = {
			{ "<leader>ha", desc = "Harpoon: add file" },
			{ "<leader>hh", desc = "Harpoon: quick menu" },
			{ "<leader>hp", desc = "Harpoon: prev file" },
			{ "<leader>hn", desc = "Harpoon: next file" },
			{ "<leader>1", desc = "Harpoon: file 1" },
			{ "<leader>2", desc = "Harpoon: file 2" },
			{ "<leader>3", desc = "Harpoon: file 3" },
			{ "<leader>4", desc = "Harpoon: file 4" },
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.tool.harpoon")
		end,
	},

	-- Chinese typography spacing
	{
		"hotoo/pangu.vim",
		ft = { "markdown", "text" },
	},

	-- Fcitx5 input method switching
	{
		"pysan3/fcitx5.nvim",
		event = "InsertEnter",
		cond = function()
			return vim.fn.executable("fcitx5-remote") == 1
		end,
		config = function()
			require("configs.tool.fcitx5")
		end,
	},
}
