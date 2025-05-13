return function()
	local secret_key = os.getenv("CODE_COMPANION_KEY")
	local models = require("core.settings").chat_models
	local default_model = models[1]
	local current_model = default_model

	local select_model = function()
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local finder = require("telescope.finders")
		local pickers = require("telescope.pickers")
		local type = require("telescope.themes").get_dropdown()
		local conf = require("telescope.config").values

		pickers
			.new(type, {
				prompt_title = "(CodeCompanion) Select Model",
				finder = finder.new_table({ results = models }),
				sorter = conf.generic_sorter(type),
				attach_mappings = function(bufnr)
					actions.select_default:replace(function()
						actions.close(bufnr)
						current_model = action_state.get_selected_entry()[1]
						vim.notify(
							"Model selected: " .. current_model,
							vim.log.levels.INFO,
							{ title = "CodeCompanion" }
						)
					end)

					return true
				end,
			})
			:find()
	end

	require("codecompanion").setup({
		strategies = {
			chat = {
				adapter = "openrouter",
			},
			inline = {
				adapter = "openrouter",
			},
		},
		adapters = {
			openrouter = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					env = {
						url = "https://openrouter.ai/api",
						api_key = secret_key,
						chat_url = "/v1/chat/completions",
					},
					schema = {
						model = {
							default = current_model,
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
			action_palette = {
				width = 95,
				height = 10,
				prompt = "Prompt ", -- Prompt used for interactive LLM calls
				provider = "telescope", -- Can be "default", "telescope", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
				opts = {
					show_default_actions = false, -- Show the default actions in the action palette?
					show_default_prompt_library = false, -- Show the default prompt library in the action palette?
				},
			},
		},
		prompt_library = require("configs.codecompanion.prompt"),
	})
end
