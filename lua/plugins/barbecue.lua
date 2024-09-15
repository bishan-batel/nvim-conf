return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  config = function()
    require('barbecue').setup {
      theme = 'catppuccin',
      create_autocmd = true,
      exclude_filetypes = { 'netrw', 'toggleterm', 'neo-tree' },
      dim_dirname = true,
      bold_basename = true,
      dim_context = false,
      alt_background = false,
    }
    -- triggers CursorHold event faster
    vim.opt.updatetime = 200

    require('barbecue.ui').toggle(true)

    vim.api.nvim_create_autocmd({
      'WinScrolled', -- or WinResized on NVIM-v0.9 and higher
      'BufWinEnter',
      'CursorHold',
      'InsertLeave',

      -- include this if you have set `show_modified` to `true`
      'BufModifiedSet',
    }, {
      group = vim.api.nvim_create_augroup('barbecue.updater', {}),
      callback = function()
        require('barbecue.ui').update()
      end,
    })
  end,
  keys = {
    {
      '<leader>bt',
      function()
        require('barbecue.ui').toggle()
      end,
      desc = 'Toggle Winbar',
    },
  },
}
