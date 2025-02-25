return
--- @type LazyPlugin
{
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dim = {
      enabled = true,
      animate = {
        duration = {
          step = 16, -- ms per step
          total = 100, -- maximum duration
        },
      },
    },
    explorer = { enabled = false },
    indent = {
      enabled = true,
      only_current = true,
      animate = {
        enabled = false,
      },
      chunk = {
        enabled = false,
      },
    },
    lazygit = {},
    image = { enabled = true },
    input = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    {
      '<leader>dm',
      function()
        local snacks = require 'snacks'

        if snacks.dim.enabled then
          snacks.dim.disable()
        else
          snacks.dim.enable()
        end
      end,
      mode = 'n',
      desc = 'Dim Buffer',
    },
    {
      '<leader>bd',
      function()
        require('snacks').bufdelete.delete()
      end,
      mode = 'n',
      desc = 'Deletes Current Buffer',
    },
    {
      '<leader>lg',
      function()
        require('snacks').lazygit.open()
      end,
      mode = 'n',
      desc = 'Open LazyGit',
    },
    {
      '<leader>.',
      function()
        require('snacks').scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>s.',
      function()
        require('snacks').scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
  },
}
