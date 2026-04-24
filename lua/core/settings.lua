local settings = {}

settings.colorscheme = "catppuccin-latte"
settings.background = "dark"
settings.use_ssh = true
settings.use_copilot = false
settings.use_chat = false

settings.lsp_servers = {
	"lua_ls",
	"pyright",
	"ruff",
	"clangd",
	"bashls",
	"html",
	"jsonls",
	"yamlls",
	"texlab",
	"ltex",
}

settings.server_formatting_block_list = {
	lua_ls = true,
	clangd = true,
	texlab = true,
	basedpyright = true,
	pyright = true,
	ruff = false,
	taplo = false,
}

settings.treesitter_deps = {
	"bash", "c", "cpp", "css", "go", "gomod", "html", "javascript",
	"json", "lua", "make", "markdown", "markdown_inline", "python",
	"rust", "typescript", "vimdoc", "vue", "yaml", "ini", "r", "rnoweb",
}

settings.gui_config = { font_name = "Iosevka NFP", font_size = 11 }
settings.neovide_config = { fullscreen = false }

settings.chat_models = {
	"anthropic/claude-3.7-sonnet",
	"google/gemini-2.5-pro-preview",
}

return settings
