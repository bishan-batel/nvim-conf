-- function()
-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
--
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`

-- Make line numbers default
vim.opt.number = true

vim.opt.relativenumber = true

vim.o.exrc = true

vim.cmd 'set rnu'

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.opt.conceallevel = 2

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  tab = '  ',
  trail = '·',
  nbsp = '␣',
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Terminal

-- if vim.fn.executable 'nu' == 1 then
--   vim.opt.shell = 'nu'
-- else
--   vim.opt.shell = 'fish'
-- end

vim.opt.shell = 'nu'

vim.opt.termguicolors = true

-- vim.keymap.set('n', '<leader>t', '<cmd>split<cr><cmd>term<cr>', { desc = 'Open a [T]erminal in vsplit' })

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Neovide
if vim.g.neovide then
  vim.opt.guifont = 'JetBrainsMono Nerd Font:20'
  vim.g.neovide_cursor_vfx_mode = 'sonicboom'

  local alpha = function()
    return string.format('%x', math.floor(255 * (vim.g.transparency or 0.8)))
  end

  vim.g.neovide_transparency = 0.85
  vim.g.neovide_background_color = '#0f1117' .. alpha()

  vim.keymap.set('n', '<C-=>', function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end)

  vim.keymap.set('n', '<C-->', function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end)

  vim.keymap.set('n', '<C-0>', function()
    vim.g.neovide_scale_factor = 1
  end)
end

vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy from system clipboard' })
vim.keymap.set('i', '<C-v>', '"+p', { desc = 'Paste from system clipboard' })

-- Exit Terminal Mode
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('t', '<C-h>', [[<cmd>wincmd h<cr>]], { buffer = 0, desc = 'Move focus to the left widnow' })
vim.keymap.set('t', '<C-j>', [[<cmd>wincmd j<cr>]], { buffer = 0, desc = 'Move focus to the lower widnow' })
vim.keymap.set('t', '<C-k>', [[<cmd>wincmd k<cr>]], { buffer = 0, desc = 'Move focus to the upper widnow' })
vim.keymap.set('t', '<C-l>', [[<cmd>wincmd l<cr>]], { buffer = 0, desc = 'Move focus to the right widnow' })
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { buffer = 0, desc = 'Window Prefix' })

--  `:help wincmd`
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require 'minecraft'

-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]] (Lazy)
require('lazy').setup({
  require 'plugins.telescope',
  require 'plugins.fs.oil',
  require 'plugins.fs.neo-tree',

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require 'plugins.git',
  require 'plugins.whichkey',
  {
    'j-hui/fidget.nvim',
    opts = {

      notification = {
        override_vim_notify = true,
      },
    },
  },
  require 'plugins.lsp.lspconfig',
  require 'plugins.lazy_dev',

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },

  require 'plugins.cmp',
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
      vim.cmd.hi 'Comment gui=none'

      vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#585b70', italic = true })
    end,
    opts = {
      flavour = 'mocha',
      transparent_background = not vim.g.neovide,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        barbecue = {
          dim_dirname = true, -- directory name is dimmed by default
          bold_basename = true,
          dim_context = false,
          alt_background = false,
        },
        dap = true,
        dap_ui = true,
        neotree = true,
        overseer = true,
        which_key = true,
        dashboard = true,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
            ok = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
            ok = { 'underline' },
          },
          inlay_hints = { background = false },
        },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true },
    keys = {
      { '<leader>st', '<cmd>TodoTelescope<cr>' },
    },
  },
  require 'plugins.mini',

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'nushell/tree-sitter-nu' },
    },
    opts = {
      ensure_installed = { 'diff', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installedinit
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby', 'cpp', 'c++' } },
      incremental_selection = {
        enable = true,
      },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = require('nvim-treesitter').foldexpr
      vim.opt.foldenable = true
    end,
  },

  require 'plugins.markdown.markdown',
  require 'plugins.markdown.obsidian',
  -- {
  --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  --   opts = {},
  -- },

  -- { 'bishan-batel/tree-sitter-gooscript', opts = {}, lazy = false },
  { dir = '~/code/gooscript/tree-sitter/' },
  -- { dir = '~/.config/nvim/gdshader/tree-sitter-gdshader/', opts = {}, lazy = false },

  { 'karb94/neoscroll.nvim', opts = { easing = 'quadratic' } },
  { 'wakatime/vim-wakatime', lazy = false },
  { 'glacambre/firenvim', build = ':call firenvim#install(0)' },
  require 'plugins.tmux',
  require 'plugins.lualine',
  require 'plugins.dashboard',
  require 'plugins.debug',
  require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.noice',
  require 'plugins.tasks.overseer',
  require 'plugins.tasks.compiler',
  require 'plugins.toggleterm',
  require 'plugins.hardtime',
  require 'plugins.sessions',
  require 'plugins.barbecue',
  require 'plugins.latex',
  require 'plugins.harpoon.harpoon',
  require 'plugins.harpoon.lualine',
  require 'plugins.lazy_dev',

  require 'plugins.docs',

  require 'plugins.lsp.trouble',
  require 'plugins.lsp.debugger',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
