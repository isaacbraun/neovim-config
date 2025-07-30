return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    -- Function to check for ESLint config in project root
    local function has_eslint_config()
      local configs = {
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.cjs",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.cjs",
      }

      local cwd = vim.fn.getcwd()
      for _, config in ipairs(configs) do
        local path = cwd .. "/" .. config
        if vim.fn.filereadable(path) == 1 then
          if config == "package.json" then
            local package_json = vim.fn.readfile(path)
            local content = table.concat(package_json, "\n")
            if content:find('"eslintConfig"') then
              return true
            end
          else
            return true
          end
        end
      end
      return false
    end

    local sources = {
      null_ls.builtins.formatting.pint,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.stylelint,
      null_ls.builtins.code_actions.gomodifytags,
      null_ls.builtins.code_actions.impl,
    }

    if has_eslint_config() then
      table.insert(sources, null_ls.builtins.diagnostics.eslint_d)
      table.insert(sources, null_ls.builtins.formatting.eslint_d)
      table.insert(sources, null_ls.builtins.code_actions.eslint_d)
    end

    null_ls.setup({
      sources = sources,
    })
  end,
}
