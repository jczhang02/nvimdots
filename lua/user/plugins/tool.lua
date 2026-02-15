local tool = {}

local settings = require("core.settings")

tool["numToStr/Navigator.nvim"] = {
	lazy = true,
	event = "VeryLazy",
	config = require("configs.tool.navigator"),
}

tool["skywind3000/asyncrun.vim"] = {
	lazy = true,
	cmd = { "AsyncRun", "Rungnome", "Pytest" },
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

tool["windwp/nvim-autopairs"] = {
	event = "InsertEnter",
	config = require("user.configs.tool.autopairs"),
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

tool["nvimtools/none-ls-extras.nvim"] = {
	lazy = true,
}

tool["andrewferrier/debugprint.nvim"] = {
	lazy = false,
	config = require("user.configs.tool.debugprint"),
}

tool["ravitemer/mcphub.nvim"] = {
	dependencies = {
		"nvim-lua/plenary.nvim",
		"olimorris/codecompanion.nvim",
	},
	build = "pnpm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
	config = require("configs.tool.mcp-hub"),
}

if settings.use_chat then
	tool["olimorris/codecompanion.nvim"] = {
		version = "^18.0.0",
	}
end

-- tool["milanglacier/minuet-ai.nvim"] = {
-- 	lazy = false,
-- 	dependencies = {
-- 		{ "nvim-lua/plenary.nvim" },
-- 		-- optional, if you are using virtual-text frontend, nvim-cmp is not
-- 		-- required.
-- 		{ "hrsh7th/nvim-cmp" },
-- 	},
-- 	config = function()
-- 		require("minuet").setup({
-- 			virtualtext = {
-- 				auto_trigger_ft = {},
-- 				keymap = {
-- 					-- accept whole completion
-- 					accept = "<A-A>",
-- 					-- accept one line
-- 					accept_line = "<A-a>",
-- 					-- accept n lines (prompts for number)
-- 					-- e.g. "A-z 2 CR" will accept 2 lines
-- 					accept_n_lines = "<A-z>",
-- 					-- Cycle to prev completion item, or manually invoke completion
-- 					prev = "<A-[>",
-- 					-- Cycle to next completion item, or manually invoke completion
-- 					next = "<A-]>",
-- 					dismiss = "<A-e>",
-- 				},
-- 			},
-- 			provider = "openai_compatible",
-- 			request_timeout = 2.5,
-- 			throttle = 1500, -- Increase to reduce costs and avoid rate limits
-- 			debounce = 600, -- Increase to reduce costs and avoid rate limits
-- 			provider_options = {
-- 				openai_compatible = {
-- 					api_key = "MINUET_API_KEY",
-- 					end_point = "https://openrouter.ai/api/v1/chat/completions",
-- 					model = "moonshotai/kimi-k2",
-- 					name = "Openrouter",
-- 					optional = {
-- 						max_tokens = 56,
-- 						top_p = 0.9,
-- 						provider = {
-- 							-- Prioritize throughput for faster completion
-- 							sort = "throughput",
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

tool["inhesrom/remote-ssh.nvim"] = {
	branch = "master",
	dependencies = {
		"inhesrom/telescope-remote-buffer", --See https://github.com/inhesrom/telescope-remote-buffer for features
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"neovim/nvim-lspconfig",
		-- nvim-notify is recommended, but not necessarily required into order to get notifcations during operations - https://github.com/rcarriga/nvim-notify
		"rcarriga/nvim-notify",
	},
	config = function()
		require("telescope-remote-buffer").setup(
			-- Default keymaps to open telescope and search open buffers including "remote" open buffers
			--fzf = "<leader>fz",
			--match = "<leader>gb",
			--oldfiles = "<leader>rb"
		)

		-- setup lsp_config here or import from part of neovim config that sets up LSP

		require("remote-ssh").setup({})
	end,
}
return tool
