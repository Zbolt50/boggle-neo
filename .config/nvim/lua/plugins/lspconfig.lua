return {
	{
		-- nvim-lspconfig | rip null-ls
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig["lua_ls"].setup({ capabilities = capabilities })
			lspconfig["bashls"].setup({ capabilities = capabilities })
			lspconfig["clangd"].setup({ capabilities = capabilities })
			lspconfig["pyright"].setup({ capabilities = capabilities })
			lspconfig["texlab"].setup({ capabilities = capabilities })
			lspconfig["marksman"].setup({ capabilities = capabilities })
			lspconfig["r_language_server"].setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
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
					"marksman",
					"texlab",
				},
				automatic_installation = true,
			})
		end,
	},
}
