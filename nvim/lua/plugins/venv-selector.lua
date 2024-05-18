local function set_python_prog()
    local venv = require("venv-selector")
    vim.g.python3_host_prog = venv.get_active_path()
end

return {
    "linux-cultist/venv-selector.nvim",
    opts = function(_, opts)
        if require("lazyvim.util").has("nvim-dap-python") then
            opts.dap_enabled = true
        end

        return vim.tbl_deep_extend("force", opts, {
            path = "/home/rudy/venvs",
            name = function()
                local venv_path = "~/venvs"
                local subfolders = vim.fn.glob(venv_path .. "/*/")
                local folder_names = {}
                for _, subfolder in pairs(subfolders) do
                    table.insert(folder_names, vim.fn.fnamemodify(subfolder, ":t"))
                end
                return folder_names
            end,
            parents = 0,
        })
    end,
    keys = {
        {
            "<leader>cv",
            function()
                vim.api.nvim_command("VenvSelect")
                vim.api.nvim_command("LspRestart")
                set_python_prog()
            end,
            desc = "Select VirtualEnv",
        },
    },
}
