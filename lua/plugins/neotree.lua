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
        require("neo-tree").setup({
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols", 
			},
			document_symbols = {
				follow_cursor = true,
				kinds = { "Class", "Function", "Method", "Variable", "Constant" },
			},
			-- source_selector = {
			--	winbar = true,
			--	sources = {
			--		{ source = "filesystem", display_name = "  Files " },
			--		{ source = "buffers", display_name = "  Buffers " },
			--		{ source = "git_status", display_name = "  Git " },
			--		{ source = "document_symbols", display_name = "  Symbols " },
			--	},
			-- },
		})
		-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {}) -- default
		vim.keymap.set("n", "<leader>pf", ":Neotree toggle filesystem left <CR>", {}) -- project browser / project bar
		vim.keymap.set("n", "<leader><Tab>", ":Neotree toggle filesystem reveal float<CR>", {})
		vim.keymap.set("n", "<leader>o", ":Neotree toggle buffers reveal float<CR>", {}) -- open buffers (as in, list buffers that are open)
		-- add a command to tidy up in case a float is accidentally
		-- closed with Esc, leaving an unlisted buffer open
		vim.api.nvim_create_user_command("NeoTreeClean", function()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				local name = vim.api.nvim_buf_get_name(buf)
				if name:match("neo%-tree filesystem") then
					-- check if it's valid and not loaded in a window
					if vim.api.nvim_buf_is_valid(buf) and not vim.api.nvim_buf_is_loaded(buf) then
						vim.api.nvim_buf_delete(buf, { force = true })
					elseif vim.api.nvim_buf_is_valid(buf) then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
			end
		end, {})
		-- clean up any Neo-tree buffers that are left open automatically
        -- using the NeoTreeClean command set up above
        vim.api.nvim_create_autocmd("WinClosed", {
			callback = function(args)
				local winid = tonumber(args.match)
				local bufnr = vim.fn.winbufnr(winid)

				if not vim.api.nvim_buf_is_valid(bufnr) then
					return
				end

				local bufname = vim.api.nvim_buf_get_name(bufnr)
				local config = vim.api.nvim_win_get_config(winid)

				-- Match any Neo-tree source in float mode
				if bufname:match("neo%-tree") and config.relative ~= "" then
					vim.schedule(function()
						vim.cmd("NeoTreeClean")
					end)
				end
			end,
		})
	end,
}
