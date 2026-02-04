return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "ts_ls", "lua_ls", "graphql" },
        automatic_enable = { "ts_ls", "lua_ls", "graphql" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        {
            "mfussenegger/nvim-lint",
            event = { "BufReadPre", "BufNewFile" },
            dependencies = {
                {
                    "rshkarin/mason-nvim-lint",
                    opts = {
                        ensure_installed = { "eslint_d" },
                    },
                },
            },
            config = function()
                local lint = require("lint")

                lint.linters_by_ft = {
                    javascript = { "eslint_d" },
                    typescript = { "eslint_d" },
                    javascriptreact = { "eslint_d" },
                    typescriptreact = { "eslint_d" },
                }

                vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
                    group = vim.api.nvim_create_augroup("lint", { clear = true }),
                    callback = function()
                        lint.try_lint()
                    end,
                })
            end,
        },
    },
}
