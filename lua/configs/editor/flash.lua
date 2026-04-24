vim.api.nvim_set_hl(0, "FlashLabel", {
	underline = true,
	bold = true,
	fg = "Orange",
	bg = "NONE",
	ctermfg = "Red",
	ctermbg = "NONE",
})

local flash = require("flash")

flash.setup({
	labels = "asdfghjklqwertyuiopzxcvbnm",
	label = {
		uppercase = true,
		current = true,
		distance = true,
	},
	modes = {
		search = { enabled = false },
		char = {
			enabled = true,
			autohide = false,
			jump_labels = false,
			multi_line = true,
			label = { exclude = "hjkliardc" },
		},
	},
})

-- Keymaps
vim.keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash jump" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash treesitter" })

vim.keymap.set("o", "r", function()
	flash.remote()
end, { desc = "Flash remote" })

vim.keymap.set({ "o", "x" }, "R", function()
	flash.treesitter_search()
end, { desc = "Flash treesitter search" })

vim.keymap.set("c", "<C-s>", function()
	flash.toggle()
end, { desc = "Flash toggle (cmdline)" })
