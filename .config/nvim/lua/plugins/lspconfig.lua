return {
	{
		-- nvim-lspconfig | rip null-ls
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				opts.buffer = bufnr
				opts.desc = "Show LSP refs"
			end
			local capabilities = cmp_nvim_lsp.default_capabilities()
			-- lua server
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom Lua settings
					Lua = {
						-- make the lsp recognize the VIM lsp
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			-- C langs server
			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- pyright server
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
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
