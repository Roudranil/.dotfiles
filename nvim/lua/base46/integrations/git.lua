local theme = require("base46").get_theme_tb "base_16"
local colors = require("base46").get_theme_tb "base_30"

return {
    diffOldFile = {
        fg = colors.baby_pink,
    },

    diffNewFile = {
        fg = colors.blue,
    },

    DiffAdd = {
        fg = colors.blue,
    },

    DiffAdded = {
        fg = colors.custom_brght_green,
    },

    DiffChange = {
        fg = colors.light_grey,
    },

    DiffChangeDelete = {
        fg = colors.custom_brght_red,
    },

    DiffModified = {
        fg = colors.custom_brght_orange,
    },

    DiffDelete = {
        fg = colors.custom_brght_red,
    },

    DiffRemoved = {
        fg = colors.custom_brght_red,
    },

    DiffText = {
        fg = colors.white,
        bg = colors.black2,
    },

    -- git commits
    gitcommitOverflow = {
        fg = theme.base08,
    },

    gitcommitSummary = {
        fg = theme.base08,
    },

    gitcommitComment = {
        fg = theme.base03,
    },

    gitcommitUntracked = {
        fg = theme.base03,
    },

    gitcommitDiscarded = {
        fg = theme.base03,
    },

    gitcommitSelected = {
        fg = theme.base03,
    },

    gitcommitHeader = {
        fg = theme.base0E,
    },

    gitcommitSelectedType = {
        fg = theme.base0D,
    },

    gitcommitUnmergedType = {
        fg = theme.base0D,
    },

    gitcommitDiscardedType = {
        fg = theme.base0D,
    },

    gitcommitBranch = {
        fg = theme.base09,
        bold = true,
    },

    gitcommitUntrackedFile = {
        fg = theme.base0A,
    },

    gitcommitUnmergedFile = {
        fg = theme.base08,
        bold = true,
    },

    gitcommitDiscardedFile = {
        fg = theme.base08,
        bold = true,
    },

    gitcommitSelectedFile = {
        fg = theme.base0B,
        bold = true,
    },
}
