-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Leave insert mode with jk
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

local custom_keymaps = {
  -- Clipboard
  { mode = { "n", "v" }, key = "p", cmd = '"0p', desc = "Paste last yank" },
  -- Marks
  { mode = { "n" }, key = "c", cmd = "<cmd>delm! | delm A-Z0-9<cr>", desc = "Clear all marks" },
}

for _, map in ipairs(custom_keymaps) do
  vim.keymap.set(map.mode, "<leader>m" .. map.key, map.cmd, { desc = map.desc })
end
