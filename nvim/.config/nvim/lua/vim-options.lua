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

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = "Turn off search hl" })

vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = "Switch to window left", noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = "Switch to window down", noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = "Switch to window up", noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = "Switch to window right", noremap = true, silent = true })

vim.keymap.set('n', '<C-->', ':vsplit<CR>', { desc = "Switch to window up", noremap = true, silent = true })
vim.keymap.set('n', '<C-\\>', ':split k<CR>', { desc = "Switch to window up", noremap = true, silent = true })

vim.keymap.set('n', '<M-h>', '0', { desc = "Beginning of line", noremap = true, silent = true })
vim.keymap.set('n', '<M-l>', '$', { desc = "End of line", noremap = true, silent = true })

-- some qol upgrades
require("autocmds")
