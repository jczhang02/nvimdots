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
	lazy = true,
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
	lazy = true,
	cmd = "DebugPrint",
	config = require("user.configs.tool.debugprint"),
}

if settings.use_chat then
	tool["olimorris/codecompanion.nvim"] = {
		version = "^18.0.0",
	}
end

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

-- tool["nickjvandyke/opencode.nvim"] = {
-- 	version = "*", -- Latest stable release
-- 	-- No snacks.nvim: falls back to native vim.ui.input/vim.ui.select
-- 	config = function()
-- 		---@type opencode.Opts
-- 		vim.g.opencode_opts = {}

-- 		vim.o.autoread = true -- Required for `opts.events.reload`

-- 		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
-- 			require("opencode").ask("@this: ", { submit = true })
-- 		end, { desc = "Opencode: ask" })
-- 		vim.keymap.set({ "n", "x" }, "<leader>os", function()
-- 			require("opencode").select()
-- 		end, { desc = "Opencode: select action" })
-- 		vim.keymap.set({ "n", "t" }, "<leader>ot", function()
-- 			require("opencode").toggle()
-- 		end, { desc = "Opencode: toggle" })

-- 		vim.keymap.set({ "n", "x" }, "go", function()
-- 			return require("opencode").operator("@this ")
-- 		end, { desc = "Opencode: add range", expr = true })
-- 		vim.keymap.set("n", "goo", function()
-- 			return require("opencode").operator("@this ") .. "_"
-- 		end, { desc = "Opencode: add line", expr = true })

-- 		vim.keymap.set("n", "<S-C-u>", function()
-- 			require("opencode").command("session.half.page.up")
-- 		end, { desc = "Opencode: scroll up" })
-- 		vim.keymap.set("n", "<S-C-d>", function()
-- 			require("opencode").command("session.half.page.down")
-- 		end, { desc = "Opencode: scroll down" })
-- 	end,
-- }

tool["hotoo/pangu.vim"] = {}

return tool
