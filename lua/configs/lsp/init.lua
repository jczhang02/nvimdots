local settings = require("core.settings")

-- Diagnostic UI — tiny-inline-diagnostic renders the inline text, so we
-- disable the built-in virtual_text/virtual_lines to avoid duplicate display.
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
})

-- Merge blink.cmp capabilities into default capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

-- Per-server configuration
for _, name in ipairs(settings.lsp_servers) do
	local ok, overrides = pcall(require, "configs.lsp." .. name)
	local config = ok and overrides or {}
	config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
	vim.lsp.config(name, config)
end

vim.lsp.enable(settings.lsp_servers)

-- Shared on_attach via LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		-- Disable semantic tokens (user preference — old config: user/event.lua)
		client.server_capabilities.semanticTokensProvider = nil

		-- Respect server_formatting_block_list
		if settings.server_formatting_block_list[client.name] then
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end
		-- Navigation via Glance (falls back to native gd)
		map("n", "gd", "<cmd>Glance definitions<CR>", "Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		map("n", "gr", "<cmd>Glance references<CR>", "References")
		map("n", "gi", "<cmd>Glance implementations<CR>", "Implementation")
		map("n", "gy", "<cmd>Glance type_definitions<CR>", "Type definition")

		-- Hover / rename / code action via Lspsaga
		map("n", "K", "<cmd>Lspsaga hover_doc<CR>", "Hover")
		map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "Rename")
		map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", "Code action")

		-- Diagnostics
		map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line diagnostics")
		map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev diagnostic")
		map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next diagnostic")
		map("n", "<leader>cf", function()
			require("conform").format({ bufnr = bufnr, lsp_format = "fallback" })
		end, "Format")

		-- Signature help in insert mode (native 0.11+)
		if client.server_capabilities.signatureHelpProvider then
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
		end
	end,
})
