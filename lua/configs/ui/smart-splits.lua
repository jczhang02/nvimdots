require("smart-splits").setup({
	default_amount = 3,
	ignored_buftypes = {
		"nofile",
		"quickfix",
		"prompt",
	},
	ignored_filetypes = { "NvimTree" },
})

-- Navigate between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })

-- Resize splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize split left" })
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize split down" })
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize split up" })
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize split right" })
