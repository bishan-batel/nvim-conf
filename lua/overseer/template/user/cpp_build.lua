return {
  name = 'Ninja Build (Debug)',
  builder = function()
    -- Full path to current file (see :help expand())
    -- local file = vim.fn.expand '%:p'
    return {
      cmd = { 'ninja' },
      args = { '-Cbuild/Debug', '-j26' },
      components = { { 'on_output_quickfix', open = true }, 'default' },
    }
  end,
  condition = {
    filetype = { 'cpp', 'hpp', 'cmake' },
  },
}
