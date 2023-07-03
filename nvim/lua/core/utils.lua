local M = {}

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- load mappings
M.load_mappings = function(plugin)
    local mappings = require("core.mappings")[plugin]
    for _, maps in ipairs(mappings) do
        map(maps[1], maps[2], maps[3], { desc = maps[4] })
    end
end

-- lazy load some plugins
M.lazy_load = function(plugin)
    vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
        group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
        callback = function()
            local file = vim.fn.expand "%"
            local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

            if condition then
                vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

                -- dont defer for treesitter as it will show slow highlighting
                -- This deferring only happens only when we do "nvim filename"
                if plugin ~= "nvim-treesitter" then
                    vim.schedule(function()
                        require("lazy").load { plugins = plugin }

                        if plugin == "nvim-lspconfig" then
                            vim.cmd "silent! do FileType"
                        end
                    end, 0)
                else
                    require("lazy").load { plugins = plugin }
                end
            end
        end,
    })
end

M.load_highlights = function(plugin)
    local hlgroups = require("colorscheme.integrations." .. plugin)
    for hl, col in pairs(hlgroups) do
        vim.api.nvim_set_hl(0, hl, col)
    end
    vim.api.nvim_command("redraw")
end

return M
