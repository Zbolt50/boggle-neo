return {
	-- vim-floaterm
	"voldikss/vim-floaterm",
	config = function()
	local keymap = vim.keymap
	-- stylua: ignore start
		keymap.set("n", "<leader>tt", ":FloatermNew<CR>", { desc = "Open floating terminal window", silent = true })
		--keymap.set("n", "t", "<C-q>", ":FloatermKill<CR>", { desc = "Kill floating terminal window"} )
	-- stylua ignore end
	end,
}
