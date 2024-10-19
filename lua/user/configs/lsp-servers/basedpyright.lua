return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	settings = {
		basedpyright = {
			-- pythonPath = vim.fn.exepath("python"),
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace", -- openFilesOnly, workspace
				typeCheckingMode = "standard",
				useLibraryCodeForTypes = true,
				diagnosticSeverityOverrides = {
					reportGeneralTypeIssues = "none",
					reportUnboundVariable = false,
					strictParameterNoneValue = false,
				},
				stubPath = vim.fn.stdpath("data") .. "/site/lazy/python-type-stubs",
				inlayHints = {
					functionReturnTypes = true,
					pytestParameters = true,
					variableTypes = true,
					callArgumentNames = "partial",
				},
			},
		},
	},
	single_file_support = true,
}
