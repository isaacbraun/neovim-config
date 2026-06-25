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
      vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, {})
      vim.keymap.set("n", "<leader>sw", builtin.lsp_workspace_symbols, {})
      vim.keymap.set("n", "<leader>sr", builtin.lsp_references, {})
      vim.keymap.set("n", "<leader>t", builtin.lsp_type_definitions, {})
    end,
  },
}
