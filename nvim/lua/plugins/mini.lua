return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.icons").setup()
		require("mini.statusline").setup({ use_icons = true })
		require("mini.surround").setup()
	end,
}
