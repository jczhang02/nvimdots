return function()
	vim.g.asyncrun_open = 10
	vim.g.asyncrun_rootmarks = { ".svn", ".git", ".root", "_darcs", "build.xml", ".pro" }
	vim.api.nvim_create_user_command("Rungnome", function(opts)
		vim.cmd('AsyncRun -mode=term -pos=gnome python "$(VIM_FILEPATH)"')
	end, {})
end
