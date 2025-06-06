local null_ls = require("null-ls")
local btns = null_ls.builtins

return {
	sources = {
		btns.formatting.clang_format.with({
			filetypes = { "c", "cpp" },
			extra_args = { "-style={BasedOnStyle: LLVM, IndentWidth: 4}" },
		}),
		-- btns.formatting.prettier.with({
		-- 	extra_filetypes = { "toml" },
		-- }),
		require("user.configs.formatters.latexindent"),
		require("user.configs.formatters.bibtex-tidy"),
		require("user.configs.formatters.xmlformat"),
		require("user.configs.formatters.beautysh"),
		require("none-ls.formatting.ruff_format"),
	},
}
