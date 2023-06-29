local hl = require("plugins.configs.treesitter.highlights")
local options = {
    ensure_installed = { 
        "lua",
        "python"
    },

    highlight = {
        enable = true,
        use_languagetree = true,
        custom_highlights = function ()
            return require("plugins.configs.treesitter.highlights")
        end
    },

    indent = { enable = true },
}

return options
