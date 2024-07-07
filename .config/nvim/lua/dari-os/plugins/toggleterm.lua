return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 60,
			open_mapping = [[<leader>t]],
			direction = "vertical",
			shade_terminals = true,
			-- Specify that the mapping should only work in normal mode
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"n",
					"<leader>t",
					"<cmd>ToggleTerm<CR>",
					{ noremap = true, silent = true }
				)
				vim.api.nvim_buf_set_keymap(
					term.bufnr,
					"t",
					"<leader>t",
					"<cmd>ToggleTerm<CR>",
					{ noremap = true, silent = true }
				)
			end,
			-- Disable the default insert mode mapping
			insert_mappings = false,
		})

		-- Set the mapping only for normal mode globally
		vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
	end,
}
