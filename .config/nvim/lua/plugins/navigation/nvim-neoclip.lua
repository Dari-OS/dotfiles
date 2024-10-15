return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    {"kkharji/sqlite.lua", module = "sqlite"},
     {"nvim-telescope/telescope.nvim"},
  },
  config = function()
    require("neoclip").setup({})
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope neoclip<CR>", { desc = "Show the clipboard history" })
  end,
}
