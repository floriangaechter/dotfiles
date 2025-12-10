return {
  "nvim-mini/mini.files",
  version = false,
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open()
      end,
      desc = "file explorer",
    },
  },
  config = function()
    require("mini.files").setup({ windows = { preview = true, width_preview = 50 } })
  end,
}
