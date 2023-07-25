local lspconfig = require("lspconfig")
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
local DEFAULT_SETTINGS = {
	ensure_installed = { "lua_ls", "volar", "jsonls", "quick_lint_js", "html", "rust_analyzer", "yamlls", "pyright" },
	automatic_installation = true,
}

require("mason-lspconfig").setup(DEFAULT_SETTINGS)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		-- Auto format after save
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd([[
                augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                augroup END
                ]])
		end
	end,
})

-- vim.diagnostic.config({
-- 	virtual_text = false,
-- })
--
-- vim.o.updatetime = 250
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- for _, lsp in pairs(DEFAULT_SETTINGS.ensure_installed) do
-- 	lspconfig[lsp].setup({
-- 		settings = {
-- 			Lua = {
-- 				diagnostics = {
-- 					globals = { "vim" },
-- 				},
-- 				workspace = {
-- 					library = vim.api.nvim_get_runtime_file("", true),
-- 					checkThirdParty = false,
-- 				},
-- 			},
-- 		},
-- 		flags = {
-- 			debounce_text_changes = 150,
-- 		},
-- 	})
-- end

-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
