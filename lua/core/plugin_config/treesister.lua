local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"javascript",
		"json",
		"lua",
		"tsx",
		"css",
		"vue",
		"html",
	}, -- one of "all" or a list of languages
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
	},
	rainbow = {
		enable = true,
		disable = {}, -- list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {}, -- table of hex strings
		termcolors = {}, -- table of colour name strings
	},
	indent = {
		enable = false,
		disable = {},
	},
	autotag = {
		enable = true,
		filetypes = { "html", "xml" },
	},
})

--vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--	underline = true,
--	virtual_text = {
--		spacing = 5,
--		severity_limit = "Warning",
--	},
--	update_in_insert = true,
--})
