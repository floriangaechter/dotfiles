vim.filetype.add({
  extension = {
    gohtml = "gohtml",
  }
})

vim.treesitter.language.register('gotmpl', 'gohtml')

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "html",
      "css",
      "lua",
      "vim",
      "vimdoc",
      "go",
      "gotmpl",
      "typescript",
      "tsx",
      "javascript",
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
