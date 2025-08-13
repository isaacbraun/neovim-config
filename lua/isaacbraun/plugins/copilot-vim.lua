return {
	-- Use native snippets from Neovim v0.10
	-- {
	--   "hrsh7th/nvim-cmp",
	--   optional = true,
	--   --@param opts cmp.ConfigSchema
	--   opts = function(_, opts)
	--     -- Disable ghost text for nvim-cmp, use copilot suggestion instead
	--     opts.experimental.ghost_text = false
	--   end,
	--   keys = function()
	--     return {}
	--   end,
	-- },
	-- Setup copilot.vim
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			-- For copilot.vim
			-- enable copilot for specific filetypes
			-- vim.g.copilot_filetypes = {
			--   ["TelescopePrompt"] = false,
			-- }
      -- Set workspace folders
      -- vim.g.copilot_workspace_folders = "~/Projects"
      -- keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

			-- Set to true to assume that copilot is already mapped
			vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true

			-- Setup keymaps
			local keymap = vim.keymap.set
			local opts = { silent = true }

			-- Set <C-g> to accept Copilot suggestion
			keymap("i", "<C-g>", 'copilot#Accept("\\<CR>")', { expr = true, silent = true, replace_keycodes = false })

			-- Set <C-j> to next suggestion, <C-k> to previous suggestion, <C-l> to suggest
			keymap("i", "<C-j>", "<Plug>(copilot-next)", opts)
			keymap("i", "<C-k>", "<Plug>(copilot-previous)", opts)
			keymap("i", "<C-l>", "<Plug>(copilot-suggest)", opts)

			-- Set <C-d> to dismiss suggestion
			keymap("i", "<C-d>", "<Plug>(copilot-dismiss)", opts)
		end,
	},
}
