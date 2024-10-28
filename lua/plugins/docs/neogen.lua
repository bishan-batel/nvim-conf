return {
  'danymat/neogen',
  config = function()
    require('neogen').setup {
      languages = {
        ['cpp.doxygen'] = require 'neogen.configurations.cpp',
      },
    }
  end,
  keys = {
    {
      '<leader>ng',
      function()
        require('neogen').generate()
        require('neogen').setup { snippet_engine = 'luasnip' }
      end,
      silent = true,
    },
  },
  -- Uncomment next line if you want to follow only stable versions
}
