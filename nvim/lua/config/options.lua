-- global neovim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = false
vim.opt.wrap = false
vim.opt.timeoutlen = 1000

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

-- Define the directories
-- Use vim.fn.stdpath('cache') to put them in a standard cache location
local swapdir = vim.fn.stdpath('cache') .. "/swap//"
local backupdir = vim.fn.stdpath('cache') .. "/backup//"

-- Create the directories if they don't exist
if vim.fn.isdirectory(swapdir) == 0 then
    vim.fn.mkdir(swapdir, "p", "0o700")
end
if vim.fn.isdirectory(backupdir) == 0 then
    vim.fn.mkdir(backupdir, "p", "0o700")
end

-- Set the Neovim options
vim.opt.directory = swapdir
vim.opt.backupdir = backupdir

-- Enable the features (optional, they are often on by default)
vim.opt.swapfile = true
vim.opt.backup = true

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

