return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'rmagatti/auto-session',
  },
  config = function()
    local mocha = require 'catppuccin.palettes.mocha'

    require('lualine').setup {
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
            color = { bg = mocha.mauve, gui = 'bold' },
            padding = 0,
            shorting_target = 0,
          },
        },
        lualine_b = {
          {
            'branch',
            separator = { right = '' },
            color = { gui = 'bold' },
            shorting_target = 0,
          },
          {
            'diff',
            separator = { right = '' },
          },
        },
        lualine_c = {
          'diagnostics',

          {
            'buffers',
            use_mode_colors = true,
            filetype_names = {
              TelescopePrompt = 'Telescope',
              dashboard = 'Dashboard',
              packer = 'Packer',
              fzf = 'FZF',
              alpha = 'Alpha',
            },
          },
        },
        lualine_x = {
          'overseer',
        },
        lualine_y = {},
        lualine_z = {
          {
            require('auto-session.lib').current_session_name,
            separator = { left = '', right = '' },
          },
          {
            '%l/%L,%c',
            padding = 1,
            color = { bg = mocha.base, fg = mocha.subtext1, gui = 'italic' },
            separator = { left = '' },
          },
          {
            'filetype',
            padding = 0,
            gui = 'italic',
            color = { gui = 'italic,bold' },
            separator = { left = '', right = '' },
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
            color = { fg = 'DiagnosticWarn' },
            padding = 1,
          },
          {
            'filetype',
            padding = 0,
          },
        },
      },
    }
  end,
}
