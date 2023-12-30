local options = {
    defaults = {

        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- borderchars = {
        --       { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        --       prompt = {"─", "│", " ", "│", '╭', '╮', "│", "│"},
        --       results = {"─", "│", "─", "│", "╠", "┤", "╯", "╰"},
        --       preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        --     },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
}
--
-- local keymaps = {
--
--     { "n", "<leader>fb", "<cmd> Telescope buffers <CR>", "Find buffers" },
--     { "n", "<leader>fh", "<cmd> Telescope help_tags <CR>", "Help page" },
--     { "n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
--     {
--         "n",
--         "<leader>fz",
--         "<cmd> Telescope current_buffer_fuzzy_find <CR>",
--         "Find in current buffer",
--     },
--     { "n", "<leader>cm", "<cmd> Telescope git_commits <CR>", "Git commits" },
--     { "n", "<leader>gt", "<cmd> Telescope git_status <CR>", "Git status" },
--     { "n", "<leader>fk", "<cmd> Telescope keymaps <CR>", "View keymaps" },
--     { "n", "<leader>fl", "<cmd> Telescope highlights <CR>", "View highlights" },
--     { "n", "<leader>fc", "<cmd> Telescope commands <CR>", "View commands" },
-- }

return {
    "nvim-telescope/telescope.nvim",
    opts = options,
}
