-- Create an augroup for numbertoggle
vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- Auto command to set relative number when entering a buffer or gaining focus
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
  group = "numbertoggle",
  callback = function()
    if vim.wo.nu and vim.fn.mode() ~= "i" then
      vim.wo.rnu = true
    end
  end
})

-- Auto command to disable relative number when leaving a buffer or losing focus
vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
  group = "numbertoggle",
  callback = function()
    if vim.wo.nu then
      vim.wo.rnu = false
    end
  end
})
