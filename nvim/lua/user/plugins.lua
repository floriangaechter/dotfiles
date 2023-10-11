-- Bootstrap Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Color scheme
	{ import = 'user.plugins.catpuccin' },

	-- Commenting support
	{ import = 'user.plugins.vim-commentary' },

	-- Add, change, and delete surrounding text
	{ 'tpope/vim-surround' },

	-- Useful commands like :Rename and :SudoWrite
	{ 'tpope/vim-eunuch' },

	-- Pairs of handy bracket mappings, like [b and ]b
	{ 'tpope/vim-unimpaired' },

	-- Indent autodetection with editorconfig support
	{ 'tpope/vim-sleuth' },

	-- Allow plugins to enable repeating of commands
	{ 'tpope/vim-repeat' },

	-- Navigate seamlessly between Vim windows and tmux panes
	{ 'christoomey/vim-tmux-navigator' },

	-- Jump to the last location when opening a file
	{ 'farmergreg/vim-lastplace' },

	-- Enable * searching with visually selected text
	{ 'nelstrom/vim-visual-star-search' },

	-- Automatically create parent dirs when saving
	{ 'jessarcher/vim-heritage' },

	-- Text objects for HTML attributes
	{ 'whatyouhide/vim-textobj-xmlattr', dependencies = 'kana/vim-textobj-user' },

	-- Automatically set the working directory to the project root
	{ import = 'user.plugins.vim-rooter' },

	-- Automatically add closing brackets, quotes, etc.
	{ 'windwp/nvim-autopairs', config = true },

	-- Add smooth scrolling to avoid jarring jumps
	{ 'karb94/neoscroll.nvim', config = true },

	-- All closing buffers without closing the split window
	{ import = 'user.plugins.bufdelete' },

	-- Split arrays and methods onto multiple lines, or join them back up
	{ import = 'user.plugins.splitjoin' },

	-- Automatically fix indentation when pasting code
	{ import = 'user.plugins.vim-pasta' },

	-- Fuzzy finder
	{ import = 'user.plugins.telescope' },

	-- File tree sidebar
	{ import = 'user.plugins.nvim-tree' },

	-- A Status line
	{ import = 'user.plugins.lualine' },

	-- Display indentation lines
	{ import = 'user.plugins.indent-blankline' },

	-- Git integration
	{ import = 'user.plugins.gitsigns' },
})

