-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Screen
vim.opt.colorcolumn = "120"
vim.o.scrolloff = 12

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- Spellcheck
vim.o.spell = true

-- Disable animations
vim.g.snacks_animate = false

-- Disable copilot as completion source
vim.g.ai_cmp = false

-- Whitespace
vim.opt.list = false
vim.opt.listchars = { eol = "¬", tab = ">·", extends = ">", precedes = "<", lead = "·", trail = "·" }
