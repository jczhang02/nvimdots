local new_capability = {
	-- this will remove some of the diagnostics that duplicates those from ruff, idea taken and adapted from
	-- here: https://github.com/astral-sh/ruff-lsp/issues/384#issuecomment-1989619482
	textDocument = {
		publishDiagnostics = {
			tagSupport = {
				valueSet = { 2 },
			},
		},
		hover = {
			contentFormat = { "plaintext" },
			dynamicRegistration = true,
		},
	},
}
return {
	cmd = { "delance-langserver", "--stdio" },
	settings = {
		pyright = {
			-- disable import sorting and use Ruff for this
			disableOrganizeImports = true,
			disableTaggedHints = false,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
				-- we can this setting below to redefine some diagnostics
				diagnosticSeverityOverrides = {
					deprecateTypingAliases = false,
				},
				-- inlay hint settings are provided by pylance?
				inlayHints = {
					callArgumentNames = "partial",
					functionReturnTypes = true,
					pytestParameters = true,
					variableTypes = true,
				},
			},
		},
	},
	capabilities = new_capability,
}
