vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("organise_imports"),
    pattern = "*.ts",
    callback = function()
        vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" }, diagnostics = {} } })
        vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnused.ts" }, diagnostics = {} } })
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
                    vim.lsp.buf.format({ bufnr = args.buf, async = true })
                end,
            })
        end
    end,
})
