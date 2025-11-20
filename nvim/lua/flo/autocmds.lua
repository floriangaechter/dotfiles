vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
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
    vim.keymap.set("n", "<leader>d", function()
      vim.diagnostic.open_float(nil, { focus = false, border = "single" })
    end, { desc = "Show line diagnostics" })
  end,
})

-- Open mini.files when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("flo-open-directory", { clear = true }),
  callback = function(args)
    local path = args.file
    if vim.fn.isdirectory(path) == 1 then
      vim.cmd("bd") -- Close the directory buffer
      require("mini.files").open(path)
    end
  end,
})
