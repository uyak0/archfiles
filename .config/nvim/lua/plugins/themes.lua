return {
  -- Kanagawa Theme
  {
    'rebelot/kanagawa.nvim',
    config = function ()
      require('kanagawa').setup({
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
        statementStyle = { bold = false },

        colors = {
          theme = {
            dragon = {
              ui ={
                bg = '#0a0a0a',
              }
            }
          }
        }
      })
    end
  },

  -- Gruvbox Theme
  'morhetz/gruvbox',

  -- TokyoNight Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },

  {
    'dasupradyumna/midnight.nvim',
    lazy = false,
    priority = 1000
  },

  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },

  {
    "rose-pine/neovim",
    name = "rose-pine"
  }
}
