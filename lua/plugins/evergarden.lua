return {
    "comfysage/evergarden",
    name = "evergarden",
    priority = 1000,
    opts = {},
    config = function()
        require("evergarden").setup({
            transparent_background = false,
            contrast_dark = "medium", -- 'hard'|'medium'|'soft'
            override_terminal = true,
            style = {
                tabline = { reverse = true, color = "green" },
                search = { reverse = false, inc_reverse = true },
                types = { italic = true },
                keyword = { italic = true },
                comment = { italic = false },
            },
            overrides = {}, -- add custom overrides
        })
        vim.cmd.colorscheme("evergarden")
        -- if you need to boost line number contrast:
        -- vim.cmd.highlight("LineNr guifg=#7A7363")
        -- if you need to REALLY boost line number contrast:
        vim.cmd.highlight("LineNr guifg=#FAEBCA")
        -- vim.cmd.highlight("LineNr guifg=#eeeeee")
    end,
}
