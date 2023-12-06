local mocha = require("colorscheme.theme.catppuccin").mocha

local inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
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

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(inactive_sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(inactive_sections.lualine_x, component)
end

ins_left {
    function()
        return '▊'
    end,
    color = function(section)
        return { fg = mocha.overlay2 }
    end,                               -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = function(section)
        return { fg = mocha.overlay2 }
    end,
    path = 0,
    symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[]',    -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]',     -- Text to show for newly created file before first write
    }
}

ins_right {
    function()
        return '▊'
    end,
    color = function(section)
        return { fg = mocha.overlay2 }
    end,
    padding = { left = 1 },
}

return inactive_sections
