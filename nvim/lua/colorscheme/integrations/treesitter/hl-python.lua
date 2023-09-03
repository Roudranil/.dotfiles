local colors = require("colorscheme.theme.catppuccin").base_30
local mocha = require("colorscheme.theme.catppuccin").mocha

return {
    ["@type.python"] = { fg = mocha.peach },
    ["@module.name"] = { link = "@type.python" },
    ["@module.alias"] = { link = "@type.python" },
    ["@object.python"] = { link = "@module.alias" },
    ["@class.python"] = { fg = mocha.red, bold = true },
    ["@def.python"] = { fg = mocha.maroon, italic = true },
    ["@include.python"] = { fg = mocha.sky, italic = true, bold = true }
}
