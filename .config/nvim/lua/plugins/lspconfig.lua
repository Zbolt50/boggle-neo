return {
	{
		-- nvim-lspconfig | rip null-ls
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			lspconfig["clangd"].setup({
				capabilities = capabilities,
			})
			lspconfig["pyright"].setup({
				capabilities = capabilities,
			})
			lspconfig["texlab"].setup({
				capabilities = capabilities,
			})
		end,
	},

	{
		-- mason.nvim | the numbers mason..
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local mason = require("mason")
			local masonlspconfig = require("mason-lspconfig")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			masonlspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"bashls",
					"clangd",
				},
				automatic_installation = true,
			})
		end,
	},
}
