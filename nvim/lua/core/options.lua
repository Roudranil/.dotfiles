local opt = vim.opt
local g = vim.g

local options = {
    clipboard = "unnamedplus", -- Use unnamedplus for clipboard
    cursorline = false, -- Highlight the current line
    equalalways = false, -- auto resizing of vertical splits on closing nvim tree
    expandtab = true, -- Expand tabs to spaces
    fillchars = {eob = "~"}, -- Character for end-of-buffer
    fileencoding = "utf-8", -- Set file encoding to UTF-8
    hidden = true, -- Hide buffers instead of closing them
    hlsearch = true, -- Highlight search results
    ignorecase = true, -- Ignore case when searching
    incsearch = true, -- Incremental search
    laststatus = 3, -- Always show the status line
    list = true, -- Show non-printable characters
    listchars = {{space = "⋅"}, {eol = ""}}, -- Set characters for rendering whitespace and end-of-line
    mouse = "a", -- Enable mouse support in all modes
    number = true, -- Show line numbers
    numberwidth = 2, -- Set the width of line numbers
    relativenumber = true, -- Show relative line numbers
    ruler = true, -- Show the ruler
    scrolloff = 15, -- Number of lines to keep in view when scrolling
    shiftwidth = 4, -- Set the number of spaces for each level of indentation
    shortmess = {"sI"}, -- Shorten the startup message
    showmode = false, -- Hide the mode indicator
    signcolumn = "yes", -- Always show the sign column
    smartcase = true, -- Use case-sensitive search if the pattern contains uppercase characters
    smartindent = true, -- Automatically adjust the indentation
    softtabstop = 4, -- Set the number of spaces for a "soft" tab
    splitbelow = true, -- Open new windows below the current window
    splitright = true, -- Open new windows to the right of the current window
    swapfile = false, -- Disable swap file creation
    tabstop = 4, -- Set the number of spaces for a tab
    termguicolors = true, -- Enable true colors in the terminal
    timeoutlen = 400, -- Set the time in milliseconds for which to wait for a mapped sequence to complete
    undofile = true, -- Enable persistent undo
    updatetime = 250, -- Set the time in milliseconds for triggering CursorHold events
    whichwrap = {"<>[]hl"}, -- Allow certain keys to wrap the cursor to the other side of the screen
    writebackup = false -- Disable writing backups
}

for option, value in pairs(options) do
    if type(value) == "table" then
        for _, val in ipairs(value) do opt[option]:append(val) end
    else
        opt[option] = value
    end
end

for _, provider in ipairs {"node", "perl", "ruby"} do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.python3_host_prog = '/home/rudy/ds/bin/python3'
