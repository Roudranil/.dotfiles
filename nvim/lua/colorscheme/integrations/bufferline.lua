local colors = require("colorscheme.theme.catppuccin").base_30

local hlgroups = {
    BufferLineBackground = { fg = colors.light_grey, bg = colors.black2 },
    BufferlineIndicatorVisible = { fg = colors.black2, bg = colors.black2 },
    BufferLineBufferSelected = { fg = colors.white, bg = colors.black },
    BufferLineBufferVisible = { fg = colors.light_grey, bg = colors.black2 },
    BufferLineError = { fg = colors.light_grey, bg = colors.black2 },
    BufferLineErrorDiagnostic = { fg = colors.light_grey, bg = colors.black2 },
    BufferLineCloseButton = { fg = colors.light_grey, bg = colors.black2 },
    BufferLineCloseButtonVisible = { fg = colors.light_grey, bg = colors.black2 },
    BufferLineCloseButtonSelected = { fg = colors.red, bg = colors.black },
    BufferLineFill = { fg = colors.grey_fg, bg = colors.black2 },
    BufferlineIndicatorSelected = { fg = colors.black, bg = colors.black },
    BufferLineModified = { fg = colors.red, bg = colors.black2 },
    BufferLineModifiedVisible = { fg = colors.red, bg = colors.black2 },
    BufferLineModifiedSelected = { fg = colors.green, bg = colors.black },
    BufferLineSeparator = { fg = colors.black2, bg = colors.black2 },
    BufferLineSeparatorVisible = { fg = colors.black2, bg = colors.black2 },
    BufferLineSeparatorSelected = { fg = colors.black2, bg = colors.black2 },
    BufferLineTab = { fg = colors.light_grey, bg = colors.one_bg3 },
    BufferLineTabSelected = { fg = colors.black2, bg = colors.nord_blue },
    BufferLineTabClose = { fg = colors.red, bg = colors.black },
    BufferLineDevIconDefaultSelected = { bg = "none" },
    BufferLineDevIconDefaultInactive = { bg = "none" },
    BufferLineDuplicate = { fg = "NONE", bg = colors.black2 },
    BufferLineDuplicateSelected = { fg = colors.red, bg = colors.black },
    BufferLineDuplicateVisible = { fg = colors.blue, bg = colors.black2 },
    BufferLineRightCustomAreaText1 = { fg = colors.white },
    BufferLineRightCustomAreaText2 = { fg = colors.red },
}

return hlgroups