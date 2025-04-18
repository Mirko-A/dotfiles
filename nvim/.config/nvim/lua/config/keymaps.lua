-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leave insert mode with jk
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Marks
vim.keymap.set({ "n" }, "<leader>mc", "<cmd>delm! | delm A-Z0-9<cr>", { desc = "Clear all marks", remap = true })
