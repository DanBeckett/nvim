return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	build = ":TSUpdate",
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
				"vim",
				"vimdoc",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
