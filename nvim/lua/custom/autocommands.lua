-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
local config = require("core.utils").load_config()

-- dont list quickfix buffers
autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- reload some chadrc options on-save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = vim.tbl_map(
        vim.fs.normalize,
        vim.fn.glob(vim.fn.stdpath "config" .. "/lua/custom/**/*.lua", true, true, true)
    ),
    group = vim.api.nvim_create_augroup("ReloadNvChad", {}),

    callback = function(opts)
        local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
        local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
        local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")

        require("plenary.reload").reload_module "base46"
        require("plenary.reload").reload_module(module)
        require("plenary.reload").reload_module "custom.chadrc"

        config = require("core.utils").load_config()

        vim.g.nvchad_theme = config.ui.theme
        vim.g.transparency = config.ui.transparency

        -- -- statusline
        -- require("plenary.reload").reload_module("nvchad_ui.statusline." .. config.ui.statusline.theme)
        -- vim.opt.statusline = "%!v:lua.require('nvchad_ui.statusline." .. config.ui.statusline.theme .. "').run()"

        require("base46").load_all_highlights()
        -- vim.cmd("redraw!")
    end,
})