return {
    {
        "nvim-telescope/telescope.nvim",
        name = "telescope",
        tag = "0.1.6",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep"
        },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- fuzzy files
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- fuzzy grep
            vim.keymap.set("n", "<leader>fa", function()
                builtin.live_grep({
                    additional_args = function()
                        return {
                            "--no-ignore"
                        }
                    end
                })
            end) -- fuzzy grep no ignore
            vim.keymap.set("n", "<leader>fe", function()
                local ext = vim.fn.input("Extension > ")
                if ext == "" then
                    return
                end
                if ext:sub(1,1) == "." then
                    ext = ext:sub(2)
                end
                local glob_arg = "--glob=*." .. ext
                builtin.live_grep({
                    prompt_title = "Grepping through ." .. ext .. " files in project",
                    additional_args = function()
                        return {
                            glob_arg,
                        }
                    end
                })
            end) -- fuzzy grep project with extension
            vim.keymap.set("n", "<leader>fE", function()
                local ext = vim.fn.input("Extension > ")
                if ext == "" then
                    return
                end
                if ext:sub(1,1) == "." then
                    ext = ext:sub(2)
                end
                local glob_arg = "--glob=*." .. ext
                builtin.live_grep({
                    prompt_title = "Grepping through all ." .. ext .. " files in directory",
                    additional_args = function()
                        return {
                            "--no-ignore",
                            glob_arg,
                        }
                    end
                })
            end) -- fuzzy grep no ignore with extension
            vim.keymap.set("n", "<C-p>", builtin.git_files, {}) -- fuzzy files only git repo
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end) -- project search
            vim.keymap.set("n", "<leader>df", function()
                require("telescope.builtin").diagnostics({bufnr = 0})
            end, { desc = "Diagnostics for current buffer" }) -- diagnostics for current buffer
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
