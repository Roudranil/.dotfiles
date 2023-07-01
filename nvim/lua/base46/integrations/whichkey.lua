local colors = require("base46.themes.catppuccin").base_30

local hlgroups = {
    WhichKey = { link = "NormalFloat" },
    WhichKeyBorder = { link = "FloatBorder" },
    WhichKeyGroup = { fg = colors.blue },
	WhichKeySeperator = { fg = colors.overlay0 },
	WhichKeyDesc = { fg = colors.pink },
	WhichKeyValue = { fg = colors.overlay0 },
}

for hl, col in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, hl, col)
end

vim.api.nvim_command("redraw")

return hlgroups
