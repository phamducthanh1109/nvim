local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "tabs", -- set to "tabs" to only show tabpages instead
		themable = false,
		numbers = "none",
		close_command = "Bdelete! %d", -- can be a string | function, | false see "Mouse actions"
		right_mouse_command = "", -- can be a string | function | false, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, | false
		indicator = {
			style = "none",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				separator = true,
			},
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		--show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
		show_close_icon = true,
		show_tab_indicators = false,
		show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = false,
	},
	highlights = {
		--offset_separator = {
		--	fg = "red",
		--	bg = "#ffffff",
		--},
	},
})
