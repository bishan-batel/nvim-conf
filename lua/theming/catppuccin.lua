return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin-mocha'
    vim.cmd.hi 'Comment gui=none'

    vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#585b70', italic = true })
  end,
  lazy = true,
  opts = {
    flavour = 'mocha',
    background = {
      dark = 'mocha',
    },
    term_colors = true,
    transparent_background = true,
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = 'dark',
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    styles = {
      comments = { 'italic' },
      conditionals = { 'italic' },
      loops = { 'italic' },
      functions = {},
      keywords = { 'italic' },
      strings = {},
      variables = {},
      numbers = {},
      booleans = { 'italic' },
      properties = {},
      types = {},
      operators = {},
    },
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
      harpoon = true,
      telescope = true,
      mason = true,
      noice = true,
      notify = true,
      fidget = true,
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
        inlay_hints = { background = true },
      },
    },
  },
}
