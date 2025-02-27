return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tailwindcss",
          "ast_grep",
          "ts_ls",
          "rubocop"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconf = require("lspconfig")

      lspconf.lua_ls.setup({})
      lspconf.tailwindcss.setup({})
      lspconf.ast_grep.setup({})
      lspconf.ts_ls.setup({})
      lspconf.rubocop.setup({})

      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Actions", silent = true, noremap = true })
    end
  }
}
