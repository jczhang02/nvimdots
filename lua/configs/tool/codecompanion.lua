local ok, history = pcall(require, "codecompanion-history")
local extensions = {}
if ok then
	extensions["history"] = {
		enabled = true,
		opts = {},
	}
end

local prompt_library = {}
local ok2, prompts = pcall(require, "configs.tool.codecompanion_prompts")
if ok2 then
	prompt_library = prompts
end

require("codecompanion").setup({
	prompt_library = prompt_library,
	display = {
		diff = {
			enabled = true,
			provider = "inline",
		},
		action_palette = {
			opts = {
				show_default_actions = false,
				show_default_prompt_library = false,
			},
		},
	},
	extensions = extensions,
})
