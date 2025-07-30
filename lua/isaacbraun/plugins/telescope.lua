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
        local github_dir = ".github"
        local files = vim.fn.globpath(github_dir, "*", false, true)
        if #files == 0 then
          print("No files found in .github directory!")
          return
        end
        local search = vim.fn.input("Grep in .github files > ")
        if search == "" then
          return
        end
        require("telescope.builtin").grep_string({
          search = search,
          search_dirs = { github_dir },
          prompt_title = "Grep in .github Files",
        })
      end)
    end,
  },
}
