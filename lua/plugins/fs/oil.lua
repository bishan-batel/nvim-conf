return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    delete_to_trash = true,
  },
  keys = {
    {
      '-',
      '<cmd>Oil<cr>',
      desc = 'Open Parent Directory',
    },
    {
      '<leader>-',
      function() require('oil').open_float() end,
      desc = 'Open Parent Directory'
    }
  },
}
