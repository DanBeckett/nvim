local uv = vim.uv or vim.loop
local theme_path = vim.fn.expand("/usr/local/share/themes/current/neovim/lualine.lua")

if uv.fs_stat(theme_path) then
    return dofile(theme_path)
else
    return {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "everforest",
                },
            })
        end,
    }
end
