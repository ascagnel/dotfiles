local luasnip = require('luasnip')

vim.keymap.set(
    'n',
    '<leader>fix', function() vim.lsp.buf.code_action() end, {
        noremap = true, silent = true
    })

vim.keymap.set(
    'n',
    '<leader>d', function() vim.lsp.buf.hover() end, {
        noremap = true, silent = true
    })
