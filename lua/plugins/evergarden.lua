return {
	"comfysage/evergarden",
	name = "evergarden",
	priority = 1000,
	opts = {
		transparent_background = false,
		contrast_dark = "medium", -- 'hard'|'medium'|'soft'
		override_terminal = true,
		style = {
			tabline = { reverse = true, color = "green" },
			search = { reverse = false, inc_reverse = true },
			types = { italic = true },
			keyword = { italic = true },
			comment = { italic = false },
		},
		overrides = {}, -- add custom overrides
	},
	config = function()
		vim.cmd.colorscheme("evergarden")
	end,
}
