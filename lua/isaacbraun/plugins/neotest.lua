return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
  },
  config = function()
    local lib = require("neotest.lib")
    local original_nearest = lib.positions.nearest

    lib.positions.nearest = function(tree, line)
      local ok, nearest = pcall(original_nearest, tree, line)

      if ok then
        return nearest
      end

      return tree
    end

    require("neotest").setup({
      adapters = {
        require("neotest-vitest"),
      },
    })

    vim.keymap.set("n", "<leader>tt", function()
      require("neotest").summary.toggle()
    end, {})
    vim.keymap.set("n", "<leader>tn", function()
      require("neotest").run.run()
    end, {})
    vim.keymap.set("n", "<leader>tf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, {})
    vim.keymap.set("n", "<leader>to", function()
      require("neotest").output_panel.toggle()
    end, {})
    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").run.stop()
    end, {})
  end,
}
