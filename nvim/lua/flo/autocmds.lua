-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("flo", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open mini.files when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("flo", { clear = true }),
  callback = function(args)
    local path = args.file
    if vim.fn.isdirectory(path) == 1 then
      vim.cmd("bd") -- Close the directory buffer
      require("mini.files").open(path)
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("flo-lsp", { clear = true }),
  callback = function(args)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      buffer = args.buf,
      desc = "[g]o to [d]efinition",
    })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {
      buffer = args.buf,
      desc = "[g]o to [r]eferences",
    })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {
      buffer = args.buf,
      desc = "[K]hover documentation",
    })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
      buffer = args.buf,
      desc = "[c]ode [a]ction",
    })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
      buffer = args.buf,
      desc = "[r]e[n]ame symbol",
    })
    vim.keymap.set("n", "<leader>d", function()
      vim.diagnostic.open_float(nil, { focus = false, border = "single" })
    end, { desc = "show line [d]iagnostics" })
  end,
})

-- Restore cursor position when reopening a file
vim.api.nvim_create_autocmd('BufReadPost', {
    group   = vim.api.nvim_create_augroup("flo", { clear = true }),
    pattern = '*',
    command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif]]
})
