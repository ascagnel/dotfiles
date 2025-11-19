-- global neovim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99

vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

vim.opt.wildignore = {
  "**/node_modules",
  "**/public",
  "**/dist",
  "**/coverage",
  "**/__generated__",
  "**/__snapshots__",
  "*/**/build"
}

vim.keymap.set('i', 'jj', '<Esc>', {
    noremap = true, silent = true
})
vim.keymap.set('i', 'jk', '<Esc>', {
    noremap = true, silent = true
})

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Disable virtual text (optional, if you only want the floating window)
vim.diagnostic.config({
    virtual_text = false,
})

-- Set a shorter updatetime for faster hover detection (default is 4000ms or 4s)
vim.o.updatetime = 250 -- milliseconds

-- Autocmd to open a floating window with diagnostics on CursorHold
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false })
    end
})

