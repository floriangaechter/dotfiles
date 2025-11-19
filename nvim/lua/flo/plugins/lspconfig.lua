return {
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      float = { border = "rounded" },
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("flo-lsp-attach", { clear = true }),
      callback = function(args)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
          buffer = args.buf,
          desc = "Go to definition",
        })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {
          buffer = args.buf,
          desc = "Find references",
        })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
          buffer = args.buf,
          desc = "Hover documentation",
        })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
          buffer = args.buf,
          desc = "Code action",
        })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
          buffer = args.buf,
          desc = "Rename symbol",
        })
      end,
    })
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
    vim.lsp.enable("lua_ls")
  end,
}
