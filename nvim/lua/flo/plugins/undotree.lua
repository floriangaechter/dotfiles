return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_SplitWidth = 50
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "toggle undotree" },
  },
}
