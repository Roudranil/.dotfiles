local plugins = {
    'nvim-lua/plenary.nvim',

    -- colorschemes
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        opts = function()
            return require("plugins.configs.catppuccin")
        end,
        config = function(_, opts)
            require("catppuccin").setup(opts)
        end,
    },

    -- file browser, indentation
    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            return { override = require("ui.icons").devicons }
        end,
        config = function(_, opts)
            require("core.utils").load_highlights "devicons"
            require("nvim-web-devicons").setup(opts)
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        init = function()
            require("core.utils").load_mappings "nvimtree"
        end,
        opts = function()
            return require "plugins.configs.nvimtree"
        end,
        config = function(_, opts)
            require("core.utils").load_highlights "nvimtree"
            require("nvim-tree").setup(opts)
        end,
    },

    -- good to have for looks
    {
        "NvChad/nvim-colorizer.lua",
        init = function()
            require("core.utils").lazy_load "nvim-colorizer.lua"
        end,
        config = function(_, opts)
            require("colorizer").setup(opts)

            -- execute colorizer as soon as possible
            vim.defer_fn(function()
                require("colorizer").attach_to_buffer(0)
            end, 0)
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        init = function()
            require("core.utils").lazy_load "indent-blankline.nvim"
        end,
        opts = function()
            return require "plugins.configs.blankline"
        end,
        config = function(_, opts)
            require("core.utils").load_mappings "blankline"
            require("core.utils").load_highlights "blankline"
            require("indent_blankline").setup(opts)
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        ft = { "gitcommit", "diff" },
        init = function()
            -- load gitsigns only when a git file is opened
            vim.api.nvim_create_autocmd({ "BufRead" }, {
                group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
                callback = function()
                    vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
                    if vim.v.shell_error == 0 then
                        vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
                        vim.schedule(function()
                            require("lazy").load { plugins = { "gitsigns.nvim" } }
                        end)
                    end
                end,
            })
        end,
        opts = function()
            return require "plugins.configs.gitsigns"
        end,
        config = function(_, opts)
            require("core.utils").load_highlights "git"
            require("gitsigns").setup(opts)
        end,
    },

    -- lsp and cmp
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        opts = function()
            return require "plugins.configs.mason"
        end,
        config = function(_, opts)
            require("core.utils").load_highlights "mason"
            require("mason").setup(opts)

            -- custom nvchad cmd to install all mason binaries listed
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end, {})

            vim.g.mason_binaries_list = opts.ensure_installed
        end,
    },

    {
        "neovim/nvim-lspconfig",
        init = function()
            require("core.utils").lazy_load "nvim-lspconfig"
        end,
        config = function()
            require("core.utils").load_highlights "lsp"
            require "plugins.configs.lspconfig"
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = { 'python' },
        opts = function()
            return require "plugins.configs.null-ls"
        end,
    },

    -- load luasnips + cmp related in insert mode only
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("plugins.configs.others").luasnip(opts)
                end,
            },

            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        opts = function()
            return require "plugins.configs.cmp"
        end,
        config = function(_, opts)
            require("core.utils").load_highlights "cmp"
            require("cmp").setup(opts)
        end,
    },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        init = function()
            require("core.utils").lazy_load "nvim-treesitter"
        end,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            return require "plugins.configs.treesitter.treesitter"
        end,
        config = function(_, opts)
            require("core.utils").load_highlights "treesitter"
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    {
        "nvim-treesitter/playground",
        opts = function()
            return require("plugins.configs.treesitter.playground")
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        event = 'BufRead'
    },

    -- lines
    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            return require("plugins.configs.lualine")
        end,
        config = function(_, opts)
            require("lualine").setup(opts)
        end,
        lazy = false,
    },

    -- bufferline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = function()
            return require("plugins.configs.bufferline")
        end,
        config = function(_, opts)
            require("core.utils").load_highlights "bufferline"
            require("bufferline").setup(opts)
        end,
        lazy = false,
    },

    -- utilities
    {
        "nvim-telescope/telescope.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        cmd = "Telescope",
        init = function()
            require("core.utils").load_mappings "telescope"
        end,
        opts = function()
            return require "plugins.configs.telescope"
        end,
        config = function(_, opts)
            local _ = require("colorscheme.integrations.telescope")
            local telescope = require "telescope"
            telescope.setup(opts)

            -- load extensions
            for _, ext in ipairs(opts.extensions_list) do
                telescope.load_extension(ext)
            end
        end,
    },

    {
        "folke/which-key.nvim",
        keys = { "<leader>", '"', "'", "`", "c", "v", "g", "<C-w>" },
        init = function()
            require("core.utils").load_mappings("whichkey")
        end,
        config = function(_, opts)
            require("which-key").setup(opts)
            require("colorscheme.integrations.whichkey")
        end,
        lazy = false
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
        lazy = false
    }
}

local config = require "plugins.configs.lazy_nvim"
require("lazy").setup(plugins, config)
