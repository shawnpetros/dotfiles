return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", function()
				builtin.find_files({
					hidden = true,
				})
			end, { desc = "Telescope find files (incl. hidden)" })
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({
					hidden = true,
				})
			end, { desc = "Telescope find files (incl. hidden)" })
			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep({
					additional_args = function()
            return {"--hidden"}
          end
				})
			end, { desc = "Telescope live grep (incl. hidden)" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>td", builtin.diagnostics, { desc = "Telescope diagnostics" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" }
        }
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
