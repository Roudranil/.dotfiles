local colors = require("colorscheme.theme.catppuccin").base_30
local mocha = require("colorscheme.theme.catppuccin").mocha

return {
    ["@constructor.lua"] = { fg = mocha.flamingo }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
    ["@field.lua"] = { fg = mocha.flamingo },
    ["@keyword.lua"] = { fg = mocha.sky, bold = true },
    ["@keyword.return.lua"] = { link = "@keyword.lua" },
    ["@repeat.lua"] = { link = "@keyword.lua" }
}
