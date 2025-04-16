return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "day",
		light_style = "day",
	},
	config = function()
		vim.cmd.colorscheme("tokyonight")
	end,
}
