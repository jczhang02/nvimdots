-- Please check `lua/core/settings.lua` to view the full list of configurable settings
local settings = {}

-- Examples
settings["use_ssh"] = false
settings["use_copilot"] = false
settings["colorscheme"] = "catppuccin-latte"
settings["background"] = "dark"
settings["server_formatting_block_list"] = {
	lua_ls = true,
	tsserver = true,
	clangd = true,
	texlab = true,
	pyright = true,
	basepyright = true,
	ruff = true,
}

settings["null_ls_deps"] = {
	"clang_format",
	"prettier",
	"shfmt",
	"stylua",
	"vint",
	"latexindent",
	"beautysh",
}

settings["lsp_deps"] = function(defaults)
	return {
		"bashls",
		"clangd",
		"html",
		"jsonls",
		"lua_ls",
	}
end

settings["disabled_plugins"] = {
	-- "nvim-tree/nvim-tree.lua",
	-- "m4xshen/autoclose.nvim",
}

settings["gui_config"] = {
	font_name = "Iosevka NFP",
	font_size = 11,
}

settings["treesitter_deps"] = function()
	return {
		"bash",
		"c",
		"cpp",
		"css",
		"go",
		"gomod",
		"html",
		"javascript",
		"json",
		-- "latex",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
		"typescript",
		"vimdoc",
		"vue",
		"yaml",
		"ini",
		"r",
		"rnoweb",
	}
end

settings["chat_models"] = function()
	return {
		"google/gemini-2.5-pro-preview",
		"google/gemini-2.5-pro-exp-03-25",
		"google/gemini-2.0-flash-001",
		"anthropic/claude-3.7-sonnet",
		"anthropic/claude-3.5-sonnet",
		"openai/gpt-4o-mini",
		"deepseek/deepseek-v3-base:free",
		"deepseek/deepseek-prover-v2:free",
	}
end

return settings
