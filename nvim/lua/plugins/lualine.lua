local M = { "nvim-lualine/lualine.nvim" }
-- local Util = require("lazyvim.util")
local icons = require("lazyvim.config").icons
local colors = require("colorscheme.theme.catppuccin").base_30
-- local theme = require("colorscheme.theme.catppuccin").mocha

M.opts = {
    disabled_filetypes = {
        winbar = { "neo-tree" },
    },
    sections = {
        lualine_c = {
            {
                "diagnostics",
                symbols = {
                    error = icons.diagnostics.Error,
                    warn = icons.diagnostics.Warn,
                    info = icons.diagnostics.Info,
                    hint = icons.diagnostics.Hint,
                },
            },
            {
                function()
                    local msg = "No Active Lsp"
                    local buf_ft = vim.api.nvim_get_option_value(0, "filetype")
                    local clients = vim.lsp.get_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end,
                icon = " :",
                color = function()
                    return { fg = colors.grey_fg2, gui = "bold" }
                end,
            },
            -- {
            --     function()
            --         local venv = require("venv-selector").get_active_venv()
            --         if venv then
            --             local venv_parts = vim.fn.split(venv, "/")
            --             local venv_name = venv_parts[#venv_parts]
            --             local python_version =
            --                 vim.fn.systemlist({ "bash", "-c", string.format("%s/bin/python --version", venv) })[1]
            --             return string.format("(%s):   %s", venv_name, python_version)
            --         else
            --             return "Select venv"
            --         end
            --     end,
            --     icon = " ",
            --     color = { fg = theme.text },
            --     on_click = function()
            --         require("venv-selector").open()
            --     end,
            --     cond = function()
            --         local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            --         return (buf_ft == "python")
            --     end,
            -- },
        },
    },
    winbar = {
        lualine_a = { "filetype" },
        lualine_b = {
            -- { Util.lualine.pretty_path() },
            {
                "filename",
                cond = function()
                    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
                end,
                path = 1,

                symbols = {
                    modified = "[+]", -- Text to show when the file is modified.
                    readonly = "[]", -- Text to show when the file is non-modifiable or readonly.
                    unnamed = "[No Name]", -- Text to show for unnamed buffers.
                    newfile = "[New]", -- Text to show for newly created file before first write
                },
            },
        },
    },
    inactive_winbar = {
        lualine_c = {
            {
                "filename",
                cond = function()
                    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
                end,
                path = 1,
                color = { fg = colors.grey_fg2 },
                symbols = {
                    modified = "[+]", -- Text to show when the file is modified.
                    readonly = "[]", -- Text to show when the file is non-modifiable or readonly.
                    unnamed = "[No Name]", -- Text to show for unnamed buffers.
                    newfile = "[New]", -- Text to show for newly created file before first write
                },
            },
        },
    },
}

return M
