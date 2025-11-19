local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        -- If completion menu is visible, select the next item.
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
      elseif luasnip.expandable() then
        -- If a snippet is expandable, expand it.
        luasnip.expand()
      else
        -- Otherwise, perform a normal tab (e.g., for indentation).
        fallback()
      end
    end, { 'i', 's' }), -- 'i' for insert mode, 's' for select mode
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        -- If completion menu is visible, select the previous item.
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
      elseif luasnip.jumpable(-1) then
        -- If a snippet has previous jump points, jump to the previous one.
        luasnip.jump(-1)
      else
        -- Otherwise, perform a normal shift-tab.
        fallback()
      end
    end, { 'i', 's' }),
    -- Add other mappings as needed, for example, to accept suggestions with Enter or Ctrl-Y
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected suggestion with Enter
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept selected suggestion with Ctrl-Y
  },
  -- Other nvim-cmp configuration options go here
})

vim.keymap.set(
    'n',
    '<leader>fix', function () vim.lsp.buf.code_action() end, {
    noremap = true, silent = true
})

vim.keymap.set(
    'n',
    '<leader>d', function () vim.lsp.buf.hover() end, {
    noremap = true, silent = true
})

