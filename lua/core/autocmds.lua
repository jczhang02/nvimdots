-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("UserYankHighlight", { clear = true }),
	callback = function()
		if vim.hl then
			vim.hl.on_yank({ higroup = "IncSearch", timeout = 300 })
		else
			vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
		end
	end,
})

-- Restore cursor position on file open
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("UserRestoreCursor", { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Close helper windows with q
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserCloseWithQ", { clear = true }),
	pattern = {
		"qf",
		"help",
		"man",
		"lspinfo",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<Cmd>close<CR>", { buffer = event.buf, silent = true, nowait = true })
	end,
})

-- Auto-resize splits on VimResized
vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("UserResizeSplits", { clear = true }),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- Disable relativenumber in insert mode; re-enable in normal mode
local rnu_group = vim.api.nvim_create_augroup("UserRelativeNumber", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
	group = rnu_group,
	callback = function()
		if vim.wo.relativenumber then
			vim.wo.relativenumber = false
		end
	end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
	group = rnu_group,
	callback = function()
		if vim.wo.number then
			vim.wo.relativenumber = true
		end
	end,
})

-- Commit messages: no persistent undo
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("UserCommitNoUndofile", { clear = true }),
	pattern = "COMMIT_EDITMSG",
	callback = function()
		vim.opt_local.undofile = false
	end,
})

-- Soft wrap for prose filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserProseWrap", { clear = true }),
	pattern = { "markdown", "tex", "bib" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("UserTrimWhitespace", { clear = true }),
	callback = function()
		local ft = vim.bo.filetype
		-- Skip filetypes where trailing whitespace is meaningful
		if ft == "markdown" or ft == "diff" then
			return
		end
		local view = vim.fn.winsaveview()
		vim.cmd([[keeppatterns %s/\s\+$//e]])
		vim.fn.winrestview(view)
	end,
})
