return {
  "saghen/blink.cmp",
  version = "*",
  config = function()
    require("blink.cmp").setup({
      keymap = {
        preset = "default",
        ["<C-y>"] = { "accept", "fallback" },
        ["<CR>"] = {},
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
      },
      sources = {
        default = { "lsp", "path", "buffer" },
      },
    })
  end,
}
