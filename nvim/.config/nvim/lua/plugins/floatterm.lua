return {
  'voldikss/vim-floaterm',
  config = function()
    local keymap = vim.keymap
    keymap.set('n', '<leader>tt', ':FloatermNew<CR>', { desc = 'Open floating terminal window' })
    keymap.set('n', '<leader>tq', ':FloatermKill<CR>', { desc = 'Kill floating terminal window' })
  end,
}
