-- LSP CONFIGURATION, MIGRATE AWAY FROM NVIM-LSPCONFIG

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    filetypes = { "lua" },
})

vim.lsp.config('cssls', {
    capabilities = capabilities,
    filetypes = { "css", "scss", "less" },
})

vim.lsp.config('ts_ls', {
    capabilities = capabilities,
})

vim.lsp.config('twiggy_language_server', {
    capabilities = capabilities,
    --on_attach = function()
        --print("Twiggy LSP started")
    --end,
})

vim.lsp.config('intelephense', {
    capabilities = capabilities,
    init_options = {
        licenceKey = os.getenv("intelephense_key")
    },
    --on_attach = function()
        --print("Intelephense LSP started")
    --end,
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({"n", "v"}, "<leader>e", vim.diagnostic.open_float, {})
