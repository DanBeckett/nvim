vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {}) -- project view

-- keep cursor central when page hopping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor central when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- in visual mode, move selection up/down a line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep selection after paste over top
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Keep cursor centered when joining lines or scrolling
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Indent selection and keep it selected
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Copy file path to clipboard
vim.keymap.set("n", "FY", function()
  vim.fn.setreg("f", vim.fn.expand("%:p"))
end, { desc = "Copy file path to clipboard" })
