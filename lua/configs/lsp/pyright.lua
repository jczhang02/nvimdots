-- Python LSP via Delance (Pyright fork with Pylance-compatible features).
-- Binary: delance-langserver (install: `npm i -g @deland/language-server`
-- or build from https://github.com/microsoft/pyright-delance).
local new_capability = {
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
			disableOrganizeImports = true,
			disableTaggedHints = false,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
				diagnosticSeverityOverrides = {
					deprecateTypingAliases = false,
				},
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
