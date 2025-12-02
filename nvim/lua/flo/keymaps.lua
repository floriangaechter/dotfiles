-- Clear search highlight on Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Center screen on search navigation
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Map 'jj' to escape insert mode
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Save with Ctrl+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- Quit Neovim with <leader>q
vim.keymap.set("n", "<leader>q", ":confirm q<CR>", { noremap = true, silent = true })

-- "fix" q
vim.keymap.set("n", "q:", "<nop>")
vim.keymap.set("n", "q/", "<nop>")
vim.keymap.set("n", "q?", "<nop>")
vim.keymap.set("n", "Q", "<nop>")
