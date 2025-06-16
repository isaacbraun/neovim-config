return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      -- ignore_filetypes = { cpp = true }, -- or { "cpp", }
      -- color = {
      --   suggestion_color = "#ffffff",
      --   cterm = 244,
      -- },
      log_level = "info",             -- set to "off" to disable logging completely
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false,        -- disables built in keymaps for more manual control
      condition = function()
        local cwd = vim.loop.cwd()
        local blocked_dirs = {
          "/Users/isa14596/esri",
        }

        for _, dir in ipairs(blocked_dirs) do
          if cwd:find(dir, 1, true) == 1 then
            return true -- stop supermaven
          end
        end

        return false -- allow supermaven
      end,
    })
  end,
}
