return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            bind_to_cwd = false,
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added = "A", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = "M", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = "D", -- this can only be used in the git_status source
                        renamed = "R", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "M",
                        ignored = "",
                        unstaged = "󱈸 ",
                        staged = "",
                        conflict = "",
                    },
                },
            },
        },
    },
}
