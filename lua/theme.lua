local theme_path = "/usr/local/share/themes/current/neovim"

local function exists(path)
    return vim.loop.fs_stat(path) ~= nil
end

if exists(theme_path) then
    print(theme_path)
    vim.opt.runtimepath:prepend(theme_path)
    require("neovim-theme")
    return {}
else
    return {
        "comfysage/evergarden",
        name = "evergarden",
        priority = 1000,
        opts = {},
        config = function()
            require("evergarden").setup({
                transparent_background = false,
                contrast_dark = "soft", -- 'hard'|'medium'|'soft'
                override_terminal = true,
                style = {
                    tabline = { reverse = true, color = "green" },
                    search = { reverse = false, inc_reverse = true },
                    types = { italic = true },
                    keyword = { italic = true },
                    comment = { italic = false },
                },
                overrides = {
                    Normal = { bg = "#2d353b" },
                    --NormalFloat = { bg = "#2d353b" },
                    FloatBorder = { bg = "#2d353b" }
                }, -- add custom overrides
            })
            vim.cmd.colorscheme("evergarden")
            -- if you need to boost line number contrast:
            -- vim.cmd.highlight("LineNr guifg=#7A7363")
            -- if you need to REALLY boost line number contrast:
            vim.cmd.highlight("LineNr guifg=#FAEBCA")
            -- vim.cmd.highlight("LineNr guifg=#eeeeee")
        end,
    }
end
