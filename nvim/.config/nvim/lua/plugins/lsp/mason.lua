return {
    "mason-org/mason.nvim",
    lazy = false,
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        -- import mason and mason_lspconfig
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            automatic_enable = false,
            -- servers for mason to install
            ensure_installed = {
                "astro",
                "bashls",
                "clangd",
                "cssls",
                "dockerls",
                "emmet_language_server",
                "gopls",
                "graphql",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "prismals",
                "pyright",
                "rust_analyzer",
                "sqls",
                "svelte",
                "tailwindcss",
                "ts_ls",
                "yamlls",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "biome",
                "prettier",
                "stylua",
                "isort",
                "pylint",
            },
        })
    end,
}
