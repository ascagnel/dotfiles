return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
	    ensure_installed = { "ts_ls", "lua_ls", "graphql" },
        automatic_enable = { "ts_ls" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}    
