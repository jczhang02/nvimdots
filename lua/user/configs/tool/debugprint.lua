local python = {
	left = 'print("',
	left_var = 'print(f"',
	right = '")',
	mid_var = "{",
	right_var = '.size()}")',
}

return function()
	require("debugprint").setup({
		filetypes = { ["python"] = python },
	})
end
