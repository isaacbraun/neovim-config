require("isaacbraun.remap")
require("isaacbraun.set")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local autocmd = vim.api.nvim_create_autocmd

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Change filetype to gotmpl if go html detected (https://neovim.io/doc/user/lua.html#vim.filetype.add())
-- vim.filetype.add {
--   pattern = {
--     ['.html'] = {
--       function(path, bufnr)
--         local content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ''
--         if vim.regex([[^#!.*\\<{{\\>]]):match_str(content) ~= nil then
--           return 'mine'
--         end
--       end,
--       { priority = -math.huge },
--     },
--   },
-- }

require("lazy").setup("isaacbraun.plugins")

autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.o.termguicolors = true
