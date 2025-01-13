return {
	-- Plugins needed to keep me from switching to VSCode (No I am not using EMACS)

	{
		-- undotree | for those times when git isn't an option
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
}
