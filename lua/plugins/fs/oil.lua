return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      delete_to_trash = true,
    }
  end,
  keys = {
    {
      '-',
      '<cmd>Oil<cr>',
      desc = 'Open Parent Directory',
    },
    {
      '<leader>-',
      function()
        require('oil').open_float()
      end,
      desc = 'Open Parent Directory',
    },
  },
}
