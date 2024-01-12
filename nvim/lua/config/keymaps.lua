-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<ESC>", { silent = true })
vim.keymap.set("n", "∆", ":m+<CR>", { silent = true })
vim.keymap.set("n", "˚", ":m-2<CR>", { silent = true })
