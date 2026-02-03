return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "tsgo", "lua_ls", "graphql", "eslint" },
        automatic_enable = { "tsgo", "lua_ls", "graphql", "eslint" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
