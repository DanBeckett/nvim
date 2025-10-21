require("danbeckett")

-- BASE LAZY

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS INITIALISATION

require("lazy").setup("plugins")

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
    url = "https://github.com/EmranMR/tree-sitter-blade",
    files = {"src/parser.c"},
    branch = "main",
  },
  filetype = "blade"
}

-- LSP CONFIGURATION, MIGRATE AWAY FROM NVIM-LSPCONFIG

--[[ local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('cssls', {
    capabilities = capabilities,
    filetypes = { "css", "scss", "less" },
}) ]]--

-- EXAMPLE SETTING UP AN AUTOCMD TO ONLY FIRE IN WORDPRESS THEME

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "php",
--   callback = function()
--     local file = vim.fn.expand("%:p")
--     if file:match("/wp%-content/themes/.+/") then
--       vim.keymap.set("n", "<leader>ac", function()
--         AddClassAttribute()
--       end, { buffer = true, desc = "Add class attribute to current HTML element" })
--     end
--   end,
-- })

