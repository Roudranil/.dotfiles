-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- local function augroup(name)
--     return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end
--
-- -- autocommand to modify the lualine winbar color
-- local theme = require("colorscheme.theme.catppuccin").mocha
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     group = augroup("override_lualine_hl"),
--     callback = function()
--         local base_group_name = "LV_Constant"
--         local modes = { "normal", "insert", "visual", "replace", "command", "terminal" }
--         for _, mode in ipairs(modes) do
--             local group_name = string.format("lualine_a_18_%s_%s", base_group_name, mode)
--             -- check if the hl group exists
--             if vim.fn.hlexists(group_name) == 1 then
--                 local current_attributes = vim.api.nvim_get_hl(0, { name = group_name })
--                 current_attributes.fg = theme.surface0
--                 current_attributes.italic = true
--                 vim.api.nvim_set_hl(0, group_name, current_attributes)
--             end
--         end
--     end,
-- })

-- specific autocommands to set filetype on bufenter
-- astro
vim.cmd([[
augroup _astro
autocmd!
autocmd BufRead,BufEnter *.astro set filetype=astro
augroup end
]])
-- conf
vim.cmd([[
augroup _conf
autocmd!
autocmd BufRead,BufEnter *.conf set filetype=bash
augroup end
]])