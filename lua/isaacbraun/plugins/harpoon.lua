--1 https://github.com/ThePrimeagen/harpoon/issues/302

return {
	{
		'ThePrimeagen/harpoon',
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
	},
	config = true,
	keys = {
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
		{ "<leader>Hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
		{ "<leader>Hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
		{ "<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
		{ "<leader>h", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to harpoon mark #1" },
		{ "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to harpoon mark #2" },
		{ "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to harpoon mark #3" },
		{ "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to harpoon mark #4" },
	},
	}
}
