return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'yavorski/lualine-macro-recording.nvim',
    'catppuccin/nvim',
  },
  lazy = false,
  config = function()
    local mocha = require 'catppuccin.palettes.mocha'

    require('lualine').setup {
      options = {
        theme = 'catppuccin',
        section_separators = { left = '', right = '' },
        component_separators = '',
      },
      sections = {
        lualine_a = {
          {
            'mode',
            color = {
              gui = 'bold',
            },
            separator = { right = '', left = '' },
            padding = 0,
            shorting_target = 0,
            icons_enabled = true,
          },
        },
        lualine_b = {
          {
            'branch',
            color = { gui = 'italic,bold', bg = mocha.mantle },
            shorting_target = 0,
          },
          {
            'diff',
            colored = true,
            color = { gui = 'italic,bold', bg = mocha.mantle },
            -- separator = { right = '' },
          },
        },
        lualine_c = {
          {
            'filename',
            path = 1,
            -- separator = { right = '', left = '' },
            separator = { left = '' },
            color = { gui = 'bold,italic', bg = mocha.mauve, fg = mocha.mantle },
            padding = 1,
            shorting_target = 0,
          },
          {
            'harpoon2',
            color = { gui = 'italic', bg = mocha.mantle },
            separator = { right = '', left = '' },
            padding = 1,
            icon = '󰀱',
            indicators = { '󱅊', '󱅋', '󱅌', '󱅍', '󱅎', '󱅏' },
            active_indicators = { '󰇊', '󰇋', '󰇌', '󰇍', '󰇎', '󰇏' },
            no_harpoon = '[N/A]',
          },
        },
        lualine_x = {
          {
            'macro_recording',
            '%s',
            separator = { left = '' },
            color = { gui = 'italic', fg = mocha.red },
          },
          {
            'overseer',
            separator = { left = '' },
          },
        },
        lualine_y = {
          {
            'diagnostics',
            separator = { left = '' },
          },
        },
        lualine_z = {
          {
            'location',
            padding = 1,
            color = { gui = 'italic' },
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
