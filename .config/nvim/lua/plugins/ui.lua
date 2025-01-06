-- Plugins related to UI and status plugins
return {
	{
		-- dressing.nvim
		"stevearc/dressing.nvim",
	},
	{
		-- vim-airline
		"vim-airline/vim-airline",
		dependencies = {
			"vim-airline/vim-airline-themes",
		},
		config = function()
			vim.cmd("let g:netrw_liststyle = 3")
			vim.cmd("let g:airline_theme='blood_red'")
			vim.cmd("let g:airline_left_sep = ''")
			vim.cmd("let g:airline#extensions#lsp#enabled = 1")
		end,
	},
	{
		-- siva.nvim | by yours truly :7
		"Zbolt50/siva.nvim",
		--dir = '~/Projects/siva.nvim',
	},
	{
		-- nvim-notify
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},

	{
		-- snacks.nvim
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					-- stylua: ignore start 
				header = [[
         

                      █████                       
                     ████████                     
                   ████████████                   
                 ████████████████                 
               ████████████████████               
             ███████████ ███████████              
           ███████████     ███████████            
         ███████████         ███████████          
        ███████████            ███████████        
                 █            ███████████         
               ███          ███████████ ██        
             █████        ███████████ ████        
           ███████       ██████████ ██████        
         █████████       ████████ ████████        
       ███████████       ██████ ██████████        
       ██████████        █████ █████████          
       ████████          ███ █████████            
       ██████            █ █████████              
       ████              ██████████               
       ██                ████████                 
                         ██████                   
                         ████                     
                         ██                       
       
       consume. enhance. replicate.


                    ]],
					--stylua: ignore end
					keys = {
						{
							icon = " ",
							key = "f",
							desc = "Find File",
							action = ":lua Snacks.dashboard.pick('files')",
						},
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{
							icon = " ",
							key = "g",
							desc = "Find Text",
							action = ":lua Snacks.dashboard.pick('live_grep')",
						},
						{
							icon = " ",
							key = "r",
							desc = "Recent Files",
							action = ":lua Snacks.dashboard.pick('oldfiles')",
						},
						{ icon = " ", key = "p", desc = "Open Project", action = ":Telescope project" },
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = "", key = "m", desc = "Mason", action = ":Mason" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", padding = 1 },
					{ section = "startup" },
				},
			},
		},
	},
}
