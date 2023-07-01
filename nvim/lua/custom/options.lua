local opt = vim.opt
local g = vim.g

-------------------------------------- options ------------------------------------------
-- opt.laststatus = 3 -- global statusline
-- opt.showmode = false
-- opt.clipboard = "unnamedplus"
-- opt.cursorline = true
-- opt.list = true
-- opt.listchars:append "space:⋅"
-- opt.listchars:append "eol:↴"
-- 
-- -- Indenting
-- opt.expandtab = true
-- opt.shiftwidth = 4
-- opt.smartindent = true
-- opt.tabstop = 4
-- opt.softtabstop = 4
-- 
-- opt.fillchars = { eob = " " }
-- opt.ignorecase = true
-- opt.smartcase = true
-- opt.hlsearch = true
-- opt.incsearch = true
-- opt.mouse = "a"
-- 
-- -- Numbers
-- opt.number = true
-- opt.numberwidth = 2
-- opt.ruler = true
-- opt.relativenumber = true
-- 
-- -- disable nvim intro
-- opt.shortmess:append "sI"
-- 
-- opt.signcolumn = "yes"
-- opt.splitbelow = true
-- opt.splitright = true
-- opt.termguicolors = true
-- opt.timeoutlen = 400
-- opt.undofile = true
-- 
-- opt.scrolloff = 5
-- opt.fileencoding = 'utf-8'
-- 
-- -- indentline
-- opt.list = true
-- 
-- -- interval for writing swap file to disk, also used by gitsigns
-- opt.updatetime = 250
-- 
-- -- go to previous/next line with h,l,left arrow and right arrow
-- -- when cursor reaches end/beginning of line
-- opt.whichwrap:append "<>[]hl"
-- 
-- opt.hidden = true

local options = {
    laststatus = 3,
    showmode = false,
    clipboard = "unnamedplus",
    cursorline = true,
    list = true,
    listchars = {
        { space = "⋅" },
        { eol = "↴" }
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

g.mapleader = " "

for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
g.nvchad_theme = 'catppuccin'
