-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Defer clipboard to avoid startup delay
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- Display whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Rounded borders for floating windows
vim.opt.pumblend = 10  -- Slight transparency for popup menu
vim.diagnostic.config({
  float = { border = "rounded" },
})
