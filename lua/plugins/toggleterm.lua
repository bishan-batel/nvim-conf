return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    shell = vim.o.shell,
    open_mapping = '<C-\\>',
    autochdir = true,
    terminal_mappings = true,
    direction = 'float',
    winbar = {
      enabled = true,
    },
  },
}
