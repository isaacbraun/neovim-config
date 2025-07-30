return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set("n", "<leader>pg", function()
				local git_files = vim.fn.systemlist("git ls-files")
				if #git_files == 0 then
					print("No git files found!")
					return
				end
				builtin.live_grep({
					prompt_title = "Grep in Git Files",
					search_dirs = git_files,
				})
			end)
		end,
	},
}
