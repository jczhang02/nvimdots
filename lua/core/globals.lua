local os_name = vim.uv.os_uname().sysname

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0

local globals = {
	is_mac = os_name == "Darwin",
	is_linux = os_name == "Linux",
	is_windows = os_name == "Windows_NT",
	vim_path = vim.fn.expand("~/.config/nvim-0.12"),
	data_dir = vim.fn.stdpath("data"),
	cache_dir = vim.fn.stdpath("cache"),
	home = vim.env.HOME,
}

return globals
