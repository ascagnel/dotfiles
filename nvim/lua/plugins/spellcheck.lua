return {
    {
        "ravibrock/spellwarn.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        "psliwka/vim-dirtytalk",
        build = ":DirtytalkUpdate",
        config = function()
            vim.opt.spell = true
            vim.opt.spelllang = { "en", "programming" }
            vim.opt.spelloptions:append("camel")
            vim.opt.spellcapcheck = ""
        end,
    }
}
