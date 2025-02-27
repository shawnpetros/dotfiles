vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- some qol upgrades
require("autocmds")
