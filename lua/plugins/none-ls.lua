return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.phpcsfixer,
				null_ls.builtins.formatting.prettier,
				--null_ls.builtins.diagnostics.eslint_d,
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.diagnostics.phpcs,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        vim.keymap.set("n", "<leader>dl", function()
            vim.diagnostic.open_float(nil, { focusable = false, scope = "line" })
        end, { desc = "View line diagnostics" })
	end,
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
}
