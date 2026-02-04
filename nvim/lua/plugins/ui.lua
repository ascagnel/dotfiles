return {
    {
        'nvim-mini/mini.sessions',
        version = '*',
        opts = {
            -- autoread = true,
            autowrite = true,
        }
    },
    --[[
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
                    starter.sections.sessions(5, true),
                    starter.sections.recent_files(5, false),
                    starter.sections.recent_files(5, true),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(),
                    starter.gen_hook.indexing('all', { 'Builtin actions' }),
                    starter.gen_hook.padding(3, 2),
                },
            })
        end,
    },
    ]]
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            dashboard = {}
        }
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
        'tanvirtin/vgit.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
        -- Lazy loading on 'VimEnter' event is necessary.
        event = 'VimEnter',
        config = function() require("vgit").setup() end,
    },
    {
        'tpope/vim-fugitive',
        -- You can add optional configurations here if needed,
        -- for example, setting up keybindings or autocommands.
        -- event = "BufReadPost", -- Example: load Fugitive only when a buffer is read
        -- config = function()
        --   -- Custom Fugitive configuration
        -- end,
    },
    {
        "folke/snacks.nvim",
        opts = {},
        keys = {
            { "<leader>gi", function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
            { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
            { "<leader>gp", function() Snacks.picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
            { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
        },
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
            "TmuxNavigatorProcessList",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
}
