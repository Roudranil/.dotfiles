-- this file is for setting random shhit
-- AFTER lazy finishes its work

-- filetypes
vim.filetype.add({ extension = { mdx = "mdx", astro = "astro" } })
vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.language.register("astro", "mdx")

-- global diagnostic config
-- vim.diagnostic.config({
--     virtual_text = false,
--     float = { border = "rounded" },
-- })
-- wrap open_float to inspect diagnostics and use the severity color for border
-- https://neovim.discourse.group/t/lsp-diagnostics-how-and-where-to-retrieve-severity-level-to-customise-border-color/1679
vim.diagnostic.open_float = (function(orig)
    return function(bufnr, opts)
        local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
        local opts = opts or {}
        -- A more robust solution would check the "scope" value in `opts` to
        -- determine where to get diagnostics from, but if you're only using
        -- this for your own purposes you can make it as simple as you like
        local diagnostics = vim.diagnostic.get(opts.bufnr or 0, { lnum = lnum })
        local max_severity = vim.diagnostic.severity.HINT
        for _, d in ipairs(diagnostics) do
            -- Equality is "less than" based on how the severities are encoded
            if d.severity < max_severity then
                max_severity = d.severity
            end
        end
        local border_color = ({
            [vim.diagnostic.severity.HINT] = "DiagnosticHintBorder",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfoBorder",
            [vim.diagnostic.severity.WARN] = "DiagnosticWarnBorder",
            [vim.diagnostic.severity.ERROR] = "DiagnosticErrorBorder",
        })[max_severity]
        opts.border = {
            { "╭", border_color },
            { "─", border_color },
            { "╮", border_color },
            { "│", border_color },
            { "╯", border_color },
            { "─", border_color },
            { "╰", border_color },
            { "│", border_color },
        }
        orig(bufnr, opts)
    end
end)(vim.diagnostic.open_float)

-- Show line diagnostics in floating popup on hover, except insert mode (CursorHoldI)
-- vim.o.updatetime = 500
-- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])

-- Show source in diagnostics, not inline but as a floating popup
vim.diagnostic.config({
    virtual_text = false,
    float = {
        source = "always", -- Or "if_many"
    },
})
