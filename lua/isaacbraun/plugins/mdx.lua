return {
  "davidmh/mdx.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("mdx").setup()
  end,
}
