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

-- tool["nvim-neo-tree/neo-tree.nvim"] = {
-- 	lazy = true,
-- 	cmd = {
-- 		"Neotree",
-- 	},
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
-- 		"MunifTanjim/nui.nvim",
-- 		"saifulapm/neotree-file-nesting-config",
-- 		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
-- 	},
-- 	config = require("configs.tool.neo-tree"),
-- }

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

return tool
