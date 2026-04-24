return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = { "lua/?.lua", "lua/?/init.lua" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
				},
			},
			diagnostics = {
				globals = { "vim" },
				disable = { "missing-fields" },
			},
			hint = { enable = true },
			completion = { callSnippet = "Replace" },
			telemetry = { enable = false },
		},
	},
}
