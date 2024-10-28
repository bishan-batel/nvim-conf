return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {}

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = '[A]dd to harpoon list' })

    vim.keymap.set('n', '<leader>e', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Op[e]n Harpoon Window' })

    vim.keymap.set('n', '<leader>E', function()
      toggle_telescope(harpoon:list())
      -- require('harpoon.cmd-ui').toggle_quick_menu()
    end, { desc = 'Op[e]n Harpoon Window' })

    vim.keymap.set('n', 'H', function()
      harpoon:list():prev()
    end, { desc = 'Previous Buffer in [H]arpoon List' })

    vim.keymap.set('n', 'L', function()
      harpoon:list():next()
    end, { desc = 'Next Buffer in Harpoon [L]ist' })

    for i = 1, 6, 1 do
      vim.keymap.set('n', string.format('<leader>%d', i), function()
        harpoon:list():select(i)
      end, { desc = string.format('Select Harpoon Buffer [%s]', i) })

      vim.keymap.set('n', string.format('<leader>d%d', i), function()
        harpoon:list():remove_at(i)
      end, { desc = string.format('Remove Harpoon Buffer [%s]', i) })
    end
  end,
}
