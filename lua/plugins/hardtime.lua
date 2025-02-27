return {
  'm4xshen/hardtime.nvim',
  dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  opts = {
    disabled_filetypes = { 'qf', 'netrw', 'NvimTree', 'lazy', 'mason', 'oil', 'neo-tree' },
    enabled = false,
  },

  keys = {
    { '<leader>ht', '<cmd>Hardtime toggle<cr>', desc = 'Toggle Hardtime' },
  },
}
