---@param i integer
local function key_buf(i)
  return {
    string.format('<leader>%d', i),
    function()
      require('harpoon'):list():select(i)
    end,
    desc = string.format('Select Harpoon Buffer [%s]', i),
  }
end

return
---@type LazyPlugin
{
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  config = function()
    require('harpoon'):setup {}
  end,

  ---@type LazyKeysSpec[]
  keys = {
    key_buf(1),
    key_buf(2),
    key_buf(3),
    key_buf(4),
    key_buf(5),
    key_buf(6),
    key_buf(7),
    key_buf(8),
    key_buf(9),
    {
      '<leader>L',
      function()
        require('harpoon'):list():next()
      end,
      desc = 'Previous Buffer in Harpoon [L]ist',
    },
    {
      '<leader>H',
      function()
        require('harpoon'):list():prev()
      end,
      desc = 'Previous Buffer in [H]arpoon List',
    },
    {
      '<leader>a',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[A]dd to harpoon list',
    },
    {
      '<leader>e',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Op[e]n harpoon window',
    },
    {
      '<leader>E',
      function()
        local harpoon = require 'harpoon'
        local conf = require('telescope.config').values

        local harpoon_files = harpoon:list()
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
      end,
      desc = 'Op[e]n harpoon window',
    },
  },
}
