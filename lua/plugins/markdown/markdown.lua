return {
  'MeanderingProgrammer/markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  opts = {
    latex = {
      -- Whether LaTeX should be rendered, mainly used for health check enabled = true,
      -- Executable used to convert latex formula to rendered unicode
      converter = 'latex2text',
      -- Highlight for LaTeX blocks
      highlight = 'RenderMarkdownMath',
    },
  },
}