return {
    "nvim-treesitter/nvim-treesitter",
    name = "treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        --"nvim-treesitter/nvim-treesitter-textobjects", -- doesn't work with PHP
    },
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = { enable = true },
            sync_install = { enable = false },
            ensure_installed = {
                "lua",
                "javascript",
                "typescript",
                "json",
                "php",
                "phpdoc",
                "css",
                "scss",
                "html",
                "blade",
                "twig",
                "vim",
                "vimdoc",
                "dockerfile",
                "gitignore",
                "markdown",
                "markdown_inline"
            },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<C-s>",
                    node_decremental = "<C-backspace>",
                },
            },
        })
    end,
}
