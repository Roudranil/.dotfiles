local colors = require("colorscheme.theme.catppuccin").base_30

local hlgroups = {
    IblIndent = {fg = colors.surface},
    IblWhitespace = {fg = colors.space, nocombine = true}
    -- IndentBlanklineContextChar = { fg = colors.line },
    -- IndentBlanklineContextStart = { underline = true, sp = colors.line, fg = colors.line },
    -- IndentBlanklineContextSpaceChar = { underline = true, sp = colors.line }
}

return hlgroups
