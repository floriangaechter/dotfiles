return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'gruvbox'
    vim.cmd.hi 'Comment gui=none'
    vim.cmd.hi 'SignColumn guibg=none'

    -- fix
    -- git signs column bg
    vim.cmd [[ hi! SignColumn guibg=NONE ]]

    -- fix
    -- winbar bg
    vim.cmd [[ hi! WinBar guibg=NONE ]]
    vim.cmd [[ hi! WinBarNC guibg=NONE ]]

    -- fix
    -- noice cmd line bg
    vim.cmd [[ hi! NoiceCmdlinePopup guibg=#282828 ]]
    vim.cmd [[ hi! NoiceCmdlinePopupBorder guibg=#282828 ]]

    -- fix
    -- telescope selection bg
    vim.cmd [[ hi! TelescopeSelection guibg=#3c3836 guifg=#fe8019 gui=bold ]]

    -- fix
    -- diagnostics sign bg (next to numbers line)
    vim.cmd [[ hi! DiagnosticSignOk guifg=#b8bb26 guibg=#282828 ]]
    vim.cmd [[ hi! DiagnosticSignInfo guifg=#83a598 guibg=#282828 ]]
    vim.cmd [[ hi! DiagnosticSignWarn guifg=#fabd2f guibg=#282828 ]]
    vim.cmd [[ hi! DiagnosticSignError guifg=#fb4934 guibg=#282828 ]]

    -- fix
    -- lsp saga bg
    vim.cmd [[ hi! SagaNormal guibg=#282828 ]]
  end,
}
