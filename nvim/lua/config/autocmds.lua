vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("organise_imports", { clear = true }),
    pattern = { "*.ts", "*.tsx" },
    callback = function(args)
        local bufnr = args.buf
        local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "ts_ls" })
        if #clients == 0 then
            return
        end
        local client = clients[1]

        local function apply_code_action(action_kind)
            local params = vim.lsp.util.make_range_params()
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

        apply_code_action("source.addMissingImports.ts")
        apply_code_action("source.removeUnused.ts")
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
    callback = function(args)
        local opts = { buffer = args.buf, noremap = true, silent = true }
        vim.keymap.set('n', '<leader>fix', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>d', vim.lsp.buf.hover, opts)
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
    pattern = "*.lua",
    callback = function(args)
        if not (args.data and args.data.client_id) then
            return
        end

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf })
                end,
            })
        end
    end,
})
