return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = 'storm',
    transparent = true,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
    on_colors = function(colors)
      colors.fg_gutter = '#627E97'
    end,
  },
  init = function()
    vim.cmd.colorscheme 'tokyonight-storm'
    vim.cmd([[highlight MiniStatuslineFilename blend=0 guibg=NONE]])
  end,
}
