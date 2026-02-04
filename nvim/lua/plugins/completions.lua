return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local luasnip = require('luasnip')
            vim.keymap.set({ "i" }, "<C-K>", function() luasnip.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function() luasnip.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() luasnip.jump(-1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if luasnip.choice_active() then
                    luasnip.change_choice(1)
                end
            end, { silent = true })
        end,
    },
    {
        'saghen/blink.cmp',
        -- `main` is untested, please open a PR if you've confirmed it works as expected
        dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        version = '1.*',
        -- build = "cargo build --release",
        opts = {
            fuzzy = {
                implementation = "lua",
                prebuilt_binaries = {
                    download = true,
                }
            },
            snippets = { preset = 'luasnip' },
            -- ensure you have the `snippets` source (enabled by default)
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            keymap = { preset = 'default' },
            appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = 'mono' },
        }
    },
}
