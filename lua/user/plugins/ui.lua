local ui = {}

ui["j-hui/fidget.nvim"] = {
	lazy = true,
	event = "LspAttach",
	config = require("configs.ui.fidget"),
}

return ui
