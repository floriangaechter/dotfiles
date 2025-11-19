return {
  "nvim-mini/mini.pick",
  version = false,
  keys = {
    {
      "<leader>ff",
      function()
        require("mini.pick").builtin.files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fg",
      function()
        require("mini.pick").builtin.grep_live()
      end,
      desc = "Grep text",
    },
    {
      "<leader>fb",
      function()
        require("mini.pick").builtin.buffers()
      end,
      desc = "Find buffers",
    },
  },
  config = function()
    require("mini.pick").setup()
  end,
}
