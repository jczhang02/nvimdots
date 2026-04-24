require("debugprint").setup({
	filetypes = {
		["python"] = {
			left = 'print("',
			left_var = 'print(f"',
			right = '")',
			mid_var = "{",
			right_var = '.size()}")',
		},
	},
})
