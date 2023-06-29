local colors = require("base46").get_theme_tb "base_30"

local hlgroups = {
    IndentBlanklineChar = { fg = colors.surface },
    IndentBlanklineSpaceChar = { fg = colors.space, nocombine = true },
    IndentBlanklineContextChar = { fg = colors.line },
    IndentBlanklineContextStart = { underline = true, sp = colors.line },
    IndentBlanklineContextSpaceChar = { underline = true, sp = colors.line }
}

for hl, col in pairs(hlgroups) do
    vim.api.nvim_set_hl(0, hl, col)
end
