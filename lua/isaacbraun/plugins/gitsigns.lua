return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
      word_diff = true,
    })

    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk_inline<CR>", {})
    vim.keymap.set("n", "<leader>sh", ":Gitsigns stage_hunk<CR>", {})
    vim.keymap.set("n", "<leader>rh", ":Gitsigns reset_hunk<CR>", {})
    vim.keymap.set("n", "<leader>sb", ":Gitsigns stage_buffer<CR>", {})
    vim.keymap.set("n", "<leader>rb", ":Gitsigns reset_buffer<CR>", {})
    vim.keymap.set("n", "<leader>nh", ":Gitsigns next_hunk<CR>", {})
    vim.keymap.set("n", "<leader>ph", ":Gitsigns prev_hunk<CR>", {})
  end
}
