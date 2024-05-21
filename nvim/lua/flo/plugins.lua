local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Color scheme
  { import = 'flo.plugins.tokyonight' },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Better commenting
  { import = 'flo.plugins.comment' },

  -- Show git changes in the signcolumn
  { import = 'flo.plugins.gitsigns' },

  -- Useful plugin to show you pending keybinds.
  { import = 'flo.plugins.which-key' },

  -- Fuzzy Finder (files, lsp, etc)
  { import = 'flo.plugins.telescope' },

  -- LSP Configuration & Plugins
  { import = 'flo.plugins.lsp' },

  -- Autoformat
  { import = 'flo.plugins.conform' },

  -- Autocompletion
  { import = 'flo.plugins.nvim-cmp' },

  -- Highlight todo, notes, etc in comments
  { import = 'flo.plugins.todo-comments' },

  -- Session persistence
  { import = 'flo.plugins.persistence' },

  -- Collection of various small independent plugins/modules
  { import = 'flo.plugins.mini' },

  -- Highlight, edit, and navigate code
  { import = 'flo.plugins.treesitter' },

  -- Navigate between Neovim and tmux
  { import = 'flo.plugins.tmux-navigator' },

  -- Basic mdx support
  { import = 'flo.plugins.mdx' },

  -- Harpoon
  { import = 'flo.plugins.harpoon' },

  -- Neo-tree
  { import = 'flo.plugins.neo-tree' },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
