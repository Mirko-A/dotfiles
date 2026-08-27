-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leave insert mode with jk
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- Move lines up/down in visual mode
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move lines down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move lines up" })

-- Paste over selection without losing register
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without yanking replaced text" })

-- Center cursor after jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

require("which-key").add({
  { "<leader>y", group = "yank" },
  { "<leader>yp", '"0p', mode = { "n", "v" }, desc = "Paste last yank" },

  { "<leader>m", group = "marks" },
  { "<leader>mc", "<cmd>delm! | delm A-Z0-9<cr>", desc = "Clear all marks" },
})
