return {
  name = 'Ninja Build (Release)',
  builder = function()
    return {
      cmd = { 'ninja' },
      args = { '-Cbuild/Release', '-j26' },
      components = { { 'on_output_quickfix', open = true }, 'default' },
    }
  end,
  condition = {
    filetype = { 'cpp', 'hpp', 'cmake' },
  },
}
