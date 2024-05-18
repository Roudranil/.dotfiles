local mocha = require("colorscheme.theme.catppuccin").mocha
local colors = require("colorscheme.theme.catppuccin").base_30
local blended = require("colorscheme.theme.catppuccin").blended

local highlights = {
    -- Misc
    -- copied from the init.lua under highlights in nvim.bak

    -- Misc
    ["@comment"] = { link = "Comment" },
    ["@error"] = { link = "Error" },
    ["@customised_error"] = { fg = mocha.red, underline = true },
    ["@preproc"] = { link = "PreProc" }, -- various preprocessor directives & shebangs
    ["@define"] = { link = "Define" }, -- preprocessor definition directives
    ["@operator"] = { link = "Operator" }, -- For any operator: +, but also -> and * in mocha.

    -- Punctuation
    ["@punctuation.delimiter"] = { fg = mocha.overlay2 }, -- For delimiters ie: .
    ["@punctuation.bracket"] = { fg = mocha.peach }, -- For brackets and parenthesis.
    ["@punctuation.special"] = { fg = mocha.sky }, -- For special punctutation that does not fall in the categories before.

    -- Literals
    ["@string"] = { link = "String" }, -- For strings.
    ["@string.regex"] = { fg = mocha.peach }, -- For regexes.
    ["@string.escape"] = { fg = mocha.pink }, -- For escape characters within a string.
    ["@string.special"] = { fg = mocha.blue }, -- other special strings (e.g. dates)

    ["@character"] = { link = "Character" }, -- character literals
    ["@character.special"] = { link = "SpecialChar" }, -- special characters (e.g. wildcards)

    ["@boolean"] = { link = "Boolean" }, -- For booleans.
    ["@number"] = { link = "Number" }, -- For all numbers
    ["@float"] = { link = "Float" }, -- For floats.

    -- Functions
    ["@function"] = { link = "Function" }, -- For function (calls and definitions).
    ["@function.builtin"] = { fg = mocha.peach }, -- For builtin functions: table.insert in Lua.
    ["@function.call"] = { link = "Function" }, -- function calls
    ["@function.macro"] = { fg = mocha.teal }, -- For macro defined functions (calls and definitions): each macro_rules in Rusmocha.
    ["@method"] = { link = "Function" }, -- For method calls and definitions.

    ["@method.call"] = { link = "Function" }, -- method calls

    ["@constructor"] = { fg = mocha.sapphire }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
    ["@parameter"] = { fg = mocha.maroon, italic = true }, -- For parameters of a function.

    -- Keywords
    ["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { fg = mocha.mauve }, -- For keywords used to define a function.
    ["@keyword.operator"] = { fg = mocha.mauve }, -- For new keyword operator
    ["@keyword.return"] = { fg = mocha.mauve },
    -- JS & derivative
    ["@keyword.export"] = { fg = mocha.sky, bold = true },

    ["@conditional"] = { link = "Conditional" }, -- For keywords related to conditionnals.
    ["@repeat"] = { link = "Repeat" }, -- For keywords related to loops.
    -- @debug            ; keywords related to debugging
    ["@label"] = { link = "Label" }, -- For labels: label: in C and :label: in Lua.
    ["@include"] = { link = "Include" }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
    ["@exception"] = { fg = mocha.mauve }, -- For exception related keywords.

    -- Types

    ["@type"] = { link = "Type" }, -- For types.
    ["@type.builtin"] = { fg = mocha.yellow, italic = true }, -- For builtin types.
    ["@type.definition"] = { link = "@type" }, -- type definitions (e.g. `typedef` in C)
    ["@type.qualifier"] = { link = "@type" }, -- type qualifiers (e.g. `const`)

    ["@storageclass"] = { link = "StorageClass" }, -- visibility/life-time/etc. modifiers (e.g. `static`)
    ["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g. Python decorators)
    ["@field"] = { fg = mocha.lavender }, -- For fields.
    ["@property"] = { fg = mocha.lavender }, -- Same as TSField.

    -- Identifiers

    ["@variable"] = { fg = mocha.text }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = mocha.red }, -- Variable names that are defined by the languages, like this or self.

    ["@constant"] = { link = "Constant" }, -- For constants
    ["@constant.builtin"] = { fg = mocha.peach }, -- For constant that are built in the language: nil in Lua.
    ["@constant.macro"] = { link = "Macro" }, -- For constants that are defined by macros: NULL in mocha.

    ["@namespace"] = { fg = mocha.lavender, italic = true }, -- For identifiers referring to modules and namespaces.
    ["@symbol"] = { fg = mocha.flamingo },

    -- Text

    ["@text"] = { fg = mocha.text }, -- For strings considerated text in a markup language.
    ["@text.strong"] = { fg = mocha.maroon, bold = true }, -- bold
    ["@text.emphasis"] = { fg = mocha.maroon, italic = true }, -- italic
    ["@text.underline"] = { link = "Underline" }, -- underlined text
    ["@text.strike"] = { fg = mocha.text, strikethrough = true }, -- strikethrough text
    ["@text.title"] = { fg = mocha.blue, bold = true }, -- titles like: # Example
    ["@text.literal"] = { fg = mocha.teal }, -- used for inline code in markdown and for doc in python (""")
    ["@text.uri"] = { fg = mocha.rosewater, italic = true, underline = true }, -- urls, links and emails
    ["@text.math"] = { fg = mocha.blue }, -- math environments (e.g. `$ ... $` in LaTeX)
    ["@text.environment"] = { fg = mocha.pink }, -- text environments of markup languages
    ["@text.environment.name"] = { fg = mocha.blue }, -- text indicating the type of an environment
    ["@text.reference"] = { fg = mocha.lavender, bold = true }, -- references

    ["@text.todo"] = { fg = mocha.base, bg = mocha.yellow }, -- todo notes
    ["@text.todo.checked"] = { fg = mocha.green }, -- todo notes
    ["@text.todo.unchecked"] = { fg = mocha.overlay1 }, -- todo notes
    ["@text.note"] = { fg = mocha.base, bg = mocha.blue },
    ["@text.warning"] = { fg = mocha.base, bg = mocha.yellow },
    ["@text.danger"] = { fg = mocha.base, bg = mocha.red },

    ["@text.diff.add"] = { link = "diffAdded" }, -- added text (for diff files)
    ["@text.diff.delete"] = { link = "diffRemoved" }, -- deleted text (for diff files)

    -- Tags
    ["@tag"] = { fg = mocha.mauve }, -- Tags like html tag names.
    ["@tag.attribute"] = { fg = mocha.teal, italic = true }, -- Tags like html tag names.
    ["@tag.delimiter"] = { fg = mocha.sky }, -- Tag delimiter like < > /

    -- Language specific:

    -- markdown
    ["@text.title.2.markdown"] = { link = "rainbow2" },
    ["@text.title.1.markdown"] = { link = "rainbow1" },
    ["@text.title.3.markdown"] = { link = "rainbow3" },
    ["@text.title.4.markdown"] = { link = "rainbow4" },
    ["@text.title.5.markdown"] = { link = "rainbow5" },
    ["@text.title.6.markdown"] = { link = "rainbow6" },

    -- toml
    ["@property.toml"] = { fg = mocha.blue }, -- Differentiates between string and properties

    -- json
    ["@label.json"] = { fg = mocha.blue }, -- For labels: label: in C and :label: in Lua.

    -- yaml
    ["@field.yaml"] = { fg = mocha.blue }, -- For fields.

    -- cmp highlights
    CmpDoc = { bg = colors.darker_black },
    CmpDocBorder = { link = "FloatBorder" },
    CmpPmenu = { bg = colors.black },
    CmpSel = { bg = colors.pmenu_bg, fg = colors.black, bold = true },
    CmpItemAbbr = { fg = mocha.overlay2 },
    CmpItemAbbrDeprecated = { fg = mocha.overlay0, strikethrough = true },
    CmpItemKind = { fg = mocha.blue },
    CmpItemMenu = { fg = mocha.text },
    CmpItemAbbrMatch = { fg = mocha.text, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = mocha.text, bold = true },
    CmpItemKindSnippet = { fg = mocha.mauve },
    CmpItemKindKeyword = { fg = mocha.red },
    CmpItemKindText = { fg = mocha.teal },
    CmpItemKindMethod = { fg = mocha.blue },
    CmpItemKindConstructor = { fg = mocha.blue },
    CmpItemKindFunction = { fg = mocha.blue },
    CmpItemKindFolder = { fg = mocha.blue },
    CmpItemKindModule = { fg = mocha.blue },
    CmpItemKindConstant = { fg = mocha.peach },
    CmpItemKindField = { fg = mocha.green },
    CmpItemKindProperty = { fg = mocha.green },
    CmpItemKindEnum = { fg = mocha.green },
    CmpItemKindUnit = { fg = mocha.green },
    CmpItemKindClass = { fg = mocha.yellow },
    CmpItemKindVariable = { fg = mocha.flamingo },
    CmpItemKindFile = { fg = mocha.blue },
    CmpItemKindInterface = { fg = mocha.yellow },
    CmpItemKindColor = { fg = mocha.red },
    CmpItemKindReference = { fg = mocha.red },
    CmpItemKindEnumMember = { fg = mocha.red },
    CmpItemKindStruct = { fg = mocha.blue },
    CmpItemKindValue = { fg = mocha.peach },
    CmpItemKindEvent = { fg = mocha.blue },
    CmpItemKindOperator = { fg = mocha.blue },
    CmpItemKindTypeParameter = { fg = mocha.blue },
    CmpItemKindCopilot = { fg = mocha.teal },

    -- neotree
    NeoTreeGitAdded = { fg = mocha.blue },
    NeoTreeGitUntracked = { fg = mocha.green },

    -- latex
    TexCmdClass = { fg = mocha.teal },
    TexCmdPackage = { link = "TexCmdClass" },
    TexFilesArg = { fg = mocha.yellow, italic = true },
    TexFileArg = { link = "TexFilesArg" },
    TexCmd = { fg = mocha.blue, italic = true },
    TexCmdNewCmd = { fg = mocha.mauve, italic = true },
    TexStyleBold = { fg = mocha.red, bold = true },
    TexCmdEnv = { fg = mocha.sky, italic = true },
    TexEnvArgName = { fg = mocha.red, italic = true },
    TexFilesOpt = { fg = mocha.maroon, italic = true },
    TexDelim = { fg = mocha.maroon },
    TexMathEnvArgName = { link = "TexEnvArgName" },
    TexPartArgTitle = { fg = mocha.maroon, bold = true },

    -- popup
    NormalFLoat = { bg = mocha.base },
    FloatBorder = { fg = mocha.surface0 },

    -- python
    ["@string.python"] = { fg = mocha.green, italic = true },
    ["@type.python"] = { fg = mocha.yellow },
    -- ["@module.python"] = { link = "@type.python" },
    ["@module.name"] = { link = "@type.python" },
    ["@module.alias"] = { link = "@type.python" },
    ["@module.import.class"] = { fg = mocha.yellow, italic = true },
    ["@module.import.method"] = { fg = mocha.blue, italic = true },
    ["@class.python"] = { fg = mocha.red, bold = true },
    ["@def.python"] = { fg = mocha.maroon, italic = true },
    ["@constructor.python"] = { link = "@module.import.class" },
    ["@function.python"] = { fg = mocha.blue, italic = true },
    ["@function.method.call.python"] = { fg = mocha.blue, italic = true },
    ["@function.call.python"] = { fg = mocha.blue, italic = true },
    ["@object.python"] = { fg = mocha.yellow },

    -- mason
    MasonHeader = { fg = mocha.base, bg = mocha.red },

    -- Telescope
    TelescopeTitle = { fg = mocha.surface2 },

    -- diagnostics
    DiagnosticHintBorder = { fg = blended.rosewater_base },
    DiagnosticInfoBorder = { fg = blended.sky_base },
    DiagnosticWarnBorder = { fg = blended.yellow_base },
    DiagnosticErrorBorder = { fg = blended.red_base },
}

return highlights
