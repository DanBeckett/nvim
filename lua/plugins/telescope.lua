return {
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- fuzzy files
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- fuzzy grep
            vim.keymap.set("n", "<C-p>", builtin.git_files, {}) -- fuzzy files only git repo
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end) -- project search
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
