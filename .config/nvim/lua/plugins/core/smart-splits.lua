return { 
'mrjones2014/smart-splits.nvim',

config = function()
    require('smart-splits').setup({
        resize_mode = {
    hooks = {
      on_leave = require('bufresize').register,
    },
  },
    })
    -- moving between splits
    vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
    vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
    vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
    vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
    vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)

    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<C-Up>` will `resize_left` by `(10 * config.default_amount)`
    vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left)
    vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down)
    vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up)
    vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right)


    -- Removed in favor of the buffersize plugin
    --[[
        -- Add autocmd for automatic resizing
        vim.api.nvim_create_autocmd("VimResized", {
            pattern = "*",
            command = "wincmd =",
            desc = "Automatically resize splits when terminal is resized",
        })
    --]]
end

}
