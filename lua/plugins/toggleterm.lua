return {
  'akinsho/toggleterm.nvim',
  lazy = false,
  opts = {
    shell = 'nu',
    open_mapping = '<C-\\>',
    autochdir = true,
    terminal_mappings = true,
    direction = 'float',
    float_opts = {
      border = 'rounded',
    },
    winbar = {
      enabled = true,
    },
  },
  keys = {
    {
      '<C-\\>',
      function() end,
    },
  },
}
