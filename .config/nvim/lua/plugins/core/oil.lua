return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, 

config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        restrict_to_cwd = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, bufnr)
              return (name == ".." and bufnr == 1)
          end,
        },
        float = {
          padding = 2,
          max_width = 90,
          max_height = 0,
        },
        win_options = {
        wrap = true,
        winblend = 0,
        },
        keymaps = {
          ["<C-c>"] = false,
          ["<C-h>"] = false, --Disables conflicts with vim-tmux-navigator
          ["<C-l>"] = false, 
          ["q"] = "actions.close",
        },
      })

      vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,

}



