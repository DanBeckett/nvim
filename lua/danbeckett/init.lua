print("you'll think of something")

require("danbeckett.remaps")
require("danbeckett.sets")
require("danbeckett.lspconfig")

vim.api.nvim_create_user_command('Cfempty', function()
  vim.fn.setqflist({}, 'r')
end, {})

-- Setup CSS Selector Utility:

local last_node = nil

local function on_node_change()
    local node = vim.treesitter.get_node()
    if not node then return end

    if node ~= last_node then
        last_node = node

        -- Only fire in SCSS files
        if vim.bo.filetype == "scss" then
            require("utils.scss_selector").print_full_selector()
        end
    end
end

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = on_node_change,
})

vim.keymap.set("n", "<leader>cs", function()
    require("utils.scss_selector").copy_full_selector()
end, { desc = "Show full SCSS selector" })
