-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.colorcolumn = "120"

-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4

-- Disable animations
vim.g.snacks_animate = false

-- Whitespace
vim.opt.list = false
vim.opt.listchars = { eol = "¬", tab = ">·", extends = ">", precedes = "<", lead = "·", trail = "·" }
