-- leader keys must be set before lazy.nvim loads any plugin
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- netrw
vim.g.netrw_liststyle = 3

-- python providers
local conda_prefix = vim.env.CONDA_PREFIX
if conda_prefix and conda_prefix ~= "" then
	vim.g.python_host_prog = vim.g.python_host_prog or (conda_prefix .. "/bin/python")
	vim.g.python3_host_prog = vim.g.python3_host_prog or (conda_prefix .. "/bin/python")
else
	vim.g.python_host_prog = vim.g.python_host_prog or "python"
	vim.g.python3_host_prog = vim.g.python3_host_prog or "python3"
end

-- options
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.breakat = [[ \	;:,!?@*-+/]]
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.cmdwinheight = 5
vim.opt.complete = ".,w,b,k,kspell"
vim.opt.completeopt = "fuzzy,menuone,noselect,popup"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience"
vim.opt.display = "lastline"
vim.opt.encoding = "utf-8"
vim.opt.equalalways = false
vim.opt.errorbells = true
vim.opt.fileencodings = "ucs-bom,utf-8,default,big5,latin1"
vim.opt.fileformats = "unix,mac,dos"
vim.opt.foldlevelstart = 99
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"
vim.opt.helpheight = 12
vim.opt.hidden = true
vim.opt.history = 2000
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.infercase = true
vim.opt.jumpoptions = "stack,view"
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
vim.opt.magic = true
vim.opt.mousescroll = "ver:3,hor:6"
vim.opt.previewheight = 12
vim.opt.pumblend = 0
vim.opt.pumheight = 15
vim.opt.redrawtime = 1500
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winpos,winsize"
vim.opt.shada = "!,'500,<50,@100,s10,h"
vim.opt.shiftround = true
vim.opt.shortmess = "aoOTIcF"
vim.opt.showbreak = "↳  "
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 5
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.smoothscroll = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.startofline = false
vim.opt.swapfile = false
vim.opt.switchbuf = "usetab,uselast"
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0
vim.opt.undofile = true
vim.opt.updatetime = 200
vim.opt.viewoptions = "folds,cursor,curdir,slash,unix"
vim.opt.virtualedit = "block"
vim.opt.visualbell = true
vim.opt.whichwrap = "h,l,<,>,[,],~"
vim.opt.wildignore =
	".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
vim.opt.wildignorecase = true
vim.opt.winblend = 0
vim.opt.winminwidth = 10
vim.opt.winwidth = 30
vim.opt.wrapscan = true
vim.opt.writebackup = true

-- buffer-local defaults (set globally so they apply to all new buffers)
vim.opt.autoindent = true
vim.opt.breakindentopt = "shift:2,min:20"
vim.opt.concealcursor = "niv"
vim.opt.conceallevel = 0
vim.opt.expandtab = true
vim.opt.foldenable = true
vim.opt.formatoptions = "1jcroql"
vim.opt.linebreak = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.softtabstop = 4
vim.opt.synmaxcol = 2500
vim.opt.tabstop = 4
vim.opt.textwidth = 80
vim.opt.wrap = false

-- 0.12 native defaults
vim.o.winborder = "rounded"

-- diagnostics (§5.3)
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { current_line = true },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
})
