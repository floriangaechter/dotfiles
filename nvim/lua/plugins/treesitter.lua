return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "astro", "bash", "css", "lua", "vim", "vimdoc", "query", "javascript", "html", "typescript", "markdown", "json" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<enter>",
          node_incremental = "<enter>",
          scope_incremental = false,
          node_decremental = "<backspace>",
        },
      },
    })
  end
}
