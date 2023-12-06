local colors = require("colorscheme.theme.catppuccin").base_30
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

return {
    -- LSP References
    LspReferenceText = {fg = colors.darker_black, bg = colors.white},
    LspReferenceRead = {fg = colors.darker_black, bg = colors.white},
    LspReferenceWrite = {fg = colors.darker_black, bg = colors.white},

    -- Lsp Diagnostics
    DiagnosticHint = {fg = colors.purple},
    DiagnosticUnnecessary = {fg = colors.light_grey},
    DiagnosticError = {fg = colors.red},
    DiagnosticWarn = {fg = colors.yellow},
    DiagnosticInformation = {fg = colors.green},
    DiagnosticUnderlineError = {underline = true, sp = colors.red, fg = colors.red},
    LspSignatureActiveParameter = {fg = colors.black, bg = colors.green},

    RenamerTitle = {fg = colors.black, bg = colors.red},
    RenamerBorder = {fg = colors.red}
}
