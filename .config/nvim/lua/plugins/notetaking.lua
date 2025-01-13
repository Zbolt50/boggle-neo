return {

	-- obsidian.nvim
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		config = function()
			local obsidian = require("obsidian")
			obsidian.setup({
				workspaces = {
					{
						name = "Personal",
						path = "~/Documents/Vaults/Personal/",
						strict = true,
					},
					{
						name = "School",
						path = "~/Documents/Vaults/School/",
						strict = true,
					},
					{
						name = "Work",
						path = "~/Documents/Vaults/Work/",
						strict = true,
					},
				},
				completion = {
					-- Set to false to disable completion.
					nvim_cmp = true,
					-- Trigger completion at 2 chars.
					min_chars = 2,
				},
				picker = {
					-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
					name = "telescope.nvim",
					-- Optional, configure key mappings for the picker. These are the defaults.
					-- Not all pickers support all mappings.
					note_mappings = {
						-- Create a new note from your query.
						new = "<C-x>",
						-- Insert a link to the selected note.
						insert_link = "<C-l>",
					},
					tag_mappings = {
						-- Add tag(s) to current note.
						tag_note = "<C-x>",
						-- Insert a tag at the current location.
						insert_tag = "<C-l>",
					},
				},
			})
		end,
	},
}
