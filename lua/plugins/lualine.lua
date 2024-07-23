return {
  'nvim-lualine/lualine.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      theme = 'catppuccin',
      section_separators = '',
      component_separators = '',
    },
    sections = {
      lualine_a = {
        {
          'filename',
          path = 1,
          separator = { left = '', right = '' },
          color = { gui = 'bold' },
          padding = 0,
          shorting_target = 0,
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {
        'overseer',
      },
      lualine_y = {},
      lualine_z = {
        {
          '%l/%L,%c',
          padding = 1,
        },
        {
          'filetype',
          padding = 0,
        },
      },
    },
    inactive_sections = {
      lualine_a = {
        {
          'filename',
          path = 1,
          padding = 1,
          shorting_target = 0,
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        {
          '%l/%L,%c',
          padding = 1,
        },
        {
          'filetype',
          padding = 0,
        },
      },
    },
  },
}
