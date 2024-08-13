return {
  name = 'Ninja Build (Debug)',
  builder = function()
    return {
      cmd = { 'ninja' },
      args = { '-Cbuild/Debug', '-j26' },
      components = { 'default' },
    }
  end,
  condition = {
    filetype = { 'cpp', 'hpp', 'cmake' },
  },
}
