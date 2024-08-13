return {
  name = 'Ninja Build (Release)',
  builder = function()
    return {
      cmd = { 'ninja' },
      args = { '-Cbuild/Release', '-j26' },
      components = { 'default' },
    }
  end,
  condition = {
    filetype = { 'cpp', 'hpp', 'cmake' },
  },
}
