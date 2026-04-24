require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.30
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.40
		end
		return 15
	end,
	on_open = function()
		vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
		vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
	end,
	highlights = {
		Normal = { link = "Normal" },
		NormalFloat = { link = "NormalFloat" },
		FloatBorder = { link = "FloatBorder" },
	},
	open_mapping = false,
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = false,
	shading_factor = "1",
	start_in_insert = true,
	persist_mode = false,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
})
