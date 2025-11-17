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
    settings = {
        intelephense = {
            inlayHints = {
                parameterNames = {
                    enabled = "all" 
                },
                parameterTypes = {
                    enabled = true
                },
                functionReturnTypes = {
                    enabled = true
                },
                variableTypes = {
                    enabled = true
                }
            }
        }
    },
    on_attach = function(client, bufnr)
        print("Intelephense LSP started")
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            vim.keymap.set("n", "<leader>ih", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                vim.notify("inlay hints: " .. tostring(vim.lsp.inlay_hint.is_enabled()))
            end)
        end
    end,
})

--vim.lsp.config('phpactor', {
--    capabilities = capabilities,
--    cmd = { 'phpactor', 'language-server' },
--    filetypes = { 'php' },
--    root_dir = vim.fs.root(0, { 'composer.json', '.git' }),
--    settings = {
--        phpactor = {
--            --inlayHints = {
--                --enable = true,
--                --params = true,
--            --}
--        }
--    },
--    init_options = {
--        ['language_server_worse_reflection.inlay_hints.enable'] = true,
--        ['language_server_worse_reflection.inlay_hints.params'] = true,
--        ['language_server_worse_reflection.inlay_hints.types'] = false,
--    },
--    on_attach = function(client, bufnr)
--        -- Enable inlay hints if supported
--        if client.server_capabilities.inlayHintProvider then
--            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
--            vim.keymap.set("n", "<leader>ih", function()
--                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
--            end)
--        end
--
--        -- Optional: Print confirmation
--        print("phpactor LSP started")
--    end,
--})

vim.lsp.enable('eslint', {
    capabilities = capabilities,
    --on_attach = function()
        --print("ESLint LSP started")
    --end,
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({"n", "v"}, "<leader>e", vim.diagnostic.open_float, {})
