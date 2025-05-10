---@diagnostic disable: lowercase-global

return function()
	local openrouter_key = os.getenv("OPENROUTER_KEY")
	local oaipro_key = os.getenv("OAIPRO_KEY")
	local siliconflow_key = os.getenv("SILICONFLOW_KEY")

	-- local available_models = {
	-- 	openrouter = {
	-- 		"google/gemini-2.0-flash-001",
	-- 		"google/gemini-2.5-pro-preview-03-25",
	-- 		"anthropic/claude-3.7-sonnet",
	-- 		"anthropic/claude-3.5-sonnet",
	-- 		"openai/gpt-4o-mini",
	-- 	},
	-- 	oaipro = {
	-- 		"gpt-4o",
	-- 		"claude-3-5-sonnet-20240620",
	-- 	},
	-- 	siliconflow = {
	-- 		"deepseek-ai/DeepSeek-R1",
	-- 		"deepseek-ai/DeepSeek-V3",
	-- 	},
	-- }

	local current_adapter = "oaipro" -- openrouter, oaipro, siliconflow
	default_model = "google/gemini-2.5-pro-preview"
	current_model = default_model
	local available_models = {
		"google/gemini-2.5-pro-preview",
		"google/gemini-2.0-flash-001",
		"anthropic/claude-3.7-sonnet",
		"anthropic/claude-3.5-sonnet",
		"openai/gpt-4o-mini",
		"openai/gpt-4o",
	}

	require("configs.spinner"):init()
	require("codecompanion").setup({
		adapters = {
			openrouter = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "openrouter",
					formatted_name = "openrouter",
					env = {
						url = "https://openrouter.ai/api",
						api_key = openrouter_key,
						chat_url = "/v1/chat/completions",
					},
					schema = {
						model = {
							default = "google/gemini-2.5-pro-preview",
							choices = {
								"google/gemini-2.5-pro-preview",
								"google/gemini-2.0-flash-001",
								"anthropic/claude-3.7-sonnet",
								"anthropic/claude-3.5-sonnet",
								"openai/gpt-4o-mini",
								"openai/gpt-4o",
							},
						},
					},
				})
			end,
			oaipro = function()
				return require("codecompanion.adapters").extend("openai", {
					name = "oaipro",
					formatted_name = "oaipro",
					url = "https://api1.oaipro.com/v1/chat/completions",
					env = {
						api_key = oaipro_key,
						-- chat_url = "/v1/chat/completions", -- optional: default value, override if different
					},
					schema = {
						model = {
							default = "gpt-4o",
							choices = {
								"gpt-4o",
								"claude-3-5-sonnet-20240620",
							},
						},
					},
				})
			end,

			siliconflow = function()
				return require("codecompanion.adapters").extend("deepseek", {
					name = "siliconflow",
					formatted_name = "siliconflow",
					url = "https://api.siliconflow.cn/v1/chat/completions",
					env = {
						api_key = siliconflow_key,
						-- chat_url = "/v1/chat/completions", -- optional: default value, override if different
					},
					schema = {
						model = {
							-- default = "deepseek-ai/DeepSeek-V3",
							default = "deepseek-ai/DeepSeek-V3",
							choices = {
								["deepseek-ai/DeepSeek-R1"] = { opts = { can_reason = true, can_use_tools = false } },
								["deepseek-ai/DeepSeek-V3"] = { opts = { can_use_tools = true } },
							},
						},
					},
				})
			end,
		},
		display = {
			diff = {
				enabled = true,
				close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
				layout = "vertical", -- vertical|horizontal split for default provider
				opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
				provider = "default", -- default|mini_diff
			},
			chat = {
				window = {
					layout = "vertical", -- float|vertical|horizontal|buffer
					position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
					border = "single",
					width = 0.25,
					relative = "editor",
					full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
				},
			},
		},
		strategies = {
			-- Change the default chat adapter
			chat = {
				adapter = "openrouter",
			},
			inline = {
				adapter = "openrouter",
			},
		},
		opts = {
			-- Set debug logging
			log_level = "DEBUG",
		},
		prompt_library = require("configs.codecompanion.prompt"),
	})
end
