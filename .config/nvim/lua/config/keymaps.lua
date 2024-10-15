vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "Clear highlight"})


-- Window management
keymap.set("n", "<leader>sv", "<cmd>vsplit .<CR>", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<cmd>split .<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- other Split keymaps are in the smart-split plugin
-- This has to be done because those keymaps have: 'require("smart-splits").' inside of them
-- If 'smart-splits' is not installed and the keymappings for it were here an error would occurre
--[[
keymap.set("n", "<c-h", "<cmd>:wincmd h<CR>", { desc = "Swtiches between split-pane" })
keymap.set("n", "<c-j", "<cmd>:wincmd j<CR>", { desc = "Swtiches between split-pane" })
keymap.set("n", "<c-k", "<cmd>:wincmd k<CR>", { desc = "Swtiches between split-pane" })
keymap.set("n", "<c-l", "<cmd>:wincmd l<CR>", { desc = "Swtiches between split-pane" })


-- Consistent resizing regardless of split position
keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Left>", "<C-w><", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<C-w>>", { desc = "Increase window width" })
--]]

-- Don't put removed characters into clipboard registry
keymap.set("n", "x", '"_x')

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
keymap.set("n", "<leader>tt", "<cmd>tab term<CR>", { desc = "Open a new terminal tab" })
keymap.set("n", "<leader>tc", "<cmd>BufferLinePick<CR>", { desc = "Pick a Tab to open" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })


-- Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message " })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message " })


-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
