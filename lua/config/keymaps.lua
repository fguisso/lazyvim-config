-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--- Telescope with hidden files
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files({
    find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
  })
end, { desc = "Find files including hidden" })

--- Este keymap deixa disponivel o atalho do Avante mesmo que ele ainda não esteja carregado
vim.keymap.set("n", "<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Load and execute AvanteAsk" })
