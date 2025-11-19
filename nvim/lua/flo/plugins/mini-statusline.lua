return {
  "nvim-mini/mini.statusline",
  version = false,
  dependencies = {
    "nvim-mini/mini.icons",
    "nvim-mini/mini-git",
    "nvim-mini/mini.diff",
  },
  config = function()
    require("mini.statusline").setup({
      use_icons = true,
    })
  end,
}
