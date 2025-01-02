-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.tabstop = 4 -- 4 spaces = 1 tab
opt.shiftwidth = 4 -- tab = 4 spaces

-- FILETYPES

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
