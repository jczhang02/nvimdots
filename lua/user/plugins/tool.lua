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

-- tool["windwp/nvim-autopairs"] = {
-- 	event = "InsertEnter",
-- 	config = require("user.configs.tool.autopairs"),
-- }

tool["TobinPalmer/pastify.nvim"] = {
	cmd = { "Pastify" },
	config = function()
		require("pastify").setup({
			opts = {
				absolute_path = false, -- use absolute or relative path to the working directory
				apikey = "", -- Api key, required for online saving
				local_path = "/figures", -- The path to put local files in, ex ~/Projects/<name>/assets/images/<imgname>.png
				ft = { -- Custom snippets for different filetypes, will replace $IMG$ with the image url
					html = '<img src="$IMG$" alt="">',
					markdown = "![]($IMG$)",
					tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
				}, -- Either 'local' or 'online'
			},
			save = "local",
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

tool["ThePrimeagen/harpoon"] = {
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Harpoon: add file" })
		vim.keymap.set("n", "<leader>hh", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Harpoon: quick menu" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: file 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: file 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: file 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: file 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: prev file" })
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Harpoon: next file" })
	end,

	dependencies = { { "nvim-lua/plenary.nvim" } },
}

return tool
