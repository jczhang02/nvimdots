vim.g.asyncrun_open = 10
vim.g.asyncrun_rootmarks = { ".svn", ".git", ".root", "_darcs", "build.xml", ".pro" }
vim.g.VimuxHeight = "20"
vim.cmd([[let g:VimuxCloseOnExit = 1]])

vim.api.nvim_create_user_command("Rungnome", function()
	vim.cmd('AsyncRun -mode=term -pos=gnome python "$(VIM_FILEPATH)"')
end, {})

vim.api.nvim_create_user_command("Pytest", function(opts)
	local args = opts.args
	vim.cmd('AsyncRun -mode=term -pos=gnome -cwd="$(VIM_ROOT)" pytest ' .. args .. ' "$(VIM_FILEPATH)"')
end, { nargs = "*" })
