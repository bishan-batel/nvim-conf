return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    delete_to_trash = true,
  },
  kets = {
    {
      '-',
      '<cmd>Oil<cr>',
      desc = 'Open Parent Directory',
    },
  },
}
