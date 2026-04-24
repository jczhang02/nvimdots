return {
	-- blink.cmp — completion engine
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				dependencies = {
					"rafamadriz/friendly-snippets",
					{
						"iurimateus/luasnip-latex-snippets.nvim",
						ft = { "tex", "bib", "markdown" },
						config = function()
							require("configs.completion.luasnip-latex-snippets")
						end,
					},
				},
				config = function()
					require("configs.completion.luasnip")
				end,
			},
		},
		config = function()
			require("configs.completion.blink-cmp")
		end,
	},

	-- nvim-lspconfig — LSP driven via vim.lsp.config/enable in configs/lsp/init.lua
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"ray-x/lsp_signature.nvim",
				config = function()
					require("configs.completion.lsp-signature")
				end,
			},
		},
		config = function()
			require("configs.lsp")
		end,
	},

	-- lazydev.nvim — provides lua_ls types for nvim config & plugin dev
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},

	-- lspsaga — LSP UI (hover, rename, code action, diagnostic, etc.)
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("configs.completion.lspsaga")
		end,
	},

	-- glance.nvim — peek references/definitions/implementations
	{
		"DNLHC/glance.nvim",
		event = "LspAttach",
		config = function()
			require("configs.completion.glance")
		end,
	},

	-- tiny-inline-diagnostic — inline diagnostic rendering
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000,
		config = function()
			require("configs.completion.tiny-inline-diagnostic")
		end,
	},

	-- copilot.lua — AI completion source (UI disabled; blink handles UI)
	{
		"zbirenbaum/copilot.lua",
		cond = function()
			return require("core.settings").use_copilot
		end,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("configs.completion.copilot")
		end,
	},

	-- conform.nvim — formatter runner
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufReadPost" },
		cmd = { "ConformInfo", "Format" },
		config = function()
			require("conform").setup(require("configs.formatters"))

			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					vim.b.disable_autoformat = true
				else
					vim.g.disable_autoformat = true
				end
			end, { bang = true })

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, {})

			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				require("conform").format({ async = true, lsp_format = "fallback", range = range })
			end, { range = true })

			vim.keymap.set("n", "<leader>tf", function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				vim.notify("Autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
			end, { desc = "Toggle autoformat" })
		end,
	},

	-- nvim-lint — linter runner
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("configs.linters")
		end,
	},
}
