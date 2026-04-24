return {
	settings = {
		schemas = {
			["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			["https://json.schemastore.org/pre-commit-config.json"] = "/.pre-commit-config.*",
			["https://json.schemastore.org/catalog-info.json"] = ".backstage/*.yaml",
			["https://raw.githubusercontent.com/iterative/dvcyaml-schema/master/schema.json"] = "**/dvc.yaml",
			["https://json.schemastore.org/swagger-2.0.json"] = "**/swagger.yaml",
		},
	},
}
