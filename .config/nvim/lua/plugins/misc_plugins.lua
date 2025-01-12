return {
	-- nvim-colorizer | useful for like 3 things I use
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			-- set to setup table
		},
	},
	-- obsidian.nvim
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		require("obsidian").setup({
			workspaces = {
				{
					name = "Personal",
					path = "~/Documents/Vaults/Personal/",
				},
				{
					name = "School",
					path = "~/Documents/Vaults/School/",
				},
				{
					name = "Work",
					path = "~/Documents/Vaults/Work/",
				},
			},
		}),
	},
}
