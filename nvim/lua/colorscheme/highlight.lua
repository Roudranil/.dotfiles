local mocha = require("colorscheme.theme.catppuccin").mocha
local colors = require("colorscheme.theme.catppuccin").base_30
local blended = require("colorscheme.theme.catppuccin").blended

local highlights = {
    -- cmp highlights
    CmpDoc = { bg = colors.darker_black },
    CmpDocBorder = { link = "FloatBorder" },
    CmpPmenu = { bg = colors.black },
    CmpSel = { bg = colors.pmenu_bg, fg = colors.black, bold = true },
    CmpItemAbbr = { fg = mocha.overlay2 },
    CmpItemAbbrDeprecated = { fg = mocha.overlay0, strikethrough = true },
    CmpItemKind = { fg = mocha.blue },
    CmpItemMenu = { fg = mocha.text },
    CmpItemAbbrMatch = { fg = mocha.text, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = mocha.text, bold = true },
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

    -- neotree
    NeoTreeGitAdded = { fg = mocha.blue },
    NeoTreeGitUntracked = { fg = mocha.green },

    -- latex
    TexCmdClass = { fg = mocha.teal },
    TexCmdPackage = { link = "TexCmdClass" },
    TexFilesArg = { fg = mocha.yellow, italic = true },
    TexFileArg = { link = "TexFilesArg" },
    TexCmd = { fg = mocha.blue, italic = true },
    TexCmdNewCmd = { fg = mocha.mauve, italic = true },
    TexStyleBold = { fg = mocha.red, bold = true },
    TexCmdEnv = { fg = mocha.sky, italic = true },
    TexEnvArgName = { fg = mocha.red, italic = true },
    TexFilesOpt = { fg = mocha.maroon, italic = true },
    TexDelim = { fg = mocha.maroon },
    TexMathEnvArgName = { link = "TexEnvArgName" },
    TexPartArgTitle = { fg = mocha.maroon, bold = true },

    -- popup
    NormalFLoat = { bg = mocha.base },
    FloatBorder = { fg = mocha.surface0 },

    -- python
    ["@string.python"] = { fg = mocha.green, italic = true },

    -- mason
    MasonHeader = { fg = mocha.base, bg = mocha.red },

    -- Telescope
    TelescopeTitle = { fg = mocha.surface2 },

    -- diagnostics
    DiagnosticHintBorder = { fg = blended.rosewater_base },
    DiagnosticInfoBorder = { fg = blended.sky_base },
    DiagnosticWarnBorder = { fg = blended.yellow_base },
    DiagnosticErrorBorder = { fg = blended.red_base },
}

return highlights
