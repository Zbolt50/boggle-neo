return {
	-- Plugins needed to keep me from switching to VSCode (No I am not using EMACS)
	{
		-- Treesitter
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/playground",
		},
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"c",
					"cpp",
					"python",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"html",
					"css",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		-- ;neo-tree.nvim | not to be confused with nvimtree
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				auto_clean_after_session_restore = false, -- Automatically clean up broken neo-tree buffers saved in sessions
				source_selector = {
					winbar = true,
				},
				filesystem = {
					bind_to_cwd = true,
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = true,
						hide_by_name = {
							-- add extensions to explicitly hide
							".DS_Store",
						},
						never_show = {},
					},
				},
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
					--               -- the current file is changed while the tree is open.
					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
				},
				default_component_configs = {
					name = {
						use_git_status_colors = false,
					},
				},
				window = {
					color_set = "siva",
				},
			})
			vim.keymap.set("n", "<leader>n", function()
				vim.cmd([[Neotree toggle]])
			end)
		end,
	},
	{
		-- telescope.nvim | this thing is pretty much a dependency at this point
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		config = function()
			local keymap = vim.keymap
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			telescope.load_extension("project")
			telescope.setup({
				pickers = {
					find_files = {
						hidden = true,
						-- needed to exclude some files & dirs from general search
						-- when not included or specified in .gitignore
						find_command = {
							"rg",
							"--files",
							"--hidden",
							"--glob=!**/.git/*",
							"--glob=!**/.gitignore",
							"--glob=!**/.github",
							"--glob=!**/.idea/*",
							"--glob=!**/.vscode/*",
							"--glob=!**/build/*",
							"--glob=!**/dist/*",
							"--glob=!**/yarn.lock",
							"--glob=!**/package-lock.json",
						},
					},
					live_grep = {
						additional_args = function()
							return { "--hidden", "--glob", "!**/.git/*" }
						end,
					},
					grep_string = {
						additional_args = function()
							return { "--hidden", "--glob", "!**/.git/*" }
						end,
					},
					projects = {
						additional_args = function()
							return { "--hidden", "--glob", "!**/.git/*" }
						end,
					},
				},
			})
			keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
			keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope find string in cwd" })
			keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Telescope find string under cursor in cwd" })
			keymap.set("n", "<leader>fp", ":Telescope project<CR>", { desc = "Telescope find project" })
		end,
	},
	{
		-- vim-floaterm
		"voldikss/vim-floaterm",
		config = function()
			local keymap = vim.keymap
			keymap.set("n", "<leader>tt", ":FloatermNew<CR>", { desc = "Open floating terminal window" })
			keymap.set("n", "<leader>tq", ":FloatermKill<CR>", { desc = "Kill floating terminal window" })
		end,
	},
	{
		-- undotree | for those times when git isn't an option
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
}
