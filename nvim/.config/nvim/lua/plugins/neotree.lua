return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { desc = "File explorer (Neotree)", noremap = true, silent = true })
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = false, -- don't show on open
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".github",
            ".gitignore",
            "package-lock.json",
            "node_modules",
          },
          never_show = { ".git" },
        },
      },
    })
  end,
}
