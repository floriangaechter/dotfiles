-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Get architecture information
local arch = vim.fn.system("uname")

-- Exit insert mode with jj
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Remap opt+j and opt+k to move lines on mac
if arch:match("Darwin") then
  vim.keymap.set("n", "∆", ":m+<Cr>", { silent = true, desc = "Move line up" })
  vim.keymap.set("n", "˚", ":m-2<Cr>", { silent = true, desc = "Move line down" })
end
if arch:match("Linux") then
  vim.keymap.set("n", "<M-j>", ":m+<Cr>", { silent = true, desc = "Move line up" })
  vim.keymap.set("n", "<M-k>", ":m-2<Cr>", { silent = true, desc = "Move line down" })
end
