return {
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
                    package_uninstalled = "✗"
                }
            }
        })
        masonlspconfig.setup({
            ensure_installed = {
                "html",
                "cssls",
                "lua_ls",
                "pyright",
                "bashls",
                "clangd",
            },
            automatic_installation = true,
        })
    end
}
