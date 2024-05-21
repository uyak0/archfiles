require('lazy').setup({

  require('plugins.markdown'),
  require('plugins.colorizer'),
  require('plugins.themes'),
  -- require('plugins.nvim-tree'), ditched nvim-tree for oil.nvim
  require('plugins.oil'),
  require('plugins.laravel-nvim'),
  require('plugins.lualine'),
  require('plugins.no-setup-plugins'),
  require('plugins.nvim-lspconfig'),
  require('plugins.nvim-cmp'),
  require('plugins.nvim-telescope'),
  require('plugins.indent-blankline'),
  require('plugins.gitsigns'),
  require('plugins.nvim-treesitter'),
  require('plugins.copilot'),
  require('plugins.autotag'),
  require('plugins.outline'),

}, {})
