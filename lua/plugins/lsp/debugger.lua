return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
      'nvim-tree/nvim-web-devicons',
      'jay-babu/mason-nvim-dap.nvim',
    },
    lazy = true,
    config = function()
      local dap = require 'dap'

      local ui = require 'dapui'

      ui.setup()

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          'delve',
        },
      }

      require('nvim-dap-virtual-text').setup {}

      vim.api.nvim_set_hl(0, 'DapStoppedLinehl', { bg = '#555530' })
      vim.fn.sign_define('DapStopped', { text = '󰅂', texthl = 'Error', linehl = 'DapStoppedLinehl', numhl = '' })

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]AP Toggle [B]reakpoint' })
      -- vim.keymap.set('n', '<leader>drc', dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set('n', '<leader>d?', function()
        ---@diagnostic disable-next-line: missing-fields
        ui.eval(nil, { enter = true })
      end, { desc = '[D]AP Evaluate variable under cursor' })

      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]AP [C]ontinue' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]AP Step [I]nto' })
      vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = '[D]AP Step Over ([N]ext)' })
      vim.keymap.set('n', '<leader>dp', dap.step_back, { desc = '[D]AP Step [B]ack ([P]revious)' })
      vim.keymap.set('n', '<leader>do', dap.step_out, { desc = '[D]AP Step [O]out' })
      vim.keymap.set('n', '<leader>dr', dap.restart, { desc = '[D]AP [R]estart' })
      vim.keymap.set('n', '<leader>du', dap.restart, { desc = '[D]AP [R]estart' })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
    keys = {
      '<leader>dc',
    },
  },
}
