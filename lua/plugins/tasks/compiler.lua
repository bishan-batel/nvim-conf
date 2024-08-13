return { -- This plugin
  'Zeioth/compiler.nvim',
  cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
  dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },
  opts = {},
  keys = {
    { '<leader>co', '<cmd>CompilerOpen<cr>', desc = 'Open Compiler Window' },
    { '<leader>ct', '<cmd>CompilerToggleResults<cr>', desc = 'Toggle Compiler Results' },
    { '<leader>cr', '<cmd>CompilerRedo<cr>', desc = 'Toggle Compiler Results' },
    { '<leader>cs', '<cmd>CompilerStop<cr>', desc = 'Toggle Compiler Results' },
  },
}
