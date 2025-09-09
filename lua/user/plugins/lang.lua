local lang = {}

lang["lervag/vimtex"] = {
	lazy = false,
	config = require("configs.lang.vimtex"),
}

lang["MortenStabenau/matlab-vim"] = {
	lazy = true,
	ft = "matlab",
	config = require("configs.lang.matlab"),
}

lang["microsoft/python-type-stubs"] = {
	lazy = true,
}

lang["gentoo/gentoo-syntax"] = {
	lazy = true,
	ft = { "ebuild" },
}

lang["benlubas/molten-nvim"] = {
	version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
	build = ":UpdateRemotePlugins",
	init = function()
		-- this is an example, not a default. Please see the readme for more configuration options
		vim.g.molten_output_win_max_height = 12
	end,
}

lang["R-nvim/R.nvim"] = {
	lazy = true,
	ft = { "rmd", "r" },
	config = function()
		-- Create a table with the options to be passed to setup()
		---@type RConfigUserOpts
		local opts = {
			-- latexcmd = { "latexmk", "-pdf", '-pdflatex="xelatex %O -synctex=1 %S"' },
			latexcmd = { "xelatex" },
			latex_build_dir = "build",
			rmarkdown_args = "output_dir = 'output', clean = FALSE",
			hook = {
				on_filetype = function()
					vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
					vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
				end,
			},
			R_args = { "--quiet", "--no-save" },
			min_editor_width = 72,
			rconsole_width = 0,
			rconsole_height = 10,
			objbr_mappings = { -- Object browser keymap
				c = "class", -- Call R functions
				["<localleader>gg"] = "head({object}, n = 15)", -- Use {object} notation to write arbitrary R code.
				v = function()
					-- Run lua functions
					require("r.browser").toggle_view()
				end,
			},
			disable_cmds = {
				"RClearConsole",
				"RCustomStart",
				"RSPlot",
				"RSaveClose",
			},
		}
		-- Check if the environment variable "R_AUTO_START" exists.
		-- If using fish shell, you could put in your config.fish:
		-- alias r "R_AUTO_START=true nvim"
		opts.auto_start = "on startup"
		opts.objbr_auto_start = false
		require("r").setup(opts)
	end,
}

lang["artoj/qmake-syntax-vim"] = {
	ft = { "qmake" },
}

lang["junegunn/fzf"] = {
	build = "./install --all",
}

return lang
