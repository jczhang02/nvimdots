return {
	prompt_library = require("user.configs.codecompanion_utils.prompt"),
	display = {
		diff = {
			enabled = true,
			provider = "inline",
		},
		action_palette = {
			opts = {
				show_default_actions = false, -- Show the default actions in the action palette?
				show_default_prompt_library = false, -- Show the default prompt library in the action palette?
			},
		},
	},
}
