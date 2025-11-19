vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Open mini.files when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("flo-open-directory", { clear = true }),
  callback = function(args)
    local path = args.file
    if vim.fn.isdirectory(path) == 1 then
      vim.cmd("bd")  -- Close the directory buffer
      require("mini.files").open(path)
    end
  end,
})
