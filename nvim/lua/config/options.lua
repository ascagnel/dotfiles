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
