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
