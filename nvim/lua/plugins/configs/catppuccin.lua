local options = {}
options = {
    flavour = 'mocha',
    integrations = {
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        cmp = true,
        nvimtree = true,
        gitsigns = true,
        mason = true,
        treesitter = true
    },
    term_colors = true,
    dim_inactive = {
        enabled = true
    },
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    }
}

return options
