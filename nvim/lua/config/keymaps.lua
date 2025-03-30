-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move!'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move!'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move!'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move!'<CR>")

vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "[B]uffer [d]elete" })

-- Save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Exit insert mode with jj
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
