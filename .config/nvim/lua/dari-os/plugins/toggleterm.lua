return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 60,
			open_mapping = [[<leader>t]],
			direction = "vertical",
			shade_terminals = true,
		})
	end,
}
