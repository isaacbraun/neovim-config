return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   name = "gruvbox",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme("gruvbox")
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    background = {
      light = "latte",
      dark = "mocha",
    },
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
