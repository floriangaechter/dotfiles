return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"astro",
				"bash",
				"c",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"php",
				"query",
				"typescript",
				"vim",
				"vimdoc",
			},
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
	end,
}
