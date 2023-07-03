local mocha = require("colorscheme.theme.catppuccin").mocha
local base16 = require("colorscheme.theme.catppuccin").base_16
local colors = require("colorscheme.theme.catppuccin").base_30

return {
    CmpDoc = { bg = colors.darker_black },
    CmpDocBorder = { link = "FloatBorder" },
    CmpPmenu = { bg = colors.black },
    CmpSel = { link = "PmenuSel", bold = true },
    CmpItemAbbr = { fg = mocha.overlay2 },
    CmpItemAbbrDeprecated = { fg = mocha.overlay0, strikethrough = true },
    CmpItemKind = { fg = mocha.blue },
    CmpItemMenu = { fg = mocha.text },
    CmpItemAbbrMatch = { fg = mocha.text, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = mocha.text, bold = true },

    -- kind support
    CmpItemKindSnippet = { fg = mocha.mauve },
    CmpItemKindKeyword = { fg = mocha.red },
    CmpItemKindText = { fg = mocha.teal },
    CmpItemKindMethod = { fg = mocha.blue },
    CmpItemKindConstructor = { fg = mocha.blue },
    CmpItemKindFunction = { fg = mocha.blue },
    CmpItemKindFolder = { fg = mocha.blue },
    CmpItemKindModule = { fg = mocha.blue },
    CmpItemKindConstant = { fg = mocha.peach },
    CmpItemKindField = { fg = mocha.green },
    CmpItemKindProperty = { fg = mocha.green },
    CmpItemKindEnum = { fg = mocha.green },
    CmpItemKindUnit = { fg = mocha.green },
    CmpItemKindClass = { fg = mocha.yellow },
    CmpItemKindVariable = { fg = mocha.flamingo },
    CmpItemKindFile = { fg = mocha.blue },
    CmpItemKindInterface = { fg = mocha.yellow },
    CmpItemKindColor = { fg = mocha.red },
    CmpItemKindReference = { fg = mocha.red },
    CmpItemKindEnumMember = { fg = mocha.red },
    CmpItemKindStruct = { fg = mocha.blue },
    CmpItemKindValue = { fg = mocha.peach },
    CmpItemKindEvent = { fg = mocha.blue },
    CmpItemKindOperator = { fg = mocha.blue },
    CmpItemKindTypeParameter = { fg = mocha.blue },
    CmpItemKindCopilot = { fg = mocha.teal },
}
