return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	--@type snacks.Config
	opts = {
		indent = {
			animate = {
				enabled = false,
			},
		},
		picker = {
			sources = {
				explorer = {
					auto_close = true,
					layout = {
						cycle = true,
						preview = true,
						layout = {
							box = "horizontal",
							position = "float",
							height = 0.8,
							width = 0.8,
							border = "none",
							{
								box = "vertical",
								width = 40,
								min_width = 40,
								border = "rounded",
								title = "Explorer",
								{ win = "input", height = 1, border = "bottom" },
								{ win = "list" },
							},
							{ win = "preview", title = "{preview}", border = "rounded" },
						},
					},
				},
			},
		},
		explorer = { enabled = true },
		dashboard = {
			sections = {
				{
					section = "terminal",
					cmd = "chafa ~/.config/nvim/neovim.png --format symbols --symbols vhalf --size 12; sleep .1",
					height = 8,
					indent = 24,
					padding = { 4, 0 },
				},
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			enabled = true,
		},
		notifier = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		-- Top Pickers & Explorer
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "[n]otification history",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "file [e]xplorer",
		},
		-- find
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[f]ind [b]uffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[f]ind [c]onfig file",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "[f]ind [f]ile",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "[f]ind [g]it file",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "[f]ind [r]ecent file",
		},
		-- git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "[g]it [b]ranches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "[g]it [l]og",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "[g]it [s]tatus",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "[g]it [S]tash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "[g]it [d]iff",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "[g]it log [f]ile",
		},
		-- Grep
		{
			"<leader>sb",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "[s]search open [b]uffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "[s]earch files ([g]rep)",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "[s]earch visual selection or [w]ord",
			mode = { "n", "x" },
		},
		-- search
		{
			"<leader>sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "[s]search [c]ommand history",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "[s]search [C]ommands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[s]search [d]iagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "[s]earch [h]elp",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "[s]earch [u]ndo history",
		},
		-- LSP
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "[g]oto [d]efinition",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "[g]oto [D]eclaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "[g]oto [r]eferences",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "[g]oto [I]mplementation",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "[g]oto t[y]pe definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "[s]earch [s]ymbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "[s]earch workspace [S]ymbols",
		},
	},
}
