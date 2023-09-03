local mappings = {}

mappings.nvimtree = {
    n = {
        -- toggle
        ["<leader>e"] = {"<cmd> NvimTreeToggle <CR>", "Toggle nvimtree"},
        -- focus
        ["<leader>tt"] = {"<cmd> NvimTreeFocus <CR>", "Focus nvimtree"}
    },

    {"n", "<leader>e", "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree"},
    {"n", "<leader>tt", "<cmd> NvimTreeFocus <CR>", "Focus nvimtree"}
}

mappings.blankline = {
    {
        "n", "<leader>cc", function()
            local ok, start =
                require("indent_blankline.utils").get_current_context(vim.g
                                                                          .indent_blankline_context_patterns,
                                                                      vim.g
                                                                          .indent_blankline_use_treesitter_scope)

            if ok then
                vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(),
                                            {start, 0})
                vim.cmd [[normal! _]]
            end
        end, "Jump to current context"
    }
}

mappings.gitsigns = {
    {
        "n",
        "]c",
        function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() require("gitsigns").next_hunk() end)
            return "<Ignore>"
        end,
        "Jump to next hunk",
        opts = {expr = true}
    }, {
        "n",
        "[c",
        function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() require("gitsigns").prev_hunk() end)
            return "<Ignore>"
        end,
        "Jump to prev hunk",
        opts = {expr = true}
    }, {
        "n", "<leader>rh", function() require("gitsigns").reset_hunk() end,
        "Reset hunk"
    }, {
        "n", "<leader>ph", function() require("gitsigns").preview_hunk() end,
        "Preview hunk"
    }, {
        "n", "<leader>gb", function()
            package.loaded.gitsigns.blame_line()
        end, "Blame line"
    }, {
        "n", "<leader>td", function()
            require("gitsigns").toggle_deleted()
        end, "Toggle deleted"
    }
}

mappings.lspconfig = {
    {"n", "gD", function() vim.lsp.buf.declaration() end, "LSP declaration"},
    {"n", "gd", function() vim.lsp.buf.definition() end, "LSP definition"},
    {"n", "K", function() vim.lsp.buf.hover() end, "LSP hover"},
    {
        "n", "gi", function() vim.lsp.buf.implementation() end,
        "LSP implementation"
    }, {
        "n", "<leader>ls", function() vim.lsp.buf.signature_help() end,
        "LSP signature help"
    }, {
        "n", "<leader>D", function() vim.lsp.buf.type_definition() end,
        "LSP definition type"
    }, {
        "n", "<leader>ra", function() require("nvchad_ui.renamer").open() end,
        "LSP rename"
    }, {
        "n", "<leader>ca", function() vim.lsp.buf.code_action() end,
        "LSP code action"
    }, {"n", "gr", function() vim.lsp.buf.references() end, "LSP references"},
    {
        "n", "<leader>f",
        function() vim.diagnostic.open_float {border = "rounded"} end,
        "Floating diagnostic"
    }, {
        "n", "[d",
        function()
            vim.diagnostic.goto_prev({float = {border = "rounded"}})
        end, "Goto prev"
    }, {
        "n", "]d",
        function()
            vim.diagnostic.goto_next({float = {border = "rounded"}})
        end, "Goto next"
    }, {
        "n", "<leader>q", function() vim.diagnostic.setloclist() end,
        "Diagnostic setloclist"
    }, {
        "n", "<leader>fm", function() vim.lsp.buf.format {async = true} end,
        "LSP formatting"
    }, {
        "n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end,
        "Add workspace folder"
    }, {
        "n", "<leader>wr", function()
            vim.lsp.buf.remove_workspace_folder()
        end, "Remove workspace folder"
    }, {
        "n", "<leader>wl",
        function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "List workspace folders"
    }
}

mappings.telescope = {
    {"n", "<leader>ff", "<cmd> Telescope find_files <CR>", "Find files"}, {
        "n", "<leader>fa",
        "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
        "Find all"
    }, {"n", "<leader>fw", "<cmd> Telescope live_grep <CR>", "Live grep"},
    {"n", "<leader>fb", "<cmd> Telescope buffers <CR>", "Find buffers"},
    {"n", "<leader>fh", "<cmd> Telescope help_tags <CR>", "Help page"},
    {"n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", "Find oldfiles"}, {
        "n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>",
        "Find in current buffer"
    }, {"n", "<leader>cm", "<cmd> Telescope git_commits <CR>", "Git commits"},
    {"n", "<leader>gt", "<cmd> Telescope git_status <CR>", "Git status"},
    {"n", "<leader>fk", "<cmd> Telescope keymaps <CR>", "View keymaps"},
    {"n", "<leader>fl", "<cmd> Telescope highlights <CR>", "View highlights"},
    {"n", "<leader>fc", "<cmd> Telescope commands <CR>", "View commands"}
}

mappings.whichkey = {
    {
        "n", "<leader>wk", function() vim.cmd("WhichKey") end,
        "which-key all keys"
    }, {
        "n", "<leader>wq", function()
            local input = vim.fn.input "WhichKey: "
            vim.cmd("WhichKey" .. input)
        end, "which-key query lookup"
    }
}

mappings.yarepl = {
    {
        "n", "<leader>ms", function()
            local current_win = vim.api.nvim_get_current_win()
            vim.cmd("REPLStart ipython")
            vim.api.nvim_set_current_win(current_win)
        end, "Start ipython REPL window"
    }, {
        "n", "<leader>ml", "<cmd> REPLSendLine ipython<CR>",
        "Send line to REPL window"
    }, {
        "v", "<leader>mv", "<cmd> REPLSendVisual ipython<CR>",
        "Send selection to REPL window"
    }
}

return mappings
