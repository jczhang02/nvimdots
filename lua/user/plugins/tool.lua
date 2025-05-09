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
		"saifulapm/neotree-file-nesting-config",
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

tool["nvimtools/none-ls-extras.nvim"] = {
	lazy = true,
}

tool["Civitasv/cmake-tools.nvim"] = {
	lazy = true,
	config = function()
		local osys = require("cmake-tools.osys")
		require("cmake-tools").setup({
			cmake_command = "cmake", -- this is used to specify cmake command path
			ctest_command = "ctest", -- this is used to specify ctest command path
			cmake_use_preset = true,
			cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
			cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
			cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
			-- support macro expansion:
			--       ${kit}
			--       ${kitGenerator}
			--       ${variant:xx}
			cmake_build_directory = function()
				if osys.iswin32 then
					return "out\\${variant:buildType}"
				end
				return "out/${variant:buildType}"
			end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
			cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
			cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
			cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
			cmake_variants_message = {
				short = { show = true }, -- whether to show short message
				long = { show = true, max_length = 40 }, -- whether to show long message
			},
			cmake_dap_configuration = { -- debug settings for cmake
				name = "cpp",
				type = "codelldb",
				request = "launch",
				stopOnEntry = false,
				runInTerminal = true,
				console = "integratedTerminal",
			},
			cmake_executor = { -- executor to use
				name = "quickfix", -- name of the executor
				opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
				default_opts = { -- a list of default and possible values for executors
					quickfix = {
						show = "always", -- "always", "only_on_error"
						position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
						size = 10,
						encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
						auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
					},
					toggleterm = {
						direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
						close_on_exit = false, -- whether close the terminal when exit
						auto_scroll = true, -- whether auto scroll to the bottom
						singleton = true, -- single instance, autocloses the opened one, if present
					},
					overseer = {
						new_task_opts = {
							strategy = {
								"toggleterm",
								direction = "horizontal",
								autos_croll = true,
								quit_on_exit = "success",
							},
						}, -- options to pass into the `overseer.new_task` command
						on_new_task = function(task)
							require("overseer").open({ enter = false, direction = "right" })
						end, -- a function that gets overseer.Task when it is created, before calling `task:start`
					},
					terminal = {
						name = "Main Terminal",
						prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
						split_direction = "horizontal", -- "horizontal", "vertical"
						split_size = 11,

						-- Window handling
						single_terminal_per_instance = true, -- Single viewport, multiple windows
						single_terminal_per_tab = true, -- Single viewport per tab
						keep_terminal_static_location = true, -- Static location of the viewport if avialable
						auto_resize = true, -- Resize the terminal if it already exists

						-- Running Tasks
						start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
						focus = false, -- Focus on terminal when cmake task is launched.
						do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
					}, -- terminal executor uses the values in cmake_terminal
				},
			},
			cmake_runner = { -- runner to use
				name = "terminal", -- name of the runner
				opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
				default_opts = { -- a list of default and possible values for runners
					quickfix = {
						show = "always", -- "always", "only_on_error"
						position = "belowright", -- "bottom", "top"
						size = 10,
						encoding = "utf-8",
						auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
					},
					toggleterm = {
						direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
						close_on_exit = false, -- whether close the terminal when exit
						auto_scroll = true, -- whether auto scroll to the bottom
						singleton = true, -- single instance, autocloses the opened one, if present
					},
					overseer = {
						new_task_opts = {
							strategy = {
								"toggleterm",
								direction = "horizontal",
								autos_croll = true,
								quit_on_exit = "success",
							},
						}, -- options to pass into the `overseer.new_task` command
						on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
					},
					terminal = {
						name = "Main Terminal",
						prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
						split_direction = "horizontal", -- "horizontal", "vertical"
						split_size = 11,

						-- Window handling
						single_terminal_per_instance = true, -- Single viewport, multiple windows
						single_terminal_per_tab = true, -- Single viewport per tab
						keep_terminal_static_location = true, -- Static location of the viewport if avialable
						auto_resize = true, -- Resize the terminal if it already exists

						-- Running Tasks
						start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
						focus = false, -- Focus on terminal when cmake task is launched.
						do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
					},
				},
			},
			cmake_notifications = {
				runner = { enabled = true },
				executor = { enabled = true },
				spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
				refresh_rate_ms = 100, -- how often to iterate icons
			},
			cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
		})
	end,
}

return tool
