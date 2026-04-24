-- Save / Quit
vim.keymap.set("n", "<leader>w", "<Cmd>write<CR>", { noremap = true, silent = true, desc = "edit: Save file" })
vim.keymap.set("n", "<leader>q", "<Cmd>quit<CR>", { noremap = true, silent = true, desc = "edit: Quit" })

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "edit: Clear search highlight" })

-- Better up / down (respect wrapped lines when no count given)
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, silent = true, expr = true, desc = "edit: Move down (wrapped-aware)" })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, silent = true, expr = true, desc = "edit: Move up (wrapped-aware)" })

-- Insert-mode escape
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "edit: Escape insert mode" })

-- Center cursor on scroll / search
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "edit: Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "edit: Scroll up and center" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "edit: Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "edit: Prev search result (centered)" })

-- Indent in visual mode and keep selection
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "edit: Decrease indent" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "edit: Increase indent" })

-- Move lines up / down in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "edit: Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "edit: Move selection up" })

-- Move lines up / down in normal mode
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<CR>==", { noremap = true, silent = true, desc = "edit: Move line down" })
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<CR>==", { noremap = true, silent = true, desc = "edit: Move line up" })

-- Buffer operations
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { noremap = true, silent = true, desc = "buffer: Delete current" })
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>", { noremap = true, silent = true, desc = "buffer: Next" })
vim.keymap.set("n", "<leader>bp", "<Cmd>bprevious<CR>", { noremap = true, silent = true, desc = "buffer: Previous" })
