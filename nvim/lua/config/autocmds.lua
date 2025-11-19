vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("organise_imports"),
  pattern = "*.ts",
  callback = function()
    vim.lsp.buf.code_action({ apply = true, context = { only = { "source.addMissingImports.ts" }, diagnostics = {} } })
    vim.lsp.buf.code_action({ apply = true, context = { only = { "source.removeUnused.ts" }, diagnostics = {} } })
  end,
})
