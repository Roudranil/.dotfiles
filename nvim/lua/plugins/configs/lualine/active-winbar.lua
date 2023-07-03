local colors = require("colorscheme.theme.catppuccin").base_30
local mocha = require("colorscheme.theme.catppuccin").mocha
print(mocha.base)
local winbar = {
    lualine_a = {
        {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            -- separator = { left = '', right = '' },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
            }
        }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

table.insert(winbar.lualine_c, {
    'filename',
    cond = conditions.buffer_not_empty,
    color = function()
        return {
            fg = mocha.base,
            bg = mocha.peach,
            italic = true
        }
    end,
    separator = { left = '█', right = '' },
    path = 0,
    padding = 0.2,
    symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[]',    -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]',     -- Text to show for newly created file before first write
    }
})





return winbar
