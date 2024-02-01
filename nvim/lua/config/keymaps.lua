-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", ";;", "<Esc>A;<Esc>")
vim.keymap.set("i", ",,", "<Esc>A,<Esc>")
vim.keymap.set("n", "∆", ":m+<Cr>", { silent = true, desc = "Move line up" })
vim.keymap.set("n", "˚", ":m-2<Cr>", { silent = true, desc = "Move line down" })
