return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons

  config = function()
    require('render-markdown').setup({
        file_types = { 'markdown', 'quarto' },
        render_modes = { 'n', 'c' },
        sign = {
				enabled = false,
		  	},
    })


    vim.keymap.set("n", "<leader>m", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggles Markdown rendering" })
  end
}
