-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Desativa auto-format em arquivos Slidev (prettier quebra os separadores ---)
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.md",
  callback = function(ev)
    local lines = vim.api.nvim_buf_get_lines(ev.buf, 0, 30, false)
    for _, line in ipairs(lines) do
      if line:match("^theme:") or line:match("^colorSchema:") or line:match("^highlighter:") then
        vim.b[ev.buf].autoformat = false
        break
      end
    end
  end,
})
