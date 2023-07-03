local colors = require("colorscheme.theme.catppuccin").base_30

local hlgroups = {
    IndentBlanklineChar = { fg = colors.surface },
    IndentBlanklineSpaceChar = { fg = colors.space, nocombine = true },
    IndentBlanklineContextChar = { fg = colors.line },
    IndentBlanklineContextStart = { underline = true, sp = colors.line },
    IndentBlanklineContextSpaceChar = { underline = true, sp = colors.line }
}

return hlgroups
