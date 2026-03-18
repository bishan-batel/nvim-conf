return {
  'stevearc/overseer.nvim',
  ---@type overseer.Config
  opts = {
    dap = false,
    templates = {
      'builtin',
    },
    task_list = {
      direction = 'bottom',
      bindings = {
        ['?'] = 'ShowHelp',
        ['g?'] = 'ShowHelp',
        ['<CR>'] = 'RunAction',
        ['<C-e>'] = 'Edit',
        ['o'] = 'Open',
        ['<C-v>'] = 'OpenVsplit',
        ['<C-s>'] = 'OpenSplit',
        ['<C-f>'] = 'OpenFloat',
        ['<C-q>'] = 'OpenQuickFix',
        ['p'] = 'TogglePreview',
        ['L'] = 'IncreaseAllDetail',
        ['H'] = 'DecreaseAllDetail',
        ['['] = 'DecreaseWidth',
        [']'] = 'IncreaseWidth',
        ['{'] = 'PrevTask',
        ['}'] = 'NextTask',
        ['<D-l>'] = 'IncreaseDetail',
        ['<D-h>'] = 'DecreaseDetail',
        ['<D-k>'] = 'ScrollOutputUp',
        ['<D-j>'] = 'ScrollOutputDown',
        ['q'] = 'Close',
      },
    },
  },
  keys = {
    {
      '<leader>ot',
      function()
        require('overseer').toggle()
      end,
      desc = '[O]verseer: [T]oggle',
    },
    {
      '<leader>oa',
      '<cmd>OverseerTaskAction<cr>',
      desc = '[O]verseer: Task [A]ction',
    },
    {
      '<leader>or',
      '<cmd>OverseerRun<cr>',
      desc = '[O]verseer: [R]un Quick Action',
    },
    {

      '<leader>ol',
      function()
        local overseer = require("overseer")
        local task_list = require("overseer.task_list")
        local tasks = overseer.list_tasks({
          status = {
            overseer.STATUS.SUCCESS,
            overseer.STATUS.FAILURE,
            overseer.STATUS.CANCELED,
          },
          sort = task_list.sort_finished_recently
        })
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          local most_recent = tasks[1]
          overseer.run_action(most_recent, "restart")
        end
      end,
      desc = '[O]verseer: Run [Last] Task',
    },
    {
      '<leader>ob',
      '<cmd>OverseerBuild<cr>',
      desc = '[O]verseer: [B]uild',
    },
  },
}
