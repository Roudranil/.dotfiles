-- local highlight = require "lualine.highlight"
-- local custom_filename = require("lualine.components.filename").extend()

local colors = require("colorscheme.theme.catppuccin").base_30

local config = {
    options = {
        icons_enabled = true,
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {
            statusline = {
                'NvimTree_1',
                'NvimTree'
            },
            winbar = {
                'NvimTree_1',
                'NvimTree'
            },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = require("plugins.configs.lualine.active-sections"),
    -- inactive_sections = require("plugins.configs.lualine.inactive-sections"),
    inactive_sections = {},
    tabline = {},
    winbar = require("plugins.configs.lualine.active-winbar"),
    inactive_winbar = require("plugins.configs.lualine.inactive-winbar"),
    extensions = { "nvim-tree" }
}


return config
