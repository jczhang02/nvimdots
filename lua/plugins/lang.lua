return {
	{
		"lervag/vimtex",
		ft = { "tex", "bib" },
		config = function()
			require("configs.lang.vimtex")
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "*",
		ft = "rust",
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			require("configs.lang.rustaceanvim")
		end,
	},
	{
		"Saecki/crates.nvim",
		event = "BufReadPost Cargo.toml",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.lang.crates")
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
		config = function()
			require("configs.lang.render-markdown")
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"chrisbra/csv.vim",
		ft = "csv",
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		dependencies = {
			{
				"junegunn/fzf",
				build = function()
					vim.fn["fzf#install"]()
				end,
			},
		},
		config = function()
			require("configs.lang.nvim-bqf")
		end,
	},
	{
		"microsoft/python-type-stubs",
		lazy = true,
	},
}
