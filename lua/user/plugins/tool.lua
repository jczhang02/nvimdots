local tool = {}

tool["numToStr/Navigator.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("configs.tool.navigator"),
}

tool["skywind3000/asyncrun.vim"] = {
	lazy = true,
	cmd = { "AsyncRun", "Rungnome" },
	config = require("configs.tool.asyncrun"),
	dependencies = {
		"preservim/vimux",
		config = require("configs.tool.vimux"),
	},
}

tool["skywind3000/asynctasks.vim"] = {
	lazy = true,
	cmd = { "AsyncTask", "AsyncTaskList", "AsyncTaskEdit" },
	config = require("configs.tool.asynctask"),
}

tool["nvim-neo-tree/neo-tree.nvim"] = {
	lazy = true,
	cmd = {
		"Neotree",
	},
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = require("configs.tool.neo-tree"),
}

tool["wintermute-cell/gitignore.nvim"] = {
	lazy = true,
	requires = {
		"nvim-telescope/telescope.nvim", -- optional: for multi-select
	},
	cmd = {
		"Gitignore",
	},
}

tool["askfiy/nvim-picgo"] = {
	lazy = true,
	ft = { "markdown" },
	config = require("configs.tool.picgo"),
}

tool["keaising/im-select.nvim"] = {
	lazy = true,
	event = "InsertEnter",
	config = require("configs.tool.im-select"),
}

tool["folke/zen-mode.nvim"] = {
	lazy = false,
}

tool["CoatiSoftware/vim-sourcetrail"] = {
	lazy = true,
	cmd = {
		"SourcetrailStartServer",
		"SourcetrailRestartServer",
		"SourcetrailStopServer",
	},
	config = function()
		vim.g.sourcetrail_ip = "127.0.0.1"
		vim.g.sourcetrail_to_vim_port = 16678
		vim.g.vim_to_sourcetrail_port = 16677
	end,
}

tool["rareitems/printer.nvim"] = {
	config = function()
		require("printer").setup({
			keymap = "gm", -- Plugin doesn't have any keymaps by default
		})
	end,
}

tool["windwp/nvim-autopairs"] = {
	event = "InsertEnter",
	config = require("user.configs.tool.autopairs"),
}

tool["kwkarlwang/bufresize.nvim"] = {
	event = { "BufWinEnter", "WinEnter" },
	config = function()
		require("bufresize").setup({
			register = {
				trigger_events = { "BufWinEnter", "WinEnter" },
				keys = {},
			},
			resize = {
				trigger_events = {
					"VimResized",
				},
				increment = 1,
			},
		})
	end,
}

tool["TobinPalmer/pastify.nvim"] = {
	cmd = { "Pastify" },
	config = function()
		require("pastify").setup({
			opts = {
				absolute_path = false, -- use absolute or relative path to the working directory
				apikey = "", -- Api key, required for online saving
				local_path = "/figures", -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
				save = "local", -- Either 'local' or 'online'
			},
			ft = { -- Custom snippets for different filetypes, will replace $IMG$ with the image url
				html = '<img src="$IMG$" alt="">',
				markdown = "![]($IMG$)",
				tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
			},
		})
	end,
}

tool["nvimdev/template.nvim"] = {
	lazy = true,
	cmd = { "Template", "TemProject" },
	config = function()
		require("template").setup({
			-- config in there
			temp_dir = "~/.config/nvim/templates",
			author = "Chengrui Zhang",
			email = "jczhang@live.it",
		})
	end,
}

tool["yetone/avante.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	-- cmd = { "AvanteAsk" },
	opts = {
		provider = "openai",
		auto_suggestions_provider = "openai",
		openai = {
			endpoint = "https://api.302.ai/v1/chat/completions",
			-- model = 'claude-3-5-sonnet-20240620',
			-- model = "gpt-4o",

			model = "gpt-3.5-sonnet-cursor",
			-- model = "o1-preview",
			-- timeout = 120000,
		},
		claude = {
			endpoint = "https://api.302.ai/v1/chat/completions",
			model = "gpt-3.5-sonnet-cursor",
			timeout = 30000, -- Timeout in milliseconds
			temperature = 0,
			max_tokens = 8000,
		},
		behaviour = {
			auto_suggestions = false,
			minimize_diff = true,
		},
		windows = {
			position = "smart",
			height = 46,
			wrap = true,
			sidebar_header = {
				align = "center",
			},
			ask = {
				floating = false,
			},
		},
	},
	version = false,
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

return tool
