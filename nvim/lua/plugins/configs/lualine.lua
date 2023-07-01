-- local highlight = require "lualine.highlight"
-- local custom_filename = require("lualine.components.filename").extend()

local config = {}

local colors = require("base46.themes.catppuccin").base_30

config = {
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
            winbar = {},
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
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "nvim-tree" }
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
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

local mode_color = {
    n = colors.red,
    i = colors.green,
    v = colors.sun,
    [''] = colors.sun,
    V = colors.sun,
    c = colors.purple,
    no = colors.red,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.dirty_green,
    Rv = colors.violet,
    cv = colors.red,
    ce = colors.red,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.red,
    t = colors.red,
}

-- edge bars
ins_left {
    function()
        return '▊'
    end,
    color = function(section)
        return { fg = mode_color[vim.fn.mode()] }
    end,                               -- Sets highlighting of component
    padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
    -- mode component
    function()
        local mode_symbols = {
            n = '    Normal',
            i = '    Insert',
            v = '  󰒉  Visual',
            [''] = '  󰒉 󰚍  Visual Block',
            V = '  󰒉   Visual Line',
            c = '    Command',
            no = '  Operator',
            s = '  Select',
            S = '  Select Line',
            [''] = '  Select Block',
            ic = '    Insert Cmp',
            R = '   Replace',
            -- Rv = 'Rv',
            -- cv = 'cv',
            -- ce = 'ce',
            -- r = 'r',
            -- rm = 'r',
            -- ['r?'] = 'r?',
            -- ['!'] = '!',
            -- t = 't',
        }
        local default = ' '
        return mode_symbols[vim.fn.mode()] or default
    end,
    color = function()
        -- auto change color according to neovims mode
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
}

-- ins_left {
--     -- filesize component
--     'filesize',
--     cond = conditions.buffer_not_empty,
-- }

-- filename.
-- we will use a custom filename
ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = function(section)
        local modified = vim.bo.modified
        if modified then
            return { fg = colors.yellow, gui = 'bold' }
        else
            return { fg = colors.white, gui = 'bold' }
        end
    end,
    path = 0,
    symbols = {
        modified = '[+]',      -- Text to show when the file is modified.
        readonly = '[]',    -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        newfile = '[New]',     -- Text to show for newly created file before first write
    }
}

-- ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' :',
    color = function()
        return { fg = colors.grey_fg2, gui = 'bold' }
    end,
}

-- Add components to right sections
ins_right {
    'o:encoding',       -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.custom_blue_grey },
}

ins_right {
    function()
        return vim.bo.filetype
    end,
    -- fmt = string.upper,
    icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green },
}

local function split(input, delimiter)
    local arr = {}
    for word in string.gmatch(input, '[^' .. delimiter .. ']+') do
        table.insert(arr, word)
    end
    return arr
end

local function get_venv()
    local venv = vim.env.VIRTUAL_ENV
    if venv then
        local params = split(venv, '/')
        local venvName = params[#params]
        return '(env:' .. venvName .. ')'
    else
        return ''
    end
end

ins_right {
    get_venv,
    color = { fg = colors.grey_fg, gui = 'bold' },
    cond = function()
        if vim.env.VIRTUAL_ENV and vim.bo.filetype == 'python' then
            return true
        else
            return false
        end
    end
}


ins_right {
    'branch',
    icon = '󰘬',
    color = { fg = colors.white, gui = 'bold' },
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '󰏬 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.custom_bright_green },
        modified = { fg = colors.custom_bright_orange },
        removed = { fg = colors.custom_bright_red },
    },
    cond = conditions.hide_in_width,
}

-- edge bar
ins_right {
    function()
        return '▊'
    end,
    color = function(section)
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 1 },
}

return config
