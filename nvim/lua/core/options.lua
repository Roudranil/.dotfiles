local opt = vim.opt
local g = vim.g

local options = {
    laststatus = 3,
    showmode = false,
    clipboard = "unnamedplus",
    cursorline = true,
    list = true,
    listchars = {
        { space = "⋅" },
        { eol = "" }
    },
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,
    tabstop = 4,
    softtabstop = 4,
    fillchars = { eob = " " },
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,
    mouse = "a",
    number = true,
    numberwidth = 2,
    ruler = true,
    relativenumber = true,
    shortmess = { "sI" },
    signcolumn = "yes",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    timeoutlen = 400,
    undofile = true,
    scrolloff = 5,
    fileencoding = "utf-8",
    updatetime = 250,
    whichwrap = { "<>[]hl" },
    hidden = true,
}

for option, value in pairs(options) do
    if type(value) == "table" then
        for _, val in ipairs(value) do
            opt[option]:append(val)
        end
    else
        opt[option] = value
    end
end

for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

g.mapleader = " "
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
