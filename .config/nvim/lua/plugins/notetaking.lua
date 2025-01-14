return {

	-- obsidian.nvim
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = false,
		ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",

			-- see below for full list of optional dependencies 👇
		},
		config = function()
			local obsidian = require("obsidian")
			obsidian.setup({
				workspaces = {
					{
						name = "School",
						path = "~/Documents/Vaults/School/",
						strict = true,
					},
				},
				completion = {
					-- Set to false to disable completion.
					nvim_cmp = true,
					-- Trigger completion at 2 chars.
					min_chars = 2,
				},
				new_notes_location = "current_dir",
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
				open_notes_in = "current",
				templates = {
					folder = "~/Documents/Vaults/Templates/",
					date_format = "%Y-%m-%d-%a",
				},
				vim.keymap.set(
					"n",
					"<leader>oo",
					":ObsidianOpen<CR>",
					{ desc = "Opens Current Note in Obsidian", silent = true }
				),
				vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "New Obsidian Note" }),
				vim.keymap.set(
					"n",
					"<leader>ot",
					":ObsidianNewFromTemplate<CR>",
					{ desc = "New Obsidian Note From a Template" }
				),
			})
		end,
	},
}
