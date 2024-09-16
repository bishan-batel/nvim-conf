return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- signs = {
      --   add = { text = '+' },
      --   change = { text = '~' },
      --   delete = { text = '_' },
      --   topdelete = { text = '‾' },
      --   changedelete = { text = '~' },
      -- },
    },
    keys = {
      { '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', desc = '[G]it: [P]review Hunk' },
      { '<leader>gt', '<cmd>Gitsigns toggle_current_line_blame<cr>', desc = '[G]it: [T]oggle blame on current line' },
    },
  },
}
