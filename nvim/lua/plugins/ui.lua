return {
    {
        'nvim-mini/mini.sessions',
        version = '*',
        opts = {
            autoread = true,
            autowrite = true,
        }
    },
    {
        'nvim-mini/mini.starter',
        version = '*',
        config = function()
            local starter = require('mini.starter')
            starter.setup({
                evaluate_single = true,
                autoopen = true,
                items = {
                    starter.sections.builtin_actions(),
                    starter.sections.recent_files(10, false),
                    starter.sections.recent_files(10, true),
                    -- Use this if you set up 'mini.sessions'
                    starter.sections.sessions(5, true)
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(),
                    starter.gen_hook.indexing('all', { 'Builtin actions' }),
                    starter.gen_hook.padding(3, 2),
                },
            })
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            auto_attach = true,
            signs_staged_enable = false,
        },
        config = function()
            require("gitsigns").setup {
                auto_attach = true,
                signs_staged_enable = false,
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk)
                    map('n', '<leader>hr', gitsigns.reset_hunk)

                    map('v', '<leader>hs', function()
                        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)

                    map('v', '<leader>hr', function()
                        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)

                    map('n', '<leader>hS', gitsigns.stage_buffer)
                    map('n', '<leader>hR', gitsigns.reset_buffer)
                    map('n', '<leader>hp', gitsigns.preview_hunk)
                    map('n', '<leader>hi', gitsigns.preview_hunk_inline)
                end
            }
        end,
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "nvim-mini/mini.icons" },
        lazy = false,
        opts = {},
        keys = {
            {
                "<C-p>",
                function()
                    require('fzf-lua').global()
                end,
                desc = "Global search"
            },
            {
                "<C-b>",
                function()
                    require('fzf-lua').buffers()
                end,
                desc = "Buffer search",
            },
            {
                "gd",
                function()
                    require('fzf-lua').lsp_definitions()
                end,
                desc = "Go to definition"
            },
            {
                "gr",
                function()
                    require('fzf-lua').lsp_references()
                end,
                desc = "Go to references"
            },
            {
                "fi",
                function()
                    require('fzf-lua').live_grep_native()
                end,
                noremap = true,
                desc = "Live grep",
            },
        },
    },
    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "ibhagwan/fzf-lua", -- optional
        },
        cmd = "Neogit",
        keys = {
            {
                "<leader>gg",
                function()
                    require('neogit')
                end,
                desc = "Show Neogit UI"
            }
        }
    },
    {
        "mikavilpas/yazi.nvim",
        version = "*", -- use the latest stable version
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
            -- 👇 in this section, choose your own key mappings!
            {
                "<leader>-",
                mode = { "n", "v" },
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
            {
                -- Open in the current working directory
                "<leader>cw",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
            {
                "<c-up>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
        },
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            keymaps = {
                show_help = "<f1>",
            },
        },
        -- 👇 if you use `open_for_directories=true`, this is recommended
        init = function()
            -- mark netrw as loaded so it's not loaded at all.
            --
            -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
            vim.g.loaded_netrwPlugin = 1
        end,
    },
}
