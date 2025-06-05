return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"astro",
					"lua_ls",
					"marksman",
					"tailwindcss",
					"vtsls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set("n", "<space>cd", vim.diagnostic.open_float, { desc = "[c]ode [d]iagnostic" })
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("error", opts, { desc = "hover" }))
					vim.keymap.set(
						"n",
						"<C-k>",
						vim.lsp.buf.signature_help,
						vim.tbl_extend("error", opts, { desc = "signature help" })
					)
					vim.keymap.set(
						"n",
						"<space>rn",
						vim.lsp.buf.rename,
						vim.tbl_extend("error", opts, { desc = "[r]e[n]ame" })
					)
					vim.keymap.set(
						{ "n", "v" },
						"<space>ca",
						vim.lsp.buf.code_action,
						vim.tbl_extend("error", opts, { desc = "[c]ode [a]ction" })
					)
				end,
			})

			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}

						return diagnostic_message[diagnostic.severity]
					end,
				},
			})
		end,
	},
}
