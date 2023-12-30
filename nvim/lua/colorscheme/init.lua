local hlgroups = require("colorscheme.highlight")
local theme = require("colorscheme.theme.catppuccin").mocha
for hl, col in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, hl, col)
end
vim.api.nvim_command("redraw")
