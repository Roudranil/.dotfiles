require "ui.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    utils.load_mappings("lspconfig", {buffer = bufnr})

    if client.server_capabilities.signatureHelpProvider then
        require("ui.signature").setup(client)
    end

    client.server_capabilities.semanticTokensProvider = nil
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = {"markdown", "plaintext"},
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = {valueSet = {1}},
    resolveSupport = {
        properties = {"documentation", "detail", "additionalTextEdits"}
    }
}

local lspconfig = require "lspconfig"

-- language servers setup
-- lua language server
lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,

    settings = {
        Lua = {
            diagnostics = {globals = {"vim"}},
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
                    [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true
                },
                maxPreload = 100000,
                preloadFileSize = 10000
            }
        }
    }
}

require('lspconfig.ui.windows').default_options.border = 'rounded'
-- pyright
lspconfig.pyright.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    filetypes = {"python"}
})

lspconfig.texlab.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    filetypes = {"tex", "plaintex", "bib"},
    settings = {
        texlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
                args = {"-pdf", "-interaction=nonstopmode", "-synctex=1", "%f"},
                executable = "latexmk",
                forwardSearchAfter = false,
                onSave = true
            },
            chktex = {onEdit = false, onOpenAndSave = false},
            diagnosticsDelay = 300,
            formatterLineLength = 80,
            forwardSearch = {args = {}},
            latexFormatter = "latexindent",
            latexindent = {modifyLineBreaks = false}
        }
    }
})

lspconfig.astro.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    filetypes = {"astro"}
})

return M
