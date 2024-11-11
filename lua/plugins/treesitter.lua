return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
    config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = { enable = true },
			sync_install = { enable = false },
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"php",
				"phpdoc",
				"css",
				"html",
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
		})
	end,
}
