-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Overwritten options

opt.shiftwidth = 4 -- 4 spaces indent
opt.tabstop = 4 -- 1 tab = 4 spaces
opt.scrolloff = 50 -- 50 lines of context
opt.fillchars = { eob = "~" }

print("hello")
