local mocha = require("colorscheme.theme.catppuccin")
print("hell1o")
local inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
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

table.insert(inactive_winbar.lualine_c, {
    'filename',
    cond = conditions.buffer_not_empty,

    -- separator = { left = '█', right = '' },
    path = 0,
    padding = 0.2,
    symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[]',    -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]',     -- Text to show for newly created file before first write
    }

})

return inactive_winbar
