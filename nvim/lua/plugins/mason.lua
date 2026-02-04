return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "tsgo", "lua_ls", "graphql", "gopls" },
        automatic_enable = { "tsgo", "lua_ls", "graphql", "gopls" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        {
            "neovim/nvim-lspconfig",
            config = function()
                vim.api.nvim_create_autocmd("LspAttach", {
                    group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
                    callback = function(args)
                        local opts = { buffer = args.buf, noremap = true, silent = true }
                        vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover, opts)
                        vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
                        vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
                        vim.keymap.set('n', '<leader>fix', function()
                            local file = vim.api.nvim_buf_get_name(0)
                            vim.cmd('write')
                            vim.fn.system({ 'eslint_d', '--fix', file })
                            vim.cmd('edit')
                        end, opts)
                    end,
                })

                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("ts_format", { clear = true }),
                    pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
                    callback = function(args)
                        local bufnr = args.buf
                        local file = vim.api.nvim_buf_get_name(bufnr)

                        -- Run eslint_d fix via stdin
                        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
                        local input = table.concat(lines, "\n")
                        local output = vim.fn.system({ 'eslint_d', '--stdin', '--stdin-filename', file, '--fix-to-stdout' }, input)
                        if vim.v.shell_error == 0 and output ~= input then
                            local new_lines = vim.split(output, "\n", { plain = true })
                            if new_lines[#new_lines] == "" then
                                table.remove(new_lines)
                            end
                            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
                        end

                        -- Run tsgo code actions
                        local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "tsgo" })
                        if #clients == 0 then
                            return
                        end
                        local client = clients[1]

                        if not client.server_capabilities.codeActionProvider then
                            return
                        end

                        local function apply_code_action(action_kind)
                            local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
                            params.context = { only = { action_kind }, diagnostics = {} }
                            local result = client:request_sync("textDocument/codeAction", params, 3000, bufnr)
                            if result and result.result and #result.result > 0 then
                                local action = result.result[1]
                                if action.edit then
                                    vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
                                elseif action.command then
                                    vim.lsp.buf.execute_command(action.command)
                                end
                            end
                        end

                        apply_code_action("source.fixAll")
                        apply_code_action("source.addMissingImports.ts")
                        apply_code_action("source.removeUnused.ts")
                        apply_code_action("source.organizeImports")
                    end,
                })

                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("go_format", { clear = true }),
                    pattern = { "*.go" },
                    callback = function(args)
                        local bufnr = args.buf
                        local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "gopls" })
                        if #clients == 0 then
                            return
                        end
                        vim.lsp.buf.format({ bufnr = bufnr, async = false })
                    end,
                })
            end,
        },
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
