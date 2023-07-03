local colors = require("colorscheme.theme.catppuccin").base_30
local mocha = require("colorscheme.theme.catppuccin").mocha

local hlgroups = {
    NvimTreeFolderName = { fg = mocha.blue },
    NvimTreeFolderIcon = { fg = mocha.blue },
    NvimTreeNormal = { fg = mocha.text, bg = mocha.mantle },
    NvimTreeOpenedFolderName = { fg = mocha.peach },
    NvimTreeEmptyFolderName = { fg = mocha.blue },
    NvimTreeIndentMarker = { fg = mocha.overlay0 },
    NvimTreeWinSeparator = {
        fg = mocha.base,
        bg = mocha.base,
    },
    NvimTreeRootFolder = { fg = mocha.lavender, bold = true },
    NvimTreeSymlink = { fg = mocha.pink },
    NvimTreeStatuslineNc = { fg = mocha.mantle, bg = mocha.mantle },
    NvimTreeGitDirty = { fg = mocha.yellow },
    NvimTreeGitNew = { fg = mocha.blue },
    NvimTreeGitDeleted = { fg = mocha.red },
    NvimTreeSpecialFile = { fg = mocha.flamingo },
    NvimTreeImageFile = { fg = mocha.text },
    NvimTreeOpenedFile = { fg = mocha.pink },
    NvimTreeWindowPicker = { fg = mocha.red, bg = colors.bg }
}

return hlgroups
