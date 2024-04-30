return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {}) -- default
		vim.keymap.set("n", "<leader>pf", ":Neotree focus filesystem left toggle<CR>", {}) -- project browser / project bar
        vim.keymap.set("n", "<leader><Tab>", ":Neotree focus filesystem float<CR>", {})
        vim.keymap.set("n", "<leader>o", ":Neotree focus buffers float<CR>", {}) -- open buffers (as in, list buffers that are open) 
    end,
}
